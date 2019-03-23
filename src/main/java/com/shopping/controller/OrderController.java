package com.shopping.controller;

import com.shopping.dao.*;
import com.shopping.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("order")
@SessionAttributes({"order"})
public class OrderController {

    @Autowired
    SOrderMapper sOrderMapper;
    @Autowired
    SAddressMapper sAddressMapper;
    @Autowired
    SCarMapper sCarMapper;
    @Autowired
    SPMapper spMapper;
    @Autowired
    SOrderdetailMapper sOrderdetailMapper;

    @RequestMapping("search")
    public ModelAndView search(HttpSession session){

        ModelAndView mav = new ModelAndView("orders");
        SUser sUser = (SUser) session.getAttribute("user");
        SOrderExample sOrderExample = new SOrderExample();
        SOrderExample.Criteria criteria = sOrderExample.createCriteria();
        criteria.andUseridEqualTo(sUser.getUserid());
        List<SOrder> orderlist = sOrderMapper.selectByExample(sOrderExample);
        mav.addObject("orderlist",orderlist);
        return  mav;

    }
    //生成中间页面
    @RequestMapping("temp")
    public ModelAndView searcha(HttpSession session){
        //实例化新的模型视图
        ModelAndView mav = new ModelAndView("ordertemp");
        //获取登陆用户信息
        SUser sUser = (SUser) session.getAttribute("user");
        //获取用户下的所有地址信息
        SAddressExample example = new SAddressExample();
        SAddressExample.Criteria criteria = example.createCriteria();
        criteria.andUseridEqualTo(sUser.getUserid());
        //将地址按是否为默认地址排列
        example.setOrderByClause(" status desc ");
        //得到地址列表
        List<SAddress> listAddress = sAddressMapper.selectByExample(example);
        //获取用户购物车的信息
        SCarExample sCarExample = new SCarExample();
        SCarExample.Criteria criterias = sCarExample.createCriteria();
        criterias.andUseridEqualTo(sUser.getUserid());
        List<SCar> sCarlist = sCarMapper.selectByExample(sCarExample);
        //这一段是用来验证输出的
        for (SCar s: sCarlist) {
            System.out.println("order  "+s);
        }
        //获将购物车的商品放到linkmap里面
        Map<Double,SP> map = new LinkedHashMap<>();
        //初始化订单价格为0
        Double countPrice = 0.00;
        //将订单价格保留两位小数
        DecimalFormat decimalFormat = new DecimalFormat(".00");
        //计算购物车的总金额
        for (int i = 0; i < sCarlist.size(); i++){
            //获取商品信息
            SP sp = spMapper.selectByPrimaryKey(sCarlist.get(i).getPid());
            //获取商品数量
            String countPPricestr =  decimalFormat.format(sp.getPprice()*sCarlist.get(i).getPnum());
            //金额累加
            countPrice += Double.valueOf(countPPricestr);
            //放回map里面
            map.put(Double.valueOf(countPPricestr),sp);

        }
        //地址信息放到视图模型里面
        mav.addObject("addresslist",listAddress);
        //将购物车商品放到session里面
        session.setAttribute("listcar",sCarlist);
        session.setAttribute("pmap", map);
        //将总价放到session里面
        session.setAttribute("countPrice",countPrice);
        return  mav;

    }
    //订单生成
    @RequestMapping("add")
    public ModelAndView add(HttpSession session,@ModelAttribute SAddress sAddress,@RequestParam(required = false) Integer id){
        //实例化新的视图模型
        ModelAndView mav = new ModelAndView("redirect:/order/search");
        //得到放有商品信息的map
        Map<Double,SP> map = (Map<Double, SP>) session.getAttribute("pmap");
        //得到购物车的信息
        List<SCar> carlist = (List<SCar>) session.getAttribute("listcar");
        //将购物车的session清空
        session.removeAttribute("pmap");
        //得到订单总价格
        Double countPrice = (Double) session.getAttribute("countPrice");
        //将session中的总价格清空
        session.removeAttribute("countPrice");
        //获取用户信息
        SUser sUser = (SUser) session.getAttribute("user");
        //新建一空个订单
        SOrder sOrder = new SOrder();
        //为订单添加用户id
        sOrder.setUserid(sUser.getUserid());
        //设置订单状态为未付款
        sOrder.setPstatus(1);
        //设置下单时间
        sOrder.setOrderdate(new Date());
        //设置订单商品总数
        sOrder.setPcount(map.size());
        //判断用户是否已经选择地址，若有地址直接用，若没有直接让用户添加地址
        if (id != null){
            //获取收件人地址
            SAddress sAddresss = sAddressMapper.selectByPrimaryKey(id);
            //设置收件人联系电话
            sOrder.setReciphone(sAddresss.getAddressphone());
            //设置收件人姓名
            sOrder.setRecipients(sAddresss.getConsignee());
            //设置收件人祥址
            sOrder.setAddress(sAddresss.getProvince()+sAddresss.getCity()+sAddresss.getDist()+sAddress.getDetailed());
        }else {
            //设置收件人联系电话
            sOrder.setReciphone(sAddress.getAddressphone());
            //设置收件人姓名
            sOrder.setRecipients(sAddress.getConsignee());
            //设置收件人祥址
            sOrder.setAddress(sAddress.getProvince()+sAddress.getCity()+sAddress.getDist()+sAddress.getDetailed());
        }
        //设置总价
        sOrder.setPtotalprice(countPrice);
        //为订单生成id
        Random random = new Random();
        //获取当前时间的字符串格式
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        //将时间设置为订单的号码的前部分，后半部分为一串随机数
        String oid = String.valueOf(simpleDateFormat.format(new Date())+random.nextInt(999));
        sOrder.setOid(oid);
        //插入订单
        sOrderMapper.insertSelective(sOrder);

        //往订单详情表插入信息
        SOrderdetail sOrderdetail = new SOrderdetail();
        //获取订单详情表对应的订单表
        sOrderdetail.setOid(sOrder.getOid());

        int i = 0;
        //插入详情信息
        for (Double key: map.keySet()) {
            //获取价格
            sOrderdetail.setPtotalprice(key);
            //获取商品
            sOrderdetail.setPid(map.get(key).getPid());
            //获取商品数量
            sOrderdetail.setPpurchasenum(carlist.get(i).getPnum());
            System.out.println(sOrderdetail);
            //插入
            sOrderdetailMapper.insert(sOrderdetail);
            i++;
        }
        //清空购物车信息
        sCarMapper.deleteByUserid(sUser.getUserid());
        session.setAttribute("carNum",0);
        return mav;
    }

