package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.shopping.dao.SPMapper;
import com.shopping.dao.SPtypeMapper;
import com.shopping.entity.SP;
import com.shopping.entity.SPExample;
import com.shopping.entity.SPtype;
import com.shopping.service.SPServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("sp")
@SessionAttributes({"showsp"})
public class SPController {

    @Autowired
    SPMapper spMapper;
    @Autowired
    SPServiceI spServiceI;
    @Autowired
    SPtypeMapper sPtypeMapper;
    //查询前台商品
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
        Integer pageAll = sps%pageSize==0? sps/pageSize:sps/pageSize+1;

        //查询分页所得的数据
        if(currentPage > pageAll){
            currentPage = pageAll;
        }

        List<SP> listOP =spServiceI.selectByExampleWithPage(sP,currentPage,pageSize);
        mav.addObject("listOP",listOP);
        mav.addObject("pageAll",pageAll);
        mav.addObject("currentPage",currentPage);
        mav.addObject("sP",sP);
        mav.setViewName("groceries");

        return mav;
    }

    //查询后台商品
    @RequestMapping("searchBack/{currentPage}/{ptypeid}")
    public ModelAndView searchPageBack(@PathVariable(value="currentPage") Integer currentPage,
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
        mav.addObject("pageCurrent",currentPage);
        mav.addObject("sP",sP);
        mav.setViewName("WEB-INF/jsp/productlist");
        System.out.println("======================================");
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

    @RequestMapping("toAdd")
    public String toAdd(){
        return "WEB-INF/jsp/productadd";
    }



    @RequestMapping("add")
    public ModelAndView addSP(@ModelAttribute SP sp){
        ModelAndView mav = new ModelAndView();

        sp.setPclicks(0);
        sp.setPcdate(new Date());

        spMapper.insert(sp);
        mav.setViewName("redirect:/sp/searchBack/1/0");
        return mav;
    }

    @RequestMapping("view/{pid}")
    public  ModelAndView shouview(@PathVariable(value="pid") Integer pid){
        ModelAndView mav = new ModelAndView();

        SP sp = spMapper.selectByPrimaryKey(pid);

        SPtype sPtype = sPtypeMapper.selectByPrimaryKey(sp.getPtypeid());
        mav.addObject("showsp",sp);
        mav.addObject("sptypename",sPtype.getPtypename());
        mav.setViewName("WEB-INF/jsp/productview");
        return  mav;
    }
    @RequestMapping("delete")
    @ResponseBody
    public void delete(Integer pid, HttpServletResponse response) throws IOException {

        System.out.println(pid);

        int i = spMapper.deleteByPrimaryKey(pid);

        String s =JSON.toJSONString(i);

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.print(s);

        pw.flush();
        pw.close();

    }
    @RequestMapping("toModify/{pid}")
    public ModelAndView toModify(@ModelAttribute(value="pid") Integer pid){
        ModelAndView mav = new ModelAndView();
        SP sp = spMapper.selectByPrimaryKey(pid);
        mav.addObject("showsp",sp);

        mav.setViewName("WEB-INF/jsp/productmodify");
        return mav;
    }
    @RequestMapping("modify")
    public ModelAndView modify(@ModelAttribute SP sP){
        ModelAndView mav = new ModelAndView();

        spMapper.updateByPrimaryKey(sP);

        mav.setViewName("redirect:/sp/searchBack/1/0");

        return mav;
    }

}