package com.frog.controller.api.user;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frog.common.Constant;
import com.frog.common.VocalConcertUtil;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Code;
import com.frog.common.Result.Msg;
import com.frog.model.FrogActivityBean;
import com.frog.model.FrogActivityShow;
import com.frog.model.FrogTake;
import com.frog.model.FrogTask;
import com.frog.model.SysConfig;
import com.frog.model.SysMessage;
import com.frog.model.UserChip;
import com.frog.model.UserChipInfo;
import com.frog.model.UserInfo;
import com.frog.service.FrogActivityAwardHisService;
import com.frog.service.FrogActivityService;
import com.frog.service.FrogActivityShowService;
import com.frog.service.FrogActivityUserService;
import com.frog.service.SysConfigService;
import com.frog.service.SysMessageService;
import com.frog.service.TaskService;
import com.frog.service.TaskTakeService;
import com.frog.service.UserChipInfoService;
import com.frog.service.UserChipService;
import com.frog.service.UserService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/api/user/task")
public class TaskController {
	
	private Logger   logger   =  LoggerFactory.getLogger(TaskController.class);
	@Autowired
	private ApplicationContext applicationContext;
	@Autowired
	private TaskService taskService;
	@Autowired
	private TaskTakeService taskTakeService;
	@Autowired	
	private UserService userService;
	@Autowired
	private UserChipService userChipService;
	@Autowired
	private UserChipInfoService userChipInfoService;
	@Autowired
	private SysConfigService sysConfigService;
	@Autowired
	private SysMessageService sysMessageService;
	@Autowired 
	private FrogActivityService frogActivityService;
	
