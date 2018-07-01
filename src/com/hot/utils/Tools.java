package com.hot.utils;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;

import org.apache.commons.beanutils.PropertyUtils;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Tools {
	
	/**
	 * 从数据库中获取数据集ResultSet，放入对应的bean对象中
	 * @param t  被赋值的bean对象
	 * @param rs 数据集
	 * @return  返回赋值后的bean对象
	 * @throws Exception
	 */
	private final static int HMAC_BLKL = 64;
	private final static int HMAC_MD5L = 16;
	private final static byte IPAD = 0x36;
	private final static byte OPAD = 0x5C;

	public static String timeTypeInttoStr(int timeType){
		if(timeType==0){
			return "created";
		}else if(timeType==1){
			return "pay_time";
		}else if(timeType==2){
			return "consign_time";
		}else if(timeType==3){
			return "end_time";
		}else{
			return "created";
		}
		
	}
	

	  public static String getNumr(int length)     
	  {     
	      String val = "";     
	               
	      Random random = new Random();     
	      for(int i = 0; i < length; i++)     
	      {     
	        
	              val += String.valueOf(random.nextInt(10));     
	           
	      }     
	               
	      return val;     
	  } 
	  public static String getCharAndNumr(int length)     
	  {     
	      String val = "";     
	               
	      Random random = new Random();     
	      for(int i = 0; i < length; i++)     
	      {     
	          String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num"; // 输出字母还是数字     
	                   
	          if("char".equalsIgnoreCase(charOrNum)) // 字符串     
	          {     
	              int choice = random.nextInt(2) % 2 == 0 ? 65 : 97; //取得大写字母还是小写字母     
	              val += (char) (choice + random.nextInt(26));     
	          }     
	          else if("num".equalsIgnoreCase(charOrNum)) // 数字     
	          {     
	              val += String.valueOf(random.nextInt(10));     
	          }     
	      }     
	               
	      return val;     
	  }  
	  public static long gettodaylong(){//今天0点的时间戳
		  Calendar cal = Calendar.getInstance();
	        cal.set(Calendar.HOUR, 0);
	        cal.set(Calendar.SECOND, 0);
	        cal.set(Calendar.MINUTE, 0);
	        cal.set(Calendar.MILLISECOND, 0);

			
	return cal.getTimeInMillis();
		  
	  }
	  public static long getshijiancnow(){//当前时间的时间戳
		  Calendar calendar = Calendar.getInstance();
	  	  calendar.setTime(new Date());
	  	    long milliseconds = calendar.getTimeInMillis();
	  	    return milliseconds;
	  }
	  public static String suijitid(){//随机tid
		  
		  int rint1 = (int)(Math.random()*9);
  		int rint2 = (int)(Math.random()*99);
  		int rint3 = (int)(Math.random()*999);
			return String.valueOf(Tools.getshijiancnow()/1000)+rint1+rint2+rint3;
	  }
	  public static int nowyear(){//当前年份
		  Calendar c = Calendar.getInstance();
		  int year = c.get(Calendar.YEAR);
		return year; 
	  }
	  public static int nowmonth(){//当前月份
		  Calendar c = Calendar.getInstance();
		  int month = c.get(Calendar.MONTH);
		return month+1; 
	  }
	  public static int nowdate(){//当前几号
		  Calendar c = Calendar.getInstance();
		  int date = c.get(Calendar.DATE);
		return date; 
	  }
	  public static List<String[]> getcharttime(String date1,String date2){
		  List<String[]> objs = new ArrayList<String[]>();
		  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		  try
		  {
		  Date d1 = df.parse(date1);
		  Date d2 = df.parse(date2);
		  long diff = d2.getTime() - d1.getTime();
		  long days = diff / (1000 * 60 * 60 * 24);
			  if(days>1){
				  long startlong = d1.getTime();
				  for(int i=0;i<days;i++){
					  long endlong = startlong+ (1000 * 60 * 60 * 24);
					  String[] strs = new String[] {getdate_long(startlong), getdate_long(endlong)};
					  objs.add(strs);
					  startlong = endlong;
				  }
			  }else{
				  long startlong = d1.getTime();
				  for(int i=0;i<=24;i++){
					  long endlong = startlong+ (1000 * 60 * 60);
					  String[] strs = new String[] {gettime_long(startlong), gettime_long(endlong)};
					  objs.add(strs);
					  startlong = endlong;
				  }
			  }
		  }
		  catch (Exception e)
		  {
		  }
		  return objs;
	  }
	  public static String getday_long(long l){//时间戳转string 当天的日期
		  Date now=new Date(l);
			String mat="yyyy-MM-dd";
			SimpleDateFormat format=new SimpleDateFormat(mat);
			return format.format(now);
	  }  
	  public static String gettime_long(long l){//时间戳转string
		  Date now=new Date(l);
			String mat="yyyy-MM-dd HH:mm:ss";
			SimpleDateFormat format=new SimpleDateFormat(mat);
			return format.format(now);
	  }
	  public static String getdate_long(long l){
		  Date now=new Date(l);
			String mat="yyyy-MM-dd";
			SimpleDateFormat format=new SimpleDateFormat(mat);
			return format.format(now);
	  }
	 public static int getdays_jiaojidate(String date1_s,String date1_e,String date2_s,String date2_e){
		 int day=0;
		 Date d1_s = stringtoDate(date1_s,"yyyy-MM-dd");
		 Date d1_e = stringtoDate(date1_e,"yyyy-MM-dd");
		 Date d2_s = stringtoDate(date2_s,"yyyy-MM-dd");
		 Date d2_e = stringtoDate(date2_e,"yyyy-MM-dd");
		 
		 if(d1_s.getTime()>d2_e.getTime()){
			 return 0;
		 }
		 if(d1_e.getTime()<d2_s.getTime()){
			 return 0;
		 }
		
		 Date d_s = null;
		 Date d_e = null;
		 if(d1_s.getTime()>=d2_s.getTime()){
			 d_s=d1_s;
		 }else{
			 if(d1_s.getTime()<=d2_s.getTime()){
				 d_s=d2_s;
			 }
		 }
		 if(d1_e.getTime()>=d2_e.getTime()){
			 d_e=d2_e;
		 }else{
			 if(d1_e.getTime()<=d2_e.getTime()){
				 d_e=d1_e;
			 }
		 }
		  Calendar cal = null;
		     while(d_s.before(d_e)|| d_s.equals(d_e)){
		         cal = Calendar.getInstance();
		         //设置日期
		        cal.setTime(d_s);
		       
		        day++;
		        //日期加1
		        cal.add(Calendar.DAY_OF_MONTH,1);
		        d_s = cal.getTime();
		    }
		 return day;
	 }
	 public static int getdays_date(String starttime, String endtime){//间隔多少天
		  //设置时间格式
		     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		     //开始日期
		     Date dateFrom=null;
		     Date dateTo=null;
		  try {
		   dateFrom = dateFormat.parse(starttime);
		   dateTo = dateFormat.parse(endtime);
		  } catch (ParseException e) {
		   e.printStackTrace();
		  }
		  int workdays = 0;
		  Calendar cal = null;
		     while(dateFrom.before(dateTo)|| dateFrom.equals(dateTo)){
		         cal = Calendar.getInstance();
		         //设置日期
		        cal.setTime(dateFrom);
		       
		        workdays++;
		        //日期加1
		        cal.add(Calendar.DAY_OF_MONTH,1);
		        dateFrom = cal.getTime();
		    }
		     return workdays;
		 }
	 
	 public static int compare_date(String DATE1, String DATE2) {//时间比较
	       
	       
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        try {
	            Date dt1 = df.parse(DATE1);
	            Date dt2 = df.parse(DATE2);
	            if (dt1.getTime() > dt2.getTime()) {
	                return 1;
	            } else if (dt1.getTime() < dt2.getTime()) {
	                return -1;
	            } else {
	                return 0;
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return 0;
	    }
	public static long datetonowdays(Date date){//时间（Date）转时间戳
		Calendar calendar1 = Calendar.getInstance();
  	    Calendar calendar2 = Calendar.getInstance();
  	    calendar1.setTime(date);
  	    calendar2.setTime(new Date());
  	    long milliseconds1 = calendar1.getTimeInMillis();
  	    long milliseconds2 = calendar2.getTimeInMillis();
  	    long diff = milliseconds2 - milliseconds1;
  	  
  	    long diffDays = diff / (24 * 60 * 60 * 1000);
  	    return diffDays;
	} 
	public static long datehours(Date start,Date end){//时间（Date）相差的毫秒数
		Calendar calendar1 = Calendar.getInstance();
  	    Calendar calendar2 = Calendar.getInstance();
  	    calendar1.setTime(start);
  	    calendar2.setTime(end);
  	    long milliseconds1 = calendar1.getTimeInMillis();
  	    long milliseconds2 = calendar2.getTimeInMillis();
  	    long diff = milliseconds2 - milliseconds1;
  	    long diffHours = diff / (60 * 60 * 1000);
  	    return diffHours;
	} 
	public static String HMAC(String origin, String key) throws Exception {
		System.out.println("====="+origin);
		byte[] keyBytes = key.getBytes();
		byte[] orgBytes = origin.getBytes();
		byte[] iBytes = new byte[HMAC_BLKL];
		int conLength2 = HMAC_BLKL + HMAC_MD5L;
		byte[] oBytes = new byte[conLength2];
		int keyLength = keyBytes.length;
		int orgLength = orgBytes.length;
		int conLength = HMAC_BLKL + orgLength;
		byte[] conBytes = new byte[conLength];
		for (int i = 0; i < HMAC_BLKL; i++) {
		if (i < keyLength) {
		iBytes[i] = (byte) (keyBytes[i] ^ IPAD);
		oBytes[i] = (byte) (keyBytes[i] ^ OPAD);
		} else {
		iBytes[i] = IPAD;
		oBytes[i] = OPAD;
		}
		conBytes[i] = iBytes[i];
		}
		for (int i = HMAC_BLKL; i < conLength; i++) {
		conBytes[i] = orgBytes[i - HMAC_BLKL];
		}
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] res1 = md.digest(conBytes);
		for (int i = HMAC_BLKL; i < conLength2; i++) {
		oBytes[i] = res1[i - HMAC_BLKL];
		}
		byte[] res = md.digest(oBytes);
		String result = byteArrayToHexString(res);
		return result;
	}
	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
		"6", "7", "8", "9", "A", "B", "C", "D", "E", "F" };
		public static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
		resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
		}
		private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0) {
		n = 256 + n;
		}
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
		} 
	public static String getNowTime(){//当前时间的字符串形式
		Date now=new Date();
		String mat="yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat format=new SimpleDateFormat(mat);
		return format.format(now);
	}
	public static String timetodate(Date date){//时间（Date）转string 按日期
		String mat="yyyy-MM-dd";
		SimpleDateFormat format=new SimpleDateFormat(mat);
		return format.format(date);
	}
	public static String getNowdate(){//当前日期
		Date now=new Date();
		String mat="yyyy-MM-dd";
		SimpleDateFormat format=new SimpleDateFormat(mat);
		return format.format(now);
	}
	public static String getyesterday(){//昨天日期
		Calendar cal=Calendar.getInstance();
        cal.add(Calendar.DATE,-1);
        Date d=cal.getTime();
		 SimpleDateFormat sp=new SimpleDateFormat("yyyy-MM-dd");
		return sp.format(d);
		
	}
	  public static void main(String[] args) throws Exception {  
		  Map m = new HashMap();
		  m.put("ddd", "ddaa");
		  m.remove("dddaa");
		  System.out.println(m.get("ddd"));
		  System.out.println(m.get(null));

		  m.put("ddd", "ffffff");
		  System.out.println(m.get("ddd"));
		  System.out.println(m.get(null));
		  System.out.println(m.remove("ddd"));
		  System.out.println(m.remove(null));
		  System.out.println(m.remove("ddsaa"));
		  /*
		  System.out.println(360/30+1);
		  System.out.println(gettime_long(gettodaylong()));
		  
		  System.out.println(getshijiancnow());

		  System.out.println(gettime_long(getshijiancnow()));
		  
		  
		  String str = "<img fdsaf style='width:2131px;';fsadf;style='width:32px;'";
	      Pattern p = Pattern.compile("width:(.*?)px");  
		  Matcher m = p.matcher(str);  
		  int width=400;
			while (m.find()) {  
				if(Integer.valueOf(m.group(1))>width){
					str = str.replaceAll("width:"+m.group(1)+"px", "width:"+width+"px");
				}
			}  
	        System.out.println(str);     
	        */   
		
		  /*
		  System.out.println(getshijiancnow());
		 
		  String destr = URLDecoder.decode("%20and%20t.created%20%3E=%20'2013-12-04%2000:00:00'%20%20and%20t.buyer_nick%20like%20'%25dd%25'%20", "utf8"); 
		  System.out.println(destr);
		 
		  int ddd = getdays_jiaojidate("2012-07-01","2013-10-09","2012-09-01","2013-07-05");
		  double d1 = 5.999;
		  long l1=6;
		  String s1="2013-11-11";
		  String s2="2013-11-15";
		  List<String[]>  dd= getcharttime(s1,s2);
		  for(int i=0;i<dd.size();i++){
			  System.out.println(dd.get(i)[0]);
			  System.out.println(dd.get(i)[1]);
		  }
		 
		  */
		  //System.out.println(getCharAndNumr(6));
		System.out.println(monthand1("2014-06-07"));

		System.out.println(yearand1("2014-06-01"));

		System.out.println(monthand1("2014-12-17"));

		System.out.println(yearand1("2014-12-21"));
	    } 
	public static String monthand1(String date1){//下个月
        
        DateFormat df = new SimpleDateFormat("yyyy-MM");  
        DateFormat mf = new SimpleDateFormat("yyyy-MM-dd");  
        try {  
            Date d1 = df.parse(date1);  
            Calendar  g = Calendar.getInstance();  
            g.setTime(d1);  
            g.add(Calendar.MONTH,+1);             
            Date d2 = g.getTime();  
            date1=mf.format(d2);  
        } catch (ParseException e) {              
            e.printStackTrace();  
        }  
        return date1;
	}
	public static String yearand1(String date1){//下一年
        
        DateFormat df = new SimpleDateFormat("yyyy");  

        DateFormat yf = new SimpleDateFormat("yyyy-MM-dd");  
        try {  
            Date d1 = df.parse(date1);  
            Calendar  g = Calendar.getInstance();  
            g.setTime(d1);  
            g.add(Calendar.YEAR,+1);             
            Date d2 = g.getTime();  
            date1=yf.format(d2);  
        } catch (ParseException e) {              
            e.printStackTrace();  
        }  
        return date1;
	}
	public static String gettoday(){//获取今天日期 0点0分0秒
		Date now=new Date();
		String mat="yyyy-MM-dd 00:00:00";
		SimpleDateFormat format=new SimpleDateFormat(mat);
		return format.format(now);
	}
	public static String getmonth(){//获取这个月初 0点0分0秒
		Date now=new Date();
		String mat="yyyy-MM-01 00:00:00";
		SimpleDateFormat format=new SimpleDateFormat(mat);
		return format.format(now);
	}
	public static Object fatherFormSon(Object obj1,Object obj2) throws Exception{
		Class<? extends Object> classType1=obj1.getClass();
		Class<? extends Object> classType2=obj2.getClass();
		Object object=classType2.getConstructor(new Class[]{}).newInstance(new Object[]{});
		String fieldName=null;
		Method[] fs = classType1.getDeclaredMethods();
		for(int i=0;i<fs.length;i++){
			fieldName=fs[i].getName();
			String setName=null;
			String getName = null;
			if(fieldName.startsWith("get")){
				getName= fieldName;
				setName="set"+fieldName.substring(3);
				Method getMethod=classType1.getDeclaredMethod(getName, new Class[]{});
				Object o = getMethod.invoke(obj1);
				Method setMethod=classType2.getMethod(setName, new Class[]{fs[i].getReturnType()});
				setMethod.invoke(object, o);
			}
		}
		return object;
	}
	public static Field[] getMergeArray(Field[] al,Field[] bl) {
		Field[] a = al;
		Field[] b = bl;
		  Field[] c = new Field[a.length + b.length];
		  System.arraycopy(a, 0, c, 0, a.length);
		  System.arraycopy(b, 0, c, a.length, b.length);
		  return c;
		 }
	
		/**
		 * 从对象中取得指定对象的值
		 * @param obj  对象
		 * @param name 字段名称
		 * @return
		 */
	  public static Object getProperty(Object obj, String name) {
			//字段值
			Object result = null;
			//如果是Map
			if (obj instanceof Map) {
				result = (Object) ((Map) obj).get(name);
				if(result == null) {
					result = (Object) ((Map) obj).get(name.toLowerCase());
				}
				if(result == null) {
					result = (Object) ((Map) obj).get(name.toUpperCase());
				}
			} else {
				try{
					if(PropertyUtils.isReadable(obj, name)){
						result =  PropertyUtils.getProperty( obj, name );
					}else if(PropertyUtils.isReadable(obj, name.toLowerCase())){
						result =  PropertyUtils.getProperty( obj, name.toLowerCase() );
					}else if(PropertyUtils.isReadable(obj, name.toUpperCase())){
						result =  PropertyUtils.getProperty( obj, name.toUpperCase() );
					}
				}catch(Exception ex){
					System.out.println("错误："+obj.getClass().getName()+"取不到"+name+"#");
				}
			}
			return result;
		}

	public static String gettablename(Object o){
		String tablename=o.getClass().getSimpleName();
		tablename=tablename.substring(0, 1).toLowerCase()+tablename.substring(1);
		return tablename;
	}
	public static Object assignObjValue_wwc(Object t,Map map) {
		//获取对象的Class
		Class<? extends Object> classType=t.getClass();
		//通过默认构造方法去创建一个新的对象，getConstructor的视其参数决定调用哪个构造方法
		Object object;
		try {
			
			object = classType.getConstructor(new Class[]{}).newInstance(new Object[]{});
			 Field[] f1 = classType.getDeclaredFields();
			 if (classType.getGenericSuperclass() != null) {
				 Class superClass = classType.getSuperclass();// 父类
				 Field[] f2 = superClass.getDeclaredFields();

				 f1=getMergeArray(f1,f2);

			 }
			
			 for(int i=0;i<f1.length;i++){
				 System.out.println(i+"==="+f1[i].getName());
			 }
		//获取数据集的字段集
		Field field;
		String fieldName=null;
		String setName=null;
		//循环字段集
	       Iterator it=map.entrySet().iterator();
	       while(it.hasNext()){
	    	   field = null;
	           Map.Entry<String, Object>  entry=(Entry<String, Object>) it.next();
	          
	           for(int i=0;i<f1.length;i++){
	        	   if(f1[i].getName().equals(entry.getKey())){
	        		   field=f1[i];
	        		   break;
	        	   }
				 }
	          // field =classType.getDeclaredField(entry.getKey());
	         
				//获取属性名称
				fieldName=entry.getKey();
				//获取属性对应set方法名称
				setName="set"+fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
				//通过set方法名称获取set方法
				 Method setMethod =null;
				 if(field!=null){

					 setMethod =field.getDeclaringClass().getDeclaredMethod(setName, new Class[]{field.getType()});
				 }else{
					 setMethod=field.getDeclaringClass().getMethod(setName, new Class[]{entry.getValue().getClass()});
				 }
				// System.out.println("setName="+setName);
				setMethod.invoke(object, entry.getValue());
		
	       }
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return null;
		} 
		
		return object;
	}
	public static Object assignObjValue(Object t,Map obj) {
		//获取对象的Class
		Class<? extends Object> classType=t.getClass();
		//通过默认构造方法去创建一个新的对象，getConstructor的视其参数决定调用哪个构造方法
		Object object;
		try {
			object = classType.getConstructor(new Class[]{}).newInstance(new Object[]{});
		
		//获取数据集的字段集
		Field field;
		String fieldName=null;
		String setName=null;
		//循环字段集
	       Iterator it=obj.entrySet().iterator();
	       while(it.hasNext()){
	    	   field = null;
	           Map.Entry<String, Object>  entry=(Entry<String, Object>) it.next();
	          
	           
	        	   field=classType.getDeclaredField(entry.getKey());
	         
				//获取属性名称
				fieldName=entry.getKey();
				//获取属性对应set方法名称
				setName="set"+fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
				//通过set方法名称获取set方法
				 Method setMethod =null;
				 if(field!=null){

					// System.out.println("!null="+setName);
					 setMethod =classType.getDeclaredMethod(setName, new Class[]{field.getType()});
				 }else{

					 //System.out.println("null="+setName);
					 setMethod=classType.getMethod(setName, new Class[]{entry.getValue().getClass()});
				 }
				if(entry.getValue()!=null){

					setMethod.invoke(object, entry.getValue());
					
				}
		
	       }
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return null;
		} 
		
		return object;
	}
	public static String GetNowDate(String sd){  //格式化当前时间
	    String temp_str="";  
	    Date dt = new Date();  
	    //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换"yyyy-MM-dd HH:mm:ss aa"成hh表示12小时制  
	    SimpleDateFormat sdf = new SimpleDateFormat(sd);  
	    temp_str=sdf.format(dt);  
	    return temp_str;  
	}  



	public static String datetoString(Date date){//时间（Date）转string
		String mat="yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat format=new SimpleDateFormat(mat);
		return format.format(date);
	}
	public static String datetoString_d(Date date){//时间（Date）转string
		String mat="yyyy-MM-dd";
		SimpleDateFormat format=new SimpleDateFormat(mat);
		return format.format(date);
	}
	public static String datetoString(Date date,String mat){//时间（Date）根据格式化 成string
		SimpleDateFormat format=new SimpleDateFormat(mat);
		return format.format(date);
	}
	public static Date stringtoDate(String str,String mat){//string根据格式化转Date
		DateFormat format = new SimpleDateFormat(mat);        
		Date date = null;     
		try {   
		    date = format.parse(str);  // Thu Jan 18 00:00:00 CST 2007   
		} catch (ParseException e) {   
		    e.printStackTrace();   
		}  
		return date;
	}
	public static long stringtolong(String str){//string转long
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        
		long milliseconds=0;
		try {   
			Date date = null;     
		    date = format.parse(str);  // Thu Jan 18 00:00:00 CST 2007  
		    Calendar calendar1 = Calendar.getInstance();
	  	    calendar1.setTime(date);
	  	    milliseconds = calendar1.getTimeInMillis();
	  	    
		} catch (ParseException e) {   
		    e.printStackTrace();   
		}  
		return milliseconds;
	}
	public static long stringtolong_d(String str){//string转long
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");        
		long milliseconds=0;
		try {   
			Date date = null;     
		    date = format.parse(str);  // Thu Jan 18 00:00:00 CST 2007  
		    Calendar calendar1 = Calendar.getInstance();
	  	    calendar1.setTime(date);
	  	    milliseconds = calendar1.getTimeInMillis();
	  	    
		} catch (ParseException e) {   
		    e.printStackTrace();   
		}  
		return milliseconds;
	}
	public static Date stringtoDate(String str){//string转Date
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        
		Date date = null;     
		try {   
		    date = format.parse(str);  // Thu Jan 18 00:00:00 CST 2007   
		} catch (ParseException e) {   
		    e.printStackTrace();   
		}  
		return date;
	}
	public static Date stringtoDate_d(String str){//string转Date
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");        
		Date date = null;     
		try {   
		    date = format.parse(str);  // Thu Jan 18 00:00:00 CST 2007   
		} catch (ParseException e) {   
		    e.printStackTrace();   
		}  
		return date;
	}
	public static Double doubleFormat(Double d){//double格式化小数点后两位
		DecimalFormat df=new DecimalFormat(".##");
		
		String st=df.format(d);
		return Double.valueOf(st);
	}
	public static Date todaytime(int hours){//根据小时 获取今天的该小时的Date
		Calendar calendar = Calendar.getInstance();  
        
		  /*** 定制每日15:00执行方法 ***/ 


		  calendar.set(Calendar.HOUR_OF_DAY,hours);
		  calendar.set(Calendar.MINUTE, 0);
		  calendar.set(Calendar.SECOND, 0);
		  
		  Date date=calendar.getTime(); //第一次执行定时任务的时间
		  return date;
	}

	public static Date addMonths(Date date, int amount) {//在Date基础上加amount个月
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, amount);
		return c.getTime();
	}
	public static Date addDays(Date date, int amount) {//在Date基础上加amount天
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, amount);
		return c.getTime();
	}
	public static Map getmap_str(String data){
		String datas[] = data.split("&");
		Map m = new HashMap();
		  for (int i = 0; i < datas.length; i++) {
			  String str[] = datas[i].split("=");
			  m.put(str[0], str[1]);
		  }
		  return m;
	}

 // 加密  
    public static String getBase64(String str) {  
        byte[] b = null;  
        String s = null;  
        try {  
            b = str.getBytes("utf-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        if (b != null) {  
            s = new BASE64Encoder().encode(b);  
        }  
        return s;  
    }  
  
    // 解密  
    public static String getFromBase64(String s) {  
        byte[] b = null;  
        String result = null;  
        if (s != null) {  
            BASE64Decoder decoder = new BASE64Decoder();  
            try {  
                b = decoder.decodeBuffer(s);  
                result = new String(b, "utf-8");  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        return result;  
    }  
}
