<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>下单</title>


<link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="../css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/order.css">
<style type="text/css">
.addImg {
	height: 100px;
	width: 100px;
}

img.deleteBtn {
	position: absolute;
	top: 0;
	right: 0;
}

.imgBox {
	height: 150px;
	width: 100px;
	margin-right: 10px;
	display: inline-block;
	margin-left: 30px;
	margin_bottom: 20px;
	position: relative;
}

.remark {
	display: inline-block;
	width: 960px;
	height: 250px;
	border-style: solid;
	border-width: 1 px;
	border-color: gray;
	border-width: thin;
	position: relative;
	left: 90px;
	bottom: 60px;
}
</style>
<script src="../js/jquery-1.11.0.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/moment.min.js"></script>
<script src="../js/zh-cn.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
</head>
<body>
	<jsp:include page="../top2.jsp"></jsp:include>

	<div class="con_part1">
		<div class="content">
			<!--         <div class="part1_top">新用户首次下单，可得100优惠券！</div> -->




			<form id="order_form">
				<input type="hidden" value="${order.order_id }" name="order_id" />
				<div class="select_container">
					<div class="select_list"
						style="border-right: 1px solid #eeeeee; box-sizing: border-box;">
						<div class="select_list_title">发货信息</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>发货人：</span>
							<input type="hidden" id="send_user_id" name="send_user_id"
								value="${info.user_id }"> <input type="text"
								placeholder="请输入发货人姓名" class="input1" id="send_name"
								name="send_name" value="${order.send_name }" data-desc="发货人">
							<span class="select_btn" id="user_address">常用地址</span>
						</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>发货地址：</span>
							<select name="send_province_name" id="send_province_name"
								class="provincebox" data-name="" data-desc="发货地址">
								<option value="" style="display: none;">请选择</option>

								<c:forEach items="${provinceList }" var="list">
									<option data-id="${list.province_id }" value="${list.name }"
										<c:if test="${order.send_province_name==list.name }">selected</c:if>>${list.name }</option>
								</c:forEach>
							</select> <select name="send_city_name" id="send_city_name"
								class="citybox" data-desc="发货地址">
								<option value="" style="display: none;">请选择</option>
								<c:forEach items="${sendCityList }" var="list">
									<option data-id="${list.city_id }" value="${list.name }"
										<c:if test="${order.send_city_name==list.name }">selected</c:if>>${list.name }</option>
								</c:forEach>
							</select> <select name="send_area_name" id="send_area_name"
								data-desc="发货地址">
								<option value="" style="display: none;">请选择</option>
								<c:forEach items="${sendAreaList }" var="list">
									<option value="${list.name }"
										<c:if test="${order.send_area_name==list.name }">selected</c:if>>${list.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>详细街道：</span>
							<input type="text" placeholder="请输入详细地址" class="input1"
								name="send_address" id="send_address"
								value="${order.send_address }" data-desc="发货详细地址">
						</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>联系电话：</span>
							<input data-desc="发货联系方式" type="text" placeholder="请输入联系号码"
								class="input1" id="send_phone" name="send_phone"
								value="${order.send_phone }"
								onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
								onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')">
						</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>发货时间：</span>
							<%--                     	<c:if test="${ not empty send_time }"> --%>
							<div class="input-group date">
								<input data-desc="发货时间" size="16" type="text"
									value="${order.str_send_time }"
									class="form-control input-md input1 " name="str_send_time"
									id="str_send_time">
							</div>
							<%--                     	</c:if> --%>
							<%--                     	<c:if test="${ empty send_time }"> --%>
							<%--                     		<div class="input-group date"><input size="16"  type="text" value='<fmt:formatDate value="${order.send_time }" type="both"/>'   class="form-control input-md input1 " name="str_send_time" id="str_send_time"> </div> --%>
							<%--                     	</c:if> --%>
						</div>
					</div>


					<div class="select_list">
						<div class="select_list_title">收货信息</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>收货人：</span>
							<input type="hidden" name="recive_user_id"
								value="${order.recive_user_id }"> <input type="text"
								placeholder="请输入发货人姓名" class="input1" name="recive_name"
								value="${order.recive_name }" data-desc="收货人姓名"> <span
								class="select_btn" id="contact_book">通讯录</span>
						</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>收货地址：</span>
							<select name="recive_province_name" id="recive_province_name"
								class="provincebox" data-desc="收货地址">
								<option value="" style="display: none;">请选择</option>
								<c:forEach items="${provinceList }" var="list">
									<option data-id="${list.province_id }" value="${list.name }"
										<c:if test="${order.recive_province_name==list.name }">selected</c:if>>${list.name }</option>
								</c:forEach>
							</select> <select name="recive_city_name" id="recive_city_name"
								class="citybox" data-desc="收货地址">
								<option value="" style="display: none;">请选择</option>
								<c:forEach items="${reciveCityList }" var="list">
									<option data-id="${list.city_id }" value="${list.name }"
										<c:if test="${order.recive_city_name==list.name }">selected</c:if>>${list.name }</option>
								</c:forEach>
							</select> <select name="recive_area_name" id="recive_area_name"
								data-desc="收货地址">
								<option value="" style="display: none;">请选择</option>
								<c:forEach items="${reciveAreaList }" var="list">
									<option value="${list.name }"
										<c:if test="${order.recive_area_name==list.name }">selected</c:if>>${list.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>详细街道：</span>
							<input type="text" placeholder="请输入详细地址" class="input1"
								id="recive_address" name="recive_address"
								value="${order.recive_address }" data-desc="收货详细地址">
						</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>联系号码：</span>
							<input data-desc="收货联系方式" type="text" placeholder="请输入联系号码"
								class="input1" id="recive_phone" name="recive_phone"
								value="${order.recive_phone }"
								onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
								onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')">
						</div>
						<div class="select_box">
							<span class="select_title"><span class="mark">*</span>收货时间：</span>
							<%--                    	<c:if test="${ not empty recive_time }"> --%>
							<div class="input-group date">
								<input data-desc="收货时间" size="16" type="text"
									value="${order.str_recive_time }"
									class="form-control input-md input1" name="str_recive_time"
									id="str_recive_time">
							</div>
							<%--                    	</c:if> --%>
							<%--                    	<c:if test="${ empty recive_time }"> --%>
							<%--                    		<div class="input-group date"><input size="16"  type="text" value='<fmt:formatDate value="${order.recive_time }" type="both"/>' class="form-control input-md input1" name="str_recive_time" id="str_recive_time"> </div> --%>
							<%--                    	</c:if> --%>
						</div>
					</div>

					<div style="clear: both;"></div>



					<div class="select_list_1">
						<div class="select_list_title">货物信息</div>

						<div class="select_box_1" style="margin-left: 20px;">
							<span class="select_title"><span class="mark">*</span>货物类型：</span>
							<select name="cago_name" data-desc="货物类型" id="cago_name">
								<option value="" style="display: none;">请选择</option>

								<c:forEach items="${cagotypes }" var="c">

									<option value="${c.name }"
										<c:if test="${order.cago_name==c.name }">selected</c:if>>${c.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="select_box_1">
							<span class="select_title"><span class="mark">*</span>货物长度：</span>
							<input data-desc="货物长度" type="text" placeholder="请输入"
								class="input2" id="cago_length" name="cago_length"
								value="${order.cago_length }"
								onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" />米
						</div>
						<div class="select_box_1">
							<span class="select_title"><span class="mark">*</span>货物重量：</span>
							<input data-desc="货物重量" type="text" placeholder="每个货物重量"
								class="input2" id="cago_carry" name="cago_carry"
								value="${order.cago_carry }"
								onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" />吨
						</div>
						<div class="select_box_1">
							<span class="select_title"><span class="mark">*</span>货物体积：</span>
							<input data-desc="货物体积" type="text" placeholder="请输入"
								class="input2" id="cago_volume" name="cago_volume"
								value="${order.cago_volume }"
								onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" />立方
						</div>
						<div class="select_box_1" style="margin-left: 20px;">
							<span class="select_title"><span class="mark">*</span>货物数量：</span>
							<input data-desc="货物数量" type="text" placeholder="请输入"
								class="input2" id="cago_num" name="cago_num"
								value="${order.cago_num }"
								onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" />
						</div>
					</div>
					<div class="select_list_1">
						<div class="select_list_title">其他需求</div>

						<div class="select_box_1" style="margin-left: 20px;">
							<span class="select_title"><span class="mark">*</span>车辆需求：</span>
							<select class="select_1" name="cartype_name" data-desc="车辆需求"
								id="cartype_name">
								<option value="" style="display: none;">请选择</option>
								<c:forEach items="${cartypes }" var="t">
									<option value="${t.name }"
										<c:if test="${order.cartype_name==t.name }">selected</c:if>>${t.name }</option>
								</c:forEach>
							</select>
						</div>
						<!--                 <div class="select_box_1"> -->
						<!--                     <span class="select_title"><span class="mark">*</span>车辆载重：</span> -->
						<!--                     <select class="select_1"> -->
						<!--                         <option value=""  style="display:none;">请选择</option> -->
						<!--                         <option value="1">1</option> -->
						<!--                         <option value="2">2</option> -->
						<!--                         <option value="3">3</option> -->
						<!--                     </select> -->
						<!--                 </div> -->
						<div class="select_box_1">
							<!-- 1：拼车  2：整车 3：零租 4：直达 -->
							<span class="select_title"><span class="mark">*</span>运输方式：</span>
							<select class="select_1" name="carpool_model" data-desc="运输方式"
								id="carpool_model">
								<option value="" style="display: none;">请选择</option>
								<option
									<c:if test="${order.carpool_model=='拼车' }">selected</c:if>
									value="拼车">拼车</option>
								<option
									<c:if test="${order.carpool_model=='整车' }">selected</c:if>
									value="整车">整车</option>
								<option
									<c:if test="${order.carpool_model=='零租' }">selected</c:if>
									value="零租">零租</option>
								<option
									<c:if test="${order.carpool_model=='直达' }">selected</c:if>
									value="直达">直达</option>
							</select>
						</div>

					</div>
					<c:if test="${not empty order.driver_id }">
						<div class="select_list_1">
							<div class="select_list_title">运费报价</div>
							<input type="hidden" name="driver_id" value="${order.driver_id }">
							<div class="select_box_1" style="margin-left: 20px;">
								<span class="select_title"><span class="mark">*</span>意向金：</span>
								<input type="text" placeholder="请输入金额" class="input2"
									name="money" data-desc="意向金额" id="money"
									value="${order.money }"
									onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" />元
							</div>
							<div class="select_box_1"
								style="font-size: 16px; margin-left: 90px;">
								<span>加价比例</span>
								<c:if test="${not empty order.markup_ratio }">
									<fmt:formatNumber var="markup_ratio"
										value="${order.markup_ratio*100*4.74}" pattern="#" />
								</c:if>
								<div id="box">
									<div id="bg">
										<div id="bgcolor" style="width:${markup_ratio }px"></div>
									</div>

									<div id="bt" style="left:${markup_ratio }px"></div>
								</div>
								<span id="text"><c:if
										test="${not empty order.markupPercent }">${order.markupPercent }</c:if>
									<c:if test="${empty order.markupPercent }">0%</c:if> </span>
							</div>
							<div
								style="margin-left: 40px; font-size: 18px; margin-top: 30px; margin-bottom: 20px;">
								合计： <span class="total_price">￥ <c:if
										test="${empty total_money }">0.00</c:if> <c:if
										test="${not empty total_money }">${order.total_money }</c:if></span>
							</div>
						</div>
					</c:if>
					<div class="select_list_1" id="add_pic_area">
						<div class="select_list_title">图片:</div>
						<input type="file" id="addImgBtn" name="file"
							style="display: none;" />
						<c:if test="${not empty order.pics }">
							<c:forEach items="${order.pic_paths }" var="add_pic">
								<div class="imgBox">
									<img class="deleteBtn" src="../img/delete_black.png"> <img
										alt="" class="addImg addOrderPic" width="100%" height="100%"
										src="${add_pic }">

								</div>
							</c:forEach>
						</c:if>
						<input class="img_url" name="pics" style="display: none"
							value="${order.pics }">
						<div class="imgBox" id="add_pic">
							<img alt="" src="../img/imgadd.png" class="addImg" width="100%"
								height="100%">
						</div>


					</div>
					<div class="select_list_1">
						<div class="select_list_title">备注:</div>

						<div style="display: inline-block; width: 960px; height: 250px;">
							<div class="remark" id="remark" contenteditable="true">${order.remark }</div>
						</div>
					</div>
					<div class="submit_order">提交订单</div>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="../bottom.jsp"></jsp:include>

</body>
</html>


<script src="../js/common.js"></script>
<script>

	$(document).on('click','#add_pic .addImg',function(){
		var size = $('#add_pic_area').find('.addOrderPic').size();
		if(size>=9){
			alert('最多上传9张图片');
			return;
		}
		$('#addImgBtn').click();
	});
	
	$(document).on('click','.deleteBtn',function(){
		$(this).parent().remove();
	});
	
	$(function(){
		$(document).on('change','#addImgBtn',function(e){
			handleFileSelect(e);
		});
	});
	
	function handleFileSelect (evt) {
		var files = evt.target.files;
		if(files.length>9 ){
			alert("最多上传9张图片！");
		} else {
			for (var i = 0, f; f = files[i]; i++) {
			      if (!f.type.match('image.*')) {
			        continue;
			      }			
			      //style="height:100px;width:100px;margin-right:30px;display: inline-block;margin-left:10px"
			      var reader = new FileReader();				 		
			      reader.onload = (function(theFile) {
			        return function(e) {
			          var div = $('<div class="imgBox" ></div>');
			          var delete_btn = $('<img class="deleteBtn" src="../img/delete_black.png"/>');	
			          var img = $('<img alt=""  class="addImg addOrderPic" width="100%" height="100%">');
			          var input = $('<input class="img_url" name="pics" style="display:none"/>');//用于存放  ajax路径
			         // var img = document.createElement("img");
			          var dom_img = img.get(0);
			          div.append(delete_btn);
			          div.append(img);
			          div.append(input);
			          $('#add_pic').before(div);
			         dom_img.src=event.target.result;
			         dom_img.onload=function(){
			        	  imgupload("addImgBtn");
			          }		
// 			         
			        };
			      })(f);			 
			      reader.readAsDataURL(f);
			 }				
		}				
	}	
	
	 function imgupload(fileid){
			$.ajaxFileUpload({
			url : '../home/uploadFile',//用于文件上传的服务器端请求地址
			secureuri : false,          //一般设置为false
			fileElementId : fileid,     //文件上传空间的id属性  <input type="file" id="file" name="file" />
			dataType : 'json',          //返回值类型 一般设置为json
			data: {type: 3},
			success : function(msg) {
	            var data = eval("("+msg.r+")");
	            $('#add_pic_area').find('.img_url').last().val(data.fileid);	          
	           // $('.user_pic').attr("src",data.fileurl);
			},
			error: function (data, status, e)//服务器响应失败处理函数
	        {
	            alert(e);
	            console.log(data);
	        }
			});
		}
	
	
	
	$(function(){
		$('.active').removeClass('active');
		$('#makeorder').addClass('active');	
	});
	
    var $box = $('#box');
    var $bg = $('#bg');
    var $bgcolor = $('#bgcolor');
    var $btn = $('#bt');
    var $text = $('#text');
    var statu = false;
    var ox = 0;
    var lx = 0;
    var left = 0;
    var bgleft = 0;
    $btn.mousedown(function(e){
        lx = $btn.offset().left;
        ox = e.pageX - left;
        statu = true;
    });
    $(document).mouseup(function(){
        statu = false;
    });
    $box.mousemove(function(e){
        if(statu){
            left = e.pageX - ox;
            if(left < 0){
                left = 0;
            }
            if(left > 474){
                left = 474;
            }
            $btn.css('left',left);
            $bgcolor.width(left);
            $text.html(parseInt(left/4.74) + '%');
            var money = $('#money').val();
            if(money!=''){
            	var total = toDecimal2(money*(1+parseInt(left/4.74)/100));
            	$('.total_price').html('￥'+total);
            }else{
            	$('.total_price').html('￥0.00');
            }
        }
    });
    $bg.click(function(e){
        if(!statu){
            bgleft = $bg.offset().left;
            left = e.pageX - bgleft;
            if(left < 0){
                left = 0;
            }
            if(left > 474){
                left = 474;
            }
            $btn.css('left',left);
            $bgcolor.stop().animate({width:left},200);
            $text.html(parseInt(left/4.74) + '%');
            var money = $('#money').val();
            if(money!=''){
            	var total = toDecimal2(money*(1+parseInt(left/4.74)/100));
            	$('.total_price').html('￥'+total);
            }else{
            	$('.total_price').html('￥0.00');
            }
        }
    });
   
    $('#money').change(function(){
    	var money = $(this).val();
    	var markup_ratio = $('#text').html();
 	   	markup_ratio = toPoint(markup_ratio);
    	var total = toDecimal2(money*(1+markup_ratio));
    	$('.total_price').html('￥'+total);
    });
    

   
   $('.submit_order').click(function(){
	   var flag = $('#order_form').checkValue();
	   if(!flag){
		   return;
	   }
	   var markup_ratio = $('#text').html();
	   if (markup_ratio) {
		   markup_ratio = toPoint(markup_ratio);
	   }
	   var jsonuserinfo = $('#order_form').serializeObject(); 	   
	   if (markup_ratio) {
	    	jsonuserinfo.markup_ratio = markup_ratio;
	    	jsonuserinfo.total_money = toDecimal2(jsonuserinfo.money * (1+jsonuserinfo.markup_ratio));
	   }
	   jsonuserinfo.remark = $('#remark').html();
// 	   var i = 1;
// 	   alert(jsonuserinfo);
//        alert(JSON.stringify(jsonuserinfo)); 
       $.ajax({
			url:'./addOrder',
			data:jsonuserinfo,
			success:function(msg){
				if(msg.c==1){
					alert('操作成功!');
					location.href="../waybill/in_progress";
				}else{
					alert('操作失败!');
				}
			}
			
		});
   });
   
   function toPoint(percent){
	    var str=percent.replace("%","");
	    str= str/100;
	    return str;
	}
   
   $('.provincebox').change(function(){
	   	$(this).nextAll().html('<option value=""  style="display:none;">请选择</option>');
	   
	   	var province_id = $(this).find("option:selected").attr('data-id');
	   var type = $(this).attr('id');
	   	$.ajax({
	    		 url:'../person_center/cityList',
	    		 data:{province_id:province_id},
	    		 success:function(msg){
	    			if(msg.c==1){
	    				var data =eval('('+msg.r+')');
	    				data = data.cityList;
	    				console.log(data); 
	    				var html='<option value=""  >请选择</option>';
	    				for(var i = 0;i<data.length;i++){
	    					var opt = '<option data-id='+data[i].city_id+' value="'+data[i].name+'"  >'+data[i].name+'</option>';
	    					html+=opt;
	    				}
	    				
	    				if(type=='send_province_name'){
	    					$('#send_city_name').html(html);
	    				}else{
	    					$('#recive_city_name').html(html);
	    				}
	    				
	    			}else{
	    				
	    			}
	    				
	    		 }
	  		});
	   });
		$('.citybox').change(function(){
			var city_id = $(this).find("option:selected").attr('data-id');
			var type = $(this).attr('id');
			$.ajax({
	   		 url:'../person_center/areaList',
	   		 data:{city_id:city_id},
	   		 success:function(msg){
	   			if(msg.c==1){
	   				var data = eval('('+msg.r+')');
	   				data = data.areaList;
	   				var html='<option value="" >请选择</option>';
	   				for(var i = 0;i<data.length;i++){
	   					var opt = '<option value="'+data[i].name+'"  >'+data[i].name+'</option>';
	   					html+=opt;
	   				}
	   				console.log(html);
	   				if(type=='send_city_name'){
	   					$('#send_area_name').html(html);
	   				}else{
	   					$('#recive_area_name').html(html);
	   				}
	   				
	   			}else{
	   				
	   			}
					
	   		 }
	 		});
	   });
		
		function toDecimal2(x) { 
		      var f = parseFloat(x); 
		      if (isNaN(f)) { 
		        return false; 
		      } 
		      var f = Math.round(x*100)/100; 
		      var s = f.toString(); 
		      var rs = s.indexOf('.'); 
		      if (rs < 0) { 
		        rs = s.length; 
		        s += '.'; 
		      } 
		      while (s.length <= rs + 2) { 
		        s += '0'; 
		      } 
		      return s; 
		    } 
   
		$.fn.checkValue = function(){//不为空的节点上需加 data-desc 表示节点名字
			 var a = this.serializeArray(); 	 
			 var flag = true;//判断为空
		     $.each(a, function() {  
			   	  if(!this.value){//使用此方法需name与id相同
			   		  var desc = $('#'+this.name).attr('data-desc');
			   		  if(desc){
			   			  alert(desc+"不能为空");
			   			  flag=false;
			   			  return false;
			   		  }
			   	  }       
		     });    
		     if(!flag){
		   	  return false;
		     }
		     return flag;  
		}

		$.fn.serializeObject = function()    
		{    
		   var o = {};    
		   var a = this.serializeArray(); 
		   $.each(a, function() {  	  
			   if (o[this.name]) {    
			       if (!o[this.name].push) {    
			           o[this.name] = [o[this.name]];    
			       }    	       
			      o[this.name]+=((','+this.value) || '');//多个相同name将其用,连接
			   } else {    
			       o[this.name] = this.value || '';    
			   }    
		   });    
		   return o;    
		};  
		
		$(function(){
			var s = '${jsonObj}';
		});
		
		$('#user_address').click(function(){ 
			 var markup_ratio = $('#text').html();
			   if (markup_ratio) {
				   markup_ratio = toPoint(markup_ratio);
			   }
			   var params = $('#order_form').serializeObject(); 	   
			   if (markup_ratio) {
			    	params.markup_ratio = markup_ratio;
			    	params.total_money = toDecimal2(params.money * (1+params.markup_ratio));
			   }
			   params.remark = $('#remark').html();
			
			
			params.user_id = 28;			
			post('./order_send_address',params);
		});
		
		$('#contact_book').click(function(){
		 var markup_ratio = $('#text').html();
		   if (markup_ratio) {
			   markup_ratio = toPoint(markup_ratio);
		   }
		   var params = $('#order_form').serializeObject(); 	   
		   if (markup_ratio) {
		    	params.markup_ratio = markup_ratio;
		    	params.total_money = toDecimal2(params.money * (1+params.markup_ratio));
		   }
		   params.remark = $('#remark').html();
			post('./order_concact_book',params);
		});
		
		function post(URL, PARAMS) {
			  var temp = document.createElement("form");
			  temp.action = URL;
			  temp.method = "post";
			  temp.style.display = "none";
			  for (var x in PARAMS) {
			    var opt = document.createElement("textarea");
			    opt.name = x;
			    opt.value = PARAMS[x];
			    // alert(opt.name)
			    temp.appendChild(opt);
			  }
			  document.body.appendChild(temp);
			  temp.submit();
			  return temp;
			}
		
		$('#str_send_time').datetimepicker({
		    locale: 'zh-cn',
		    format: 'YYYY-MM-DD HH:mm'
		});
		$('#str_recive_time').datetimepicker({
		    locale: 'zh-cn',
		    format: 'YYYY-MM-DD HH:mm'
		});
		
		$("#str_send_time").on("dp.change",function (e) {
	        $('#str_recive_time').data("DateTimePicker").minDate(e.date);
	        $('#str_send_time').data("DateTimePicker").minDate(new Date());
	    });
	    $("#str_recive_time").on("dp.change",function (e) {
	        $('#str_send_time').data("DateTimePicker").maxDate(e.date);
	    });

</script>