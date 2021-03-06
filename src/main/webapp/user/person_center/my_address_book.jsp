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
<link rel="stylesheet" href="../css/my_address.css">
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
											<div class="receiver_address">${c2.detail }</div>
										</div>
										<div class="list_right">
											<span class="editor" data-id="${c2.contact_address_id }"
												data-pro="${c2.province_id}" data-city="${c2.city_id }"
												data-area="${c2.area_id }" data-detail="${c2.detail }"
												data-name="${c2.name}" data-phone="${c2.phone }">编辑</span> <span
												class="main_line">|</span> <span class="delete"
												data-id="${c2.contact_address_id }">删除</span>
										</div>
									</div>
								</c:forEach>


								<div class="add_address_btn" data-name="${c1.name }"
									data-phone="${c1.phone }" data-id="${c1.contact_id }">+
									新增地址</div>
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
			<select class="provincebox" id="add_pro" style="margin-right: 7px;">
				<option value="" style="display: none;">请选择</option>
				<c:forEach items="${provinceList }" var="list">
					<option data-val="${list.cityList }" value="${list.province_id }">${list.name }</option>
				</c:forEach>
			</select> <select class="citybox" id="add_city" style="margin-right: 7px;">
				<option value="" style="display: none;">请选择</option>

			</select> <select style="margin-right: 0;" class="areabox" id="add_area"
				style="margin-right: 7px;">
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
			<select class="provincebox" id="edit_pro" style="margin-right: 7px;">
				<c:forEach items="${provinceList }" var="list">
					<option data-val="${list.cityList }" value="${list.province_id }">${list.name }</option>
				</c:forEach>
			</select> <select class="citybox" id="edit_city" style="margin-right: 7px;">

			</select> <select style="margin-right: 0;" id="edit_area"
				style="margin-right: 7px;">

			</select>
		</div>
		<input type="text" value="" class="addnew_input_box" id="edit_detail">
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
	$('#personcenter').addClass('active');	
});
/*新增*/
$(".add_address_btn").click(function(){
	var contact_id = $(this).attr('data-id');
	var name = $(this).attr('data-name');
	var phone = $(this).attr('data-phone');
	changeAdd(contact_id,name,phone);
    $('.mask').show();
    $(".add_address_pop").show();
    $(".editor_pop").hide();
    $(".login").hide();
    $(".regist").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
    $(".bind_phone_num").hide();

});

/*编辑*/
$(".editor").click(function(){
	var id = $(this).attr('data-id');
	var phone = $(this).attr('data-phone');
	var name = $(this).attr('data-name');
	var pro_id = $(this).attr('data-pro');
	var city_id = $(this).attr('data-city');
	var area_id = $(this).attr('data-area');
	var detail = $(this).attr('data-detail');
	changeEdit(id,name,phone,pro_id,city_id,area_id,detail);
    $('.mask').show();
    $(".editor_pop").show();
    $(".add_address_pop").hide();
    $(".login").hide();
    $(".regist").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
});

$('.cancel_btn').click(function(){
	 	$('.mask').hide();
    $(".add_address_pop").hide();
    $(".editor_pop").hide();
    $(".login").hide();
    $(".regist").hide();
    $(".modify_pwd").hide();
    $(".reg_success").hide();
});

$(".mask").on("click",function(){
    $(".editor_pop").hide();
});

$(".person_infor_box").on('click','.arrow_box',function(){
   /*console.log(this);*/     
        $(this).children(".arrow_up").toggle();
        $(this).children(".arrow_down").toggle();
        $(this).parent(".list_name").next(".list_content_container").toggle();
  
});

function changeAdd(contact_id,name,phone){
   $('#add_contact').val(contact_id);
   $('#add_name').val(name);
   $('#add_phone').val(phone);
}


