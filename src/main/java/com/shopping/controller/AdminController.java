package com.shopping.controller;


import com.shopping.dao.SAdminMapper;
import com.shopping.entity.SAdmin;
import com.shopping.entity.SAdminExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("admin")
@SessionAttributes({"error","sAdmin"})
public class AdminController {

    @Autowired
    SAdminMapper sAdminMapper;
    //管理员登陆验证
    @RequestMapping("login")
    public ModelAndView login(@RequestParam String adminname,@RequestParam String adminpass){
        ModelAndView mav = new ModelAndView();

        SAdminExample example = new SAdminExample();

        SAdminExample.Criteria criteria = example.createCriteria();

        if(adminname!=null && !"".equals(adminname) &&
                adminpass!=null && !"".equals(adminpass)){
            criteria.andAdminnameEqualTo(adminname);
            criteria.andAdminpassEqualTo(adminpass);
        }

        List<SAdmin> sAdmins = sAdminMapper.selectByExample(example);

        if(sAdmins.size()>0){
            mav.addObject("sAdmin",sAdmins.get(0));
            mav.addObject("error","");
            mav.setViewName("WEB-INF/jsp/frame");
        }else{
            mav.addObject("error","账号或者密码输入错误！");
            mav.setViewName("loginback");
        }

        return mav;
    }

    //退出后台系统
    @RequestMapping("loginOut")
    public ModelAndView loginOut(){
        ModelAndView mav = new ModelAndView();
        mav.addObject("sAdmin",null);
        mav.setViewName("loginback");
        return mav;
    }


    @RequestMapping("toPass")
    public String toModifyPass(){
        return "WEB-INF/jsp/pwdmodify";
    }

    @RequestMapping("pwdmodify")
    public ModelAndView pwdmodify(@RequestParam Integer adminid,String newpassword){

        ModelAndView mav = new ModelAndView();
        SAdmin admin = sAdminMapper.selectByPrimaryKey(adminid);
        admin.setAdminpass(newpassword);
        sAdminMapper.updateByPrimaryKey(admin);
        mav.addObject("sAdmin",null);
        mav.setViewName("loginback");
        return mav;
    }






}
