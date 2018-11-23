<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的发货地址</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/my_address.css">

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
					<div class="left_list checked" id="send_address">
						<img src="../img/per_logo2_g.png" class="per_logo logo_checked">
						我的发货地址
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
				<div class="message__box">

					<c:forEach items="${address }" var="list">

						<div class="list_content">
							<div class="list_left">
								<div class="receiver_infor">
									<span class="receiver_name">${list.name }</span> <span
										class="receiver_num">${list.phone }</span>
								</div>
								<div class="receiver_address">${list.province_name}${list.city_name}${list.area_name}${list.detail }</div>
							</div>
							<div class="list_right">
								<span class="editor" data-id="${list.address_id }"
									data-pro="${list.province_id}" data-city="${list.city_id }"
									data-area="${list.area_id }" data-detail="${list.detail }"
									data-name="${list.name}" data-phone="${list.phone }">使用此地址</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../bottom.jsp"></jsp:include>

	<!--新增-->
	<div class="add_address_pop" style="height: 380px">
		<div class="editor_title">新增</div>
		<input type="text" placeholder="请输入姓名" class="addnew_input_box"
			id="add_name"> <input type="text" placeholder="请输入电话号码"
			class="addnew_input_box" style="margin-top: 10px" id="add_phone">
		<div class="select_box">
			<select class="provincebox" id="add_pro">
				<option value="" style="display: none;">请选择</option>
				<c:forEach items="${provinceList }" var="list">
					<option data-val="${list.cityList }" value="${list.province_id }">${list.name }</option>
				</c:forEach>
			</select> <select class="citybox" id="add_city">
				<option value="" style="display: none;">请选择</option>

			</select> <select style="margin-right: 0;" class="areabox" id="add_area">
				<option value="" style="display: none;">请选择</option>

			</select>
		</div>
		<input type="text" placeholder="请输入具体地址" class="addnew_input_box"
			id="add_detail">
		<div class="btn_box1">
			<div class="cancel_btn">取消</div>
			<div class="ensure_btn" id="add_btn">确定</div>
		</div>

	</div>
	<!--编辑-->
	<div class="editor_pop" style="height: 380px">
		<div class="editor_title">编辑</div>
		<input type="hidden" name="id" id="edit_id" /> <input type="text"
			value="" id="edit_name" class="addnew_input_box"> <input
			type="text" value="" id="edit_phone" class="addnew_input_box"
			style="margin-top: 10px">
		<div class="select_box">
			<select class="provincebox" id="edit_pro">
				<c:forEach items="${provinceList }" var="list">
					<option data-val="${list.cityList }" value="${list.province_id }">${list.name }</option>
				</c:forEach>
			</select> <select class="citybox" id="edit_city">

			</select> <select style="margin-right: 0;" id="edit_area">

			</select>
		</div>
		<input type="text" value="" class="addnew_input_box" id="edit_detail">
		<div class="btn_box1">
			<div class="cancel_btn">取消</div>
			<div class="ensure_btn" id="edit_btn">确定</div>
		</div>

	</div>

	<script src="../js/common.js"></script>
	<script>
/*登录注册*/
$("#login_a").click(function(){
    $(".editor_pop").hide();
    $(".add_address_pop").hide();
});
$("#reg_a").click(function(){
    $(".editor_pop").hide();
    $(".add_address_pop").hide();
});
$(".mask").on("click",function(){
    $(".editor_pop").hide();
    $(".add_address_pop").hide();
});
$(".forget_pwd").click(function(){
    $(".editor_pop").hide();
    $(".add_address_pop").hide();
});
$("#reg_btn").click(function(){
    $(".editor_pop").hide();
    $(".add_address_pop").hide();
});

$(function(){
	$('.active').removeClass('active');
	$('#makeorder').addClass('active');	
});

function post(url,params){
	var form = document.createElement("form");
	form.action = url;
	form.method = "post";
	form.style.display = "none";
	for(var x in params){
		 var opt = document.createElement("input");
	    opt.name = x;
	    opt.value = params[x];	  
	    form.appendChild(opt);
	}
	document.body.appendChild(form);
	form.submit();
	return form;
}

/*编辑*/
$(".editor").click(function(){
	var params = eval('('+'${order}'+')');
		
	params.send_province_id = $(this).attr('data-pro');
	params.send_city_id = $(this).attr('data-city');
	params.send_area_id = $(this).attr('data-area');
	params.send_detail = $(this).attr('data-detail');
	params.send_phone = $(this).attr('data-phone');
	params.address_name = $(this).attr('data-name');
	post('./order',params);
});

</script>

</body>
</html>