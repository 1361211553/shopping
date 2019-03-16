package com.shopping.dao;

import com.shopping.entity.SCar;
import com.shopping.entity.SCarExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SCarMapper {
    int deleteByPrimaryKey(Integer cid);

    int deleteByPid(Integer pid);
    int deleteByUserid(Integer userid);
    int insert(SCar record);

    int insertSelective(SCar record);

    List<SCar> selectByExample(SCarExample example);

    SCar selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") SCar record, @Param("example") SCarExample example);

    int updateByExample(@Param("record") SCar record, @Param("example") SCarExample example);

    int updateByPrimaryKeySelective(SCar record);

    int updateByPrimaryKey(SCar record);
}