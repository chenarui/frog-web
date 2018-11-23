package com.frog.controller.api.user;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.frog.common.Constant;
import com.frog.common.HttpUtil;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Code;
import com.frog.common.Result.Msg;
import com.frog.model.FrogAwards;
import com.frog.model.FrogTake;
import com.frog.model.UserChip;
import com.frog.model.UserInfo;
import com.frog.service.StatisticsService;
import com.frog.service.TaskTakeService;
import com.frog.service.UserChipService;
import com.frog.service.UserService;
import com.frog.utils.AESUtil;
import com.frog.utils.FileUpLoad;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/api/user/security")
public class UserController {
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private UserChipService userChipService;
	
	@Autowired
	private StatisticsService statisticsService;
	
	@Autowired
	private TaskTakeService takeService;
	/**
	 * 
	 * @param phone
	 * @param vCode
	 * @param user_id
	 * @param type 0小程序 1app
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/codeLogin")
	@ResponseBody
	public ApiResult codeLogin(String phone, String vCode,Integer user_id,Integer type) throws Exception {
		if (phone == null || vCode == null||type==null||vCode=="") {
			logger.error("参数phone{}" + phone + "参数VCode" + vCode+"参数type{}"+type);
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		String code = userService.getCode(phone);
		if (code == null) {
			logger.error("手机号" + phone + "验证码都过期了你还登陆啥");
			return new ApiResult(2, "验证码已过期,请重新发送");
		}
		if (!code.equals(vCode)) {
			return new ApiResult(2, "验证码不匹配,请重新输入");
		}
		/**
		 * 小程序
		 */
		if (type==0) {
			if (user_id==null) {
				logger.error("参数user_id{}"+user_id);
				return new ApiResult(Code.MissParam, Msg.MissParam);
			}
			UserInfo userInfo = userService.selectUserByUserId(user_id);
			if (userInfo.getPhone() !=null) {
				logger.info("用户ID{}"+user_id+",已经绑定手机了");
			}else {
				logger.info("用户ID{}"+user_id+",开始绑定手机");
				userService.buildPhone(phone, user_id);
			}
			return new ApiResult();
		}
	//app登录
		if (type==1) {
			UserInfo userInfo=new UserInfo();
			userInfo=userService.selectUserInfoByPhone(phone);
			if(userInfo==null){
				UserInfo user=new UserInfo();
				user.setPhone(phone);
				userService.save(user);
			}
			userInfo=userService.selectUserInfoByPhone(phone);
			UserChip userChip = userChipService.selectUserChipByUser(userInfo.getUser_id());
			if(userChip==null){
				UserChip chip=new UserChip();
				chip.setUser_id(userInfo.getUser_id());
				chip.setUpdate_time(new Date());
				userChipService.insert(chip);
			}
			int result =userService.updateInviteID(200000+userInfo.getUser_id(),userInfo.getUser_id());
			return userService.userLoginInfo(phone,type);
		}
		
