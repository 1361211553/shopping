package com.shopping.dao;

import com.shopping.entity.SPtype;
import com.shopping.entity.SPtypeExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SPtypeMapper {
    int deleteByPrimaryKey(Integer ptypeid);

    int insert(SPtype record);

    int insertSelective(SPtype record);

    List<SPtype> selectByExample(SPtypeExample example);

    SPtype selectByPrimaryKey(Integer ptypeid);

    int updateByExampleSelective(@Param("record") SPtype record, @Param("example") SPtypeExample example);

    int updateByExample(@Param("record") SPtype record, @Param("example") SPtypeExample example);

    int updateByPrimaryKeySelective(SPtype record);

    int updateByPrimaryKey(SPtype record);
}