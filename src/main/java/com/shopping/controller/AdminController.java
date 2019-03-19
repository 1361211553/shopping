package com.shopping.controller;


import com.shopping.dao.SAdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    SAdminMapper sAdminMapper;

    @RequestMapping("login")
    public ModelAndView login(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("WEB-INF/jsp/productlist");


        return mav;
    }


}
