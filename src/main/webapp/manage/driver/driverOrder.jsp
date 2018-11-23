<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row">
		<div id="editMoneyDiv4">
			<input type="hidden" id="editHidden4" value="">
			<div class=" col-sm-12">
				<div class=" form-xs form-group row">
					<label for="addGrade" class="col-xs-3 control-label">处理详情</label>
					<div class="col-xs-8">
						<input type="text " class="form-control " id="editRiderMoney4"
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
		<form class="form-horizontal" role="form"></form>
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
		var id = ${id};
		$(document).ready(
				function() {
					var rowDataNames = [];
					$("#grid-table").jqGrid(
							{
								url : './driver/orderListJson?id='+'${id}',
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
										width : 130
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
										width : 130
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
								multiselect : true,
								multiboxonly : true,
								onSelectRow : function(rowId, status, e) {
									rowDataNames = [];
									var rowIds = jQuery("#jqGrid").jqGrid(
											'getGridParam', 'selarrrow');
									$(rowIds).each(
											function(i, rowId) {
												rowDataNames.push($("#jqGrid")
														.jqGrid('getRowData',
																rowId))
											});
								},
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
 						name : "返回",
 						click : function() {
 							loadHtml("./driver/driverList");
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
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
		function changecomplain(id){
			$('#editHidden3').val(id);
			$("#editMoneyDiv3").dialog("open");
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
			 					window.location.reload();
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
			$('#editHidden4').val(id);
			$("#editMoneyDiv4").dialog("open");
		}
		$("#editMoneyDiv4").dialog({
		    autoOpen : false,
		    height : 200,
		    width : 500,
		    modal : true,
		    title : '关闭订单',
		    buttons : {
		        "确定" : function() {
					var dispose_content = $('#editRiderMoney4').val();
		        	var id =  $('#editHidden4').val();
		        	$.ajax({
			    		 url:'./order/changestate',
			    		 data:{id:id,dispose_content:dispose_content},
			    		 success:function(msg){
			    			if(msg==1){
			    				alert("操作成功");
			 					$("#editMoneyDiv4").dialog("close");
			 					window.location.reload();
			    			}else{
			    				alert("操作失败");
			    			}
		 					
			    		 }
			    	 })
			        } ,
		         "取消" : function() {
		        	$("#editMoneyDiv4").dialog("close");
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
	    				window.location.reload();
	    			}else{
	    				alert("操作失败");
	    			}
					
	    		 }
	    	 });
		}
		
		function usertype(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.type == 1) {
				html = '个人';
			} else {
				html = '公司';
			}
			return html;
		}

	</script>
</body>
</html>