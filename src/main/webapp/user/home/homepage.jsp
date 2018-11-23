<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="../css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/firstpage.css">
<script src="../js/jquery-1.11.0.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/moment.min.js"></script>
<script src="../js/zh-cn.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
</head>

<style>
.content {
	width: 1400px;
}

.car_num {
	width: 130px;
}

.car_infor {
	width: 500px;
}

.car_infor div {
	width: 110px;
}

.select_box {
	margin-left: 60px;
}
</style>
<style>
.ui-datepicker {
	width: 395px !important;
}
</style>
<body>
	<jsp:include page="../top1.jsp"></jsp:include>

	<div class="con_part1">
		<div class="content">
			<div class="p1_title">专业物流运输平台</div>
			<div class="p1_cont">
				<span>安全</span> <span>便捷</span> <span>极致</span>
			</div>
		</div>
	</div>

	<div class="con_select1">
		<div class="content">
			<div class="select_container">
				<form id="order_form" action="../make_order/order" method="post">
					<div class="select_box">
						<span>发货地址：</span> <select id="send_province"
							onchange="changeProvince('send')">
							<option value="" class="select_placeholder">请选择</option>
							<c:forEach items="${provinceList }" var="p">
								<option value="${p.province_id }">${p.name }</option>
							</c:forEach>
						</select> <select id="send_city" onchange="changeCity('send')">
							<option value="">请选择</option>
						</select> <select id="send_area">
							<option value="">请选择</option>
						</select> <input type="hidden" name="send_province_name"
							id="send_province_name"> <input type="hidden"
							name="send_city_name" id="send_city_name"> <input
							type="hidden" name="send_area_name" id="send_area_name">
					</div>
					<div class="select_box" style="margin-left: 50px;">
						<span>收货地址：</span> <select id="recive_province"
							onchange="changeProvince('recive')">
							<option value="">请选择</option>
							<c:forEach items="${provinceList }" var="p">
								<option value="${p.province_id }">${p.name }</option>
							</c:forEach>
						</select> <select id="recive_city" onchange="changeCity('recive')">
							<option value="">请选择</option>
						</select> <select id="recive_area">
							<option value="">请选择</option>
						</select> <input type="hidden" name="recive_province_name"
							id="recive_province_name"> <input type="hidden"
							name="recive_city_name" id="recive_city_name"> <input
							type="hidden" name="recive_area_name" id="recive_area_name">
					</div>
					<div class="select_box time_box">
						<span>发货时间：</span>
						<div class="input-group date">
							<input class="home_select form-control input-md"
								id="homepage_send_time" name="homepage_send_time">
						</div>
					</div>
					<div class="select_box time_box" style="margin-left: 70px;">
						<span>收货时间：</span>
						<div class="input-group date">
							<input class="home_select form-control input-md"
								id="homepage_recive_time" name="homepage_recive_time">
						</div>
					</div>

					<div class="order">去下单</div>
				</form>
			</div>
		</div>
	</div>

	<div class="con_part2">
		<div class="content">
			<div class="driver_list_box">
				<div class="dirver_top">
					<img src="../img/logo_f1.png" class="logo_f1"> <span
						style="font-size: 18px; color: #1fb375; font-weight: bold;">司机列表</span>
					<span><a href="./driver_more" class="dtop_right">查看更多</a></span>
				</div>

				<c:forEach items="${ driverlist }" var="p">
					<div class="driver_list" style="cursor: pointer;"
						onclick="window.location.href='./driver_homepage?driver_id=${ p.driver_id }';">
						<img src="${ p.avatar_url }" class="avatar">
						<div class="dri_name">
							<span class="driver_name">${p.name }</span>
						</div>
						<div class="star_box">
							<c:if test="${ p.eva_point > 0 }">
								<c:forEach begin="0" end="${ p.eva_point-1 }">
									<img src="../img/star.png">
								</c:forEach>
							</c:if>
						</div>
						<div class="car_num">
							<span class="plate_num">${p.car_number }</span>
						</div>
						<div class="car_infor">
							<div>${p.car_length }米</div>
							<div>${p.type_name }</div>
							<div>${p.car_carry }吨</div>
							<div>${p.car_volume }m³</div>
						</div>
						<c:if test="${empty p.send_area }">
							<div class="dri_btn leisure">空闲中</div>
						</c:if>
						<c:if test="${not empty p.send_area }">
							<img src="../img/logo_f2.png" class="logo_f2">
							<div class="dri_address">
								<div class="dri_add1">${p.send_area }</div>
								<div class="dri_add2">${p.recive_area }</div>
							</div>
							<div class="dri_btn transit_in">运输中</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<jsp:include page="../bottom.jsp"></jsp:include>

</body>
<script src="../js/common.js"></script>
<script>
$(function(){
	$('.active').removeClass('active');
	$('#homepage').addClass('active');	
	
	if ('${needlogin}' == 1) {
		$('.mask').show();
	    $(".login").show();
	}
});

$('.order').click(function(){
	$('#send_province_name').val($('#send_province option:selected').text())
	$('#send_city_name').val($('#send_city option:selected').text())
	$('#send_area_name').val($('#send_area option:selected').text())
	$('#recive_province_name').val($('#recive_province option:selected').text())
	$('#recive_city_name').val($('#recive_city option:selected').text())
	$('#recive_area_name').val($('#recive_area option:selected').text())
	$('#order_form').submit();
});

function changeProvince(str){
	var province = $('#'+str+'_province').val();
	$.ajax({
		url: './cityList',
		data:{province_id : province},
		type: 'POST',
		success:function(msg){
			var data = eval('('+msg.r+')');
			var html='<option value=""  style="display:none;">请选择</option>';
			if(data&&data.cityList){
				for (var i = 0 ; i < data.cityList.length ; i++) {
					html += '<option value="'+data.cityList[i].city_id+'">'+data.cityList[i].name+'</option>'
				}
			}		
			$('#'+str+'_city').html(html);
		}
	});
}

function changeCity(str){
	var city = $('#'+str+'_city').val();
	$.ajax({
		url: './areaList',
		data:{city_id : city},
		type: 'POST',
		success:function(msg){
			var data = eval('('+msg.r+')');
			var html='<option value=""  style="display:none;">请选择</option>';
			if(data&&data.areaList){
				for (var i = 0 ; i < data.areaList.length ; i++) {
					html += '<option value="'+data.areaList[i].area_id+'">'+data.areaList[i].name+'</option>'
				}
			}		
			$('#'+str+'_area').html(html);
		}
	});
}

$('#homepage_send_time').datetimepicker({
    locale: 'zh-cn',
    format: 'YYYY-MM-DD HH:mm'
});
$('#homepage_recive_time').datetimepicker({
    locale: 'zh-cn',
    format: 'YYYY-MM-DD HH:mm'
});

$("#homepage_send_time").on("dp.change",function (e) {
    $('#homepage_recive_time').data("DateTimePicker").minDate(e.date);
    $('#homepage_send_time').data("DateTimePicker").minDate(new Date());
    $('#homepage_recive_time').data("DateTimePicker").minDate(new Date());
});

$("#homepage_recive_time").on("dp.change",function (e) {
    $('#homepage_send_time').data("DateTimePicker").maxDate(e.date);
});

</script>
</html>
