<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
.col-sm-2 label {
	padding-top: 4px;
}

.driver_pic1 {
	width: 314px;
	height: 171px;
}
</style>
<body>
	<input type="hidden" id="caridH" value="">
	<input type="hidden" id="driveridH" value="">
	<!-- 选择司机 -->
	<div id="chooseDriverDIV">
		<div class=" col-sm-12">
			<div class=" form-xs form-group row">
				<label for="addGrade" class="col-xs-3 control-label"
					style="width: 35%;">意向金</label> <input
					onkeyup="this.value=this.value.replace(/[^0-9-^.]+/,'')"
					onblur="yixiang()" id="yixiangjin" type="text">
			</div>
		</div>
		<div class=" col-sm-12">
			<div class=" form-xs form-group row">
				<label for="addGrade" class="col-xs-3 control-label"
					style="width: 35%;">加价比例/%(0至100)</label> <input
					onkeyup="this.value=this.value.replace(/[^0-9-]+/,'')"
					onblur="maketotal()" id="bili" type="text">
			</div>
		</div>
		<div class=" col-sm-12">
			<div class=" form-xs form-group row">
				<label for="addGrade" class="col-xs-3 control-label"
					style="width: 35%;">总价</label> <input id="totalmoney"
					readonly="readonly" type="text">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bolder;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">司机编号</label>
				<div class="col-sm-2">
					<label class="col-sm-15">${driver.driver_id }</label>
				</div>
			</div>
		</div>
		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label
					Style="text-align: left; font-weight: bolder; font-weight: bolder;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">手机号码</label>
				<div class="col-sm-2">
					<label class="col-sm-15">${driver.phone }</label>
				</div>
			</div>
		</div>

		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bolder;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">司机姓名</label>
				<div class="col-sm-2">
					<label class="col-sm-15">${driver.name  }</label>
				</div>
			</div>
		</div>

		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bolder;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">身份证号</label>
				<div class="col-sm-2">
					<label class="col-sm-15">${driver.id_card }</label>
				</div>
			</div>
		</div>

		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bolder;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">身份证照</label>
				<div class="col-sm-2 driver_pic1" style="margin-top: 5px;">
					<img style="height: 100%; width: 100%;" alt=""
						src="${driver.id_front_url}">
				</div>
				<div class="col-sm-2 driver_pic1"
					style="margin-top: 5px; margin-left: 50px">
					<img style="height: 100%; width: 100%;" alt=""
						src="${driver.id_back_url} ">
				</div>
			</div>
		</div>

		<!-- 		<div class="col-xs-12" style="margin-top: 5px;"> -->
		<!-- 	        <div class="form-group"> -->
		<!-- 				<label Style="text-align: left;font-weight: bolder;" class="col-sm-1 control-label no-padding-right" for="form-field-6"></label> -->
		<!-- 				<div class="col-sm-2"> -->
		<!-- 					<label class="col-sm-15"></label> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div>  -->

		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bolder;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">驾驶证照</label>
				<div class="col-sm-2 driver_pic1">
					<img style="height: 100%; width: 100%;" alt=""
						src="${driver.driver_card_url}">
				</div>
			</div>
		</div>

		<div class="col-xs-12" style="margin-top: 5px;">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
		<!-- /.col -->
	</div>
</body>
<script type="text/javascript">
$(document).ready(function () {
		var rowDataNames = [];
        $("#grid-table").jqGrid({
            url: './getDriverCars?driverid='+'${driver.driver_id}'+"&orderid="+'${orderid}',
            datatype: "json",
            page:'${page}',
            colModel: [
				{ label: '车牌号', name: 'car_number', width: 150 },
				{ label: '品牌', name: 'brand_name', width: 150 },
                { label: '车型', name: 'type_name', width: 150},
                { label: '吨位/(吨)', name: 'car_carry', width: 150 },
                { label: '车长/(米)', name: 'car_length', width: 150 },
                { label: '容积/(立方米)', name: 'car_volume', width: 150 },
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
        
    $('[data-rel=tooltip]').tooltip({container:'body'});
    initButton([{
	        name: "返回", //这里是静态页的地址
	        click: function(){
	        	loadHtml('./jiedan?orderid='+'${orderid}');
	        }
    }])
		
});
function changestatus(cellvalue, options, rowObject){	
		var html = '';
		html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="paidan(\''+rowObject.car_id +'\')">指定该车型进行派单</button>';
		return html; 
}

function paidan(carid){
	//判断司机之前接单的车辆类型======
	var order_id = '${orderid}';
	console.log(order_id);
    var driveridH =  '${driver.driver_id}';
	
	$("#chooseDriverDIV").dialog("open");
	$('#caridH').val(carid);
	$('#driveridH').val(driveridH);

}
$( "#chooseDriverDIV" ).dialog({
    autoOpen : false,
    height : 350,
    width : 500,
    modal : true,
    title : '',
    buttons : {
    	 "确认": function() {
        	 var yixiangjin = $('#yixiangjin').val();
        	 var bili = $('#bili').val();
        	 var totalmoney = $('#totalmoney').val();
        	 var carid = $('#caridH').val();
        	 if(!yixiangjin || yixiangjin == 0 ){
        		alert("请填写意向金");
        		return;
        	 }
        	
        	 
        	 if(!bili || bili == 0){
        		 $('#bili').val(0);
        		$('#totalmoney').val(yixiangjin);
        		 bili = 0;
        		 totalmoney = yixiangjin;
        	 }
        	 var num = eval(bili);
        	    if(num < 0){
        	        alert("加价比例不能小于0")
        	        return;
        	    }
        	    if(num >  100){
        	        alert("加价比例不能大于100");
        	        return;
        	    }
        	    if(!totalmoney){
                    alert("请重新填写意向金和比例");
                    return;
                 }
        	 var orderid = '${orderid}';
        	 //var driver_id =  '${driver.driver_id }';
        	 var driver_id = $('#driveridH').val();
        	 console.log(driver_id);
        	 $.ajax({
		   		 url:'./getOrder',
		   		 data:{orderid:orderid,carid:carid,money:yixiangjin,markup_ratio:bili,total_money:totalmoney,driver_id:driver_id},
		   		 success:function(msg){
		   			if(msg.c == 1){
		   				$("#chooseDriverDIV").dialog("close");
    	  			 	alert(msg.m);
    	  			 	return;
    	  			 }
    	  			 alert(msg.m);
    	  			$("#chooseDriverDIV").dialog("close");
    	  			loadHtml('./jiedan?orderid='+orderid);
   				 }
		 		});  
        	  
		     } ,
         "关闭" : function() {
        	
        	$("#chooseDriverDIV").dialog("close");
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

function yixiang(){
	var yixiangjin = $('#yixiangjin').val();
	if(!yixiangjin || yixiangjin == 0 ){
		alert("请输入意向金");
        return;
	}
	var bili = $('#bili').val();
	if(bili){
		var total = (Number(yixiangjin)*Number(bili/100+1)).toFixed(2);
	    $('#totalmoney').val(total);
	}
	
    
}

function maketotal(){
	var yixiangjin = $('#yixiangjin').val();
	var bili = $('#bili').val();

	var num = eval(bili);
	var jiner = eval( yixiangjin);
	if(num < 0){
		alert("加价比例不能小于0")
		return;
	}
	if(num >  100){
        alert("加价比例不能大于100");
        return;
    }
	var total = (Number(yixiangjin)*Number(bili/100+1)).toFixed(2);
	$('#totalmoney').val(total);
}
</script>
</html>