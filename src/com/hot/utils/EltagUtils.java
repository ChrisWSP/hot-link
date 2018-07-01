package com.hot.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hot.service.UtilService;

@Component
public class EltagUtils {

	@Autowired
	private UtilService utilService;
	private static EltagUtils  eltagUtils ;
	
	public void setEltagUtils(EltagUtils  eltagUtils) {  
        this.eltagUtils = eltagUtils;  
    }  
      
    @PostConstruct     //关键二   通过@PostConstruct 和 @PreDestroy 方法 实现初始化和销毁bean之前进行的操作
    public void init() {  
    	eltagUtils = this;  
    	eltagUtils.utilService = this.utilService;   // 初使化时将已静态化的testService实例化
    }  
    /**
     * 格式化时间
     * @param time
     * @return
     */
	public static String longToTime(Long time) {
		Date date = new Date(time);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	/**
     * 格式化时间
     * @param time
     * @return
     */
	public static String longToDetailTime(Long time) {
		Date date = new Date(time);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}


	public static String formarRemark(String remark) {
		if(remark.length() > 20){
			remark = "<a href='javascript:void(0);' title='" + remark + "'>" + remark.substring(0, 17) + "......" + remark.substring(remark.length() - 2) + "</a>";
		}else{
			remark = "<a href='javascript:void(0);' title='" + remark + "'>" + remark + "</a>";
		}
		return remark;
	}
	
}
