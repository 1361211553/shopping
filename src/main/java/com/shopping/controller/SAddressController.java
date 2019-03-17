package com.shopping.controller;

import com.shopping.dao.SAddressMapper;
import com.shopping.entity.SAddress;
import com.shopping.entity.SAddressExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("address")
public class SAddressController {

    @Autowired
    SAddressMapper sAddressMapper;

    @RequestMapping("search/{userid}")
    public ModelAndView searchByUserid(@PathVariable(value="userid") Integer userid){
        ModelAndView mav = new ModelAndView();

        SAddressExample example = new SAddressExample();
        SAddressExample.Criteria criteria = example.createCriteria();
        if(userid>0){
            criteria.andUseridEqualTo(userid);
        }
        List<SAddress> listAddress = sAddressMapper.selectByExample(example);
        mav.addObject("listAddress",listAddress);

        return mav;
    }
}
