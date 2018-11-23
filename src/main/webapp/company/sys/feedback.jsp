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
			<!-- 		<div class="col-xs-12"> -->
			<!-- 	        <div class="form-group"> -->
			<!-- 				<label class="col-sm-3 control-label no-padding-right" for="form-field-6">反馈文字</label> -->
			<!-- 				<div class="col-sm-9"> -->
			<!-- 					<input data-rel="tooltip" type="text" id="oldpwd" class="col-sm-5 searchKey" name="oldpwd" data-placement="bottom" > -->
			<!-- 					<textarea rows="7" cols="120"  id="oldpwd" placeholder="请输入"  style="margin-top: 30px;"></textarea> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<!-- 		</div> -->

			<label
				Style="text-align: center; margin-top: 30px; margin-left: 0px; width: 140px; font-weight: bold;"
				class="col-sm-1 control-label no-padding-right" for="form-field-6">内容(不超过250字)</label>
			<div class="" style="margin-left: 20px; margin-bottom: 20px;">
				<textarea rows="10" cols="80" id="oldpwd" placeholder="请输入反馈内容"
					style="margin-top: 30px;"></textarea>
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
		        name: "提交",
		        click: function(){
		        	var info = $('#oldpwd').val();
		        	if(!info ){
		        		alert("请填写内容！");
		        		return;
		        	}
		        	 if( info.length >250){
		                 alert("输入字数不超过250字");
		                 return;
		             }
		        	$.ajax({
		        		url:'./saveFeedBack',
		        		data:{info:info},
		        		success:function(msg){
		        			if(msg.c == 2){
		        				alert(msg.m);
		        				return;
		        			}
		        			alert(msg.m);
		        			loadHtml('./feedback');		        			
		        		}
		        		
		        	})  
		        }	
			}])
		
		</script>

</body>
</html>