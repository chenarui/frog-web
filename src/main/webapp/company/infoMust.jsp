<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>填写资料</title>
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
<script src="js/ajaxfileupload.js"></script>
<link rel="stylesheet" href="css/infoMust.css">
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
	width: 220px;
	font-size: 20px;
	border: 1px solid #c4cacf;
	padding-left: 16px;
	box-sizing: border-box;
	border-radius: 9px;
}

.pho_input1 {
	height: 35px !important;
	width: 193px;
	font-size: 20px;
	border: 1px solid #c4cacf;
	padding-left: 16px;
	box-sizing: border-box;
	border-radius: 9px;
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

.phone, .vcode, .pwd {
	color: black;
}

.upload {
	padding: 4px 10px;
	height: 20px;
	line-height: 20px;
	position: relative;
	border: 1px solid #999;
	text-decoration: none;
	color: #666;
	margin-left: 21px;
}

.change {
	position: absolute;
	overflow: hidden;
	right: 0;
	top: 0;
	opacity: 0;
	width: 100px;;
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
								<span class="white">必填资料</span>
							</h1>
						</div>
						<input value="0" type="hidden" id="reflag"> <input
							type="hidden" id="Huploadfile1" value="" /> <input
							type="hidden" id="Huploadfile2" value="" /> <input
							type="hidden" id="Huploadfile3" value="" />
						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<div class="space-6"></div>
										<form id="loginForm" action="" enctype="multipart/form-data">
											<div class="section_reg_log">
												<div class="phone">
													公司名称： <input type="text" id="companyName_id"
														class="pho_input" placeholder="请输入公司名称">
												</div>
												<div class="vcode">
													法人姓名： <input type="text" id="name_id" class="pho_input"
														placeholder="请输入法人姓名">
												</div>
												<div class="pwd" style="margin-bottom: 20px;">
													法人身份证号： <input type="text" id="idcard_id"
														class="pho_input1" maxlength="18"
														onkeyup="value=value.replace(/[^(\d)]/g,'')"
														placeholder="请输入法人身份证号">
												</div>
												<div style="float: left;">身份证照</div>
												<div class="" style="margin-bottom: 20px;">
													<a href="javascript:;" class="upload upload1">上传正面照 <input
														class="change" type="file" id="uploadfile1" name="myfile"
														onchange=" ajaxFileUpload(1);" />

													</a> <a href="javascript:;" class="upload upload2">上传反面照 <input
														class="change" type="file" id="uploadfile2" name="myfile"
														onChange=" ajaxFileUpload(2);" />

													</a>
												</div>
												<div style="float: left;">营业执照</div>
												<div class="">
													<a href="javascript:;" class="upload upload3">上传营业执照 <input
														class="change" type="file" id="uploadfile3" name="myfile"
														onChange=" ajaxFileUpload(3);" />

													</a>
												</div>
												<div class="company_type">
													<div class="reg reglog_btn" onclick="registCompany();">注册</div>
													<div class="loginbtn" onclick="goLogin();">登录</div>
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
            data:{phone:phone,type:0},
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
        	$('.vcode_text').text("重新发送(" + wait + ")");
            wait--;  
            setTimeout(function() {  
                time()  
            },  
            1000)  
        }  
    }  
	
	function ajaxFileUpload(n) {
        $.ajaxFileUpload(
            {
                url: '/wuliu-web/company/uploadFile', //用于文件上传的服务器端请求地址
                secureuri: false, //是否需要安全协议，一般设置为false
                fileElementId: 'uploadfile'+n, //文件上传域的ID
                dataType: 'JSON', //返回值类型 一般设置为json
                data:{type:1},
                success: function (data, status){  //服务器成功响应处理函数
                	data = data.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                	data = data.replace(/<PRE.*?>/g, '');
                	data = data.replace("<PRE>", '');
                	data = data.replace("</PRE>", '');
                	data = data.replace("<pre>", '');
                	data = data.replace("</pre>", ''); 
                	data = eval("("+data+")");
                	var dataid = data.r;
                	var gld = eval("("+dataid+")");
//                 	console.log(gld.fileid);
                	$('.upload'+n).text("上传成功！");
                	$('#Huploadfile'+n).val(gld.fileid);
                }
               
            }
        )
    }
	
	function registCompany(){
		var companyName_id = $('#companyName_id').val();
		var name_id = $('#name_id').val();
		var idcard_id = $('#idcard_id').val();
		var Huploadfile1 = $('#Huploadfile1').val();
		var Huploadfile2 = $('#Huploadfile2').val();
		var Huploadfile3 = $('#Huploadfile3').val();
		console.log(Huploadfile1);
		console.log(Huploadfile2);
		console.log(Huploadfile3);
		if(!companyName_id || !name_id || !idcard_id || !Huploadfile1 || !Huploadfile2 || !Huploadfile3){
			alert("请填写完整");
			return;
		}
		if(idcard_id.length < 18){
			alert("身份证位数不足18位");
			return;
		}
		$.ajax({
            url : './registCompany',
            type : "post",
            data:{companyName_id:companyName_id,name_id:name_id,idcard_id:idcard_id,id_front:Huploadfile1,id_back:Huploadfile2,company_pic:Huploadfile3},
            dataType:'json',
            success : function(msg) {
                //console.log(msg.code);
                if(msg.c == 2){
                	alert(msg.m);
                	return;
                }else if(msg.c == 1){
                	alert("注册成功!请登录");
                	window.location.href="./login";
                }
            }
        })
	}
</script>

</body>
</html>
