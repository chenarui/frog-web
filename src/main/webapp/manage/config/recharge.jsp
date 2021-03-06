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
			<!--         <div class="col-xs-12" > -->
			<!--             <div class="form-group"> -->
			<!--                 <label Style="text-align: center;font-size: 15px;" class="col-sm-1 control-label no-padding-right" for="form-field-3">平台分成比例</label> -->
			<!--                 <div class="col-sm-1"> -->
			<%--                     <input id="ratio" value="${ratio}" data-rel="tooltip" type="text" class="col-sm-10 searchKey required" maxlength="2"  style="width: 40px;text-align: center;" --%>
			<!--                     placeholder="必填" name="ratio" title="平台分成比例" data-placement="bottom"   onkeyup="value=value.replace(/[^(\d)]/g,'')"/> -->
			<!--                     <div style="margin-right: 1px;margin-top: 5px;">%</div> -->
			<!--                 </div> -->
			<!--             </div> -->
			<!--         </div> -->
			<label Style="text-align: center;"
				class="col-sm-1 control-label no-padding-right" for="form-field-6">内容(不超过200字)</label>
			<div class="" style="margin-left: 20px; margin-bottom: 20px;">
				<textarea rows="8" cols="80" id="message" placeholder="请输入内容">${ratio}</textarea>
			</div>
			<div class="col-xs-3"
				style="clear: both; float: initial; margin-top: 70px;">
				<div class="form-group">
					<button class="btn btn-info" type="button"
						style="margin-left: 30%;" onclick="submitaction()">
						<i class="icon-ok bigger-110"></i> 修改
					</button>
					<!-- <button class="btn" type="button" style="margin-left: 20%;" onclick="goback()">
                    <i class="icon-undo bigger-110"></i>
                    取消
                </button> -->
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
    function submitaction(){
        //class上加上required,checkReuqired会自动校验参数，提示title不能为空
        var ratio = $('#message').val();
        if(ratio.length >200){
            alert("输入字数不超过200字");
            return;
        }
        if(!ratio){
        	alert("请输入内容");
        }else{
        	if(confirm("确定要修改?")){
        		 $.ajax({
                     url : './config/updateRecharge',
                     type : "post",
//                      data : $('.form-horizontal').serialize(),// 你的formid
                       data:{ratio:ratio},
                     dataType:'json',
                     success : function(msg) {
                         var msg = eval('('+msg+')');
                         console.log(msg);
                         if (msg.code == 0) {
                             alert("操作失败");
                             return;
                         } else {
                             alert("修改成功");
                             loadHtml("./config/recharge");
                         }
                     }
                 })
        	}else{
        		return;
        	}
        }
       
    }
 </script>
</body>
</html>
</html>