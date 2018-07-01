package com.hot.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.entities.User;
import com.hot.service.UtilService;
import com.hot.utils.IdWorker;
import com.hot.utils.MD5Util;
import com.hot.utils.Page;

@Controller
@RequestMapping("/user/*")
public class UserController {
	@Autowired
	private UtilService utilService;
	private IdWorker idWorker = new IdWorker(1, 10);
	
	/**
	 * 跳转到登录界面
	 * @return
	 */
	@RequestMapping("/tologin.html")
	public String tologin(){
		return "user/login";
	}
	
	@RequestMapping("/login.json")
	public @ResponseBody Map<String, Object> login(String mobile,String password, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int isok=0;
		String message="";
		try{
			if(mobile!=null&&password!=null){
				String sql = "select * from user where mobile='" + mobile + "' and password='" + MD5Util.MD5(password) + "'";
				User nuser = (User) utilService.find_obj(sql, new User());
				if(nuser == null){
					message = "登录失败,账户或密码错误!";
					isok = -1;
				}else{
					if(nuser.getState() == 1){
						message = "登录成功!";
						isok = 1;
						sql = "update user set loginTime=" + new Date().getTime() + " where mobile='" + mobile +"'";
						utilService.update(sql);
						System.out.println("user: " + JSONObject.fromObject(nuser).toString());
						request.getSession().setAttribute("user", nuser);
						request.getSession().setAttribute("userId", nuser.getId());
						map.put("utype", nuser.getType());
					}else{
						message = "账号已被锁定，不能登录!";
						isok = -3;
					}
				}
			}else{
    			message = "登录失败,账户或密码为空!";
				isok = -2;
			}
		}catch(Exception e){
			isok = 0;
			e.printStackTrace();
		}
		map.put("state", isok);
		map.put("message", message);
		return map;
	}
	
	/**
	 * 进入用户管理界面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/user_manage.html")
	public String user_manage(User nuser, Model model, HttpServletRequest request){
		User per = (User) request.getSession().getAttribute("user");
		if(per != null){
			if(per.getType() == -1){
				Page page = new Page();
				String pn = request.getParameter("pageNo");
				if(StringUtils.isNotEmpty(pn)){
					page.setPageNo(Integer.parseInt(pn));
				}else{
					page.setPageNo(1);
				}
				String sql = "select * from user as u where 1=1";
				String tj = "";
				if(StringUtils.isNotEmpty(nuser.getMobile())){
					tj += " and u.mobile like '" + nuser.getMobile() + "%'" ;
				}
				if(StringUtils.isNotEmpty(nuser.getUserName())){
					tj += " and u.userName like '%" + nuser.getUserName() + "%'" ;
				}
				String userSql = sql + tj + " order by u.createTime desc limit " + (page.getPageNo() - 1) * page.getPageSize() + "," + page.getPageSize();
				List<User> users = utilService.findAll(userSql, new User());
				String countSql = "select count(u.id) from user as u where 1=1" + tj;
				page.setTotle(utilService.count(countSql));
				model.addAttribute("users", users);
				model.addAttribute("page", page);
				return "user/user_manage";
			}
		}
		return "user/login";
	}
	
	/**
	 * 根据ID获取用户详情
	 * @return
	 */
	@RequestMapping("/{uId}/getPersonnelById.json")
	public @ResponseBody User getPersonnelById(@PathVariable int uId){
		String sql = "select * from user where id='" + uId + "'";
		return (User) utilService.find_obj(sql, new User());
	}
	
	/**
	 * 根据ID验证手机号是否使用
	 * @return
	 */
	@RequestMapping("/validateMobile.json")
	public @ResponseBody Map<String, Object> validateMobile(String mobile){
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = "select count(id) from user where mobile='" + mobile + "'";
		int count = utilService.count(sql) ;
		if(count > 0){
			map.put("state", -1);
			map.put("message", "已存在该手机号");
		}else{
			map.put("state", 1);
			map.put("message", "可以使用");
		}
		return map;
	}
	/**
	 * 添加或者修改人员表
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/doEditUser.json")
	public @ResponseBody Map<String, Object> eidtUser(User euser, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		try {
			if(StringUtils.isNotEmpty(euser.getId())){
				euser.setCreateTime(new Date().getTime());
				euser.setState(1);
				euser.setType(1);
				euser.setPassword(MD5Util.MD5(euser.getPassword()));
				state = utilService.insert(euser);
				map.put("message", "添加成功");
			}else{
				String sql = "update user set userName='" + euser.getUserName() +  "' where id='" + euser.getId() + "'";
				state = utilService.update(sql);
				map.put("message", "修改成功");
			}
		} catch (Exception e) {
			state = -1;
			map.put("message", "操作失败");
			e.printStackTrace();
		}
		request.getSession().setAttribute("user", euser);
		map.put("state", state);
		return map;
	}
	
	/**
	 * 添加或者修改人员表
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/{uId}/dealState.json")
	public @ResponseBody Map<String, Object> dealState(@PathVariable long uId, int state, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int status = 0;
		try {
			String sql = " update user set state=" + state + " where id='" + uId + "'";
			status = utilService.update(sql);
			map.put("message", "操作成功");
		} catch (Exception e) {
			status = -1;
			map.put("message", "操作失败");
			e.printStackTrace();
		}
		map.put("state", status);
		return map;
	}
	
	/**
	 * 修改登录用户密码
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/user_edit.json")
	public @ResponseBody Map<String, Object> userInFoEdit(String userName, String password ,HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		String userId = request.getSession().getAttribute("userId") + "";
		try {
			String sql = " update user set userName='" + userName + "', password='" + MD5Util.MD5(password) + "' where id='" + userId + "'";
			state = utilService.update(sql);
			User per = (User) utilService.find_obj("select * from user where id='" + userId + "'", new User());
			request.getSession().setAttribute("user", per);
			map.put("message", "操作成功");
		} catch (Exception e) {
			state = -1;
			map.put("message", "操作失败");
			e.printStackTrace();
		}
		map.put("state", state);
		return map;
	}
	
	/**
	 * 重置用户密码
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/{uId}/resetPassword.json")
	public @ResponseBody Map<String, Object> resetPassword(@PathVariable String uId ,HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		try {
			String sql = " update user set password='" + MD5Util.MD5("123456") + "' where id='" + uId + "'";
			state = utilService.update(sql);
			map.put("message", "操作成功");
		} catch (Exception e) {
			state = -1;
			map.put("message", "操作失败");
			e.printStackTrace();
		}
		map.put("state", state);
		return map;
	}

	
}
