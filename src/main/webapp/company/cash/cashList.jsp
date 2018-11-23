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
			<!--             <div class="form-group"> -->
			<label Style="text-align: center;"
				class="col-sm-1 control-label no-padding-right" for="form-field-6">账户余额</label>
			<div class="col-sm-2"
				style="margin-left: -12px; margin-top: 1px; font-size: 15px; font-weight: bold;">
				${balance}&nbsp;元</div>
			<!--             </div> -->
			<button class="btn btn-info" type="button" style="margin-left: 2%;"
				onclick="submitaction()">
				<!--                     <i class="icon-ok bigger-110"></i> -->
				提现
			</button>

		</div>
		<label Style="text-align: center; margin-left: 9px;"
			class="col-sm-1 control-label no-padding-right" for="form-field-6">提现中</label>
		<div class="col-sm-2"
			style="margin-left: -12px; margin-top: 1px; font-size: 15px; font-weight: bold;">
			<c:if test="${sum == null}">0.00&nbsp;元</c:if>
			<c:if test="${sum != null}">${sum}&nbsp;元</c:if>
		</div>


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
								url : './cash/cashListJson',
								datatype : "json",
								 page:'${page}',
								 colModel : [
					             {
                                     label : '时间',
                                     name : 'add_time',
                                     width : 50,
                                     formatter : timeFmt,
                                     sortable:false
                                 },{
	                                    label : '交易前余额',
	                                    name : 'b_balance',
	                                    width : 50,
	                                    sortable:false
	                                },{
	                                    label : '账单金额',
	                                    name : 'price',
	                                    width : 50,
	                                    sortable:false
	                                },{
	                                    label : '交易后余额',
	                                    name : 'a_balance',
	                                    width : 50,
	                                    sortable:false
	                                },   ],
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

//  					initButton([ {
//  						name : "消息推送",
//  						 click : function() {
//  							loadHtml('./user/editPush');
//  						} 
//  					} ])
				});
		
		  function timeFmt(cellvalue, options, rowObject) {
	            var html = getLocalTime(rowObject.add_time / 1000);

	            return html;
	        }
	        
	        function getLocalTime(nS) {
	            return new Date(parseInt(nS) * 1000).toLocaleString().replace(
	                    /年|月/g, "-").replace(/日/g, " ");
	        }
	        
	        function submitaction(){
	        		loadHtml('./cash/withdraw');

	        }
	</script>
</body>
</html>