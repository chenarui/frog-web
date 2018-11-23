package com.frog.controller.api.user;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.frog.common.MD5Util;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Code;
import com.frog.common.Result.Msg;
import com.frog.model.ExchangeInfo;
import com.frog.model.FrogActivityBean;
import com.frog.model.FrogActivityEvent;
import com.frog.model.FrogActivityEventPlace;
import com.frog.model.FrogActivityUser;
import com.frog.model.FrogGoods;
import com.frog.model.FrogPlay;
import com.frog.model.FrogTask;
import com.frog.model.TaskAward;
import com.frog.model.UserAddress;
import com.frog.model.UserInfo;
import com.frog.service.ExchangeInfoService;
import com.frog.service.FrogActivityEventPlaceService;
import com.frog.service.FrogActivityEventService;
import com.frog.service.FrogActivityService;
import com.frog.service.FrogActivityUserService;
import com.frog.service.FrogGoodService;
import com.frog.service.FrogPlayService;
import com.frog.service.PushService;
import com.frog.service.TaskAwardService;
import com.frog.service.TaskService;
import com.frog.service.UserAddressService;
import com.frog.service.UserService;
import com.frog.utils.FileUpLoad;

@Controller
@RequestMapping(value = "/user/frogShop")
public class FrogShoppingController {
	private Logger   logger   =  LoggerFactory.getLogger(FrogShoppingController.class);
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private FrogGoodService frogGoodService;
	@Autowired
	private UserService userService;
	@Autowired
	private ExchangeInfoService exchangeInfoService;
	@Autowired
	private	TaskService taskService;
	@Autowired 
	private FrogActivityService frogActivityService;
	@Autowired
	private PushService pushService;
	@Autowired
	private TaskAwardService taskAwardService;
	
	@Autowired
	private FrogActivityUserService taskUserService;
	@Autowired
	private FrogActivityEventService activityEventServer;
	
	@Autowired
	private FrogActivityEventPlaceService eventPlaceService;
	
	@Autowired
	private FrogPlayService playService;
	
