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
						for="form-field-6" style="font-weight: bold">本日支出提现金额统计</label>
					<div class="col-sm-8">
						<input type="text" class="col-sm-10" name="todayexpend" title=""
							data-placement="bottom" readonly="true">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">本周支出提现金额统计计</label>
					<div class="col-sm-8">
						<input type="text" class="col-sm-10" name="weekexpend" title=""
							data-placement="bottom" readonly="true">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">本月支出提现金额统计</label>
					<div class="col-sm-8">
						<input type="text" class="col-sm-10" name="monthexpend" title=""
							data-placement="bottom" readonly="true">
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
								url : './cash/expendListJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '日期',
									name : 'cash_time',
									width : 800,
									sortable:false
								},
								{
									label : '支出',
									name : 'pay',
									width : 900,
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
			    		 url:'./cash/expendListTotal',
			    		 success:function(msg){
			    			 $("input[name='todayexpend']").val(msg.todayExpend);
			    			 $("input[name='weekexpend']").val(msg.weekExpend);
			    			 $("input[name='monthexpend']").val(msg.monthExpend);
			    		 }
			    	 });

				});
	</script>
</body>
</html>