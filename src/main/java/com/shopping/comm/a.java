package com.shopping.comm;

public class a {

    public static void main(String[] args) {

      StringBuffer a = new StringBuffer("a");
      StringBuffer b = new StringBuffer("b");

      o(a,b);
        System.out.println(a+","+b);
    }
    public static void o(StringBuffer x,StringBuffer y){

x.append(y);
y=x;


    }
}
