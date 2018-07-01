package com.hot.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

//import com.sun.istack.internal.logging.Logger;

@Controller
@Scope("prototype")
@RequestMapping("/fileUpload/*")
public class FileUploadController {
	@Autowired
	private  HttpServletRequest request;
	
	@RequestMapping("/upload-{type}.json")
	public @ResponseBody Map<String, Object> imgUpload(@PathVariable("type") int type, @RequestParam MultipartFile file, HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		long userId = 1L;
		String path = "/upload/" + new SimpleDateFormat("yyyy-MM-dd").format(new Date()) + "/" + userId;
		switch (type) {
		case 1:
			map = uploadImg(path + "/link/images/", file);
			break;
		case 2:
			map = uploadFile(path + "/link/attachment/", file);
			break;
		case 3:
			map = uploadFileRealName(path + "/link/attachment/", file);
			break;
		default:
			break;
		}
		return map;
	}
	
	public Map<String, Object> uploadImg(String spath, MultipartFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String path = request.getServletContext().getRealPath(spath); 
			// 创建文件目录  
			if (file.isEmpty()) {
				map.put("status", -3);
				map.put("result", "文件为空！");
				System.out.println("文件为空！");
				return map;
			}
			// 获取后缀名
			String type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			if(!vfSuffix(type)){
				System.out.println("图片格式错误");
				map.put("status", -2);
				map.put("result", "图片格式错误");
				return map;
			}
			String fileName = new Date().getTime() + type;
			String uploadPath =  path;
			System.out.println(uploadPath);
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			File uploadFile = new File(uploadPath + "/" + fileName);
			System.out.println("uploadFile===" + uploadFile);
			file.transferTo(uploadFile);// 上传

			spath += fileName;
			map.put("status", 1);
			map.put("result", "上传成功！");
			map.put("filePath", spath);
			System.out.println("上传成功！");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	

	public Map<String, Object> uploadFile(String spath, MultipartFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String path = request.getServletContext().getRealPath(spath); 
			// 创建文件目录  
			if (file.isEmpty()) {
				map.put("status", -3);
				map.put("result", "文件为空！");
				System.out.println("文件为空！");
				return map;
			}
			String rname = file.getOriginalFilename();
			map.put("rname", rname);
			// 获取后缀名
			String type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String fileName = new Date().getTime() + type;
			String uploadPath =  path;
			System.out.println(uploadPath);
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			File uploadFile = new File(uploadPath + "/" + fileName);
			System.out.println("uploadFile===" + uploadFile);
			file.transferTo(uploadFile);// 上传

			spath += fileName;
			map.put("status", 1);
			map.put("result", "上传成功！");
			map.put("filePath", spath);
			System.out.println("上传成功！");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> uploadFileRealName(String spath, MultipartFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String path = request.getServletContext().getRealPath(spath); 
			// 创建文件目录  
			if (file.isEmpty()) {
				map.put("status", -3);
				map.put("result", "文件为空！");
				System.out.println("文件为空！");
				return map;
			}
			String rname = file.getOriginalFilename();
			map.put("rname", rname);
			// 获取后缀名
			//String type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String fileName = new Date().getTime() + "~" +file.getOriginalFilename();
			String uploadPath =  path;
			System.out.println(uploadPath);
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			File uploadFile = new File(uploadPath + "/" + fileName);
			System.out.println("uploadFile===" + uploadFile);
			file.transferTo(uploadFile);// 上传
			
			spath += fileName;
			map.put("status", 1);
			map.put("result", "上传成功！");
			map.put("filePath", spath);
			System.out.println("上传成功！");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	//图片类型验证
	public boolean vfSuffix(String fileName){
    	if(fileName.equalsIgnoreCase(".jpeg")||fileName.equalsIgnoreCase(".jpg")||fileName.equalsIgnoreCase(".png")||fileName.equalsIgnoreCase(".bmp")){
    		return true;
    	}else{
    		return false;
    	}
    }
}