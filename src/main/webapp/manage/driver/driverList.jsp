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
		<!-- 详情部分 -->
		<!-- <div id="driverDetailAlert" >
			<div class="modal-body form-horizontal row">
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">司机名称:</label>
						<div class="col-xs-8">
							<span id="named"></span>
							<input type="text " class="form-control input-xs maskId" id="named" value="" readonly="readonly">
						</div>
					</div>
				</div>			
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">手机号码:</label>
						<span id="phoned"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="phoned" value=""readonly="readonly"  >
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">身份证号码:</label>
						<span id="idcard"></span>
						<div class="col-xs-8" >
							<input type="text " class="form-control input-xs maskId" id="idcard" value="" readonly="readonly">
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">性别:</label>
						<span id="sex"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="sex"readonly="readonly" >
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">身份证正面照</label>
						<div class="col-xs-8" >
						<img src="" style="height: 300px; width: 300px;"
									class="form-control input-xs maskId" id="idfront">
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">身份证反面照</label>
						<div class="col-xs-8">
						<img src="" style="height: 300px; width: 300px;"
									class="form-control input-xs maskId" id="idback">
							
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">第三方头像</label>
						<div class="col-xs-8">
							<img src="" style="height: 300px; width: 300px;"
									class="form-control input-xs maskId" id="thirdavatarurl">
							
						</div>
					</div>
				</div>
				
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">驾驶证照片</label>
						<div class="col-xs-8">
							<img src="" style="height: 300px; width: 300px;"
									class="form-control input-xs maskId" id="drivercard">
							
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">QQ第三方ID:</label>
						<span id="qqid"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="qqid" readonly="readonly" >
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">支付宝第三方ID:</label>
						<span id="aliid"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="aliid" readonly="readonly" >
						</div>
					</div>
				</div>
				<div class=" col-sm-6" >
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">微信第三方ID:</label>
						<span id="wxid"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="wxid" readonly="readonly">
						</div>
					</div>
				</div>
				<div class=" col-sm-6" >
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">公司:</label>
						<span id="companyid"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="companyid" readonly="readonly">
						</div>
					</div>
				</div>
				<div class=" col-sm-6">
					<div class=" form-xs form-group row">
						<label for="addGrade" class="col-xs-4 control-label">状态:</label>
						<span id="state"></span>
						<div class="col-xs-8">
							<input type="text " class="form-control input-xs maskId" id="state" readonly="readonly">
						</div>
					</div>
				</div>
			</div>
	</div> -->
		<!-- 审核未通过原因 -->
		<div id="editMoneyDiv2">
			<input type="hidden" id="editHidden2" value="">
			<div class=" col-sm-12">
				<div class=" form-xs form-group row">
					<label for="addGrade" class="col-xs-3 control-label">审核未通过</label>
					<div class="col-xs-8">
						<input type="text " class="form-control " id="editRiderMoney2"
							value="">
					</div>
				</div>
			</div>
		</div>
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
			<!-- 			<div class="col-xs-4"> -->
			<!-- 				<div class="form-group"> -->
			<!-- 					<label class="col-sm-4 control-label no-padding-right" -->
			<!-- 						for="form-field-6" style="font-weight: bold">身份证号</label> -->
			<!-- 					<div class="col-sm-8"> -->
			<!-- 						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey" -->
			<!-- 							name="id_card" title="身份证号" -->
			<!-- 							data-placement="bottom" > -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
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
							title="司机类型" data-placement="bottom" id="type">
							<option value=""></option>
							<option value="1">个人司机</option>
							<option value="2">企业司机</option>
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
								url : './driver/driverListJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '用户手机',
									name : 'phone',
									width : 160,
									sortable:false
								}, {
									label : '头像',
									name : 'avatar_url',
									width : 160,
									formatter:loadpicture,
									sortable:false
								}, {
									label : '昵称',
									name : 'name',
									width : 160,
									sortable:false
								}, {
									label : '类型',
									name : 'type',
									width : 160,
									formatter : usertype,
									sortable:false
								}, 
								{
									label : '余额',
									name : 'driverExtra.balance',
									width : 160,
									sortable:false
								}, {
									label : '评分',
									name : 'driverExtra.eva_point',
									width : 160,
									sortable:false
								},{
									label : '操作',
									name : '',
									width : 720,
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
 							searchFrom('./driver/driverListJson?');
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="detail(\''
 				+ rowObject.driver_id + '\')" style="margin-right:10px;">查看详情</button>';
 			html += '<button class="btn btn-xs btn-primary" onclick="order(\''
 	 			+ rowObject.driver_id + '\')" style="margin-right:10px;">查看订单记录</button>';
 	 		html += '<button class="btn btn-xs btn-primary" onclick="driverCash(\''
 	 	 		+ rowObject.driver_id + '\')" style="margin-right:10px;">查看流水记录</button>';
 	 	 	html += '<button class="btn btn-xs btn-primary" onclick="driverCar(\''
 	 	 	 	+ rowObject.driver_id + '\')" style="margin-right:10px;">查看司机车辆信息</button>'; 
 	 	 	if(rowObject.state == 0){
 	 	 		html += '<button class="btn btn-xs btn-primary" onclick="changestate(\''
 	 	 			+ rowObject.driver_id + '\')" style="margin-right:10px;">审核通过</button>';
 	 	 		html += '<button class="btn btn-xs btn-primary" onclick="changestate1(\''
 	 	 	 		+ rowObject.driver_id + '\')" style="margin-right:10px;">审核未通过</button>';
 	 	 	}
			return html;
		}
		/* function detail(id){
			$("#driverDetailAlert").dialog("open");
	 		$.ajax({
	 			url:'./driver/driverDetail',
	 			data:{id:id},
	 			success:function(msg){
	 				if(msg != null){
	 					$('#named').html(msg.name);
	 					$('#phoned').html(msg.phone);
	 					$('#idcard').html(msg.id_card);
	 					$('#sex').html(msg.sex);
	 					$('#idfront').attr('src',msg.id_front_url);
	 					$('#idback').attr('src',msg.id_back_url);
	 					$('#thirdavatarurl').attr('src',msg.third_avatar_url);
	 					$('#drivercard').attr('src',msg.driver_card_url);
	 					$('#qqid').html(msg.qq_id);
	 					$('#aliid').html(msg.ali_id);
	 					$('#wxid').html(msg.wx_id);
	 					$('#companyid').html(msg.companyName);
	 					$('#state').html(msg.stateStr);
	 				}
	 			}
	 		})
		}
		$( "#driverDetailAlert" ).dialog({
		    autoOpen : false,
		    height : 600,
		    width : 1000,
		    modal : true,
		    title : '',
		    buttons : {
		         "关闭" : function() {
		        	$("#driverDetailAlert").dialog("close");
		        }
				
		    },
		    show: {
		        effect: "blind",
		        duration: 100
		    },
		    hide: {
		        effect: "blind",
		        duration: 50
		    }
		}); */
		function detail(id){
			loadHtml("./driver/driverDetail?id="+id);
		}
		function order(id){
			loadHtml("./driver/driverOrder?id="+id);
		}
		function driverCash(id){
			loadHtml("./driver/driverCash?id="+id);
		}
		function driverCar(id){
			loadHtml("./driver/driverCar?id="+id);
		}
		function changestate(id){
			if(confirm("你确定该用户审核可以通过？")){
				var state = 1;
				var reason = "";
				$.ajax({
		    		 url:'./driver/changestate',
		    		 data:{id:id,state:state,reason:reason},
		    		 success:function(msg){
		    			if(msg==1){
		    				alert("操作成功");
		 					loadHtml("./driver/driverList");
		    			}else{
		    				alert("操作失败");
		    			}
	 					
		    		 }
		    	 });
			}
		}
		function changestate1(id){
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
			    		 url:'./driver/changestate',
			    		 data:{id:id,state:state,reason:reason},
			    		 success:function(msg){
			    			if(msg==1){
			    				alert("操作成功");
			 					$("#editMoneyDiv2").dialog("close");
			 					loadHtml("./driver/driverList");
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
		  
	 });
		
		function loadpicture(cellvalue, options, rowObject){
	       	var html = '';
	  		html += '<img src=\''+rowObject.avatar_url +'\' style="height: 80px; width: 80px;">' ;
	   		return html;
	    }
		
		function usertype(cellvalue, options, rowObject) {
			var html = '';
			if (rowObject.company_id > 0) {
				html = '公司司机';
			} else {
				html = '个人司机';
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