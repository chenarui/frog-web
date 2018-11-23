<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的通讯录</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/my_address_book.css">

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
					<div class="left_list" id="send_address">
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
							<input type="text" placeholder="通讯录搜索/平台搜索" class="input_box1"
								id="search_btn" maxlength="20">
						</div>
					</div>

					<div class="person_infor_box">
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
											<div class="receiver_address">${c2.province_name}${c2.city_name}${c2.area_name}${c2.detail }</div>
										</div>
										<div class="list_right">
											<span class="editor" data-id="${c2.contact_address_id }"
												data-pro="${c2.province_id}" data-city="${c2.city_id }"
												data-area="${c2.area_id }" data-detail="${c2.detail }"
												data-name="${c2.name}" data-phone="${c2.phone }">送往此位置</span>

										</div>
									</div>
								</c:forEach>

							</div>

						</c:forEach>

					</div>

				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../bottom.jsp"></jsp:include>

	<!--新增-->
	<div class="add_address_pop" style="height: 380px">
		<div class="editor_title">新增</div>
		<input type="hidden" id="add_contact" /> <input type="text"
			placeholder="请输入姓名" class="addnew_input_box" id="add_name"> <input
			type="text" placeholder="请输入电话号码" class="addnew_input_box"
			style="margin-top: 10px" id="add_phone">
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
			value="" id="edit_name" class="addnew_input_box" readonly disabled>
		<input type="text" value="" id="edit_phone" class="addnew_input_box"
			style="margin-top: 10px" readonly disabled>
		<div class="select_box">
			<select class="provincebox" id="edit_pro" readonly disabled>
				<c:forEach items="${provinceList }" var="list">
					<option data-val="${list.cityList }" value="${list.province_id }">${list.name }</option>
				</c:forEach>
			</select> <select class="citybox" id="edit_city" readonly disabled>

			</select> <select style="margin-right: 0;" id="edit_area" readonly disabled>

			</select>
		</div>
		<input type="text" value="" class="addnew_input_box" id="edit_detail"
			readonly disabled>
		<div class="btn_box1">
			<div class="cancel_btn">取消</div>
			<div class="ensure_btn" id="edit_btn">确定</div>
		</div>


	</div>


</body>
</html>
<script src="../js/common.js"></script>
<script>
$(function(){
	$('.active').removeClass('active');
	$('#makeorder').addClass('active');	
});



/*编辑*/
$(".editor").click(function(){
	var params = eval('('+'${order}'+')');
	
	params.cancat_user_id = $(this).attr('data-id');
	params.cancat_name = $(this).attr('data-name');
	params.recive_phone = $(this).attr('data-phone');
	params.recive_province_id = $(this).attr('data-pro');
	params.recive_city_id =  $(this).attr('data-city');
	params.recive_area_id = $(this).attr('data-area');
	params.recive_detail = $(this).attr('data-detail');
	post('./order',params);
	
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



$(".mask").on("click",function(){
    $(".editor_pop").hide();
});

$(".person_infor_box").on('click','.arrow_box',function(){
   /*console.log(this);*/     
        $(this).children(".arrow_up").toggle();
        $(this).children(".arrow_down").toggle();
        $(this).parent(".list_name").next(".list_content_container").toggle();
  
});


	
	
	
	$('.search').click(function(){
		var user_id = 29;
		var search = $('#search_btn').val();
		if(search==''){
			alert('请输入搜索参数');
			return;
		}
		location.href ="./order_concact_book?id="+user_id+"&search="+search+"&param="+'${s_param}';
	});

</script>