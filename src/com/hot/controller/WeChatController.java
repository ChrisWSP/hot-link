package com.hot.controller;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.utils.DoHttpRequest;
@Controller
@RequestMapping("/wechat")
public class WeChatController {
	@RequestMapping("/wxtest.json")
	public @ResponseBody Map<String, Object> wxtest(){
		Map<String, Object> map = new HashMap<String, Object>();
		//access_token是公众号的全局唯一票据，公众号调用各接口时都需使用access_token。
		//开发者需要进行妥善保存。access_token的存储至少要保留512个字符空间。access_token的有效期目前为2个小时，需定时刷新，重复获取将导致上次获取的access_token失效。 
		String access_token = DoHttpRequest.sendGet("https://api.weixin.qq.com/cgi-bin/token", "grant_type=client_credential&appid=wxa090acc678b18722&secret=81211d18827631f2dbed4287fb601076");
		map.put("access_token", access_token);
		Map<String, Object> jsMap = JSONObject.fromObject(access_token);
		//微信服务器IP地址列表
		String wx_ip = DoHttpRequest.sendGet("https://api.weixin.qq.com/cgi-bin/getcallbackip", "access_token=" + jsMap.get("access_token"));
		map.put("wx_ip", wx_ip);
		return map;
	}
	@RequestMapping("/index")
	public String index(Model model){
		return "weixin/shouquan";
	}
	
	@RequestMapping("/getWxUserInfo")
	public @ResponseBody Map<String, Object> getWxUserInfo(){
		Map<String, Object> map = new HashMap<String, Object>();
		//access_token是公众号的全局唯一票据，公众号调用各接口时都需使用access_token。
		//开发者需要进行妥善保存。access_token的存储至少要保留512个字符空间。access_token的有效期目前为2个小时，需定时刷新，重复获取将导致上次获取的access_token失效。 
		String acctokenStr = DoHttpRequest.sendPost("https://api.weixin.qq.com/sns/oauth2/access_token", "appid=wxa090acc678b18722&secret=81211d18827631f2dbed4287fb601076&code=code&grant_type=authorization_code");
		Map<String, Object> acctokenMap = JSONObject.fromObject(acctokenStr);
		String access_token = acctokenMap.get("access_token") + "";
		return map;
	}
}
