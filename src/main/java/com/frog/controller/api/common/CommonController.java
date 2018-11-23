package com.frog.controller.api.common;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.frog.common.CommonUtils;
import com.frog.common.Constant;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Code;
import com.frog.common.Result.Msg;
import com.frog.common.Result.ResponseType;
import com.frog.model.UserInfo;
import com.frog.service.CommonService;
import com.frog.service.UserService;

@Controller
@RequestMapping("/api/common/sys")
public class CommonController {
	private Logger logger = LoggerFactory.getLogger(CommonController.class);
	@Autowired
	private CommonService commonService;
	@Autowired
	private UserService userService;

/**
 * 
 * @param phone
 * @param type 0 app  1 微信小程序
 * @return
 * @throws Exception
 */
	@RequestMapping("/getCode")
	@ResponseBody
	public ApiResult getVcode(String phone, Integer type) throws Exception {
		if (phone == null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		UserInfo userInfo = userService.selectUserInfoByPhone(phone);
		String code = CommonUtils.getRandomVcode();
		// 证明第一次登陆 是注册 app端
		if(type==0){
			if (userInfo == null) {
				UserInfo usInfo = new UserInfo();
				usInfo.setPhone(phone);
				usInfo.setAdd_time(new Date());
			
				int res = commonService.sendConde(phone, code);
				if (res == 0) {
					logger.info("注册验证码发送吃成功");
					userService.save(usInfo);
					return new ApiResult(1, "验证码发送成功,请注意查收..");
				}
				logger.error("注册验证码发送失败..");
				return new ApiResult(2, "今天发送验证码已到上限,请明天再试..");
			}
		}
		/**
		 * 小程序绑定手机
		 */
		if (type==1) {
		
			int res = commonService.sendConde(phone, code);
			if (res == 0) {
				logger.info("注册验证码发送吃成功");
				return new ApiResult(1, "验证码发送成功,请注意查收..");
			}
			logger.error("注册验证码发送失败..");
			return new ApiResult(2, "今天发送验证码已到上限,请明天再试..");
		
		}
		
		// 这是登录验证码
		int res = commonService.sendConde(phone, code);

		if (res == 0) {
			logger.info("登录验证码发送成功");
			return new ApiResult(1, "验证码发送成功,请注意查收..");
		}
		logger.error("登录验证码发送失败..");
		return new ApiResult(2, "今天发送验证码已到上限,请明天再试..");
	}

//	@RequestMapping("/getTest")
//	@ResponseBody
//	public Response getTest(String phone, String type) throws Exception {
//		if (phone == null) {
//			return Response.success(ResponseType.EMPTY_CODE.getCode());
//		}
//		UserInfo userInfo = userService.selectUserInfoByPhone(phone);
//		String code = CommonUtils.getRandomVcode();
//		// 证明第一次登陆 是注册
//		if (userInfo == null) {
//			UserInfo usInfo = new UserInfo();
//			usInfo.setPhone(phone);
//			usInfo.setAdd_time(new Date());
//		
//			int res = commonService.sendConde(phone, code);
//			if (res == 0) {
//				logger.info("注册验证码发送吃成功");
//				userService.save(usInfo);
//				return Response.success();
//			}
//			logger.error("注册验证码发送失败..");
//			return Response.fail("验证吗发送上限");
//		}
//		// 这是登录验证码
//		int res = commonService.sendConde(phone, code);
//		
//		if (res == 0) {
//			logger.info("登录验证码发送成功");
//			return Response.success("验证码发送成功");
//		}
//		logger.error("登录验证码发送失败..");
//		return Response.fail("今天发送验证码已到上限,请明天再试..");
//	}

}
