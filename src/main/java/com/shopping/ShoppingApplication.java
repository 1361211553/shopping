package com.shopping;

import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.HttpMessageConverter;

@SpringBootApplication
public class ShoppingApplication {

    // 使用一个@bean注解
    @Bean
    public HttpMessageConverters fastJsonHttpMessageConverters() {
        FastJsonHttpMessageConverter fastConverter = new FastJsonHttpMessageConverter();
        HttpMessageConverter converter = fastConverter;
        return new HttpMessageConverters(converter);
    }


    public static void main(String[] args) {
        SpringApplication.run(ShoppingApplication.class, args);
        System.out.println("项目启动结束");
    }

}
