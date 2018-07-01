package com.hot.utils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimerTask;

/*
 * 定时吃饭
 * */
public class TimerTest extends TimerTask {

	// 吃饭时间
	private static List<Integer> eatTimes;
	/*
	 * 静态初始化
	 */
	static {
		initEatTimes();
	}

	/*
	 * 初始化吃饭时间
	 */
	private static void initEatTimes() {
		eatTimes = new ArrayList<Integer>();
		eatTimes.add(8);
		eatTimes.add(12);
		eatTimes.add(15);
		eatTimes.add(16);
		eatTimes.add(18);
	}

	/*
	 * 执行
	 */
	@Override
	public void run() {
		// TODO Auto-generated method stub
		Calendar calendar = Calendar.getInstance();
		System.out.println("检查是否到了吃饭的点");
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		if (eatTimes.contains(hour)) {
			System.out.println("饿了，吃饭...");
			DatabaseBackups.backup();
		}
	}

}