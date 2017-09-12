package com.market.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.ResolverUtil.IsA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.market.pojo.Bug;
import com.market.pojo.Email;
import com.market.pojo.Ponderance;
import com.market.pojo.Team;
import com.market.pojo.User;
import com.market.service.TeamService;
import com.market.service.UserService;
import com.market.util.tag.PageModel;
import com.sun.org.apache.bcel.internal.generic.RETURN;

/**
 * @Description:
 * @author 作者 :aohaiyang
 * @version 创建时间：2017年3月19日 下午5:16:16
 */
@Controller
public class UserManageController {
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@Autowired
	@Qualifier("teamService")
	private TeamService teamService;

	// 查询所有用户并在页面显示
	@RequestMapping(value = "/admin/userlist")
	public String userlist(

			Model model) {
		List<User> users = userService.findAllUser();
		for (User user : users) {
			user.setUserscore(user.getHandlernumber() + user.getHostnumber() + user.getSignnumber());
			userService.modifyUser(user);
		}
		model.addAttribute("users", users);

		return "admin/userlist";
	}

	@RequestMapping(value = "admin/common", method = RequestMethod.GET)
	public String common(Model model) {
		List<User> users = userService.findAllUser();
		model.addAttribute("users", users);
		return "admin/common";

	}

	// 查询所有用户并在页面显示
	@RequestMapping(value = "/admin/statistics")
	public String statistics(Model model) {
		List<User> users = userService.findAllUser();
		model.addAttribute("users", users);
		return "/admin/statistics";
	}

	// 删除单个用户：<a href="${basepath}/user/removeUser?id=${user.user_id}">
	@RequestMapping(value = "/admin/removeUser")
	public ModelAndView AdminremoveUser(@ModelAttribute User user, ModelAndView mv) {
		// 根据id删除员工

		String pic_path = "D:\\pic\\";
		// 根据id查询用户
		String filename = userService.findUserById(user.getUser_id()).getPicture();

		File File = new File(pic_path + filename);
		if (File.exists()) {
			try {
				File.delete();
			} catch (Exception e) {
				// TODO: handle exception
			}

		} else {

		}
		userService.deleteUser(user.getUser_id());
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/admin/userlist");
		// 返回ModelAndView
		return mv;
	}

	@RequestMapping(value = "/admin/updateuser")
	public ModelAndView Admin_updateUser(String flag, @ModelAttribute User user,Integer team_id, ModelAndView mv) {
		// 跳转到修改页面showUpdateUser：<a
		// href="${basepath}/user/updateUser?flag=1&id=${user.id}">
		if (flag.equals("1")) {
			// 根据id查询用户
			User target = userService.findUserById(user.getUser_id());
			// 设置Model数据
			List<Team> teams = teamService.selectAllTeams();

			mv.addObject("teams", teams);
			mv.addObject("user", target);
			// 返回修改员工页面
			mv.setViewName("admin/UpdateUser");
		} else {
			//修改team
			if (team_id != null) {
				Team team = new Team();
				team.setTeam_id(team_id);
				user.setTeam(team);
			}
			userService.modifyUser(user);
			// 设置客户端跳转到查询请求
			System.out.println(user);
			mv.setViewName("redirect:/admin/userlist");
		}
		// 返回
		return mv;
	}

	@RequestMapping(value = "/admin/adduser")
	public ModelAndView AdminaddUser(String flag, @ModelAttribute User user, Integer team_id, ModelAndView mv,
			HttpSession session) {

		if (flag.equals("1")) {
			List<Team> teams = teamService.selectAllTeams();

			mv.addObject("teams", teams);
			// 设置跳转到添加页面showAddUser：<a href="user/addUser?flag=1">添加用户</a>
			mv.setViewName("admin/AddUser");
		} else {
			
			if (team_id != null) {
				Team team = new Team();
				team.setTeam_id(team_id);
				user.setTeam(team);
			}

			int cow = userService.countUserByStudent_Num(user.getStudent_num());
			if (cow != 0) {
				session.setAttribute("usermsg", "该用户已注册");
				mv.setViewName("admin/AddUser");
			} 
			
			else {
				userService.addUser(user);
				session.setAttribute("result", "成功");
				System.out.println(user);
				// 设置客户端跳转到查询请求
				mv.setViewName("redirect:/admin/userlist");
			}
		}
		// 返回
		return mv;
	}

	@RequestMapping(value = "/updateuser")
	public ModelAndView updateUser(String flag, @ModelAttribute User user, ModelAndView mv) {
		// 跳转到修改页面showUpdateUser：<a
		// href="${basepath}/user/updateUser?flag=1&id=${user.id}">
		if (flag.equals("1")) {
			// 根据id查询用户
			User target = userService.findUserById(user.getUser_id());
			// 设置Model数据
			mv.addObject("user", target);
			// 返回修改员工页面
			mv.setViewName("user/showUpdateUser");
		} else {
			// 在修改页面showUpdateUser执行修改操作：<form
			// action="${basepath}/user/updateUser" id="userForm" method="post">
			userService.modifyUser(user);
			// 设置客户端跳转到查询请求
			mv.setViewName("redirect:/user/personal");
		}
		// 返回
		return mv;
	}

