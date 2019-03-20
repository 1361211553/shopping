package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shopping.dao.SCarMapper;
import com.shopping.dao.SPMapper;
import com.shopping.entity.SCar;
import com.shopping.entity.SCarExample;
import com.shopping.entity.SP;
import com.shopping.entity.SUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("car")
public class CarController {

    @Autowired
    SCarMapper scarMapper;
    @Autowired
    SPMapper spMapper;

    @RequestMapping("carsearch")
    public ModelAndView carsearch(HttpSession session) {

        ModelAndView mav = new ModelAndView();
        SUser sUser = (SUser) session.getAttribute("user");
        if (sUser != null) {

            SCarExample sCarExample = new SCarExample();
            SCarExample.Criteria criteria = sCarExample.createCriteria();
            criteria.andUseridEqualTo(sUser.getUserid());
            List<SCar> listcar = scarMapper.selectByExample(sCarExample);
            List<SP> listsp = new ArrayList<SP>();
            Double countPrice = 0.00;
            DecimalFormat decimalFormat = new DecimalFormat(".00");
            for (int i = 0; i < listcar.size(); i++) {

                SP sp = spMapper.selectByPrimaryKey(listcar.get(i).getPid());
                listsp.add(sp);
                String countPricestr = decimalFormat.format((sp.getPprice()) * (listcar.get(i).getPnum()));
                String str = decimalFormat.format(countPrice += Double.valueOf(countPricestr));
                countPrice = Double.valueOf(str);
            }


             session.setAttribute("carNum",listcar.size());
            mav.addObject("productList", listsp);
            mav.addObject("listcar", listcar);
            mav.addObject("countPrice",countPrice);
            mav.setViewName("checkout");


        } else {

            mav.setViewName("login");
        }
        return mav;
    }
    @RequestMapping(value = "caradd",method = RequestMethod.POST)
    @ResponseBody
        public int caradd(@RequestParam Integer pid,HttpSession session,
                          @RequestParam(required = false) Integer pnum){

        SUser sUser = (SUser) session.getAttribute("user");
        Integer carNum =(Integer) session.getAttribute("carNum");

        SCarExample sCarExample = new SCarExample();
        SCarExample.Criteria criteria = sCarExample.createCriteria();
        criteria.andPidEqualTo(pid);
        List<SCar> listCar =  scarMapper.selectByExample(sCarExample);
        int row = 2;
        if (listCar.size() > 0){

            SCar sCar = new SCar();
            sCar.setCid(listCar.get(0).getCid());
            if (pnum != null){

                sCar.setPnum(listCar.get(0).getPnum()+pnum);
            }else {
                sCar.setPnum(listCar.get(0).getPnum()+1);
            }
            scarMapper.updateByPrimaryKeySelective(sCar);
        }else {

            SCar sCar = new SCar();
            sCar.setPid(pid);
            sCar.setUserid(sUser.getUserid());
            if (pnum != null){
                sCar.setPnum(pnum);
            }else {
                sCar.setPnum(1);
            }
            session.setAttribute("carNum",carNum+1);
            row = scarMapper.insertSelective(sCar);

        }
        return row;
    }

    @RequestMapping("carempty")
    public ModelAndView carempty(HttpSession session){

        ModelAndView mav = new ModelAndView("redirect:/car/carsearch");
        SUser sUser = (SUser) session.getAttribute("user");
        scarMapper.deleteByUserid(sUser.getUserid());
        return mav;
    }

    @RequestMapping("cardel")
    @ResponseBody
    public int cardel(@RequestParam Integer pid,HttpSession session)  {

        Integer carNum = (Integer) session.getAttribute("carNum");
       int row = scarMapper.deleteByPid(pid);
       session.setAttribute("carNum",carNum-1);
        return row;

    }

}
