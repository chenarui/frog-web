package com.frog.controller.qr.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.jboss.netty.handler.codec.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frog.common.Result.Code;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Msg;

@Controller
@RequestMapping("/down")
public class DownLoadAppController {
	  /**@param apptype 0 用户端 1 司机端
     * 
     * @param type 0 IOS 1 android
     * @return
	 * @throws IOException 
     */
    @RequestMapping("/downloadApp")
    @ResponseBody
    public Object downloadApp(Integer type,Integer apptype,HttpServletResponse response) throws IOException{
    	String baseUrl = null;
    	 ApiResult apiResult= new ApiResult();
    	 Map<String, Object>map= new HashMap<String,Object>();
    	if (type==null||apptype==null) {
    		baseUrl="http://sj.qq.com/myapp/detail.htm?apkName=com.ds.frog.driver";
    		map.put("baseUrl", baseUrl);
    		apiResult.setResult(map);
    		return apiResult;
		}
    	switch (type) {
		case 0:
			if (apptype==0) {
				baseUrl="";
			}
			if (apptype==1) {
				baseUrl="";
			}
			break;
       case 1:
    	   if (apptype==0) {
			baseUrl="http://www.starswe.com/android_frog_user.html";
    	   }
    	   if (apptype==1) {
    		   baseUrl="http://www.starswe.com/android_frog_driver.html";
    	   }
    	   break;
    	}
    	 if (baseUrl==null) {
 			return new ApiResult(2, "下载失败");
 		}	   
    	
    	 map.put("baseUrl", baseUrl);
    	 apiResult.setResult(map);
    	 return apiResult;
    }

}
