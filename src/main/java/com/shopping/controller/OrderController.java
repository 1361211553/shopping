package com.shopping.controller;

import com.shopping.dao.*;
import com.shopping.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("order")
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
        mav.addObject("countPrice",countPrice);
        mav.addObject("listcar",sCarlist);
        session.setAttribute("pmap", map);
        return  mav;

    }

    @RequestMapping("add")
    public ModelAndView add(HttpSession session,@ModelAttribute SAddress sAddress){

        Map<Double,SP> map = (Map<Double, SP>) session.getAttribute("pmap");
        session.removeAttribute("pmap");
        SUser sUser = (SUser) session.getAttribute("user");

        SOrder sOrder = new SOrder();
        sOrder.setUserid(sUser.getUserid());
        sOrder.setPstatus(1);
        sOrder.setOrderdate(new Date());
        sOrder.setPcount(map.size());
        sOrder.setReciphone(sAddress.getAddressphone());
        sOrder.setRecipients(sAddress.getConsignee());
        sOrder.setPtotalprice(1.22);
        Random random = new Random();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        sOrder.setOid(String.valueOf(Date.parse(simpleDateFormat.format(new Date())+random.nextInt(999))));
        sOrderMapper.insertSelective(sOrder);


        SOrderdetail sOrderdetail = new SOrderdetail();

//        sOrderdetailMapper.insertSelective();

        ModelAndView mav = new ModelAndView();


        return mav;
    }

}
