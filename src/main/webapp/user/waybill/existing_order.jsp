<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已有订单</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="../css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/existing_order.css">
<link rel="stylesheet" href="../css/in_progress.css">
<style type="text/css">
.dri_add2 {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 160px;
}

.dri_add1 {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 160px;
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
			<div class="part1_top">
				指定派单 > <span style="color: #1fb375;">选择已有订单</span>
			</div>

			<div class="left">
				<div class="select_container">
					<form id="searchform" action="./existing_order" method="post">
						<div class="select_box">
							<span>发货时间：</span>
							<div class="picker_div">
								<div class="input-group date">
									<input class="home_select form-control time_picker"
										id="startTime" name="startTime" value="${startTime }">
								</div>
								<span style="margin-top: -25px;">—</span>
								<div class="input-group date">
									<input class="home_select form-control time_picker"
										id="endTime" name="endTime" value="${endTime }">
								</div>
								<input type="text" id="key" name="key" class="searchKey"
									value="${key }" placeholder="请输入订单号或运输地址" /> <input
									type="hidden" name="page" id="page" value="${page }"> <input
									type="hidden" name="driver_id" id="driver_id" /> <span
									class="search_btn" onclick="search()">搜索</span>
							</div>
						</div>
					</form>
				</div>


				<!--全部车辆-->
				<table cellspacing="0" id="order_list_box">
					<tr>
						<th>订单号</th>
						<th>运输地址</th>
						<th>运输时间</th>
						<th>货物信息</th>
						<th>车辆需求</th>
						<th>报价</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${orderList }" var="p">
						<tr>
							<td data-id="${list.order_id }">${p.order_num }</td>
							<td><img src="../img/logo_f4.png" class="logo_f4">
								<div class="dri_address">
									<div class="dri_add1">
										<span class="font_big">${p.send_province_name }${p.send_city_name }</span>${p.send_area_name }</div>
									<div class="dri_add2">
										<span class="font_big">${p.recive_province_name }${p.recive_city_name }</span>${p.recive_area_name }</div>
								</div></td>
							<td><img src="../img/logo_f4.png" class="logo_f4">
								<div class="dri_address">
									<div class="dri_add1">
										<span class="font_big"><fmt:formatDate
												value="${p.send_time }" type="date" /></span>
										<fmt:formatDate value="${p.send_time }" type="time" />
									</div>
									<div class="dri_add2">
										<span class="font_big"><fmt:formatDate
												value="${p.recive_time }" type="date" /></span>
										<fmt:formatDate value="${p.recive_time }" type="time" />
									</div>
								</div></td>
							<td><span class="order_car_infor">${p.cago_name }</span> <span
								class="order_car_infor">总重${p.carry }t</span> <span
								class="order_car_infor">${p.cago_volume }m³</span></td>
							<td><span class="order_car_infor">${p.cartype_name }</span>
								<span class="order_car_infor">${p. carpool_model }</span> <!--                             	<span class="order_car_infor">5吨</span> -->
							</td>
							<td><c:if test="${not empty p.money }">
									<div class="price">￥${p.total_money }</div>
									<%-- 	                            	<div>（${p.money }+追加${p.markupPercent }）</div> --%>
								</c:if> <c:if test="${empty p.money }">
									<div class="price">暂无报价</div>
								</c:if></td>
							<td><span class="not_reach">未达成</span></td>
							<td>
								<div class="order_again" onclick="orderAgain('${p.order_id }')">更新订单</div>
							</td>
						</tr>
					</c:forEach>

				</table>
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
<script src="../js/common.js"></script>
<script>
$(function(){
	$('.active').removeClass('active');
	$('#myorder').addClass('active');	
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

function orderAgain(order_id){
	var driver_id = '${driver_id}';
	$.ajax({
		url: './getOrderById',
		data: {order_id: order_id, driver_id: driver_id},
		type: 'POST',
		success: function(msg){
			if (msg.c == 1) {
				var param = eval('('+msg.r+')');
				post('../make_order/order',param);
			} else {
				alert(msg.m);
			}
		}
	});
}

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

$('#startTime').datetimepicker({
    locale: 'zh-cn',
    format: 'YYYY-MM-DD HH:mm'
});
$('#endTime').datetimepicker({
    locale: 'zh-cn',
    format: 'YYYY-MM-DD HH:mm'
});
$("#startTime").on("dp.change",function (e) {
    $('#endTime').data("DateTimePicker").minDate(e.date);
});
$("#endTime").on("dp.change",function (e) {
    $('#startTime').data("DateTimePicker").maxDate(e.date);
});
</script>


</html>
