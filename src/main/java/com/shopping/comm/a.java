package com.shopping.comm;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;

public class a {

    public static void main(String[] args) {

        Random random = new Random();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");

        System.out.println(""+simpleDateFormat.format(new Date())+"  "+random.nextInt(999));




    }
}


