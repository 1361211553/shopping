package com.shopping.service;

import com.shopping.entity.SUser;

import java.util.List;

public interface UserServiceI {

    List<SUser> selectByExample(SUser sUser);

    List<SUser> selectByExampleWithPage(SUser sUser,Integer pageNo,Integer pageSize);
}