	@RequestMapping("/getUserInfo")
	@ResponseBody
	public ApiResult getUserInfo(Integer user_id){
		if(user_id==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}		
		UserInfo userInfo=userService.selectUserByUserId(user_id);
		ApiResult apiResult=new ApiResult();
		apiResult.setResult(userInfo);
		return apiResult;
	}
	//鍟嗗搧鍒楄〃
	@RequestMapping("/goodsList")
	@ResponseBody
	public ApiResult goodsList(){
		List<FrogGoods> list =frogGoodService.selectGoods();
		if(list==null){
			return new ApiResult(Code.Success,"鍟嗗搧鍒楄〃涓虹┖");
		}
		ApiResult apiResult=new ApiResult();
		apiResult.setResult(list);
		return apiResult;
	}
	//鍟嗗搧鏌ョ湅
	@RequestMapping("/selectGood")
	@ResponseBody
	public ApiResult selectGood(Integer good_id){
		if(good_id==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		
		FrogGoods frogGood= frogGoodService.selectGoodByGoodId(good_id);
		if(frogGood==null){
			return new ApiResult(101,"鍙傛暟鏈夎");
		}
		ApiResult apiResult=new ApiResult();
		apiResult.setResult(frogGood);
		return apiResult;
	}

	@RequestMapping("/exchangeGood")
	@ResponseBody
	public ApiResult exchangeGood(Integer good_id,Integer user_id){
		if(good_id==null||user_id==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		ExchangeInfo exchangeInfo=new ExchangeInfo();
		ApiResult apiResult=new ApiResult();
		UserInfo userInfo=userService.selectUserByUserId(user_id);
		if(userInfo == null){
//			System.out.println("璇锋眰鍏戞崲鐨剈ser_id"+user_id+"涓嶅瓨鍦�");
			return new ApiResult(204,"用户不存在");
		}
		FrogGoods frogGoods= frogGoodService.selectGoodByGoodId(good_id);
		BigDecimal userBalance=userInfo.getBalance();
		BigDecimal goodBalance=frogGoods.getBalance();
		BigDecimal account =userBalance.subtract(goodBalance);
		BigDecimal zero=new BigDecimal("0");
		if(account.min(zero)==account){
			return new ApiResult(202,"余额不足");
		}else{
			int result=userService.updateBalance(account, user_id);
			if(result!=1){
				return new ApiResult(203,"更新失败");
			}
			exchangeInfo.setUser_id(user_id);
			exchangeInfo.setGood_name(frogGoods.getGood_name());
			exchangeInfo.setBalance(goodBalance);
			Date date=new Date();
			exchangeInfo.setEx_time(date);
			Random rd=new Random();
			String index="";
			for(int i = 0; i < 10; i++){
				index+=rd.nextInt(10) + "";
			}
			Long tf=date.getTime();
			String order_id = tf.toString()+index+user_id.toString();
			exchangeInfo.setOrder_id(order_id);
			exchangeInfo.setGood_image(frogGoods.getPath());
			int resultInfo =exchangeInfoService.insertExchangeInfo(exchangeInfo);
			if(resultInfo!=1){
				return new ApiResult(205,"兑换失败");
			}
			Map map=new HashMap<>();
			List address=userAddressService.selectAddressfromUser(user_id);
			map.put("address", address);
			map.put("frogGoods",frogGoods);
			map.put("exchangeInfo", exchangeInfo);
			apiResult.setResult(map);
			return apiResult;
		}
	}
	//鍏戞崲璁板綍
	@RequestMapping("/exchangeInfo")
	@ResponseBody
	public ApiResult exchangeInfo(Integer user_id){
		if(user_id==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		List<ExchangeInfo> list =exchangeInfoService.selectExchangeInfoUserID(user_id);
		ApiResult apiResult =new ApiResult();
		apiResult.setResult(list);
		return apiResult;
	}
	//鍦板潃娣诲姞
	@RequestMapping("/addAddress")
	@ResponseBody
	public ApiResult addAddress(Integer user_id,String name,String phone,String address){
		if(user_id==null||name==null||phone==null||address==null||name.trim().length()==0||phone.trim().length()==0||address.trim().length()==0){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		UserInfo user=userService.selectUserByUserId(user_id);
		if(user==null){
			return new ApiResult(202,"用户不存在");
		}
		ApiResult apiResult=new ApiResult();
		int result =userAddressService.insertAddress(user_id, name, phone, address,new Date());
		if(result!=1){
			return new ApiResult(203,"添加失败");
		}
		List list =userAddressService.selectAddressfromUser(user_id);
		apiResult.setResult(list);
		return apiResult; 
	}
	//鍦板潃鏌ヨ
	@RequestMapping("/addressDetail")
	@ResponseBody
	public ApiResult addressDetail(Integer user_id){
		if(user_id==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		ApiResult apiResult=new ApiResult();
		List<UserAddress> userAddress=userAddressService.selectAddressfromUser(user_id);
		if(userAddress==null){
			return new ApiResult(101,"当前地址不存在");
		}
		apiResult.setResult(userAddress);
		return apiResult;
	}
	
	@RequestMapping("/addTask1")
	@ResponseBody
	public ApiResult addTask1(@RequestBody FrogTask task){
		
		System.out.println(task.getQr_address());
		return new ApiResult();
	}
	
	@Transactional
	@RequestMapping("/addTask")
	@ResponseBody
	public ApiResult addTask(String task_pic_id, Double qr_longitude, Double qr_latitude, Short task_type,
			String task_title, String task_info, String task_address,String award,String durtion,Integer eventId){
		
		if(qr_longitude==null || qr_latitude==null || task_type==null ||task_title==null||
				task_info==null||task_address==null){
			System.out.println(qr_longitude +","+qr_latitude+","+task_type+","+task_title+","+task_info+","+task_address);
			return new ApiResult(3,"缺少参数");
		}
		int insertResult = taskService.addTask(task_pic_id, qr_longitude, qr_latitude, task_type, task_title, task_info, task_address, award,durtion);
		System.out.println("插入id："+insertResult);
		if(insertResult>0){
			FrogActivityEventPlace place = new FrogActivityEventPlace();
			place.setEventid(eventId);
			place.setTaskid(insertResult);
			eventPlaceService.addEventPlace(place);
			return new ApiResult();
		}
		return new ApiResult(3,"添加失败");
	}
	@RequestMapping("/deleteTask")
	@ResponseBody
	public ApiResult deleteTask(Integer task_id){
		if(task_id == null){
			return new ApiResult(3,"缺少参数");
		}
		int res = taskService.deleteTask(task_id, 1);
		System.out.println("鍒犻櫎缁撴灉"+res);
		return res==1?new ApiResult():new ApiResult(3,"删除失败");
	}
	

	@RequestMapping("/updateTask")
	@ResponseBody
	public ApiResult updateTask(FrogTask task){
		if (task.getTask_id() == null){
			System.out.println("now id = " + task.getTask_id());
			return new ApiResult(3,"task_id 为空");
		}
		return taskService.updateTask(task)==1?new ApiResult():new ApiResult(3,"更新失败");
	}
	
	@RequestMapping("getAllTasks")
	@ResponseBody
	public ApiResult getAllTasks(Integer page){
		ApiResult result = new ApiResult();
		if (page == null || page == 0){
			page = 1;
		}
		if(page < 0){
			result.setCode(3);
			result.setMessage("page 蹇呴』澶т簬=0");
			return result;
		}
	    List<FrogTask> tasks = taskService.getAllTasks(page-1);
//	    List<FrogTask> fTasks = new ArrayList<FrogTask>();
//	    for (FrogTask task:tasks){
//	    	swith(task.getTask_type()){
//	    		case 0:
//	    			break;
//	    		case 1:
//	    			break;
//	    		case 2:
//	    			break;
//	    		
//	    	}
//	    }
	    if(tasks.size()>0){
	    	result.setResult(tasks);
	    	return result;
	    }
	    result.setCode(3);
	    result.setMessage("鏁版嵁涓虹┖");
	    return result;
	}
	@RequestMapping("/getActivity")
	@ResponseBody
	public ApiResult getActivity(){
		ApiResult result = new ApiResult();
		FrogActivityBean bean = frogActivityService.getNowFrogActivity();
		if(bean != null){
			result.setResult(bean);
		}
		return result;
	}
	
	public static void main(String[] args) {
		String pwd=MD5Util.MD5Encode("澶у紶", "utf-8");
		System.out.println(pwd);
	}
	
	@RequestMapping("/push")
	@ResponseBody
	public ApiResult push(){
		pushService.sendAndroidBrocast("textticker", "texttitle", "testtext", true, null);
		return new ApiResult();
	}
	@RequestMapping("/pushios")
	@ResponseBody
	public ApiResult pushIos(){
//		pushService.sendAndroidBrocast("textticker", "texttitle", "testtext", true, null);
		pushService.sendIOSBrocast("test");
		return new ApiResult();
	}
	
	@RequestMapping("/getActivityInfo")
	@ResponseBody
	public ApiResult getActivityInfo(Integer activityId,Integer userId){
		ApiResult result = new ApiResult();
		Map<String,Object> data = new HashMap<>();
		FrogActivityUser user = taskUserService.getFrogActivityUser(userId, activityId);
		if(user!=null){
			data.put("isenroll", 1);
			data.put("eventline", eventPlaceService.getAllFrogTasksByEventId(user.getNoweventid()));
			data.put("eventtitle", activityEventServer.getEventById(user.getNoweventid()).getEventname());
			data.put("eventcompletestep", user.getEventstep());
			data.put("eventstate", user.getState());
			logger.info("褰撳墠瀹屾垚姝ラ锛�"+user.getEventstep());
			System.out.println("褰撳墠瀹屾垚姝ラ锛�"+user.getEventstep());
		}else{
			data.put("isenroll", 0);
		}
		FrogActivityBean bean = frogActivityService.getFrogActivityById(activityId);
		if(bean == null){
			return new ApiResult(3,"当前活动不存在");
		}
		data.put("activity", bean);
		data.put("awards", removeDuplicate(taskAwardService.getAllActivityAwardsByActivityId(activityId)));
		data.put("usercount", taskUserService.getAllUserCountByActivity(activityId));
		data.put("users", taskUserService.getAllUserByActivity(activityId));
//		data.put("eventline", eventPlaceService.getAllFrogTasksByEventId(randomEvent.getId()));
		result.setResult(data);
		return result;
	}
	
	@RequestMapping("/enroll")
	@ResponseBody
	public ApiResult enroll(int userId,int activityId){
		System.out.println("userId="+userId+",activityId="+activityId);
		ApiResult result = new ApiResult();
		if(taskUserService.getFrogActivityUser(userId, activityId)!=null){
			return new ApiResult(3, "重复报名");
		}
		if(userService.getUserInfo(userId)==null){
			return new ApiResult(3, "用户不存在");
		}
		System.out.println("userId="+userId+",activityId="+activityId);
		FrogActivityUser user = new FrogActivityUser();
		user.setActivityid(activityId);
		user.setUserid(userId);
		user.setTime(new Date());
		//闅忔満鑾峰彇涓�鏉′换鍔＄嚎
		List<FrogActivityEvent> events = activityEventServer.getAllEvents();
		System.out.println(events.size());
		FrogActivityEvent randomEvent = events.get((int)(Math.random()*events.size()));
		user.setNoweventid(randomEvent.getId());
		taskUserService.addFrogActivityUser(user);
		Map<String,Object> map = new HashMap<>();
		map.put("eventline", eventPlaceService.getAllFrogTasksByEventId(randomEvent.getId()));
		result.setResult(map);
		return result;
	}
	
	@RequestMapping("/getActivityAward")
	@ResponseBody
	private ApiResult getActivityAward(Integer userId,Integer activityId){
		ApiResult result = new ApiResult();
		FrogActivityUser user = taskUserService.getFrogActivityUser(userId, activityId);
		FrogActivityBean bean = frogActivityService.getFrogActivityById(activityId);
		if(bean ==null){
			result.setCode(3);
			result.setMessage("活动不存在");
			return result;
		}
		if(user==null){
			result.setCode(3);
			result.setMessage("用户不存在");
			return result;
		}
		if(user.getState() == 0){
			result.setCode(3);
			result.setMessage("任务已完成");
			return result;
		}
		if(user.getState() ==2){
			result.setCode(3);
			result.setMessage("不能重复领取");
			return result;
		}
		if(user.getState() ==1){
			user.getNoweventid();
//			taskAwardService.getTaskAwardById()
			TaskAward award = activityEventServer.getAwardByEventId(user.getNoweventid());
			if(award.getAwardsurplus()==0){
				result.setCode(3);
				result.setMessage("奖品已经领完");
			}else{
				//棰嗗彇鎴愬姛锛屾洿鏂板鍝佺姸鎬侊紝鏇存柊鐢ㄦ埛鐘舵��
				taskUserService.updateUserState(2, userId,activityId);
				award.setAwardsurplus(award.getAwardsurplus()-1);
				taskAwardService.upDateTaskAward(award);
				result.setResult(award);
			}	
			return result;
		}
		result.setCode(3);
		result.setMessage("领取失败");
		return result;
	}
	
	
	@RequestMapping("/addEvent")
	@ResponseBody
	public ApiResult addEvent(String eventname,String diff,String theme,String event_ref,String additional,String event_wire,Double event_price,String address,String event_pic){	
		
		
		if(eventname == null || diff == null || theme == null || event_ref == null || additional == null || event_price == null || event_wire == null){
			return new ApiResult(3,"参数不能为空");
		}
		if(activityEventServer.addEvent(eventname,diff,theme,event_ref,additional,event_wire,event_price,address,event_pic)==1){
			return new ApiResult();
		}
		
		return new ApiResult(3,"失败");
	}
	
	@Value("${uploadFilePath}")
	private String uploadFilePath;
	@Value("${fileRootUrl}")
	private String fileRootUrl;
	@RequestMapping("/upload")
	@ResponseBody
	public ApiResult doUpload(@RequestParam("img")CommonsMultipartFile event_pic,HttpServletRequest request){
//		//String savepath = "d:/"+img.getOriginalFilename();
		FrogActivityEvent event = new FrogActivityEvent();
//		//String savepath = request.getServletContext().getRealPath("/upload/"+event_pic.getOriginalFilename());
//		// String savepath="uploadFilePath"+new Date().getTime()+event_pic.getOriginalFilename();
//		
//		 //ApiResult apiResult = new ApiResult();
//			
//			String fileName = new Date().getTime()/1000+".jpg";
//			//上传到指定位置
//			try {
//				String savepath = FileUpLoad.uploadImage(event_pic, uploadFilePath, "image",fileName);
//				System.out.println("头像上传结果:"+savepath);
//				event.setEvent_pic(savepath);
//				activityEventServer.addEventPic(event);
//				
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
		String savepath="D:/apache"+new Date().getTime()+event_pic.getOriginalFilename();
		try {
			event_pic.transferTo(new File(savepath));
			event.setEvent_pic(savepath);
			activityEventServer.addEventPic(event);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ApiResult();
	}
	
	
	
	@RequestMapping("/getAllEvents")
	@ResponseBody
	public ApiResult getAllEvents(){
		ApiResult result = new ApiResult();
		result.setResult(activityEventServer.getAllEvents());
		return result;
	}
	
	//s难度
	@RequestMapping("/getDiffEvent")
	@ResponseBody
	public ApiResult getDiffEvent(Integer diff){
		ApiResult result = new ApiResult();
		result.setResult(activityEventServer.getEventByDiff(diff));
		return result;
	}
	//难度和题材
	@RequestMapping("/getDiffThemeEvent")
	@ResponseBody
	public ApiResult getDiffThemeEvent(Integer diff,Integer theme){
		ApiResult result = new ApiResult();
		result.setResult(activityEventServer.getEventByDiffTheme(diff, theme));
		return result;
		
	}
	//查询时间   名称和价格    剧本
	@RequestMapping("/getPlay")
	@ResponseBody
	public ApiResult getEventByEP(FrogPlay frogplay){
		ApiResult result = new ApiResult();
		result.setResult(playService.getFrogPlay(frogplay));
		return result;	
	}
	
	//剧本添加
	@RequestMapping("/addPlay")
	@ResponseBody
	public ApiResult addPlay(String playname, String diff, String theme, String ref, String additional, String wire,
			Integer price, String address, String pic, Integer status){
		if(playname == null || diff == null || theme == null || ref == null || additional == null || wire == null || price == null){
			return new ApiResult(3,"参数不能为空");
		}
		if(playService.saveFrogPlay(playname, diff, theme, ref, additional, wire, price, address, pic, status)==1){
			return new ApiResult();
		}
		return new ApiResult(3,"失败");
	}
	
	//删除剧本
	@RequestMapping("/delPlay")
	@ResponseBody
	public ApiResult delPlay(Integer id){
		ApiResult result = new ApiResult();
		result.setResult(playService.delFrogPlayById(id));
		return result;
	}
	
	//修改剧本
	@RequestMapping("/updatefrogPlay")
	@ResponseBody
	public ApiResult updateFrogPlayById(FrogPlay frogplay){
		if(frogplay.getId()==null){
			return new ApiResult(3,"id 不能为空"); 
		}
		
		return playService.updateFrogPlayById(frogplay)==1?new ApiResult():new ApiResult(3,"更新失败");
	}
	
	//查看单个剧本信息
	@RequestMapping("/getFrogPlayInfo")
	@ResponseBody
	public ApiResult getFrogPlayInfo(Integer id){
		ApiResult result = new ApiResult();
		if(id==null){
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		return playService.getFrogPlayInfo(id);
		
	}
	
	
	
	public   static   List  removeDuplicate(List<TaskAward> list)  {       
		  for  ( int  i  =   0 ; i  <  list.size()  -   1 ; i ++ )  {       
		      for  ( int  j  =  list.size()  -   1 ; j  >  i; j -- )  {       
		           if  (list.get(j).getId()==list.get(i).getId())  {       
		              list.remove(j);       
		            }        
		        }        
		      }        
		    return list;       
		} 
}
