package com.frog.controller;

public class AlipayPayRequest {
	 private long uid;//用户的uid  
	    private String itemId;// 充值商品id  
	    private String subject;// 订单标题  
		public long getUid() {
			return uid;
		}
		public void setUid(long uid) {
			this.uid = uid;
		}
		public String getItemId() {
			return itemId;
		}
		public void setItemId(String itemId) {
			this.itemId = itemId;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
}
