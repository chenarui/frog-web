package com.frog.controller.interceptor;

import java.util.Date; 
import java.util.concurrent.TimeUnit; 

import org.springframework.stereotype.Service;

import com.frog.common.CommonUtils;
import com.frog.common.Constant;
@Service("requestCountRpcService") 
public class RequestCountRpcServiceImpl extends AbstractBaseRedisService<String, Object> implements RequestCountRpcService {


	public void ipCount(String ip, Integer count) {
	   String curDate = CommonUtils.getTimeFormat(new Date(), "yyyyMMdd");
       String key = curDate+Constant.IP_LIMIT_KEY_SUFFIX; 
       Integer oldCount = get(key,ip); 
       oldCount = oldCount+count; 
       add(key, ip,oldCount); 
	}

	
	public void userCount(String phone, Integer count) {
		String curDate = CommonUtils.getTimeFormat(new Date(), "yyyyMMdd");
        String key = curDate+Constant.USER_LIMIT_KEY_SUFFIX; 
        Integer oldCount = get(key,phone); 
        oldCount = oldCount+count; 
        add(key,phone,oldCount); 
	}


	public void clear(String key, String hashKey) {
		 redisTemplate.opsForHash().delete(key, hashKey); 
		
	}


	public void add(String key, String hashKey, Integer count) {
	   String countStr = count==null?"0":count.toString(); 
       redisTemplate.opsForHash().put(key,hashKey, countStr); 
       redisTemplate.expire(key, 24*60*2, TimeUnit.MINUTES); 
		
	}


	public Integer get(String key, String hashKey) {
		 String val = (String)redisTemplate.opsForHash().get(key, hashKey); 
       if(CommonUtils.isEmptyString(val)){ 
           return 0; 
       } 

       return Integer.parseInt(val); 
	} 
}