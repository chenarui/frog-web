<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的评价</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/my_comment.css">
<style type="text/css">
.row2 {
	width: 600px
}
</style>
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
					<div class="left_list" id="my_bill">
						<img src="../img/per_logo4.png" class="per_logo"> 我的账单
					</div>
					<div class="left_list checked" id="my_comment">
						<img src="../img/per_logo5_g.png" class="per_logo logo_checked">
						我的评价
					</div>

				</div>
			</div>

			<div class="right">
				<div class="message__box">
					<div class="list_title_box">
						<div class="list_title ltitle_checked" id="comment1">我的评价</div>
						<div class="list_title" id="comment2">评价我的</div>
					</div>

					<div class="comment_list1">
						<c:forEach items="${myComments }" var="list">


							<div class="list_content">
								<div class="list_left">
									<img src="${list.avatar_url }" class="comment_avatar">
									<div class="person_infor">
										<div class="row1">
											<span class="person_name">${list.name }</span>
											<div class="star_box">
												<c:forEach var="s" begin="1" end="${list.point }">
													<img src="../img/star.png">
												</c:forEach>
											</div>
											<span class="date"><fmt:formatDate
													value="${list.add_time }" type="date" pattern="yyyy-MM-dd" /></span>
										</div>
										<div class="row2">${list.content }</div>
										<div class="row3">
											<img src="../img/label.png" class="label"> ${list.tag }
										</div>
									</div>
								</div>
								<div class="list_right" data-id="${list.order_id }">
									<span class="order_num">订单号： ${list.order_num }</span> <img
										src="../img/right_arrow.png" class="right_arrow">
								</div>
							</div>

						</c:forEach>
						<c:if test="${empty more1 }">
							<div class="watch_more more1">
								查看更多 <img src="../img/more.png" class="more">
							</div>
						</c:if>
					</div>

					<div class="comment_list2">

						<c:forEach items="${tomeComments }" var="list">


							<div class="list_content">
								<div class="list_left">
									<img src="${list.avatar_url }" class="comment_avatar">
									<div class="person_infor">
										<div class="row1">
											<span class="person_name">${list.name }</span>
											<div class="star_box">
												<c:forEach var="s" begin="1" end="${list.point }">
													<img src="../img/star.png">
												</c:forEach>
											</div>
											<span class="date"><fmt:formatDate
													value="${list.add_time }" type="date" pattern="yyyy-MM-dd" /></span>
										</div>
										<div class="row2">${list.content }</div>
										<div class="row3">
											<img src="../img/label.png" class="label"> ${list.tag }
										</div>
									</div>
								</div>
								<div class="list_right" data-id="${list.order_id }">
									<span class="order_num">订单号： ${list.order_num }</span> <img
										src="../img/right_arrow.png" class="right_arrow">
								</div>
							</div>

						</c:forEach>
						<c:if test="${empty more2 }">
							<div class="watch_more">
								查看更多 <img src="../img/more.png" class="more">
							</div>
						</c:if>
					</div>


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
	
	var endIndex1 = 4; 
	var endIndex2 = 4;
	$("#comment1").click(function(){
    	$('.comment_list1').css('height',140*endIndex1);//改变高度
		$('.message__box').css('height',140*endIndex1+160);
		$('.footer').css('top',(endIndex1-4)/4*550+20);
        $(".comment_list1").show();
        $(".comment_list2").hide();
        /*$("#comment2").removeClass("ltitle_checked");*/
        $(".list_title").removeClass("ltitle_checked");
        $(this).addClass("ltitle_checked");
    });
    $("#comment2").click(function(){
    	$('.comment_list2').css('height',140*endIndex2);//改变高度
		$('.message__box').css('height',140*endIndex2+160);
		$('.footer').css('top',(endIndex2-4)/4*550+20);
        $(".comment_list2").show();
        $(".comment_list1").hide();
        /*$("#comment1").removeClass("ltitle_checked");*/
        $(".list_title").removeClass("ltitle_checked");
        $(this).addClass("ltitle_checked");
    });

    $(document).on('click','.watch_more',function(){
    	var mr = $(this);
    	$(this).remove();
    	console.log(mr);
    	if($(this).hasClass('more1')){  		
    		moreMyComments(mr);
    	}else{
    		moreToMeComments(mr);
    	}
    });
//     $('.watch_more').click(function(){
    	