		return new ApiResult();
	}

	/**
	 * 小程序专用 微信公众号获取用户的基本信息授权登录 获取用户的基本信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getUserInfo")
	@ResponseBody
	public ApiResult wxUserInfo(String code,String iv,String encryptedData) throws Exception {
		// String
		Map<String, String> map = new HashMap<String, String>();
		map.put("appid", Constant.AppID);
		map.put("secret", Constant.AppSecret);
		map.put("js_code", code);
		map.put("grant_type", "authorization_code");
		String result = HttpUtil.get(Constant.wxUrl, map);
		System.out.println(result);
		JSONObject jsonObject = JSONObject.parseObject(result);
//		String openid = (String) jsonObject.get("openid");
		String sessionKey = (String) jsonObject.get("session_key");
//		JSONObject jsObject = new JSONObject();
		jsonObject.put("sessionKey", sessionKey);
//		jsObject.put("openid", openid);\
//		System.out.println("--------------------------------");
//		org.json.JSONObject object = AESUtil.instance.decodeUserInfo(encryptedData, iv, sessionKey);
//		System.out.println("--------------------------------");
		ApiResult apiResult = new ApiResult();
		apiResult.setResult(jsonObject);
		return apiResult;
	}

	/**
	 * app 和小程序 统一过程 第三方注册接口 0 微信不授权登录 1 app端
	 */
	
	@RequestMapping("/thirdRegisterLogin")
	@ResponseBody
	public ApiResult saveUserInfo(String openId, String unionId,String pic_url, String nick_name, String sex) {
		if (openId == null || openId =="") {
			logger.info("用户的openID{}" + openId);
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		//拉取用户基本信息
		UserInfo info1 = userService.getUserInfoByOpenId(openId);
		UserInfo info = userService.getUserInfoByUnionId(unionId);
		ApiResult apiResult = new ApiResult();
		Map<String, Object> map = new HashMap<String, Object>();
		if (info !=null) {
				logger.info("用户的openId{}"+openId+"已经注册");
				UserChip userChip=userChipService.selectUserChipByUser(info.getUser_id());
				map.put("userInfo", info);
				map.put("userChip", userChip);
				
		}
		int d=0;
		if (info==null) {	
//			if (pic_url ==null || nick_name==null) {
//				logger.error("用户的头像呢{}"+pic_url+"用户的昵称呢{}"+nick_name);
//				return new ApiResult(Code.MissParam, "用户的头像和您称都没有");
//			}
			logger.info("用户第一次登陆时间"+System.currentTimeMillis()+",openId为{}"+openId);
			if(info1!=null){
				info1.setUnion_id(unionId);
				if(userService.update(info1)){
					d=1;
				}
			}else{
				UserInfo userInfo = new UserInfo();
				userInfo.setAdd_time(new Date());
				if(nick_name == null || nick_name.isEmpty()){
					userInfo.setNick_name("");
				}else{
					userInfo.setNick_name(nick_name);
				}
				
				if(pic_url == null || pic_url.isEmpty()){
					userInfo.setPic_url("");
				}else{
					userInfo.setPic_url(pic_url);
				}
				userInfo.setUnion_id(unionId);
				userInfo.setSex(sex);
				userInfo.setOpen_id(openId);
				userInfo.setFirst_login(0);
				d = userService.login(userInfo);
			}
			if(d==1){
				UserInfo info2 = userService.getUserInfoByUnionId(unionId);
//				UserInfo info1 = userService.getUserInfoByOpenId(openId);
//				if(info1==null){
//					return new ApiResult(3,"登录失败");
//				}
				UserChip userChip=new UserChip();
				userChip.setUser_id(info2.getUser_id());
				userChip.setUpdate_time(new Date());
				userChipService.insert(userChip);
				int result =userService.updateInviteID(200000+info2.getUser_id(),info2.getUser_id());
				return userService.userLoginInfo(info.getUser_id().toString(),0);
			}else{
				return new ApiResult(3,"登录失败");
			}
		}
		apiResult.setResult(map);
		return  apiResult;

	}
	//拉取用户基本信息
	@RequestMapping("/getUserPersonalInfo")
	@ResponseBody
	public ApiResult getPersonalInfo(Integer user_id){
		if (user_id==null) {
			return new ApiResult(Code.MissParam,Msg.MissParam );
		}
		return userService.userLoginInfo(user_id.toString()	,0);
	}
	@RequestMapping("/myWaCoin")
	@ResponseBody
	public ApiResult myWacoin(@RequestParam(defaultValue="1") Integer page,Integer user_id){
		if (user_id==null) {
			return new ApiResult(Code.MissParam,"暂无此人");
		}
		List<FrogAwards> myAwardsList=userService.getMyWaCoinDesc(user_id, page);
		if (myAwardsList==null) {
			return new ApiResult(2,"没有更多了");
		}
		Map<String, Object> map= new HashMap<String,Object>();
		UserInfo userInfo=userService.selectUserByUserId(user_id);
		map.put("myAwardsList", myAwardsList);
		map.put("userInfo", userInfo);
		ApiResult apiResult= new ApiResult();
		apiResult.setResult(map);
		return apiResult;
	}

	@Value("${uploadFilePath}")
	private String uploadFilePath;
	@Value("${fileRootUrl}")
	private String fileRootUrl;
	@RequestMapping("/updateIcon")
	@ResponseBody
	public ApiResult updateIcon(@RequestParam("image")CommonsMultipartFile file,String user_id){
		ApiResult apiResult = new ApiResult();
		Map<String,String> data = new HashMap<>();
		String fileName = user_id+new Date().getTime()/1000+".jpg";
		try {
			String result = FileUpLoad.uploadImage(file, uploadFilePath, "userimage",fileName);
			System.out.println("头像上传结果:"+result);
			data.put("image", fileRootUrl+"userimage"+"/"+fileName);
			data.put("timestamp", new Date().getTime()+"");
			apiResult.setResult(data);
		} catch (IOException e) {
			e.printStackTrace();
			apiResult.setCode(3);
			apiResult.setMessage("上传错误");
			return apiResult;
		}
		UserInfo userInfo = new UserInfo();
		userInfo.setPic_url(data.get("image"));
		userInfo.setUser_id(Integer.valueOf(user_id));
		userService.update(userInfo);
		return apiResult;
	}
	
	@RequestMapping("/updateUserNickName")
	@ResponseBody
	public ApiResult updateUserInfo(Integer user_id,String nickName){
		userService.updateUserNickName(nickName, user_id);
		return new ApiResult();
	}
	
	@RequestMapping("/updateUserPhone")
	@ResponseBody
	public ApiResult updateUserPhone(Integer user_id,String phone){
//		UserInfo userInfo = new UserInfo();
//		userInfo.setUser_id(Integer.valueOf(user_id));
//		userInfo.setPhone(phone);
//		if(userService.update(userInfo)){
//			return new ApiResult();
//		}
		userService.updateUserPhone(phone, user_id);
		return new ApiResult();
	}
	
	@RequestMapping("/getStatistic")
	@ResponseBody
	public ApiResult getStaticstic(Integer user_id){
		ApiResult result = new ApiResult();
		Map<String,Object> map = new HashMap<>();
		map.put("tasktotalnum", statisticsService.getTaskNumThisWeek(user_id));
		map.put("totaldistance", statisticsService.getThisWeekDistance(user_id));
		map.put("ordernum", statisticsService.getThisWeekOrder(user_id));
		map.put("totalcoins", statisticsService.getThisWeekWaCoins(user_id));
		map.put("rankbeans", statisticsService.getOrderRankBeans());
		result.setResult(map);
		return result;
	}
	
	@RequestMapping("/getUserTasks")
	@ResponseBody
	public ApiResult getUserTasks(Integer user_id,Integer page){
		ApiResult result = new ApiResult();
		Map<String,Object> map = new HashMap<>();
		map.put("completetask", statisticsService.getAllTakeHiss(user_id, page,2));
		map.put("goingtask", statisticsService.getAllTakeHiss(user_id, page,0));
		result.setResult(map);
		return result;
		
	}
}
