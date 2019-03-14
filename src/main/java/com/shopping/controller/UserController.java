package com.shopping.controller;

import com.shopping.dao.SUserMapper;
import com.shopping.entity.SUser;
import com.shopping.entity.SUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")

public class UserController {

    @Autowired
    SUserMapper sUserMapper;

    @RequestMapping(value = "login",method = RequestMethod.POST)
    public ModelAndView login(@RequestParam(value = "username") String username,
                              @RequestParam(value = "userpass") String userpass,
                              HttpSession session) {


        System.out.println("666");
        ModelAndView mav = new ModelAndView();
        SUserExample sUserExample = new SUserExample();
        SUserExample.Criteria criteria =  sUserExample.createCriteria();
        if (username != null && userpass != null) {

            System.out.println("=============");
            criteria.andUsernameEqualTo(username);
            criteria.andUserpassEqualTo(userpass);
            List<SUser> listsUser = sUserMapper.selectByExample(sUserExample);
            if (listsUser.size()>0){

                session.setAttribute("user", listsUser.get(0));
                mav.setView(new RedirectView("/index.jsp"));
            }else {

                mav.addObject("errMs", "账号密码错误");
                mav.setViewName("login");
            }

        }
        return mav;
    }


    @RequestMapping("loginout")
    public String loginout(HttpSession session){

        session.removeAttribute("user");

        return "redirect:/login.jsp";

    }


}
