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
import com.market.pojo.Ponderance;
import com.market.service.PonderanceService;
import com.market.util.tag.PageModel;

@Controller
public class PonderanceController {

	@Autowired
	@Qualifier("ponderanceService")
	PonderanceService ponderanceService;

	/**********************************
	 * admin ponderance
	 ******************************************/
	// 项目详情
	@RequestMapping(value = "/ponderance/detailponderance")
	public ModelAndView detailponderance(@ModelAttribute Ponderance ponderance, ModelAndView mv) {
		// 根据id查询部门
		Ponderance target = ponderanceService.selectponderanceById(ponderance.getPon_id());
		// 设置Model数据
		mv.addObject("ponderance", target);
		// 设置跳转到修改页面
		mv.setViewName("ponderance/ponderancedetail");
		return mv;

	}

	@RequestMapping(value = "/ponderance/selectponderance")
	public String selectponderance(Model model) {
		/*
		 * System.out.println("selectDept -->>"); System.out.println(
		 * "pageIndex = " + pageIndex); System.out.println("ponderance = " +
		 * ponderance); PageModel pageModel = new PageModel();
		 * System.out.println("getPageIndex = " + pageModel.getPageIndex());
		 * System.out.println("getPageSize = " + pageModel.getPageSize());
		 * System.out.println("getRecordCount = " + pageModel.getRecordCount());
		 * if (pageIndex != null) { pageModel.setPageIndex(pageIndex); }
		 */
		/** 查询信息 */
		List<Ponderance> ponderances = ponderanceService.selectAllponderances();
		// List<ponderance> ponderances =
		// ponderanceService.findponderance(ponderance, pageModel);
		model.addAttribute("ponderances", ponderances);
		/* model.addAttribute("pageModel", pageModel); */
		return "ponderance/ponderance";
	}

	@RequestMapping(value = "/ponderance/addponderance")
	public ModelAndView addponderance(String flag, @ModelAttribute Ponderance ponderance, ModelAndView mv,
			HttpSession session) {

		if (flag.equals("1")) {
			// 设置跳转到添加页面showAddponderance.jsp:<a
			// href="ponderance/addponderance?flag=1">添加项目</a>
			mv.setViewName("ponderance/showAddponderance");
		} else {
			/// 检查项目名称是否同名
			Integer cow = ponderanceService.checkponderance(ponderance.getPon_name());
			if (cow == 0) {
				// 执行添加操作
				System.out.println(ponderance);
				ponderanceService.addponderance(ponderance);
				System.out.println(ponderance);
				// 设置客户端跳转到查询请求
				mv.setViewName("redirect:/ponderance/selectponderance");
			} else {
				session.setAttribute("ponderancemsg", "已存在该项目");
				mv.setViewName("ponderance/showAddponderance");
			}
		}
		// 返回
		return mv;
	}

	@RequestMapping(value = "/ponderance/updateponderance")
	public ModelAndView updateponderance(String flag, @ModelAttribute Ponderance ponderance, ModelAndView mv) {
		if (flag.equals("1")) {
			// 根据id查询部门
			Ponderance target = ponderanceService.selectponderanceById(ponderance.getPon_id());
			// 设置Model数据
			mv.addObject("ponderance", target);
			System.out.println("--------------" + ponderance + "------------------------------------------------");
			// 设置跳转到修改页面
			mv.setViewName("ponderance/showUpdatePonderance");
		} else {
			// 执行修改操作
			ponderanceService.modifyponderance(ponderance);
			System.out.println("--------------" + ponderance + "------------------------------------------------");
			// 设置客户端跳转到查询请求
			mv.setViewName("redirect:/ponderance/selectponderance");
		}
		// 返回
		return mv;
	}

	// 删除单个项目：<a
	// href="${basepath}/ponderance/removeponderance?id=${ponderance.Pon_id}">
	@RequestMapping(value = "/ponderance/removeponderance")
	public ModelAndView removeponderance(@RequestParam("pon_id") String pon_id, ModelAndView mv) {
		// 根据id删除员工
		ponderanceService.deleteponderance(Integer.parseInt(pon_id));
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/ponderance/selectponderance");
		// 返回ModelAndView
		return mv;
	}

	/**************************************
	 * user ponderance
	 **************************************/

	@RequestMapping(value = "/user/ponderance")
	public String Userselectponderance(Model model, Integer pageIndex, @ModelAttribute Ponderance ponderance) {
		System.out.println("selectDept -->>");
		System.out.println("pageIndex = " + pageIndex);
		System.out.println("ponderance = " + ponderance);
		PageModel pageModel = new PageModel();
		System.out.println("getPageIndex = " + pageModel.getPageIndex());
		System.out.println("getPageSize = " + pageModel.getPageSize());
		System.out.println("getRecordCount = " + pageModel.getRecordCount());
		if (pageIndex != null) {
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询信息 */
		List<Ponderance> ponderances = ponderanceService.findPonderance(ponderance, pageModel);
		model.addAttribute("ponderances", ponderances);
		model.addAttribute("pageModel", pageModel);
		return "ponderance/userponderance";
	}
}
