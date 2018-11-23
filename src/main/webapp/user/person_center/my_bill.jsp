<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的账单</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/my_bill.css">

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
					<div class="left_list" id="address_book">
						<img src="../img/per_logo3.png" class="per_logo"> 我的通讯录
					</div>
					<div class="left_list checked" id="my_bill">
						<img src="../img/per_logo4_g.png" class="per_logo logo_checked">
						我的账单
					</div>
					<div class="left_list" id="my_comment">
						<img src="../img/per_logo5.png" class="per_logo"> 我的评价
					</div>

				</div>
			</div>

			<div class="right">
				<div class="message__box">
					<div class="total_debt">
						<span>总欠款金额(元)</span> <span class="debt_price">${extra.balance }</span>
					</div>
					<c:forEach items="${cashs }" var="list">
						<div class="order_list">
							<div class="row1">
								<span>${list.subject }</span> <span class="price1">${list.price }</span>
							</div>
							<div class="row2">

								<span class="date"><fmt:formatDate
										value="${list.add_time }" type="date" pattern="yyyy-MM-dd" />
									<span class="time"><fmt:formatDate
											value="${list.add_time }" type="date" pattern="hh-mm" /></span></span> <span
									class="price2">${list.a_balance }</span>
							</div>
						</div>
					</c:forEach>
					<c:if test="${have_no_more!='no more' }">
						<div class="watch_more">
							查看更多 <img src="../img/more.png" class="more">
						</div>
					</c:if>


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

var endIndex = 6; 	
$(document).on('click','.watch_more',function(){
	var mr = $(this);
	$(this).remove();
	$.ajax({
 		 url:'./getmoreBill',
 		 data:{start:endIndex},
 		 success:function(msg){
 			if(msg.c==1){
 				var data = eval('('+msg.r+')');
 				console.log(data);
 				var size = data.length;
 				endIndex +=size; 				
 				$('.message__box').css('height',100*endIndex+260);//改变高度
 				$('.footer').css('top',(endIndex-12)/6*550+40);
 				$('.footer').css('position','relative');
 				for(var i = 0;i<size;i++){
 					var html = ' <div class="order_list">';
 					html+=' <div class="row1">';
 					html+=' <span>'+data[i].subject +'</span>';
 					html+=' <span class="price1">'+data[i].price +'</span>';
 					html+=' </div>';
 					html+=' <div class="row2">';    			    	
 					html+='  <span class="date">'+data[i].fmt_add_date +'<span class="time">'+data[i].fmt_add_time+'</span></span>';
 					html+=' <span class="price2">'+data[i].a_balance +'</span>';
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

</script>