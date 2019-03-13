package com.shopping.dao;

import com.shopping.entity.SCar;
import com.shopping.entity.SCarExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SCarMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(SCar record);

    int insertSelective(SCar record);

    List<SCar> selectByExample(SCarExample example);

    SCar selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") SCar record, @Param("example") SCarExample example);

    int updateByExample(@Param("record") SCar record, @Param("example") SCarExample example);

    int updateByPrimaryKeySelective(SCar record);

    int updateByPrimaryKey(SCar record);
}