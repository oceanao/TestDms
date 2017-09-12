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

import com.market.pojo.Bug;
import com.market.pojo.Project;
import com.market.pojo.User;
import com.market.service.ProjectService;
import com.market.service.UserService;
import com.market.util.tag.PageModel;

@Controller
public class ProjectController {

	@Autowired
	@Qualifier("projectService")
	ProjectService projectService;

	@Autowired
	@Qualifier("userService")
	UserService userService;
	
	
	/**********************************
	 * admin Project
	 ******************************************/
	// 项目详情
	@RequestMapping(value = "/project/detailProject")
	public ModelAndView detailProject(@ModelAttribute Project project, ModelAndView mv) {
		// 根据id查询部门
		Project target = projectService.selectProjectById(project.getPro_id());
		// 设置Model数据
		mv.addObject("project", target);
		// 设置跳转到修改页面
		mv.setViewName("project/projectdetail");
		return mv;

	}

	@RequestMapping(value = "/project/selectProject")
	public String selectProject(Model model, Integer pageIndex, @ModelAttribute Project project) {
		/*
		 * System.out.println("selectDept -->>"); System.out.println(
		 * "pageIndex = " + pageIndex); System.out.println("project = " +
		 * project); PageModel pageModel = new PageModel(); System.out.println(
		 * "getPageIndex = " + pageModel.getPageIndex()); System.out.println(
		 * "getPageSize = " + pageModel.getPageSize()); System.out.println(
		 * "getRecordCount = " + pageModel.getRecordCount()); if (pageIndex !=
		 * null) { pageModel.setPageIndex(pageIndex); }
		 */
		/** 查询信息 */
		List<Project> projects = projectService.selectAllProjects();
		// List<Project> projects = projectService.findProject(project,
		// pageModel);
		model.addAttribute("projects", projects);
		/* model.addAttribute("pageModel", pageModel); */
		return "project/project";
	}

	@RequestMapping(value = "/project/addProject")
	public ModelAndView addProject(String flag, @ModelAttribute Project project,Integer manager_id,ModelAndView mv, HttpSession session) {

		if (flag.equals("1")) {
			// 设置跳转到添加页面showAddProject.jsp:<a
			// href="project/addProject?flag=1">添加项目</a>
              List<User> users=	userService.findAllUser();
              mv.addObject("users", users);
			mv.setViewName("project/showAddProject");
		} else {
			/// 检查项目名称是否同名
			Integer cow = projectService.checkProject(project.getPro_name());
			if (cow == 0) {
				// 执行添加操作
				if(manager_id!=0)
				{
					User user=new User();
					user.setUser_id(manager_id);
					project.setManager(user);
				}
				System.out.println(project);
				projectService.addProject(project);
				System.out.println("--------------------------------"+project.getManager_id()+"----------------------");
				
				// 设置客户端跳转到查询请求
				mv.setViewName("redirect:/project/selectProject");
			} else {
				session.setAttribute("projectmsg", "已存在该项目");
				mv.setViewName("project/showAddProject");
			}
		}
		// 返回
		return mv;
	}

	@RequestMapping(value = "/project/updateProject")
	public ModelAndView updateProject(String flag,Integer manager_id, @ModelAttribute Project project, ModelAndView mv) {
		if (flag.equals("1")) {
			// 根据id查询部门
			Project target = projectService.selectProjectById(project.getPro_id());
			// 设置Model数据
			mv.addObject("project", target);
			
			// 设置跳转到修改页面
			 List<User> users=	userService.findAllUser();
             mv.addObject("users", users);
			mv.setViewName("project/showUpdatProject");
		} else {
			if(manager_id!=0)
			{
				User user=new User();
				user.setUser_id(manager_id);
				project.setManager(user);
			}
			// 执行修改操作
			projectService.modifyProject(project);
			System.out.println("--------------" + project + "------------------------------------------------");
			// 设置客户端跳转到查询请求
			mv.setViewName("redirect:/project/selectProject");
		}
		// 返回
		return mv;
	}

	// 删除单个项目：<a href="${basepath}/project/removeProject?id=${project.pro_id}">
	@RequestMapping(value = "/project/removeProject")
	public ModelAndView removeProject(@RequestParam("pro_id") String pro_id, ModelAndView mv) {
		// 根据id删除员工
		projectService.deleteProject(Integer.parseInt(pro_id));
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/project/selectProject");
		// 返回ModelAndView
		return mv;
	}

	/**************************************
	 * user project
	 **************************************/

	@RequestMapping(value = "/user/Project")
	public String UserselectProject(Model model, Integer pageIndex, @ModelAttribute Project project) {
		System.out.println("selectDept -->>");
		System.out.println("pageIndex = " + pageIndex);
		System.out.println("project = " + project);
		PageModel pageModel = new PageModel();
		System.out.println("getPageIndex = " + pageModel.getPageIndex());
		System.out.println("getPageSize = " + pageModel.getPageSize());
		System.out.println("getRecordCount = " + pageModel.getRecordCount());
		if (pageIndex != null) {
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询信息 */
		List<Project> projects = projectService.findProject(project, pageModel);
		model.addAttribute("projects", projects);
		model.addAttribute("pageModel", pageModel);
		return "project/uproject";
	}
	
	
	@RequestMapping(value = "/user/userProject")
	public String selectuserProject(Model model, Integer pageIndex, @ModelAttribute Project project, HttpSession session) {
		/*System.out.println("selectDept -->>");
		System.out.println("pageIndex = " + pageIndex);
		System.out.println("project = " + project);*/
		PageModel pageModel = new PageModel();
		/*System.out.println("getPageIndex = " + pageModel.getPageIndex());
		System.out.println("getPageSize = " + pageModel.getPageSize());
		System.out.println("getRecordCount = " + pageModel.getRecordCount());*/
		if (pageIndex != null) {
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询信息 */
		int user_id = (int) session.getAttribute("user_id");
		List<Project> projects = projectService.selectProjectuser(user_id);
		model.addAttribute("projects", projects);
		
		return "project/userproject";
	}
	

	
}
