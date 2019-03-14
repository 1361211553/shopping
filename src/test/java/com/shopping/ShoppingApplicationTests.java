package com.shopping;

import com.shopping.dao.SUserMapper;
import com.shopping.entity.SUser;
import com.shopping.entity.SUserExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ShoppingApplicationTests {


    @Autowired
    SUserMapper sUserMapper;
    @Test
    public void contextLoads() {


//        SUser sUser = new SUser();
//        sUser.setUsername("test");
//        sUser.setUserpass("123123");
        SUserExample sUserExample = new SUserExample();
        SUserExample.Criteria criteria =  sUserExample.createCriteria();
        criteria.andUsernameEqualTo("test");
        List<SUser> sUsers = sUserMapper.selectByExample(sUserExample);
        for (SUser sUser1: sUsers) {
            System.out.println(sUser1);
        }


    }

}
