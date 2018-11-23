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
								url : './company/companyCashList?id='+'${id}',
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
									name : 'add_time',
									width : 50,
									formatter : function(value, options, rData){
										var timestamp = "";
										if(value){
											//timestamp = (new Date(parseFloat(value))).format("yyyy-MM-dd hh:mm:ss");
											timestamp = FormatDate(new Date(parseFloat(value)));
										}
										return timestamp;
									}
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
 							loadHtml("./company/companyList");
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="detail(\''
 				+ rowObject.orderid + '\')" style="margin-right:10px;">查看详情</button>';
			return html;
		}
		

	</script>
</body>
</html>