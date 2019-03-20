package com.shopping.controller;

import com.shopping.dao.SAddressMapper;
import com.shopping.entity.SAddress;
import com.shopping.entity.SAddressExample;
import com.shopping.entity.SUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("address")
public class SAddressController {

    @Autowired
    SAddressMapper sAddressMapper;

    @RequestMapping("search")
    public ModelAndView searchByUserid(HttpSession session){

        ModelAndView mav = new ModelAndView("address");
        SUser sUser = (SUser) session.getAttribute("user");
        SAddressExample example = new SAddressExample();
        SAddressExample.Criteria criteria = example.createCriteria();
        criteria.andUseridEqualTo(sUser.getUserid());
        example.setOrderByClause(" status desc");
        List<SAddress> listAddress = sAddressMapper.selectByExample(example);
        mav.addObject("addresslist",listAddress);

        return mav;
    }

    @RequestMapping("edit/{addressid}")
    public ModelAndView edit(@PathVariable Integer addressid,HttpSession session) {

        ModelAndView mav = new ModelAndView("redirect:/address/search");
        SAddressExample sAddressExample = new SAddressExample();
        SUser sUser = (SUser) session.getAttribute("user");
        SAddressExample.Criteria criteria = sAddressExample.createCriteria();
        //查出1的
        criteria.andUseridEqualTo(sUser.getUserid());
        criteria.andStatusEqualTo(1);
        List<SAddress> addresseslist =  sAddressMapper.selectByExample(sAddressExample);
        SAddress sAddress = new SAddress();
        if (addresseslist.size()>0){
            //把1变成0

            sAddress.setAddressid(addresseslist.get(0).getAddressid());
            sAddress.setStatus(0);
            sAddressMapper.updateByPrimaryKeySelective(sAddress);
        }

        //把0变成1
        sAddress.setAddressid(addressid);
        sAddress.setStatus(1);
        sAddressMapper.updateByPrimaryKeySelective(sAddress);
        return mav;

    }

    @RequestMapping("del")
    @ResponseBody
    public int del(@RequestParam Integer addressid) {

        int row = sAddressMapper.deleteByPrimaryKey(addressid);

        return row;
    }

    @RequestMapping("insert")
    public ModelAndView update(@ModelAttribute SAddress sAddress,HttpSession session) {

        ModelAndView mav = new ModelAndView("redirect:/address/search");
        SUser sUser = (SUser) session.getAttribute("user");

        SAddressExample example = new SAddressExample();
        SAddressExample.Criteria criteria = example.createCriteria();
        criteria.andUseridEqualTo(sUser.getUserid());
        criteria.andStatusEqualTo(1);
        List<SAddress> sAddresslist = sAddressMapper.selectByExample(example);
        sAddress.setUserid(sUser.getUserid());
        if (sAddresslist.size() > 0){

            sAddress.setStatus(0);
            sAddressMapper.insertSelective(sAddress);
        }else {
            sAddress.setStatus(1);
            sAddressMapper.insertSelective(sAddress);
        }
        return mav;
    }

    @RequestMapping("update/{addressid}")
    public ModelAndView update(@PathVariable Integer addressid,HttpSession session,@ModelAttribute SAddress sAddress) {

        SUser sUser = (SUser) session.getAttribute("user");
        ModelAndView mav = new ModelAndView("redirect:/address/search");     
        sAddress.setAddressid(addressid);
        sAddress.setUserid(sUser.getUserid());
        sAddressMapper.updateByPrimaryKeySelective(sAddress);
        return mav;
    }

    @RequestMapping("updateByfind/{addressid}")
    public ModelAndView updateByfind(@PathVariable Integer addressid) {

        ModelAndView mav = new ModelAndView("addressmodify");
        SAddress sAddress = sAddressMapper.selectByPrimaryKey(addressid);
        mav.addObject("address",sAddress);
        return mav;
    }
}
