<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="editMoneyDiv2">
		<input type="hidden" id="editHidden2" value="">
		<div class=" col-sm-12">
			<div class=" form-xs form-group row">
				<label for="addGrade" class="col-xs-3 control-label">处理详情</label>
				<div class="col-xs-8">
					<input type="text " class="form-control " id="editRiderMoney2"
						value="">
				</div>
			</div>
		</div>
	</div>
	<div id="editMoneyDiv3">
		<input type="hidden" id="editHidden3" value="">
		<div class=" col-sm-12">
			<div class=" form-xs form-group row">
				<label for="addGrade" class="col-xs-3 control-label">处理详情</label>
				<div class="col-xs-8">
					<input type="text " class="form-control " id="editRiderMoney3"
						value="">
				</div>
			</div>
		</div>
	</div>
	<form class="form-horizontal" role="form">
		<div class="row">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center; font-size: 20px"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">订单信息</label>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">状态</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.stateStr}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">订单号</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.order_num}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">下单时间</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.add_date}</div>
				</div>
			</div>

			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">发货时间</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.sendTime}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">发货人</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.send_name}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">发货人手机</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.send_phone}</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">发货地址</label>
					<div class="col-sm-4" style="margin-top: 5px;">
						${order.send_province_name}${order.send_city_name}${order.send_area_name}${order.send_address}
					</div>
				</div>
			</div>

			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">收货时间</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.reciveTime}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">收货人</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.recive_name}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">收货人手机</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.recive_phone}</div>
				</div>
			</div>

			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">收货地址</label>
					<div class="col-sm-4" style="margin-top: 5px;">
						${order.recive_province_name}${order.recive_city_name}${order.recive_area_name}${order.recive_address}
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">货物类型</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.cago_name}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">货物长度</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.cago_length}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">货物体积</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.cago_volume}</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">货物载重</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.cago_carry}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">总重量</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.carry}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">货物数量</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.cago_num}</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">意向金</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.money}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">加价比例</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.markup_ratio}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">总金额</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.total_money}</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">是否投诉</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.isComplain}</div>
					<c:if test="${order.is_complain==1 }">
						<label Style="text-align: center;"
							class="col-sm-1 control-label no-padding-right"
							for="form-field-6">投诉内容</label>
						<div class="col-sm-2" style="margin-top: 5px;">
							${order.complain.content},${order.complain.tag}<br>
							<button class="btn btn-xs btn-primary" type="button"
								onclick="changecomplain(${order.order_id})"
								style="margin-right: 10px;">解决投诉</button>
							<button class="btn btn-xs btn-primary" type="button"
								onclick="changestate(${order.order_id})"
								style="margin-right: 10px;">关闭订单</button>
						</div>
					</c:if>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">是否打款</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.isPay}
						<c:if test="${order.state==3 and order.is_pay==0 }">
							<button class="btn btn-xs btn-primary"
								onclick="changepay(${order.order_id})" style="left: 50px;">用户打款</button>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center; font-size: 20px"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">司机信息</label>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">司机名称</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.driverName}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">司机电话</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.driverPhone}</div>
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">车辆类型</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.cartype_name}</div>
				</div>
			</div>
			<c:if test="${order.state==2 }">
				<div id="container"
					style="width: 1000px; height: 600px; margin-left: 300px;"></div>
				<script type="text/javascript">
			    	var x = ${order.driverExtra.longitude}
					var y = ${order.driverExtra.latitude}
					var map = new BMap.Map("container");		//在百度地图容器中创建一个地图
			        var point = new BMap.Point(x, y);    		// 创建点坐标  
			    	map.centerAndZoom(point, 15);				// 初始化地图，设置中心点坐标和地图级别
			    	map.enableScrollWheelZoom();				//启用滚轮放大缩小
			    	var marker = new BMap.Marker(point);        // 创建标注    
			    	map.addOverlay(marker);                     // 将标注添加到地图中
				</script>
			</c:if>
		</div>
	</form>

	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<table id="grid-table"></table>
		<div id="grid-pager"></div>
	</div>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
	    $(document).ready(function () {
	          var rowDataNames = [];
	           $('[data-rel=tooltip]').tooltip({container:'body'});
	           initButton([{
	               name: "返回", //这里是静态页的地址
	               click: function(){
	                   loadHtml("./order/orderList");
	               }
	           }
	           ])
	   });
	    function changecomplain(id){
			debugger;
	    	$('#editHidden3').val(id);
			$("#editMoneyDiv3").dialog("open");
			return;
		}
		$("#editMoneyDiv3").dialog({
		    autoOpen : false,
		    height : 200,
		    width : 500,
		    modal : true,
		    title : '解决投诉',
		    buttons : {
		        "确定" : function() {
					var dispose_content = $('#editRiderMoney3').val();
		        	var id =  $('#editHidden3').val();
		        	$.ajax({
			    		 url:'./order/changecomplain',
			    		 data:{id:id,dispose_content:dispose_content},
			    		 success:function(msg){
			    			if(msg==1){
			    				alert("操作成功");
			 					$("#editMoneyDiv3").dialog("close");
			 					loadHtml("./order/orderList");
			    			}else{
			    				alert("操作失败");
			    			}
		 					
			    		 }
			    	 })
			        } ,
		         "取消" : function() {
		        	$("#editMoneyDiv3").dialog("close");
		        }
		    },
		  
	 });
		function changestate(id){
			$('#editHidden2').val(id);
			$("#editMoneyDiv2").dialog("open");
		}
		$("#editMoneyDiv2").dialog({
		    autoOpen : false,
		    height : 200,
		    width : 500,
		    modal : true,
		    title : '关闭订单',
		    buttons : {
		        "确定" : function() {
					var dispose_content = $('#editRiderMoney2').val();
		        	var id =  $('#editHidden2').val();
		        	$.ajax({
			    		 url:'./order/changestate',
			    		 data:{id:id,dispose_content:dispose_content},
			    		 success:function(msg){
			    			if(msg==1){
			    				alert("操作成功");
			 					$("#editMoneyDiv2").dialog("close");
			 					loadHtml("./order/orderList");
			    			}else{
			    				alert("操作失败");
			    			}
		 					
			    		 }
			    	 })
			        } ,
		         "取消" : function() {
		        	$("#editMoneyDiv2").dialog("close");
		        }
		    },
		  
	 });
		function changepay(id){
			$.ajax({
	    		 url:'./order/changepay',
	    		 data:{id:id},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./order/orderList");
	    			}else{
	    				alert("操作失败");
	    			}
					
	    		 }
	    	 });
		}
    </script>
</body>
</html>