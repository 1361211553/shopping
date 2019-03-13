package com.shopping.dao;

import com.shopping.entity.SUser;
import com.shopping.entity.SUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SUserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(SUser record);

    int insertSelective(SUser record);

    List<SUser> selectByExample(SUserExample example);

    SUser selectByPrimaryKey(Integer userid);

    int updateByExampleSelective(@Param("record") SUser record, @Param("example") SUserExample example);

    int updateByExample(@Param("record") SUser record, @Param("example") SUserExample example);

    int updateByPrimaryKeySelective(SUser record);

    int updateByPrimaryKey(SUser record);
}