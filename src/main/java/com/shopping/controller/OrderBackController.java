package com.shopping.controller;

import com.shopping.dao.SOrderMapper;
import com.shopping.entity.SOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("backorder")
public class OrderBackController {

    @Autowired
    SOrderMapper sOrderMapper;

    @RequestMapping("search/{pageCurrent}")
    public ModelAndView search(@ModelAttribute SOrder sOrder,
            @PathVariable(value = "pageCurrent") Integer pageCurrent){

        ModelAndView mav = new ModelAndView();
        System.out.println(sOrder.toString());

        Integer pageSize = 10;//每页的记录数




        return mav;
    }


}
