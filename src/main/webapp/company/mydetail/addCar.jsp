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
<style type="text/css">
.upload {
	padding: 4px 10px;
	height: 20px;
	line-height: 20px;
	position: relative;
	border: 1px solid #999;
	text-decoration: none;
	color: #666;
	margin-left: 21px;
}

.change {
	position: absolute;
	overflow: hidden;
	right: 0;
	top: 0;
	opacity: 0;
	width: 60px;
}
</style>
<body>
	<div class="row">
		<input type="hidden" id="Huploadfile1" name="" value="" />
		<div class="col-xs-12" style="margin-top: 5px;">
			<div class="form-group">
				<label Style="text-align: right;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">所属司机</label>
				<div class="col-sm-4">
					<label class="col-sm-15">${name }</label>
				</div>
			</div>
		</div>
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
						<c:forEach items="${list }" var="p">
							<option value="${p.cartype_id }">${p.name }</option>
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
					class="col-sm-1 control-label no-padding-right" for="form-field-6">行驶证</label>
				<div class="col-sm-4">
					<img src="" id="imgsrc1"
						style="width: 314px; height: 171px; margin-bottom: 2%;">
				</div>
			</div>
			<div class="col-sm-12"
				style="text-align: left; left: 12%; margin-bottom: 3%;">
				<a href="javascript:;" class="upload upload3 ">上传行驶证 <input
					class="change" type="file" id="uploadfile1" name="myfile"
					onChange=" ajaxFileUpload(1);" />
				</a>
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

initButton([{
        name: "返回", 
        click: function(){
        	var flag = '${flag}';
        	if(flag == 0){
        		loadHtml("./carInfo");
        	}else{
        		loadHtml("./mytask/driverList");
        	}
        }	
	},
	{
        name: "保存", 
        click: function(){
        	var car_number = $('#car_number').val();
        	var brand_name = $('#brand_name').val();
            var type_name = $('#type_name').find("option:selected").text(); 
        	var car_volume = $('#car_volume').val();
        	var car_length = $('#car_length').val();
        	var car_carry  =  $('#car_carry').val();
        	var driver_id = '${driver_id}';
        	 var Huploadfile1 = $('#Huploadfile1').val();
       	   var flag = '${flag}';
       	   console.log(type_name);
        	if(!car_number ||!brand_name ||!type_name||!car_volume||!car_length || !car_carry || !Huploadfile1){
        		alert("请填写完整");
        		return;
        	}
        	$.ajax({
        		url:'./mytask/addCarInfo',
        		async:true,
        		data:{driver_id:driver_id,car_number:car_number,brand_name:brand_name,type_name:type_name,car_volume:car_volume,
        			car_length:car_length,car_carry:car_carry,drive_license:Huploadfile1},
        		success:function(msg){
        			if(msg == 0){
        				alert("新增失败");
        				return;
        			}
        			alert("新增成功");
        			if(flag){
                        loadHtml("./carInfo");
                    }else{
                        loadHtml("./mytask/driverList");
                    }
        		}
        	})
        }	
	}
	])
	
	  function ajaxFileUpload(n) {
            $.ajaxFileUpload(
                {
                    url: '/wuliu-web/company/uploadFile', //用于文件上传的服务器端请求地址
                    secureuri: false, //是否需要安全协议，一般设置为false
                    fileElementId: 'uploadfile'+n, //文件上传域的ID
                    dataType: 'JSON', //返回值类型 一般设置为json
                    data:{type:1},
                    success: function (data, status){  //服务器成功响应处理函数
                    	 console.log(data);
                    	data = data.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                        data = data.replace(/<PRE.*?>/g, '');
                        data = data.replace("<PRE>", '');
                        data = data.replace("</PRE>", '');
                        data = data.replace("<pre>", '');
                        data = data.replace("</pre>", ''); 
                        data = eval("("+data+")");
                        var dataid = data.r;
                        var gld = eval("("+dataid+")");
                        console.log(gld.fileid);
                        $('.upload'+n).text("上传成功！");
                        $('#Huploadfile'+n).val(gld.fileid);
                        $('#imgsrc'+n).attr("src",gld.fileurl);
                    }
                   
                }
            )
        }
</script>
</html>