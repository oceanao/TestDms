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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.market.pojo.Email;
import com.market.pojo.Project;
import com.market.pojo.User;
import com.market.service.UserService;
import com.sun.org.apache.bcel.internal.generic.RETURN;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	@Qualifier("userService")
	private UserService userService;

	// 跳转到用户登录页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String tologin() {

		return "user/login";
	}

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String towelcome() {

		return "user/welcome";
	}

	// 跳转到用户注册界面
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String toregist() {

		return "user/regist";
	}

	// 跳转到用户主界面
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String tomain() {

		return "user/main";
	}

	// 跳转到测试人员界面
	@RequestMapping(value = "/testmain", method = RequestMethod.GET)
	public String totestmain() {

		return "user/testmain";
	}

	// 跳转到项目组长界面
	@RequestMapping(value = "/managermain", method = RequestMethod.GET)
	public String tomanagermain() {

		return "user/managermain";
	}

	// 跳转到用户注册界面
	@RequestMapping(value = "/hello")
	public String hello() {

		return "user/hello";
	}

	// 用户提交登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam(value = "student_num", required = false) String student_num,
			@RequestParam(value = "password", required = false) String password, Model model, HttpSession session) {
		Integer cow = 0;
		cow = userService.login(student_num, password);
		if (cow != 0) {
			// 将用户保存到HttpSession当中
			User user = userService.getUserByStudent_Num(student_num);
			System.out.println(user);

			session.removeAttribute("msg");
			// 客户端跳转到main页面
			session.setAttribute("student_num", user.getStudent_num());
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("useraddress", user.getUseraddress());
			session.setAttribute("money", user.getMoney());
			session.setAttribute("userscore", user.getUserscore());
			session.setAttribute("telephone", user.getTelephone());
			session.setAttribute("email", user.getEmail());			
			session.setAttribute("role", user.getRole());
			//session.setAttribute("team_id", user.getTeam().getTeam_id());
				return "redirect:/user/main";// 用户主页
		} else {
			// 设置登录失败提示信息
			session.setAttribute("msg", "登录名或密码错误!请重新输入");
			return "redirect:/user/login";
			// 服务器内部跳转到登录页面
		}
	}
	
	@RequestMapping(value = "/photo") // 用于ajax获取数据
	@ResponseBody
	public Object password(HttpSession session) {
		int user_id=(int)session.getAttribute("user_id");
		User user=userService.findUserById(user_id);
		Map<String, Object> num = new HashMap<String, Object>();// 图来存储对象
		
	        num.put("role", user.getRole());
			num.put("picture",user.getPicture() );
			num.put("username",user.getUsername());
			num.put("email", user.getEmail());
		return num;
	
}

	// 用户注册
	@RequestMapping(value = "/regist")
	public String regist(User user, MultipartFile file, ModelAndView mv, HttpSession session,HttpServletRequest request) {
		int cow = userService.countUserByStudent_Num(user.getStudent_num());
	
		if (cow == 0) {
			session.setAttribute("msg", "注册成功");
			String originalFilename = file.getOriginalFilename();
			if (file != null && originalFilename != null && originalFilename.length() > 0) {
				// 存储图片的物理路径
				String pic_path=request.getServletContext().getRealPath("/")+"imgs/";
				// 新的图片名称
				String filename = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));

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
			}
			user.setTeam_id(1);
			user.setRole(2);
			userService.addUser(user);
			Email email=new Email();
			email.setSendperson(userService.findUserById(1).getUsername());
			email.setTitle("DMS缺陷管理系统消息提醒");
			email.setText(user.getUsername()+"注册了账号，请进行分组和分配身份 ");
			email.email(userService.findUserById(1).getEmail());//管理员邮箱
			return "redirect:/user/login";
			
		} else {
			session.setAttribute("msg", "该用户已注册，注册失败");
			return "redirect:/user/regist";
		}
	}

	// 用户退出
	@RequestMapping(value = "/logOut")
	public String loginOut(HttpSession session) {

		session.invalidate();
		return "redirect:/user/login";
	}

	// 跳转到用户个人界面
	@RequestMapping(value = "/personal")
	public String welcome(HttpSession session,Model model) {
		int user_id = (int) session.getAttribute("user_id");
		User user=userService.findUserById(user_id);
		model.addAttribute("user", user);
		return "/user/personal";
	}
	
	@RequestMapping(value = "/common")
	public String common(HttpSession session,Model model) {
		int user_id = (int) session.getAttribute("user_id");
		User user=userService.findUserById(user_id);
		session.setAttribute("picture", user.getPicture());
		return "/user/common";
	}
}
