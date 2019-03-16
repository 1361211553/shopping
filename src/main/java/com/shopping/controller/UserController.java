package com.shopping.controller;

import com.shopping.dao.SCarMapper;
import com.shopping.dao.SUserMapper;
import com.shopping.entity.SCar;
import com.shopping.entity.SCarExample;
import com.shopping.entity.SUser;
import com.shopping.entity.SUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("user")

public class UserController {

    @Autowired
    SUserMapper sUserMapper;
    @Autowired
    SCarMapper sCarMapper;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam(value = "username") String username,
                              @RequestParam(value = "userpass") String userpass,
                              HttpSession session) {

        ModelAndView mav = new ModelAndView();
        SUserExample sUserExample = new SUserExample();
        SUserExample.Criteria criteria = sUserExample.createCriteria();
        if (username != null && userpass != null) {

            criteria.andUsernameEqualTo(username);
            criteria.andUserpassEqualTo(userpass);
            List<SUser> listsUser = sUserMapper.selectByExample(sUserExample);
            if (listsUser.size() > 0) {

                SUser sUser = listsUser.get(0);
                if (sUser.getSlock() != 1) {

                    SCarExample sCarExample = new SCarExample();
                    SCarExample.Criteria criteria1 = sCarExample.createCriteria();
                    criteria1.andUseridEqualTo(sUser.getUserid());
                    List<SCar> listcar = sCarMapper.selectByExample(sCarExample);
                    session.setAttribute("user", sUser);
                    session.setAttribute("carNum",listcar.size());
                    mav.setView(new RedirectView("/index.jsp"));
                } else {
                    mav.addObject("errMs", "此账号已冻结");
                    mav.setViewName("login");

                }

            } else {

                mav.addObject("errMs", "账号密码错误");
                mav.setViewName("login");
            }

        }
        return mav;
    }


    @RequestMapping("loginout")
    public String loginout(HttpSession session) {

        session.removeAttribute("user");
        session.removeAttribute("carNum");

        return "redirect:/login.jsp";

    }

    @RequestMapping("regist")
    public ModelAndView regist(@ModelAttribute SUser sUser) {

        System.out.println(sUser);
        ModelAndView mav = new ModelAndView("login");
        if (sUser != null) {

            SUserExample sUserExample = new SUserExample();
            SUserExample.Criteria criteria = sUserExample.createCriteria();
            criteria.andUsernameEqualTo(sUser.getUsername());
            criteria.andUserpassEqualTo(sUser.getUserpass());
            List<SUser> listsUser = sUserMapper.selectByExample(sUserExample);
            if (listsUser.size() == 0) {
                Random random = new Random(64 + 1);
                sUser.setSlock(0);
                sUser.setUserface("images/face (" + new Random().nextInt(64 - 1) + ").jpg");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String datestr = sdf.format(new Date());
                try {
                    sUser.setUserregdate(sdf.parse(datestr));
                } catch (ParseException e) {
                    e.printStackTrace();
                    System.out.println("出错信息===========/user/regist 获取当前时间出错啦=====");
                }
                sUserMapper.insertSelective(sUser);
                mav.addObject("errMs", "此账号已存在");
                mav.setViewName("login");

            } else {

                mav.addObject("errMs", "此账号已存在");
                mav.setViewName("registered");
            }

        }
        return mav;
    }

}
