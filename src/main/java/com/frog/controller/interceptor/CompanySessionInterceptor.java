package com.frog.controller.interceptor;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSON;
import com.frog.common.CommonUtils;
import com.frog.common.Result.ApiResult;


/**
 * 运营管理后台拦截器
 * 
 * @author guok
 *
 */
public class CompanySessionInterceptor extends HandlerInterceptorAdapter {
	public String[] allowUrls;

	public void setAllowUrls(String[] allowUrls) {
		this.allowUrls = allowUrls;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
		// 如果有允许通过的url 则直接通过
		if (null != allowUrls && allowUrls.length >= 1) {
			for (String url : allowUrls) {
				if (requestUrl.contains(url)) {
					return true;
				}
			}
		}
//		int admin_id = CommonUtils.parseInt(String.valueOf(request.getSession().getAttribute("companyId")), 0);
//		if (admin_id == 0) {
//			String XRequested =request.getHeader("X-Requested-With");
//            if("XMLHttpRequest".equals(XRequested)){
//            	PrintWriter out = response.getWriter();
//    			ApiResult result = new ApiResult(100,"请重新登陆");
//    			out.write(JSON.toJSONString(result));
//    			out.flush();
//    			out.close();
//            }else{
//            	response.sendRedirect(CommonUtils.getWebRootUrl()+"company/login");
//            }
//			return false;
//		}
		System.out.println("companyRequestUrl==="+requestUrl);
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
