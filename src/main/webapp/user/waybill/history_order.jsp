<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>历史订单</title>
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
				<div class="item_sort  checked" id="history_order">历史订单</div>
				<div class="item_sort" id="dispute">争议订单</div>
			</div>

			<div class="left">
				<div class="select_container">
					<div class="select_box">
						<div class="select_box">
							<span>发货时间：</span>
							<div class="picker_div">
								<div class="input-group date">
									<input class="home_select form-control time_picker"
										id="startTime" value="${startTime }">
								</div>
								<span style="margin-top: -25px;">—</span>
								<div class="input-group date">
									<input class="home_select form-control time_picker"
										id="endTime" value="${endTime }">
								</div>
								<input type="text" id="key" class="searchKey" value="${key }"
									placeholder="请输入订单号或运输地址" /> <span class="search_btn"
									onclick="search(1)">搜索</span>
							</div>
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
							<td>
								<!-- "0：未达成（可以抢单）
						1：未开始
						2：运输中
						3：已完成
						4：已取消
						5：已关闭"
                         --> <span class="not_reach"> <c:if
										test="${list.state==3 }">
										<c:if test="${list.user_eva==1 }">已完成</c:if>
										<c:if test="${list.user_eva==0 }">待评论</c:if>
									</c:if> <c:if test="${list.state==4 }">已取消</c:if>
							</span>
							</td>
							<td><c:if test="${list.state==3 }">
									<c:if test="${list.user_eva==0 }">
										<div class="atonce_comment" data-id="${list.order_id }">立即评价</div>
									</c:if>
									<c:if test="${list.user_eva==1 }">
										<div class="check_comment check_comment1"
											data-id="${list.order_id }">查看评价</div>
									</c:if>
								</c:if> <c:if test="${list.state==4 }">
									<div class="check_comment have_del" data-id="${list.order_id }"
										style="border: 0px;">&nbsp;</div>
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

	<!--司机评价弹框-->
	<div class="comment_pop">
		<div class="comment1">
			<div class="comment_sort">我对他的评价</div>
			<div class="start_box" id="view_user_star">

				<img src="../img/com_star1.png" class="com_star1"> <img
					src="../img/com_star1.png" class="com_star1"> <img
					src="../img/com_star1.png" class="com_star1"> <img
					src="../img/com_star1.png" class="com_star1"> <img
					src="../img/com_star1.png" class="com_star1">
			</div>
			<div style="width: 400px; margin: 30px auto 20px;"
				class="com_list1_box" id="view_user_tag">
				<div class="comment_list_1">下次还约</div>
				<div class="comment_list_1">服务态度好</div>
				<div class="comment_list_1">非常专业</div>
			</div>
			<div class="comment_content" id="view_user_content">非常感谢李师傅高效率的帮我把货物运输到目的地，服务态度
				也很好！</div>
		</div>

		<div class="comment2">
			<div class="comment_sort">他对我的评价</div>
			<div class="start_box" id="view_driver_star">
				<img src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1"> <img
					src="../img/com_star2.png" class="com_star1">
			</div>
			<div style="width: 400px; margin: 30px auto 20px;"
				class="com_list1_box" id="viw_driver_tag"></div>
			<div class="comment_content" id="view_driver_content"></div>
		</div>

		<div class="confirm_btn" id="ensure_comment">确定</div>

	</div>


	<!--打分-->
	<div class="score_pop">
		<div class="comment_sort">请对司机打分</div>
		<div class="start_box" id="add_star_box">
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
		<textarea class="describe" placeholder="请输入投诉理由及描述"
			id="comment_reason"></textarea>
		<div class="btn_box">
			<div class="cancel_btn">取消</div>
			<div class="ensure_btn" id="ensure_add">确定</div>
		</div>

	</div>
