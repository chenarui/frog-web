<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<form class="form-horizontal" role="form">
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right">时间</label>
					<div class="col-sm-8">
						<div class="input-daterange input-group col-sm-10 ">
							<input data-rel="tooltip"
								style="cursor: pointer; background-color: #fff !important; width: 100px;"
								readonly="readonly" type="text"
								class="form-control input-xs searchKey form_datetime "
								title="开始时间" id="startTime" name="startTime" placeholder="开始时间">
							<span class="input-group-addon addon-xs"> <i
								class="fa fa-exchange"></i>
							</span> <input data-rel="tooltip"
								style="cursor: pointer; background-color: #fff !important; width: 100px;"
								readonly="readonly" type="text"
								class="form-control input-xs searchKey form_datetime"
								title="结束时间" id="endTime" name="endTime" placeholder="结束时间">
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="col-xs-4">
			<div class="form-group">
				<div class="col-sm-8">
					<button class="btn btn-xs btn-primary" onclick="orderChart()"
						style="left: 50px;">查询</button>
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
	</div>
	<div
		style="position: absolute; left: 271px; top: 122px; width: 150px; height: 150px; text-align: center; font-size: 25px;">
		<div
			style="left: 0px; top: 0px; position: absolute; background: inherit; background-color: rgba(255, 223, 37, 1); border: none; border-radius: 0px; box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2); color: #000; width: 150px; height: 150px">
			订单总量<br>
			<span id="num">${num}</span>
		</div>
	</div>
	<div
		style="position: absolute; left: 449px; top: 122px; width: 150px; height: 150px; text-align: center; font-size: 25px;">
		<div
			style="left: 0px; top: 0px; position: absolute; background: inherit; background-color: rgba(208, 225, 125, 1); border: none; border-radius: 0px; box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2); color: #000; width: 150px; height: 150px">
			进行数量<br>
			<span id="onNum">${onNum}</span>
		</div>
	</div>
	<div
		style="position: absolute; left: 630px; top: 122px; width: 150px; height: 150px; text-align: center; font-size: 25px;">
		<div
			style="left: 0px; top: 0px; position: absolute; background: inherit; background-color: rgba(54, 169, 206, 1); border: none; border-radius: 0px; box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2); color: #000; width: 150px; height: 150px">
			完成数量<br>
			<span id="overNum">${overNum}</span>
		</div>
	</div>
	<div
		style="position: absolute; left: 810px; top: 122px; width: 150px; height: 150px; text-align: center; font-size: 25px;">
		<div
			style="left: 0px; top: 0px; position: absolute; background: inherit; background-color: rgba(102, 169, 152, 1); border: none; border-radius: 0px; box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.2); color: #000; width: 150px; height: 150px">
			投诉数量<br>
			<span id="complainNum">${complainNum}</span>
		</div>
	</div>
	<script type="text/javascript">
		
		$('.form_datetime').datetimepicker({
			language:  'zh-CN',
		    weekStart: 1,
		    todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
		    format:'yyyy-mm-dd'
		});
	 	function orderChart(){
	 		var startTime = $("#startTime").val();
	 		var endTime = $("#endTime").val();
			$.ajax({
	    		 url:'./order/selectOrderByTime',
	    		 data:{startTime:startTime,endTime:endTime},
	    		 type: 'POST',
	    		 success:function(msg){
	    			msg = eval('('+msg+')');
	    			$("#num").html(msg.num);
	    			$("#onNum").html(msg.onNum);
	    			$("#overNum").html(msg.overNum);
	    			$("#complainNum").html(msg.complainNum);
	    		 }
	    	 });
		}
	</script>
</body>
</html>