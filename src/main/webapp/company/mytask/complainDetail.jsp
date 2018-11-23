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
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: right; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">用户姓名</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${complain.userName}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: right; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">司机姓名</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${complain.driverName}</div>
			</div>
		</div>

		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: right; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">订单号</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${complain.orderNum}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: right; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">投诉内容</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${complain.content}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: right; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">投诉标签</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${complain.tag}</div>
			</div>
		</div>
		<!--          <div class="col-xs-12" > -->
		<!--             <div class="form-group"> -->
		<!--                 <label Style="text-align: right;font-weight: bold;" class="col-sm-1 control-label no-padding-right" for="form-field-6">处理状态</label> -->
		<!--                 <div class="col-sm-2" style="margin-top: 5px;"> -->
		<%--                    ${complain.phone} --%>
		<!--                 </div> -->
		<!--             </div> -->
		<!--         </div> -->
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: right; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">处理详情</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${complain.dispose_content}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: right; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">处理时间</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
						value="${complain.add_time}" />
				</div>
			</div>
		</div>


		<form class="form-horizontal" role="form"></form>
		<div class="col-xs-12" style="margin-left: 10px">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
	    $(document).ready(function () {
	    	var id = '${id}';
	    	console.log(id);
	       
	         initButton([{
	             name: "返回", //这里是静态页的地址
	             click: function(){
	                 loadHtml("./mytask/dispute");
	             }
	         }
	         ])
	 });
	  
    </script>
</body>
</html>