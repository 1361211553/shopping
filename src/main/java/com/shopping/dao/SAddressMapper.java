package com.shopping.dao;

import com.shopping.entity.SAddress;
import com.shopping.entity.SAddressExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SAddressMapper {
    int deleteByPrimaryKey(Integer addreessid);

    int insert(SAddress record);

    int insertSelective(SAddress record);

    List<SAddress> selectByExample(SAddressExample example);

    SAddress selectByPrimaryKey(Integer addreessid);

    int updateByExampleSelective(@Param("record") SAddress record, @Param("example") SAddressExample example);

    int updateByExample(@Param("record") SAddress record, @Param("example") SAddressExample example);

    int updateByPrimaryKeySelective(SAddress record);

    int updateByPrimaryKey(SAddress record);
}