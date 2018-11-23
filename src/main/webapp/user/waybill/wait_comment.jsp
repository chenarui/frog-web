<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>待评价——运单详情</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/complain.css">
<link rel="stylesheet" href="../css/confirm_driver.css">
<link rel="stylesheet" href="../css/order_success.css">
<link rel="stylesheet" href="../css/wait_order_receiving.css">
<link rel="stylesheet" href="../css/wait_comment.css">

<script src="../js/jquery-1.11.0.min.js"></script>
</head>
<body>
	<jsp:include page="../top2.jsp"></jsp:include>

	<div class="con_part1">
		<div class="content">
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
					<c:if test="${order.state!=0 }">
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
					</c:if>
					<c:if test="${order.state==0 }">
						<div class="state_list" style="left: 170px;">
							<div class="state_title">指派司机</div>
							<img src="../img/state0.png" class="state_pic">
						</div>
					</c:if>

					<c:if test="${order.state > 1 }">
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
					</c:if>
					<c:if test="${order.state <= 1 }">
						<div class="state_list" style="left: 350px;">
							<div class="state_title">开始运输</div>
							<img src="../img/state0.png" class="state_pic">
						</div>
					</c:if>
					<c:if test="${order.state==3 }">
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
					</c:if>
					<c:if test="${order.state < 3 }">
						<div class="state_list" style="left: 530px;">
							<div class="state_title">成功运达</div>
							<img src="../img/state0.png" class="state_pic">
						</div>
					</c:if>
					<c:if test="${order.state == 3 and order.user_eva == 1 }">
						<div class="state_list" style="right: -30px;">
							<div class="state_title">已评价</div>
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
					</c:if>
					<c:if
						test="${order.state !=4 and order.is_complain != 1 and order.state !=5 and( order.state != 3 or order.user_eva != 1) }">
						<div class="state_list" style="right: -30px;">
							<div class="state_title">已评价</div>
							<img src="../img/state0.png" class="state_pic">
						</div>
					</c:if>

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
									<div class="atonce_comment">立即评价</div>
								</div>
							</div>
						</td>
					</tr>
				</table>

			</div>

		</div>


	</div>





	<jsp:include page="../bottom.jsp"></jsp:include>


	<!--司机弹出框-->
	<c:if
		test="${order.state==0 and not empty qd_driver_count and (empty order.driver_id or order.is_refuse !=0) }">
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
						<span>${list.car_length }米</span> <span>${list.car_type }</span> <span>${list.car_carry }吨</span>
					</div>
					<div class="send_btn" data-driver_id="${list.driver_id }"
						data-car_id="${list.car_id }">派他运输</div>
				</div>
			</c:forEach>
		</div>
	</c:if>

	<!--投诉-->
	<c:if test="${order.state==1 or order.state==2 }">
		<div class="complain_pop">
			<div class="complain_title">请对司机打分</div>
			<div style="width: 400px; margin: 0px auto;" class="com_list1_box">
				<c:forEach items="${complains }" var="list">
					<div class="comment_list">${list.value }</div>
				</c:forEach>
			</div>
			<div class="other_reason">- 或输入其他理由 -</div>
			<textarea class="describe" placeholder="请输入投诉理由及描述"
				id="complain_reason"></textarea>
			<div class="btn_box">
				<div class="cancel_btn">取消</div>
				<div class="ensure_btn" data-id="${order.order_id }"
					id="ensure_complain">确定</div>
			</div>

		</div>
	</c:if>

	<!--打分-->
	<c:if test="${order.state==3 and order.user_eva==0 }">
		<div class="score_pop">
			<div class="comment_sort">请对司机打分</div>
			<div class="start_box" id="add_star_box" id="add_star_box">
				<img src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1">
			</div>
			<div style="width: 400px; margin: 30px auto 0px;"
				class="com_list2_box">
				<c:forEach items="${tag }" var="list">
					<div class="comment_list_2">${list.value }</div>
				</c:forEach>
			</div>
			<div class="other_reason">- 或输入其他理由 -</div>
			<textarea class="describe" placeholder="请输入投诉理由及描述"></textarea>
			<div class="btn_box">
				<div class="cancel_btn">取消</div>
				<div class="ensure_btn" data-id="${order.order_id }" id="ensure_add">确定</div>
			</div>
		</div>
	</c:if>



	<!--司机评价弹框-->
	<c:if test="${order.state==3 and order.user_eva==1 }">
		<div class="comment_pop">
			<div class="comment1">
				<div class="comment_sort">我对他的评价</div>
				<div class="start_box">
					<img src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1">
				</div>
				<div style="width: 400px; margin: 30px auto 20px;"
					class="com_list1_box">
					<div class="comment_list_1">下次还约</div>
					<div class="comment_list_1">服务态度好</div>
					<div class="comment_list_1">非常专业</div>
				</div>
				<div class="comment_content">非常感谢李师傅高效率的帮我把货物运输到目的地，服务态度 也很好！</div>
			</div>

			<div class="comment2">
				<div class="comment_sort">他对我的评价</div>
				<div class="start_box">
					<img src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1"> <img
						src="../img/com_star1.png" class="com_star1">
				</div>
				<div style="width: 400px; margin: 30px auto 20px;"
					class="com_list1_box">
					<div class="comment_list_1">下次还约</div>
					<div class="comment_list_1">服务态度好</div>
					<div class="comment_list_1">非常专业</div>
				</div>
				<div class="comment_content">非常感谢李师傅高效率的帮我把货物运输到目的地，服务态度 也很好！</div>
			</div>
			<div class="confirm_btn" data-id="${order.order_id }">确定</div>

		</div>
	</c:if>
	<script src="../js/common.js"></script>
	<script>
