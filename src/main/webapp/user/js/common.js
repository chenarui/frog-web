/*登录注册*/
$("#login_a").click(function(){
    $('.mask').show();
    $(".login").show();
    $(".regist").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
    $(".bind_phone_num").hide();
});
$("#reg_a").click(function(){
    $('.mask').show();
    $(".regist").show();
    $(".login").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
    $(".bind_phone_num").hide();
});
$(".third_logo").click(function(){
    $('.mask').show();
    $(".bind_phone_num").show();
    $(".modify_pwd").hide();
    $(".regist").hide();
    $(".login").hide();
    $(".reg_success").hide();
});
$(".mask").on("click",function(){
    $(this).hide();
    $(".login").hide();
    $(".regist").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
    $(".bind_phone_num").hide();
});
$(".forget_pwd").click(function(){
    $('.mask').show();
    $(".modify_pwd").show();
    $(".regist").hide();
    $(".login").hide();
    $(".reg_success").hide();
    $(".bind_phone_num").hide();
});
$(".close_w").click(function(){
    $('.mask').hide();
    $(".modify_pwd").hide();
    $(".regist").hide();
    $(".login").hide();
    $(".bind_phone_num").hide();
});

$("#firstpage").click(function(){
    location.href = "/wuliu-web/user/person_center/my_hone";
});
$("#my_send_address").click(function(){
    location.href = "/wuliu-web/user/person_center/my_address";
});
$("#address_book").click(function(){
    location.href = "/wuliu-web/user/person_center/my_address_book";
});
$("#my_bill").click(function(){
    location.href = "/wuliu-web/user/person_center/my_bill";
});
$("#my_comment").click(function(){
    location.href = "/wuliu-web/user/person_center/my_comment";
});


$('.person_login').click(function(){
	$('.person_login').addClass('login_active');
	$('.company_login').removeClass('login_active');
	$('.login #type').val(1);
});
$('.company_login').click(function(){
	$('.person_login').removeClass('login_active');
	$('.company_login').addClass('login_active');
	$('.login #type').val(2);
});

$('.person_regist').click(function(){
	$('.person_regist').addClass('login_active');
	$('.company_regist').removeClass('login_active');
	$('.regist').css("height", "545px");
	$('#company_name_div').hide();
	$('.license_pic').css("display","none");
	$('.regist #type').val(1);
});
$('.company_regist').click(function(){
	$('.person_regist').removeClass('login_active');
	$('.company_regist').addClass('login_active');
	$('.regist').css("height", "685px");
	$('#company_name_div').show();
	$('.license_pic').css("display","flex");
	$('.regist #type').val(2);
});
$('.regist_right_now').click(function(){
	$('.mask').show();
    $(".regist").show();
    $(".login").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
    $(".bind_phone_num").hide();
});


//登录
$('#login_btn').click(function(){
	var type = $('.login #type').val();
	var phone = $('.login #phone').val();
	var password = $('.login #password').val();
	if (!phone) {
		$('.login #error_msg').html('请输入账号！');
		$('.login #error_msg').show();
		return;
	}
	if (!password) {
		$('.login #error_msg').html('请输入密码！');
		$('.login #error_msg').show();
		return;
	}
	var pwd = md5(md5(password)+password);
	$.ajax({
		url: './login',
		type: 'POST',
		data: {phone:phone,password:pwd,type:type},
		success: function(msg){
			if (msg.c == 1) {
				window.location.href='./homepage';
			} else {
				$('.login #error_msg').html(msg.m);
				$('.login #error_msg').show();
			}
		}
	});
});


//退出登录
$('#logout').click(function(){
	if (!confirm('确定退出登录?')) {
		return;
	}
	$.ajax({
		url: '../home/logout',
		type: 'POST',
		data: {},
		success: function(msg){
			window.location.href='../home/homepage';
		}
	});
});

//发送验证码
var wait=60;  

function sendVcode(type){
	if (type == 0) { // 0.注册1.找回密码 2.绑定手机号
		var getVcode = $('.regist .get_vcdoe');
		var phoneNum = $('.regist #phone');
	} else if (type == 1){
		var getVcode = $('.modify_pwd .get_vcdoe');
		var phoneNum = $('.modify_pwd #phone');
	}
	//防止重复点击
	if($(getVcode).text() != '获取验证码'){
		return;
	}
	var phone = $(phoneNum).val();
	if(!phone){
		alert("请输入手机号");
		return;
	}
	//发送验证码
	$.ajax({
        url : './getVCode',
        type : "post",
        async: false,
        data:{phone:phone,type:type},
        dataType:'json',
        success : function(msg) {
            if(msg.c == 2){
            	alert(msg.m);
            	return;
            }
            wait=60;
            $(getVcode).css("background-color","#607D8B");
    		time(getVcode);
        }
    });
}

