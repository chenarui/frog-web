package com.frog.eventListen;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;


public class TaskScanEventImpl implements ApplicationListener {

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		// TODO Auto-generated method stub
		
	}
//	private Logger logger=LoggerFactory.getLogger(TaskScanEvent.class);
//@Autowired
//private RedisCache redisCache;
//	@Override
//	public void onApplicationEvent(ApplicationEvent event) {
//		TaskScanEvent  taskScanEvent= new TaskScanEvent(this);
//		StringBuffer buffer= new StringBuffer();
//		buffer.append(Constant.USER_DAY_COUNT_KEY);
//		buffer.append(String.valueOf(taskScanEvent.getUser_id()));
//		String user_id=String.valueOf(taskScanEvent.getUser_id());
//		if (event instanceof TaskScanEvent) {
//					logger.debug("用户："+user_id+"第一次开启扫码"+"开始设置扫码次数");
//					try {
//						redisCache.putCache(buffer.toString(), Constant.USER_SCAN_COUNT);
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//		}else {
//			//用户不是第一次进入
//			logger.debug("用户："+user_id+"不是第一次扫码"+"开始设置扫码次数");
//			try {
//				int count = 0;
//				Integer i=redisCache.getCache(String.valueOf(taskScanEvent.getUser_id()));
//				if (i==0) {
//					count=1;
//				}else{
//					count =count+1;
//				}
//				redisCache.putCache(String.valueOf(taskScanEvent.getUser_id()), count);
//			} catch (Exception e) {
//				
//				e.printStackTrace();
//			}
//			
//		}
//		
//	}
//


}
