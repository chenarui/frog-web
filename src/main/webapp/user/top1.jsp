<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="header">
	<div class="top_part1">
		<div class="top_lr_box">
			<c:if test="${empty sessionScope.user_id }">
				<div class="top_left">
					<span class="welcome">欢迎光临星速运平台！</span> <a href="#" class="reg_log"
						id="login_a">登录</a> <span class="line_s" style="color: lightgray;">|</span>
					<a href="#" class="reg_log" id="reg_a">注册</a>
				</div>
			</c:if>
			<c:if test="${not empty sessionScope.user_id }">
				<div class="top_left">
					<span class="welcome">欢迎 <c:if
							test="${not empty sessionScope.user_name }">${sessionScope.user_name }</c:if>
						<c:if test="${empty sessionScope.user_name }">${sessionScope.user_phone }</c:if>！
					</span> <a href="#" class="reg_log" id="logout">退出</a>
				</div>
			</c:if>
			<div class="top_right">
				<a href="../home/app_download" class="top_list1">APP下载</a> <span
					class="line_s">|</span> <a href="../home/aboutus" class="top_list1">关于我们</a>
				<!--              	<span class="line_s">|</span> -->
				<!--              	<a href="javascript:void(0)" onclick="collection();" class="top_list1">加入收藏</a> -->
			</div>
		</div>
	</div>

	<div class="top_part2">
		<div class="top_lr_box">
			<div class="top_left">
				<img src="../img/top_logo.png" style="margin-top: 20px;">
			</div>
			<div class="top_right">
				<a href="../home/homepage" class="top_list2" id="homepage">首页</a> <a
					href="../make_order/order" class="top_list2" id="makeorder">在线下单</a>
				<a href="../waybill/in_progress" class="top_list2" id="myorder">我的运单</a>
				<a href="../person_center/my_hone" class="top_list2"
					id="personcenter">个人中心</a>
			</div>
		</div>
	</div>
</div>
