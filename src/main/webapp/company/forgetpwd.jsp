<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>忘记密码</title>
<meta name="keywords"
	content="Bootstrapæ¨¡ç,Bootstrapæ¨¡çä¸è½½,Bootstrapæç¨,Bootstrapä¸­æ" />
<meta name="description"
	content="ç«é¿ç´ ææä¾Bootstrapæ¨¡ç,Bootstrapæç¨,Bootstrapä¸­æç¿»è¯ç­ç¸å³Bootstrapæä»¶ä¸è½½" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- basic styles -->

<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<!-- 		<link rel="stylesheet" href="./css/regist.css"> -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jQuery.md5.js"></script>
<script src="js/common.js"></script>
<link rel="stylesheet" href="css/regist.css">
<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

<!-- page specific plugin styles -->


<!-- ace styles -->

<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
.width-35 {
	width: 100% !important;
}

#login-box {
	height: 370px;
	background: #f7f7f7;
}

.inline {
	margin-top: 15px;
}

.login-layout label {
	margin-bottom: 20px;
}

.loginType {
	text-align: center;
	margin-bottom: 15px;
}

.text {
	cursor: pointer;
}

.vcode_input {
	width: 150px;
	height: 35px !important;
}

.pho_input {
	height: 35px !important;
	width: 290px;
}

.pwd_input {
	width: 290px;
	height: 35px !important;
}

.reg {
	width: 290px;
	height: 35px !important;
}

.login {
	width: 290px;
	height: 35px !important;
}

.vcode_text {
	height: 35px !important;
	font-size: 15px;
	line-height: 36px;
	cursor: pointer;
}

.reglog_btn {
	margin-top: 15px;
	width: 290px;
	height: 59px;
	font-size: 20px;
	text-align: center;
	line-height: 35px;
	cursor: pointer;
}

.loginbtn {
	text-align: left;
	margin-top: 30px;
	cursor: pointer;
	color: blue;
}
</style>
</head>

<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<div style="height: 100px"></div>
							<h1>
								<span class="white"></span> <span class="white">忘记密码</span>
							</h1>
						</div>
						<input value="0" type="hidden" id="reflag">
						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> 请输入您的手机号
										</h4>
										<div class="space-6"></div>
										<form id="loginForm" action="">
											<div class="section_reg_log">
												<div class="phone">
													<input type="text" id="phone_id" class="pho_input"
														onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"
														placeholder="请输入手机号">
												</div>
												<div class="vcode">
													<input type="text" id="vcode_id" class="vcode_input"
														placeholder="请输入验证码">
													<div class="vcode_text" onclick="sendVcode(this);">发送验证码</div>
												</div>
												<div class="pwd">
													<input type="password" id="pwd_id" class="pwd_input"
														maxlength="20" placeholder="密码长度6至20位,不能包含空格"
														onkeyup="this.value=this.value.replace(/\s+/g,'')">
												</div>
												<div class="company_type">
													<div class="reg reglog_btn" onclick="changePWD();">保存</div>
												</div>

											</div>
										</form>
									</div>
									<!-- /widget-body -->
								</div>
								<!-- /login-box -->

							</div>
							<!-- /position-relative -->
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
		</div>
	</div>
	<!-- /.main-container -->

	<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
			function show_box(id) {
			 jQuery('.widget-box.visible').removeClass('visible');
			 jQuery('#'+id).addClass('visible');
			}
		</script>
	<!-- <script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + " type='text/javascript'%3E%3C/script%3E"));
</script> -->

	<script type="text/javascript">
	function regist(){
		window.location.href="./regist.jsp";
	}
	
	function goLogin(){
		window.location.href="./login";
	}
	
	function changePWD(){

		var phone = $('#phone_id').val();
		var vcode = $('#vcode_id').val();
		var pwd = $('#pwd_id').val();
		if(pwd.length <6){
            alert("密码长度6-20位");
            return;
        }
		if(!phone || !vcode || !pwd){
			alert("请填写完整");
			return;
		}
		var newpassword = $.md5($.md5(pwd)+pwd);
		//修改密码
		$.ajax({
            url : './changepwd',
            type : "post",
            async: false,
            data:{phone:phone,vcode:vcode,password:newpassword,apptype:3,type:1},
            dataType:'json',
            success : function(msg) {
            	console.log(msg);
                if(msg.c == 2){
                	alert(msg.m);
                	return;
                } else if(msg.c == 1){
                	alert("修改成功");
                	  window.location.href="./login";
                }else{
                	alert("服务异常");
                }
            }
        })
	}
	
	var wait=60;  
	
	function sendVcode(it){
		//防止重复点击
		if($('.vcode_text').text() != '发送验证码'){
			return;
		}
		var phone = $('.pho_input').val();
		if(!phone){
			alert("请输入手机号");
			return;
		}
		//发送验证码
		$.ajax({
            url : './getVCode',
            type : "post",
            async: false,
            //data : $('.form-horizontal').serialize(),// 你的formid
            data:{phone:phone,type:1},
            dataType:'json',
            success : function(msg) {
                //console.log(msg.code);
                if(msg.c == 2){
                	alert(msg.m);
                	return;
                }
            }
        })
        $('.vcode_text').css("background-color","#607D8B");
		time();
	}
	
	function time() {  
        if (wait == 0) {  
        	$('.vcode_text').text("发送验证码");
        	$('.vcode_text').css("background-color","#1da1f2");
            wait = 60;  
        } else {  
        	$('.vcode_text').text("发送验证码(" + wait + ")");
            wait--;  
            setTimeout(function() {  
                time()  
            },  
            1000)  
        }  
    }  
</script>

</body>
</html>
