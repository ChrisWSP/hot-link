package com.hot.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hot.service.UtilService;
@Component("testAspect")
@Aspect  
public class TestAspect {

	@Autowired
	private UtilService utilService;
	
	@Pointcut("execution(* com.hot.service.UtilService.*(..))")
    private void insert(){};  
    
    @Before("insert()")  
    public void doAccessCheck(JoinPoint jp){  
    	Object[] args = jp.getArgs();
        System.out.println(args[0]);  
        System.out.println("前置通知");  
    }  

    @AfterReturning(pointcut = "insert() && args(obj)", returning = "result") //obj参数，result返回值
    public void doAfter(Object obj, Object result) throws Exception{  
    	
        System.out.println("后置通知");  
    }  
      
}
