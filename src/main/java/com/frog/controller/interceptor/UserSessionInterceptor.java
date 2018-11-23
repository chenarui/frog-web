package com.frog.controller.interceptor;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.frog.common.CommonUtils;

public class UserSessionInterceptor extends HandlerInterceptorAdapter {
	public String[] allowUrls;

	public void setAllowUrls(String[] allowUrls) {
		this.allowUrls = allowUrls;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
//		Date date = CommonUtils.getDateFormat("2017-08-05 08:00:00", "yyyy-MM-dd HH:mm:ss");
//		long systime = System.currentTimeMillis();
//		if(systime>date.getTime()){
//			return false;
//		}
		String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
		System.out.println("请求方式"+request.getMethod());
		// 如果有允许通过的url 则直接通过
		if (null != allowUrls && allowUrls.length >= 1) {
			for (String url : allowUrls) {
				if (requestUrl.contains(url)) {
					return true;
				}
			}
		}
//		int user_id = CommonUtils.parseInt(String.valueOf(request.getSession().getAttribute("user_id")), 0);
//		if (user_id == 0) {
//			response.setCharacterEncoding("utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script language=\"JavaScript\">window.location.href='../home/homepage?needlogin=1';</script>");
//			out.flush();
//			out.close();
//			return false;
//		}
		System.out.println("userWebRequestUrl==="+requestUrl);
		return true;
	}

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}
}
