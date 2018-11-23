<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>争议订单</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="../css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/existing_order.css">
<link rel="stylesheet" href="../css/history_order.css">
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


	<div class="content">
		<div class="con_part1">
			<div class="infor_list_top">
				<div class="item_sort" id="in_progress">正在进行</div>
				<div class="item_sort" id="history_order">历史订单</div>
				<div class="item_sort  checked" id="dispute">争议订单</div>
			</div>

			<div class="left">
				<div class="select_container">
					<div class="select_box">
						<span>发货时间：</span>
						<div class="picker_div">
							<div class="input-group date">
								<input class="home_select form-control time_picker"
									id="startTime" value="${startTime }">
							</div>
							<span style="margin-top: -25px;">—</span>
							<div class="input-group date">
								<input class="home_select form-control time_picker" id="endTime"
									value="${endTime }">
							</div>
							<input type="text" id="key" class="searchKey" value="${key }"
								placeholder="请输入订单号或运输地址" /> <span class="search_btn"
								onclick="search(1)">搜索</span>
						</div>
					</div>

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
					<c:forEach items="${infos }" var="list">

						<tr>
							<td class="order_num" data-id="${list.order_id }">${list.order_num }</td>
							<td><img src="../img/logo_f4.png" class="logo_f4">
								<div class="dri_address">
									<div class="dri_add1">
										<span class="font_big">${list.send_province_name }${list.send_city_name }</span>${list.send_area_name }</div>
									<div class="dri_add2">
										<span class="font_big">${list.recive_province_name }${list.recive_city_name }</span>${list.recive_area_name }</div>
								</div></td>
							<td><img src="../img/logo_f4.png" class="logo_f4">
								<div class="dri_address">
									<div class="dri_add1">
										<span class="font_big"><fmt:formatDate
												value="${list.send_time }" type="date" pattern="yyyy-MM-dd" /></span>
										<fmt:formatDate value="${list.send_time }" type="date"
											pattern="hh:mm" />
									</div>
									<div class="dri_add2">
										<span class="font_big"><fmt:formatDate
												value="${list.recive_time }" type="date"
												pattern="yyyy-MM-dd" /></span>
										<fmt:formatDate value="${list.recive_time }" type="date"
											pattern="hh:mm" />
									</div>
								</div></td>
							<td><span class="order_car_infor">${list.cago_name }</span>
								<span class="order_car_infor">总重${list.carry }t</span> <span
								class="order_car_infor">${list.cago_volume }m³</span></td>
							<td><span class="order_car_infor">${list.cartype_name }</span>
								<span class="order_car_infor">${list. carpool_model }</span> <!--                             <span class="order_car_infor">5吨</span> -->

							</td>
							<td><c:if test="${not empty list.money }">
									<div class="price">￥${list.total_money }</div>
									<%--                             <div>（${list.money }+追加${list.markupPercent }）</div> --%>
								</c:if> <c:if test="${empty list.money }">
									<div class="price">暂无报价</div>
								</c:if></td>
							<td><span class="not_reach"> <c:if
										test="${list.state!=5 }">申述中</c:if> <c:if
										test="${list.state==5 }">已关闭</c:if>
							</span></td>
							<td><c:if test="${list.state!=5 }">
									<div class="check_complain" data-id="${list.order_id }">投诉详情</div>
								</c:if> <c:if test="${list.state==5 }">
									<div class="check_handle" data-id="${list.order_id }">处理详情</div>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>
				<div class="page_turning">
					<span class="total_infor">共${count }条信息</span> <span
						class="turn_page" data-val="${page-1 }">上一页</span> <span
						class="page_num">${page }</span> / <span class="total_num">${total_num }</span>
					<span class="turn_page" data-val="${page+1 }">下一页</span>
				</div>

			</div>


		</div>

	</div>


	<jsp:include page="../bottom.jsp"></jsp:include>

	<!--投诉详情-->
	<div class="complain_pop">
		<div class="complain_title">投诉详情</div>
		<div style="width: 290px; height: auto; margin: 0 auto;"
			class="com_list1_box" id="complain_tag">
			<div class="comment_list">未按时运输</div>
			<div class="comment_list">联系不上</div>
		</div>
		<div class="complain_content" id="complain_content">到了运输时间，联系不上司机了，人也没来。不知道
			什么情况了 ？</div>
		<div class="confirm_btn" style="margin: 56px auto 20px;">确定</div>
	</div>
	<!--处理详情-->
	<div class="handle_pop">
		<div class="handle_title">处理详情</div>
		<div class="handle_content" id="notice_content">根据系统记录显示，司机未按时运输，对货主造成损失
			，该订单已被系统关闭。</div>
		<div class="confirm_btn" style="margin: 80px auto 20px;">确定</div>
	</div>

