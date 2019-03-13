package com.shopping.dao;

import com.shopping.entity.SOrder;
import com.shopping.entity.SOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SOrderMapper {
    int deleteByPrimaryKey(String oid);

    int insert(SOrder record);

    int insertSelective(SOrder record);

    List<SOrder> selectByExample(SOrderExample example);

    SOrder selectByPrimaryKey(String oid);

    int updateByExampleSelective(@Param("record") SOrder record, @Param("example") SOrderExample example);

    int updateByExample(@Param("record") SOrder record, @Param("example") SOrderExample example);

    int updateByPrimaryKeySelective(SOrder record);

    int updateByPrimaryKey(SOrder record);
}