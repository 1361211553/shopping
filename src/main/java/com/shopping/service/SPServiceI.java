package com.shopping.service;

import com.shopping.entity.SP;

import java.util.List;

public interface SPServiceI {

    List<SP> selectByExampleWithPage(SP sp, Integer pageNo, Integer pageSize);
}
