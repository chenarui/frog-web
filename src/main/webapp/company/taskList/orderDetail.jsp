<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
.col-sm-4 label {
	padding-top: 4px;
}
</style>
<body>
	<form class="form-horizontal" role="form">
		<div class="row">

			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">订单状态</label>
					<div class="col-sm-2" style="margin-top: 5px;">未开始</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">订单号</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.order_num }</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">出发时间</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<fmt:formatDate value="${order.send_time }"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">出发地</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.send_province_name }${order.send_city_name }${order.send_area_name}${order.send_address }
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">发货人</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.send_name }</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">发货人手机号</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.send_phone }</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">到达时间</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<fmt:formatDate value="${order.recive_time }"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">目的地</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.recive_province_name }${order.recive_city_name }${order.recive_area_name}${order.recive_address }
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">收货人</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.recive_name }</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">收货人手机号</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.recive_phone }</div>
				</div>
			</div>
			<c:if test="${order.car_id != null }">
				<div class="col-xs-12">
					<div class="form-group">
						<label Style="text-align: right;"
							class="col-sm-1 control-label no-padding-right"
							for="form-field-6">车辆信息</label>
						<div class="col-sm-2" style="margin-top: 5px;">${ car.brand_name },${ car.type_name },${ car.car_number }
						</div>
					</div>
				</div>
			</c:if>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">货物信息</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						长${order.cago_length }米,单重${order.cago_carry }吨,总重${order.carry }吨,数量${order.cago_num }件,类型${order.cago_name }
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">车辆类型</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.cartype_name }</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">特殊需求</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.carpool_model }</div>
				</div>
			</div>
			<!--             <div class="col-xs-12" > -->
			<!--             <div class="form-group"> -->
			<!--                 <label Style="text-align: right;" class="col-sm-1 control-label no-padding-right" for="form-field-6">意向金</label> -->
			<!--                 <div class="col-sm-2" style="margin-top: 5px;"> -->
			<%--                     ${order.money} --%>
			<!--                 </div> -->
			<!--             </div> -->
			<!--         </div> -->
			<!--           <div class="col-xs-12" > -->
			<!--             <div class="form-group"> -->
			<!--                 <label Style="text-align: right;" class="col-sm-1 control-label no-padding-right" for="form-field-6">加价比例</label> -->
			<!--                 <div class="col-sm-2" style="margin-top: 5px;"> -->
			<%--                 ${order.markup_ratio } --%>
			<!--                 </div> -->
			<!--             </div> -->
			<!--         </div> -->
			<!--             <div class="col-xs-12" > -->
			<!--             <div class="form-group"> -->
			<!--                 <label Style="text-align: right;" class="col-sm-1 control-label no-padding-right" for="form-field-6">总价</label> -->
			<!--                 <div class="col-sm-2" style="margin-top: 5px;"> -->
			<%--                     ${total} --%>
			<!--                 </div> -->
			<!--             </div> -->
			<!--         </div> -->
			<div class="col-xs-12">
				<c:if test="${order.remark != null && order.remark != '' }">
					<div class="form-group">
						<label Style="text-align: right;"
							class="col-sm-1 control-label no-padding-right"
							for="form-field-6">备注</label>
						<div class="col-sm-2" style="margin-top: 5px;">
							${order.remark }</div>
					</div>
				</c:if>
			</div>
			<c:if test="${picList != null && picList.size() >0}">
				<div class="col-xs-12">
					<div class="form-group">
						<label Style="text-align: right;"
							class="col-sm-1 control-label no-padding-right"
							for="form-field-6">图片</label>
						<c:forEach items="${picList }" var="p">
							<label class="col-sm-16"> <img alt="" src="${p }"
								style="height: 120px; width: 160px;">
							</label>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<div class="col-xs-12" style="margin-top: 5px;">
				<!-- PAGE CONTENT BEGINS -->
				<table id="grid-table"></table>
				<div id="grid-pager"></div>
			</div>
			<!-- /.col -->
		</div>
	</form>
</body>
<script type="text/javascript">
$(document).ready(function () {
    $('[data-rel=tooltip]').tooltip({container:'body'});
    initButton([{
	        name: "返回", //这里是静态页的地址
	        click: function(){
	        	loadHtml('./taskList');
	        }
		},
		{
	        name: "接单", //这里是静态页的地址
	        click: function(){
	        	 $.ajax({
	                 url:'./getCompanyState',
	                 data:{},
	                 success:function(msg){
	                    if(msg.c == 0){
	                        alert(msg.m);
	                            return;
	                    }
	                    loadHtml('./jiedan?orderid='+'${order.order_id}'+'&flag=1');
	                 }
	            });  
	        }
		}
		])
		
});
</script>
</html>