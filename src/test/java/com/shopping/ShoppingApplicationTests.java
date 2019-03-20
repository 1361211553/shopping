package com.shopping;

import com.shopping.dao.SCarMapper;
import com.shopping.dao.SPMapper;
import com.shopping.entity.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ShoppingApplicationTests {

    @Autowired
    SPMapper spMapper;
    @Autowired
    SCarMapper sCarMapper;
    @Test
    public void contextLoads() {


        SCarExample sCarExample = new SCarExample();
        SCarExample.Criteria criterias = sCarExample.createCriteria();
        criterias.andUseridEqualTo(100004);
        List<SCar> sCarlist = sCarMapper.selectByExample(sCarExample);

        Map<Double, SP> map = new HashMap<>();
        Double countPrice = 0.00;
        DecimalFormat decimalFormat = new DecimalFormat(".00");
        for (int i = 0; i < sCarlist.size(); i++){

            SP sp = spMapper.selectByPrimaryKey(sCarlist.get(i).getPid());
            String countPPricestr =  decimalFormat.format(sp.getPprice()*sCarlist.get(i).getPnum());
            countPrice += Double.valueOf(countPPricestr);
            map.put(Double.valueOf(countPPricestr),sp);

        }

        for (Double key: map.keySet()) {

            System.out.println("key:"+key+"value:"+map.get(key));

        }


    }

}
