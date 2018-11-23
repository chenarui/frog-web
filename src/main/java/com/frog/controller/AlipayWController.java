package com.frog.controller;
//
//
//	import java.util.Calendar;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Set;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONArray;
//import com.alibaba.fastjson.JSONObject;
//import com.alipay.api.AlipayApiException;
//import com.alipay.api.AlipayClient;
//import com.alipay.api.domain.AlipayTradeAppPayModel;
//import com.alipay.api.internal.util.AlipaySignature;
//import com.alipay.api.request.AlipayTradeAppPayRequest;
//import com.alipay.api.request.AlipayTradePagePayRequest;
//import com.alipay.api.request.AlipayTradeWapPayRequest;
//import com.alipay.api.response.AlipayTradeAppPayResponse;
//import com.redis.utils.RedisUtil;
//import com.utils.HttpClientUtils;  
//	  
//	@Controller  
//	@RequestMapping(value = "/alipay")  
//	public class AlipayWController {  
//		@Resource
//	  
//	    //公众号支付(网站支付)  
//	    @RequestMapping(value = "/wapPay", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)  
//	    public void wapPay(AlipayPayRequest request, HttpServletResponse httpResponse) {  
//	        if (request.getUid() != 0 && request.getItemId() != null) {  
//	            int money = 0 ;//充值金额  
//	            String querywolfurl = AlipayConfig.diamond_url;//公众号充值钻石表  
//	            String string = HttpClientUtils.executePost(querywolfurl, null, "utf-8");//充值表,使用了一个自定义的post请求  
//	            JSONArray jsona = JSONArray.parseArray(string);  
//	            if (jsona.size() > 0) {  
//	                for (int i = 0; i < jsona.size(); i++) {  
//	                    JSONObject job = jsona.getJSONObject(i);  
//	                    if ((job.getString("recharge_price_id")).equals(request.getItemId())) {  
//	                        money = Integer.parseInt(job.getString("amount").substring(0, job.getString("amount").indexOf(".")));  
//	                        break;  
//	                    }  
//	                }  
//	            }  
//	            long timeStart = Calendar.getInstance().getTimeInMillis();  
//	            String out_trade_no = request.getUid() + "_" + timeStart;// 订单号  
//	  
//	            AlipayClient alipayClient = AlipayConfig.getAlipayClient(); // 获得初始化的AlipayClient  
//	            AlipayTradeWapPayRequest alipayRequest = new AlipayTradeWapPayRequest();// 创建API对应的request  
//	            alipayRequest.setReturnUrl(AlipayConfig.return_url);// 付款成功后,页面重定向通知  
//	            alipayRequest.setNotifyUrl(AlipayConfig.notify_url);// 服务器通知  
//	  
//	            Map<String, Object> map = new HashMap<String, Object>();  
//	            map.put("out_trade_no", out_trade_no);// 订单号  
//	            map.put("total_amount", money);// 交易金额,单位:元  
//	            map.put("subject", request.getSubject());// 订单标题  
//	            map.put("product_code", "QUICK_WAP_PAY");// 销售产品码  
//	            map.put("timeout_express", "90m");// 该笔订单允许的最晚付款时间，逾期将关闭交易  
//	            alipayRequest.setBizContent(JSON.toJSONString(map));  
//	  
//	            try {  
//	                String form = alipayClient.pageExecute(alipayRequest).getBody(); // 调用SDK生成表单  
//	                System.err.println(form);  
//	                httpResponse.setContentType("text/html;charset=" + AlipayConfig.CHARSET);  
//	                httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面  
//	                httpResponse.getWriter().flush();  
//	                RedisUtil.setValueTime(out_trade_no, "1", 2 * 24 * 60 * 60);//创建订单保存2天有限期  
//	            } catch (Exception e) {  
//	                e.printStackTrace();  
//	            }  
//	        }  
//	    }  
//	      
//	    // APP支付  
//	    @ResponseBody  
//	    @RequestMapping(value = "/appPay", method = RequestMethod.POST)  
//	    public String appPay(AlipayPayRequest request) {  
//	        if (request.getUid() != 0 && request.getItemId() != null) {  
//	            //app端的充值表放在redis中  
//	            JSONArray json = JSONArray.parseArray(RedisUtil.getByKey("RechargeMeter"));  
//	            String money = "" ;//充值金额  
//	            if (json.size() > 0) {  
//	                for (int i = 0; i < json.size(); i++) {  
//	                    JSONObject job = json.getJSONObject(i);  
//	                    if ((job.getString("itemId")).equals(request.getItemId())){  
//	                        money = (String) job.get("money");  
//	                        break;  
//	                    }  
//	                }  
//	            }  
//	            if(money.equals("")){  
//	                //支付的商品id不存在,返回异常信息  
//	                return JSON.toJSONString("error");  
//	            }  
//	            long timeStart = Calendar.getInstance().getTimeInMillis();  
//	            String out_trade_no = request.getUid() + "_" + timeStart;// 订单号  
//	            // 实例化客户端  
//	            AlipayClient alipayClient = AlipayConfig.getAlipayClient(); // 获得初始化的AlipayClient  
//	            // 实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay  
//	            AlipayTradeAppPayRequest alipayRequest = new AlipayTradeAppPayRequest();  
//	            // SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式(model和biz_content同时存在的情况下取biz_content)。  
//	            AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();  
//	            model.setSubject(request.getSubject());  
//	            model.setOutTradeNo(out_trade_no);  
//	            model.setTimeoutExpress("30m");  
//	            model.setTotalAmount(money);  
//	            model.setProductCode("QUICK_MSECURITY_PAY");  
//	            alipayRequest.setBizModel(model);  
//	            alipayRequest.setNotifyUrl(AlipayConfig.APPnotify);  
//	            try {  
//	                // 这里和普通的接口调用不同，使用的是sdkExecute  
//	                AlipayTradeAppPayResponse alipayResponse = alipayClient.sdkExecute(alipayRequest);  
//	                System.out.println(alipayResponse.getBody());// 就是orderString可以直接给客户端请求，无需再做处理。  
//	                RedisUtil.setValueTime(out_trade_no, "1", 2 * 24 * 60 * 60);//创建订单保存2天有限期  
//	                return alipayResponse.getBody();  
//	            } catch (AlipayApiException e) {  
//	                e.printStackTrace();  
//	            }  
//	        }  
//	        return null;  
//	    }  
//	  
//	    // 扫码支付  
//	    @ResponseBody  
//	    @RequestMapping(value = "/pagePay", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)  
//	    public String pagePay(AlipayPayRequest request) {  
//	        if (request.getUid() != 0 && request.getItemId() != null) {  
//	            int money = 0 ;//充值金额  
//	            String querywolfurl = AlipayConfig.diamond_url;//公众号充值钻石表  
//	            String string = HttpClientUtils.executePost(querywolfurl, null, "utf-8");//充值表  
//	            JSONArray jsona = JSONArray.parseArray(string);  
//	            if (jsona.size() > 0) {  
//	                for (int i = 0; i < jsona.size(); i++) {  
//	                    JSONObject job = jsona.getJSONObject(i);  
//	                    if ((job.getString("recharge_price_id")).equals(request.getItemId())) {  
//	                        money = Integer.parseInt(job.getString("amount").substring(0, job.getString("amount").indexOf(".")));  
//	                        break;  
//	                    }  
//	                }  
//	            }  
//	            long timeStart = Calendar.getInstance().getTimeInMillis();  
//	            String out_trade_no = request.getUid() + "_" + timeStart;// 订单号  
//	            AlipayClient alipayClient = AlipayConfig.getAlipayClient(); // 获得初始化的AlipayClient  
//	            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();// 创建API对应的request  
//	            alipayRequest.setReturnUrl(AlipayConfig.OWreturn_url);// 回跳地址  
//	            alipayRequest.setNotifyUrl(AlipayConfig.OWnotify_url);// 通知地址  
//	            Map<String, Object> map = new HashMap<String, Object>();  
//	            map.put("out_trade_no", out_trade_no);// 订单号  
//	            map.put("product_code", "FAST_INSTANT_TRADE_PAY");// 销售产品码  
//	            map.put("total_amount", money);// 交易金额,单位:元  
//	            map.put("subject", "钻石");// 订单标题  
//	            alipayRequest.setBizContent(JSON.toJSONString(map));  
//	            try {  
//	                String form = alipayClient.pageExecute(alipayRequest).getBody(); // 调用SDK生成表单  
//	                System.out.println("---------支付宝扫码---------> " + form);// 就是orderString可以直接给客户端请求，无需再做处理。  
//	                RedisUtil.setValueTime(out_trade_no, "1", 2 * 24 * 60 * 60);//创建订单保存2天有限期  
//	                return form;  
//	                  
//	            } catch (AlipayApiException e) {  
//	                e.printStackTrace();  
//	            }  
//	        }  
//	        return null;  
//	    }  
//	      
//	    // 公众号(网站)--支付成功后回调方法  
//	    @RequestMapping(value = "/notify", method = RequestMethod.POST)  
//	    public void notify(HttpServletRequest request, HttpServletResponse httpResponse) {  
//	        // 获取支付宝POST过来反馈信息  
//	        Map<String, String> params = new HashMap<String, String>();  
//	        Map<String, String[]> requestParams = request.getParameterMap();  
//	        Set<String> keySet = requestParams.keySet();  
//	        String out_trade_no = "";  
//	        String trade_status = "";  
//	        String total_amount = "";  
//	        for (String key : keySet) {  
//	            StringBuffer buffer = new StringBuffer();  
//	            for (String string : requestParams.get(key)) {  
//	                buffer.append(string);  
//	            }  
//	            params.put(key, buffer.toString());  
//	            if (key.equals("out_trade_no")) {  
//	                out_trade_no = buffer.toString();// 商户订单号  
//	                System.out.println(key + " : " + buffer.toString());  
//	            } else if (key.equals("trade_status")) {  
//	                trade_status = buffer.toString();// 交易状态  
//	                System.out.println(key + " : " + buffer.toString());  
//	            } else if (key.equals("total_amount")) {  
//	                total_amount = buffer.toString().substring(0,buffer.toString().length()-3) + "";// 充值金额  
//	                System.out.println(key + " : " + total_amount);  
//	            }  
//	        }  
//	        try {  
//	            // 计算得出通知验证结果  
//	            boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayConfig.ALIPAY_PUBLIC_KEY,  
//	                    AlipayConfig.CHARSET, AlipayConfig.SIGNTYPE);  
//	              
//	            if (verify_result) {// 验证成功  
//	                if (trade_status.equals("TRADE_SUCCESS")) { // 交易支付成功  
//	                    boolean contains = RedisUtil.getAllkeys().contains(out_trade_no);  
//	                    if((contains && !RedisUtil.getByKey(out_trade_no).equals("3")) || !contains){  
//	                        RedisUtil.setValue(out_trade_no, "2");// 支付成功,未加钻石  
//	                          
//	                        //获取订单信息,传到业务层,修改数据库  
//	                        String uid = out_trade_no.substring(0, out_trade_no.indexOf("_"));  
//	                        int diamond = 0;// 钻石  
//	                        String querywolfurl = AlipayConfig.diamond_url;//公众号充值钻石表  
//	                        String string = HttpClientUtils.executePost(querywolfurl, null, "utf-8");//充值表  
//	                        JSONArray jsona = JSONArray.parseArray(string);  
//	                        if (jsona.size() > 0) {  
//	                            for (int i = 0; i < jsona.size(); i++) {  
//	                                JSONObject job = jsona.getJSONObject(i);  
//	                                if (job.getString("amount").substring(0, job.getString("amount").indexOf(".")).equals(total_amount)) {  
//	                                    diamond = Integer.parseInt(job.getString("jewel_amount"));// 钻石  
//	                                    break;  
//	                                }  
//	                            }  
//	                        }  
//	                        System.out.println("diamond : "+ diamond);  
//	                          
//	                        //........  
//	                        if(修改数据库失败){  
//	                            System.out.println("增加钻石失败--网络异常");  
//	                        }else{  
//	                            RedisUtil.setValue(out_trade_no, "3");// 增加钻石成功  
//	                            System.out.println("增加钻石成功");  
//	                            httpResponse.getWriter().println("success");  
//	                        }  
//	                          
//	                    }  
//	                }  
//	            } else {// 验证失败  
//	                httpResponse.getWriter().println("fail");  
//	            }  
//	        } catch (Exception e) {  
//	            e.printStackTrace();  
//	        }  
//	    }  
//	      
//	    // APP--支付成功后回调方法  
//	    @RequestMapping(value = "/APPnotify", method = RequestMethod.POST)  
//	    public void APPnotify(HttpServletRequest request, HttpServletResponse httpResponse) {  
//	        // 获取支付宝POST过来反馈信息  
//	        Map<String, String> params = new HashMap<String, String>();  
//	        Map<String, String[]> requestParams = request.getParameterMap();  
//	        Set<String> keySet = requestParams.keySet();  
//	        String out_trade_no = "";  
//	        String trade_status = "";  
//	        String total_amount = "";  
//	        for (String key : keySet) {  
//	            StringBuffer buffer = new StringBuffer();  
//	            for (String string : requestParams.get(key)) {  
//	                buffer.append(string);  
//	            }  
//	            params.put(key, buffer.toString());  
//	            if (key.equals("out_trade_no")) {  
//	                out_trade_no = buffer.toString();// 商户订单号  
//	                System.out.println(key + " : " + buffer.toString());  
//	            } else if (key.equals("trade_status")) {  
//	                trade_status = buffer.toString();// 交易状态  
//	                System.out.println(key + " : " + buffer.toString());  
//	            } else if (key.equals("total_amount")) {  
//	                total_amount = buffer.toString().substring(0,buffer.toString().length()-3) + "";// 充值金额  
//	                System.out.println(key + " : " + total_amount);  
//	            }  
//	        }  
//	        try {  
//	            // 计算得出通知验证结果  
//	            boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayConfig.ALIPAY_PUBLIC_KEY,  
//	                    AlipayConfig.CHARSET, AlipayConfig.SIGNTYPE);  
//	  
//	            if (verify_result) {// 验证成功  
//	                if (trade_status.equals("TRADE_SUCCESS")) { // 交易支付成功  
//	                    boolean contains = RedisUtil.getAllkeys().contains(out_trade_no);  
//	                    if((contains && !RedisUtil.getByKey(out_trade_no).equals("3")) || !contains){  
//	                        RedisUtil.setValue(out_trade_no, "2");// 支付成功,未加钻石  
//	                          
//	                        //获取订单信息,传到业务层,修改数据库  
//	                        String uid = out_trade_no.substring(0, out_trade_no.indexOf("_"));  
//	                          
//	                        JSONArray json = JSONArray.parseArray(RedisUtil.getByKey("RechargeMeter"));  
//	                        int diamond = 0;  
//	                        if (json.size() > 0) {  
//	                            for (int i = 0; i < json.size(); i++) {  
//	                                JSONObject job = json.getJSONObject(i);  
//	                                if (job.get("money").equals(total_amount)) {  
//	                                    diamond = Integer.parseInt((String) job.get("ADiamonds"));  
//	                                    break;  
//	                                }  
//	                            }  
//	                        }  
//	                        System.out.println("diamond : "+ diamond);  
//	  
//	                        //........  
//	                        if(修改数据库失败){  
//	                            System.out.println("增加钻石失败--网络异常");  
//	                        }else{  
//	                            RedisUtil.setValue(out_trade_no, "3");// 增加钻石成功  
//	                            System.out.println("增加钻石成功");  
//	                            httpResponse.getWriter().println("success");  
//	                        }  
//	                    }  
//	                }  
//	            } else {// 验证失败  
//	                httpResponse.getWriter().println("fail");  
//	            }  
//	        } catch (Exception e) {  
//	            e.printStackTrace();  
//	        }  
//	    }  
//	      
//	    // 扫码--支付成功后回调方法  
//	    @RequestMapping(value = "/OWnotify", method = RequestMethod.POST)  
//	    public void OWnotify(HttpServletRequest request, HttpServletResponse httpResponse) {  
//	        // 获取支付宝POST过来反馈信息  
//	        Map<String, String> params = new HashMap<String, String>();  
//	        Map<String, String[]> requestParams = request.getParameterMap();  
//	        Set<String> keySet = requestParams.keySet();  
//	        String out_trade_no = "";  
//	        String trade_status = "";  
//	        String total_amount = "";  
//	        for (String key : keySet) {  
//	            StringBuffer buffer = new StringBuffer();  
//	            for (String string : requestParams.get(key)) {  
//	                buffer.append(string);  
//	            }  
//	            params.put(key, buffer.toString());  
//	            if (key.equals("out_trade_no")) {  
//	                out_trade_no = buffer.toString();// 商户订单号  
//	                System.out.println(key + " : " + buffer.toString());  
//	            } else if (key.equals("trade_status")) {  
//	                trade_status = buffer.toString();// 交易状态  
//	                System.out.println(key + " : " + buffer.toString());  
//	            } else if (key.equals("total_amount")) {  
//	                total_amount = buffer.toString().substring(0,buffer.toString().length()-3) + "";// 充值金额  
//	                System.out.println(key + " : " + total_amount);  
//	            }  
//	        }  
//	        try {  
//	            // 计算得出通知验证结果  
//	            boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayConfig.ALIPAY_PUBLIC_KEY,  
//	                    AlipayConfig.CHARSET, AlipayConfig.SIGNTYPE);  
//	            if (verify_result) {// 验证成功  
//	                if (trade_status.equals("TRADE_SUCCESS")) { // 交易支付成功  
//	                    boolean contains = RedisUtil.getAllkeys().contains(out_trade_no);  
//	                    if((contains && !RedisUtil.getByKey(out_trade_no).equals("3")) || !contains){  
//	                        RedisUtil.setValue(out_trade_no, "2");// 支付成功,未加钻石  
//	                          
//	                        //获取订单信息,传到业务层,修改数据库  
//	                        String uid = out_trade_no.substring(0, out_trade_no.indexOf("_"));  
//	                          
//	                        int diamond = 0;// 钻石  
//	                        String querywolfurl = AlipayConfig.diamond_url;//公众号充值钻石表  
//	                        String string = HttpClientUtils.executePost(querywolfurl, null, "utf-8");//充值表  
//	                        JSONArray jsona = JSONArray.parseArray(string);  
//	                        if (jsona.size() > 0) {  
//	                            for (int i = 0; i < jsona.size(); i++) {  
//	                                JSONObject job = jsona.getJSONObject(i);  
//	                                if (job.getString("amount").substring(0, job.getString("amount").indexOf(".")).equals(total_amount)) {  
//	                                    diamond = Integer.parseInt(job.getString("jewel_amount"));// 钻石  
//	                                    break;  
//	                                }  
//	                            }  
//	                        }  
//	                        System.out.println("diamond : "+ diamond);  
//	  
//	                        //........  
//	                        if(修改数据库失败){  
//	                            System.out.println("增加钻石失败--网络异常");  
//	                        }else{  
//	                            RedisUtil.setValue(out_trade_no, "3");// 增加钻石成功  
//	                            System.out.println("增加钻石成功");  
//	                            httpResponse.getWriter().println("success");  
//	                        }  
//	                    }  
//	                }  
//	            } else {// 验证失败  
//	                httpResponse.getWriter().println("fail");  
//	            }  
//	        } catch (Exception e) {  
//	            e.printStackTrace();  
//	        }  
//	    }  
//	      
//	}  
//}
