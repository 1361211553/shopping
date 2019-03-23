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
    //用户登陆
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam(value = "username") String username,
                              @RequestParam(value = "userpass") String userpass,
                              HttpSession session) {

        ModelAndView mav = new ModelAndView();
        SUserExample sUserExample = new SUserExample();
        SUserExample.Criteria criteria = sUserExample.createCriteria();
        //判断用户账号密码不为空
        if (username != null && userpass != null) {
            //按条件查询
            criteria.andUsernameEqualTo(username);
            criteria.andUserpassEqualTo(userpass);
            List<SUser> listsUser = sUserMapper.selectByExample(sUserExample);
            if (listsUser.size() > 0) {

                SUser sUser = listsUser.get(0);
                //判断用户是否被冻结，
                if (sUser.getSlock() != 1) {
                    //将用户的登录次数+1
                    sUser.setLandingtimes(sUser.getLandingtimes()+1);
                    sUserMapper.updateByPrimaryKey(sUser);
                    //购物车初始化
                    SCarExample sCarExample = new SCarExample();
                    SCarExample.Criteria criteria1 = sCarExample.createCriteria();
                    //获取用户的购物车
                    criteria1.andUseridEqualTo(sUser.getUserid());
                    List<SCar> listcar = sCarMapper.selectByExample(sCarExample);
                    //将用户放在session域里面，方便后面的查询
                    session.setAttribute("user", sUser);
                    //获取购物车商品种类数量
                    session.setAttribute("carNum",listcar.size());
                    // 跳转到主页面
                    mav.setView(new RedirectView("/index.jsp"));
                    //若账号被冻结，则无法登陆
                } else {
                    //提示账号被冻结
                    mav.addObject("errMs", "此账号已冻结");
                    //回到登陆页面
                    mav.setViewName("login");

                }

            } else {
                //提示账号密码错误
                mav.addObject("errMs", "账号密码错误");
                //返回登录界面
                mav.setViewName("login");
            }

        }
        //返回视图模型
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
                sUser.setLandingtimes(0);
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
    //用户信息修改
    @RequestMapping("update")
    public ModelAndView updateUser(@ModelAttribute SUser sUser,
            HttpSession session){

        ModelAndView mav = new ModelAndView();
        //查询这个用户的所有信息
        SUser user = sUserMapper.selectByPrimaryKey(sUser.getUserid());

        SUserExample example = new SUserExample();
        
        if (sUser!=null){
            SUserExample.Criteria criteria = example.createCriteria();
            //修改用户昵称
            if (sUser.getUsername()!=null && !"".equals(sUser.getUsername())){

                user.setUsername(sUser.getUsername());
                mav.addObject("error","");
            }
            //修改用户性别
            if (sUser.getUsersex()!=null && !"".equals(sUser.getUsersex())){
                user.setUsersex(sUser.getUsersex());
            }
            //修改用户电话
            if (sUser.getUserphone()!=null && !"".equals(sUser.getUserphone())){
                user.setUserphone(sUser.getUserphone());
            }
            //修改用户邮箱
            if (sUser.getUseremail()!=null && !"".equals(sUser.getUseremail())){
                user.setUseremail(sUser.getUseremail());
            }
            //修改用户生日
            if(sUser.getUserbirthday()!=null && !"".equals(sUser.getUserbirthday())){
                user.setUserbirthday(sUser.getUserbirthday());
            }
            //修改用户真实姓名
            if (sUser.getUserrealname()!=null && !"".equals(sUser.getUserrealname())){
                user.setUserrealname(sUser.getUserrealname());
            }
        }
        //验证是否传入了用户id
        System.out.println(user.getUserid());
        //修改用户信息
        int i = sUserMapper.updateByPrimaryKey(user);
        //将修改的用户放到session域
        session.setAttribute("user",user);
        System.out.println("成功修改"+i+"次");
        //返回个人中心页面
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
