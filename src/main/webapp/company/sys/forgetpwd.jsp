<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.vcode_text {
	width: 129px;
	color: white;
	text-align: center;
	display: inline-block;
	vertical-align: top;
	background-color: #1da1f2;
	margin-left: 56px;
	border-radius: 7px;
	height: 30px !important;
	font-size: 15px;
	line-height: 30px;
	cursor: pointer
}
</style>
</head>
<body>
	<div class="row">

		<form class="form-horizontal" role="form">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">手机号</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" id="oldpwd"
							class="col-sm-4 pho_input" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">验证码</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" id="vcode"
							class="col-sm-2 searchKey" data-placement="bottom">
						<div class="vcode_text" onclick="sendVcode(this);">发送验证码</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">新密码</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" id="newpwd"
							class="col-sm-4 searchKey" data-placement="bottom">
					</div>
				</div>
			</div>
		</form>
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<script type="text/javascript">
        
        initButton([{
		        name: "保存",
		        click: function(){
		        	var phone = $('#oldpwd').val();
		        	var vcode = $('#vcode').val();
		        	var newpwd = $('#newpwd').val();
		        	if(!phone || !vcode || !newpwd){
		        		alert("填写完整！");
		        		return;
		        	}
		        	newpwd = $.md5($.md5(newpwd)+newpwd);
		        	//修改密码
		    		$.ajax({
		                url : './changepwd',
		                type : "post",
		                async: false,
		                data:{phone:phone,vcode:vcode,password:newpwd,apptype:3,type:1},
		                dataType:'json',
		                success : function(msg) {
		                    if(msg.c == 2){
		                    	alert(msg.m);
		                    	return;
		                    }
		                    alert(msg.m);
		                    loadHtml('./forgetpwdJSP');
		                }
		            })
		        }	
			}])
			
		var wait = 60;
        
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
	        	$('.vcode_text').text("重新发送(" + wait + ")");
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