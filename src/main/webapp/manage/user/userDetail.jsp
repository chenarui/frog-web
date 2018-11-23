<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						class="col-sm-1 control-label no-padding-right" for="form-field-6">用户编号</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${userInfo.user_id }</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">昵称</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${userInfo.name }</div>
				</div>
			</div>
			<!--           <div class="col-xs-12" > -->
			<!--             <div class="form-group"> -->
			<!--                 <label Style="text-align: center;" class="col-sm-1 control-label no-padding-right" for="form-field-6">头像</label> -->
			<!--                 <div class="col-sm-2" style="margin-top: 5px;"> -->
			<!--                     <img src="" style="height: 100px; width: 100px;"> -->
			<!--                 </div> -->
			<!--             </div> -->
			<!--         </div> -->
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">手机号</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${userInfo.phone }</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">类型</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<c:if test="${userInfo.type == 1 }">个人用户</c:if>
						<c:if test="${userInfo.type == 2 }">企业用户</c:if>
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">余额</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<fmt:formatNumber value="${userInfo.balance }"></fmt:formatNumber>
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">评分</label>
					<div class="col-sm-2" style="margin-top: 3px;">
						<fmt:formatNumber value=" ${userInfo.eva_point }"></fmt:formatNumber>
					</div>
				</div>
			</div>

			<!-- <div class="col-xs-3" style="clear:both;float: initial;margin-top: 70px;">
            <div class="form-group">
                <button class="btn btn-info" type="button" style="margin-left: 30%;" onclick="submitaction()">
                    <i class="icon-ok bigger-110"></i>
                    保存
                </button>
                <button class="btn" type="button" style="margin-left: 20%;" onclick="goback()">
                    <i class="icon-undo bigger-110"></i>
                    取消
                </button>
            </div>
        </div> -->
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
             console.log("${userInfo}");
               var rowDataNames = [];
                $('[data-rel=tooltip]').tooltip({container:'body'});
                initButton([{
                    name: "返回", //这里是静态页的地址
                    click: function(){
                        loadHtml("./user/userList");
                    }
                }
                ])
        });
  /*   function submitaction(){
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
    } */
</script>

</body>
</html>