</body>
</html>
<script src="../js/common.js"></script>
<script>
  /*  $(".item_sort").click(function(){
        $(".item_sort").removeClass("checked");
        $(this).addClass("checked");
    });*/
    
    $(function(){
    	$('.active').removeClass('active');
    	$('#myorder').addClass('active');	
    });

    /*登录注册*/
    $("#login_a").click(function(){
        $(".complain_pop").hide();
        $(".handle_pop").hide();
    });
    $("#reg_a").click(function(){
        $(".complain_pop").hide();
        $(".handle_pop").hide();
    });
    $(".mask").on("click",function(){
        $(".complain_pop").hide();
        $(".handle_pop").hide();
    });
    $(".forget_pwd").click(function(){
        $(".complain_pop").hide();
        $(".handle_pop").hide();
    });
    $("#reg_btn").click(function(){
        $(".complain_pop").hide();
        $(".handle_pop").hide();
    });

    $(".check_complain").click(function(){
    	showComplain($(this).attr('data-id'));
        $('.mask').show();
        $(".complain_pop").show();
        $(".handle_pop").hide();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        $(".bind_phone_num").hide();
    });
    $(".check_handle").click(function(){
    	showHandle($(this).attr('data-id'));
        $('.mask').show();
        $(".handle_pop").show();
        $(".complain_pop").hide();
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
    
    $('.confirm_btn').click(function(){
    	$('.mask').hide();
    	$(".handle_pop").hide();
    	$(".complain_pop").hide();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        });
    
    $('.turn_page').click(function(){
    	var page = $(this).attr('data-val');
    	if(page<1){
    		return;
    	}
    	var total_page = '${total_num}';
    	if(page>total_page){
    		return;
    	}
    	location.href="./disput?key="+'${key}'+"&startTime="+'${startTime}'+"&endTime="+'${endTime}'+"&page="+page;
    });
    
    function search(page){
    	var user_id = 28;
    	var startTime = $('#startTime').val();
    	var endTime = $('#endTime').val();
    	var key = $('#key').val();
    	location.href="./dispute?key="+key+"&startTime="+startTime+"&endTime="+endTime+"&page="+page;
    }

    function showHandle(id){
    	$.ajax({
			url:'./getOrderHandle',
			data:{order_id:id},
			success:function(msg){
				if(msg.c==1){
					var data = eval('('+msg.r+')');
					$('#notice_content').html(data.dispose_content);									
				}else{
					alert('操作失败!');
				}
			}
			
		});
    }
    function showComplain(id){
    	$.ajax({
			url:'./getUserComplan',
			data:{order_id:id},
			success:function(msg){
				if(msg.c==1){
					var data = eval('('+msg.r+')');
					var reason = data.tag;
					var tag = reason.split(',')
					var html='';
					for(var i =0;i<tag.length;i++){
						html+=' <div class="comment_list">'+tag[i]+'</div>';
					}
					$('#complain_tag').html(html);
					$('#complain_content').html(data.content);
					
				}else{
					alert('操作失败!');
				}
			}
			
		});
    }
    
    $('#in_progress').click(function(){
    	if(!$(this).hasClass('checked')){
    		location.href='./in_progress';
    	}	
    });
    $('#history_order').click(function(){
    	if(!$(this).hasClass('checked')){
    		location.href='./history_order';
    	}	
    });
    $('#dispute').click(function(){
    	if(!$(this).hasClass('checked')){
    		location.href='./dispute';
    	}	
    });
    $('.order_num').click(function(){
    	location.href='./wait_comment?order_id='+$(this).attr('data-id');
    });
    
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