<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>首页——个人中心</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/my_home.css">

<script src="../js/jquery-1.11.0.min.js"></script>
</head>
<body>

	<jsp:include page="../top2.jsp"></jsp:include>

	<div class="con_part1">
		<div class="content">
			<div class="left">
				<div class="list_container">
					<div class="left_list checked" id="firstpage">
						<img src="../img/per_logo1_g.png" class="per_logo logo_checked">
						我的首页
					</div>
					<div class="left_list" id="my_send_address">
						<img src="../img/per_logo2.png" class="per_logo"> 我的发货地址
					</div>
					<div class="left_list" id="address_book">
						<img src="../img/per_logo3.png" class="per_logo"> 我的通讯录
					</div>
					<div class="left_list" id="my_bill">
						<img src="../img/per_logo4.png" class="per_logo"> 我的账单
					</div>
					<div class="left_list" id="my_comment">
						<img src="../img/per_logo5.png" class="per_logo"> 我的评价
					</div>

				</div>
			</div>

			<div class="right">
				<div class="user_infor_box">
					<c:if test="${ empty info.avatar_url }">
						<img src="../img/avatar_pic.png" class="avatar_pic"
							style="width: 112px; height: 112px">
					</c:if>
					<c:if test="${ not empty info.avatar_url }">
						<img src="${info.avatar_url }" class="avatar_pic"
							style="width: 112px; height: 112px">
					</c:if>
					<div class="user_infor">
						<div class="infor_box1">
							<span class="user_name">${info.name }</span> <span
								class="user_phone">${info.phone }</span> <span class="modify"
								id="modify_infor" data-id="${info.user_id }">修改个人信息</span>
						</div>
						<div class="infor_box2">
							<span class="user_sex">${info.sex }</span> <span
								class="user_sorts">${info.user_type }</span> <span
								class="approve_sign">已认证</span> <span class="modify"
								id="modify_pwd">修改登录密码</span>
						</div>
					</div>
				</div>
				<div class="message__box">
					<div class="list_title_box">
						<div class="list_title ltitle_checked">系统通知(${notreadcount })</div>
						<!--                     <div class="list_title">发车通知</div> -->
						<!--                     <div class="list_title">应标消息</div> -->
						<!--                     <div class="list_title">完成消息</div> -->
						<!--                     <div class="list_title">评价消息</div> -->
					</div>

					<c:forEach items="${messages }" var="list">
						<div class="list_content">
							<div class="row1">
								<c:if test="${list.is_read==0 }">
									<img src="../img/red_dot.png" class="red_dot">
								</c:if>
								[系统消息] 您的订单<span class="order_num"
									data-is_read="${list.is_read }" data-id="${list.id }"
									data-order_id="${list.third_id }">${list.order_num }</span>${list.title }
							</div>
							<div class="row2">
								<span class="date">${list.fmt_send_date }</span> <span
									class="time">${list.fmt_send_time }</span>
							</div>

						</div>
					</c:forEach>
					<c:if test="${empty more }">
						<div class="watch_more">
							查看更多 <img src="../img/more.png" class="more">
						</div>
					</c:if>

				</div>
			</div>
		</div>

	</div>


	<jsp:include page="../bottom.jsp"></jsp:include>

	<!--修改密码弹框-->
	<div class="modify_login_pwd">
		<div class="mod_pwd_title">修改登录密码</div>
		<input type="text" class="pwd_input" id="old_pwd" placeholder="请输入旧密码">
		<input type="text" class="pwd_input" placeholder="请输入新密码"> <input
			type="text" class="pwd_input" placeholder="请再次输入">

		<div class="btn_box1">
			<div class="cancel_btn">取消</div>
			<div class="ensure_btn" id="modify_pwd_btn">确定</div>
		</div>
	</div>
</body>
</html>
<script src="../js/common.js"></script>
<script>
$(function(){
	$('.active').removeClass('active');
	$('#personcenter').addClass('active');	
});

var endIndex = 6; 

$("#modify_infor").click(function(){
    location.href = "modify_infor";
});

$("#login_a").click(function(){
    $(".modify_login_pwd").hide();
});
$("#reg_a").click(function(){
    $(".modify_login_pwd").hide();
});
$(".mask").on("click",function(){
    $(".modify_login_pwd").hide();
});
$(".forget_pwd").click(function(){
    $(".modify_login_pwd").hide();
});
$("#reg_btn").click(function(){
    $(".modify_login_pwd").hide();
});
$("#modify_pwd").click(function(){
    $('.mask').show();
    $(".modify_login_pwd").show();
    $(".login").hide();
    $(".regist").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
});

$('.cancel_btn').click(function(){
	 	$('.mask').hide();
    $(".modify_login_pwd").hide();
    $(".login").hide();
    $(".regist").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
});

$('#modify_pwd_btn').click(function(){
	var old_pwd = $('#old_pwd').val();
	var new_pwd1 = $('#old_pwd').nextAll().eq(0).val();
	var new_pwd2 = $('#old_pwd').nextAll().eq(1).val();
	if(old_pwd==''){
		alert('请输入原密码');
		return;
	}
	if(new_pwd1==''||new_pwd2==''){
		alert('请输入新密码');
		return;
	}
	if(new_pwd1!=new_pwd2){
		alert('两次密码不相同');
		return;
	}
	$.ajax({
		url:'./modifypwd',
		data:{old_pwd:old_pwd,new_pwd:new_pwd},
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


$(document).on('click','.watch_more',function(){
	var user_id = 29;
	var mr = $(this);
	$(this).remove();
	$.ajax({
 		 url:'./getmoreMessage',
 		 data:{id:user_id,start:endIndex},
 		 success:function(msg){
 			if(msg.c==1){
 				var data = eval('('+msg.r+')');
 				console.log(data);
 				var size = data.length;
 				endIndex +=size; 				
 				$('.message__box').css('height',85*endIndex+110);//改变高度
 				$('.footer').css('top',(endIndex-6)/6*500+20);
 				$('.footer').css('position','relative');
 				for(var i = 0;i<size;i++){
 					var html = ' <div class="list_content">';
 					html+=' <div class="row1">';
 					if(data[i].is_read==0){
 						html+=' <img src="../img/red_dot.png" class="red_dot">';
 					} 					
 					html= html+'[系统消息] 您的订单<span class="order_num" data-is_read="'+data[i].is_read+'" data-id="'+data[i].id+'" data-order_id="'+data[i].third_id+'>'+data[i].order_num +'</span>'+data[i].title ;
 					html+=' </div>';
 					html+=' <div class="row2">';    			    	
 					html= html+ '  <span class="date">'+data[i].fmt_send_date +'</span>';
 					html+='  <span class="time">'+data[i].fmt_send_time +'</span>';
 					html+=' </div>';
 					html+=' </div>';
 			    	$('.message__box').append(html);
 				}
 				if(msg.m!='no more'){
 					$('.message__box').append(mr);
 				}
 			}else{
 				alert("操作失败");
 			}
				
 		 }
 	 });
});
	              
$(document).on('click','.order_num',function(){
	var id = $(this).attr('data-id');
	var order_id = $(this).attr('data-order_id');
	if($(this).attr('data-is_read')==0){
		readMessage(id,order_id);
	}else{
		 location.href="../waybill/wait_comment?order_id="+order_id;
	}
});

function readMessage(message_id,order_id){
	$.ajax({
		 url:'./readMessage',
		 data:{message_id:message_id},
		 success:function(msg){
			 location.href="../waybill/wait_comment?order_id="+order_id;	
		 }
	 });
}

</script>