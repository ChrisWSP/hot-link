package com.hot.dao.impl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.hot.dao.UtilDao;
import com.hot.entities.Insertrid;
import com.hot.utils.Page;
import com.hot.utils.Tools;
@Repository
@Component("utilDao")
public class UtilImplDao extends SqlSessionDaoSupport implements UtilDao{
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
         super.setSqlSessionFactory(sqlSessionFactory);
     }
	String ns = "com.hot.mapper.UtilMapper.";
	/*
	 *根据完整sql得到一个对象（obj）
	 */
	@Override
	public Object find_obj(String sql,Object obj) {
		System.out.println(sql);
		Object o = 	this.getSqlSession().selectOne(ns+"findAll", sql);
		if(o!=null){

			 Map map = (Map) o;
			 
	         obj = Tools.assignObjValue(obj,map);
		}else{
			obj=null;
		}
        return obj;
	}
	/*
	 *根据条件（tj）获取 对象（obj）的部分字段（field）
	 */
	@Override
	public Object find_obj(String field,String tj,Object obj) {
		String sql = "select "+field+" from "+Tools.gettablename(obj)+" where 1=1 "+tj;
		System.out.println(sql);
		Object o = 	this.getSqlSession().selectOne(ns+"findAll", sql);
		if(o!=null){

			 Map map = (Map) o;
			 
	         obj = Tools.assignObjValue(obj,map); 
		}else{
			obj=null; 
		}
        return obj;
	}
	/*
	 *根据sql得到一条记录map结果集成
	 */
	@Override
	public Object find_map(String sql) {
		System.out.println(sql);
		Object obj = 	this.getSqlSession().selectOne(ns+"findAll", sql);
		
        return obj;
	}
	/*
	 *根据条件（tj）查询表（table）的部分字段（field）得到一条记录map结果集
	 */
	@Override
	public Object find_map(String field,String tj,String table) {
		String sql = "select "+field+" from "+table+" where 1=1 "+tj;
		System.out.println(sql);
		Object obj = 	this.getSqlSession().selectOne(ns+"findAll", sql);
		
        return obj;
	}
	/*
	 *根据条件（tj）查询对象（obj）对应的表中的部分字段（field），得到排序（by）后的对象数组（list）
	 */
	@Override
	public List findAll(String field,String tj,String by,Object obj) {
		String sql = "select "+field+" from "+Tools.gettablename(obj)+" where 1=1 "+tj+" order by "+by;
		System.out.println(sql);
		List list = 	this.getSqlSession().selectList(ns+"findAll", sql);
		Iterator iterator = list.iterator();
        List objs = new ArrayList();
        while (iterator.hasNext()) {
            Map map = (Map) iterator.next();
            obj = Tools.assignObjValue(obj,map);
            objs.add(obj);
        	
        }
        return objs;
	}
	/*
	 *根据条件（tj）查询表（table）对应的表中的部分字段（field），得到排序（by）后的map数组（list）
	 */
	@Override
	public List findAll_map(String field,String tj,String by,String table) {
		String sql = "select "+field+" from "+table+" where 1=1 "+tj+" order by "+by;;
		System.out.println(sql);
		List list = 	this.getSqlSession().selectList(ns+"findAll", sql);
	
        return list;
	}
	/*
	 *根据sql语句查询对象（obj）得到对象数组（list）
	 */
	@Override
	public List findAll(String sql,Object obj) {
		System.out.println(sql);
		List list = 	this.getSqlSession().selectList(ns+"findAll", sql);
	
		Iterator iterator = list.iterator();
        List objs = new ArrayList();
        while (iterator.hasNext()) {
            Map map = (Map) iterator.next();
            obj = Tools.assignObjValue(obj,map);
            objs.add(obj);
        	
        }
        return objs;
	}
	/*
	 *根据sql语句查询对象（obj）得到map数组（list）
	 */
	@Override
	public List findAll_map(String sql) {
		System.out.println(sql);
		List list = 	this.getSqlSession().selectList(ns+"findAll", sql);
	
        return list;
	}

	/*
	 *根据条件（tj）查询对象（obj）对应的表中的部分字段（field），得到排序（by）后并根据page分页后的对象数组（list）
	 */
	@Override
	public List findAll(String field,String tj, String by, Page page,Object obj) {
		String sql = "select "+field+" from "+Tools.gettablename(obj)+" where 1=1 "+tj+" order by "+by+" limit "+(page.getPageNo()-1)*page.getPageSize()+","+page.getPageSize();
		System.out.println(sql);
		List list = 	this.getSqlSession().selectList(ns+"findAll", sql);
		Iterator iterator = list.iterator();
        List objs = new ArrayList();
        while (iterator.hasNext()) {
            Map map = (Map) iterator.next();
            obj = Tools.assignObjValue(obj,map);
            objs.add(obj);
        	
        }
        return objs;
	}

	/*
	 *根据条件（tj）查询表（table）对应的表中的部分字段（field），得到排序（by）后并根据page分页后的map数组（list）
	 */
	@Override
	public List findAll_map(String field,String tj, String by, Page page,String table) {
		String sql = "select "+field+" from "+table+" where 1=1 "+tj+" order by "+by+" limit "+(page.getPageNo()-1)*page.getPageSize()+","+page.getPageSize();
		System.out.println(sql);
		List list = 	this.getSqlSession().selectList(ns+"findAll", sql);
		
        return list;
	}
	/*
	 *根据sql语句查询总条数
	 */
	@Override
	public int count(String sql) {
		int isok=0;
		System.out.println(sql);
		isok = (Integer) this.getSqlSession().selectOne(ns+"count", sql);
		return isok; 
	}

	/*
	 *根据条件（tj）查询表（table）中的中条数
	 */
	@Override
	public int count(String table,String tj) {
		int isok=0;
		String sql = "select count(id) from "+table+" where 1=1 "+tj;
		System.out.println(sql);
		isok = (Integer) this.getSqlSession().selectOne(ns+"count", sql);
		return isok; 
	}
	/*
	 *根据id删除表（table）中的数据
	 */
	@Override
	public int delete(String table,int id) {
		int isok=0;
		String sql = "delete from "+table+" where id="+id;
		System.out.println(sql);
		isok = this.getSqlSession().insert(ns+"update", sql);
		return isok; 
	}
	/*
	 *根据条件（tj）删除表（table）中的数据
	 */
	@Override
	public int delete(String table,String tj) {
		int isok=0;
		String sql = "delete from "+table+" where 1=1  "+tj;
		System.out.println(sql);
		isok = this.getSqlSession().insert(ns+"update", sql);
		return isok;
	}
	/*
	 *根据sql语句删除数据
	 */
	@Override
	public int delete(String sql) {
		int isok=0;
		System.out.println(sql);
		isok = this.getSqlSession().insert(ns+"update", sql);
		return isok;
	}

	/*
	 *更新对象，根据id
	 */
	@Override
	public int update(Object obj) throws Exception{
		int isok=0;
			if(obj==null){
				return isok;
			}
			StringBuffer updateSql = new StringBuffer();
			Class<? extends Object> classType=obj.getClass();
			//try {
				Field[] fields=classType.getDeclaredFields();
				Field field;
				String fieldName=null;
				StringBuffer sb = new StringBuffer();     
				//Object[] params =  new Object[fields.length];
				//List<Object> fieldobjs=new ArrayList<Object>();
				//int j=0;
				Object o;
				Object id=0;
				for(int i=0;i<fields.length;i++){
					field = fields[i];
					fieldName = field.getName();
				    sb.append("get");       
				    sb.append(fieldName.substring(0, 1).toUpperCase());      
				    sb.append(fieldName.substring(1));       
				    Method method= classType.getMethod(sb.toString());       
				    o= method.invoke(obj, new Object[0]);      
					if(o!=null&&!fieldName.equalsIgnoreCase("id")){
						updateSql.append(fieldName + " = '"+o+"',");
						//params[j]=o;
						//j++;
						//fieldobjs.add(o);
					}
					if(o!=null&&fieldName.equalsIgnoreCase("id")){
						id =o;
						
					}
					sb.setLength(0);
				}
				updateSql.deleteCharAt(updateSql.length() - 1);
				
				String sql = "update "+Tools.gettablename(obj)+" set "+updateSql+" where id="+id;

				System.out.println(sql);
				isok = this.getSqlSession().insert(ns+"update", sql);
				
		
		
		return isok;
	}

	/*
	 *更新表，根据sql语句
	 */
	@Override
	public int update(String sql){
		int isok=0;
			
				isok = this.getSqlSession().insert(ns+"update", sql);
				
		
		
		return isok;
	}
	/*
	 *更新对象（obj），根据条件（wheres）根据部分字段（str）
	 */
	@Override
	public int update(String str,String wheres,Object obj){
		int isok=0;
			if(obj==null){
				return isok;
			}
			StringBuffer updateSql = new StringBuffer();
			  String field[] = str.split(",");
			  String where[] = wheres.split(",");
			  updateSql.append("update ").append(Tools.gettablename(obj) + " set ");
			  List list = new ArrayList();
			
			for (int i = 0; i < field.length; i++) {
				Object o = Tools.getProperty(obj, field[i]);
				if(o!=null){
					updateSql.append(field[i] + " = '"+o+"',");
					//updateSql.append(field[i].toUpperCase() + " = '"+o+"',");
					
				}
			}
			updateSql.deleteCharAt(updateSql.length() - 1);
			updateSql.append(" where 1 = 1 ");
			for (int i = 0; i < where.length; i++) {
				Object o = Tools.getProperty(obj, where[i]);
				if(o!=null){
					updateSql.append(" and "+where[i] + " ='"+o+"' ");
					//updateSql.append(" and "+where[i].toUpperCase() + " ='"+o+"' ");

				}
			}
			System.out.println(updateSql.toString());
				isok = this.getSqlSession().insert(ns+"update", updateSql.toString());
				
		
		
		return isok;
	}

	/*
	 *插入对象（obj），id非自增
	 */
	@Override
	public int insertbid(Object obj) throws Exception {
		int isok=0;
			if(obj==null){
				return isok;
			}
			StringBuffer insertSql = new StringBuffer();
			StringBuffer valuesSql = new StringBuffer();
			Class<? extends Object> classType=obj.getClass();
			//try {
				Field[] fields=classType.getDeclaredFields();
				Field field;
				String fieldName=null;
				StringBuffer sb = new StringBuffer();     
				//Object[] params =  new Object[fields.length];
				//int j=0;
				Object o;
				List<Object> fieldobjs=new ArrayList<Object>();
				for(int i=0;i<fields.length;i++){
					field = fields[i];
					fieldName = field.getName();
				    sb.append("get");       
				    sb.append(fieldName.substring(0, 1).toUpperCase());      
				    sb.append(fieldName.substring(1));       
				    Method method= classType.getMethod(sb.toString());       
				    o= method.invoke(obj, new Object[0]);      
					if(o!=null){
						insertSql.append(fieldName + ",");
						//valuesSql.append("?,");
						//params[j]=o;
						//j++;
						fieldobjs.add(o);
					}
					sb.setLength(0);
				}
				//Object[] params =  new Object[fieldobjs.size()];
				for(int i=0;i<fieldobjs.size();i++){
				//	params[i]=fieldobjs.get(i);
					valuesSql.append("'"+fieldobjs.get(i)+"',");
				}
				insertSql.deleteCharAt(insertSql.length() - 1);
				valuesSql.deleteCharAt(valuesSql.length() - 1);
				String sql = "insert into "+Tools.gettablename(obj)+" ("+insertSql+") values ("+valuesSql+")";
				System.out.println(sql);
				isok = this.getSqlSession().insert(ns+"insert", sql);
				//System.out.println(isok);
				//return jdbcTemplate.update(sql,params);

			//} catch (Exception e1) {
				// TODO Auto-generated catch block
			//	e1.printStackTrace();
			//	return 0;
			//} 
		
		
		return isok;
	}

	/*
	 *插入对象（obj），id自增
	 */
	@Override
	public int insert(Object obj) throws Exception {
		int isok=0;
			if(obj==null){
				return isok;
			}
			StringBuffer insertSql = new StringBuffer();
			StringBuffer valuesSql = new StringBuffer();
			Class<? extends Object> classType=obj.getClass();
			//try {
				Field[] fields=classType.getDeclaredFields();
				Field field;
				String fieldName=null;
				StringBuffer sb = new StringBuffer();     
				//Object[] params =  new Object[fields.length];
				//int j=0;
				Object o;
				List<Object> fieldobjs=new ArrayList<Object>();
				for(int i=0;i<fields.length;i++){
					field = fields[i];
					fieldName = field.getName();
				    sb.append("get");       
				    sb.append(fieldName.substring(0, 1).toUpperCase());      
				    sb.append(fieldName.substring(1));       
				    Method method= classType.getMethod(sb.toString());       
				    o= method.invoke(obj, new Object[0]);      
					if(o!=null&&!fieldName.equalsIgnoreCase("id")){
						insertSql.append(fieldName + ",");
						//valuesSql.append("?,");
						//params[j]=o;
						//j++;
						fieldobjs.add(o);
					}
					sb.setLength(0);
				}
				//Object[] params =  new Object[fieldobjs.size()];
				for(int i=0;i<fieldobjs.size();i++){
				//	params[i]=fieldobjs.get(i);
					valuesSql.append("'"+fieldobjs.get(i)+"',");
				}
				insertSql.deleteCharAt(insertSql.length() - 1);
				valuesSql.deleteCharAt(valuesSql.length() - 1);
				String sql = "insert into "+Tools.gettablename(obj)+" ("+insertSql+") values ("+valuesSql+")";
				System.out.println(sql);
				isok = this.getSqlSession().insert(ns+"insert", sql);
				//System.out.println(isok);
				//return jdbcTemplate.update(sql,params);

			//} catch (Exception e1) {
				// TODO Auto-generated catch block
			//	e1.printStackTrace();
			//	return 0;
			//} 
	
		
		return isok;
	}

	/*
	 *插入对象（obj），id自增，并返回id
	 */
	@Override
	public int insertrid(Object obj) throws Exception {
		int isok=0;
			if(obj==null){
				return isok;
			}
			StringBuffer insertSql = new StringBuffer();
			StringBuffer valuesSql = new StringBuffer();
			Class<? extends Object> classType=obj.getClass();
			//try {
				Field[] fields=classType.getDeclaredFields();
				Field field;
				String fieldName=null;
				StringBuffer sb = new StringBuffer();     
				//Object[] params =  new Object[fields.length];
				//int j=0;
				Object o;
				List<Object> fieldobjs=new ArrayList<Object>();
				for(int i=0;i<fields.length;i++){
					field = fields[i];
					fieldName = field.getName();
				    sb.append("get");       
				    sb.append(fieldName.substring(0, 1).toUpperCase());      
				    sb.append(fieldName.substring(1));       
				    Method method= classType.getMethod(sb.toString());       
				    o= method.invoke(obj, new Object[0]);      
					if(o!=null&&!fieldName.equalsIgnoreCase("id")){
						insertSql.append(fieldName + ",");
						//valuesSql.append("?,");
						//params[j]=o;
						//j++;
						fieldobjs.add(o);
					}
					sb.setLength(0);
				}
				//Object[] params =  new Object[fieldobjs.size()];
				for(int i=0;i<fieldobjs.size();i++){
				//	params[i]=fieldobjs.get(i);
					valuesSql.append("'"+fieldobjs.get(i)+"',");
				}
				insertSql.deleteCharAt(insertSql.length() - 1);
				valuesSql.deleteCharAt(valuesSql.length() - 1);
				String sql = "insert into "+Tools.gettablename(obj)+" ("+insertSql+") values ("+valuesSql+")";
				System.out.println(sql);
				Insertrid addobj=new Insertrid();
				addobj.setSql(sql);
				isok = this.getSqlSession().insert(ns+"insertrid", addobj);
				if(isok>0){
					isok=addobj.getId();
				}
				//System.out.println("add==="+addobj.getId());
				//return jdbcTemplate.update(sql,params);

			//} catch (Exception e1) {
				// TODO Auto-generated catch block
			//	e1.printStackTrace();
			//	return 0;
			//} 
		
		
		return isok;
	}
	
}
