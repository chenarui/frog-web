<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>APP下载</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/app_download.css">

<script src="../js/jquery-1.11.0.min.js"></script>
</head>
<body>

	<jsp:include page="../top1.jsp"></jsp:include>

	<div class="con_part1">
		<div class="left_right_box">
			<div class="con_left">
				<div>APP名称</div>
				<div style="margin: 15px 0">专业物流运输平台</div>
				<div>
					<div class="qrcode_box">
						<div class="qr_text">司机端APP</div>
						<div class="qrcode_img_box">
							<img src="" class="qrcode_img">
						</div>
					</div>
					<div class="qrcode_box" style="margin-left: 30px;">
						<div class="qr_text">用户端APP</div>
						<div class="qrcode_img_box">
							<img src="" class="qrcode_img">
						</div>
					</div>
				</div>
			</div>
			<div class="con_right">
				<img src="../img/top_img.png">
			</div>
		</div>
	</div>


	<div class="content">
		<div class="con_part2">
			<div class="logo_box">
				<div class="logo_img_box">
					<img src="../img/logo1.png" class="logo_img">
				</div>
				<div class="logo_title">在线下单，方便快捷</div>
				<div class="logo_intro">下单只需3步骤，平均约15分钟司机接单</div>
			</div>
			<div class="logo_box">
				<div class="logo_img_box">
					<img src="../img/logo2.png" class="logo_img">
				</div>
				<div class="logo_title">智能认证，安全可靠</div>
				<div class="logo_intro">严格的认证体系，为您提供安全可靠的信息服务</div>
			</div>
			<div class="logo_box">
				<div class="logo_img_box">
					<img src="../img/logo3.png" class="logo_img">
				</div>
				<div class="logo_title">在线下单，方便快捷</div>
				<div class="logo_intro">5分钟快速下单，10分钟司机接单</div>
			</div>
		</div>

		<div class="con_part3">
			<img src="../img/home_pic1.png">
		</div>

	</div>

	<jsp:include page="../bottom.jsp"></jsp:include>

</body>
<script src="../js/common.js"></script>
<script>
$(function(){
	$('.active').removeClass('active');
	$('#homepage').addClass('active');	
});
</script>
</html>