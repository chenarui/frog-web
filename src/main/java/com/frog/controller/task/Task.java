package com.frog.controller.task;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.frog.model.FrogTask;
import com.frog.model.vo.TaskVo;
import com.frog.service.TaskService;


/**
 * 生日送积分
 *
 */
@Service
public class Task {
	private Logger logger=LoggerFactory.getLogger(Task.class);
	@Autowired
	private TaskService taskService;
	
	@Scheduled(cron="0 */1 * * * ? ") //1分钟触发一次
	public void setOrderRefuse(){
		
		logger.info("------开始存入任务信息------");
		
	}
	@Scheduled(cron="0 */1 * * * ? ") //自动关闭订单
	public void closeOrder(){

		logger.info("订单被关闭");
	}
}