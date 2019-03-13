package com.shopping.controller;

import com.shopping.dao.UserMapper;
import com.shopping.entity.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @Autowired
    UserMapper userMapper;
    @RequestMapping("user")
    public ModelAndView find(){

        ModelAndView mav =  new ModelAndView("success");
        UserInfo userInfo = userMapper.find(1);
        mav.addObject("user",userInfo);
        return mav;
    }

}
