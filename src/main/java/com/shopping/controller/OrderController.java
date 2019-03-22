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

    @RequestMapping("temp")
    public ModelAndView searcha(HttpSession session){

        ModelAndView mav = new ModelAndView("ordertemp");
        SUser sUser = (SUser) session.getAttribute("user");

        SAddressExample example = new SAddressExample();
        SAddressExample.Criteria criteria = example.createCriteria();
        criteria.andUseridEqualTo(sUser.getUserid());
        example.setOrderByClause(" status desc ");
        List<SAddress> listAddress = sAddressMapper.selectByExample(example);

        SCarExample sCarExample = new SCarExample();
        SCarExample.Criteria criterias = sCarExample.createCriteria();
        criterias.andUseridEqualTo(sUser.getUserid());
        List<SCar> sCarlist = sCarMapper.selectByExample(sCarExample);

        Map<Double,SP> map = new HashMap<>();
        Double countPrice = 0.00;
        DecimalFormat decimalFormat = new DecimalFormat(".00");
        for (int i = 0; i < sCarlist.size(); i++){

            SP sp = spMapper.selectByPrimaryKey(sCarlist.get(i).getPid());
            String countPPricestr =  decimalFormat.format(sp.getPprice()*sCarlist.get(i).getPnum());
            countPrice += Double.valueOf(countPPricestr);
            map.put(Double.valueOf(countPPricestr),sp);

        }

        mav.addObject("addresslist",listAddress);
        session.setAttribute("listcar",sCarlist);
        session.setAttribute("pmap", map);
        session.setAttribute("countPrice",countPrice);
        return  mav;

    }

    @RequestMapping("add")
    public ModelAndView add(HttpSession session,@ModelAttribute SAddress sAddress,@RequestParam(required = false) Integer id){

        ModelAndView mav = new ModelAndView("redirect:/order/search");
        Map<Double,SP> map = (Map<Double, SP>) session.getAttribute("pmap");
        List<SCar> carlist = (List<SCar>) session.getAttribute("listcar");
        session.removeAttribute("pmap");
        Double countPrice = (Double) session.getAttribute("countPrice");
        session.removeAttribute("countPrice");
        SUser sUser = (SUser) session.getAttribute("user");

        SOrder sOrder = new SOrder();
        sOrder.setUserid(sUser.getUserid());
        sOrder.setPstatus(1);
        sOrder.setOrderdate(new Date());
        sOrder.setPcount(map.size());

        if (id != null){

            SAddress sAddresss = sAddressMapper.selectByPrimaryKey(id);
            sOrder.setReciphone(sAddresss.getAddressphone());
            sOrder.setRecipients(sAddresss.getConsignee());
            sOrder.setAddress(sAddresss.getProvince()+sAddresss.getCity()+sAddresss.getDist()+sAddress.getDetailed());
        }else {
            sOrder.setReciphone(sAddress.getAddressphone());
            sOrder.setRecipients(sAddress.getConsignee());
            sOrder.setAddress(sAddress.getProvince()+sAddress.getCity()+sAddress.getDist());
        }
        sOrder.setPtotalprice(countPrice);

        Random random = new Random();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        String oid = String.valueOf(simpleDateFormat.format(new Date())+random.nextInt(999));
        sOrder.setOid(oid);
        sOrderMapper.insertSelective(sOrder);


        SOrderdetail sOrderdetail = new SOrderdetail();
        sOrderdetail.setOid(sOrder.getOid());

        int i = 0;
        for (Double key: map.keySet()) {
            sOrderdetail.setPtotalprice(key);
            sOrderdetail.setPid(map.get(key).getPid());
            sOrderdetail.setPpurchasenum(carlist.get(i).getPnum());
            System.out.println(sOrderdetail);
            sOrderdetailMapper.insert(sOrderdetail);
            i++;
        }

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
    @RequestMapping("pay/{oid}")
    public ModelAndView paymoney(@PathVariable(value = "oid") String oid){
        ModelAndView mav = new ModelAndView();

        SOrder sOrder = sOrderMapper.selectByPrimaryKey(oid);
        sOrder.setPstatus(2);
        sOrderMapper.updateByPrimaryKey(sOrder);
        mav.setViewName("redirect:/order/search");
        return mav;
    }

}
