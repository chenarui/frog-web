package com.frog.controller.manage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frog.common.CommonUtils;
import com.frog.common.Constant;
import com.frog.common.LocationUtils;
import com.frog.common.VocalConcertUtil;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Code;
import com.frog.common.Result.Msg;
import com.frog.controller.api.user.TaskController;
import com.frog.model.FrogAward;
import com.frog.model.FrogAwardsDetail;
import com.frog.model.FrogTask;
import com.frog.model.SysConfig;
import com.frog.model.SysMessage;
import com.frog.model.UserChip;
import com.frog.model.UserChipInfo;
import com.frog.model.UserInfo;
import com.frog.service.FrogAwardService;
import com.frog.service.FrogAwardsDetailService;
import com.frog.service.SysConfigService;
import com.frog.service.SysMessageService;
import com.frog.service.TaskService;
import com.frog.service.TaskTakeService;
import com.frog.service.UserChipInfoService;
import com.frog.service.UserChipService;
import com.frog.service.UserService;
@Controller
@RequestMapping("/chipActivity")
public class ChipActivityController {
	private Logger   logger   =  LoggerFactory.getLogger(TaskController.class);
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
	private FrogAwardsDetailService frogAwardsDetailService;
	@Autowired
	private FrogAwardService frogAwardService;
	/**
	 * 碎片赠送
	 * @param user_id
	 * @param chip_num
	 * @param ano_invite_id
	 * @return
	 */
	@RequestMapping("/givePersonChip")
	@ResponseBody
	public ApiResult givePersonChip(Integer user_id,Integer chip_num,Integer ano_invite_id){
		ApiResult apiResult =new ApiResult();
		UserChip userChip=userChipService.selectUserChipByUser(user_id);
		UserInfo anoUserInfo=userService.selectUserInfoByInviteId(ano_invite_id);
		if(anoUserInfo==null){
			return new ApiResult(202,"邀请码输入有误，用户不存在");
		}
		if(chip_num==null||user_id==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		UserChip anoUserChip=userChipService.selectUserChipByUser(anoUserInfo.getUser_id());
		if(chip_num==1){
			if(userChip.getChip_one()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_one(userChip.getChip_one()-1);
				userChipService.updateChip(userChip);
				anoUserChip.setChip_one(anoUserChip.getChip_one()+1);
				userChipService.updateChip(anoUserChip);
			}
		}else if(chip_num==2){
			if(userChip.getChip_two()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_two(userChip.getChip_two()-1);
				userChipService.updateChip(userChip);
				anoUserChip.setChip_two(anoUserChip.getChip_two()+1);
				userChipService.updateChip(anoUserChip);
			}
		}else if(chip_num==3){
			if(userChip.getChip_thr()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_thr(userChip.getChip_thr()-1);
				userChipService.updateChip(userChip);
				anoUserChip.setChip_thr(anoUserChip.getChip_thr()+1);
				userChipService.updateChip(anoUserChip);
			}
		}else if(chip_num==4){
			if(userChip.getChip_for()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_for(userChip.getChip_for()-1);
				userChipService.updateChip(userChip);
				anoUserChip.setChip_for(anoUserChip.getChip_for()+1);
				userChipService.updateChip(anoUserChip);
			}
		}else if(chip_num==5){
			if(userChip.getChip_fiv()==0){
				return new ApiResult(202,"碎片数量不足，无法赠送");
			}else{
				userChip.setChip_fiv(userChip.getChip_fiv()-1);
				userChipService.updateChip(userChip);
				anoUserChip.setChip_fiv(anoUserChip.getChip_fiv()+1);
				userChipService.updateChip(anoUserChip);
			}
		}
		UserChipInfo userChipInfo=new UserChipInfo();
		userChipInfo.setChip(chip_num);
		userChipInfo.setAdd_time(new Date());
		userChipInfo.setUser_id(user_id);
		userChipInfo.setAno_user_id(anoUserInfo.getUser_id());
		userChipInfo.setType(1);
		userChipInfo.setStatus(0);
		userChipInfo.setMessage("用户:"+user_id+"赠予"+anoUserInfo.getUser_id()+"用户"+chip_num+"号碎片");
		userChipInfoService.insertUserChipInfo(userChipInfo);
		UserChipInfo anoUserChipInfo=new UserChipInfo();
		userChipInfo.setUser_id(anoUserInfo.getUser_id());
		anoUserChipInfo.setAdd_time(new Date());
		anoUserChipInfo.setChip(chip_num);
		anoUserChipInfo.setAno_user_id(user_id);
		anoUserChipInfo.setType(1);
		anoUserChipInfo.setStatus(1);
		anoUserChipInfo.setMessage("用户:"+anoUserInfo.getUser_id()+"收到"+user_id+"用户"+chip_num+"号碎片");
		userChipInfoService.insertUserChipInfo(anoUserChipInfo);
		return new ApiResult(Code.Success,"赠送成功");
	}
	/**
	 * 碎片合成
	 * @param user_id
	 * @return
	 */
	@RequestMapping("/chipCompose")
	@ResponseBody
	public ApiResult chipCompose(Integer user_id,Integer type){
		UserChip userChip=userChipService.selectUserChipByUser(user_id);
		if(userChip==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		if(userChip.getChip_one()==0||userChip.getChip_two()==0||userChip.getChip_thr()==0||userChip.getChip_for()==0||userChip.getChip_fiv()==0){
			return new ApiResult(202,"碎片不足无法合成");
		}
		if(userChip.getChip_compose()>0){
			return new ApiResult(203,"碎片只可以合成一次，不可多次合成");
		}
		List<SysConfig> configList=sysConfigService.selectSysConfByKey(CommonUtils.getTicket());
		int index= (int) (Math.random() * configList.size());
		List<SysConfig> list=new ArrayList<>(); 
		for (SysConfig sysConfig : configList) {
			if(sysConfig.getCount()!=0){
				list.add(sysConfig);
			}
			index=(int) (Math.random() * list.size());
		}
		if(list.size()==0){
			return new ApiResult(204,"今日奖品已发放完毕哦");
		}
		ApiResult apiResult =new ApiResult();
		userChip.setChip_one(userChip.getChip_one()-1);
		userChip.setChip_two(userChip.getChip_two()-1);
		userChip.setChip_thr(userChip.getChip_thr()-1);
		userChip.setChip_for(userChip.getChip_for()-1);
		userChip.setChip_fiv(userChip.getChip_fiv()-1);
		userChip.setChip_compose(userChip.getChip_compose()+1);
		Map map=new HashMap<>();
		userChipService.updateChip(userChip);
		SysMessage sysMessage =new SysMessage();
		sysMessage.setAdd_time(new Date());
		sysMessage.setUser_id(user_id);
		SysConfig sysConfig=list.get(index);
		sysMessage.setInfo(sysConfig.getValue()+"演唱会门票");
		sysMessage.setType(type);
		sysMessage.setPic(Constant.VOCAL_PATH);
		sysMessageService.insertMessage(sysMessage);
		sysConfig.setCount(sysConfig.getCount()-1);
		sysConfigService.updateSysConf(sysConfig);
		map.put("userChip", userChip);
		map.put("sysMessage",sysMessage);
		apiResult.setResult(map);
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
		UserInfo userInfo=userService.selectUserByUserId(user_id);
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
		userChipInfo.setStatus(1);
		if(userInfo.getNick_name()!=null){
			userChipInfo.setMessage("用户:"+userInfo.getNick_name()+"分享获得"+chip_num+"号碎片");
		}else{
			userChipInfo.setMessage("用户:"+userInfo.getPhone()+"分享获得"+chip_num+"号碎片");
		}
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
		List<SysMessage> rewardList=sysMessageService.selectSysMessage();
		List list=new ArrayList<>();
		for (SysMessage sysMessage : rewardList) {
			Map map=new HashMap<>();
			UserInfo userInfo=userService.selectUserByUserId(sysMessage.getUser_id());
			if(userInfo.getNick_name()!=null){
				sysMessage.setUser_name(userInfo.getNick_name());
				sysMessage.setInfo(sysMessage.getInfo());
			}else{
				String phone=userInfo.getPhone();
				phone=phone.substring(0,3)+"****"+phone.substring(7,phone.length());
				sysMessage.setUser_name(phone);
				sysMessage.setInfo(sysMessage.getInfo());
			}
			map.put("userInfo", userInfo);
			map.put("sysMessage", sysMessage);
			list.add(map);
		}
		apiResult.setResult(list);
		return apiResult;
	}
	/**
	 * 添加地址
	 * @param user_id
	 * @param address
	 * @param type
	 * @param name
	 * @param phone
	 * @return
	 */
	@RequestMapping("/addAwardAddress")
	@ResponseBody
	public ApiResult addAwardAddress(Integer user_id,String address,Integer type,String name,String phone){
		List<SysMessage> sysMessageList=sysMessageService.selectSysMessageByUser(user_id);
		for (SysMessage sysMessage : sysMessageList) {
			FrogAwardsDetail detail=frogAwardsDetailService.selectAwardDetail(user_id);
			int result=0;
			if(detail!=null){
				FrogAwardsDetail frogAwardsDetail = new FrogAwardsDetail();
				frogAwardsDetail.setUser_id(user_id);
				frogAwardsDetail.setAddress(address);
				frogAwardsDetail.setName(name);
				frogAwardsDetail.setPhone(phone);
				frogAwardsDetail.setAward_info(sysMessage.getInfo());
				frogAwardsDetail.setType(type);
				result=frogAwardsDetailService.updateDetail(frogAwardsDetail);
			}else{
				FrogAwardsDetail frogAwardsDetail = new FrogAwardsDetail();
				frogAwardsDetail.setUser_id(user_id);
				frogAwardsDetail.setAddress(address);
				frogAwardsDetail.setName(name);
				frogAwardsDetail.setPhone(phone);
				frogAwardsDetail.setAward_info(sysMessage.getInfo());
				frogAwardsDetail.setType(type);
				result=frogAwardsDetailService.insertAwardDetail(frogAwardsDetail);
			}
			if(result!=1){
				return new ApiResult(202,"地址添加失敗");
			}
			sysMessage.setType(1);
			sysMessageService.updateAddressType(sysMessage);
		}
		return new ApiResult(Code.Success,Msg.SUCCESS);
	}
	/**
	 * 最近任务显示
	 * @param lat
	 * @param lon
	 * @return
	 */
	@RequestMapping("/taskListBylocal")
	@ResponseBody
	public ApiResult taskListBylocal(Double lat,Double lon){
		List<FrogTask> list=taskService.allTask();
//		List<FrogTask> list=new ArrayList<FrogTask>();
//		for (FrogTask frogTask : tasklist) {
//			double length=LocationUtils.getDistance(lat, lon, frogTask.getLatitude(), frogTask.getLongitude());
//			if(length<10000){
//				list.add(frogTask);
//			}
//		}
		ApiResult apiResult=new ApiResult();
		apiResult.setResult(list);
		return apiResult;
	}
	/**
	 * 碎片详情
	 * @param user_id
	 * @return
	 */
	@RequestMapping("/myChipMessage")
	@ResponseBody
	public ApiResult myChipMessage(Integer user_id){
		ApiResult apiResult=new ApiResult();
		List<UserChipInfo> userChipList=userChipInfoService.selectUserChipInfoByUser(user_id);
		apiResult.setResult(userChipList);
		return apiResult;
	}
	/**
	 * 我的奖品
	 * @param user_id
	 * @return
	 */
	@RequestMapping("/myAward")
	@ResponseBody
	public ApiResult myAward(Integer user_id){
		ApiResult apiResult=new ApiResult();
		Map map=new HashMap<>();
		List<SysMessage> sysMessageList=sysMessageService.selectSysMessageByUser(user_id);
		List list=new ArrayList<>();;
		for (SysMessage sysMessage : sysMessageList) {
			FrogAwardsDetail frogAwardsDetail=frogAwardsDetailService.selectAwardDetail(user_id);
			map.put("frogAwardsDetail", frogAwardsDetail);
			map.put("sysMessage", sysMessage);
			list.add(map);
		}
		apiResult.setResult(list);
		return apiResult;
	}
	/**
	 * 活动列表
	 * @return
	 */
	@RequestMapping("/awardList")
	@ResponseBody
	public ApiResult awardList(){
		ApiResult apiResult=new ApiResult();
		List<FrogAward> frogAwardList=frogAwardService.selectFrogAwardByUser();
		apiResult.setResult(frogAwardList);
		return apiResult;
	}
	@RequestMapping("/getChip")
	@ResponseBody
	public ApiResult getChip(Integer user_id){
		ApiResult apiResult=new ApiResult();
		UserInfo userInfo=userService.selectUserByUserId(user_id);
		UserChip userChip=userChipService.selectUserChipByUser(user_id);
		if(userInfo.getFirst_login()==0){
			String chip=VocalConcertUtil.getChip();
			int chip_num=0;
			if(chip.equals("chip_one")){
				userChip.setChip_one(userChip.getChip_one()+1);
				chip_num=1;
				userChipService.updateChip(userChip);
			}else if(chip.equals("chip_two")){
				userChip.setChip_two(userChip.getChip_two()+1);
				chip_num=2;
				userChipService.updateChip(userChip);
			}else if(chip.equals("chip_thr")){
				userChip.setChip_thr(userChip.getChip_thr()+1);
				chip_num=3;
				userChipService.updateChip(userChip);
			}else if(chip.equals("chip_for")){
				userChip.setChip_for(userChip.getChip_for()+1);
				chip_num=4;
				userChipService.updateChip(userChip);
			}else if(chip.equals("chip_fiv")){
				userChip.setChip_fiv(userChip.getChip_fiv()+1);
				chip_num=5;
				userChipService.updateChip(userChip);
			}
			UserChipInfo userChipInfo=new UserChipInfo();
			userChipInfo.setChip(chip_num);
			userChipInfo.setAdd_time(new Date());
			userChipInfo.setUser_id(user_id);
			userChipInfo.setType(4);
			userChipInfo.setStatus(1);
			if(userInfo.getNick_name()!=null){
				userChipInfo.setMessage("用户:"+userInfo.getNick_name()+"首次登录获得"+chip_num+"号碎片");
			}else{
				userChipInfo.setMessage("用户:"+userInfo.getPhone()+"首次登录获得"+chip_num+"号碎片");
			}
			userChipInfoService.insertUserChipInfo(userChipInfo);
			userInfo.setFirst_login(1);
			userService.updateLoginType(userInfo.getFirst_login(), user_id);
			Map map=new HashMap<>();
			map.put("userInfo", userInfo);
			map.put("userChip", userChip);
			map.put("chip", chip);
			apiResult.setResult(map);
			return apiResult;
		}else{
			return new ApiResult(202,"非首次登录");
		}
	}
	/**
	 * 活动详情
	 * @param award_id
	 * @param user_id
	 * @return
	 */
	@RequestMapping("/awardDetail")
	@ResponseBody
	public ApiResult awardDetail(Integer award_id,Integer user_id){
		if(award_id==null||user_id==null){
			return new ApiResult(Code.MissParam,Msg.MissParam);
		}
		FrogAward frogAward=frogAwardService.selectByAwardId(award_id);
		UserChip userChip = userChipService.selectUserChipByUser(user_id);
		ApiResult apiResult=new ApiResult();
		Map map=new HashMap<>();
		map.put("frogAward", frogAward);
		map.put("userChip", userChip);
		apiResult.setResult(map);
		return apiResult;
	}
	/**
	 * 双向分享
	 * @param user_id
	 * @param invite_id
	 * @param time
	 * @return
	 */
	
	@RequestMapping("/presentChip")
	@ResponseBody
	public ApiResult presentChip(Integer user_id,Integer invite_id){
		UserInfo ciuserInfo=userService.selectUserByUserId(user_id);
		UserInfo zhuuserInfo=userService.selectUserInfoByInviteId(invite_id);
		if(zhuuserInfo==null||ciuserInfo==null){
			return new ApiResult(Code.MissParam,"输入的邀请码不存在~");
		}
		if(ciuserInfo==zhuuserInfo){
			return new ApiResult(203,"不可以输入自己哦~");
		}
		Date date =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String add_time=sdf.format(date);
		int count=userChipInfoService.selectCountByDate(user_id, add_time);
		if(count>=3){
			return new ApiResult(202,"分享次数已到上限，无法继续获取");
		}
		int result =userChipInfoService.selectCountByDateOnePerson(ciuserInfo.getUser_id(), add_time, zhuuserInfo.getUser_id());
		if(result>0){
			return new ApiResult(203,"已经添加过该邀请码了哦~");
		}
		UserChip zhuuserChip=userChipService.selectUserChipByUser(zhuuserInfo.getUser_id());
		UserChip ciuserChip=userChipService.selectUserChipByUser(ciuserInfo.getUser_id());
		String chip=VocalConcertUtil.getChip();
		int chip_num=0;
		int chip_num2=0;
//		if(chip.equals("chip_one")){
//			ciuserChip.setChip_one(ciuserChip.getChip_one()+1);
//			chip_num=1;
//			userChipService.updateChip(ciuserChip);
//		}else if(chip.equals("chip_two")){
//			ciuserChip.setChip_two(ciuserChip.getChip_two()+1);
//			chip_num=2;
//			userChipService.updateChip(ciuserChip);
//		}else if(chip.equals("chip_thr")){
//			ciuserChip.setChip_thr(ciuserChip.getChip_thr()+1);
//			chip_num=3;
//			userChipService.updateChip(ciuserChip);
//		}else if(chip.equals("chip_for")){
//			ciuserChip.setChip_for(ciuserChip.getChip_for()+1);
//			chip_num=4;
//			userChipService.updateChip(ciuserChip);
//		}else if(chip.equals("chip_fiv")){
//			ciuserChip.setChip_fiv(ciuserChip.getChip_fiv()+1);
//			chip_num=5;
//			userChipService.updateChip(ciuserChip);
//		}
		String chip2=VocalConcertUtil.getChip();
		if(chip2.equals("chip_one")){
			zhuuserChip.setChip_one(zhuuserChip.getChip_one()+1);
			chip_num2=1;
			userChipService.updateChip(zhuuserChip);
		}else if(chip2.equals("chip_two")){
			zhuuserChip.setChip_two(zhuuserChip.getChip_two()+1);
			chip_num2=2;
			userChipService.updateChip(zhuuserChip);
		}else if(chip2.equals("chip_thr")){
			zhuuserChip.setChip_thr(zhuuserChip.getChip_thr()+1);
			chip_num2=3;
			userChipService.updateChip(zhuuserChip);
		}else if(chip2.equals("chip_for")){
			zhuuserChip.setChip_for(zhuuserChip.getChip_for()+1);
			chip_num2=4;
			userChipService.updateChip(zhuuserChip);
		}else if(chip2.equals("chip_fiv")){
			zhuuserChip.setChip_fiv(zhuuserChip.getChip_fiv()+1);
			chip_num2=5;
			userChipService.updateChip(zhuuserChip);
		}
//		UserChipInfo userChipInfo=new UserChipInfo();
//		userChipInfo.setUser_id(ciuserInfo.getUser_id());
//		userChipInfo.setAno_user_id(zhuuserInfo.getUser_id());
//		userChipInfo.setAdd_time(new Date());
//		userChipInfo.setType(3);
//		userChipInfo.setChip(chip_num);
//		userChipInfo.setStatus(1);
//		userChipInfo.setMessage("用户:"+ciuserInfo.getUser_id()+"用邀请码获得"+chip+"号碎片");
//		userChipInfoService.insertUserChipInfo(userChipInfo);
		UserChipInfo anoUserChipInfo=new UserChipInfo();
		anoUserChipInfo.setUser_id(zhuuserInfo.getUser_id());
		anoUserChipInfo.setAno_user_id(ciuserInfo.getUser_id());
		anoUserChipInfo.setAdd_time(new Date());
		anoUserChipInfo.setType(3);
		anoUserChipInfo.setChip(chip_num2);
		anoUserChipInfo.setStatus(1);
		anoUserChipInfo.setMessage("用户："+zhuuserInfo.getUser_id()+"被邀请获得"+chip2+"号碎片");
		userChipInfoService.insertUserChipInfo(anoUserChipInfo);
		ApiResult apiResult=new ApiResult();
		return apiResult;
	}
}
