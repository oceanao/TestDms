package com.market.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthorizedInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	   
		
		String ad_username =  (String)request.getSession().getAttribute("ad_username");   
	    String username =  (String)request.getSession().getAttribute("username");   
        if(ad_username == null&&username == null){  	           
           request.setAttribute("message", "请先登录再访问网站!");
   		   request.getRequestDispatcher("/user/login").forward(request, response);
            return false;  
        }else  
            return true;  
	}
}
