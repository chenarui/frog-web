<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row">

		<form class="form-horizontal" role="form">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">原密码</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="password" id="oldpwd"
							class="col-sm-3 searchKey" name="oldpwd" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">新密码</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="password" id="newpwd1"
							class="col-sm-3 searchKey" name="newpwd1" data-placement="bottom"
							maxlength="20" placeholder="密码长度6至20位,不能包含空格"
							onkeyup="this.value=this.value.replace(/\s+/g,'')">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">再次输入新密码</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="password" id="newpwd2"
							class="col-sm-3 searchKey" name="newpwd2" data-placement="bottom"
							maxlength="20" placeholder=""
							onkeyup="this.value=this.value.replace(/\s+/g,'')">
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
		        	var oldpwd = $('#oldpwd').val();
		        	var newpwd1 = $('#newpwd1').val();
		        	var newpwd2 = $('#newpwd2').val();
		        	if(!oldpwd || !newpwd1 || !newpwd2){
		        		alert("填写完整！");
		        		return;
		        	}
		        	if(newpwd1.length <6 || newpwd2.length < 6){
		                alert("密码长度6-20位");
		                return;
		            }
		        	oldpwd = $.md5($.md5(oldpwd)+oldpwd);
		        	newpwd1 = $.md5($.md5(newpwd1)+newpwd1);
		        	newpwd2 = $.md5($.md5(newpwd2)+newpwd2);
		        	if(newpwd1 != newpwd2){
		        		alert("新密码不一致！");
		        		return;
		        		
		        	}
		        	if(oldpwd == newpwd1){
		        		alert("新密码不可与旧密码一样！");
		        		return;
		        	}
		        	$.ajax({
		        		url:'./getNewPwd',
		        		data:{oldpwd:oldpwd,newpwd:newpwd1},
		        		success:function(msg){
		        			if(msg.c == 2){
		        				alert(msg.m);
		        				return;
		        			}
		        			alert(msg.m);
		        			loadHtml('./changepasswordJSP');		        			
		        		}
		        		
		        	})  
		        }	
			}])
		
		</script>

</body>
</html>