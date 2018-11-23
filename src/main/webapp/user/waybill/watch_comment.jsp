<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>查看评价——运单详情</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/wait_comment.css">

<script src="../js/jquery-1.11.0.min.js"></script>
</head>
<body>
	<jsp:include page="../top2.jsp"></jsp:include>


	<div class="content">
		<div class="con_part1">
			<div class="part1_top">
				我的运单 > <span style="color: #1fb375;">订单详情：${order.order_num }</span>
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
						<img src="../img/state1.png" class="state_pic">
						<div class="date">
							<fmt:formatDate value="${order.specific_time }" type="date"
								pattern="yyyy-MM-dd" />
						</div>
						<div class="time">
							<fmt:formatDate value="${order.specific_time }" type="date"
								pattern="hh:mm:ss" />
						</div>
					</div>
					<div class="state_list" style="left: 350px;">
						<div class="state_title">开始运输</div>
						<img src="../img/state1.png" class="state_pic">
						<div class="date">
							<fmt:formatDate value="${order.start_time }" type="date"
								pattern="yyyy-MM-dd" />
						</div>
						<div class="time">
							<fmt:formatDate value="${order.start_time }" type="date"
								pattern="hh:mm:ss" />
						</div>
					</div>
					<div class="state_list" style="left: 530px;">
						<div class="state_title">成功运达</div>
						<img src="../img/state1.png" class="state_pic">
						<div class="date">
							<fmt:formatDate value="${order.complete_time }" type="date"
								pattern="yyyy-MM-dd" />
						</div>
						<div class="time">
							<fmt:formatDate value="${order.complete_time }" type="date"
								pattern="hh:mm:ss" />
						</div>
					</div>
					<div class="state_list" style="right: -30px;">
						<div class="state_title">已评价</div>
						<img src="../img/state1.png" class="state_pic">
						<div class="date">
							<fmt:formatDate value="${comment.add_time }" type="date"
								pattern="yyyy-MM-dd" />
						</div>
						<div class="time">
							<fmt:formatDate value="${comment.add_time }" type="date"
								pattern="hh:mm:ss" />
						</div>
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
						<td>
							<div>
								<img src="${ps_driver.avatar_url }" class="avatar1">
								<div class="driver_infor">
									<div>
										<span>${ps_driver.name }</span><span>${ps_driver.car_number }</span>
									</div>
									<div class="star_box">
										<c:forEach step="1" end="${ps_driver.eva_point }" begin="1">
											<img src="../img/star.png">
										</c:forEach>
									</div>
									<c:if test="${not empty ps_driver.car_number }">
										<div>
											<span class="car_infor">${ps_driver.car_length }米</span> <span
												class="car_infor">${ps_driver.type_name }</span> <span
												class="car_infor">${ps_driver.car_carry }吨</span>
										</div>
									</c:if>
									<div class="check_comment">查看评价</div>
								</div>
							</div>
						</td>
					</tr>
				</table>

			</div>



		</div>

	</div>


	<jsp:include page="../bottom.jsp"></jsp:include>

	<!--司机评价弹框-->
	<div class="comment_pop">
		<div class="comment1">
			<div class="comment_sort">我对他的评价</div>
			<div class="start_box">
				<c:forEach step="1" begin="1" end="${user_comment.point }">
					<img src="../img/com_star1.png" class="com_star1">
				</c:forEach>
			</div>
			<div style="width: 400px; margin: 30px auto 20px;"
				class="com_list1_box">
				<c:forEach items="${user_comment.alltags }" var="list">
					<div class="comment_list_1 o_checked">${list }</div>
				</c:forEach>
			</div>
			<div class="comment_content">${user_comment.content }</div>
		</div>

		<div class="comment2">
			<div class="comment_sort">他对我的评价</div>
			<div class="start_box">
				<c:forEach step="1" begin="1" end="${driver_comment.point }">
					<img src="../img/com_star1.png" class="com_star1">
				</c:forEach>
			</div>
			<div style="width: 400px; margin: 30px auto 20px;"
				class="com_list1_box">
				<c:forEach items="${driver_comment.alltags }" var="list">
					<div class="comment_list_1 o_checked">${list }</div>
				</c:forEach>
			</div>
			<div class="comment_content">${driver_comment.content }</div>
		</div>
		<div class="confirm_btn">确定</div>

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
        $(".comment_pop").hide();
    });
    $("#reg_a").click(function(){
        $(".comment_pop").hide();
    });
    $(".mask").on("click",function(){
        $(".comment_pop").hide();
    });
    $(".forget_pwd").click(function(){
        $(".comment_pop").hide();
    });
    $("#reg_btn").click(function(){
        $(".comment_pop").hide();
    });

    $(".check_comment").click(function(){
        $('.mask').show();
        $(".comment_pop").show();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        $(".bind_phone_num").hide();
    });
    
    $('.confirm_btn').click(function(){
    	 $('.mask').hide();
         $(".comment_pop").hide();
    });
    
//     $('.com_list1_box').on('click','.comment_list_1',function(){
//         if ($(this).hasClass("o_checked")) {
//             $(this).removeClass("o_checked");
//         } else {
//             $(this).addClass("o_checked");
//         }
//     });

</script>