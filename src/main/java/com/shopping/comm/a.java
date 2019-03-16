package com.shopping.comm;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;

public class a {

    public static void main(String[] args) {
//        int num = 0, chartra = 0, blak = 0, other = 0;
//        Scanner s = new Scanner(System.in);
//        System.out.println("请输出字符创");
//        String result = s.nextLine();
//        char x[] = result.toCharArray();
//        for (int i = 0;
//             i < x.length;
//             i++) {
//            if (Character.isDigit(x[i])) {
//                num++;
//            } else if (Character.isLetter(x[i])) {
//                chartra++;
//            } else if (Character.isSpace(x[i])) {
//                blak++;
//            } else {
//                other++;
//            }
//            System.out.println(x.length);
//        }
//        System.out.println("数字的个数是" + num);
//        System.out.println("字符的个数是" + chartra);
//        System.out.println("空值的个数是" + blak);
//        System.out.println("其他的个数是" + other);

        Double i = 52.2;
        Double d = 12.01;
        Double s = i+d;
        DecimalFormat decimalFormat = new DecimalFormat(".00");

        System.out.println(decimalFormat.format(i*3));
        System.out.println(i*3);
    }
}


