package com.shopping.controller;

import com.shopping.dao.SPtypeMapper;
import com.shopping.entity.SPtype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;


import javax.servlet.http.HttpServletRequest;

import java.util.List;

@Controller
@RequestMapping("sptype")
@SessionAttributes("listSPtype")
public class SPTypeController {

    @Autowired
    SPtypeMapper sPtypeMappper;

    @RequestMapping("search")
    @ResponseBody
    public void search(Model m){

        List<SPtype> listSPtype = sPtypeMappper.selectByExample(null);
        m.addAttribute("listSPtype",listSPtype);
    }



}
