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
		<div id="divCenter" align="center"
			style="position: absolute; z-index: 9; display: none; width: 50%; height: 50%; left: 25%; top: 40%;">
			<a href="javascript:void(0);" onclick="picClose();"><img src=""
				id="bigimg" style="height: 500px; width: 600px;" /></a>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">司机名称</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${car.driverName}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车辆类型</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${car.type_name}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车辆长度</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${car.car_length}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车辆体积</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${car.car_volume}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车辆载重</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${car.car_carry}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车辆品牌</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${car.brand_name}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">车牌号</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${car.car_number}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">状态</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${car.stateStr}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">驾驶证照片</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					<a name='fff' href='javascript:void(0);'
						onclick="picBig('${car.drive_license_url}');"><img
						src=${car.drive_license_url } style="height: 100px; width: 100px;"></a>
				</div>
			</div>
		</div>

		<c:if test="${car.state==1 }">
			<button class="btn btn-xs btn-primary"
				onclick="changestate(${car.car_id})" style="left: 61px;">审核通过</button>
		</c:if>
		<form class="form-horizontal" role="form"></form>
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>

		<!-- /.row -->
		<script type="text/javascript">
	    $(document).ready(function () {
	        var rowDataNames = [];
	         $('[data-rel=tooltip]').tooltip({container:'body'});
	         initButton([{
	             name: "返回", //这里是静态页的地址
	             click: function(){
	                 loadHtml("./driver/carList");
	             }
	         }
	         ])
	 });
	    function changestate(id){
			$.ajax({
	    		 url:'./driver/changeCarState',
	    		 data:{id:id},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./driver/carList");
	    			}else{
	    				alert("操作失败");
	    			}
 					
	    		 }
	    	 });
		}
	    function picBig(imgsrc) {
			$("#bigimg").attr('src',imgsrc);
            var v = document.getElementById('divCenter');
            v.style.display = "block";
        }

        function picClose() {
            var v = document.getElementById('divCenter');
            v.style.display = "none";
        }
    </script>
</body>
</html>