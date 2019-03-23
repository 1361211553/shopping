package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shopping.dao.SCarMapper;
import com.shopping.dao.SPMapper;
import com.shopping.entity.SCar;
import com.shopping.entity.SCarExample;
import com.shopping.entity.SP;
import com.shopping.entity.SUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("car")
public class CarController {

    @Autowired
    SCarMapper scarMapper;
    @Autowired
    SPMapper spMapper;
    //购物车的查询
    @RequestMapping("carsearch")
    public ModelAndView carsearch(HttpSession session) {
        //实例化一个视图模型
        ModelAndView mav = new ModelAndView();
        //获取session中的用户
        SUser sUser = (SUser) session.getAttribute("user");
        if (sUser != null) {
            //获取购物车的查询条件类
            SCarExample sCarExample = new SCarExample();
            //获取条件查询的核心对象
            SCarExample.Criteria criteria = sCarExample.createCriteria();
            //根据用户id查询
            criteria.andUseridEqualTo(sUser.getUserid());
            //获取这个用户获得的购物车
            List<SCar> listcar = scarMapper.selectByExample(sCarExample);
            //新建一个列表
            List<SP> listsp = new ArrayList<SP>();
            //初始化购物车的价格
            Double countPrice = 0.00;
            //将数字保留两位小数
            DecimalFormat decimalFormat = new DecimalFormat(".00");
            //查询购物车的总价
            for (int i = 0; i < listcar.size(); i++) {
                //获取购物车的商品
                SP sp = spMapper.selectByPrimaryKey(listcar.get(i).getPid());
                //将商品添加到list里面
                listsp.add(sp);
                //将价格保留两位小数
                String countPricestr = decimalFormat.format((sp.getPprice()) * (listcar.get(i).getPnum()));
                //s计算购物车的价格
                String str = decimalFormat.format(countPrice += Double.valueOf(countPricestr));
                //将String类型的价格转为Double
                countPrice = Double.valueOf(str);
            }

            //将购物车商品总类加到session域里面
            session.setAttribute("carNum",listcar.size());
            //将购物车商品列表加到视图模型里面
            mav.addObject("productList", listsp);
            //将用户的购物车加到视图模型里面
            mav.addObject("listcar", listcar);
            //将购物车商品列表加到视图模型里面
            mav.addObject("countPrice",countPrice);
            //返回购物车页面
            mav.setViewName("checkout");


        } else {
            //返回登陆页面
            mav.setViewName("login");
        }
        return mav;
    }
    //购物车添加
    @RequestMapping(value = "caradd",method = RequestMethod.POST)
    @ResponseBody
        public int caradd(@RequestParam Integer pid,HttpSession session,
                          @RequestParam(required = false) Integer pnum){
        //获取用户登陆信息
        SUser sUser = (SUser) session.getAttribute("user");
        //获取购物车商品种类数
        Integer carNum =(Integer) session.getAttribute("carNum");
        //按商品id查询购物车的商品
        SCarExample sCarExample = new SCarExample();
        //获取条件查询的核心实例
        SCarExample.Criteria criteria = sCarExample.createCriteria();
        //获取购物车内的某个商品
        criteria.andPidEqualTo(pid);

        List<SCar> listCar =  scarMapper.selectByExample(sCarExample);
        //设置初始值，表示添加成功的状态
        int row = 2;
        //如果商品有存在，就直接添加商品数量
        if (listCar.size() > 0){

            SCar sCar = new SCar();
            sCar.setCid(listCar.get(0).getCid());
            //直接添加商品数量
            if (pnum != null){

                sCar.setPnum(listCar.get(0).getPnum()+pnum);
            }else {
                sCar.setPnum(listCar.get(0).getPnum()+1);
            }
            //添加商品数量
            scarMapper.updateByPrimaryKeySelective(sCar);
        //若购物车没有该商品，则直接添加新的商品
        }else {

            SCar sCar = new SCar();
            //为购物车添加属性值
            sCar.setPid(pid);
            sCar.setUserid(sUser.getUserid());
            if (pnum != null){
                sCar.setPnum(pnum);
            }else {
                sCar.setPnum(1);
            }
            // 购物车商品数量+1
            session.setAttribute("carNum",carNum+1);
            //为购物车添加新的商品
            row = scarMapper.insertSelective(sCar);

        }
        return row;
    }
    //清空购物车
    @RequestMapping("carempty")
    public ModelAndView carempty(HttpSession session){

        ModelAndView mav = new ModelAndView("redirect:/car/carsearch");
        //获取用户信息
        SUser sUser = (SUser) session.getAttribute("user");
        //删除用户信息下的所有购物车商品
        scarMapper.deleteByUserid(sUser.getUserid());
        return mav;
    }
    //删除购物车的商品
    @RequestMapping("cardel")
    @ResponseBody
    public int cardel(@RequestParam Integer pid,HttpSession session)  {
         //获取购物车数量
        Integer carNum = (Integer) session.getAttribute("carNum");
        //删除购物车的这个商品类别
        int row = scarMapper.deleteByPid(pid);
        session.setAttribute("carNum",carNum-1);
        return row;

    }
    //购物车数量的修改
    @RequestMapping("jia")
    @ResponseBody
    public int jia(@RequestParam Integer pid,@RequestParam Integer pnum){
        //新建新的购物车实例
        SCar sCar = new SCar();
        //新建购物车条件查询的实例
        SCarExample sCarExample = new SCarExample();
        SCarExample.Criteria criteria = sCarExample.createCriteria();
        //按商品类别查询
        criteria.andPidEqualTo(pid);
        //设置商品数量
        sCar.setPnum(pnum);
        int row =  scarMapper.updateByExampleSelective(sCar,sCarExample);
        return row;
    }

    @RequestMapping("jian")
    @ResponseBody
    public int jian(@RequestParam Integer pid,@RequestParam Integer pnum){

        SCar sCar = new SCar();
        SCarExample sCarExample = new SCarExample();
        SCarExample.Criteria criteria = sCarExample.createCriteria();
        criteria.andPidEqualTo(pid);
        sCar.setPnum(pnum);
        int row =  scarMapper.updateByExampleSelective(sCar,sCarExample);
        return row;
    }

}
