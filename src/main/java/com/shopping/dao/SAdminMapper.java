package com.shopping.dao;

import com.shopping.entity.SAdmin;
import com.shopping.entity.SAdminExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SAdminMapper {
    int deleteByPrimaryKey(Integer adminid);

    int insert(SAdmin record);

    int insertSelective(SAdmin record);

    List<SAdmin> selectByExample(SAdminExample example);

    SAdmin selectByPrimaryKey(Integer adminid);

    int updateByExampleSelective(@Param("record") SAdmin record, @Param("example") SAdminExample example);

    int updateByExample(@Param("record") SAdmin record, @Param("example") SAdminExample example);

    int updateByPrimaryKeySelective(SAdmin record);

    int updateByPrimaryKey(SAdmin record);
}