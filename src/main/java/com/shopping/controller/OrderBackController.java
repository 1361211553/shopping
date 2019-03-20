package com.shopping.controller;

import com.shopping.dao.SOrderMapper;
import com.shopping.dao.SUserMapper;
import com.shopping.entity.SOrder;
import com.shopping.service.SOrderServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("backorder")
public class OrderBackController {

    @Autowired
    SOrderMapper sOrderMapper;

    @Autowired
    SOrderServiceI sOrderServiceI;

    @Autowired
    SUserMapper sUserMapper;

    @RequestMapping("search/{pageCurrent}")
    public ModelAndView search(@ModelAttribute SOrder sOrder,
            @PathVariable(value = "pageCurrent") Integer pageCurrent){

        ModelAndView mav = new ModelAndView();
        System.out.println(sOrder.toString());

        Integer pageSize = 10;//每页的记录数
        //获取总页数
        int size = sOrderServiceI.searchByExample(sOrder).size();
        Integer pageAll = size%pageSize==0? size/pageSize:size/pageSize+1;

        if(pageCurrent > pageAll){
            pageCurrent = pageAll;
        }
        //获取当前页面的数据
        List<SOrder> sOrders = sOrderServiceI.searchByExampleWithPage(sOrder, pageCurrent, pageSize);

        mav.addObject("sOrders",sOrders);
        mav.addObject("pageAll",pageAll);
        mav.addObject("pageCurrent",pageCurrent);
        mav.addObject("sOrder",sOrder);

        mav.setViewName("WEB-INF/jsp/billlist");
        return mav;
    }

    @RequestMapping("toView/{oid}")
    public ModelAndView toView(@PathVariable(value="oid") String oid){
        //获取当前订单的详细信息
        ModelAndView mav = new ModelAndView();
        SOrder sOrder = sOrderMapper.selectByPrimaryKey(oid);
        //获取当前订单的买家昵称
        String username = sUserMapper.selectByPrimaryKey(sOrder.getUserid()).getUsername();

        mav.addObject("sOrderView",sOrder);
        mav.addObject("username",username);

        mav.setViewName("WEB-INF/jsp/billview");
        return mav;
    }

    //模拟订单发货
    @RequestMapping("changestate/{state}/{oid}")
    public ModelAndView changestate(@PathVariable(value="state") Integer state,
            @PathVariable(value="oid") String oid  ){
        ModelAndView mav = new ModelAndView();

        SOrder sOrder = sOrderMapper.selectByPrimaryKey(oid);
        sOrder.setPstatus(3);
        sOrderMapper.updateByPrimaryKey(sOrder);
        mav.setViewName("redirect:/backorder/search/1");
        return mav;
    }
}
