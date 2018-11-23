package com.frog.controller.qr.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frog.common.Result.Code;
import com.frog.common.Result.ApiResult;
import com.frog.common.Result.Msg;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 生成二维码图片以及uuid
 * @author fqy
 *　
 */
@Controller
@RequestMapping("/qrLogin")
public class GetQrCodeController {
	  
	    @RequestMapping("/getQR")
	    protected void getQR(HttpServletRequest request, HttpServletResponse response) throws  IOException {
	        PrintWriter out = response.getWriter();
	       /**
	        *  a:生成随机的uuid,是一个唯一标识，该标识贯穿整个流程
	        */
	        int uuid = (int) (Math.random() * 100000);
	        //二维码内容
	        String content = "http://192.168.0.104:8080/frog-web/phoneLogin/login?uuid=" + uuid;
	        //生成二维码
	        String imgName =  uuid + "_" + (int) (new Date().getTime() / 1000) + ".png";
//	        String imgPath = "/home/web/apache/htdocs/QrCodeLogin/" + imgName;
	       /**
	        * b:生成二维码图片，二维码信息：http://ip:8080/QrCodeLoginPro/Login.html?uuid=" + uuid
	        */
	        String imgPath = "D:\\apache\\webapps\\upload\\" + imgName;
//	        TwoDimensionCode handler = new TwoDimensionCode();
//	        handler.encoderQRCode(content, imgPath, "png");
	        
	        //生成的图片访问地址
	        String qrCodeImg = "http://192.168.0.104:8887/upload/" + imgName;
	        String jsonStr = "{\"uuid\":" + uuid + ",\"qrCodeImg\":\"" + qrCodeImg + "\"}";
	        out.print(jsonStr);
	        out.flush();
	        out.close();
	    }
	  
}