</body>
</html>
<script src="../js/common.js"></script>
<script>
   /* $(".item_sort").click(function(){
        $(".item_sort").removeClass("checked");
        $(this).addClass("checked");
    });*/
    
    $(function(){
    	$('.active').removeClass('active');
    	$('#myorder').addClass('active');	
    });

    /*登录注册*/
    $("#login_a").click(function(){
        $(".comment_pop").hide();
        $(".score_pop").hide();
    });
    $("#reg_a").click(function(){
        $(".comment_pop").hide();
        $(".score_pop").hide();
    });
    $(".mask").on("click",function(){
        $(".comment_pop").hide();
        $(".score_pop").hide();
    });
    $(".forget_pwd").click(function(){
        $(".comment_pop").hide();
        $(".score_pop").hide();
    });
    $("#reg_btn").click(function(){
        $(".comment_pop").hide();
        $(".score_pop").hide();
    });

    $(".check_comment1").click(function(){
    	var id = $(this).attr('data-id');
    	showComment(id);
        $('.mask').show();
        $(".comment_pop").show();
        $(".score_pop").hide();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        $(".bind_phone_num").hide();
    });
    $(".atonce_comment").click(function(){
    	$('#ensure_add').attr('data-id',$(this).attr('data-id'));
    	 $('.mask').show();
         $(".score_pop").show();
         $(".comment_pop").hide();
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
    $('.score_pop .com_star1').click(function(){
    
    	$(this).addClass('selected');
    	$(this).attr('src','../img/com_star1.png');
    	$(this).prevAll().addClass('selected');
    	$(this).prevAll().attr('src','../img/com_star1.png');
    	$(this).nextAll().removeClass('selected');
    	$(this).nextAll().attr('src','../img/com_star2.png');
    });
    
    
    $('.com_list1_box').on('click','.comment_list_1',function(){
        if ($(this).hasClass("o_checked")) {
            $(this).removeClass("o_checked");
        } else {
            $(this).addClass("o_checked");
        }
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
    	location.href="./history_order?key="+'${key}'+"&startTime="+'${startTime}'+"&endTime="+'${endTime}'+"&page="+page;
    });
    
    function search(page){
    	var user_id = 28;
    	var startTime = $('#startTime').val();
    	var endTime = $('#endTime').val();
    	var key = $('#key').val();
    	location.href="./history_order?key="+key+"&startTime="+startTime+"&endTime="+endTime+"&page="+page;
    }
      

    $('#ensure_add').click(function(){
    	var order_id = $(this).attr('data-id');
    	var reason = '';
    	$('.score_pop').find('.comment_list_2').each(function(){
    		if($(this).hasClass('o_checked')){
    			reason = reason+ ","+$(this).html();
    		}
  		
    	});
    	if(reason!=''){
    		reason = reason.substring(1)
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
    
    $("#have_del").unbind("mouseenter").unbind("mouseleave");   
    
    $('.cancel_btn').click(function(){
	$('.mask').hide();
	$(".score_pop").hide();
	$(".comment_pop").hide();
    $(".login").hide();
    $(".regist").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
    });
    
   
    $('#ensure_comment').click(function(){
    	$('.mask').hide();
    	$(".score_pop").hide();
    	$(".comment_pop").hide();
        $(".login").hide();
        $(".regist").hide();
        $(".modify_pwd").hide();
        $(".reg_success").hide();
        });
    
    function showComment(order_id){
    	$.ajax({
			url:'./getCommentByOrder',
			data:{order_id:order_id},
			success:function(msg){
				if(msg.c==1){
					var data = eval('('+msg.r+')');
					var driver = data.driver;
					var user = data.user;
					var html = '';
					if(user){
						html='';//星级
						var u_star =user.point;
						for(var i=0;i<u_star;i++){
							html+=' <img src="../img/com_star1.png" class="com_star1">'
						}
						$('#view_user_star').html();
						html='';//评价标签
						var u_reason = user.tag;
						var u_tag = u_reason.split(',');
						for(var i=0;i<u_tag.length;i++){
							html = html+'<div class="comment_list_1">'+u_tag[i]+'</div>';
						}
						$('#view_user_tag').html(html);
						$('#view_user_content').html(user.content);//其他评论
					}
					if(driver){
						html='';
						var d_star =driver.point;
						for(var i=0;i<d_star;i++){
							html+=' <img src="../img/com_star1.png" class="com_star1">'
						}
						$('#view_user_star').html();
						html='';//评价标签
						var d_reason = driver.tag;
						var d_tag = d_reason.split(',');
						for(var i=0;i<d_tag.length;i++){
							html = html+'<div class="comment_list_1">'+d_tag[i]+'</div>';
						}
						$('#view_user_tag').html(html);
						$('#view_user_content').html(driver.content);//其他评论
					}else{
						$('.comment2').html('<div class="comment_sort">他对我还没有评论</div><div class="start_box" id="view_driver_star"></div>'+
								'<div style="width: 400px;margin: 30px auto 20px;" class="com_list1_box" id="viw_driver_tag"></div>'+
								'<div class="comment_content" id="view_driver_content"></div>');
					}
					
					
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