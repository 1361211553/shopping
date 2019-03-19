package com.shopping.service;

import com.github.pagehelper.PageHelper;
import com.shopping.dao.SUserMapper;
import com.shopping.entity.SUser;
import com.shopping.entity.SUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserServiceI{

    @Autowired
    SUserMapper sUserMapper;


    @Override
    public List<SUser> selectByExample(SUser sUser) {
        SUserExample example = new SUserExample();
        if (sUser!=null){
            SUserExample.Criteria criteria = example.createCriteria();
            if (sUser.getUsername()!=null && !"".equals(sUser.getUsername())){
                criteria.andUsernameLike("%"+sUser.getUsername()+"%");
            }
            if(sUser.getUserphone()!=null && !"".equals(sUser.getUserphone())){
                criteria.andUserphoneEqualTo(sUser.getUserphone());
            }
            if (sUser.getSlock()!=null && sUser.getSlock()>0){
                criteria.andSlockEqualTo(sUser.getSlock());
            }
            if (sUser.getUsersex()!=null && !"".equals(sUser.getUsersex())){
                criteria.andUsersexEqualTo(sUser.getUsersex());
            }
            if (sUser.getUserrealname()!=null && !"".equals(sUser.getUserrealname())){
                criteria.andUserrealnameEqualTo(sUser.getUserrealname());
            }
        }
        return sUserMapper.selectByExample(example);
    }

    @Override
    public List<SUser> selectByExampleWithPage(SUser sUser, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);

        SUserExample example = new SUserExample();
        if (sUser!=null){
            SUserExample.Criteria criteria = example.createCriteria();
            if (sUser.getUsername()!=null && !"".equals(sUser.getUsername())){
                criteria.andUsernameLike("%"+sUser.getUsername()+"%");
            }
            if(sUser.getUserphone()!=null && !"".equals(sUser.getUserphone())){
                criteria.andUserphoneEqualTo(sUser.getUserphone());
            }
            if (sUser.getSlock()!=null && sUser.getSlock()>0){
                criteria.andSlockEqualTo(sUser.getSlock());
            }
            if (sUser.getUsersex()!=null && !"".equals(sUser.getUsersex())){
                criteria.andUsersexEqualTo(sUser.getUsersex());
            }
            if (sUser.getUserrealname()!=null && !"".equals(sUser.getUserrealname())){
                criteria.andUserrealnameEqualTo(sUser.getUserrealname());
            }
        }
         return sUserMapper.selectByExample(example);
    }
}
