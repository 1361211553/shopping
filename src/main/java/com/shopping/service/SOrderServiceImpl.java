package com.shopping.service;

import com.github.pagehelper.PageHelper;
import com.shopping.dao.SOrderMapper;
import com.shopping.entity.SOrder;
import com.shopping.entity.SOrderExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SOrderServiceImpl implements SOrderServiceI {
    @Autowired
    SOrderMapper sOrderMapper;

    @Override
    public List<SOrder> searchByExample(SOrder sOrder) {

        SOrderExample example = new SOrderExample();
        if(sOrder!=null){
            SOrderExample.Criteria criteria = example.createCriteria();

            if(sOrder.getOid()!=null && !"".equals(sOrder.getOid())){
                criteria.andOidEqualTo(sOrder.getOid());
            }
            if(sOrder.getPstatus()!=null && !"".equals(sOrder.getPstatus())){
                criteria.andPstatusEqualTo(sOrder.getPstatus());
            }
            if(sOrder.getUserid()!=null && !"".equals(sOrder.getUserid())){
                criteria.andPstatusEqualTo(sOrder.getUserid());
            }
            if(sOrder.getReciphone()!=null && !"".equals(sOrder.getReciphone())){
                criteria.andReciphoneEqualTo(sOrder.getReciphone());
            }
            if (sOrder.getRecipients()!=null && !"".equals(sOrder.getRecipients())){
                criteria.andRecipientsEqualTo(sOrder.getRecipients());
            }
            if (sOrder.getAddress()!=null && !"".equals(sOrder.getAddress())){
                criteria.andAddressLike("%"+sOrder.getAddress()+"%");
            }
        }
        return sOrderMapper.selectByExample(example);
    }

    @Override
    public List<SOrder> searchByExampleWithPage(SOrder sOrder, Integer pageNo, Integer pageSize) {

        PageHelper.startPage(pageNo,pageSize);
        SOrderExample example = new SOrderExample();
        if(sOrder!=null){
            SOrderExample.Criteria criteria = example.createCriteria();

            if(sOrder.getOid()!=null && !"".equals(sOrder.getOid())){
                criteria.andOidEqualTo(sOrder.getOid());
            }
            if(sOrder.getPstatus()!=null && !"".equals(sOrder.getPstatus())){
                criteria.andPstatusEqualTo(sOrder.getPstatus());
            }
            if(sOrder.getUserid()!=null && !"".equals(sOrder.getUserid())){
                criteria.andPstatusEqualTo(sOrder.getUserid());
            }
            if(sOrder.getReciphone()!=null && !"".equals(sOrder.getReciphone())){
                criteria.andReciphoneEqualTo(sOrder.getReciphone());
            }
            if (sOrder.getRecipients()!=null && !"".equals(sOrder.getRecipients())){
                criteria.andRecipientsEqualTo(sOrder.getRecipients());
            }
            if (sOrder.getAddress()!=null && !"".equals(sOrder.getAddress())){
                criteria.andAddressLike("%"+sOrder.getAddress()+"%");
            }

        }


        return sOrderMapper.selectByExample(example);
    }
}
