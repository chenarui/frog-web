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
		<form class="form-horizontal" role="form">
			<!-- <div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">手机号</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="phone" title="手机号"
							data-placement="bottom" >
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">昵称</label>
					<div class="col-sm-8">
							<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="name" title="昵称"
							data-placement="bottom" >
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">用户类型</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="type" title="用户类型" data-placement="bottom" id="type">
							<option value=""></option>
							<option value="1">个人用户</option>
							<option value="2">企业用户</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="col-xs-3">
                <div class=" form-xs form-group row">
                    <label for="addName" class="col-sm-4 control-label">最后登录时间</label>
                    <div class="col-sm-8">
                        <div class="input-daterange input-group col-sm-12" style="">
						    <input data-rel="tooltip" type="text" class="form-control input-xs searchKey form_datetime" title="最后登录时间" id="startTime" name="startTime" placeholder="开始时间">
						      <span class="input-group-addon addon-xs">
						        <i class="fa fa-exchange"></i>
						      </span>
						    <input data-rel="tooltip" type="text" class="form-control input-xs searchKey form_datetime" title="最后登录时间" id="endTime" name="endTime" placeholder="结束时间">
						 </div>
                    </div>
                </div>
            </div> -->
		</form>
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
								url : './driver/driverCashList?id='+'${id}',
								data:{id:id},
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '交易前余额',
									name : 'b_balance',
									width : 50
								}, {
									label : '账单金额',
									name : 'price',
									width : 50
								}, {
									label : '交易后余额',
									name : 'a_balance',
									width : 50
								}, {
									label : '账单内容',
									name : 'subject',
									width : 50
								}, {
									label : '账单发生时间',
									name : 'addTime',
									width : 50
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
								autowidth : true,
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
 			html += '<button class="btn btn-xs btn-primary" onclick="detail(\''
 				+ rowObject.orderid + '\')" style="margin-right:10px;">查看详情</button>';
			return html;
		}
		function detail(id){
			loadHtml("./driver/driverDetail?driver_id="+id);
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