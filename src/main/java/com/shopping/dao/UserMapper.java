package com.shopping.dao;

import com.shopping.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

   UserInfo find(Integer userid);

}
