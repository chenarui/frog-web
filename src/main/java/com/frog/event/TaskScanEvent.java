package com.frog.event;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationEvent;

public class TaskScanEvent extends ApplicationEvent {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(TaskScanEvent.class);
	private Integer user_id;

	public TaskScanEvent(Object source) {
		super(source);
	}

	public TaskScanEvent(Object source, Integer user_id) {
		super(source);
		this.user_id = user_id;
		logger.info("用户的userId{}" + user_id + "时间time{}" + String.valueOf(super.getTimestamp()));

	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
}
