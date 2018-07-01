package com.hot.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hot.dao.UtilDao;
import com.hot.utils.Page;

@Service

public class UtilService {

	@Resource(name = "utilDao")
	private UtilDao utilDao;

	public int update(String sql) {
		return utilDao.update(sql);
	}

	public int delete(String sql) {
		return utilDao.delete(sql);
	}

	public int insert(Object obj) throws Exception {
		return utilDao.insert(obj);
	}

	public int insertbid(Object obj) throws Exception {
		return utilDao.insertbid(obj);
	}

	public int insertrid(Object obj) throws Exception {
		return utilDao.insertrid(obj);
	}

	public int update(Object obj) throws Exception {

		return utilDao.update(obj);
	}

	public int update(String str, String wheres, Object obj) {

		return utilDao.update(str, wheres, obj);
	}

	public int delete(String table, int id) {
		return utilDao.delete(table, id);
	}

	public int delete(String table, String tj) {
		return utilDao.delete(table, tj);
	}

	public int count(String sql) {
		return utilDao.count(sql);
	}

	public int count(String table, String tj) {
		return utilDao.count(table, tj);
	}

	public List findAll(String field, String tj, String by, Page page,
			Object obj) {
		return utilDao.findAll(field, tj, by, page, obj);
	}

	public List findAll_map(String field, String tj, String by, Page page,
			String table) {
		return utilDao.findAll_map(field, tj, by, page, table);
	}

	public List findAll(String field, String tj, String by, Object obj) {
		return utilDao.findAll(field, tj, by, obj);
	}

	public List findAll_map(String field, String tj, String by, String table) {
		return utilDao.findAll_map(field, tj, by, table);
	}

	public List findAll(String sql, Object obj) {
		return utilDao.findAll(sql, obj);
	}

	public List findAll_map(String sql) {
		return utilDao.findAll_map(sql);
	}

	public Object find_obj(String sql, Object obj) {
		return utilDao.find_obj(sql, obj);
	}

	public Object find_obj(String field, String tj, Object obj) {
		return utilDao.find_obj(field, tj, obj);
	}

	public Object find_map(String sql) {
		return utilDao.find_map(sql);
	}

	public Object find_map(String field, String tj, String table) {
		return utilDao.find_map(field, tj, table);
	}

}
