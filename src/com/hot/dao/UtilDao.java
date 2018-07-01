package com.hot.dao;

import java.util.List;

import com.hot.utils.Page;

public interface UtilDao {
	
	int insert(Object obj) throws Exception;

	int update(Object obj) throws Exception;

	int update(String str, String wheres, Object obj);

	int delete(String table, int id);

	int delete(String table, String tj);

	int count(String sql);

	int count(String table, String tj);

	List findAll(String field, String tj, String by, Page page, Object obj);

	List findAll_map(String field, String tj, String by, Page page, String table);

	List findAll(String field, String tj, String by, Object obj);

	List findAll_map(String sql);

	List findAll(String sql, Object obj);

	List findAll_map(String field, String tj, String by, String table);

	Object find_map(String sql);

	Object find_map(String field, String tj, String table);

	Object find_obj(String sql, Object obj);

	Object find_obj(String field, String tj, Object obj);

	int insertrid(Object obj) throws Exception;

	int update(String sql);

	int delete(String sql);

	int insertbid(Object obj) throws Exception;
}
