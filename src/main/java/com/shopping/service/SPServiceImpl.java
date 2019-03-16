package com.shopping.service;

import com.github.pagehelper.PageHelper;
import com.shopping.dao.SPMapper;
import com.shopping.entity.SP;
import com.shopping.entity.SPExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SPServiceImpl implements   SPServiceI{
    @Autowired
    SPMapper spMapper;
    @Override
    public List<SP> selectByExampleWithPage(SP sp, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);

        SPExample example = new SPExample();
        if(sp!=null){
            SPExample.Criteria criteria = example.createCriteria();
            if (sp.getPtypeid()!=null && sp.getPtypeid()>0){
                criteria.andPtypeidEqualTo(sp.getPtypeid());
            }
            if(sp.getPname()!=null && !"".equals(sp.getPname())){
                criteria.andPnameLike("%"+sp.getPname()+"%");
            }

        }
        List<SP> listPage = spMapper.selectByExample(example);
        return listPage;
    }
}
