package com.hot.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class EatTimerTest {
    public static void main(String[] arg){
        TimerTask task = new TimerTest();
        Calendar  calendar= Calendar.getInstance();    
        
        
        Date firstTime = calendar.getTime();
        //间隔：1小时
        long period = 1000;    
        //测试时间每分钟一次
        //period = 1000 * 60;        
        
        Timer timer = new Timer();        
        timer.schedule(task, firstTime, period);
    }
}