package com.frog.controller.interceptor;

public interface RequestCountRpcService  {
	 public void ipCount(String ip, Integer count);
	 
	 public void userCount(String phone, Integer count);
	 
	 public void clear(String key, String hashKey);
	 
	 public void add(String key, String hashKey, Integer count);
	 
	 public Integer get(String key, String hashKey);
	 
}
