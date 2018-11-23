<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row">
		<!-- 选择司机 -->
		<div id="chooseDriver">
			<!-- <div class=" col-sm-3">
			<div class=" form-xs form-group row">
				<label for="addGrade" class="col-xs-4 control-label">司机2</label>
					<button class="btn btn-xs btn-primary">选择</button>
			</div>
		</div>	 -->
		</div>
		<form class="form-horizontal" role="form">
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆类型</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="car_type" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆长度</label>
					<div class="col-sm-8">
						<input onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"
							id="phone" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="car_length"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车载载重</label>
					<div class="col-sm-8">
						<input id="level" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="car_carry"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆体积</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="car_volume" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">出发地城市</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="send_city" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">出发地区域</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="send_area" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">到达地城市</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="recive_city" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">到达地区域</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="recive_area" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">出发时间</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="date" class="col-sm-10 searchKey"
							name="send_date" data-placement="bottom">
					</div>
				</div>
			</div>
		</form>
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<script type="text/javascript">
		 $(document).ready(function () {
	    		var rowDataNames = [];
	            $("#grid-table").jqGrid({
	                url: './seachTask?flag=1',//有flag说明查询时需要companyId
	                datatype: "json",
	                page:'${page}',
	                colModel: [
						{ label: '订单编号', name: 'order_id', width: 150 },
						{ label: '出发省份名称', name: 'send_province_name', width: 150 },
	                    { label: '出发城市名称', name: 'send_city_name', width: 150},
	                    { label: '出发区域名称', name: 'send_area_name', width: 150 },
	                    { label: '到达省份名称', name: 'recive_province_name', width: 150 },
	                    { label: '到达城市名称', name: 'recive_city_name', width: 150 },
	                    { label: '到达区域名称', name: 'recive_area_name', width: 150 },
	                    { label: '货物类型', name: 'cago_name', width: 100 },
	                    { label: '货物长度', name: 'cago_length', width: 100},
	                    { label: '货物数量', name: 'cago_num', width: 100},
	                    { label: '总重量', name: 'carry', width: 100},
	                    { label: '操作', width: 200 , formatter:changestatus}
	                ],
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
	            
		}); 
		
		 $('[data-rel=tooltip]').tooltip({
				container : 'body'
			});
        
        initButton([{
		        name: "查询", //这里是静态页的地址
		        click: function(){
		        	searchFrom('./seachTask?');
		        }	
			}])
		
		function status(cellvalue, options, rowObject){
   			if(rowObject.reviewstate==0){
   				return "已审核";
   			}
   			if(rowObject.reviewstate==1){
   				return "未审核";
   			}
   		}
		
        function changestatus(cellvalue, options, rowObject){	
     		var html = '';
       		html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="checkDetail(\''+rowObject.order_id +'\')">查看详情</button>';
       		if(rowObject.state == 0){
       			html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="getOrder(\''+rowObject.order_id +'\')">接单</button>';
       		}
       		return html; 
     	}
		
        function checkDetail(orderid){
        	loadHtml('./checkDetail?orderid='+orderid);
        }
        
        function getOrder(orderid){
        	$.ajax({
		  		url:'./getDrivers',
		  		data:{orderid:orderid},
		  		async:false,
		  		success:function(msg){
		  			 $('#chooseDriver').empty();
		  			 console.log(msg);
		  			 html = '';
		  			 if(msg){
		  				 for(var i = 0 ;i<msg.length;i++){
		  					 /**
		  					 <div class=" col-sm-3">
								<div class=" form-xs form-group row">
									<label for="addGrade" class="col-xs-4 control-label">司机2</label>
										<button class="btn btn-xs btn-primary">选择</button>
								</div>
							</div>	
		  					 */
		  					 html += '<div class=" col-sm-5">';
		  					 html += '<div class=" form-xs form-group row">';
		  					 html += '<label for="addGrade" class="col-xs-5 control-label">司机：'+msg[i].name+'</label>';
		  					 html += '<button class="btn btn-xs btn-primary" onclick="choose(\''+orderid+ '\'\,\''+msg[i].driver_id+'\'\,\''+msg[i].listcar+'\')">选择车辆</button>';
		  					 html += '</div></div>';
		  				 }
		  			 }
		  			$('#chooseDriver').append(html);
   		 		}
   			 }); 
        	$("#chooseDriver").dialog("open");
        	
        }
        function choose(orderid,driverid,listcar){
       		 $.ajax({
		   		 url:'./getOrder',
		   		 data:{orderid:orderid,driverid:driverid},
		   		 success:function(msg){
		   			if(msg.c == 1){
		   				alert(msg.m);
							return;
		   			}
		   			alert(msg.m);
		   			loadHtml("./taskList");
   				 }
   		 	}); 
        }
        
        $( "#chooseDriver" ).dialog({
		    autoOpen : false,
		    height : 650,
		    width : 1000,
		    modal : true,
		    title : '',
		    buttons : {
		         "关闭" : function() {
		        	$("#chooseDriver").dialog("close");
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
		});
		</script>
</body>
</html>