	@Autowired
	private FrogActivityUserService frogActivityUserService;
	@Autowired
	private FrogActivityAwardHisService faahs;
	@Autowired
	private FrogActivityShowService showService;
	/**
	 * 
	 * @param user_id
	 * @param type   0扫码 1 所有任务 2刷新 3 扫码连接  
	 * @param footStep 步数
	 * @param take_id 接任务ID	
	 * @param qrdistance 两点间距离	
	 * @param task_id 任务ID
	 * @param qr_code_id 码ID
	 * @param login_type=0小程序 =1移动端
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getTask")
	@ResponseBody
	public ApiResult getTask(Integer user_id, Integer type,  Integer footStep ,Integer take_id ,Integer task_id,String qr_code_id,String login_type,Double start_longitude,Double start_latitude,
			Double complete_longitude,Double complete_latitude,Integer find_type) throws Exception {
		if (user_id == null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		UserInfo userInfo =userService.selectUserByUserId(user_id);
		if (userInfo ==null) {
			logger.error("没有这个人。。。。。。");
			return new ApiResult(5, "暂无此人");
		}

		if (type==3) {
			if (footStep==null ||user_id==null||take_id==null||task_id==null) {
				logger.info("步数{}"+footStep+"用户的Id{}"+user_id+"接单的ID{}"+take_id+"任务的ID{}"+task_id);
			}
			return taskService.qrCompleteTask(footStep, user_id, take_id, task_id, qr_code_id,login_type,complete_longitude,complete_latitude);
		}
		ApiResult apiResult = new ApiResult();
		Map<String, Object> map = new HashMap<String, Object>();
		if (type==2) {
			logger.info("用户Id{}"+user_id+"正在刷新任务");
			return taskService.getTask(qr_code_id,user_id,start_longitude,start_latitude,find_type);
		}
		//扫码 
		if (type == 0) {
			ApiResult result =  taskService.getTask(qr_code_id,user_id,start_longitude,start_latitude,find_type);
			if(result.getC()==1){
				JSONObject object = new JSONObject(result.getR());
				return startTask(object,user_id,object.optInt("task_id"),object.optString("task_info"),object.optString("address"),object.optString("task_title")
						,object.optDouble("longitude"),object.optDouble("latitude"),object.optDouble("task_price"),object.optDouble("hea_price")
						,object.optDouble("total_price"),object.optInt("type"),task_id);
			}else{
				return result;
			}
//			new JSONObject()
//			Map datas = taskService.getTask(qr_code_id,user_id,start_longitude,start_latitude,find_type).getR()
		}
		if (type == 1) {
			logger.info("用户Id{}"+user_id+"正在察看所有任务");
			return taskService.allTaskInfo();
		}
		apiResult.setResult(map);
		return apiResult;
	}

	@RequestMapping("/refreshTask")
	@ResponseBody
	public ApiResult reFreshTask(Integer user_id, Integer footStep ,Integer take_id ,Integer task_id,String qr_code_id,String login_type,Double start_longitude,Double start_latitude,
			Double complete_longitude,Double complete_latitude){
		FrogTake frogTake = taskTakeService.getTakeInfo(take_id);
		//取消正在进行的任务
		if(!frogTake.getQr_code_id().equals(qr_code_id)){
			System.out.println("当前任务起点二维码："+frogTake.getQr_code_id()+"传入qrcodeid："+qr_code_id);
			return new ApiResult(3,"qrcode不一致");
		}
		completeTask(take_id, 1, user_id);
		try {
			return getStartTask( user_id,  0,   footStep , take_id , task_id, qr_code_id, login_type, start_longitude, start_latitude,
					 complete_longitude, complete_latitude,1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ApiResult(3,"刷新失败");
	}
	@RequestMapping("/getStartTask")
	@ResponseBody
	public ApiResult getStartTask(Integer user_id, Integer type,  Integer footStep ,Integer take_id ,Integer task_id,String qr_code_id,String login_type,Double start_longitude,Double start_latitude,
			Double complete_longitude,Double complete_latitude,Integer find_type) throws Exception {
		System.out.println(qr_code_id);
		if (user_id == null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		UserInfo userInfo =userService.selectUserByUserId(user_id);
		if (userInfo ==null) {
			logger.error("没有这个人。。。。。。");
			return new ApiResult(5, "暂无此人");
		}

		if (type==3) {
			if (footStep==null ||user_id==null||take_id==null||task_id==null) {
				logger.info("步数{}"+footStep+"用户的Id{}"+user_id+"接单的ID{}"+take_id+"任务的ID{}"+task_id);
			}
			return taskService.qrCompleteTask(footStep, user_id, take_id, task_id, qr_code_id,login_type,complete_longitude,complete_latitude);
		}
		ApiResult apiResult = new ApiResult();
		Map<String, Object> map = new HashMap<String, Object>();
		if (type==2) {
			logger.info("用户Id{}"+user_id+"正在刷新任务");
			return taskService.getTask(qr_code_id,user_id,start_longitude,start_latitude,find_type);
		}
		//扫码 
		if (type == 0) {
			ApiResult result =  taskService.getTask(qr_code_id,user_id,start_longitude,start_latitude,find_type);
			if(result.getC()==1){
				JSONObject object = new JSONObject(result.getR());
				System.out.println(object.toString());
				return startTask(object,user_id,object.optInt("task_id"),object.optString("task_info"),object.optString("qr_code_address"),object.optString("task_title")
						,object.optDouble("longitude"),object.optDouble("latitude"),object.optDouble("task_price"),object.optDouble("hea_price")
						,object.optDouble("total_price"),object.optInt("type"),object.optInt("last_taskid"));
			}else{
				return result;
			}
//			new JSONObject()
//			Map datas = taskService.getTask(qr_code_id,user_id,start_longitude,start_latitude,find_type).getR()
		}
		if (type == 1) {
			logger.info("用户Id{}"+user_id+"正在察看所有任务");
			return taskService.allTaskInfo();
		}
		apiResult.setResult(map);
		return apiResult;
	}
	/**
	 * 
	 * @param user_id
	 * @param task_id 
	 * @param task_info
	 * @param address
	 * @param task_title
	 * @param longitude
	 * @param latitude
	 * @return
	 */
//	@RequestMapping("/taskStart")
//	@ResponseBody
	public  ApiResult startTask(JSONObject object,Integer user_id, Integer task_id ,String task_info,String address,String task_title,Double QR_longitude,Double QR_latitude,Double task_price,Double hea_price,Double total_price,Integer go_type,Integer last_task_id) {
		if (user_id == null || task_id == null||task_info==null||address==null||task_title==null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		System.out.println("开始任务："+address);
		int count=taskTakeService.takeTaskCount(user_id, 0);
		if(count>0){
			return new ApiResult(202,"请勿重复接受任务");
		}
		int take_id = taskTakeService.save(user_id, task_id, task_info, address,task_title,QR_longitude,QR_latitude,task_price,hea_price,total_price,go_type,last_task_id,object.optString("qr_code_id"),object.optDouble("range",0));
		if (take_id==-1) {
			return new ApiResult(2,"任务地点没有二维码，请重新刷新任务");
		}
		userService.updateUserNextQrCode(user_id, object.optString("qr_next_code_id"));
		ApiResult apiResult = new ApiResult();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("take_id", take_id);
		map.put("taskinfo", object.toString());
		map.put("isactivitytask", object.optString("isactivitytask"));
		apiResult.setResult(map);
		return apiResult;
	}

	/**
	 * 
	 * @param user_id
	 * @param page
	 * @param status 0 jimnxing   1 完成  2 quxiao
	 * @return
	 */
	@RequestMapping("allMyTask")
	@ResponseBody
	public ApiResult getAllMyTask(Integer user_id, Integer page, Integer status) {
		if (user_id == null || status == null) {
			return new ApiResult(2, "参数为空");
		}
		if (page == null||page<=0) {
			page = 1;
		}
		List<FrogTake> myTaskList = taskService.myTask(user_id, page, status);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myTaskList", myTaskList);
		if ( myTaskList.size()==0) {
			map.put("haveMore", 0);
		} else {
			map.put("haveMore", 1);
		}
		ApiResult apiResult = new ApiResult();
		apiResult.setResult(map);
		return apiResult;
	}
	
	/***
	 * 
	 * @param take_id
	 * @param type
	 * @param user_id
	 * @return
	 */
	@RequestMapping("/taskOperate")
	@ResponseBody
	public ApiResult completeTask(Integer take_id, Integer type,Integer user_id) {
		if (take_id == null || type == null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		System.out.println("当前任务takeid"+take_id);
		//取消
		FrogTake frogTake=taskTakeService.getTakeInfo(take_id);
		if (frogTake==null) {
			return new ApiResult(2, "这个任务不存在");
		}
		if(frogTake.getStatus()!=0){
			return new ApiResult(2, "这个任务无法放弃");
		}
		String message="";
		if (type == 1) {
			message="任务取消任务成功";
		}
		//完成
		if (type == 2) {
			message="任务完成成功";
			}
		taskService.operateTakeTask(take_id, type);
		return new ApiResult(1, message);
	}
	
	
	@RequestMapping("/addTask")
	@ResponseBody
	public ApiResult addTask(String task_pic_id, Double qr_longitude, Double qr_latitude, Short task_type,
			String task_title, String task_info, String task_address,String award,String durtion){
		if(qr_longitude==null || qr_latitude==null || task_type==null ||task_title==null||
				task_info==null||task_address==null){
			return new ApiResult(3,"参数不能为空格");
		}
		if(taskService.addTask(task_pic_id, qr_longitude, qr_latitude, task_type, task_title, task_info, task_address, award,durtion)==1){
			return new ApiResult();
		}
		return new ApiResult(3,"失败");
	}
	
	@RequestMapping("/deleteTask")
	@ResponseBody
	public ApiResult deleteTask(Integer task_id){
		if(task_id == null){
			return new ApiResult(3,"参数不能为空");
		}
		int res = taskService.deleteTask(task_id, 1);
		System.out.println("删除结果"+res);
		return res==1?new ApiResult():new ApiResult(3,"删除失败");
	}
	
	@RequestMapping("/updateTask")
	@ResponseBody
	public ApiResult updateTask(FrogTask task){
		if (task.getTask_id() == null){
			System.out.println("now id = " + task.getTask_id());
			return new ApiResult(3,"task_id 不能为空");
		}
		return taskService.updateTask(task)==1?new ApiResult():new ApiResult(3,"更新失败");
	}
	
	/**
	 * 碎片赠送
	 * @param user_id
	 * @param chip_num
	 * @param ano_invite_id
	 * @return
	 */
	@RequestMapping("/givePersonChip")
	@ResponseBody
	public ApiResult givePersonChip(Integer user_id,int chip_num,Integer ano_invite_id){
		ApiResult apiResult =new ApiResult();
		UserChip userChip=userChipService.selectUserChipByUser(user_id);
		UserInfo anoUserInfo=userService.selectUserInfoByInviteId(ano_invite_id);
		if(anoUserInfo==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		UserChip anoUserChip=userChipService.selectUserChipByUser(anoUserInfo.getUser_id());
		if(chip_num==1){
			if(userChip.getChip_one()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_one(userChip.getChip_one()-1);
				userChipService.update(userChip);
				anoUserChip.setChip_one(anoUserChip.getChip_one()+1);
				userChipService.update(anoUserChip);
			}
		}else if(chip_num==2){
			if(userChip.getChip_two()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_two(userChip.getChip_two()-1);
				userChipService.update(userChip);
				anoUserChip.setChip_two(anoUserChip.getChip_two()+1);
				userChipService.update(anoUserChip);
			}
		}else if(chip_num==3){
			if(userChip.getChip_thr()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_thr(userChip.getChip_thr()-1);
				userChipService.update(userChip);
				anoUserChip.setChip_thr(anoUserChip.getChip_thr()+1);
				userChipService.update(anoUserChip);
			}
		}else if(chip_num==4){
			if(userChip.getChip_for()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_for(userChip.getChip_for()-1);
				userChipService.update(userChip);
				anoUserChip.setChip_for(anoUserChip.getChip_for()+1);
				userChipService.update(anoUserChip);
			}
		}else if(chip_num==5){
			if(userChip.getChip_fiv()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_fiv(userChip.getChip_fiv()-1);
				userChipService.update(userChip);
				anoUserChip.setChip_fiv(anoUserChip.getChip_fiv()+1);
				userChipService.update(anoUserChip);
			}
		}
		UserChipInfo userChipInfo=new UserChipInfo();
		userChipInfo.setChip(chip_num);
		userChipInfo.setAdd_time(new Date());
		userChipInfo.setUser_id(user_id);
		userChipInfo.setAno_user_id(anoUserInfo.getUser_id());
		userChipInfo.setType(1);
		userChipInfo.setMessage("用户:"+user_id+"赠予"+anoUserInfo.getUser_id()+"用户"+chip_num+"号碎片");
		userChipInfoService.insertUserChipInfo(userChipInfo);
		return apiResult;
	}

	/**
	 * 碎片分享
	 * @param user_id
	 * @return
	 */
	@RequestMapping("/shareChip")
	@ResponseBody
	public ApiResult shareChip(Integer user_id){
		ApiResult apiResult= new ApiResult();
		String chip_num=VocalConcertUtil.getChip();
		UserChip userChip=userChipService.selectUserChipByUser(user_id);
		if(chip_num.equals("chip_one")){
			userChip.setChip_one(userChip.getChip_one()+1);
			userChipService.updateChip(userChip);
		}else if(chip_num.equals("chip_two")){
			userChip.setChip_two(userChip.getChip_two()+1);
			userChipService.updateChip(userChip);
		}else if(chip_num.equals("chip_thr")){
			userChip.setChip_thr(userChip.getChip_thr()+1);
			userChipService.updateChip(userChip);
		}else if(chip_num.equals("chip_for")){
			userChip.setChip_for(userChip.getChip_for()+1);
			userChipService.updateChip(userChip);
		}else if(chip_num.equals("chip_fiv")){
			userChip.setChip_fiv(userChip.getChip_fiv()+1);
			userChipService.updateChip(userChip);
		}
		UserChipInfo userChipInfo=new UserChipInfo();
		userChipInfo.setChip(Integer.parseInt(chip_num));
		userChipInfo.setAdd_time(new Date());
		userChipInfo.setUser_id(user_id);
		userChipInfo.setType(2);
		userChipInfo.setMessage("用户:"+user_id+"分享获得"+chip_num+"号碎片");
		userChipInfoService.insertUserChipInfo(userChipInfo);
		apiResult.setResult(userChip);
		return apiResult;
	}
	/**
	 * 奖励列表
	 * @return
	 */
	@RequestMapping("/rewardList")
	@ResponseBody
	public ApiResult rewardList(){
		ApiResult apiResult=new ApiResult();
		List rewardList=sysMessageService.selectSysMessage();
		apiResult.setResult(rewardList);
		return apiResult;
	}
	
	@RequestMapping("/getActivity")
	@ResponseBody
	public ApiResult getActivity(Integer user_id){
		ApiResult result = new ApiResult();
		FrogActivityBean bean = frogActivityService.getNowFrogActivity();
		Map<String,Object> data = new HashMap<>();
		if(bean!=null&&showService.selectUserShowed(user_id, bean.getActivityid())!=null){
			data.put("ishow", 0);
			if(bean!=null){
				data.put("activity", bean);
			}
			result.setResult(data);
			return result;
		}
//		if(bean != null){
//			data.put("ishow", 0);
////			result.setResult(bean);
//			data.put("activity", bean);
//			FrogActivityShow  show = new FrogActivityShow();
//			show.setActivityid(bean.getActivityid());
//			show.setIsshowed("1");
//			show.setUser_id(user_id);
//			show.setShowtime(new Date());
//			showService.insertFrogActivityShow(show);
//		}
		else{
			data.put("ishow", 1);
		
		}
		result.setResult(data);
		return result;
	}
	
	@RequestMapping("/getActivityAward")
	@ResponseBody
	public ApiResult getActivityAward(Integer user_id,String state){
		ApiResult result = new ApiResult();
		result.setResult(faahs.getFAAHSByUseridAndState(user_id, state));
		return result;
	}
	
}