$(function(){
	$('.active').removeClass('active');
	$('#myorder').addClass('active');	
});

    /*登录注册*/
    $("#login_a").click(function(){
        $(".score_pop").hide();
    });
    $("#reg_a").click(function(){
        $(".score_pop").hide();
    });
    $(".mask").on("click",function(){
        $(".score_pop").hide();
    });
    $(".forget_pwd").click(function(){
        $(".score_pop").hide();
    });
    $("#reg_btn").click(function(){
        $(".score_pop").hide();
    });
	//投诉订单
    $(".watch_complain").click(function(){
        $('.mask').show();
        $(".complain_pop").show();
        $(".contact_pop").hide();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        $(".bind_phone_num").hide();
    });
	
    $('.com_list1_box').on('click','.comment_list',function(){
        if ($(this).hasClass("o_checked")) {
            $(this).removeClass("o_checked");
        } else {
            $(this).addClass("o_checked");
        }
    });
    
    
    $('.com_list2_box').on('click','.comment_list_2',function(){
        if ($(this).hasClass("o_checked")) {
            $(this).removeClass("o_checked");
        } else {
            $(this).addClass("o_checked");
        }
    });
    //没拍单时
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
    
    $('.comment_pop .confirm_btn').click(function(){
    	 $('.mask').hide();
         $(".comment_pop").hide();       
    });
    
    $('.cancel_btn').click(function(){
    	$('.mask').hide();
        $(".comment_pop").hide(); 
        $(".score_pop").hide();
        $('.complain_pop').hide();
    });
    
    //订单评论
     $(".atonce_comment").click(function(){
        $('.mask').show();
        $(".score_pop").show();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        $(".bind_phone_num").hide();
    });
    
     $('.score_pop .com_star1').click(function(){
    	    
     	$(this).addClass('selected');
     	$(this).attr('src','../img/com_star1.png');
     	$(this).prevAll().addClass('selected');
     	$(this).prevAll().attr('src','../img/com_star1.png');
     	$(this).nextAll().removeClass('selected');
     	$(this).nextAll().attr('src','../img/com_star2.png');
     });
    
     $('#ensure_add').click(function(){
     	var order_id = $(this).attr('data-id');
     	var reason = '';
     	$('.score_pop').find('.comment_list_2').each(function(){
     		if($(this).hasClass('o_checked')){
     			reason = reason+ ","+$(this).html();
     		}
   		
     	});
     	if(reason!=''){
     		reason = reason.substring(1);
     	}
     	var star = $('#add_star_box').find('.selected').size();
     	if(star<1){
     		alert('请评论星级!');
     		return;
     	}
     	var content = $('#comment_reason').val(); 
     	
     	$.ajax({
 			url:'./addUserComment',
 			data:{order_id:order_id,reason:reason,content:content,star:star},
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
    
    
    //查看订单评论
    $(".check_comment").click(function(){
        $('.mask').show();
        $(".comment_pop").show();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        $(".bind_phone_num").hide();
    });
    
    $('.com_list2_box').on('click','.comment_list_2',function(){
        if ($(this).hasClass("o_checked")) {
            $(this).removeClass("o_checked");
        } else {
            $(this).addClass("o_checked");
        }
    });
   
    
</script>
</body>
</html>