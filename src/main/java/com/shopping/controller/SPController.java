package com.shopping.controller;

import com.shopping.dao.SPMapper;
import com.shopping.entity.SP;
import com.shopping.entity.SPExample;
import org.apache.ibatis.session.RowBounds;
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
    //查询单个种类商品
    @RequestMapping("search/{currentPage}/{ptypeid}/{pdescription}")
    public ModelAndView searchPage(@PathVariable(value="currentPage") Integer currentPage,
            @PathVariable(value="ptypeid",required = false) Integer ptypeid,
            @PathVariable(value="pdescription",required = false) String pdescription){
        System.out.println("=============================================");
        SP sP = new SP();

        sP.setPdescription(pdescription);
        sP.setPtypeid(ptypeid);

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
        Integer pageAll = sps%9==0? sps%9:sps%9+1;
        //查询分页所得的数据
        if(currentPage > pageAll){
            currentPage = pageAll;
        }

        RowBounds rowBounds = new RowBounds((currentPage-1)*pageSize,currentPage);

        List<SP> listOP = spMapper.selectByExampleWithBLOBs(example);
        mav.addObject("listOP",listOP);
        mav.addObject("pageAll",pageAll);
        mav.addObject("currentPage",currentPage);
        mav.setViewName("groceries");
        return mav;
    }
}
