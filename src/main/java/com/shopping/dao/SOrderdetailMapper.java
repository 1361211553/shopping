package com.shopping.dao;

import com.shopping.entity.SOrderdetail;
import com.shopping.entity.SOrderdetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SOrderdetailMapper {
    int deleteByPrimaryKey(Integer odid);

    int insert(SOrderdetail record);

    int insertSelective(SOrderdetail record);

    List<SOrderdetail> selectByExample(SOrderdetailExample example);

    SOrderdetail selectByPrimaryKey(Integer odid);

    int updateByExampleSelective(@Param("record") SOrderdetail record, @Param("example") SOrderdetailExample example);

    int updateByExample(@Param("record") SOrderdetail record, @Param("example") SOrderdetailExample example);

    int updateByPrimaryKeySelective(SOrderdetail record);

    int updateByPrimaryKey(SOrderdetail record);
}