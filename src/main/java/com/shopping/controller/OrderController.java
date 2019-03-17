package com.shopping.controller;

import com.shopping.dao.SOrderMapper;
import com.shopping.entity.SOrder;
import com.shopping.entity.SOrderExample;
import com.shopping.entity.SUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    SOrderMapper sOrderMapper;

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

    @RequestMapping("a")
    public ModelAndView searcha(HttpSession session){

        ModelAndView mav = new ModelAndView("WEB-INF/a");

        return  mav;

    }
}
