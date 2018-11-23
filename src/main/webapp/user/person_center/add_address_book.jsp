<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>添加——我的通讯录</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/my_address_book.css">
<link rel="stylesheet" href="../css/add_address_book.css">

<script src="../js/jquery-1.11.0.min.js"></script>
</head>
<body>
	<jsp:include page="../top2.jsp"></jsp:include>


	<div class="con_part1">
		<div class="content">
			<div class="left">
				<div class="list_container">
					<div class="left_list" id="firstpage">
						<img src="../img/per_logo1.png" class="per_logo"> 我的首页
					</div>
					<div class="left_list" id="my_send_address">
						<img src="../img/per_logo2.png" class="per_logo"> 我的发货地址
					</div>
					<div class="left_list checked" id="address_book">
						<img src="../img/per_logo3_g.png" class="per_logo logo_checked">
						我的通讯录
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
				<div class="message__box">
					<div class="list_title_box">
						<div class="input_container">
							<img src="../img/search.png" class="search" style="left: 280px">
							<input type="text" placeholder="直接搜索用户姓名或注册手机号"
								class="input_box1" id="search_btn" maxlength="20">
						</div>
					</div>

					<div class="address_book">通讯录</div>
					<c:forEach items="${contacts }" var="c1">
						<div class="list_name" data-id="${c1.contact_id }">
							<span class="title_list">${c1.name }</span> <span
								class="list_num_box">（<span class="list_num">${c1.count }</span>）
							</span>
							<div class="arrow_box">
								<img src="../img/arrow_up.png" class="arrow_up"> <img
									src="../img/arrow_down.png" class="arrow_down">
							</div>
						</div>
						<div class="list_content_container">
							<c:forEach items="${c1.userContactAddress }" var="c2">
								<div class="list_content">
									<div class="list_left">
										<div class="receiver_infor">
											<span class="receiver_name">${c2.name }</span> <span
												class="receiver_num">${c2.phone }</span>
										</div>
										<div class="receiver_address">${c2.detail }</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</c:forEach>
					<div class="search_name">
						<img src="../img/search2.png" class="search2"> <span>平台查找：</span>
						<span class="title_list">${key }</span>
					</div>

					<c:forEach items="${infos }" var="list">
						<div class="search_name_list">
							<span>${list.name }</span> <span class="add_book"
								data-id="${list.user_id }" data-name="${list.name }"
								data-phone="${list.phone }">添加到通讯录</span>
						</div>
					</c:forEach>


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
	$('#personcenter').addClass('active');	
});

$(document).on('click','.arrow_box',function(){
    /*console.log(this);*/    
     if($(this).prev(".list_num_box").children(".list_num").text() > 0){
        $(this).children(".arrow_up").toggle();
        $(this).children(".arrow_down").toggle();
        $(this).parent(".list_name").next(".list_content_container").toggle(); 
     }
 });
 
 $('.add_book').click(function(){
 	var user_id =29;
 	var friend_id = $(this).attr('data-id');
 	var name = $(this).attr('data-name');
 	var phone = $(this).attr('data-phone');
 	
 	$.ajax({
			url:'./addUserConcat',
			data:{user_id:user_id,friend_id:friend_id,name:name,phone:phone},
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
 
 $('.search').click(function(){
		var user_id = 29;
		var search = $('#search_btn').val();
		if(search==''){
			alert('请输入搜索参数');
			return;
		}
		location.href ="add_address_book?id="+user_id+"&search="+search;
	});
    

</script>