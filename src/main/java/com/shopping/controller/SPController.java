package com.shopping.controller;

import com.shopping.dao.SPMapper;
import com.shopping.entity.SP;
import com.shopping.entity.SPExample;
import com.shopping.service.SPServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("sp")
public class SPController {

    @Autowired
    SPMapper spMapper;
    @Autowired
    SPServiceI spServiceI;
    //查询单个种类商品
    @RequestMapping("search/{currentPage}/{ptypeid}")
    public ModelAndView searchPage(@PathVariable(value="currentPage") Integer currentPage,
            @ModelAttribute SP sP) {

        Integer pageSize = 9;
        ModelAndView mav = new ModelAndView();
        SPExample example = new SPExample();
        if(sP!=null){
            SPExample.Criteria criteria = example.createCriteria();
            if (sP.getPtypeid()!=null && sP.getPtypeid()>0){
                criteria.andPtypeidEqualTo(sP.getPtypeid());
            }
            if(sP.getPname()!=null && !"".equals(sP.getPname())){
                criteria.andPnameLike("%"+sP.getPname()+"%");
            }
        }

        //先查出总页数
        Integer sps = spMapper.selectByExample(example).size();//查询记录的总条数
        System.out.println(sps);
        Integer pageAll = sps%9==0? sps/9:sps/9+1;

        //查询分页所得的数据
        if(currentPage > pageAll){
            currentPage = pageAll;
        }

        List<SP> listOP =spServiceI.selectByExampleWithPage(sP,currentPage,pageSize);
        System.out.println("listOP"+listOP.size());
        mav.addObject("listOP",listOP);
        mav.addObject("pageAll",pageAll);
        mav.addObject("currentPage",currentPage);
        mav.addObject("sP",sP);
        mav.setViewName("groceries");
        return mav;
    }

    @RequestMapping("single/{pid}")
    public ModelAndView searchSingle(@PathVariable(value="pid") Integer pid){

        ModelAndView mav = new ModelAndView();
        if(pid>0){
            //查找得到的记录
            SP sp = spMapper.selectByPrimaryKey(pid);

            mav.addObject("sp",sp);
            //将浏览数+1
            sp.setPclicks(sp.getPclicks()+1);
            spMapper.updateByPrimaryKey(sp);
        }
        mav.setViewName("single");
        return mav;
    }


}