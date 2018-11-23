<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>未达成——运单详情</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/order_success.css">
<style type="text/css">
.money_info {
	display: inline-block;
}

.driver_pop {
	width: 900px;
	height: 600px;
	overflow: scroll;
}

span.driver_name {
	width: 60px;
	display: inline-block;
}

.star_box {
	display: inline-block;
	margin: 0 10px;
	width: 100px;
}

.car_infor {
	display: inline-block;
	width: 180px;
}
</style>
<script src="../js/jquery-1.11.0.min.js"></script>
</head>
<body>
	<jsp:include page="../top2.jsp"></jsp:include>

	<div class="content">
		<div class="con_part1">
			<div class="part1_top">
				我的运单 > <span style="color: #1fb375;">订单详情：${order.order_num }</span>
				<span class="cancle_order" data-id="${order.order_id }">取消订单</span>
			</div>
			<div class="part2_top">
				<div class="progress">
					<div class="state_list" style="left: -30px;">
						<div class="state_title">下单成功</div>
						<img src="../img/state1.png" class="state_pic">
						<div class="date">
							<fmt:formatDate value="${order.add_time }" type="date"
								pattern="yyyy-MM-dd" />
						</div>
						<div class="time">
							<fmt:formatDate value="${order.add_time }" type="date"
								pattern="hh:mm:ss" />
						</div>
					</div>
					<div class="state_list" style="left: 170px;">
						<div class="state_title">指派司机</div>
						<img src="../img/state0.png" class="state_pic">
					</div>
					<div class="state_list" style="left: 350px;">
						<div class="state_title">开始运输</div>
						<img src="../img/state0.png" class="state_pic">
					</div>
					<div class="state_list" style="left: 530px;">
						<div class="state_title">成功运达</div>
						<img src="../img/state0.png" class="state_pic">
					</div>
					<div class="state_list" style="right: -30px;">
						<div class="state_title">已评价</div>
						<img src="../img/state0.png" class="state_pic">
					</div>
				</div>
			</div>

			<div class="left">
				<!--全部车辆-->
				<table cellspacing="0" class="list_infor">
					<tr>
						<th>运输信息</th>
						<th>其它信息</th>
						<th>报价信息</th>
						<th>司机信息</th>
					</tr>

					<tr>
						<td>
							<div class="td_title">发货信息</div>
							<div class="td_content">
								<div>${order.send_province_name }${order.send_city_name }${order.send_area_name }${order.send_address }</div>
								<div>${order.send_name }<span class="num">${order.send_phone }</span>
								</div>
								<div>
									<fmt:formatDate value="${order.send_time }" type="date"
										pattern="yyyy-MM-dd" />
									<span class="num"><fmt:formatDate
											value="${order.send_time }" type="date" pattern="hh:mm" /></span>
								</div>
							</div>
							<div class="td_title">收货信息</div>
							<div class="td_content">
								<div>${order.recive_province_name }${order.recive_city_name }${order.recive_area_name }${order.recive_address }</div>
								<div>${order.recive_name }<span class="num">${order.recive_phone }</span>
								</div>
								<div>
									<fmt:formatDate value="${order.recive_time }" type="date"
										pattern="yyyy-MM-dd" />
									<span class="num"><fmt:formatDate
											value="${order.recive_time }" type="date" pattern="hh:mm" /></span>
								</div>
							</div>
						</td>
						<td>
							<div class="td_title">货物信息</div>
							<div class="td_content">${order.cago_name }（长${order.cago_length }米
								重${order.cago_carry }吨 ${order.cago_volume }方 数量
								${order.cago_num }）</div>
							<div class="td_title">车辆需求</div>
							<div class="td_content">${order.cartype_name }</div>
							<div class="td_title">运输方式</div>
							<div class="td_content">${order.carpool_model }</div>
						</td>
						<td>
							<!--                             <div class="td_title">意向金</div> -->
							<%--                             <c:if test="${not empty order.money }"> --%>
							<%--                             <div class="td_content">￥${order.money }</div> --%>
							<%--                             </c:if> --%> <%--                             <c:if test="${empty order.money }"> --%>
							<!--                             <div class="td_content">暂无数据</div> -->
							<%--                             </c:if> --%> <!--                             <div class="td_title">追加金额</div> -->
							<%-- <%--                             <fmt:formatNumber value="${order.total_money*order.markup_ratio }" var="other_money" pattern="#.##"></fmt:formatNumber> --%>
							<%--                             <c:if test="${not empty order.money }"> --%>
							<%--                             <div class="td_content">${order.markupPercent }（￥${order.total_money-order.money }）</div> --%>
							<%--                             </c:if> --%> <%--                             <c:if test="${empty order.money }"> --%>
							<!--                             <div class="td_content">暂无数据</div> -->
							<%--                             </c:if>                          --%>
							<div class="td_title">合计报价</div> <c:if
								test="${not empty order.money }">
								<div class="td_content">￥${order.total_money }</div>
							</c:if> <c:if test="${empty order.money }">
								<div class="td_content">暂无数据</div>
							</c:if>
						</td>
						<td><c:if test="${empty qd_driver_count }">
								<div class="grab_num">还没有人抢单</div>
							</c:if> <c:if test="${not empty qd_driver_count }">
								<div class="grab_num">已有${qd_driver_count }位司机抢单，去派单吧</div>
								<div class="send_order">立即派单</div>
							</c:if></td>
					</tr>
				</table>

			</div>

		</div>

	</div>


	<jsp:include page="../bottom.jsp"></jsp:include>
	<!--司机弹出框-->
	<div class="driver_pop">
		<div class="driver_title">
			请选择司机派单 <img src="../img/close.png" class="close_sign">
		</div>
		<c:forEach var="list" items="${qd_driver }">
			<div class="driver_list">
				<img src="${list.avatar_url }" class="avatar"> <span
					class="driver_name">${list.name }</span>
				<div class="star_box">
					<c:forEach step="1" end="${list.eva_point }" begin="1">
						<img src="../img/star.png">
					</c:forEach>
				</div>
				<span class="plate_num">${list.car_number }</span>
				<div class="car_infor">
					<span>${list.car_length }米</span> <span>${list.type_name }</span> <span>${list.car_carry }吨</span>
				</div>
				<div class="money_info">
					<span>竞价:￥${list.total_money }</span>
					<%--         	<span>加价:${list.markupPercent }</span>       	 --%>
				</div>
				<div class="send_btn" data-driver_id="${list.driver_id }"
					data-car_id="${list.car_id }" data-order_id="${order.order_id }">派他运输</div>
			</div>
		</c:forEach>



	</div>

