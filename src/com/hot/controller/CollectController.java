package com.hot.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.entities.CollectLink;
import com.hot.entities.LinkImage;
import com.hot.entities.LinkType;
import com.hot.service.UtilService;
import com.hot.utils.IdWorker;
import com.hot.utils.Page;
import com.hot.vo.ModelVO;

@Controller
@RequestMapping("/collect")
public class CollectController {
	@Autowired
	private UtilService utilService;
	private IdWorker idWorker = new IdWorker(1, 1);

	@RequestMapping("/link_collect.html")
	public String findAll(ModelVO modelVO, String pageNo, HttpServletRequest request, Model model){
		int isok = 0;
		Page page = new Page();
		try {
			if(StringUtils.isNotEmpty(pageNo)){
				page.setPageNo(Integer.parseInt(pageNo));
			}else{
				page.setPageNo(1);
			}
			String userId = request.getSession().getAttribute("userId") + "";
			modelVO.setUserId(userId);
			modelVO.setOrderBy("c.id");
			String tj = "";
			if(StringUtils.isNotEmpty(modelVO.getLinkName()) && !"null".equals(modelVO.getLinkName())){
				tj += " and c.name like '%" + modelVO.getLinkName() + "%'";
			}
			
			if(StringUtils.isNotEmpty(modelVO.getSlevel()) && !"0".equals(modelVO.getSlevel())){
				tj += " and (t.pid='" + modelVO.getSlevel() + "' or (t.pid='0' and c.pid='" + modelVO.getSlevel() + "'))";
			}
			
			if(StringUtils.isNotEmpty(modelVO.getSpid()) && !"0".equals(modelVO.getSpid())){
				tj += " and c.pid='" + modelVO.getSpid() + "'";
			}
			String sql = "select c.id as linkId, c.name as linkName, c.pid, c.sequence, c.url, c.createTime, c.remark, c.userId, t.id as typeId, t.name as typeName, t.level"
							+ " from collectLink as c left join linkType as t on c.pid=t.id"
							+ " where c.userId='" + userId + "'" + tj
							+ " order by c.sequence desc"
							+ " limit " + (page.getPageNo() - 1) * page.getPageSize() + ", " + page.getPageSize();
			
			List<Map<String, Object>> objs = utilService.findAll_map(sql);
			sql = "select count(c.id)"
					+ " from collectLink as c left join linkType as t on c.pid=t.id"
					+ " where c.userId='" + userId + "'" + tj
					+ " order by c.sequence desc";
			page.setTotle(utilService.count(sql));
			model.addAttribute("objs", objs);
			model.addAttribute("page", page);
			model.addAttribute("modelVO", modelVO);
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
		}
		model.addAttribute("state", isok);
		return "collect/link_collect";
	}
	
	@RequestMapping("/doSave.json")
	public @ResponseBody Map<String, Object> doEditCollect(CollectLink collectLink, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int isok = 0;
		String message = "";
		try {
			String userId = request.getSession().getAttribute("userId") + "";
			collectLink.setUserId(userId);
			String slevel = request.getParameter("slevel") + "";
			if(StringUtils.isEmpty(collectLink.getPid()) || "0".equals(collectLink.getPid())){
				collectLink.setPid(slevel);
			}
			if(StringUtils.isNotEmpty(collectLink.getId())){
				utilService.update(collectLink);
			}else{
				collectLink.setId(idWorker.nextId() + "");
				collectLink.setCreateTime(new Date().getTime());
				utilService.insertbid(collectLink);
			}
			isok = 1;
			message = "保存成功";
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
			message = "保存失败";
		}
		map.put("state", isok);
		map.put("message", message);
		return map;
	}
	
	@RequestMapping("/{id}/doDelete.json")
	public @ResponseBody Map<String, Object> doDeleteCollect(@PathVariable long id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int isok = 0;
		String message = "";
		try {
			String sql = "delete from collectLink where id='" + id + "'";
			utilService.delete(sql);
			isok = 1;
			message = "删除成功";
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
			message = "删除失败";
		}
		map.put("state", isok);
		map.put("message", message);
		return map;
	}
	
