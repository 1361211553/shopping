package com.shopping.controller;

import com.github.pagehelper.PageHelper;
import com.shopping.dao.SPMapper;
import com.shopping.dao.SPtypeMapper;
import com.shopping.entity.SP;
import com.shopping.entity.SPExample;
import com.shopping.entity.SPtype;
import com.shopping.service.SPServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


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
        //遍历商品类别
        List<SPtype> listSPtype = sPtypeMappper.selectByExample(null);
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
    public String toSPType(){
        return "WEB-INF/jsp/ptypelist";
    }



}
