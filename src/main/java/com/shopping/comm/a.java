package com.shopping.comm;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;

public class a {

    public static void main(String[] args) {

        int arr[] = {1,3,2,4,7,6,5};

        for (int i = 0; i < arr.length -1 ;i++){

            for (int j =0; j < arr.length-1-i;j++){

                if (arr[j] > arr[j+1]){
                    int temp = 0;
                    temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }

            }


        }



       for (int i =0;i<arr.length;i++) {
           System.out.println(arr[i]);
       }
    }
}