function time(obj) {  
    if (wait == 0) {  
    	$(obj).text("获取验证码");
    	$(obj).css("background-color","#2a2a2a");
        wait = 60;  
    } else {  
    	$(obj).text("重新发送(" + wait + ")");
        wait--;  
        setTimeout(function() {  
            time(obj)  
        }, 1000)  
    }  
}


//注册
$('.regist #reg_btn').click(function(){
	var type = $('.regist #type').val();
	var phone = $('.regist #phone').val();
	var vcode = $('.regist #vcode').val();
	var password = $('.regist #password').val();
	var repassword = $('.regist #repassword').val();
	var company_name = $('.regist #company_name').val();
	var license_id = $('.regist #license_id').val();
	if (!phone) {
		$('.regist .vcode_error').html('请输入手机号！');
		$('.regist .vcode_error').show();
		$('.regist #phone').focus();
		return;
	}
	if (!vcode) {
		$('.regist .vcode_error').html('请输入验证码！');
		$('.regist .vcode_error').show();
		$('.regist #vcode').focus();
		return;
	}
	if (!password) {
		$('.regist .vcode_error').html('请输入密码！');
		$('.regist .vcode_error').show();
		$('.regist #password').focus();
		return;
	}
	if (!repassword) {
		$('.regist .vcode_error').html('请输入确认密码！');
		$('.regist .vcode_error').show();
		$('.regist #repassword').focus();
		return;
	}
	if (password != repassword) {
		$('.regist .vcode_error').html('密码不一致，请重新输入！');
		$('.regist .vcode_error').show();
		$('.regist #password').focus();
		return;
	}
	
	if (type == 2) {
		if (!company_name) {
			$('.regist .vcode_error').html('请输入公司名称！');
			$('.regist .vcode_error').show();
			$('.regist #company_name').focus();
			return;
		}
		if (!license_id) {
			$('.regist .vcode_error').html('请上传公司营业执照！');
			$('.regist .vcode_error').show();
			return;
		}
	}
	
	var pwd = md5(md5(password)+password);
	$.ajax({
		url: './register',
		data: {type:type,phone:phone,password:pwd,vcode:vcode,company_name:company_name,license_id:license_id},
		type: 'POST',
		success: function(msg){
			if (msg.c == 1) {
				$('.mask').show();
			    $(".reg_success").show();
			    $(".modify_pwd").hide();
			    $(".regist").hide();
			    $(".login").hide();
			    $(".bind_phone_num").hide();
			} else {
				$('.regist .vcode_error').html(msg.m);
				$('.regist .vcode_error').show();
			}
		}
	});
});

$('.reg_success .reg_btn').click(function(){
	window.location.href='./homepage';
});

//找回密码
$('.modify_pwd #reg_btn').click(function(){
	var phone = $('.modify_pwd #phone').val();
	var vcode = $('.modify_pwd #vcode').val();
	var password = $('.modify_pwd #password').val();
	var repassword = $('.modify_pwd #repassword').val();
	if (!phone) {
		$('.modify_pwd .vcode_error').html('请输入手机号！');
		$('.modify_pwd .vcode_error').show();
		$('.modify_pwd #phone').focus();
		return;
	}
	if (!vcode) {
		$('.modify_pwd .vcode_error').html('请输入验证码！');
		$('.modify_pwd .vcode_error').show();
		$('.modify_pwd #vcode').focus();
		return;
	}
	if (!password) {
		$('.modify_pwd .vcode_error').html('请输入密码！');
		$('.modify_pwd .vcode_error').show();
		$('.modify_pwd #password').focus();
		return;
	}
	if (!repassword) {
		$('.modify_pwd .vcode_error').html('请输入确认密码！');
		$('.modify_pwd .vcode_error').show();
		$('.modify_pwd #repassword').focus();
		return;
	}
	if (password != repassword) {
		$('.modify_pwd .vcode_error').html('密码不一致，请重新输入！');
		$('.modify_pwd .vcode_error').show();
		$('.modify_pwd #password').focus();
		return;
	}
	
	var pwd = md5(md5(password)+password);
	$.ajax({
		url: './resetPassword',
		data: {phone:phone,password:pwd,vcode:vcode},
		type: 'POST',
		success: function(msg){
			if (msg.c == 1) {
				$('.mask').show();
			    $(".reg_success").hide();
			    $(".modify_pwd").hide();
			    $(".regist").hide();
			    $(".login").show();
			    $(".bind_phone_num").hide();
			} else {
				$('.modify_pwd .vcode_error').html(msg.m);
			}
		}
	});
});

function ajaxFileUpload() {
    $.ajaxFileUpload({
        url: './uploadFile', //用于文件上传的服务器端请求地址
        secureuri: false, //是否需要安全协议，一般设置为false
        fileElementId: 'file', //文件上传域的ID
        dataType: 'JSON', //返回值类型 一般设置为json
        data: {type: 1},
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
            console.log(gld.fileid);
            $('#license_id').val(gld.fileid);
            $('#imgs').attr("src",gld.fileurl);
        }
    });
}