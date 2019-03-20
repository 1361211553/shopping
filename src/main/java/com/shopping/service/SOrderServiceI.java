package com.shopping.service;

import com.shopping.entity.SOrder;

import java.util.List;

public interface SOrderServiceI {

    List<SOrder> searchByExample(SOrder sOrder);

    List<SOrder> searchByExampleWithPage(SOrder sOrder,Integer pageNo,Integer pageSize);


}
