<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>智慧物流</title>
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
	height: 310px;;
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
								<span class="white">智慧物流</span> <span class="white">企业端</span>
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
											<i class="icon-coffee green"></i> 请输入您的手机密码
										</h4>

										<div class="space-6"></div>
										<div id="msg" class="errors" style="color: red">${message}</div>
										<form id="loginForm" action="">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														id="username" value="${username}" name="username"
														type="text" class="form-control" placeholder="请输入您的手机" />
														<i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														id="password" name="password" type="password"
														class="form-control" placeholder="请输入您的密码"
														onkeyup="this.value=this.value.replace(/\s+/g,'')" /> <i
														class="icon-lock"></i>
												</span>
												</label> <span class="member-password total-float"></span>
												<button type="button" onclick="submitaction()"
													class="width-35 pull-right btn btn-sm btn-primary">
													<i class="icon-key"></i> 登录
												</button>
												<!-- <section class="row">
												
													<label for="password" style=" margin-left: 12px;">验证码:</label>
												<input  name="logincode"  id="logincode" type="text" class="logincode"  tabindex="3"style="width: 129px;" />
													<img class="required"  style="cursor:pointer;" src="createImg" onclick="this.setAttribute('src','createImg?x='+Math.random());" alt="验证码" title="点击更换" />
												</section> -->

												<div class="space"></div>

												<div class="clearfix">
													<!-- <label class="inline">
															<input type="checkbox" class="ace" id="ace" onclick="remember();" />
															<span class="lbl" style="font-size: 10px;">记住我</span>
														</label> -->
													<label class="inline"> <span class="lbl"
														style="font-size: 13px; cursor: pointer;"
														onclick="regist();">注册</span>
													</label> <label class="inline" style="float: right"> <span
														class="lbl" style="font-size: 13px; cursor: pointer;"
														onclick="forgetpwd();">忘记密码</span>
													</label>
												</div>

												<!-- 	<div class="loginType">其他登录方式</div>
											       Unnamed ()
											       <div id="u17" class="text" style="float:left;">
											         <img id="u16_img" class="img " src="img/u16.png" tabindex="0">
											         <p style="margin: -39px 19px 10px;"><span>qq</span></p>
											       </div>
     												 <div id="u17" class="text" style="float:left;margin-left: 59px;">
											         <img id="u16_img" class="img " src="img/u16.png" tabindex="0">
											         <p style="margin: -39px 17px 10px;"><span>微信</span></p>
											       </div>
											        <div id="u17" class="text" style="float:left;margin-left: 47px;width: 60px;">
											         <img id="u16_img" class="img " src="img/u16.png" tabindex="0">
											         <p style=" margin: -39px 12px 11px;width: 51px;"><span>支付宝</span></p>
											       </div> -->
											</fieldset>
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
$(function(){
	var cookieusername = $.cookie('lvguoguoUsername') ? $.cookie('lvguoguoUsername') : "";
	var cookiepassword = $.cookie('lvguoguoPassword') ? $.cookie('lvguoguoPassword') : "";
	var rememberInfo = $.cookie('lvguoguoInfo') ? $.cookie('lvguoguoInfo') : "";
	if (cookieusername && cookiepassword && rememberInfo) {
		$("#username").val(cookieusername);
		$("#password").val(cookiepassword);
		$("#reflag").val(1);
		$("#ace").attr("checked","checked");
	}

	var login_account = $("input[name=account]").val();
	var login_password = $("input[name=password]").val();
	if(login_account != "" && login_password  != "" ){
		$("#logintable_submit").css("background","rgb(1,138,254)");
		$("#logintable_submit").attr("onclick","login()");
	}else{
		$("#logintable_submit").css("background","#c9d2da");
		$("#logintable_submit").removeAttr("onclick");
	}
	
});

function remember(){
	var reflag = $("#reflag").val();
	var username = $('#username').val();
	var password = $('#password').val();
	if(reflag == 0){//设置为记住我
		$("#reflag").val(1);
		$.cookie('lvguoguoInfo', '1', {
			expires : 30,
			path : '/',
		});
		$.cookie('lvguoguoUsername', username, {
			expires : 30,
			path : '/',
		});
		$.cookie('lvguoguoPassword', password, {
			expires : 30,
			path : '/',
		});
	}else{//设置为不要记住
		$("#reflag").val(0);
		$.cookie('lvguoguoUsername', '', {
			expires : 30,//有效时间，单位：天
			path : '/',
		//	domain : 'www.inredata.com'
		});
		$.cookie('lvguoguoPassword', '', {
			expires : 30,
			path : '/',
	//		domain : 'www.inredata.com'
		});
		$.cookie('lvguoguoInfo', '', {
			expires : 30,
			path : '/',
	//		domain : 'www.inredata.com'
		});
	}
}

function submitaction(){
    //class上加上required,checkReuqired会自动校验参数，提示title不能为空
        var username = $("#username").val();
        var password = $("#password").val();
        var logincode = $("#logincode").val();
        var newpassword = $.md5($.md5(password)+password);
       // $('input[name=password]').val(password);
        $.ajax({
            url : './toLogin',
            type : "post",
            //data : $('.form-horizontal').serialize(),// 你的formid
            data:{logincode:logincode,phone:username,password:newpassword},
            dataType:'json',
            success : function(msg) {
            	msg = eval('('+msg+')');
                //console.log(msg.code);
                if(msg.code == 0){
                	window.location.href="./login?username="+msg.username+"&message="+msg.message;
                }else{
                	window.location.href="./home";
                }
            }
        })
}
	
	function regist(){
		window.location.href="./zhuce.jsp";
	}
	
	function forgetpwd(){
		window.location.href="./forgetpwd.jsp";
	}
</script>

</body>
</html>
