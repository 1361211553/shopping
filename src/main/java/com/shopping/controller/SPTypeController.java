package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.shopping.dao.SPMapper;
import com.shopping.dao.SPtypeMapper;
import com.shopping.entity.SP;
import com.shopping.entity.SPExample;
import com.shopping.entity.SPtype;
import com.shopping.entity.SPtypeExample;
import com.shopping.service.SPServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("sptype")
@SessionAttributes({"listSPtype","listClick","listRec"})
public class SPTypeController {

    @Autowired
    SPtypeMapper sPtypeMappper;
    @Autowired
    SPMapper spMapper;

    @RequestMapping("search")
    @ResponseBody
    public void search(Model m){
        //遍历商品类别(选择启用的商品类别)
        SPtypeExample example1 = new SPtypeExample();
        example1.createCriteria().andPtypestateEqualTo(1);

        List<SPtype> listSPtype = sPtypeMappper.selectByExample(example1);

        m.addAttribute("listSPtype",listSPtype);
        //查询点击数最多的商品，并按降序排列

        SPExample example = new SPExample();
        example.setOrderByClause("pclicks DESC");
        PageHelper.startPage(1,9);
        List<SP> listClick = spMapper.selectByExample(example);

        m.addAttribute("listClick",listClick);

        //筛选品牌为美的的商品
        SPExample example2 = new SPExample();
        example2.createCriteria().andPnameLike("%美的%");
        List<SP> listRec = spMapper.selectByExample(example2);
        m.addAttribute("listRec",listRec);
    }

    @RequestMapping("toSPType")
    public ModelAndView toSPType(){
        ModelAndView mav = new ModelAndView();
        List<SPtype> listSPtype = sPtypeMappper.selectByExample(null);

        mav.addObject("listSPtype",listSPtype);
        mav.setViewName("WEB-INF/jsp/ptypelist");
        return mav;
    }
    //改变商品类别启动与禁用状态
    @RequestMapping("changestate/{state}/{ptypeid}")
    public ModelAndView changestate(@PathVariable(value="state") Integer state,
            @PathVariable(value = "ptypeid") Integer ptypeid){
        ModelAndView mav = new ModelAndView();

        SPtype sPtype = sPtypeMappper.selectByPrimaryKey(ptypeid);

        if(state == 1){
            sPtype.setPtypestate(0);
        }else{
            sPtype.setPtypestate(1);
        }
        int i = sPtypeMappper.updateByPrimaryKey(sPtype);

        mav.setViewName("redirect:/sptype/toSPType");

        return mav;
    }

    @ResponseBody
    @RequestMapping("validateSptype")
    public void validateSptype(String ptypename, HttpServletResponse response) throws IOException {

        SPtypeExample example = new SPtypeExample();
        example.createCriteria().andPtypenameEqualTo(ptypename);
        Integer i = sPtypeMappper.selectByExample(example).size();

        String s = JSON.toJSONString(i);

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.print(s);

        pw.flush();
        pw.close();

    }


    @RequestMapping("toModify/{ptypeid}")
    public ModelAndView toModify(@PathVariable(value = "ptypeid") Integer ptypeid){
        ModelAndView mav = new ModelAndView();

        SPtype sPtype = sPtypeMappper.selectByPrimaryKey(ptypeid);
        mav.addObject("sptype",sPtype);
        mav.setViewName("WEB-INF/jsp/ptypemodify");
        return mav;
    }
    //修改商品类别信息
    @RequestMapping(value="modify")
    public  ModelAndView modify(@ModelAttribute SPtype sPtype){
        //修改商品类别信息
        ModelAndView mav = new ModelAndView();
        SPtype sptype = sPtypeMappper.selectByPrimaryKey(sPtype.getPtypeid());
        sptype.setPtypename(sPtype.getPtypename());
        sPtypeMappper.updateByPrimaryKey(sptype);

        List<SPtype> listSPtype = sPtypeMappper.selectByExample(null);

        mav.addObject("listSPtype",listSPtype);
        mav.setViewName("WEB-INF/jsp/ptypelist");

        return mav;
    }
    @RequestMapping("toadd")
    public  String toAdd(){
        return "WEB-INF/jsp/ptypeadd";
    }
    //添加商品类别信息
    @RequestMapping(value="add")
    public  ModelAndView add(@ModelAttribute SPtype sPtype){
        //添加商品类别信息
        ModelAndView mav = new ModelAndView();
        sPtype.setPtypestate(0);
        //防止刷新页面误加
        SPtypeExample example = new SPtypeExample();
        example.createCriteria().andPtypenameEqualTo(sPtype.getPtypename());
        int size = sPtypeMappper.selectByExample(example).size();
        if(size==0){
            sPtypeMappper.insert(sPtype);
        }
        //遍历所有商品类别并显示
        List<SPtype> listSPtype = sPtypeMappper.selectByExample(null);
        mav.addObject("listSPtype",listSPtype);

        mav.setViewName("WEB-INF/jsp/ptypelist");

        return mav;
    }
}