</body>
</html>
<script src="../js/common.js"></script>
<script>
$(function(){
	$('.active').removeClass('active');
	$('#myorder').addClass('active');	
});

    /*登录注册*/
    $("#login_a").click(function(){
        $(".driver_pop").hide();
    });
    $("#reg_a").click(function(){
        $(".driver_pop").hide();
    });
    $(".mask").on("click",function(){
        $(".driver_pop").hide();
    });
    $(".forget_pwd").click(function(){
        $(".driver_pop").hide();
    });
    $("#reg_btn").click(function(){
        $(".driver_pop").hide();
    });

    $(".send_order").click(function(){
        $('.mask').show();
        $(".driver_pop").show();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        $(".bind_phone_num").hide();
    });
    $(".close_sign").click(function(){
        $('.mask').hide();
        $(".driver_pop").hide();
    });

    $('.send_btn').click(function(){
    	var flag = confirm("是否派单?");
    	if(!flag){
    		return;
    	}
    	var order_id = $(this).attr('data-order_id');
    	var driver_id = $(this).attr('data-driver_id');
    	var car_id = $(this).attr('data-car_id');
    	
    	$.ajax({
 			url:'./handleOutOrder',
 			data:{order_id:order_id,driver_id:driver_id,car_id:car_id},
 			success:function(msg){
 				if(msg.c==1){
 					alert('操作成功!');
 					history.go(0);
 				}else{
 					alert('操作失败!');
 				}
 			}
 			
 		});
    	
    });
    
    $('.cancle_order').click(function(){
    	var flag = confirm("是否取消此账单?");
    	if(!flag){
    		return;
    	}
    	var order_id = $(this).attr('data-id');
    	$.ajax({
    		url:'./closeOrder',
    		data:{order_id:order_id,reason:'',content:''},
    		success:function(msg){
    			if(msg.c==1){
    				alert('操作成功!');
    				location.href="./in_progress"
    			}else{
    				alert('操作失败!');
    			}
    		}
    		
    	});
    });

</script>