    @RequestMapping("affirm")
    @ResponseBody
    public int affirm(@RequestParam String oid){

        SOrder sOrder = new SOrder();
        sOrder.setOid(oid);
        sOrder.setPstatus(4);
        int row = sOrderMapper.updateByPrimaryKeySelective(sOrder);

        return row;
    }

    @RequestMapping("showdetail/{oid}")
    public  ModelAndView showdetail(@PathVariable(value = "oid") String oid){
        ModelAndView mav = new ModelAndView();
        Integer sum = 0;
        //获取订单信息
        SOrder sOrder =sOrderMapper.selectByPrimaryKey(oid);
        mav.addObject("order",sOrder);
        //获取订单详情表
        SOrderdetailExample example = new SOrderdetailExample();
        example.createCriteria().andOidEqualTo(oid);
        List<SOrderdetail> sOrderdetails = sOrderdetailMapper.selectByExample(example);
        //获取商品总件数
        for(int i=0;i<sOrderdetails.size();i++){
            sum+=sOrderdetails.get(i).getPpurchasenum();
        }

        //获取商品信息列表
        List<SP> listsp = spMapper.selectByExample(null);
        mav.addObject("sum",sum);
        mav.addObject("num",sOrderdetails.size());//获取购买产品总数
        mav.addObject("listsp",listsp);
        mav.addObject("sOrderdetails",sOrderdetails);
        mav.setViewName("orderdetail");
        return mav;
    }
    //付款
    @RequestMapping("pay/{oid}")
    public ModelAndView paymoney(@PathVariable(value = "oid") String oid){

        ModelAndView mav = new ModelAndView();
        //获取选中订单
        SOrder sOrder = sOrderMapper.selectByPrimaryKey(oid);
        //将订单状态改为已付款待收货
        sOrder.setPstatus(2);
        //修改订单状态
        sOrderMapper.updateByPrimaryKey(sOrder);
        //返回订单查询页面
        mav.setViewName("redirect:/order/search");
        return mav;
    }

}
