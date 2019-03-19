package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.shopping.dao.SUserMapper;
import com.shopping.entity.SUser;
import com.shopping.entity.SUserExample;
import com.shopping.service.UserServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("backuser")
public class SUserBackController {

    @Autowired
    SUserMapper sUserMapper;

    @Autowired
    UserServiceI userServiceI;

    @RequestMapping("search/{pageCurrent}")
    public ModelAndView search(@ModelAttribute SUser sUser,
            @PathVariable(value="pageCurrent") Integer pageCurrent){
        ModelAndView mav = new ModelAndView();

        Integer pageSize = 10;//每页的记录数

        //先查出总页数
        int size = userServiceI.selectByExample(sUser).size();

        Integer pageAll = size%pageSize==0? size/pageSize:size/pageSize+1;

        if(pageCurrent > pageAll){
            pageCurrent = pageAll;
        }

        List<SUser> listSUsers = userServiceI.selectByExampleWithPage(sUser, pageCurrent, pageSize);

        mav.addObject("listUsers",  listSUsers);
        mav.addObject("pageAll",pageAll);
        mav.addObject("pageCurrent",pageCurrent);
        mav.addObject("sUser",sUser);

        mav.setViewName("WEB-INF/jsp/userlist");
        return mav;
    }
    @RequestMapping("changestate/{state}/{userid}")
    public ModelAndView changestate(@PathVariable(value="state") Integer state,
             @PathVariable(value="userid") Integer userid  ) {
        ModelAndView mav = new ModelAndView();

        SUser sUser = sUserMapper.selectByPrimaryKey(userid);

        if (state == 1){
            sUser.setSlock(0);
        }else{
            sUser.setSlock(1);
        }
        mav.setViewName("redirect:backuser/search/1");

        return mav;
    }
}
