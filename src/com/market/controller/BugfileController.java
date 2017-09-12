package com.market.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.market.pojo.Bug;
import com.market.pojo.Bugfile;
import com.market.service.BugService;
import com.market.service.BugfileService;

/**
 * @Description:
 * @author 作者 :敖海洋
 * @version 创建时间：2017-07-14 11:30:57
 */
@Controller
public class BugfileController {
	@Autowired
	@Qualifier("bugfileService")
	private BugfileService bugfileService;

	@Autowired
	@Qualifier("bugService")
	private BugService bugService;

	@RequestMapping(value = "/bug/addBugFile")
	public ModelAndView addBugFile(Integer bug_id, MultipartFile file, String filetitle, ModelAndView mv,
			@ModelAttribute Bug bug, HttpServletRequest request) throws Exception {
		// 上传文件名
		String originalFilename = file.getOriginalFilename();
		if (file != null && originalFilename != null && originalFilename.length() > 0) {
			// 存储图片的物理路径
			String pic_path = "D:\\pic\\"; // 将通过tomcat配置虚拟图片服务器
			// 新的图片名称
			String filename = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			File newFile = new File(pic_path + filename);
			// 将内存中的数据写入磁盘
			file.transferTo(newFile);
			// 将新的图片名称写到itemsCustom中

			Bugfile bugfile = new Bugfile();
			bugfile.setFiletitle(filetitle);
			bugfile.setFilename(filename);

			bugfile.setBug_id(bug_id);
			bugfileService.addBugfile(bugfile);

		}
		// 插入数据库
		Bug realbug = new Bug();
		realbug = bugService.selectBugById(bug_id);

		List<Bugfile> bugfiles = bugfileService.selectBugfileByBugId(bug_id);
		// 设置Model数据

		mv.addObject("bug", realbug);
		mv.addObject("bugfiles", bugfiles);
		mv.setViewName("bug/AdddetailBug");
		// 返回
		return mv;
	}

	// 删除bug
	@RequestMapping(value = "/bug/removeBug")
	public ModelAndView removeBug(@RequestParam("bug_id") String bug_id, ModelAndView mv) {
		// 根据id删除

		List<Bugfile> bugfiles = bugfileService.selectBugfileByBugId(Integer.parseInt(bug_id));
		String pic_path = "D:\\pic\\";
		String filename;
		File File;

		for (Bugfile bugfile : bugfiles) {

			filename = bugfile.getFilename();
			File = new File(pic_path + filename);
			if (File.exists()) {
				try {
					File.delete();
				} catch (Exception e) {
					// TODO: handle exception
				}

			} else {

			}
		}
		// 设置客户端跳转到查询请求
		bugService.deleteBug(Integer.parseInt(bug_id));
		mv.setViewName("redirect:/bug/selectBug");
		// 返回ModelAndView
		return mv;
	}

	@RequestMapping(value = "/bug/userremoveBug")
	public ModelAndView userremoveBug(@RequestParam("bug_id") String bug_id, ModelAndView mv) {
		List<Bugfile> bugfiles = bugfileService.selectBugfileByBugId(Integer.parseInt(bug_id));
		String pic_path = "D:\\pic\\";
		String filename;
		File File;

		for (Bugfile bugfile : bugfiles) {

			filename = bugfile.getFilename();
			File = new File(pic_path + filename);
			if (File.exists()) {
				try {
					File.delete();
				} catch (Exception e) {
					// TODO: handle exception
				}

			} else {

			}
		}
		bugService.deleteBug(Integer.parseInt(bug_id));
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/user/submit");
		// 返回ModelAndView
		return mv;
	}
}
