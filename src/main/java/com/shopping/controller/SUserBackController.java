package com.shopping.controller;

import com.shopping.dao.SUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("backuser")
public class SUserBackController {

    @Autowired
    SUserMapper sUserMapper;

    @RequestMapping("search")
    public ModelAndView search(){
        ModelAndView mav = new ModelAndView();




        return mav;
    }


}
