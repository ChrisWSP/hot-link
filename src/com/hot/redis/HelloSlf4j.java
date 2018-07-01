package com.hot.redis;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloSlf4j {
    private static final Logger logger = LoggerFactory.getLogger(HelloSlf4j.class);
    public static void main(String[] args) {

    	System.out.println("null_ge11");
        logger.debug("This is debug message");
        logger.info("This is info message");
        logger.warn("This is warn message");
        logger.error("This is error message");

    	System.out.println("null_ge11");
    }
}
