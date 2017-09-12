package com.market.controller;

import java.security.NoSuchProviderException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.market.pojo.Bug;
import com.market.pojo.Bugfile;
import com.market.pojo.Email;
import com.market.pojo.Ponderance;
import com.market.pojo.Project;
import com.market.pojo.User;
import com.market.pojo.result;
import com.market.service.BugService;
import com.market.service.BugfileService;
import com.market.service.PonderanceService;
import com.market.service.ProjectService;
import com.market.service.UserService;
import com.market.service.resultService;
import com.market.util.common.ViewExcel;

import com.market.util.tag.PageModel;
import com.xiets.javamaildemo.Main;

/**
 * @Description:
 * @author 敖海洋
 * @version 创建时间：2017-07-14 11:30:57
 */
@Controller
public class bugController {
	@Autowired
	@Qualifier("bugService")
	private BugService bugService;

	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@Autowired
	@Qualifier("projectService")
	ProjectService projectService;

	@Autowired
	@Qualifier("ponderanceService")
	private PonderanceService ponderanceService;

	@Autowired
	@Qualifier("resultService")
	private resultService resultService;

	@Autowired
	@Qualifier("bugfileService")
	private BugfileService bugfileService;

	/***********************************
	 * admin bug
	 **********************************/

	// 管理员后台显示所有bug
	@RequestMapping(value = "/bug/selectBug")
	public String AdminselectBug(Model model, Integer pageIndex, Integer pro_id,Integer pon_id, Integer result_id,
			Integer reporter_id, Integer handler_id, @ModelAttribute Bug bug, HttpSession session) {

		// 模糊查询时判断是否有关联对象传递，如果有，创建并封装关联对象
		this.genericAssociation(pro_id, pon_id,result_id, reporter_id, handler_id, bug);
		PageModel pageModel = new PageModel();

		if (pageIndex != null) {
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询信息 */
		List<User> users = userService.findAllUser();
		List<Project> projects = projectService.selectAllProjects();
		List<Ponderance> ponderances = ponderanceService.selectAllponderances();
		List<Bug> bugs = bugService.findBug(bug, pageModel);
		List<result> results = resultService.selectAllresults();
		model.addAttribute("results", results);
		model.addAttribute("bugs", bugs);
		model.addAttribute("users", users);
		model.addAttribute("projects", projects);
		model.addAttribute("ponderances", ponderances);
		model.addAttribute("pageModel", pageModel);
		return "bug/Abug";
	}

	// 根据项目id:pro_id导出Excel
	@RequestMapping(value = "/project/exportExcel")
	public ModelAndView exportExcel(ModelMap model, Integer pro_id, HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute Bug bug) throws Exception {

		if (pro_id != null) {
			Project project = new Project();
			project.setPro_id(pro_id);
			bug.setProject(project);
		}

		ViewExcel viewExcel = new ViewExcel();
		Map obj = null;
		HSSFWorkbook workbook = bugService.SetToExcel(bug);
		viewExcel.buildExcelDocument(obj, workbook, request, response);
		return new ModelAndView(viewExcel, model);
	}

	// 模糊查询导出Excel
	@RequestMapping(value = "/bug/exportExcel")
	public ModelAndView mohuexportExcel(ModelMap model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response, @ModelAttribute Bug bug) throws Exception {

		bug = (Bug) session.getAttribute("bug");
		ViewExcel viewExcel = new ViewExcel();
		Map obj = null;
		HSSFWorkbook workbook = bugService.SetToExcel(bug);
		viewExcel.buildExcelDocument(obj, workbook, request, response);
		return new ModelAndView(viewExcel, model);
	}

	// 管理员修改bug（分配bug）
	@RequestMapping(value = "/bug/updateBug")
	public ModelAndView AdminupdateBug(String flag, Integer pro_id, Integer pon_id,Integer result_id, Integer handler_id,
			HttpSession session, @ModelAttribute Bug bug, ModelAndView mv) {
		// 当flag==1， 跳转页面
		if (flag.equals("1")) {
			// 根据id查询部门
			Bug target = bugService.selectBugById(bug.getBug_id());
			List<User> users = userService.findAllUser();
			List<Project> projects = projectService.selectAllProjects();
			List<Ponderance> Ponderances = ponderanceService.selectAllponderances();
			List<result> results = resultService.selectAllresults();
			mv.addObject("results", results);
			mv.addObject("projects", projects);
			mv.addObject("ponderances", Ponderances);
			mv.addObject("users", users);
			// 设置Model数据
			mv.addObject("bug", target);
			// 设置跳转到修改页面
			mv.setViewName("bug/Aupdatebug");
		} else {
			int user_id=(int)session.getAttribute("user_id");
			User user=userService.findUserById(user_id);
			// 管理员修改bug
			// 设置bug处理人
			if (handler_id != null) {
				User handler = new User();
				handler.setUser_id(handler_id);
				bug.setHandler(handler);
			}
			if (pon_id != null) {
				Ponderance Ponderance = new Ponderance();
				Ponderance.setPon_id(pon_id);
				bug.setPonderance(Ponderance);
			}
			if (result_id != null) {
				result result = new result();
				result.setResult_id(result_id);
				bug.setResult(result);
			}
			bugService.modifyBug(bug);
			if (user.getRole()==1) 
				{
				Bug bug2=bugService.selectBugById(bug.getBug_id());
			    Project project=bug2.getProject();
				String 	project_name=project.getPro_name();
				String 	user_email=userService.findUserById(handler_id).getEmail();
				Email email=new Email();
				email.setSendperson(project_name+"组长");
				email.setTitle("DMS缺陷管理系统消息提醒");
				email.setText(project_name+"组长，给你分配了处理缺陷任务，请及时处理 ");
				email.email(user_email);//处理者邮箱
				mv.setViewName("redirect:/bug/selectBug");
				}
			else  if(user.getRole()==3)
				{
				Bug bug2=bugService.selectBugById(bug.getBug_id());
			    Project project=bug2.getProject();
				String 	project_name=project.getPro_name();
				String 	user_email=userService.findUserById(handler_id).getEmail();
				Email email=new Email();
				email.setSendperson(project_name+"组长");
				email.setTitle("DMS缺陷管理系统消息提醒");
				email.setText(project_name+"组长，给你分配了处理缺陷任务，请及时处理 ");
				email.email(user_email);//处理者邮箱
				mv.setViewName("redirect:/user/ManageBug");
				}
			else 
				{
			 
				Bug bug2=bugService.selectBugById(bug.getBug_id());
			    Project project=bug2.getProject();
				String 	project_name=project.getPro_name();
			 	String 	user_email=userService.findUserById(handler_id).getEmail();
				Email email=new Email();
				email.setSendperson(project_name+"组长");
				email.setTitle("DMS缺陷管理系统消息提醒");
				email.setText(project_name+"组长，给你分配了处理缺陷任务，请及时处理 ");
				email.email(user_email);//处理者邮箱
 		 
				mv.setViewName("redirect:/bug/selectBug");
				}
		}
		return mv;
		}
		// 返回
		
	 


	
	
	
	/********************************** 公共部分 *****************************************/

	// bug详情
	@RequestMapping(value = "/bug/detailBug")
	public ModelAndView detailProject(@ModelAttribute Bug bug, ModelAndView mv) {
		// 根据bug_id查询附件
		Bug target = bugService.selectBugById(bug.getBug_id());
		List<Bugfile> bugfiles = bugfileService.selectBugfileByBugId(bug.getBug_id());
		// 设置Model数据
		mv.addObject("bugfiles", bugfiles);
		mv.addObject("bug", target);
		// 设置跳转到修改页面
		mv.setViewName("bug/bugdetail");
		return mv;

	}

	/**
	 * 由于对象关联映射， 所以不能直接接收参数，需要创建对象
	 * @param handler_id2 
	 */
	private void genericAssociation(Integer pro_id, Integer pon_id,Integer result_id, Integer reporter_id, Integer handler_id,  Bug bug) {
		if (pro_id != null) {
			Project project = new Project();
			project.setPro_id(pro_id);
			bug.setProject(project);
		}
		if (pon_id != null) {
			Ponderance Ponderance = new Ponderance();
			Ponderance.setPon_id(pon_id);
			bug.setPonderance(Ponderance);
		}
		if (result_id != null) {
			result result = new result();
			
			result.setResult_id(result_id);
			bug.setResult(result);
		}

		if (reporter_id != null) {
			User reporter = new User();
			reporter.setUser_id(reporter_id);
			bug.setReporter(reporter);
		}

		if (handler_id != null) {
			User handler = new User();
			handler.setUser_id(handler_id);
			bug.setHandler(handler);
		}
	}

	// 跳转到用户登录页面
	@RequestMapping(value = "/project/statistics")
	public ModelAndView tostatistics(@RequestParam("pro_id") Integer pro_id, HttpSession session, ModelAndView mv) {

		session.removeAttribute("pro_id");
		session.setAttribute("pro_id", pro_id);
		Project project = projectService.selectProjectById(pro_id);
		mv.addObject("project", project);
		mv.setViewName("project/statistics");
		return mv;
	}
       
	@RequestMapping(value = "/bug/statistics")
	public ModelAndView statistics( HttpSession session, ModelAndView mv) {
		mv.setViewName("/bug/statistics");
		return mv;
	}
	
	
	// 图标统计：按缺陷级别
	@RequestMapping(value = "/project/countByPonderance")
	@ResponseBody
	public Object countByPonderance(Integer pro_id, HttpSession session, ModelAndView mv) {
		Bug bug = new Bug();
		if (session.getAttribute("pro_id") != null) {
			pro_id = (Integer) session.getAttribute("pro_id");
			Project project = new Project();
			project.setPro_id(pro_id);
			bug.setProject(project);// 设置项目
		}
		
		List<Map> serisData = new ArrayList<Map>();
		Map<String, Object> nummap = new HashMap<String, Object>();
		List<String> keyname = new ArrayList<String>();
		int count;
		List<Ponderance> Ponderances = ponderanceService.selectAllponderances();// 查询得到所有Ponderance
		for (Ponderance Ponderance : Ponderances) {// 遍历缺陷级别
			Map map = new HashMap();
			count = 0;
			bug.setPonderance(Ponderance);// 设置缺陷级别
			count = bugService.countbug(bug);// 查询个数
			map.put("value", count);
			map.put("name", Ponderance.getPon_name());
			keyname.add(Ponderance.getPon_name());
			serisData.add(map);
		}
		nummap.put("keyname", keyname);
		nummap.put("nummap", serisData);
		return nummap;
	}

	
	// 图标统计：按用户信息
		@RequestMapping(value = "/bug/priority") // 用于ajax获取数据
		@ResponseBody
		public Object usernumber(HttpSession session, ModelAndView mv) {
			
			
			int Newnum=0;
			int Assignednum=0;
			int Opennum=0;
			int Fixednum=0;
			int Rejectednum=0;
			int Postponednum=0;
			int Closednum=0;
			int Reopennum=0;
			 
			int num[]=new int[3];
			Bug bug1 = new Bug();
			PageModel pageModel = new PageModel();
			List<Bug> bugs= bugService.findBug(bug1, pageModel);
			for (Bug bug : bugs) { // 遍历用户
				switch (bug.getBug_status()) {
				case 1: Newnum++;break;
				case 2:Assignednum++;break;
				case 3:Opennum++;break;
				case 4:Fixednum++;break;
				case 5:Rejectednum++;break;
				case 6:Postponednum++;break;
				case 7:Closednum++;break;
				default:
					Reopennum++;
					break;
				}
			}
			Map<String, Object> nummap = new HashMap<String, Object>();
			nummap.put("Newnum", Newnum); // 向图中放入对象
			nummap.put("Assignednum", Assignednum);
			nummap.put("Opennum", Opennum++);
			nummap.put("Fixednum", Fixednum);
			nummap.put("Rejectednum",Rejectednum);
			nummap.put("Postponednum",Postponednum);
			nummap.put("Closednum",Closednum);
			nummap.put("Reopennum",Reopennum);
			return nummap;
		}
	
	
	
	// 图标统计：按提交人进行统计
	@RequestMapping(value = "/project/countByReporter")
	@ResponseBody
	public Object countByReporter(Integer pro_id, HttpSession session, ModelAndView mv) {
		Bug bug = new Bug();
		if (session.getAttribute("pro_id") != null) {
			pro_id = (Integer) session.getAttribute("pro_id");
			Project project = new Project();
			project.setPro_id(pro_id);
			bug.setProject(project);// 设置项目
		}
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> keyname = new ArrayList<String>();
		List<Integer> keyvalue = new ArrayList<Integer>();
		int count;
		List<User> users = userService.findAllUser();// 查询出所有用户
		for (User reporter : users) {// 遍历用户
			count = 0;
			bug.setReporter(reporter);// 设置用户
			count = bugService.countbug(bug);// 查询得到个数
			if (count != 0) {
				keyname.add(reporter.getUsername());
				keyvalue.add(count);
			}
		}
		map.put("keyusername", keyname);// 可能需要加tostring
		map.put("keynum", keyvalue);
		return map;
	}

	
	
	

	
	// 图标统计：按缺陷级别
		@RequestMapping(value = "/bug/countByPonderance")
		@ResponseBody
		public Object ByPonderance(HttpSession session, ModelAndView mv) {
			Bug bug = new Bug();
			List<Map> serisData = new ArrayList<Map>();
			Map<String, Object> nummap = new HashMap<String, Object>();
			List<String> keyname = new ArrayList<String>();
			int count;
			List<Ponderance> Ponderances = ponderanceService.selectAllponderances();// 查询得到所有Ponderance
			for (Ponderance Ponderance : Ponderances) {// 遍历缺陷级别
				Map map = new HashMap();
				count = 0;
				bug.setPonderance(Ponderance);// 设置缺陷级别
				count = bugService.countbug(bug);// 查询个数
				map.put("value", count);
				map.put("name", Ponderance.getPon_name());
				keyname.add(Ponderance.getPon_name());
				serisData.add(map);
			}
			nummap.put("keyname", keyname);
			nummap.put("nummap", serisData);
			return nummap;
		}
		
		
		// 图标统计：按缺陷级别
				@RequestMapping(value = "/bug/countByProject")
				@ResponseBody
				public Object ByPeoject(HttpSession session, ModelAndView mv) {
					Bug bug = new Bug();
					List<Map> serisData = new ArrayList<Map>();
					Map<String, Object> nummap = new HashMap<String, Object>();
					List<String> keyname = new ArrayList<String>();
					int count;
					List<Project> projects = projectService.selectAllProjects();// 查询得到所有Ponderance
					for (Project project : projects) {// 遍历缺陷级别
						Map map = new HashMap();
						count = 0;
						bug.setProject(project);;// 设置缺陷级别
						count = bugService.countbug(bug);// 查询个数
						map.put("value", count);
						map.put("name", project.getPro_name());
						keyname.add(project.getPro_name());
						serisData.add(map);
					}
					nummap.put("keyname", keyname);
					nummap.put("nummap", serisData);
					return nummap;
				}
		
		
		
		

	
	// 图标统计：按提交人进行统计
	@RequestMapping(value = "/bug/countByReporter")
	@ResponseBody
	public Object ByReporter(HttpSession session, ModelAndView mv) {
		Bug bug = new Bug();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> keyname = new ArrayList<String>();
		List<Integer> keyvalue = new ArrayList<Integer>();
		int count;
		List<User> users = userService.findAllUser();// 查询出所有用户
		for (User reporter : users) {// 遍历用户
			count = 0;
			bug.setReporter(reporter);// 设置用户
			count = bugService.countbug(bug);// 查询得到个数
			if (count != 0) {
				keyname.add(reporter.getUsername());
				keyvalue.add(count);
			}
		}
		map.put("keyusername", keyname);// 可能需要加tostring
		map.put("keynum", keyvalue);
		return map;
	}
	
	
	
	/*************************************
	 * user bug
	 **********************************/
	// 只显示该项目下的所有bug 点击序号

	// 显示所有bug，用户查询bug
	@RequestMapping(value = "/user/ManageBug")
	public String UserBug(Model model, Integer pageIndex, Integer pro_id, Integer pon_id,Integer reslut_id,
			Integer reporter_id, Integer handler_id, @ModelAttribute Bug bug, HttpSession session) {
	
		PageModel pageModel = new PageModel();
 
		List<Bug> bugs = bugService.findBug(bug, pageModel);
	 
		model.addAttribute("bugs", bugs);
	 
		return "bug/UManagebug"; 
	}

	// 只显示该项目下的所有bug 点击序号
	@RequestMapping(value = "/user/selectProjectbug")
	public String UserselectProjectBug(Model model, @RequestParam("pro_id") Integer pro_id, Integer pon_id,Integer result_id,
			Integer reporter_id, Integer handler_id, HttpSession session, Integer pageIndex, @ModelAttribute Bug bug) {
		this.genericAssociation(pro_id, pon_id,result_id, reporter_id, handler_id, bug);
		PageModel pageModel = new PageModel();
		System.out.println("getPageIndex = " + pageModel.getPageIndex());
		System.out.println("getPageSize = " + pageModel.getPageSize());
		System.out.println("getRecordCount = " + pageModel.getRecordCount());
		if (pageIndex != null) {
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询信息 */
		List<User> users = userService.findAllUser();
		List<Ponderance> Ponderances = ponderanceService.selectAllponderances();
		List<Bug> bugs = bugService.findBug(bug, pageModel);

		model.addAttribute("pro_id", pro_id);// 继续在此项目内进行查询
		model.addAttribute("bugs", bugs);
		model.addAttribute("users", users);
		model.addAttribute("ponderances", Ponderances);
		model.addAttribute("pageModel", pageModel);
		return "bug/Uprojectbug";

	}

	// 用户添加bug
	@RequestMapping(value = "/user/addBug")
	public ModelAndView addBug(String flag, Integer pro_id, Integer pon_id, Integer result_id, @ModelAttribute Bug bug,
			ModelAndView mv, HttpSession session1) {
		// 当flag==1时，跳转到添加bug页面
		if (flag.equals("1")) {
			List<Project> projects = projectService.selectAllProjects();
			List<Ponderance> Ponderances = ponderanceService.selectAllponderances();
			List<result> results = resultService.selectAllresults();
			mv.addObject("projects", projects);
			mv.addObject("ponderances", Ponderances);
			mv.addObject("results", results);
			mv.setViewName("bug/Uaddbug");
		} else {
			// 用户执行添加bug操作
			// 设置reporter
			User reporter = new User();
			// 得到当前用户的user_id
			int reporter_id = (int) session1.getAttribute("user_id");
			reporter.setUser_id(reporter_id);
			User user = userService.findUserById(reporter_id);
			user.setHostnumber(user.getHostnumber() + 1);
			userService.modifyUser(user);
			bug.setReporter(reporter);
			// 由于数据库handler_id不能为空，添加处理人时，直接指派给admin
			/*User handler = new User();
			// admin的user_id=1
			handler.setUser_id(1);
			bug.setHandler(handler);*/
			// 添加Project
			if (pro_id != null) {
				Project project = new Project();
				project.setPro_id(pro_id);
				bug.setProject(project);
			}
			// 添加Ponderance
			if (pon_id != null) {
				Ponderance Ponderance = new Ponderance();
				Ponderance.setPon_id(pon_id);
				bug.setPonderance(Ponderance);
			}
	 
			Integer cow = bugService.countbug(bug);
			// 已存在该bug
			if (cow != 0) {
				mv.addObject("message", "该缺陷已经存在");
				List<Project> projects = projectService.selectAllProjects();
				List<Ponderance> Ponderances = ponderanceService.selectAllponderances();
				mv.addObject("projects", projects);
				mv.addObject("ponderances", Ponderances);
				mv.setViewName("bug/Uaddbug");
			} else {
				bugService.addBug(bug);
				
				Project project=projectService.selectProjectById(pro_id);
				// 模糊查询
				Bug bug1 = bugService.selectBugByAdd(bug);
				// 精确查询
				Bug bug2 = bugService.selectBugById(bug1.getBug_id());
				mv.addObject("bug", bug2);
				
				String  reporter_name=userService.findUserById(reporter_id).getUsername();
				String project_name=project.getPro_name();
				Date date=new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			    String time = sdf.format(date);//设置缺陷提交时间
				
		 	Email email=new Email();
			email.setSendperson("admin");
			email.setTitle("DMS缺陷管理系统消息提醒");
			email.setText(reporter_name+"在"+time+"提交了有关"+project_name+"项目的缺陷，请及时分配复现人员 ");
			email.email(project.getManager().getEmail());//管理员邮箱
				// 跳转到添加附件页面
				mv.setViewName("bug/AdddetailBug");
			}
		}
		// 返回
		return mv;
	}


	// 显示所有bug，用户查询bug
	@RequestMapping(value = "/user/selectBug")
	public String UserselectBug(Model model, Integer pageIndex, Integer pro_id, Integer pon_id,Integer reslut_id,
			Integer reporter_id, Integer handler_id, @ModelAttribute Bug bug, HttpSession session) {
		// 模糊查询时判断是否有关联对象传递，如果有，创建并封装关联对象
		this.genericAssociation(pro_id, pon_id,reslut_id, reporter_id, handler_id, bug);

		// 创建分页对象
		PageModel pageModel = new PageModel();
	 
		 
		/** 查询信息 */
		List<User> users = userService.findAllUser();
		List<Project> projects = projectService.selectAllProjects();
		List<Ponderance> Ponderances = ponderanceService.selectAllponderances();
		List<Bug> bugs = bugService.findBug(bug, pageModel);
		session.setAttribute("bug", bug);
		model.addAttribute("bugs", bugs);
		model.addAttribute("users", users);
		model.addAttribute("projects", projects);
		model.addAttribute("ponderances", Ponderances);
		model.addAttribute("pageModel", pageModel);
		return "bug/Ubug"; 
	}
	
	// 查找当前用户需的任务（需要复现的bug列表）
		@RequestMapping(value = "/user/mission")
		public String Userselectmission(Model model, Integer pageIndex, @ModelAttribute Bug bug,
				String flag, Integer pro_id, Integer pon_id, Integer result_id,
				ModelAndView mv, HttpSession session) {
			// 模糊查询时判断是否有关联对象传递，如果有，创建并封装关联对象
			User host = new User();
			// 得到登录用户的user_id
			int user_id = (int) session.getAttribute("user_id");
		    
			List<Bug> bugs = bugService.selectBugByhandlerId(user_id);
			model.addAttribute("bugs", bugs);
			return "bug/Umission";
		}

	
		@RequestMapping(value = "/bug/updatebug")
		public ModelAndView update(String flag, Integer pro_id, Integer pon_id,Integer bug_status, Integer result_id, @ModelAttribute Bug bug,
				ModelAndView mv, HttpSession session) {
			// 当flag==1， 跳转页面
			if (flag.equals("1")) {
				
				Bug target = bugService.selectBugById(bug.getBug_id());
				List<User> users = userService.findAllUser();    
				List<Project> projects = projectService.selectAllProjects();
				List<Ponderance> Ponderances = ponderanceService.selectAllponderances();
				List<result> results = resultService.selectAllresults();
				mv.addObject("results", results);
				mv.addObject("projects", projects);
				mv.addObject("ponderances", Ponderances);
				mv.addObject("users", users);
				// 设置Model数据
				mv.addObject("bug", target);
				// 设置跳转到修改页面
				mv.setViewName("bug/Uupdatebug");
			} else {
				int handler_id = (int) session.getAttribute("user_id");
				User user = userService.findUserById(handler_id);
				user.setHandlernumber(user.getHandlernumber()+ 1);
				userService.modifyUser(user);
				if (pon_id != null) {
					Ponderance Ponderance = new Ponderance();
					Ponderance.setPon_id(pon_id);
					bug.setPonderance(Ponderance);
				}
			/*	if(bug.getResult_id()==1)
				{
					int user_id= (int) session.getAttribute("user_id");
					User user=userService.findUserById(user_id);
					user.setHandlernumber(user.getHandlernumber()+1);
					userService.modifyUser(user);
				
				}*/
				bug.setBug_status(bug_status);
				
				if (result_id != null) {
					result result = new result();
					result.setResult_id(result_id);
					bug.setResult(result);
				}
				bugService.modifyBug(bug);
				mv.setViewName("redirect:/user/mission");
			 
			}
			// 返回
			return mv;
		}
		
		// 查找当前用户提交的缺陷（bug列表）
		@RequestMapping(value = "/user/submit")
		public String Userselectsubmit(Model model, Integer pageIndex, @ModelAttribute Bug bug, HttpSession session) {
			// 模糊查询时判断是否有关联对象传递，如果有，创建并封装关联对象
			User host = new User();
			// 得到登录用户的user_id
			int user_id = (int) session.getAttribute("user_id");
			
			List<Bug> bugs = bugService.selectBugByreporterId(user_id);
			
			model.addAttribute("bugs", bugs);
			return "bug/Usubmit";
		}

		// 用户修改提交的bug
		@RequestMapping(value = "/bug/amendbugs")
		public ModelAndView amendbugs(String flag, Integer pro_id, Integer pon_id, Integer handler_id,
				HttpSession session, @ModelAttribute Bug bug, ModelAndView mv) {
			// 当flag==1， 跳转页面
			if (flag.equals("1")) {
				// 根据id查询缺陷
				Bug target = bugService.selectBugById(bug.getBug_id());
				List<User> users = userService.findAllUser();
				List<Project> projects = projectService.selectAllProjects();
				List<Ponderance> Ponderances = ponderanceService.selectAllponderances();
				List<result> results = resultService.selectAllresults();
				
				mv.addObject("results", results);
				mv.addObject("projects", projects);
				mv.addObject("ponderances", Ponderances);
				mv.addObject("users", users);
				// 设置Model数据
				mv.addObject("bug", target);
				// 设置跳转到修改页面
				mv.setViewName("bug/amendbugs");
			} else {
				if (pon_id != null) {
					Ponderance Ponderance = new Ponderance();
					Ponderance.setPon_id(pon_id);
					bug.setPonderance(Ponderance);
				}
				bugService.modifyBug(bug);
				System.out.println(bug);
				if (session.getAttribute("user_id") != null) {
					Bug target = new Bug();
					Project project = new Project();
					project.setPro_id(pro_id);
					target.setProject(project);
					PageModel pageModel = new PageModel();
					/** 查询信息 */
					List<User> users = userService.findAllUser();
					List<Ponderance> Ponderances = ponderanceService.selectAllponderances();
					List<Bug> bugs = bugService.findBug(target, pageModel);
					mv.addObject("pro_id", pro_id);// 继续在此项目内进行查询
					mv.addObject("bugs", bugs);
					mv.addObject("users", users);
				
					mv.addObject("ponderances", Ponderances);
					mv.setViewName("redirect:/user/submit");
				} else {
					mv.setViewName("redirect:/user/submit");
				}
			}
			// 返回
			return mv;
		}
		
	
	
}
