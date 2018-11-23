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
						for="form-field-6" style="font-weight: bold">手机号</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="phone" title="手机号" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">昵称</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="name" title="昵称" data-placement="bottom">
					</div>
				</div>
			</div>

			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">用户类型</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey" name="type"
							title="用户类型" data-placement="bottom" id="type">
							<option value=""></option>
							<option value="1">个人用户</option>
							<option value="2">企业用户</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right">最后登录时间</label>
					<div class="col-sm-8">
						<div
							class="input-daterange input-group col-sm-10 no-padding-right no-padding-left">
							<input data-rel="tooltip"
								style="cursor: pointer; background-color: #fff !important; width: 100px;"
								readonly="readonly" type="text"
								class="form-control input-xs searchKey form_datetime "
								title="最后登录时间" id="startTime" name="startTime"
								placeholder="开始时间"> <span
								class="input-group-addon addon-xs"> <i
								class="fa fa-exchange"></i>
							</span> <input data-rel="tooltip"
								style="cursor: pointer; background-color: #fff !important; width: 100px;"
								readonly="readonly" type="text"
								class="form-control input-xs searchKey form_datetime"
								title="最后登录时间" id="endTime" name="endTime" placeholder="结束时间">
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
								url : './user/userListJson2',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '用户编号',
									name : 'user_id',
									width : 50,
									sortable:false
								}, {
									label : '昵称',
									name : 'name',
									width : 50,
									sortable:false
								}, {
									label : '手机号',
									name : 'phone',
									width : 50,
									sortable:false
								},{
                                    label : '头像',
                                    width : 50,
                                    name:'avatar_url' ,
                                    sortable:false,
                                    formatter : loadpic
                                }, {
									label : '类型',
									name : 'type',
									width : 50,
									sortable:false,
									formatter : usertype
								}, 
								{
									label : '余额',
									name : 'balance',
									width : 50,
									sortable:false
								}, {
									label : '评分',
									name : 'eva_point',
									width : 50,
									sortable:false
								},{
									label : '操作',
									name : '',
									width : 120,
									sortable:false,
									formatter : operate
								}, ],
								multiselect : false,
								multiboxonly : true,
								sortable:true,
								rownumbers:true,
// 								onSelectRow : function(rowId, status, e) {
// 									rowDataNames = [];
// 									var rowIds = jQuery("#jqGrid").jqGrid(
// 											'getGridParam', 'selarrrow');
// 									$(rowIds).each(
// 											function(i, rowId) {
// 												rowDataNames.push($("#jqGrid")
// 														.jqGrid('getRowData',
// 																rowId))
// 											});
// 								},
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
 						name : "查询",
 						click : function() {
 							searchFrom('./user/userListJson2?');
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="userdetail(\''
 				+ rowObject.user_id + '\')" style="margin-right:10px;">查看用户详情</button>';
			html += '<button class="btn btn-xs btn-primary" onclick="orderdetail(\''
 	                + rowObject.user_id + '\')" style="margin-right:10px;">查看订单</button>';
            html += '<button class="btn btn-xs btn-primary" onclick="cashdetail(\''
 	                    + rowObject.user_id + '\')" style="margin-right:10px;">查看流水</button>';
            html += '<button class="btn btn-xs btn-primary" onclick="charge(\''
                 + rowObject.user_id + '\')" style="margin-right:10px;">充值</button>';
			return html;
		}
		function userdetail(user_id){
			 loadHtml("./user/userDetail?user_id="+user_id);
		}
		function orderdetail(id){
            loadHtml("./user/orderDetail?user_id="+id);
        }
		function cashdetail(id){
            loadHtml("./user/cashDetail?user_id="+id);
        }
		function charge(id){
			loadHtml("./user/recharge?user_id="+id);
        }
		
		function usertype(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.type == 1) {
				html = '个人用户';
			} else {
				html = '企业用户';
			}
			return html;
		}
		
		  function loadpic(cellvalue, options, rowObject){
	            var html = '';
	            html += '<img src=\''+rowObject.avatar_url +'\' style="height: 80px; width: 80px;">' ;
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
		
		//精确到时分秒
// 		$('.form_datetime').datetimepicker({
// 		    language:  'zh-CN',
// 		    weekStart: 1,
// 		    todayBtn:  1,
// 			autoclose: 1,
// 			todayHighlight: 1,
// 			startView: 2,
// 			forceParse: 0,
// 		    showMeridian: 1,
// 		    format:'yyyy-mm-dd hh:ii:ss'
// 		});
		
	</script>
</body>
</html>