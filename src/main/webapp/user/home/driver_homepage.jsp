<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>司机主页</title>
<link rel="stylesheet" href="../css/top.css">
<link rel="stylesheet" href="../css/top2.css">
<link rel="stylesheet" href="../css/driver_homepage.css">

<script src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=RxDwUYAiraIxcrWTODOgSTEqYvVO0Zvu"></script>
</head>
<body>
	<jsp:include page="../top2.jsp"></jsp:include>

	<div class="con_part1">
		<div class="content">
			<div class="part1_top">
				首页 > <span style="color: #1fb375;">司机详情</span>
			</div>

			<div class="left">
				<div class="dirver_infor">
					<img src="${driver.avatar_url }" class="avatar">
					<div class="person_box">
						<div class="driver_name">${driver.name }</div>
						<div class="driver_character">
							<c:forEach items="${taglist }" var="p" begin="0" end="2">
								<span>${p.tag }</span>
							</c:forEach>
						</div>
					</div>

					<div class="driver_level">
						<div class="score">${driver.eva_point }</div>
						<div class="star_box">
							<c:forEach begin="0" end="${driver.eva_point - 1 }">
								<img src="../img/star.png">
							</c:forEach>
						</div>
						<div>${count }</div>
						<div>交易量</div>
					</div>
				</div>
				<div class="infor_list_top">
					<div class="item_sort checked" id="all_car">全部车辆</div>
					<div class="item_sort" id="all_comment">全部评价</div>
				</div>
				<!--全部车辆-->
				<table cellspacing="0" id="car_list_box">
					<tr>
						<th>编号</th>
						<th>品牌</th>
						<th>车牌号</th>
						<th>车型</th>
						<th>车长（m）</th>
						<th style="border-right: 1px solid #eeeeee;">载重（t）</th>
					</tr>
					<c:forEach items="${carlist }" var="p">
						<tr>
							<td>${p.car_id }</td>
							<td class="car_sort">${p.brand_name }</td>
							<td>${p.car_number }</td>
							<td>${p.type_name }</td>
							<td>${p.car_length }</td>
							<td>${p.car_carry }吨</td>
						</tr>
					</c:forEach>
				</table>

				<!--全部评价-->
				<div id="comment_list_box">
					<c:forEach items="${evaluations }" var="p">
						<div class="comment_list">
							<div class="row1">
								<span>${p.name }</span>
								<div class="com_star_box">
									<c:forEach begin="0" end="${p.eva_point-1 }">
										<img src="../img/star.png">
									</c:forEach>
								</div>
								<span class="date_time"><fmt:formatDate type="date"
										value="${p.add_time}" /></span>
							</div>
							<div class="row2">${p.content }</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="right">
				<div class="map_box" id="allmap">
					<!--                     <img src="../img/map2.png"> -->
				</div>
				<div class="map_infor">
					<div class="map_address"></div>
					<div class="map_time"></div>
					<img src="../img/refresh.png" class="refresh">
				</div>
				<div class="car_btn">
					<img src="../img/logo_car.png" class="logo_car"> <span>派他运输</span>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../bottom.jsp"></jsp:include>

	<!--弹出层-->
	<div class="sort_pop">
		<div class="order_sort_option">请选择下单类型</div>
		<div class="order neworder">填写新订单</div>
		<div class="order chooseorder">选已有订单</div>
	</div>

</body>
<script src="../js/common.js"></script>
<script>
	var lon = '${location.longitude}';
	var lat = '${location.latitude}';
		
	// 百度地图API功能
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(lon, lat), 15);  // 初始化地图,设置中心点坐标和地图级别
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	
	var marker = new BMap.Marker(new BMap.Point(lon, lat)); // 创建点
	map.addOverlay(marker);
	
	//添加覆盖物
	function add_overlay(){
		map.addOverlay(marker);            //增加点
	}
	//清除覆盖物
	function remove_overlay(){
		map.clearOverlays();         
	}
	//获取地址
	function getlocation(){
		var url = 'http://api.map.baidu.com/geocoder/v2/?callback=renderReverse&location='+lat+','+lon+'&output=json&pois=1&ak=KbBLmAUkVRWycZQIhpdMhbzGBxtEIj3b';
		
		$.ajax({
			url: url,
			type: 'GET',
			data: {},
			dataType: 'JSONP',
			success: function(msg) {
				console.log(msg.result.formatted_address);
				$('.map_address').html(msg.result.formatted_address);
			}
		});
	}

	$(function(){
		$('.active').removeClass('active');
		$('#homepage').addClass('active');	
		
		getlocation();
		getTimeDiff('${location.string_time}');
	});
	
	$('.refresh').click(function(){
		var driver_id = '${driver.driver_id}';
		$.ajax({
			url: './getDriverLocation',
			data: {driver_id:driver_id},
			type: 'POST',
			success: function(data){
				lon = data.location.longitude;
				lat = data.location.latitude;
				
				getlocation();
				map.centerAndZoom(new BMap.Point(lon, lat), 15);
				marker = new BMap.Marker(new BMap.Point(lon, lat));
				remove_overlay();
				add_overlay();
				getTimeDiff(data.location.string_time);
			}
		});
	});
	
    $("#all_car").click(function(){
        $("#car_list_box").show();
        $("#comment_list_box").hide();
        /*$("#all_car").addClass("checked");
        $("#all_comment").removeClass("checked");*/
        $(".item_sort").removeClass("checked");
        $(this).addClass("checked");
    });
    $("#all_comment").click(function(){
        $("#comment_list_box").show();
        $("#car_list_box").hide();
       /* $("#all_comment").addClass("checked");
        $("#all_car").removeClass("checked");*/
        $(".item_sort").removeClass("checked");
        $(this).addClass("checked");
    });

    $('.mask').on("click",function(){
        $('.sort_pop').hide();
    });
    $('.car_btn').on("click",function(){
        $('.mask').show();
        $('.sort_pop').show();
        $(".bind_phone_num").hide();
    });
    
    $('.sort_pop').on('mouseover','.order',function(){
		$(this).addClass("o_checked");
    });
    $('.sort_pop').on('mouseout','.order',function(){
		$(this).removeClass("o_checked");
    });
    
    $('.neworder').click(function(){
    	window.location.href="../make_order/order?driver_id=" + '${driver.driver_id}';
    });
    $('.chooseorder').click(function(){
    	window.location.href="../waybill/existing_order?driver_id=" + '${driver.driver_id}';
    });
    
    function getTimeDiff(time){
    	var now = new Date();
    	var date = new Date(Date.parse(time));
    	var diff = now.getTime() - date.getTime();
    	var html = '';
    	if (diff > 24*3600*1000) { //一天以上
    		html = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getUTCDate();
    	} else if (diff < 3600 * 1000) { //一小时以内
    		if (diff < 60*1000) { //1分钟内
    			html = "一分钟内";
    		} else {
    			var minutes = Math.floor(diff/(60*1000));
    			html = minutes + "分钟前";
    		}
    	} else {
    		var hours = Math.floor(diff/(3600*1000));
    		html = hours + "小时前";
    	}
    	
    	html += "所在位置";
    	$('.map_time').html(html);
    }
</script>
</html>