package com.shopping.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("car")
public class CarController {

    @Autowired
    SCarMapper scarMapper;
    @Autowired
    SPMapper spMapper;

    @RequestMapping("carsearch")
    public ModelAndView carsearch(HttpSession session) {

        ModelAndView mav = new ModelAndView();
        SUser sUser = (SUser) session.getAttribute("user");
        if (sUser != null) {

            SCarExample sCarExample = new SCarExample();
            SCarExample.Criteria criteria = sCarExample.createCriteria();
            criteria.andUseridEqualTo(sUser.getUserid());
            List<SCar> listcar = scarMapper.selectByExample(sCarExample);
            List<SP> listsp = new ArrayList<SP>();
            for (int i = 0; i < listcar.size(); i++) {
                SP sp = new SP();
                sp = spMapper.selectByPrimaryKey(listcar.get(i).getPid());
                listsp.add(sp);
            }

            mav.addObject("productList", listsp);
            mav.addObject("listcar", listcar);
            mav.setViewName("checkout");

        } else {

            mav.setViewName("login");
        }
        return mav;
    }

    @RequestMapping("cardel")
    @ResponseBody
    public String cardel(@RequestParam(value = "pid", required = false) Integer pid) throws JsonProcessingException {

        ObjectMapper objectMapper = new ObjectMapper();
        String s = objectMapper.writeValueAsString("");
        System.out.println("===========" + pid);
//        int row = scarMapper.deleteByPid(pid);
        String row = "0";

//        PrintWriter out =  response.getWriter();
//        if ()
//        out.write("");
        return row;

    }

}
