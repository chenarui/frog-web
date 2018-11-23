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
		$(document).ready(
				function() {
					var rowDataNames = [];
					$("#grid-table").jqGrid(
							{
								url : './user/pushListJson',
								datatype : "json",
								 page:'${page}',
								 colModel : [
// 								             {
// 	                                    label : '序号',
// 	                                    name : 'push_id',
// 	                                    width : 5,
// 	                                    sortable:false
// 	                                }, 
	                                {
	                                    label : '推送人',
	                                    name : 'name',
	                                    width : 10,
	                                    sortable:false
	                                },{
	                                    label : '推送标题',
	                                    name : 'title',
	                                    width : 10,
	                                    sortable:false
	                                },{
	                                    label : '推送内容',
	                                    name : 'message',
	                                    width : 50,
	                                    sortable:false
	                                }, {
	                                    label : '日期',
	                                    name : 'add_time',
	                                    width : 10,
	                                    formatter : timeFmt,
	                                    sortable:false
	                                },  ],
								multiselect : false,
								multiboxonly : true,
								rownumbers:true,
								sortable:true,
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
 						name : "消息推送",
 						 click : function() {
 							loadHtml('./user/editPush');
 						} 
 					} ])
				});
		
		  function timeFmt(cellvalue, options, rowObject) {
	            var html = getLocalTime(rowObject.add_time / 1000);

	            return html;
	        }
	        
	        function getLocalTime(nS) {
	            return new Date(parseInt(nS) * 1000).toLocaleString().replace(
	                    /年|月/g, "-").replace(/日/g, " ");
	        }
	</script>
</body>
</html>