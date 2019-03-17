package com.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("order")
public class OrderController {

    @RequestMapping("")
    public ModelAndView order(){


        ModelAndView mav = new ModelAndView();
        return  mav;

    }
}
