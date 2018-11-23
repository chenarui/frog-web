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
							<option value="0">个人司机</option>
							<option value="1">企业司机</option>
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
			<div class="col-xs-3"
				style="clear: both; float: initial; margin-top: 70px;"></div>
		</form>
		<form action="" id="form2">
			<div class="form-group">
				<button class="btn btn-info" type="button"
					style="margin-left: 42%; margin-top: -50px;"
					onclick="submitaction()">
					<i class="icon-ok bigger-110"></i> 消息推送
				</button>
			</div>

			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<table id="grid-table"></table>
				<div id="grid-pager"></div>
			</div>
		</form>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
		$(document).ready(
				function() {
					var driver_id = [];
					$("#grid-table").jqGrid(
							{
								url : './driver/driverListJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '用户编号',
									name : 'driver_id',
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
								}, {
									label : '类型',
									name : 'company_id',
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
								}, ],
								multiselect : true,
								multiboxonly : true,
								sortable:false,
								rownumbers:false,
								onSelectRow : function(rowId, status, e) {
									driver_id = [];
									var rowIds = jQuery("#grid-table").jqGrid(
											'getGridParam', 'selarrrow');
									$(rowIds).each(
											function(i, rowId) {
												driver_id.push($("#grid-table").jqGrid('getRowData',rowId).driver_id)
									});
									//console.log(driver_id);
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
 						name : "查询",
 						click : function() {
 							searchFrom('./driver/driverListJson?');
 						},
 					} ]);
 					console.log(driver_id);
				});
		

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
		
		function usertype(cellvalue, options, rowObject) {
            var html = '';
            if (rowObject.company_id == 0) {
                html = '个人司机';
            } else {
                html = '企业司机';
            }
            return html;
        }
		
		function submitaction(){
			 var driver_id = [];
			 var content = "${content}";
			 var title = "${title}";
			 console.log(title);
			 console.log(content);
            var rowIds = jQuery("#grid-table").jqGrid(
                    'getGridParam', 'selarrrow');
            $(rowIds).each(function(i,rowId) {
                        driver_id.push($("#grid-table").jqGrid('getRowData',rowId).driver_id)
            });
            console.log(driver_id.length);
            if(driver_id.length == 0){
            	alert("请选择要推送的用户名");
            	return;
            }
            $.ajax({
                url : './driver/savePush',
                type : "post",
                data : {driver_id:driver_id,title:title,content:content},
                dataType:'json',
                traditional: true,
                success : function(msg) {
                    console.log(msg);
                    if (msg.code == 1) {
                        alert("推送成功");
                        loadHtml("./driver/pushList");
                    } else {
                        alert("推送失败");
                        return;
                    }
                }
            })
		}
		
	   
	</script>
</body>
</html>