//     });
    
    
   
    
    function moreMyComments(e){
    	var id = 29;
    	$.ajax({
      		 url:'./getmoreMyComments',
      		 data:{id:id,start:endIndex1},
      		 success:function(msg){
      			if(msg.c==1){
      				var data = eval('('+msg.r+')');
      				console.log(data);
      				var size = data.length;
      				endIndex1 +=size;
      				$('.comment_list1').css('height',140*endIndex1);//改变高度
      				$('.message__box').css('height',140*endIndex1+160);
      				$('.footer').css('top',(endIndex1-4)/4*550+40);
      				$('.footer').css('position','relative');
      				for(var i = 0;i<size;i++){
      					var html =  '<div class="list_content">';
        				   html+=' <div class="list_left">';
        					html=html+' <img src="'+data[i].avatar_url +'" class="comment_avatar">';
        					html+='<div class="person_infor">';
        					html+='<div class="row1">';
        					html=html+'<span class="person_name">'+data[i].name +'</span>';
        					html+='<div class="star_box">';
        					for(var j=0;j<data[i].point;j++){
        						html+='<img src="../img/star.png">';
        					}     					     				     					                   
        					html+='</div>  ' ;                            
        					html=html+'<span class="date">'+data[i].fmt_add_date+'</span>';
        					html+='</div>';
        					html+='<div class="row2">'+data[i].content +'</div>';
        					html+='<div class="row3">';
        					html+='<img src="../img/label.png" class="label">';
        					html+=data[i].tag ;
        					html+='</div>';
        					html+='</div>';
        					html+=' </div>';
        					html+=' <div class="list_right" data-id="'+data[i].order_id+'">';
        					html=html+'<span class="order_num">订单号：'+ data[i].order_num +'</span>';
        					html+='<img src="../img/right_arrow.png" class="right_arrow" >';
        					html+=' </div>';
        					html+='</div>';
      			    		$('.comment_list1').append(html);
      				}
      				if(msg.m!='no more'){
      					$('.comment_list1').append(e);
      				}
      			}else{
      				alert("操作失败");
      			}
   				
      		 }
      	 });
    }
    
    function moreToMeComments(e){
    	$.ajax({
      		 url:'./person_center/getmoreToMeComments',
      		 data:{id:id,start:endIndex2},
      		 success:function(msg){
      			if(msg.c==1){
      				var data = eval('('+msg.r+')');
      				console.log(data);
      				var size = data.length;
      				endIndex1 +=size;
      				$('.comment_list2').css('height',140*endIndex1);//改变高度
      				$('.message__box').css('height',140*endIndex1+160);
      				$('.footer').css('top',(endIndex1-4)/4*550+40);
      				$('.footer').css('position','relative');
      				for(var i = 0;i<size;i++){
      					var html =  '<div class="list_content">';
        				   html+=' <div class="list_left">';
        					html=html+' <img src="'+data[i].avatar_url +'" class="comment_avatar">';
        					html+='<div class="person_infor">';
        					html+='<div class="row1">';
        					html=html+'<span class="person_name">'+data[i].name +'</span>';
        					html+='<div class="star_box">';
        					for(var j=0;j<data[i].point;j++){
        						html+='<img src="../img/star.png">';
        					}     					     				     					                   
        					html+='</div>  ' ;                            
        					html=html+'<span class="date">'+data[i].add_time+'</span>';
        					html+='</div>';
        					html+='<div class="row2">'+data[i].content +'</div>';
        					html+='<div class="row3">';
        					html+='<img src="../img/label.png" class="label">';
        					html+=data[i].tag ;
        					html+='</div>';
        					html+='</div>';
        					html+=' </div>';
        					html+=' <div class="list_right" data-id="'+data[i].order_id+'">';
        					html=html+'<span class="order_num">订单号：'+ data[i].order_num +'</span>';
        					html+='<img src="../img/right_arrow.png" class="right_arrow">';
        					html+=' </div>';
        					html+='</div>';
      			    		$('.comment_list1').append(html);
      				}
      				if(msg.m!='no more'){
      					$('.comment_list1').append(e);
      				}
      			}else{
      				alert("操作失败");
      			}
   				
      		 }
      	 });
    }
    
    $(document).onclick('click','.list_right',function(){
    	location.href="../waybill/wait_comment?order_id="+$(this).attr('data-id');
    });
</script>