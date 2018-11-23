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
								url : './mytask/sysMessageJson',
								datatype : "json",
								 page:'${page}',
								 colModel: [
					                        { label: '发送时间', name: 'send_time', width: 250,formatter : timeFmt },
					                        { label: '消息标题', name: 'title', width: 300},
					                        { label: '消息详细', name: 'content',width: 1100, }
					                    ],
								multiselect : false,
								multiboxonly : true,
								sortable:true,
								rownumbers:true,
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
				});

		
	
		function timeFmt(cellvalue, options, rowObject) {
            var html = getLocalTime(rowObject.send_time / 1000);

            return html;
        }

        function getLocalTime(nS) {
            return new Date(parseInt(nS) * 1000).toLocaleString().replace(
                    /年|月/g, "-").replace(/日/g, " ");
        }
		

		
	</script>
</body>
</html>