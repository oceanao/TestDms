package com.market.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.market.pojo.result;
import com.market.service.resultService;
import com.market.util.tag.PageModel;

@Controller
public class resultController {

	@Autowired
	@Qualifier("resultService")
	resultService resultService;

	/**********************************
	 * admin result
	 ******************************************/
	// 项目详情
	@RequestMapping(value = "/result/detailresult")
	public ModelAndView detailresult(@ModelAttribute result result, ModelAndView mv) {
		// 根据id查询部门
		result target = resultService.selectresultById(result.getResult_id());
		// 设置Model数据
		mv.addObject("result", target);
		// 设置跳转到修改页面
		mv.setViewName("result/resultdetail");
		return mv;

	}

	@RequestMapping(value = "/result/selectresult")
	public String selectresult(Model model) {
		/*
		 * System.out.println("selectDept -->>"); System.out.println(
		 * "pageIndex = " + pageIndex); System.out.println("result = " +
		 * result); PageModel pageModel = new PageModel(); System.out.println(
		 * "getPageIndex = " + pageModel.getPageIndex()); System.out.println(
		 * "getPageSize = " + pageModel.getPageSize()); System.out.println(
		 * "getRecordCount = " + pageModel.getRecordCount()); if (pageIndex !=
		 * null) { pageModel.setPageIndex(pageIndex); }
		 */
		/** 查询信息 */
		List<result> results = resultService.selectAllresults();
		// List<result> results = resultService.findresult(result, pageModel);
		model.addAttribute("results", results);
		/* model.addAttribute("pageModel", pageModel); */
		return "result/result";
	}

	@RequestMapping(value = "/result/addresult")
	public ModelAndView addresult(String flag, @ModelAttribute result result, ModelAndView mv, HttpSession session) {

		if (flag.equals("1")) {
			// 设置跳转到添加页面showAddresult.jsp:<a
			// href="result/addresult?flag=1">添加项目</a>
			mv.setViewName("result/showAddresult");
		} else {
			/// 检查项目名称是否同名
			Integer cow = resultService.checkresult(result.getResult_name());
			if (cow == 0) {
				// 执行添加操作
				System.out.println(result);
				resultService.addresult(result);
				System.out.println(result);
				// 设置客户端跳转到查询请求
				mv.setViewName("redirect:/result/selectresult");
			} else {
				session.setAttribute("resultmsg", "已存在该项目");
				mv.setViewName("result/showAddresult");
			}
		}
		// 返回
		return mv;
	}

	@RequestMapping(value = "/result/updateresult")
	public ModelAndView updateresult(String flag, @ModelAttribute result result, ModelAndView mv) {
		if (flag.equals("1")) {
			// 根据id查询部门
			result target = resultService.selectresultById(result.getResult_id());
			// 设置Model数据
			mv.addObject("result", target);
			System.out.println("--------------" + result + "------------------------------------------------");
			// 设置跳转到修改页面
			mv.setViewName("result/showUpdateresult");
		} else {
			// 执行修改操作
			resultService.modifyresult(result);
			System.out.println("--------------" + result + "------------------------------------------------");
			// 设置客户端跳转到查询请求
			mv.setViewName("redirect:/result/selectresult");
		}
		// 返回
		return mv;
	}

	// 删除单个项目：<a href="${basepath}/result/removeresult?id=${result.result_id}">
	@RequestMapping(value = "/result/removeresult")
	public ModelAndView removeresult(@RequestParam("result_id") String result_id, ModelAndView mv) {
		// 根据id删除员工
		resultService.deleteresult(Integer.parseInt(result_id));
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/result/selectresult");
		// 返回ModelAndView
		return mv;
	}

	/**************************************
	 * user result
	 **************************************/

	@RequestMapping(value = "/user/result")
	public String Userselectresult(Model model, Integer pageIndex, @ModelAttribute result result) {
		System.out.println("selectDept -->>");
		System.out.println("pageIndex = " + pageIndex);
		System.out.println("result = " + result);
		PageModel pageModel = new PageModel();
		System.out.println("getPageIndex = " + pageModel.getPageIndex());
		System.out.println("getPageSize = " + pageModel.getPageSize());
		System.out.println("getRecordCount = " + pageModel.getRecordCount());
		if (pageIndex != null) {
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询信息 */
		List<result> results = resultService.findresult(result, pageModel);
		model.addAttribute("results", results);
		model.addAttribute("pageModel", pageModel);
		return "result/Uresult";
	}
}
