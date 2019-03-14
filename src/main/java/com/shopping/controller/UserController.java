package com.shopping.controller;

import com.shopping.dao.SUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
public class UserController {

    @Autowired
    SUserMapper ssUserMapper;

    @RequestMapping(value = "login")
    public ModelAndView login(){

        ModelAndView mav =  new ModelAndView("index");
//        UserInfo userInfo = userMapper.find(1);
//        mav.addObject("user",userInfo);
        return mav;
    }


}
