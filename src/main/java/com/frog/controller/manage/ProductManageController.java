package com.frog.controller.manage;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.support.Parameter;
import com.alibaba.fastjson.JSONObject;
import com.frog.common.CommonUtils;
import com.frog.common.Constant;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Code;
import com.frog.common.Result.Msg;
import com.frog.model.FrogGoods;
import com.frog.service.CommonService;
import com.frog.service.manage.ManageService;

/**
 * 后台管理
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "manage/product")
public class ProductManageController {
	@Autowired
	private ManageService manageService;

	@Autowired
	private CommonService commonService;

	/**
	 * 获取商品的全部信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getProductList")
	@ResponseBody
	public ApiResult getProductList(String goodsName, Integer page) {
		if (page == null || page <= 0) {
			page = 1;
		}
		return manageService.getAllGoods(goodsName, page);
	}

	/**
	 * 删除商品
	 * 
	 * @param good_id
	 * @return
	 */
	@RequestMapping(value = "/delGoods", method = RequestMethod.POST)
	@ResponseBody
	public ApiResult delGoods(Integer good_id) {
		
		if (good_id == null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}

		return manageService.delGoods(good_id);

	}

	/**
	 * 
	 * @param good_id
	 * @return
	 */
	@RequestMapping(value = "/getGoodsInfo")
	@ResponseBody
	public ApiResult getGoodsInfo(Integer good_id) {
		FrogGoods frogGoods = new FrogGoods();
		//manageService.updateGoodByNum(frogGoods);
		ApiResult result = new ApiResult();
		frogGoods.setGood_id(good_id);
		if (good_id == null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		result.setResult(manageService.getGoodsInfo(good_id));
		manageService.updateGoodByNum(frogGoods);
		//frogGoods.setNum(manageService.updateGoodByNum(frogGoods));
		return result;

	}

	/**
	 * 
	 * @param frogGoods
	 *            good_id goodsinfo balance path goodname
	 * @return
	 */
	@RequestMapping(value = "/modifyGoodsInfo", method = RequestMethod.POST)
	@ResponseBody
	public ApiResult modifyGoods(FrogGoods frogGoods) {
		if (frogGoods.getGood_id() == null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}

		return manageService.updateGoods(frogGoods);

	}

	/***
	 * 上传商品
	 */
	@RequestMapping(value = "/insertGoods", method = RequestMethod.POST)
	@ResponseBody
	public ApiResult insertGoods(String good_name, String path, BigDecimal balance, BigDecimal price,
			String good_info,String type) {
		if (good_name == null || path == null || balance == null || price == null || type == null) {
			return new ApiResult(Code.MissParam, Msg.MissParam);
		}
		return manageService.insertGoods(good_name, path, balance, price, good_info,type);
	}

	/**
	 * 上传商品获取七牛云token
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/getToken", method = RequestMethod.POST)
	@ResponseBody
	public ApiResult getToken() throws Exception {

		ApiResult apiResult = new ApiResult();
		// JSONObject _json = new JSONObject();
		// long _dataline = System.currentTimeMillis() / 1000 + 3600;
		// _json.put("deadline", _dataline);// 有效时间为一个小时
		// _json.put("scope", Constant.qiniu_scope);//七牛空间名
		// String _encodedPutPolicy =
		// Base64Helper.encode(_json.toString().getBytes());
		// byte[] _sign = CommonUtils.HmacSHA1Encrypt(_encodedPutPolicy,
		// Constant.qiniu_seret);
		// String _encodedSign = Base64Helper.encode(_sign);
		//// Log.d("xxxx", _encodedSign);
		// String token = Constant.qiniu_key + ':' + _encodedSign + ':' +
		// _encodedPutPolicy;
		String token = commonService.qiniu_token();
		Map<String, String> map = new HashMap<String, String>();
		map.put("token", token);
		apiResult.setResult(map);
		return apiResult;
	}

	/**
	 * 模糊查询
	 */
	@RequestMapping(value = "/getFrogGoods")
	@ResponseBody
	public List<FrogGoods> getFrogGoods(String good_name) {
//		ApiResult result = new ApiResult();
		//result.setResult(manageService.getFrogGoods(good_name));
		return manageService.getFrogGoods(good_name);
	}
	
	
	/**
	 * 分类
	 */
	@RequestMapping(value = "/getFrogGoodsByType")
	@ResponseBody
	public ApiResult getFrogGoodsByType(String type){
//		if (page == null || page <= 0) {
//			page = 1;
//		}
		//ApiResult result = new ApiResult();
		//result.setResult();
		return manageService.getGoodsByType(type);
		
	}
	
	//更改次数
//	@RequestMapping(value = "/getFrogGoodsByNum")
//	@ResponseBody
//	public ApiResult getFrogGoodsByNum(FrogGoods frogGoods){
//		ApiResult result = new ApiResult();
//		result.setResult(manageService.updateGoodByNum(frogGoods));
//		return result;
//	}
	
	//查询点击量
	@RequestMapping(value = "/getFrogGoodsByNum")
	@ResponseBody
	public ApiResult getFrogGoodsByNum(FrogGoods frogGoods){
		ApiResult result = new ApiResult();
		result.setResult(manageService.selectGoodByNum(frogGoods));
		return result;
	}
}
