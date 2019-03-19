package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.shopping.dao.SCarMapper;
import com.shopping.dao.SUserMapper;
import com.shopping.entity.SCar;
import com.shopping.entity.SCarExample;
import com.shopping.entity.SUser;
import com.shopping.entity.SUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("user")
@SessionAttributes({"errorCode"})
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
        session.setAttribute("errMs","");
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

            List<SUser> listsUser = sUserMapper.selectByExample(sUserExample);
            if (listsUser.size() == 0) {
                Random random = new Random(64 + 1);
                sUser.setSlock(0);
                sUser.setUserface("images/face (" + new Random().nextInt(64 - 1) + ").jpg");

                sUser.setUserregdate(new Date());

                sUserMapper.insertSelective(sUser);
                mav.addObject("errMs", "注册成功");
                mav.setViewName("login");

            } else {

                mav.addObject("errMs", "此账号已存在");
                mav.setViewName("registered");
            }

        }
        return mav;
    }
    @RequestMapping("update")
    public ModelAndView updateUser(@ModelAttribute SUser sUser,
            HttpSession session){
        ModelAndView mav = new ModelAndView();
        //查询这个用户的所有信息
        SUser user = sUserMapper.selectByPrimaryKey(sUser.getUserid());

        SUserExample example = new SUserExample();
        
        if (sUser!=null){
            SUserExample.Criteria criteria = example.createCriteria();
            if (sUser.getUsername()!=null && !"".equals(sUser.getUsername())){

                user.setUsername(sUser.getUsername());
                mav.addObject("error","");
            }
            if (sUser.getUsersex()!=null && !"".equals(sUser.getUsersex())){
                user.setUsersex(sUser.getUsersex());
            }
            if (sUser.getUserphone()!=null && !"".equals(sUser.getUserphone())){
                user.setUserphone(sUser.getUserphone());
            }

            if (sUser.getUseremail()!=null && !"".equals(sUser.getUseremail())){
                user.setUseremail(sUser.getUseremail());
            }
            if(sUser.getUserbirthday()!=null && !"".equals(sUser.getUserbirthday())){
                user.setUserbirthday(sUser.getUserbirthday());
            }
            
            if (sUser.getUseraddressid()!=null && sUser.getUseraddressid()>0){
                user.setUseraddressid(sUser.getUseraddressid());
            }

            if (sUser.getUserrealname()!=null && !"".equals(sUser.getUserrealname())){
                user.setUserrealname(sUser.getUserrealname());
            }
        }
        System.out.println(user.getUserid());
        int i = sUserMapper.updateByPrimaryKey(user);
        session.setAttribute("user",user);
        System.out.println("成功修改"+i+"次");
        mav.setViewName("person");
        return mav;
    }

    @RequestMapping(value = "updatePass",method = RequestMethod.POST)
    public ModelAndView updatePass(@ModelAttribute SUser sUser,
            @RequestParam(value = "newuserpass") String newuserpass,
            HttpSession session){
        ModelAndView mav = new ModelAndView();

        SUser user = sUserMapper.selectByPrimaryKey(sUser.getUserid());

        user.setUserpass(newuserpass);

        int i = sUserMapper.updateByPrimaryKeySelective(user);
        System.out.println("成功修改"+i+"次");
        session.setAttribute("user",user);
        mav.setViewName("person");

        return mav;
    }
    @RequestMapping("validate")
    @ResponseBody
    public void validate(String username, HttpServletResponse response) throws IOException {

        SUserExample sUserExample = new SUserExample();
        SUserExample.Criteria criteria = sUserExample.createCriteria();
        criteria.andUsernameEqualTo(username);

        List<SUser> listsUser = sUserMapper.selectByExample(sUserExample);

        String s = JSON.toJSONString(listsUser.size());

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.print(s);

        pw.flush();
        pw.close();
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }

}
