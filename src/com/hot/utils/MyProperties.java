package com.hot.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

public class MyProperties {
	private static final String FILE="ooss.properties";
	private static String apiurl=null;
	private static String imageurl=null;
	public static String getApiurl(){
		if(apiurl==null){
			ClassLoader classLoader=Thread.currentThread().getContextClassLoader();
			URL url=classLoader.getResource(FILE);
			String path=url.getFile().replace("%20", " ");
			try {
				FileInputStream is=new FileInputStream(path);
				Properties p=new Properties();
				p.load(is);
				apiurl=p.getProperty("apiurl");
				
				is.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return apiurl;
	}
	public static String getImageurl(){
		if(imageurl==null){
			ClassLoader classLoader=Thread.currentThread().getContextClassLoader();
			URL url=classLoader.getResource(FILE);
			String path=url.getFile().replace("%20", " ");
			try {
				FileInputStream is=new FileInputStream(path);
				Properties p=new Properties();
				p.load(is);
				imageurl=p.getProperty("imageurl");
				
				is.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return imageurl;
	}
	
}