$('.provincebox').change(function(){
   	$(this).siblings().html('<option value=""  style="display:none;">请选择</option>');
   	var province_id = $(this).val();
   var type = $(this).attr('id');
   	$.ajax({
    		 url:'./cityList',
    		 data:{province_id:province_id},
    		 success:function(msg){
    			if(msg.c==1){
    				var data =eval('('+msg.r+')');
    				data = data.cityList;
    				console.log(data); 
    				var html='<option value=""  >请选择</option>';
    				for(var i = 0;i<data.length;i++){
    					var opt = '<option value="'+data[i].city_id+'"  >'+data[i].name+'</option>';
    					html+=opt;
    				}
    				
    				if(type=='add_pro'){
    					$('#add_city').html(html);
    				}else{
    					$('#edit_city').html(html);
    				}
    				
    			}else{
    				
    			}
    				
    		 }
  		});
   });
	$('.citybox').change(function(){
		var city_id = $(this).val();
		var type = $(this).attr('id');
		$.ajax({
   		 url:'./areaList',
   		 data:{city_id:city_id},
   		 success:function(msg){
   			if(msg.c==1){
   				var data = eval('('+msg.r+')');
   				data = data.areaList;
   				var html='<option value="" >请选择</option>';
   				for(var i = 0;i<data.length;i++){
   					var opt = '<option value="'+data[i].area_id+'"  >'+data[i].name+'</option>';
   					html+=opt;
   				}
   				console.log(html);
   				if(type=='add_city'){
   					$('#add_area').html(html);
   				}else{
   					$('#edit_area').html(html);
   				}
   				
   			}else{
   				
   			}
				
   		 }
 		});
   });
	

	function changeEdit(id,name,phone,pro_id,city_id,area_id,detail){
		$('#edit_id').val(id);
		$('#edit_name').val(name);
		$('#edit_detail').val(detail);
		$('#edit_phone').val(phone);
		$.ajax({
	   		 url:'./provinceList',
	   		 data:{},
	   		 success:function(msg){
	   			if(msg.c==1){
	   				var data = eval('('+msg.r+')');
	   				data = data.provinceList;
	   				var html='<option value=""  >请选择</option>';
	   				for(var i = 0;i<data.length;i++){
	   					if(data[i].province_id==pro_id){
	   						var opt = '<option selected value="'+data[i].province_id+'"  >'+data[i].name+'</option>';
		   					html+=opt;
	   					}else{
	   						var opt = '<option value="'+data[i].province_id+'"  >'+data[i].name+'</option>';
		   					html+=opt;
	   					}	
	   				}
	   				$('#edit_pro').html(html);
	   			}else{
	   				
	   			}
					
	   		 }
	 		});
		$.ajax({
	   		 url:'./cityList',
	   		 data:{province_id:pro_id},
	   		 success:function(msg){
	   			if(msg.c==1){
	   				var data = eval('('+msg.r+')');
	   				data = data.cityList;
	   				var html='<option value=""  style="display:none;">请选择</option>';
	   				for(var i = 0;i<data.length;i++){
	   					if(data[i].city_id==city_id){
	   						var opt = '<option selected value="'+data[i].city_id+'"  >'+data[i].name+'</option>';
		   					html+=opt;
	   					}else{
	   						var opt = '<option value="'+data[i].city_id+'"  >'+data[i].name+'</option>';
		   					html+=opt;
	   					}	
	   					
	   				}
	   				$('#edit_city').html(html);
	   			}else{
	   				
	   			}
					
	   		 }
	 		});
		$.ajax({
	   		 url:'./areaList',
	   		 data:{city_id:city_id},
	   		 success:function(msg){
	   			if(msg.c==1){
	   				var data = eval('('+msg.r+')');
	   				data = data.areaList;
	   				var html='<option value=""  style="display:none;">请选择</option>';
	   				for(var i = 0;i<data.length;i++){
	   					if(data[i].area_id==area_id){
	   						var opt = '<option selected value="'+data[i].area_id+'"  >'+data[i].name+'</option>';
		   					html+=opt;
	   					}else{
	   						var opt = '<option value="'+data[i].area_id+'"  >'+data[i].name+'</option>';
		   					html+=opt;
	   					}		 	
	   				}
	   				$('#edit_area').html(html);
	   			}else{
	   				
	   			}
					
	   		 }
	 		});
	}
	
	$('#edit_btn').click(function(){
		var user_id = 29;
		var id = $('#edit_id').val();
		var name = $('#edit_name').val();
		var phone = $('#edit_phone').val();
		var pro_id = $('#edit_pro').val();
		var city_id = $('#edit_city').val();
		var area_id = $('#edit_area').val();
		var detail = $('#edit_detail').val();
		if(name==''){
			alert('请输入姓名!');
			return;
		}
		if(phone==''){
			alert('请输入电话号码');
			return;
		}
		if(pro_id==''){
			alert('请选择省份');
			return;
		}
		if(city_id==''){
			alert('请选择城市');
			return;
		}
		if(area_id==''){
			alert('请选择地址');
			return;
		}
		if(detail==''){
			alert('请输入详细地址');
			return;
		}
		$.ajax({
			url:'./modifyUserConcatAddress',
			data:{id:id,user_id:user_id,name:name,phone:phone,pro_id:pro_id,city_id:city_id,area_id:area_id,detail:detail},
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
	$('#add_btn').click(function(){
		
		var concat_id = $('#add_contact').val();
		var name = $('#add_name').val();
		var phone = $('#add_phone').val();
		var pro_id = $('#add_pro').val();
		var city_id = $('#add_city').val();
		var area_id = $('#add_area').val();
		var detail = $('#add_detail').val();
		if(name==''){
			alert('请输入姓名!');
			return;
		}
		if(phone==''){
			alert('请输入电话号码');
			return;
		}
		if(pro_id==''){
			alert('请选择省份');
			return;
		}
		if(city_id==''){
			alert('请选择城市');
			return;
		}
		if(area_id==''){
			alert('请选择地址');
			return;
		}
		if(detail==''){
			aletr('请输入详细地址');
			return;
		}
		$.ajax({
			url:'./addUserConcatAddress',
			data:{concat_id:concat_id,name:name,phone:phone,pro_id:pro_id,city_id:city_id,area_id:area_id,detail:detail},
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
	$('.delete').click(function(){
		var flag = confirm('是否删除?');
		if(!flag){
			return;
		}
		var id = $(this).attr('data-id');
		$.ajax({
			url:'./deleteUserConcatAddress',
			data:{id:id},
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