	@RequestMapping(value = "/updateuser/picture")
	public ModelAndView updateUserpicture(MultipartFile file, ModelAndView mv, HttpSession session,HttpServletRequest request) {
	//	String pic_path = "D:\\pic\\";
		//String pic_path="*\\WebContent\\imgs\\";
		// 根据id查询用户
		//String currentPath=getClass().getResource(".").getFile().toString();
		//System.err.println("---------"+currentPath+"");
		String pic_path=request.getServletContext().getRealPath("/")+"imgs/";
		
		System.err.println(System.getProperty(pic_path));
		int user_id = (int) session.getAttribute("user_id");
		User user = userService.findUserById(user_id);
		String filename =null;
	
		try {
			filename= user.getPicture();
		} catch (Exception e) {
			// TODO: handle exception
		}
	
		File File = new File(pic_path + filename);
		System.err.println(File.toPath());
		if (File.exists()) {
			try {
				File.delete();
			} catch (Exception e) {
				// TODO: handle exception
			}

		} else {

		}
		String originalFilename = file.getOriginalFilename();
		if (file != null && originalFilename != null && originalFilename.length() > 0) {
			// 存储图片的物理路径

			// 新的图片名称
			filename = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));

			File newFile = new File(pic_path + filename);
			// 将内存中的数据写入磁盘
			try {
				file.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 将新的图片名称写到itemsCustom中
			user.setPicture(filename);
			userService.modifyUser(user);
		}
		mv.setViewName("redirect:/user/personal");
		// 返回
		return mv;
	}

	@RequestMapping(value = "/user")
	public ModelAndView User(String flag, @ModelAttribute User user, ModelAndView mv) {
		// 跳转到修改页面showUpdateUser：<a
		// href="${basepath}/user/updateUser?flag=1&id=${user.id}">
		if (flag.equals("1")) {
			// 根据id查询用户
			User target = userService.findUserById(user.getUser_id());
			// 设置Model数据
			mv.addObject("user", target);
			// 返回修改员工页面
			mv.setViewName("admin/User");
		}
		// 返回
		return mv;
	}

	@RequestMapping(value = "/user/user")
	public String User(Model model) {
		List<User> users = userService.findAllUser();
		model.addAttribute("users", users);
		return "/user/user";
	}

	// 图标统计：按用户信息
	@RequestMapping(value = "/user/number") // 用于ajax获取数据
	@ResponseBody
	public Object usernumber(HttpSession session, ModelAndView mv) {
		Map<String, Object> nummap = new HashMap<String, Object>();// 图来存储对象
		List<String> keyname = new ArrayList<String>();
		List<Integer> handlernumber = new ArrayList<Integer>();//
		List<Integer> hostnumber = new ArrayList<Integer>();
		List<Integer> signnumber = new ArrayList<Integer>();
		List<Integer> money = new ArrayList<Integer>();
		List<Integer> score = new ArrayList<Integer>();

		List<User> users = userService.findAllUser();// 查询得到所有用户
		for (User user : users) { // 遍历用户
			Map map = new HashMap();
			Map map1 = new HashMap();
			Map map2 = new HashMap();
			Map map3 = new HashMap();
			Map map4 = new HashMap();
			Map map5 = new HashMap();
			map.put("name", user.getUsername());// 用户姓名
			handlernumber.add(user.getHandlernumber());// 用户处理缺陷数
			hostnumber.add(user.getHostnumber());// 用户提交缺陷数
			signnumber.add(user.getSignnumber());// 用户签到数
			keyname.add(user.getUsername());
			score.add(user.getUserscore());// 用户积分
			money.add(user.getMoney());// 用户提供给实验室的账单
		}

		nummap.put("keyname", keyname); // 向图中放入对象
		nummap.put("hostnumber", hostnumber);
		nummap.put("handlernumber", handlernumber);
		nummap.put("signnumber", signnumber);
		nummap.put("money", money);
		nummap.put("score", score);
		return nummap;
	}

	// 图标统计：按用户信息
	@RequestMapping(value = "/user/emailnumber") // 用于ajax获取数据
	@ResponseBody
	public Object emailnumber(HttpSession session, ModelAndView mv, HttpServletRequest request) {
		Map<String, Object> num = new HashMap<String, Object>();// 图来存储对象

		String getemail = request.getParameter("email");
 

		int number = (int) (0 + Math.random() * 999999);

		Email email = new Email();
		email.setSendperson("缺陷管理系统");
		email.setTitle("注册验证码");
		email.setText("请在60秒内输入验证码" + number + "");
		email.email(getemail);
		num.put("number", number);
		return num;
	}

	@RequestMapping(value = "/user/password") // 用于ajax获取数据
	@ResponseBody
	public Object password(HttpSession session, ModelAndView mv, HttpServletRequest request) {
		Map<String, Object> num = new HashMap<String, Object>();// 图来存储对象
		String getusername = request.getParameter("number");
		String getemail = request.getParameter("email");
		if (userService.countUserByStudent_Num(getusername) == 0) {
			num.put("error", "用户不存在");
		} else {
			User user = userService.getUserByStudent_Num(getusername);
			if (getemail.equals(user.getEmail())) {
				Email email = new Email();
				email.setSendperson("缺陷管理系统");
				email.setTitle("密码找回");
				email.setText("用户密码" + user.getPassword());
				email.email(getemail);
			}
			num.put("error", null);
			num.put("password", user.getPassword());
			num.put("useremail", user.getEmail());
		}
		return num;
	}
	
	
	@RequestMapping(value = "/Team/userlist")
	public String UserManageProjectBug(Model model, @RequestParam("team_id") Integer team_id) {
	List<User> users=userService.findUserByteam(team_id);
		model.addAttribute("users", users);	
		return "/Team/userlist";
	}
	
}
