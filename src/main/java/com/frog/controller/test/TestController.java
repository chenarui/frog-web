package com.frog.controller.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frog.common.Result.ApiResult;
import com.frog.model.TaskAward;
import com.frog.service.FrogActivityAwardHisService;
import com.frog.service.StatisticsService;
import com.frog.service.TaskAwardService;

@Controller
@RequestMapping("/user/test")
public class TestController {

	@Autowired
	private TaskAwardService service;
	@Autowired
	private FrogActivityAwardHisService faahs;
	@Autowired
	private StatisticsService statisticsService;
	
	@RequestMapping("getTaskAward")
	@ResponseBody
	private ApiResult getTask(Integer id){
		ApiResult result = new ApiResult();
		TaskAward award = service.getTaskAwardById(id);
		if (award ==null){
			result.setCode(3);
			result.setMessage("查询失败");
			return result;
		}
		result.setResult(award);
		return result;
	}
	
	@RequestMapping("getAllAwards")
	@ResponseBody
	private ApiResult getAllTasks(){
		ApiResult result = new ApiResult();
		List<TaskAward> lists = service.getAllTaskAward(0);
		if (lists == null || lists.size()==0){
			result.setCode(3);
			result.setMessage("未查找到信息");
			return result;
		}
		result.setResult(lists);
		return result;
	}
	
	@RequestMapping("getAward")
	@ResponseBody
	private ApiResult getAllTasks1(Integer user_id,String state){
		ApiResult result = new ApiResult();
		result.setResult(faahs.getFAAHSByUseridAndState(user_id, state));
		return result;
	}
	
	@RequestMapping("getOrderList")
	@ResponseBody
	private ApiResult getOrderList(Integer user_id){
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
		result.setResult(statisticsService.getAllTakeHiss(user_id, page,2));
		return result;
	}
}
