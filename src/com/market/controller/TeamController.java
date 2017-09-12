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
import com.market.pojo.Team;
import com.market.pojo.User;
import com.market.service.TeamService;
import com.market.service.UserService;
import com.market.util.tag.PageModel;

@Controller
public class TeamController {

	@Autowired
	@Qualifier("teamService")
	TeamService teamService;

	@Autowired
	@Qualifier("userService")
	UserService userService;
	
	
	/**********************************
	 * admin Team
	 ******************************************/
	// 项目详情
	@RequestMapping(value = "/Team/detailTeam")
	public ModelAndView detailTeam(@ModelAttribute Team Team, ModelAndView mv) {
		// 根据id查询部门
		System.out.println("-----------------------------分组ID--------"+Team.getTeam_id()+"----------------");
		Team target = teamService.selectTeamById(Team.getTeam_id());
		// 设置Model数据
		mv.addObject("Team", target);
		// 设置跳转到修改页面
		mv.setViewName("Team/Teamdetail");
		return mv;

	}

	@RequestMapping(value = "/Team/selectTeam")
	public String selectTeam(Model model, Integer pageIndex, @ModelAttribute Team Team) {
	
		/** 查询信息 */
		List<Team> Teams = teamService.selectAllTeams();
		// List<Team> Teams = TeamService.findTeam(Team,
		// pageModel);
		model.addAttribute("Teams", Teams);
		/* model.addAttribute("pageModel", pageModel); */
		return "Team/Team";
	}

	@RequestMapping(value = "/Team/addTeam")
	public ModelAndView addTeam(String flag, @ModelAttribute Team Team,Integer manager_id,ModelAndView mv, HttpSession session) {

		if (flag.equals("1")) {
			
              List<User> users=	userService.findAllUser();
              mv.addObject("users", users);
			mv.setViewName("Team/showAddTeam");
		} else {
			/// 检查项目名称是否同名
			Integer cow = teamService.checkTeam(Team.getTeam_name());
			if (cow == 0) {
				// 执行添加操作
				if(manager_id!=0)
				{
					User user=new User();
					user.setUser_id(manager_id);
					Team.setManager(user);
				}
				System.out.println(Team);
				teamService.addTeam(Team);
				System.out.println("--------------------------------"+Team.getManager_id()+"----------------------");
				
				// 设置客户端跳转到查询请求
				mv.setViewName("redirect:/Team/selectTeam");
			} else {
				session.setAttribute("Teammsg", "已存在该项目");
				mv.setViewName("Team/showAddTeam");
			}
		}
		// 返回
		return mv;
	}

	@RequestMapping(value = "/Team/updateTeam")
	public ModelAndView updateTeam(String flag,Integer manager_id, @ModelAttribute Team Team, ModelAndView mv) {
		if (flag.equals("1")) {
			// 根据id查询部门
			Team target = teamService.selectTeamById(Team.getTeam_id());
			// 设置Model数据
			mv.addObject("Team", target);
			
			// 设置跳转到修改页面
			 List<User> users=	userService.findAllUser();
             mv.addObject("users", users);
			mv.setViewName("Team/showUpdateTeam");
		} else {
			if(manager_id!=0)
			{
				User user=new User();
				user.setUser_id(manager_id);
				Team.setManager(user);
			}
			teamService.modifyTeam(Team);
			// 设置客户端跳转到查询请求
			mv.setViewName("redirect:/Team/selectTeam");
		}
		// 返回
		return mv;
	}

	// 删除单个项目：<a href="${basepath}/Team/removeTeam?id=${Team.pro_id}">
	@RequestMapping(value = "/Team/removeTeam")
	public ModelAndView removeTeam(@RequestParam("team_id") String team_id, ModelAndView mv) {
		// 根据id删除员工
		teamService.deleteTeam(Integer.parseInt(team_id));
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/Team/selectTeam");
		// 返回ModelAndView
		return mv;
	}

	/**************************************
	 * user Team
	 **************************************/

	@RequestMapping(value = "/user/Team")
	public String UserselectTeam(Model model, Integer pageIndex, @ModelAttribute Team Team) {
		System.out.println("selectDept -->>");
		System.out.println("pageIndex = " + pageIndex);
		System.out.println("Team = " + Team);
		PageModel pageModel = new PageModel();
		System.out.println("getPageIndex = " + pageModel.getPageIndex());
		System.out.println("getPageSize = " + pageModel.getPageSize());
		System.out.println("getRecordCount = " + pageModel.getRecordCount());
		if (pageIndex != null) {
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询信息 */
		List<Team> Teams = teamService.findTeam(Team, pageModel);
		model.addAttribute("Teams", Teams);
		model.addAttribute("pageModel", pageModel);
		return "Team/uTeam";
	}
	
	
	@RequestMapping(value = "/user/userTeam")
	public String selectuserTeam(Model model, Integer pageIndex, @ModelAttribute Team Team, HttpSession session) {
		
		/** 查询信息 */
		int user_id = (int) session.getAttribute("user_id");
		List<Team> Teams = teamService.selectTeamuser(user_id);
		model.addAttribute("Teams", Teams);
		
		System.out.println("-------------------------------用户id："+user_id+"----------------------");
		return "Team/userTeam";
		
	}
}
