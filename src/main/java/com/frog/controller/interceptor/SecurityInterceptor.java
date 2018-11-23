package com.frog.controller.interceptor;

import java.io.IOException; 
import java.io.PrintWriter; 
import java.util.Date; 
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext; 
import org.springframework.web.context.support.WebApplicationContextUtils; 
import org.springframework.web.servlet.HandlerInterceptor; 
import org.springframework.web.servlet.ModelAndView; 

import com.alibaba.fastjson.JSON;
import com.frog.common.CommonUtils;
import com.frog.common.Constant;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Code;
import com.frog.common.Result.Msg;

public class SecurityInterceptor implements HandlerInterceptor{ 
    private Integer ipLimitCount = 10; 
    private Integer userLimitCount = 10; 
    private Set<String> methodSet;
    @Resource
    private RequestCountRpcService requestCountRpcService; 




    public String getRemoteHost(javax.servlet.http.HttpServletRequest request){ 
        String ip = request.getHeader("x-forwarded-for"); 
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
            ip = request.getHeader("Proxy-Client-IP"); 
        } 
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
            ip = request.getHeader("WL-Proxy-Client-IP"); 
        } 
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
            ip = request.getRemoteAddr(); 
        } 
        return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip; 
    } 

    @Override 
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
            throws Exception { 
        String phone = request.getParameter("phone"); 
        if (phone==null) {
        	 PrintWriter out = null; 
             try { 
                 out = response.getWriter(); 
                 response.setContentType("application/json;charset=UTF-8");   
                 response.setHeader("Cache-Control", "no-cache");   
                 out.write(JSON.toJSONString(new ApiResult(Code.MissParam, Msg.MissParam))); 
             } catch (IOException e) { 
                 e.printStackTrace(); 
             }finally{ 
                 if(out != null) 
                     out.close(); 
             } 
             return false; 
		}
//        String mn = request.getParameter("mn"); 
//        if(CommonUtils.isEmptyString(mn)){ 
//            return true; 
//        }  
//        if(!methodSet.contains(mn)){ 
//            return true;  
//        }  
        String host = getRemoteHost(request); 

//        ResponseVoRpc responseVoRpc = new ResponseVoRpc(); 
        if(isLimitIp(host)){ 
            PrintWriter out = null; 
            try { 
                out = response.getWriter(); 
                response.setContentType("application/json;charset=UTF-8");   
                response.setHeader("Cache-Control", "no-cache");   
                out.write(JSON.toJSONString(new ApiResult(Code.CODE_COMMON_FAILED, "同一ip验证码发送过多"))); 
            } catch (IOException e) { 
                e.printStackTrace(); 
            }finally{ 
                if(out != null) 
                    out.close(); 
            } 

            return false; 
        } 

        if(isLimitUser(phone)){ 
            PrintWriter out = null; 
            try { 
                out = response.getWriter(); 
                response.setContentType("application/json;charset=UTF-8");   
                response.setHeader("Cache-Control", "no-cache");   
                out.write(JSON.toJSONString(new ApiResult(Code.CODE_COMMON_FAILED, "电话号验证码过于频繁已被限制"))); 
            } catch (IOException e) { 
                e.printStackTrace(); 
            }finally{ 
                if(out != null) 
                    out.close(); 
            } 
            return false; 
        } 

        requestCountRpcService.ipCount(host, 1); 
        requestCountRpcService.userCount(phone, 1); 
        return true; 
    } 

    private boolean isLimitUser(String phone) { 
        String key =CommonUtils.getTimeFormat(new Date(), "yyyyMMdd")+Constant.USER_LIMIT_KEY_SUFFIX; 
//        String key=phone+CommonUtils.getTimeFormat(new Date(), "yyyyMMdd")+Constant.USER_LIMIT_KEY_SUFFIX; 
    	Integer count = requestCountRpcService.get(key, phone); 
        if(count>=userLimitCount){ 
            return true; 
        } 
        return false; 
    } 

    private boolean isLimitIp(String host) { 
        String key = CommonUtils.getTimeFormat(new Date(), "yyyyMMdd")+Constant.IP_LIMIT_KEY_SUFFIX; 
        Integer count = requestCountRpcService.get(key, host); 
        if(count>=ipLimitCount){ 
            return true; 
        } 
        return false; 
    } 

    @Override 
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
            ModelAndView modelAndView) throws Exception { 

    } 

    @Override 
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) 
            throws Exception { 

    } 

    public Integer getIpLimitCount() { 
        return ipLimitCount; 
    } 

    public void setIpLimitCount(Integer ipLimitCount) { 
        this.ipLimitCount = ipLimitCount; 
    } 

    public Integer getUserLimitCount() { 
        return userLimitCount; 
    } 

    public void setUserLimitCount(Integer userLimitCount) { 
        this.userLimitCount = userLimitCount; 
    } 

    public Set<String> getMethodSet() { 
        return methodSet; 
    } 

    public void setMethodSet(Set<String> methodSet) { 
        this.methodSet = methodSet; 
    }

}
