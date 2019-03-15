package com.shopping.dao;

import com.shopping.entity.SP;
import com.shopping.entity.SPExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SPMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(SP record);

    int insertSelective(SP record);

    List<SP> selectByExampleWithBLOBs(SPExample example);

    List<SP> selectByExample(SPExample example);

    SP selectByPrimaryKey(Integer pid);

    int updateByExampleSelective(@Param("record") SP record, @Param("example") SPExample example);

    int updateByExampleWithBLOBs(@Param("record") SP record, @Param("example") SPExample example);

    int updateByExample(@Param("record") SP record, @Param("example") SPExample example);

    int updateByPrimaryKeySelective(SP record);

    int updateByPrimaryKeyWithBLOBs(SP record);

    int updateByPrimaryKey(SP record);
}