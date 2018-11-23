<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row">
		<input type="hidden" id="orderidH" value=""> <input
			type="hidden" id="driveridH" value="">
		<!-- 选择司机 -->
		<div id="chooseDriver">
			<div class=" col-sm-3">
				<div class=" form-xs form-group row">
					<label for="addGrade" class="col-xs-3 control-label">意向金</label> <input
						type="text">
				</div>
			</div>
		</div>
		<form class="form-horizontal" role="form">
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">货物长度</label>
					<div class="col-sm-8">
						<input id="phone" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="car_length"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">货物重量</label>
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
						for="form-field-6">货物体积</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="car_volume" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">出发省</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="send_province" title="出发省" data-placement="bottom"
							id="send_province_name" onchange="area1()">
							<option value="">请选择</option>
							<c:forEach items="${pList }" var="p">
								<option value="${p.province_id }">${p.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">出发市</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="send_city" title="出发市" data-placement="bottom"
							id="send_city_name" onclick="area2()">
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">出发区</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="send_area" title="出发区" data-placement="bottom"
							id="send_area_name">
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">收货省</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="recive_province" title="收货省" data-placement="bottom"
							id="recive_province_name" onclick="rarea1()">
							<option value="">请选择</option>
							<c:forEach items="${pList }" var="p">
								<option value="${p.province_id }">${p.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">收货市</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="recive_city" title="收货市" data-placement="bottom"
							id="recive_city_name" onclick="rarea2()">
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">收货区</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="recive_area" title="收货区" data-placement="bottom"
							id="recive_area_name">
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">车辆类型</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="car_type" title="车辆类型" data-placement="bottom"
							id="car_type">
							<option value="">请选择</option>
							<c:forEach items="${cList }" var="l">
								<option value="${l.name }">${l.name }</option>
							</c:forEach>
						</select>
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
	                url: './seachTask',
	                datatype: "json",
	                page:'${page}',
	                colModel: [
                          { label: '订单号', name: 'order_num', width: 150 },
						{ label: '出发地', name: 'send_province_name', width: 250, formatter:totalAddr },
	                    { label: '到达地', name: 'recive_area_name', width: 250,formatter:totalAddr2 },
	                    { label: '货物类型', name: 'cago_name', width: 150 },
	                    { label: '货物长度/(米)', name: 'cago_length', width: 100},
	                    { label: '货物数量', name: 'cago_num', width: 100},
	                    { label: '货物重量/(吨)', name: 'cago_carry', width: 100},
	                    { label: '总重量/(吨)', name: 'carry', width: 100},
	                    { label: '货物体积/(立方米)', name: 'cago_volume', width: 100},
	                    { label: '车辆类型', name: 'cartype_name', width: 150},
	                    { label: '操作', width: 200 , formatter:changestatus}
	                ],
	                multiselect : false,
					multiboxonly : true,
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
    	    html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="jiedan(\''+rowObject.order_id +'\')">接单</button>';
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
		  				 for(var i = 0 ;i<msg.rows.length;i++){
		  					 html += '<div class=" col-sm-5">';
		  					 html += '<div class=" form-xs form-group row">';
		  					 html += '<label for="addGrade" class="col-xs-5 control-label">司机：'+msg.rows[i].name+'</label>';
		  					 html += '<button class="btn btn-xs btn-primary" onclick="choose(\''+orderid+ '\'\,\''+msg.rows[i].driver_id+'\'\,\''+msg.rows[i].listcar+'\')">选择车辆</button>';
		  					 html += '</div></div>';
		  				 }
		  				 if(!html){
		  					 html += '公司旗下暂无拥有该订单所需车辆类型的司机！';
		  				 }
		  			 }
		  			$('#chooseDriver').append(html);
   		 		}
   			 }); 
        	$("#chooseDriver").dialog("open");
        	
        }
        function choose(orderid,driverid,listcar){
        	$('#putmoney').remove();
        	var html = '';
        	$('#orderidH').val(orderid);
        	$('#driveridH').val(driverid);
        	html += '<div id="putmoney">';
        	html += '<div class=" col-sm-12"><div class=" form-xs form-group row">';
        	html += '<label for="addGrade" class="col-xs-2 control-label">意向金</label><input onkeyup="this.value=this.value.replace(/[^0-9-^.]+/,\'\');" id="yixiangjin" type="text"></div></div>';
        	html += '<div class=" col-sm-12"><div class=" form-xs form-group row">';
        	html += '<label for="addGrade" class="col-xs-2 control-label">加价比%(0-100之间)</label><input onkeyup="this.value=this.value.replace(/[^0-9-]+/,\'\');maketotal();" id="bili" type="text"></div></div>';
         	html += '<div class=" col-sm-12"><div class=" form-xs form-group row">';
        	html += '<label for="addGrade" class="col-xs-2 control-label">总价</label><input id="totalmoney" readonly="readonly" type="text"></div></div>';
        	html += '</div>';
        	$('#chooseDriver').append(html);
        }
        
        $( "#chooseDriver" ).dialog({
		    autoOpen : false,
		    height : 650,
		    width : 1000,
		    modal : true,
		    title : '',
		    buttons : {
		    	 "确认": function() {
		        	 if(!$('#putmoney').text()){
		        		alert("请选择车辆");
		        	 };
		        	 var yixiangjin = $('#yixiangjin').val();
		        	 var bili = $('#bili').val();
		        	 var totalmoney = $('#totalmoney').val();
		        	 var orderid = $('#orderidH').val();
		        	 var driverid = $('#driveridH').val();
		        	 if(!yixiangjin){
		        		alert("请填写意向金");
		        		return;
		        	 }
		        	 if(!bili){
		        		alert("请填写比例");
		        	 	return;
		        	 }
		        	  $.ajax({
				   		 url:'./getOrder',
				   		 data:{orderid:orderid,driverid:driverid,money:yixiangjin,markup_ratio:bili,total_money:totalmoney},
				   		 success:function(msg){
				   			if(msg.c == 1){
				   				alert(msg.m);
									return;
				   			}
				   			alert(msg.m);
				   			loadHtml("./taskList");
		   				 }
	   		 		});  
	 		     } ,
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
        function maketotal(){
        	var yixiangjin = $('#yixiangjin').val();
        	var bili = $('#bili').val();
        	if(!yixiangjin || !bili){
        		alert("请输入意向金和比例");
        		return;
        	}
        	var total = (Number(yixiangjin)*Number(bili/100+1)).toFixed(2);
        	$('#totalmoney').val(total);
        }

        function totalAddr(cellvalue, options, rowObject) {
        	if(rowObject.send_province_name == rowObject.send_city_name){
        		rowObject.send_province_name = '';
        	}
        	var html = rowObject.send_province_name+rowObject.send_city_name+rowObject.send_area_name+rowObject.send_address;
            return html;
        }
        
        function totalAddr2(cellvalue, options, rowObject) {
        	if(rowObject.recive_province_name == rowObject.recive_city_name){
        		rowObject.recive_province_name = '';
            }
            var html = rowObject.recive_province_name+rowObject.recive_city_name+rowObject.recive_area_name+rowObject.recive_address;
            return html;
        }
        
        function jiedan(id){
        	var companyId = '${sessionScope.companyId}';
        	console.log(companyId);
        	 $.ajax({
                 url:'./getCompanyState',
                 data:{},
                 success:function(msg){
                    if(msg.c == 0){
                        alert(msg.m);
                            return;
                    }
                    loadHtml('./jiedan?orderid='+id);
                 }
            });  
        	
        }
        
		 function area1(){
		     	id = $('#send_province_name').val();
		     	if(id==""){
		     		$('#send_city_name').empty();
		     		$('#send_area_name').empty();
		     		return;
		     	}
		     	if(id != null && id != '' && id != undefined){
		     		$.ajax({
		         		url: './getcity',
		         		data: {id:id},
		         		type: 'POST',
		         		success: function(msg){
		         			msg = eval('('+msg+')');
		         			$('#send_city_name').empty();
		         			$('#send_area_name').empty();
		         				if(msg.list != null){
		         					var html = '';
		         					html += '<option value="">请选择</option>';
		             				for(var i =0;i<msg.list.length;i++){
		             					html += '<option value="'+msg.list[i].city_id+'">'+msg.list[i].name+'</option>';
		             				}
		             				$('#send_city_name').append(html);
// 		             				var send_province_name = $('#send_province_name option:selected').text();
// 		             				 $('#send_province_name').val(send_province_name);
		         				}
		         			}
		         		});
		     	}
		     	
		     }
		 	function area2(){
		     	id = $('#send_city_name').val();
		     	if(id=="0"){
		     		$('#send_area_name').empty();
		     		return;
		     	}
		     	if(id != null && id != '' && id != undefined){
		     		$.ajax({
		         		url: './getarea',
		         		data: {id:id},
		         		type: 'POST',
		         		success: function(msg){
		         			msg = eval('('+msg+')');
		         			$('#send_area_name').empty();
		         				if(msg.list != null){
		         					var html = '';
		             				for(var i =0;i<msg.list.length;i++){
		             					html += '<option value="'+msg.list[i].name+'">'+msg.list[i].name+'</option>';
		             				}
		             				$('#send_area_name').append(html);
		         				}
		         			}
		         		});
		     	}
		     }
		 	function rarea1(){
		     	id = $('#recive_province_name').val();
		     	if(id==""){
		     		$('#recive_city_name').empty();
		     		$('#recive_area_name').empty();
		     		return;
		     	}
		     	if(id != null && id != '' && id != undefined){
		     		$.ajax({
		         		url: './getcity',
		         		data: {id:id},
		         		type: 'POST',
		         		success: function(msg){
		         			msg = eval('('+msg+')');
		         			$('#recive_city_name').empty();
		         			$('#recive_area_name').empty();
		         				if(msg.list != null){
		         					var html = '';
		         					html += '<option value="">请选择</option>';
		             				for(var i =0;i<msg.list.length;i++){
		             					html += '<option value="'+msg.list[i].city_id+'">'+msg.list[i].name+'</option>';
		             				}
		             				$('#recive_city_name').append(html);
		         				}
		         			}
		         		});
		     	}
		     }
		 	function rarea2(){
		     	id = $('#recive_city_name').val();
		     	if(id=="0"){
		     		$('#recive_area_name').empty();
		     		return;
		     	}
		     	if(id != null && id != '' && id != undefined){
		     		$.ajax({
		         		url: './getarea',
		         		data: {id:id},
		         		type: 'POST',
		         		success: function(msg){
		         			msg = eval('('+msg+')');
		         			$('#recive_area_name').empty();
		         				if(msg.list != null){
		         					var html = '';
		             				for(var i =0;i<msg.list.length;i++){
		             					html += '<option value="'+msg.list[i].name+'">'+msg.list[i].name+'</option>';
		             				}
		             				$('#recive_area_name').append(html);
		         				}
		         			}
		         		});
		     	}
		     }
        
		</script>
</body>
</html>