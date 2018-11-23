<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>修改个人信息——我的首页</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/modify_infor.css">

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
				<div class="sort_person">修改个人信息（带 * 号为必填项）</div>
				<div class="item_list" id="user_pic">
					<div class="title" style="margin-top: 10px;">头像:</div>
					<c:if test="${not empty info.avatar_url }">
						<img src="${info.avatar_url }" class="avatar_pic user_pic"
							style="width: 112px; height: 112px">
					</c:if>
					<c:if test="${empty info.avatar_url }">
						<img src="../img/avatar_pic.png" class="avatar_pic user_pic"
							style="width: 112px; height: 112px">
					</c:if>
					<input type="hidden" id="avatar" name="avatar">
					<div class="uploading_btn">上传图片</div>
					<input type="file" class="fileInput file" id="file" name="file"
						style="display: none;" multiple>
				</div>
				<div class="item_list">
					<div class="title">
						<span class="mark">*</span>昵称:
					</div>
					<input type="text" placeholder="请输入用户昵称" id="user_name"
						class="nickname_input" value="${info.name }">
				</div>
				<div class="item_list">
					<div class="title">
						<span class="mark">*</span>性别:
					</div>
					<div
						<c:if test="${info.sex!='女' }"> class="sex_sort_box on" </c:if>
						<c:if test="${info.sex=='女' }"> class="sex_sort_box " </c:if>>
						<input type="radio"
							<c:if test="${info.sex=='男' }"> checked="checked" </c:if>
							name="sex" value="男" class="radioclass"> <span
							class="sex_sort">男</span>
					</div>
					<div <c:if test="${info.sex=='男' }"> class="sex_sort_box " </c:if>
						<c:if test="${info.sex=='女' }"> class="sex_sort_box on" </c:if>>
						<input type="radio"
							<c:if test="${info.sex=='女' }"> checked="checked" </c:if>
							name="sex" value="女" class="radioclass"> <span
							class="sex_sort">女</span>
					</div>
				</div>
				<div class="item_list">
					<div class="title">
						<span class="mark">*</span>电话:
					</div>
					<span class="phoneNum">${info.phone }</span>
				</div>
				<c:if test="${info.type==2 }">
					<div class="sort_company">企业认证信息</div>
					<div class="item_list">
						<div class="title">
							<span class="mark">*</span>企业名称:
						</div>
						<span class="company_name">杭州米妮贸易有限公司</span>
					</div>
					<div class="item_list">
						<div class="title" style="margin-top: 20px;">
							<span class="mark">*</span>企业图片:
						</div>
						<img src="../img/avatar_pic_company.png" class="avatar_pic">
					</div>
				</c:if>
				<div class="btn_box">
					<div class="cancel_btn">取消</div>
					<div class="ensure_btn">确定</div>
				</div>

			</div>
		</div>
	</div>


	<jsp:include page="../bottom.jsp"></jsp:include>


</body>
<script src="../js/common.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script>
$(function(){
	$('.active').removeClass('active');
	$('#personcenter').addClass('active');	
});

$(".sex_sort_box").on("click",function(){
    $(this).addClass("on").siblings().removeClass("on");
})
$('.ensure_btn').click(function(){
	var id = '${info.user_id}';
	var avatar = $('#avatar').val();
	var name = $('#user_name').val();
	var sex=$('input:radio[name="sex"]:checked').val();
	//var phone = $('.phoneNum').val();
// 	var cmp_name = $('.company_name').html();
// 	var cmp_pic = $('.cmp_pic').attr('img');
	
	$.ajax({
		 url:'./doModifyInfo',
		 data:{id:id,sex:sex,avatar:avatar,name:name,},
		 success:function(msg){
			if(msg.c==1){
				alert("操作成功");
				window.location.href = "../person_center/my_hone?id="+id;
			}else{
				alert("操作失败");
			}
			
		 }
	 });
});
$('.cancel_btn').click(function(){
	window.location.href = "../person_center/my_hone?id="+'${info.user_id}';
});


function imgupload(fileid){
	$.ajaxFileUpload({
		url : '../home/uploadFile',//用于文件上传的服务器端请求地址
		secureuri : false,          //一般设置为false
		fileElementId : fileid,     //文件上传空间的id属性  <input type="file" id="file" name="file" />
		dataType : 'json',          //返回值类型 一般设置为json
		data: {type: 2},
		success : function(msg) {
            var data = eval("("+msg.r+")");
            $('#avatar').val(data.fileid);
            $('.user_pic').attr("src",data.fileurl);
		},
		error: function (data, status, e)//服务器响应失败处理函数
        {
            alert(e);
            console.log(data);
        }
	});
	}
	$('.uploading_btn').click(function(){
		$('#file').click();
	});
	$('#file').change(function(){
		imgupload('file');
// 		$(this).remove();
// 		$('#user_pic').append('<input type="file" class="fileInput file"  id="file" name="file" style="display:none;" multiple>');
	});
</script>
</html>
