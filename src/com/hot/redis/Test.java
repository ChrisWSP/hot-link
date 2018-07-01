package com.hot.redis;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Test {

	   public static void main(String[] args) throws Exception {
	        ObjectOutputStream out=new ObjectOutputStream(new FileOutputStream("d:\\objectFile.txt"));
	         
	        String strObj="name";
	        Customer customer=new Customer("rollen");
	        //序列化,此处故意将同一对象序列化2次
	        out.writeObject(strObj);
	        out.writeObject(customer);
	        out.writeObject(customer);
	        out.close();
	        //反序列化
	        ObjectInputStream in=new ObjectInputStream(new FileInputStream("d:\\objectFile.txt"));
	        String strobj1=(String)in.readObject();
	        Customer cus1=(Customer)in.readObject();
	        Customer cus2=(Customer)in.readObject();
      in.close();
	        System.out.println(strobj1+": "+cus1);
	        System.out.println(strObj==strobj1);
	        System.out.println(cus1==customer);
	        System.out.println(cus1==cus2);
	    }
	}
	 
	class Customer implements Serializable {
	    private static final long serialVersionUID = 1L;
	    private String name;
	 
	    public Customer() {
	        System.out.println("无参构造方法");
	    }
	 
	    public Customer(String name) {
	        System.out.println("有参构造方法");
	        this.name = name;
	    }
	 
	    public String toString() {
	        return "[ "+name+" ]";
	    }
//    public static void main(String[] args) {
//        ApplicationContext ac =  new ClassPathXmlApplicationContext("classpath:/applicationContext-common.xml");
//        RedisClientTemplate redisClient = (RedisClientTemplate)ac.getBean("redisClientTemplate");
//        redisClient.set("a", "abc");
//        System.out.println(redisClient.get("a"));
//       // redisClient.get("32BAB589211701718AFDBA6E05A0D8F3")
//        HttpSession  session=(HttpSession) Tools.unserialize(redisClient.get("32BAB589211701718AFDBA6E05A0D8F3".getBytes()));
//
//        System.out.println(session);;
//
//        System.out.println(session.getAttribute("admin"));;
//
//    }


}
