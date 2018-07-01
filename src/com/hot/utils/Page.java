package com.hot.utils;


/**
 * 分页对象
 * 
 * @author sheungxin
 * 
 */
public class Page {

	private int pageSize = 10;// 每页条数
	private int pageNo=1;// 当前页码
	private int totle;// 总条数
	private int num = 1;// 总页数

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotle() {
		return totle;
	}

	public void setTotle(int totle) {
		this.totle = totle;
	}

	public int getNum() {
		if (totle != 0)
			num = (totle + pageSize - 1) / pageSize;
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