	@RequestMapping("/getLinkTypes.json")
	public @ResponseBody Map<String, Object> getLinkTypes(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			String sql = "select * from linkType where 1=1";
			String pid =  request.getParameter("pid") + "";
			if(StringUtils.isNotEmpty(pid)){
				sql += " and pid='" + pid + "' and level=2";
			}else{
				sql += " and level=1";
			}
			List<Map<String, String>> objs = utilService.findAll_map(sql);
			map.put("linkTypes", objs);
		}catch(Exception e){
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("/{id}/getCollectById.json")
	public @ResponseBody Map<String, Object> getCollectById(@PathVariable long id){
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			String sql = "select c.*, t.level, t.pid as ppid from collectLink as c join linkType as t on c.pid=t.id where c.id='" + id + "'";
			Map<String, Object> link = (Map<String, Object>) utilService.find_map(sql);
			map.put("link", link);
		}catch(Exception e){
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("/link_type.html")
	public String findAllLinkType(String pageNo, HttpServletRequest request, Model model){
		int isok = 0;
		Page page = new Page();
		try {
			if(StringUtils.isNotEmpty(pageNo)){
				page.setPageNo(Integer.parseInt(pageNo));
			}else{
				page.setPageNo(1);
			}
			String sql = "select t.*, (select t2.name from linkType as t2 where t2.id=t.pid) as pname from linkType as t"
							+ " order by t.id desc"
							+ " limit " + (page.getPageNo() - 1) * page.getPageSize() + ", " + page.getPageSize();
			
			List<Map<String, Object>> objs = utilService.findAll_map(sql);
			sql = "select count(id) from linkType"
					+ " order by id desc";
			page.setTotle(utilService.count(sql));
			model.addAttribute("objs", objs);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
		}
		model.addAttribute("state", isok);
		return "collect/link_type";
	}
	
	@RequestMapping("/{id}/getlinkTypeById.json")
	public @ResponseBody Map<String, Object> getlinkTypeById(@PathVariable long id){
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			String sql = "select * from linkType where id='" + id + "'";
			Map<String, Object> linkType = (Map<String, Object>) utilService.find_map(sql);
			map.put("linkType", linkType);
		}catch(Exception e){
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("/{id}/delLinkType.json")
	public @ResponseBody Map<String, Object> delLinKType(@PathVariable long id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int isok = 0;
		String message = "";
		try {
			String sql = "delete from linkType where id='" + id + "'";
			utilService.delete(sql);
			isok = 1;
			message = "删除成功";
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
			message = "删除失败";
		}
		map.put("state", isok);
		map.put("message", message);
		return map;
	}
	
	@RequestMapping("/saveLinkType.json")
	public @ResponseBody Map<String, Object> saveLinKType(LinkType linkType, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int isok = 0;
		String message = "";
		try {
			String userId = request.getSession().getAttribute("userId") + "";
			linkType.setUserId(userId);
			if(StringUtils.isNotEmpty(linkType.getId())){
				utilService.update(linkType);
			}else{
				linkType.setId(idWorker.nextId() + "");
				utilService.insertbid(linkType);
			}
			isok = 1;
			message = "保存成功";
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
			message = "保存失败";
		}
		map.put("state", isok);
		map.put("message", message);
		return map;
	}
	
	@RequestMapping("/show_collect.html")
	public String showCollect(String pid, String sid, Model model, HttpServletRequest request){
		try{
			String sql = "select * from linkType as t where t.level=1 order by t.sort desc";
			List<Map<String, Object>> ptypes = utilService.findAll_map(sql);
			model.addAttribute("ptypes", ptypes);
			List<Map<String, Object>> stypes = null;
			List<Map<String, Object>> slinks = null;
			String pname = "";
			String sname = "";
			if(ptypes != null && ptypes.size() > 0){
				if(StringUtils.isEmpty(pid)){
					pid = ptypes.get(0).get("id") + "";
					pname =  ptypes.get(0).get("name") + "";
					sid = "";
				}else{
					sql = "select * from linkType where id='" + pid + "'";
					Map<String, Object> ptMap = (Map<String, Object>) utilService.find_map(sql);
					if(ptMap != null){
						if(ptMap.get("name") != null){
							pname = ptMap.get("name") + "";
						}
					}
				}
				sql = "select * from linkType as t where pid='" + pid + "' and t.level=2 order by t.sort desc";
				stypes = utilService.findAll_map(sql);
				if(StringUtils.isNotEmpty(sid)){
					sql = "select * from collectLink as c where c.pid='" + sid + "' order by c.sequence desc";
					slinks = utilService.findAll_map(sql);
					sql = "select * from linkType where id='" + sid + "'";
					Map<String, Object> stMap = (Map<String, Object>) utilService.find_map(sql);
					if(stMap != null){
						if(stMap.get("name") != null){
							sname = stMap.get("name") + "";
						}
					}
				}else{
					sql = "select * from collectLink as c where c.pid='" + pid + "' order by c.sequence desc";
					slinks = utilService.findAll_map(sql);
				}
			}
			
			sql = "select * from linkImage where type=1";
			List<Map<String, Object>> images = utilService.findAll_map(sql);
			model.addAttribute("images", images);
			model.addAttribute("pid", pid);
			model.addAttribute("sname", sname);
			model.addAttribute("pname", pname);
			model.addAttribute("sid", sid);
			model.addAttribute("ptypes", ptypes);
			model.addAttribute("stypes", stypes);
			model.addAttribute("slinks", slinks);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "pc/show_collect";
	}
	
	@RequestMapping("/link_images.html")
	public String link_images(String pageNo, HttpServletRequest request, Model model){
		Page page = new Page();
		if(StringUtils.isNotEmpty(pageNo)){
			page.setPageNo(Integer.parseInt(pageNo));
		}else{
			page.setPageNo(1);
		}
		String sql = "select * from linkImage";
		sql += " limit " + (page.getPageNo() - 1) * page.getPageSize() + ", " + page.getPageSize();
		List<Map<String, Object>> linkImages = utilService.findAll_map(sql);
		model.addAttribute("objs", linkImages);
		sql = "select count(id) from linkImage";
		page.setTotle(utilService.count(sql));
		model.addAttribute("page", page);
		return "collect/link_images";
	}
	
	@RequestMapping("/saveLinkImage.json")
	public @ResponseBody Map<String, Object> saveLinkImage(LinkImage image,HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int isok = 0;
		String message = "";
		try {
			if(StringUtils.isEmpty(image.getId())){
				image.setId(idWorker.nextId()+"");
				isok = utilService.insertbid(image);
				message = "添加成功";
			}else{
				isok = utilService.update(image);
				message = "修改成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
			message = "操作失败";
		}
		map.put("state", isok);
		map.put("message", message);
		return map;
	}
	
	@RequestMapping("/deleteImage.json")
	public @ResponseBody Map<String, Object> deleteLinkImage(String id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int isok = 0;
		String message = "";
		try {
			if(StringUtils.isNotEmpty(id)){
				String sql = "delete from linkImage where id='" + id + "'";
				isok = utilService.delete(sql);
				message = "删除成功";
			}else{
				isok = -1;
				message = "id为空，请重新选择";
			}
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
			message = "操作失败";
		}
		map.put("state", isok);
		map.put("message", message);
		return map;
	}
	
	@RequestMapping("/getLinkImageById.json")
	public @ResponseBody Map<String, Object> getLinkImageById(String id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int isok = 0;
		try {
			if(StringUtils.isNotEmpty(id)){
				String sql = "select * from linkImage where id='" + id + "'";
				Map<String, Object> image = (Map<String, Object>) utilService.find_map(sql);
				map.put("linkImage", image);
			}
		} catch (Exception e) {
			e.printStackTrace();
			isok = -1;
		}
		map.put("state", isok);
		return map;
	}
}
