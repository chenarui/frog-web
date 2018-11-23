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
						for="form-field-6" style="font-weight: bold">总收入</label>
					<div class="col-sm-8">
						<input type="text" class="col-sm-10" name="totalincome"
							title="总收入" data-placement="bottom" readonly="true">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">今日收入</label>
					<div class="col-sm-8">
						<input type="text" class="col-sm-10" name="todayincome"
							title="今日收入" data-placement="bottom" readonly="true">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">今日支出</label>
					<div class="col-sm-8">
						<input type="text" class="col-sm-10" name="todaypay" title="今日支出"
							data-placement="bottom" readonly="true">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">总支出</label>
					<div class="col-sm-8">
						<input type="text" class="col-sm-10" title="总支出"
							data-placement="bottom" readonly="true" value="${ totalPay}">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">总利润</label>
					<div class="col-sm-8">
						<input type="text" class="col-sm-10" title="总利润"
							data-placement="bottom" readonly="true" value="${ratio}">
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
								url : './cash/cashPoolJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '日期',
									name : 'cash_time',
									width : 500,
									sortable:false
								},
								{
									label : '收入',
									name : 'income',
									width : 600,
									sortable:false
								},
								{
									label : '支出',
									name : 'pay',
									width : 600,
									sortable:false
								} ],
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

					//总收入
					$.ajax({
			    		 url:'./cash/cashPoolTotal',
			    		 success:function(msg){
			    			 $("input[name='totalincome']").val(msg.totalIncome);
			    			 $("input[name='todayincome']").val(msg.todayIncome);
			    			 $("input[name='todaypay']").val(msg.todayPay);
			    		 }
			    	 });

				});
	</script>
</body>
</html>