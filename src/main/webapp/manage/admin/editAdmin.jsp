<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form class="form-horizontal" role="form">
		<div class="row">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">账号</label>
					<div class="col-sm-2">
						${admin.account } <input type="hidden" name="admin_id"
							value="${admin.admin_id }">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">姓名</label>
					<div class="col-sm-2">
						<input id="name" value="${admin.name }" data-rel="tooltip"
							type="text" class="col-sm-10 searchKey required" maxlength="20"
							placeholder="必填" name="name" title="姓名" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">手机号</label>
					<div class="col-sm-2">
						<input id="phone" value="${admin.phone }" data-rel="tooltip"
							type="text" pattern="[0-9]" class="col-sm-10 searchKey required"
							maxlength="11" placeholder="必填" name="phone" title="手机号"
							data-placement="bottom" onblur="check(this)"
							onkeyup="value=value.replace(/[^(\d)]/g,'')" />
					</div>
				</div>
			</div>


			<div class="col-xs-3"
				style="clear: both; float: initial; margin-top: 70px;">
				<div class="form-group">
					<button class="btn btn-info" type="button"
						style="margin-left: 30%;" onclick="submitaction()">
						<i class="icon-ok bigger-110"></i> 保存
					</button>
					<button class="btn" type="button"
						style="margin-left: 70%; margin-top: -42px;" onclick="goback()">
						<i class="icon-undo bigger-110"></i> 取消
					</button>
				</div>
			</div>
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<table id="grid-table"></table>
				<div id="grid-pager"></div>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</form>
	<script type="text/javascript">
	//初始化
	$(document).ready(function () {
	    		var rowDataNames = [];
	            $('[data-rel=tooltip]').tooltip({container:'body'});
	        
		});
	function submitaction(){
		//class上加上required,checkReuqired会自动校验参数，提示title不能为空
		if(checkRequired()){
			var phone = $("#phone").val();
			if(checkPhone(phone)){
				$.ajax({
					url : './admin/editAdminData',
					type : "post",
					data : $('.form-horizontal').serialize(),// 你的formid
					dataType:'json',
					success : function(msg) {
						console.log(msg);
						if (msg.c == 1) {
							alert("修改成功");
							loadHtml("./admin/userList");
						} else {
							alert(msg.m);
							return;
						}
					}
				})
			}
		}
	}
	
	function goback(){
		loadHtml("./admin/userList");
	}
	function replaceSpace(obj){
	        obj.value = obj.value.replace(/(^\s*)|(\s*$)/g, "");
	}
	
	function check(temp){
        var re = /^1\d{10}$/
        if(!re.test(temp.value)){
            alert("手机号格式不正确，请重新输入!");
            return;
        }
    }
</script>

</body>
</html>