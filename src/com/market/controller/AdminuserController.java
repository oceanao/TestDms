package com.market.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.market.pojo.Adminuser;
import com.market.pojo.User;
import com.market.service.AdminUserService;
import com.market.service.UserService;

/**
 * @Description:管理员登录Controller
 * @author 作者 :敖海洋
 * @version 创建时间：2017-07-14 11:30:57 /** 处理用户请求控制器
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminuserController {

	@Autowired
	@Qualifier("adminUserService")
	private AdminUserService adminUserService;

	/**
	 * 处理登录请求
	 * 
	 * @param String
	 *            ad_username 登录名
	 * @param String
	 *            ad_password 密码
	 * @return 跳转的视图、 登录成功：redirect:/main 登录失败：forward:/AdminloginForm
	 * 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpSession session) {

		if (session.getAttribute("ad_username") == null) {

			session.setAttribute("msg", "用户还没有登录");

			return "admin/login";
		}
		return "admin/main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String tologin() {
		return "admin/login";

	}
	

	@RequestMapping(value = "/main")
	public String tomain(HttpSession session) {
		return "admin/main";
	}
	@RequestMapping(value = "/hello")
	public String tohello(HttpSession session) {
		return "admin/hello";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String adminlogin(@RequestParam("ad_username") String ad_username,
			@RequestParam("ad_password") String ad_password, HttpSession session) {
		// 调用业务逻辑组件判断用户是否可以登录
		Integer cow = adminUserService.login(ad_username, ad_password);
		if (cow != 0) {
			// 将用户保存到HttpSession当中
			Adminuser adminuser = adminUserService.getAdminUserByName(ad_username);
			session.setAttribute("ad_username", adminuser.getAd_username());
			System.out.println(adminuser);
			session.removeAttribute("msg");
			// 客户端跳转到main页面
			return "admin/main";// main指管理员主页
		} else {
			// 设置登录失败提示信息
			session.setAttribute("msg", "用户或密码错误");
			// 服务器内部跳转到登录页面
			return "redirect:/admin/login";
		}

	}

	@RequestMapping(value = "/logOut")
	public String logOut(HttpSession session) {

		session.invalidate();
		return "redirect:/admin/login";
	}
}
