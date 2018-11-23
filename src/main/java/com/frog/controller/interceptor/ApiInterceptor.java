package com.frog.controller.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSON;
import com.frog.common.CommonUtils;
import com.frog.common.Constant;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Code;
import com.frog.common.Result.Msg;
import com.frog.model.UserInfo;
import com.frog.service.UserService;

/**
 * 运营管理后台拦截器
 * 
 * @author wangcl
 *
 */
public class ApiInterceptor extends HandlerInterceptorAdapter {
	
	private Logger logger = LogManager.getLogger(ApiInterceptor.class);

	public String[] commonUnSession;

	public String[] userUnSession;

	public String[] driverUnSession;
	

	@Resource
	private UserService userService;
	
	public void setCommonUnSession(String[] commonUnSession) {
		this.commonUnSession = commonUnSession;
	}

	public void setUserUnSession(String[] userUnSession) {
		this.userUnSession = userUnSession;
	}

	public void setDriverUnSession(String[] driverUnSession) {
		this.driverUnSession = driverUnSession;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String app_id = request.getParameter("app_id");
		Long time_stamp = CommonUtils.parseLong(request.getParameter("time_stamp"), 0);
		String nonce_str = request.getParameter("nonce_str");
		String sign = request.getParameter("sign");
		if(app_id == null || app_id.isEmpty()){
			System.out.println("app_id参数为空");
		}
		if(time_stamp == null || time_stamp==0){
			System.out.println("time_stamp参数为空");
		}
		if(nonce_str == null || nonce_str.isEmpty()){
			System.out.println("nonce_str参数为空");
		}
		if(sign == null || sign.isEmpty()){
			System.out.println("sign参数为空");
		}
		if(StringUtils.isBlank(app_id)||time_stamp==null||StringUtils.isBlank(nonce_str)||StringUtils.isBlank(sign)){
			System.out.println("参数为空1");
			ApiResult result = new ApiResult(Code.MissParam,Msg.MissParam);
			returnJson(response, JSON.toJSONString(result));
			return false;
		}
		int clentType = 0;
		String appKey = null;
		if (Constant.WX_FROG_APPID.equals(app_id)) {
			clentType = 1;
			appKey = Constant.WX_FROG_APPKEY;
		} else if (Constant.IOS_FROG_APPID.equals(app_id)) {
			clentType = 1;
			appKey = Constant.IOS_FROG_APPKEY;
		} else if(Constant.ANDROID_FROG_APPID.equals(app_id)){
			clentType = 1;
		appKey = Constant.ANDROID_FROG_APPKEY;
		}else{
			System.out.println("参数为空2");
			ApiResult result = new ApiResult(Code.MissParam,Msg.MissParam);
			returnJson(response, JSON.toJSONString(result));
			return false;
		}
		Map<String,String> map = CommonUtils.getAllParams(request);
		String ksign = CommonUtils.createSign(map,appKey);
		System.out.println(ksign+"  "+sign);
		if(!ksign.equals(sign)){
			ApiResult result = new ApiResult(Code.SignError,Msg.SignErr);
			returnJson(response, JSON.toJSONString(result));
			return false;
		}
		String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
		System.out.println("requestUrl==="+requestUrl);
		if (null != commonUnSession && commonUnSession.length >= 1) {
			for (String url : commonUnSession) {
				if (requestUrl.contains(url)) {
					return true;
				}
			}
		}
		//校验session是否存在
		if(clentType==1){
			if (null != userUnSession && userUnSession.length >= 1) {
				for (String url : userUnSession) {
					if (requestUrl.contains(url)) {
						return true;
					}
				}
			}
			String user_id = request.getParameter("user_id");
			if(StringUtils.isBlank(user_id)){
				System.out.println("参数为空3");
				ApiResult result = new ApiResult(Code.MissParam,Msg.MissParam);
				returnJson(response, JSON.toJSONString(result));
				return false;
			}
			UserInfo  userInfo = userService.selectUserByUserId(CommonUtils.parseInt(user_id, 0));
			if (userInfo == null) {
				ApiResult result = new ApiResult(Code.NoAuth,Msg.NoAuth);
				returnJson(response, JSON.toJSONString(result));
				return false;
			}
		
		}
		
		
		return true;
	}

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}
	
	private void returnJson(HttpServletResponse response, String json) throws Exception{
	        PrintWriter writer = null;
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html; charset=utf-8");
	        try {
	            writer = response.getWriter();
	            writer.print(json);
	
	        } catch (IOException e) {
	            logger.error("response error",e);
	        } finally {
	            if (writer != null)
	                writer.close();
	        }
	   }
}
