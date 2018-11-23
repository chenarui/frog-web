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
.col-sm-4 label {
	padding-top: 4px;
}
</style>
<body>
	<div class="row">
		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车牌号</label>
				<div class="col-sm-4">
					<input id="car_number" value="${car.car_number }" type="text"
						class="col-sm-4 " name="car_type">
				</div>
			</div>
		</div>
		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">品牌</label>
				<div class="col-sm-4">
					<input id="brand_name" value="${car.brand_name }" type="text"
						class="col-sm-4 " name="car_type">
				</div>
			</div>
		</div>

		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车型</label>
				<div class="col-sm-4">
					<select data-rel="tooltip" class="col-sm-4 searchKey"
						name="type_name" title="" data-placement="bottom" id="type_name">
						<option value="">请选择</option>
						<c:forEach items="${cList }" var="p">
							<option value="${p.name }"
								<c:if test="${car.type_name  eq  p.name} "></c:if>
								selected="selected">${p.name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>

		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车长/(米)</label>
				<div class="col-sm-4">
					<input id="car_length" value="${car.car_length }" type="text"
						class="col-sm-4 " name="car_type">
				</div>
			</div>
		</div>

		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">容积/(立方米)</label>
				<div class="col-sm-4">
					<input id="car_volume" value="${car.car_volume }" type="text"
						class="col-sm-4 " name="car_type">
				</div>
			</div>
		</div>
		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">载重/(吨)</label>
				<div class="col-sm-4">
					<input id="car_carry" value="${car.car_carry }" type="text"
						class="col-sm-4 " name="car_type">
				</div>
			</div>
		</div>

		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">所属司机</label>
				<div class="col-sm-4">
					<label class="col-sm-15">${car.driverName }</label>
				</div>
			</div>
		</div>
		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">行驶证</label>
				<div class="col-sm-4">
					<img src='${url }' style="height: 170px; width: 310px;">
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
console.log("${car.type_name}");
console.log('${cList }');
initButton([{
        name: "返回", 
        click: function(){
        	loadHtml("./carInfo");
        }	
	},
	{
        name: "确定编辑", 
        click: function(){
        	var car_number = $('#car_number').val();
        	var brand_name = $('#brand_name').val();
        	var type_name = $('#type_name').val();
        	var car_volume = $('#car_volume').val();
        	var car_length = $('#car_length').val();
        	var car_id = '${car_id}';
        	var car_carry  =$('#car_carry').val();
        	if(!car_number ||!brand_name ||!type_name||!car_volume||!car_length || !car_carry){
        		alert("请填写完整");
        		return;
        	}
        	$.ajax({
        		url:'./changCarInfo',
        		data:{car_id:car_id,car_number:car_number,brand_name:brand_name,type_name:type_name,car_volume:car_volume,car_length:car_length,car_carry:car_carry},
        		success:function(msg){
        			if(msg.c == 2){
        				alert(msg.m);
        				return;
        			}
        			alert(msg.m);
        			loadHtml("./carInfo");
        		}
        	})
        }	
	}
	])
</script>
</html>