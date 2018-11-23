<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>司机首页</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/driver_more.css">
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
<script src="../js/jquery-1.11.0.min.js"></script>
</head>
<body>

	<jsp:include page="../top2.jsp"></jsp:include>

	<div class="con_part2">
		<div class="content">
			<div class="select_top">
				<img src="../img/logo_f3.png" class="logo_f1"> <span
					style="font-size: 18px; color: #1fb375; font-weight: bold;">搜索</span>
			</div>
			<div class="select_container">
				<form id="searchform" action="./driver_more" method="post">
					<div class="select_box">
						<span>出发地：</span> <input id="send_add" name="send_add"
							value="${send_add }">
					</div>
					<div class="select_box">
						<span>车辆类型：</span> <select id="car_type" name="car_type">
							<option value="">请选择</option>
							<c:forEach items="${typelist }" var="p">
								<option value="${p.name }">${p.name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="select_box">
						<span>车辆状态：</span> <select id="car_status" name="car_status">
							<option value="">请选择</option>
							<option value="0">空闲中</option>
							<option value="1">运输中</option>
						</select>
					</div>
					<div class="select_box">
						<span>目的地：</span> <input id="recive_add" name="recive_add"
							value="${recive_add }">
					</div>
					<div class="select_box">
						<span>载重：</span> <input id="car_carry" name="car_carry"
							value="${car_carry }" style="width: 120px;">
					</div>
					<div class="select_box" style="margin-left: 20px;">
						<span>车长：</span> <input id="car_length" name="car_length"
							value="${car_length }" style="width: 120px;">
					</div>
					<div class="select_box" style="margin-left: 20px;">
						<span>容量：</span> <input id="car_volume" name="car_volume"
							value="${car_volume }" style="width: 120px;">
					</div>
					<input type="hidden" id="page" name="page" value="${page }">
					<div class="order" onclick="search()">搜索</div>
				</form>

			</div>


			<div class="driver_list_box">
				<div class="dirver_top">
					<img src="../img/logo_f1.png" class="logo_f1"> <span
						style="font-size: 18px; color: #1fb375; font-weight: bold;">司机列表</span>
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

				<div class="page_turning">
					<span class="total_infor">共${count }条信息</span> <span
						class="turn_page" onclick="prepage()">上一页</span> <span
						class="page_num">${page }</span> / <span class="total_num">${totalpage }</span>
					<span class="turn_page" onclick="nextpage()">下一页</span>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../bottom.jsp"></jsp:include>

</body>
</html>
<script src="../js/common.js"></script>
<script>
$(function(){
	$('.active').removeClass('active');
	$('#homepage').addClass('active');	
	
	$('#car_type').val('${car_type}');
	$('#car_status').val('${car_status}');
});

function search(){
	$('#page').val(1);
	$('#searchform').submit();
}

function prepage(){
	if ($('#page').val() == 1) {
		return;
	}
	var page = $('#page').val();
	$('#page').val(parseInt(page) - 1);
	$('#searchform').submit();
}

function nextpage(){
	if ($('#page').val() == $('.total_num').text()) {
		return;
	}
	var page = $('#page').val();
	$('#page').val(parseInt(page) + 1);
	$('#searchform').submit();
}
</script>