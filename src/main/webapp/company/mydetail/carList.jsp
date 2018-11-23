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
		<!-- 详情部分 -->
		<!-- <div id="driverDetailAlert" >
			<input type="hidden" id="editHidden2" value="">
			<div class="modal-body form-horizontal row">
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">司机名称:</label>
						<span id="driverName"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="driverName" value="" readonly="readonly">
						</div>
					</div>
				</div>			
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">车辆类型:</label>
						<span id="type_name"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="type_name" value=""readonly="readonly"  >
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">车辆长度:</label>
						<span id="car_length"></span>
						<div class="col-xs-8" >
							<input type="text " class="form-control input-xs maskId" id="car_length" value="" readonly="readonly">
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">车辆体积:</label>
						<span id="car_volume"></span>
						<div class="col-xs-8" >
						<input type="text " class="form-control input-xs maskId" id="car_volume" value=""  readonly="readonly">
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">车辆载重:</label>
						<span id="car_carry"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="car_carry" readonly="readonly" >
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">车辆品牌:</label>
						<span id="brand_name"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="brand_name" readonly="readonly">
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">车牌号:</label>
						<span id="car_number"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="car_number" readonly="readonly" >
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">状态:</label>
						<span id="stateStr"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="stateStr" readonly="readonly" >
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">驾驶证照片</label>
						<div class="col-xs-8" >
						<img src="" style="height: 300px; width: 300px;"
									class="form-control input-xs maskId" id="drive_license_url">
						</div>
					</div>
				</div>
			</div>
	</div> -->

		<form class="form-horizontal" role="form">
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">司机手机号</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="phone" title="手机号" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">司机名称</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="name" title="司机名称" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">车辆类型</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey" name="type"
							title="车辆类型" data-placement="bottom" id="type">
							<option value=""></option>
							<option value="平板">平板</option>
							<option value="箱式">箱式</option>
							<option value="集装箱">集装箱</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">车牌号</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="car_number" title="车牌号" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">是否通过审核</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="state" title="是否通过审核" data-placement="bottom" id="type">
							<option value="-1"></option>
							<option value="1">否</option>
							<option value="2">是</option>
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
								url : './driver/getdriverCarList',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '司机名称',
									name : 'driverName',
									width : 160
								}, {
									label : '车辆类型',
									name : 'type_name',
									width : 160
								}, {
									label : '车辆长度',
									name : 'car_length',
									width : 160
								}, {
									label : '车辆体积',
									name : 'car_volume',
									width : 160
								}, {
									label : '车辆载重',
									name : 'car_carry',
									width : 160
								},{
									label : '车辆品牌',
									name : 'brand_name',
									width : 160
								}, {
									label : '车牌号',
									name : 'car_number',
									width : 160
								}, {
									label : '状态',
									name : 'stateStr',
									width : 160
								}, {
									label : '行驶证照片',
									name : 'drive_license_url',
									width : 160,
									formatter:loadpicture
								},{
									label : '操作',
									name : '',
									width : 220,
									formatter : operate,
									sortable:false
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
 							searchFrom('./driver/getdriverCarList?');
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="detail(\''
 				+ rowObject.car_id + '\')" style="margin-right:10px;">查看详情</button>';
 	 	 	if(rowObject.state == 1){
 	 	 		html += '<button class="btn btn-xs btn-primary" onclick="changestate(\''
 	 	 			+ rowObject.car_id + '\')" style="margin-right:10px;">审核通过</button>';
 	 	 	}
			return html;
		}
		/* function detail(id){
			$("#driverDetailAlert").dialog("open");
	 		$.ajax({
	 			url:'./driver/detailCar',
	 			data:{id:id},
	 			success:function(msg){
	 				if(msg != null){
	 					$('#driverName').html(msg.driverName);
	 					$('#type_name').html(msg.type_name);
	 					$('#car_length').html(msg.car_length);
	 					$('#car_volume').html(msg.car_volume);
	 					$('#car_carry').html(msg.car_carry);
	 					$('#brand_name').html(msg.brand_name);
	 					$('#car_number').html(msg.car_number);
	 					$('#stateStr').html(msg.stateStr);
	 					$('#drive_license_url').attr('src',msg.drive_license_url);
	 					$('#editHidden2').val(msg.car_id);
	 				}
	 			}
	 		})
		}
		$( "#driverDetailAlert" ).dialog({
		    autoOpen : false,
		    height : 600,
		    width : 1000,
		    modal : true,
		    title : '',
		    buttons : {
		         "关闭" : function() {
		        	 	$("#driverDetailAlert").dialog("close");
		         	}
			    },
		    show: {
		        effect: "blind",
		        duration: 100
		    },
		    hide: {
		        effect: "blind",
		        duration: 50
		    }
		}); */
		function detail(id){
			loadHtml("./driver/detailCar?id="+id);
		}
		
		function changestate(id){
			$.ajax({
	    		 url:'./driver/changeCarState',
	    		 data:{id:id},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./driver/carList");
	    			}else{
	    				alert("操作失败");
	    			}
 					
	    		 }
	    	 });
		}
		
		function loadpicture(cellvalue, options, rowObject){
	       	var html = '';
	  		html += '<img src=\''+rowObject.drive_license_url +'\' style="height: 80px; width: 80px;">' ;
	   		return html;
	    }
		
		function usertype(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.company_id == 0) {
				html = '个人';
			} else {
				html = '公司';
			}
			return html;
		}

	</script>
</body>
</html>