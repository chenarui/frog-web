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
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">提现金额最小值</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="min_price" title="提现金额最小值" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">提现金额最大值</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="max_price" title="提现金额最大值" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">状态</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="state" title="状态" data-placement="bottom" id="state">
							<option value=""></option>
							<option value="0">提现中</option>
							<option value="1">审核通过</option>
							<option value="2">成功提现</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right">提现申请时间</label>
					<div class="col-sm-8">
						<div
							class="input-daterange input-group col-sm-10 no-padding-right no-padding-left">
							<input data-rel="tooltip"
								style="cursor: pointer; background-color: #fff !important; width: 100px;"
								readonly="readonly" type="text"
								class="form-control input-xs searchKey form_datetime "
								title="提现申请开始时间" id="startTime" name="startTime"
								placeholder="开始时间"> <span
								class="input-group-addon addon-xs"> <i
								class="fa fa-exchange"></i>
							</span> <input data-rel="tooltip"
								style="cursor: pointer; background-color: #fff !important; width: 100px;"
								readonly="readonly" type="text"
								class="form-control input-xs searchKey form_datetime"
								title="提现申请结束时间" id="endTime" name="endTime" placeholder="结束时间">
						</div>
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
								url : './cash/companyWithdrawListJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '公司名称',
									name : 'name',
									width : 300,
									sortable:false
								},
								{
									label : '提现申请时间',
									name : 'add_time',
									width : 300,
									formatter : function(value, options, rData){
											var timestamp = "";
											if(value){
												//timestamp = (new Date(parseFloat(value))).format("yyyy-MM-dd hh:mm:ss");
												timestamp = FormatDate(new Date(parseFloat(value)));
											}
											return timestamp;
										},
									sortable:false
								},
								{
									label : '提现余额',
									name : 'price',
									width : 250,
									sortable:false
								},{
									label : '银行',
									name : 'withdraw',
									width : 350,
									formatter : withdraw
								},
								{
									label : '状态',
									name : 'state',
									width : 200,
									formatter : withdrawState,
									sortable:false
								},
								{
									label : '操作',
									name : '',
									width : 300,
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
 							searchFrom('./cash/companyWithdrawListJson?');
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.state == 0) {
				html += '<button class="btn btn-xs btn-primary" onclick="applypass(\'' 
					+ rowObject.withdraw_id + '\')" style="margin-right:10px;">申请通过</button>';
			} else if (rowObject.state == 1) {
				html += '<button class="btn btn-xs btn-primary" onclick="successpass(\''
	 				+ rowObject.withdraw_id + '\')" style="margin-right:10px;">提现成功通过</button>';
			} 
 			
			return html;
		}
		
		function applypass(withdraw_id){
			$.ajax({
	    		 url:'./cash/companyWithdrawApplyPass',
	    		 data:{withdraw_id:withdraw_id},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./cash/companyWithdrawList");
	    			}else if(msg==2) {
	    				alert("提现金额超出余额");
	    			}else{
	    				alert("操作失败");
	    			}
	    		 }
	    	 });
		}

		function successpass(withdraw_id){
			$.ajax({
	    		 url:'./cash/companyWithdrawSuccessPass',
	    		 data:{withdraw_id:withdraw_id},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./cash/companyWithdrawList");
	    			}else{
	    				alert("操作失败");
	    			}
	    		 }
	    	 });
		}
		
		function usertype(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.type == 1) {
				html = '司机';
			} else {
				html = '公司';
			}
			return html;
		}

		function withdrawState(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.state == 0) {
				html = '提现中';
			} else if (rowObject.state == 1) {
				html = '审核通过';
			} else {
				html = '成功提现';
			}
			return html;
		}
		function withdraw(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.type == 1) {
				html = '支付宝'+rowObject.account;
			} else if (rowObject.type == 2) {
				html = rowObject.bank+rowObject.account;
			} else {
				html = '';
			}
			return html;
		}
		
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
	</script>
</body>
</html>