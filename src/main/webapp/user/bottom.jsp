<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>
<script src="../js/ajaxfileupload.js"></script>
<div class="footer">
	<div class="qr_container">
		<div class="qrcode_box">
			<div class="foot_qr_text">司机端APP</div>
			<div class="qrcode_img_box">
				<img src="" class="qrcode_img">
			</div>
		</div>
		<div class="qrcode_box" style="margin-left: 30px;">
			<div class="foot_qr_text">用户端APP</div>
			<div class="qrcode_img_box">
				<img src="" class="qrcode_img">
			</div>
		</div>
	</div>

	<div class="footer_text">
		<a href="../home/aboutus" style="color: #909aa5;">关于我们</a> <span
			class="line_s">|</span> <a href="../home/aboutus"
			style="color: #909aa5;">帮助中心</a> <span class="line_s">|</span> <a
			href="../home/aboutus" style="color: #909aa5;">服务条款</a> <span
			class="line_s">|</span> <a href="../home/aboutus"
			style="color: #909aa5;">联系我们</a>
	</div>
	<div class="footer_text">Copyright ©2017 杭州星我科技有限公司</div>
</div>


<!--登录注册弹框-->
<div class="mask"></div>
<div class="login">
	<img src="../img/close_w.png" class="close_w">
	<div class="logreg_top">
		<div class="user_sort person_login login_active">个人登录</div>
		<div class="user_sort company_login">企业登录</div>
	</div>
	<input type="hidden" name="type" id="type" value="1">
	<div class="input_box">
		<img src="../img/user.png" class="user_logo"> <input type="text"
			name="phone" id="phone" class="phone_num" placeholder="请输入手机号">
	</div>
	<div class="input_box">
		<img src="../img/lock.png" class="lock_logo"> <input
			type="password" name="password" id="password" class="phone_num"
			placeholder="请输入密码">
	</div>
	<div class="login_message">
		<div class="error_msg" id="error_msg">账号或密码错误</div>
		<div class="forget_pwd">忘记密码？</div>
	</div>

	<div class="login_btn" id="login_btn">登录</div>

	<!--     <div class="third_party">第三方登录</div> -->
	<!--     <div style="width: 100%;height: 35px;"> -->
	<!--         <div class="logo_box"> -->
	<!--             <img src="../img/wechart_logo.png" class="third_logo"> -->
	<!--         </div> -->
	<!--         <div class="logo_box"> -->
	<!--             <img src="../img/qq_logo.png" class="third_logo"> -->
	<!--         </div> -->
	<!--         <div class="logo_box"> -->
	<!--             <img src="../img/alipay.png" class="third_logo"> -->
	<!--         </div> -->
	<!--     </div> -->
	<div style="clear: both;" class="bottom_text">
		还没有账号？<span class="regist_right_now">立即注册</span>
	</div>
</div>

<div class="regist">
	<form action="./register">
		<img src="../img/close_w.png" class="close_w">
		<div class="logreg_top">
			<div class="user_sort person_regist login_active">个人注册</div>
			<div class="user_sort company_regist">企业注册</div>
		</div>
		<input type="hidden" name="type" id="type" value="1">
		<div class="input_box_reg">
			<img src="../img/user.png" class="user_logo"> <input
				type="text" class="phone_num pn_spec" placeholder="请输入手机号"
				name="phone" id="phone" style="width: 305px;"> <span
				class="get_vcdoe" onclick="sendVcode('0')">获取验证码</span>
		</div>
		<div class="input_box_reg" style="margin-top: 20px;">
			<img src="../img/vcode.png" class="user_logo"> <input
				type="text" class="phone_num" placeholder="请输入验证码" name="vcode"
				id="vcode">
		</div>
		<div class="input_box_reg" id="company_name_div"
			style="margin-top: 20px; display: none;">
			<img src="../img/user.png" class="user_logo"> <input
				type="text" class="phone_num" placeholder="请输入公司名称"
				name="company_name" id="company_name">
		</div>
		<div class="input_box_reg" style="margin-top: 20px;">
			<img src="../img/lock.png" class="user_logo"> <input
				type="password" class="phone_num" placeholder="请设置登录密码"
				name="password" id="password"> <img src="../img/checked.png"
				class="checked_logo">
		</div>
		<div class="input_box_reg" style="margin-top: 20px;">
			<img src="../img/lock.png" class="user_logo"> <input
				type="password" class="phone_num" placeholder="请再次确认登录密码"
				name="repassword" id="repassword"> <img
				src="../img/checked.png" class="checked_logo">
		</div>
		<div class="license_pic">
			<span>请上传营业执照</span> <input type="file" name="file" id="file"
				onchange="ajaxFileUpload()"> <img src="../img/defalut.png"
				id="imgs"> <input type="hidden" name="license_id"
				id="license_id" value="">
		</div>
		<div class="vcode_error"></div>

		<div class="reg_btn" id="reg_btn" style="margin-top: 50px;">注册</div>
	</form>
</div>

<div class="bind_phone_num">
	<img src="../img/close_w.png" class="close_w">
	<div class="bind_phone">绑定手机号</div>
	<div class="input_box_reg">
		<img src="../img/user.png" class="user_logo"> <input type="text"
			class="phone_num pn_spec" placeholder="请输入手机号" style="width: 305px;">
		<span class="get_vcdoe">获取验证码</span>
	</div>
	<div class="input_box_reg" style="margin-top: 20px;">
		<img src="../img/vcode.png" class="user_logo"> <input
			type="text" class="phone_num" placeholder="请输入验证码">
	</div>

	<div class="reg_btn">提交</div>

</div>

<div class="modify_pwd">
	<img src="../img/close_w.png" class="close_w">
	<div class="pwd_forget">忘记密码？</div>
	<div class="input_box_reg">
		<img src="../img/user.png" class="user_logo"> <input type="text"
			class="phone_num pn_spec" placeholder="请输入手机号" name="phone"
			id="phone" style="width: 305px;"> <span class="get_vcdoe"
			onclick="sendVcode(1)">获取验证码</span>
	</div>
	<div class="input_box_reg" style="margin-top: 20px;">
		<img src="../img/vcode.png" class="user_logo"> <input
			type="text" class="phone_num" placeholder="请输入验证码" name="vcode"
			id="vcode">
	</div>
	<div class="input_box_reg" style="margin-top: 20px;">
		<img src="../img/lock.png" class="user_logo"> <input type="text"
			class="phone_num" placeholder="请设置登录密码" name="password" id="password">
		<img src="../img/checked.png" class="checked_logo">
	</div>
	<div class="input_box_reg" style="margin-top: 20px;">
		<img src="../img/lock.png" class="user_logo"> <input type="text"
			class="phone_num" placeholder="请再次确认登录密码" name="repassword"
			id="repassword"> <img src="../img/checked.png"
			class="checked_logo">
	</div>
	<div class="vcode_error">验证码有误</div>

	<div class="reg_btn">确定</div>

</div>
<div class="reg_success">
	<img src="../img/checked_big.png" style="margin: 60px 0 30px">
	<div style="font-size: 20px;">注册成功！</div>
	<!--     <div style="font-size: 14px;color: #a7a7a7;margin-top: 15px;">通过企业认证才能下单，马上去认证吧</div> -->
	<div class="reg_btn approve">确认</div>
</div>