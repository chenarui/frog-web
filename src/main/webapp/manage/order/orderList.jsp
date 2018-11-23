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

		<div id="editMoneyDiv2">
			<header>
				<div style="text-align: center; font-size: 18px">关闭订单</div>
			</header>
			<input type="hidden" id="editHidden2" value="">
			<div class=" col-sm-12">
				<div class=" form-xs form-group row">
					<br> <label for="addGrade" class="col-xs-3 control-label">处理详情</label>
					<div class="col-xs-8">
						<input type="text " class="form-control " id="editRiderMoney2"
							value="">
					</div>
				</div>
			</div>
		</div>
		<div id="editMoneyDiv3">
			<header>
				<div style="text-align: center; font-size: 18px">解决投诉</div>
			</header>
			<input type="hidden" id="editHidden3" value="">
			<div class=" col-sm-12">
				<div class=" form-xs form-group row">
					<br> <label for="addGrade" class="col-xs-3 control-label">处理详情</label>
					<div class="col-xs-8">
						<input type="text " class="form-control " id="editRiderMoney3"
							value="">
					</div>
				</div>
			</div>
		</div>
		<form class="form-horizontal" role="form">
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">出发省</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="send_province_name" title="出发省" data-placement="bottom"
							id="send_province_name" onchange="area1()">
							<option value="">请选择</option>
							<c:forEach items="${pList }" var="p">
								<option value="${p.province_id }">${p.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">出发市</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="send_city_name" title="出发市" data-placement="bottom"
							id="send_city_name" onclick="area2()">
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">出发区</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="send_area_name" title="出发区" data-placement="bottom"
							id="send_area_name">
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">收货省</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="recive_province_name" title="收货省" data-placement="bottom"
							id="recive_province_name" onclick="rarea1()">
							<option value="">请选择</option>
							<c:forEach items="${pList }" var="p">
								<option value="${p.province_id }">${p.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">收货市</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="recive_city_name" title="收货市" data-placement="bottom"
							id="recive_city_name" onclick="rarea2()">
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">收货区</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="recive_area_name" title="收货区" data-placement="bottom"
							id="recive_area_name">
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">发货人</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="userName" title="发货人昵称" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">发货人手机号</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="userPhone" title="发货人手机号" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">司机昵称</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="driverName" title="司机昵称" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">司机手机号</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="driverPhone" title="司机手机号" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">订单号</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="order_num" title="订单号" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">车辆类型</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="cartypename" title="车辆类型" data-placement="bottom"
							id="cartypename">
							<option value="">请选择</option>
							<c:forEach items="${cList }" var="l">
								<option value="${l.name }">${l.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">订单状态</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="state" title="车辆类型" data-placement="bottom" id="state">
							<option value="-1">请选择</option>
							<option value="0">未达成</option>
							<option value="1">未开始</option>
							<option value="2">运输中</option>
							<option value="3">已完成</option>
							<option value="4">已取消</option>
							<option value="5">已关闭</option>
						</select>
					</div>
				</div>
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
		$(document).ready(
				function() {
					var rowDataNames = [];
					$("#grid-table").jqGrid(
							{
								url : './order/orderListJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '订单号',
									name : 'order_num',
									width : 130
								}, {
									label : '发货人',
									name : 'send_name',
									width : 80
								}, {
									label : '发货人手机',
									name : 'send_phone',
									width : 110
								}, {
									label : '发货地址',
									name : 'send_address',
									width : 250,
									formatter : saddress
								}, {
									label : '发货时间',
									name : 'sendTime',
									width : 150
								}, {
									label : '收货人',
									name : 'recive_name',
									width : 80
								}, {
									label : '收货人手机',
									name : 'recive_phone',
									width : 110
								}, {
									label : '收货地址',
									name : 'recive_address',
									width : 250,
									formatter : raddress
								}, {
									label : '收货时间',
									name : 'reciveTime',
									width : 150
								}, {
									label : '司机名称',
									name : 'driverName',
									width : 80
								},{
									label : '司机电话',
									name : 'driverPhone',
									width : 110
								}, {
									label : '状态',
									name : 'stateStr',
									width : 65
								},{
									label : '是否投诉',
									name : 'isComplain',
									width : 65
								},{
									label : '是否打款',
									name : 'isPay',
									width : 65
								},{
									label : '操作',
									name : '',
									width : 300,
									formatter : operate
								}, ],
								multiselect : false,
								multiboxonly : true,
								rownumbers:true,
								/* onSelectRow : function(rowId, status, e) {
									rowDataNames = [];
									var rowIds = jQuery("#jqGrid").jqGrid(
											'getGridParam', 'selarrrow');
									$(rowIds).each(
											function(i, rowId) {
												rowDataNames.push($("#jqGrid")
														.jqGrid('getRowData',
																rowId))
											});
								}, */
								viewrecords : true, // show the current page, data rang and total records on the toolbar
								rowList : [ 10, 20, 30 ],
								autowidth : false,
								height : $(window).height() - 300,
								rowNum: 10,
								pager : "#grid-pager",
								jsonReader : {
									root : 'rows',
									repeatitems : false,
									page : "page", // json中代表当前页码的数据  
									records : "records", // json中代表数据行总数的数据 
									total : "total"
								},
								loadComplete : function() {
									var table = this;
									setTimeout(function() {
										updatePagerIcons(table);
									}, 0);
								},
							});

					$('[data-rel=tooltip]').tooltip({
						container : 'body'
					});

 					initButton([ {
 						name : "查询",
 						click : function() {
 							searchFrom('./order/orderListJson?');
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="detail(\''
 				+ rowObject.order_id + '\')" style="margin-right:10px;">查看详情</button>';
 			 
 	 	 	if(rowObject.is_complain == 1){
 	 	 		html += '<button class="btn btn-xs btn-primary" onclick="changecomplain(\''
 	 	 			+ rowObject.order_id + '\')" style="margin-right:10px;">解决投诉</button>';
 	 	 		html += '<button class="btn btn-xs btn-primary" onclick="changestate(\''
 	 	 	 		+ rowObject.order_id + '\')" style="margin-right:10px;">关闭订单</button>';
 	 	 	}
 	 	 	if(rowObject.state == 3 && rowObject.is_pay == 0){
 	 	 		html += '<button class="btn btn-xs btn-primary" onclick="changepay(\''
 	 	 	 		+ rowObject.order_id + '\')" style="margin-right:10px;">用户打款</button>';
 	 	 	}
			return html;
		}
		
		function detail(id){
			loadHtml("./order/orderDetail?id="+id);
		}
		function changecomplain(id){
			$('#editHidden3').val(id);
			$("#editMoneyDiv3").dialog("open");
		}
		$("#editMoneyDiv3").dialog({
		    autoOpen : false,
		    height : 200,
		    width : 500,
		    modal : true,
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
		function saddress(cellvalue, options, rowObject){
			var html = rowObject.send_province_name+rowObject.send_city_name+rowObject.send_area_name+rowObject.send_address;
			return html;
		}
		function raddress(cellvalue, options, rowObject){
			var html = rowObject.recive_province_name+rowObject.recive_city_name+rowObject.recive_area_name+rowObject.recive_address;
			return html;
		}
		 function area1(){
	     	id = $('#send_province_name').val();
	     	if(id==""){
	     		$('#send_city_name').empty();
	     		$('#send_area_name').empty();
	     		return;
	     	}
	     	if(id != null && id != '' && id != undefined){
	     		$.ajax({
	         		url: './order/getcity',
	         		data: {id:id},
	         		type: 'POST',
	         		success: function(msg){
	         			msg = eval('('+msg+')');
	         			$('#send_city_name').empty();
	         			$('#send_area_name').empty();
	         				if(msg.list != null){
	         					var html = '';
	         					html += '<option value="0">请选择</option>';
	             				for(var i =0;i<msg.list.length;i++){
	             					html += '<option value="'+msg.list[i].city_id+'">'+msg.list[i].name+'</option>';
	             				}
	             				$('#send_city_name').append(html);
	         				}
	         			}
	         		});
	     	}
	     	
	     }
	 	function area2(){
	     	id = $('#send_city_name').val();
	     	if(id=="0"){
	     		$('#send_area_name').empty();
	     		return;
	     	}
	     	if(id != null && id != '' && id != undefined){
	     		$.ajax({
	         		url: './order/getarea',
	         		data: {id:id},
	         		type: 'POST',
	         		success: function(msg){
	         			msg = eval('('+msg+')');
	         			$('#send_area_name').empty();
	         				if(msg.list != null){
	         					var html = '';
	             				for(var i =0;i<msg.list.length;i++){
	             					html += '<option value="'+msg.list[i].name+'">'+msg.list[i].name+'</option>';
	             				}
	             				$('#send_area_name').append(html);
	         				}
	         			}
	         		});
	     	}
	     }
	 	function rarea1(){
	     	id = $('#recive_province_name').val();
	     	if(id==""){
	     		$('#recive_city_name').empty();
	     		$('#recive_area_name').empty();
	     		return;
	     	}
	     	if(id != null && id != '' && id != undefined){
	     		$.ajax({
	         		url: './order/getcity',
	         		data: {id:id},
	         		type: 'POST',
	         		success: function(msg){
	         			msg = eval('('+msg+')');
	         			$('#recive_city_name').empty();
	         			$('#recive_area_name').empty();
	         				if(msg.list != null){
	         					var html = '';
	         					html += '<option value="0">请选择</option>';
	             				for(var i =0;i<msg.list.length;i++){
	             					html += '<option value="'+msg.list[i].city_id+'">'+msg.list[i].name+'</option>';
	             				}
	             				$('#recive_city_name').append(html);
	         				}
	         			}
	         		});
	     	}
	     }
	 	function rarea2(){
	     	id = $('#recive_city_name').val();
	     	if(id=="0"){
	     		$('#recive_area_name').empty();
	     		return;
	     	}
	     	if(id != null && id != '' && id != undefined){
	     		$.ajax({
	         		url: './order/getarea',
	         		data: {id:id},
	         		type: 'POST',
	         		success: function(msg){
	         			msg = eval('('+msg+')');
	         			$('#recive_area_name').empty();
	         				if(msg.list != null){
	         					var html = '';
	             				for(var i =0;i<msg.list.length;i++){
	             					html += '<option value="'+msg.list[i].name+'">'+msg.list[i].name+'</option>';
	             				}
	             				$('#recive_area_name').append(html);
	         				}
	         			}
	         		});
	     	}
	     }
	 
	</script>
</body>
</html>