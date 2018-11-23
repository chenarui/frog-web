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

		<!-- 审核未通过原因 -->
		<!-- <div id="editMoneyDiv2">
		<input type="hidden" id="editHidden2" value="">
		<div class=" col-sm-12">
			<div class=" form-xs form-group row">
				<label for="addGrade" class="col-xs-3 control-label">审核未通过</label>
				<div class="col-xs-8">
					<input type="text " class="form-control " id="editRiderMoney2" value=""  >
				</div>
			</div>
		</div>
	</div> -->
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
								url : './company/companyListJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '昵称',
									name : 'name',
									width : 210,
									sortable:false
								}, {
									label : '公司LOGO',
									name : 'logo_url',
									width : 210,
									formatter:loadpicture,
									sortable:false
								}, {
									label : '手机号',
									name : 'phone',
									width : 210,
									sortable:false
								},  
								{
									label : '余额',
									name : 'balance',
									width : 210,
									sortable:false
								}, {
									label : '状态',
									name : 'state',
									width : 210,
									formatter : companyState,
									sortable:false
								},{
									label : '操作',
									name : '',
									width : 650,
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
 							searchFrom('./company/companyListJson?');
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="detail(\''
 				+ rowObject.company_id + '\')" style="margin-right:10px;">查看详情</button>';
 	 		html += '<button class="btn btn-xs btn-primary" onclick="driverCash(\''
 	 	 		+ rowObject.company_id + '\')" style="margin-right:10px;">查看流水记录</button>';
 	 	 	if(rowObject.state == 0){
 	 	 		html += '<button class="btn btn-xs btn-primary" onclick="changestate(\''
 	 	 			+ rowObject.company_id + '\')" style="margin-right:10px;">审核通过</button>';
 	 	 		html += '<button class="btn btn-xs btn-primary" onclick="changestate1(\''
 	 	 	 		+ rowObject.company_id + '\')" style="margin-right:10px;">审核未通过</button>';
 	 	 	}
			return html;
		}
		
		function detail(id){
			loadHtml("./company/companyDetail?id="+id);
		}
		function driverCash(id){
			loadHtml("./company/companyCash?id="+id);
		}
		function changestate(id){
			var state = 1;
			$.ajax({
	    		 url:'./company/changestate',
	    		 data:{id:id,state:state},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./company/companyList");
	    			}else{
	    				alert("操作失败");
	    			}
 					
	    		 }
	    	 });
		}
		function changestate1(id){
			var state = 2;
			$.ajax({
	    		 url:'./company/changestate',
	    		 data:{id:id,state:state},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./company/companyList");
	    			}else{
	    				alert("操作失败");
	    			}
 					
	    		 }
	    	 });
		}
		/* function changestate1(id){
			$('#editHidden2').val(id);
			$("#editMoneyDiv2").dialog("open");
		}
		$("#editMoneyDiv2").dialog({
		    autoOpen : false,
		    height : 200,
		    width : 500,
		    modal : true,
		    title : '未通过原因',
		    buttons : {
		        "确定" : function() {
		        	var state = 2;
					var reason = $('#editRiderMoney2').val();
		        	var id =  $('#editHidden2').val();
		        	$.ajax({
			    		 url:'./company/changestate',
			    		 data:{id:id,state:state,reason:reason},
			    		 success:function(msg){
			    			if(msg==1){
			    				alert("操作成功");
			 					$("#editMoneyDiv2").dialog("close");
			 					loadHtml("./company/companyList");
			    			}else{
			    				alert("操作失败");
			    			}
		 					
			    		 }
			    	 })
			        } ,
		         "取消" : function() {
		        	$("#editMoneyDiv2").dialog("close");
		        }
		    },
		  
	 }); */
		
		function loadpicture(cellvalue, options, rowObject){
	       	var html = '';
	  		html += '<img src=\''+rowObject.logo_url +'\' style="height: 80px; width: 80px;">' ;
	   		return html;
	    }
		
		function companyState(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.state == 0) {
				html = '未审核';
			} else if (rowObject.state == 1) {
				html = '已审核';
			} else {
				html = '审核被拒绝';
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