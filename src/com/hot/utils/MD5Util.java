package com.hot.utils;

import java.security.MessageDigest;
public class MD5Util {
    public final static String MD5(String s) {
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void main(String[] args) {
        //System.out.println(MD5Util.MD5("111111111111111111111111111"));
    	/* List<String> adminlist = new ArrayList();
        adminlist.add("33333");
        adminlist.add("111111");
        adminlist.add("yanggao");
        adminlist.add("admin1");
        adminlist.add("123456");
        adminlist.add("88888888");
        adminlist.add("lipin88dayu");
        adminlist.add("ooss123456");
        for(int i=0;i<adminlist.size();i++){
        	String sql = "update admin set `password` ='"+MD5(adminlist.get(i))+"' where `password` = '"+adminlist.get(i)+"'";
        	System.out.println(sql+";");
        }
        ////////////////////////////////////
        List<String> userlist = new ArrayList();
        userlist.add("121212");
        userlist.add("12345678");
        userlist.add("123456789");
        userlist.add("12345678qq");
        userlist.add("12345Qwert");
        userlist.add("123679");
        userlist.add("130370");
        userlist.add("18807266352");
        userlist.add("2324982");
        userlist.add("3663855");
        userlist.add("453621414");
        userlist.add("456852");
        userlist.add("515330");
        userlist.add("617125");
        userlist.add("654123");
        userlist.add("654321");
        userlist.add("666999");
        userlist.add("770016");
        userlist.add("a123456");
        userlist.add("ad8888");
        userlist.add("b123456");
        userlist.add("bluekk19930808");
        userlist.add("gaomi369");
        userlist.add("gcggyd4839663");
        userlist.add("hulian12345");
        userlist.add("J4eR6D");
        userlist.add("madison");
        userlist.add("niko1986");
        userlist.add("wed0202");
        userlist.add("zhaolu");
        for(int i=0;i<userlist.size();i++){
        	String sql = "update `user` set `password` ='"+MD5(userlist.get(i))+"' where `password` = '"+userlist.get(i)+"'";
        	System.out.println(sql+";");
        }
        */
        String sss[] =   {"131419","13253186341","hao123","huliantongcheng","song0316","xueyunteng"};
        for(int i=0;i<sss.length;i++){
        	String sql = "update `user` set `password` ='"+MD5(sss[i])+"' where `password` = '"+sss[i]+"'";
        	System.out.println(sql+";");
        }
    }
}
