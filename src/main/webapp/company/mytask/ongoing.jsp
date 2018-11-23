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
						for="form-field-6" style="font-weight: bold">货物类型</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="cago_name" title="货物类型" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">出发时间</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="date" class="col-sm-10 searchKey"
							id="startTime" name="send_time" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">送达时间</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="date" class="col-sm-10 searchKey"
							name="recive_time" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group no-padding-left">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">价格范围</label>
					<div class="col-sm-8">
						<div
							class="input-daterange input-group col-sm-10 no-padding-right no-padding-left">
							<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
								name="minPrice" title="最低价格" style="width: 100%;"
								data-placement="bottom"> <span
								class="input-group-addon addon-xs"> <i
								class="fa fa-exchange">到</i>
							</span> <input data-rel="tooltip" type="text"
								class="col-sm-10 searchKey" name="maxPrice" title="最高价格"
								data-placement="bottom" style="width: 100%;">
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
								url : './mytask/ongoingJson',
								datatype : "json",
								 page:'${page}',
								 colModel: [
								            { label: '订单号', name: 'order_num', width: 150 },
                                            { label: '出发时间', name: 'send_time', width: 200,formatter : timeFmt },
                                            { label: '出发地', name: 'send_province_name', width: 300, formatter:totalAddr },
                                            { label: '到达时间', name: 'recive_time', width: 200,formatter : timeFmt2 },
                                            { label: '到达地', name: 'recive_area_name', width: 300,formatter:totalAddr2 },
                                            { label: '车辆类型', name: 'cartype_name', width: 100 },
                                            { label: '货物类型', name: 'cago_name', width: 100 },
//                                          { label: '货物长度', name: 'cago_length', width: 50},
//                                          { label: '货物数量', name: 'cago_num', width: 50},
                                            { label: '价格', name: 'driver_money', width: 100},
//                                          { label: '订单状态', name: 'total_money', width: 50},
                                            { label: '操作', width: 200 , formatter:operate}
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

 					initButton([ {
 						name : "查询",
 						click : function() {
 							searchFrom('./mytask/ongoingJson?');
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="orderdetail(\''
 				+ rowObject.order_id + '\')" style="margin-right:10px;">查看详情</button>';
			html += '<button class="btn btn-xs btn-primary" onclick="delivery(\''
 	                + rowObject.order_id + '\')" style="margin-right:10px;">交货</button>';
			return html;
		}

		function orderdetail(order_id){
            loadHtml("./mytask/orderDetail?order_id="+order_id);
        }
		
		function delivery(order_id){
            var order_id = order_id;
            if(confirm("确定要交货?")){
            	$.ajax({
                    url : './mytask/changestate',
                    data : { order_id : order_id,},
                    success : function(msg) {
                        if (msg != null) {
                            if (msg == 1) {
                                alert("交货成功");
                                loadHtml("./mytask/dispute");
                            } else {
                                alert("服务异常");
                            }
                        }
                    }
                })
            }else{
            	return;
            }
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
	
		function timeFmt(cellvalue, options, rowObject) {
            var html = getLocalTime(rowObject.send_time / 1000);

            return html;
        }
        
		function timeFmt2(cellvalue, options, rowObject) {
            var html = getLocalTime(rowObject.recive_time / 1000);

            return html;
        }
        function getLocalTime(nS) {
            return new Date(parseInt(nS) * 1000).toLocaleString().replace(
                    /年|月/g, "-").replace(/日/g, " ");
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