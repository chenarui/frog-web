<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form class="form-horizontal" role="form">
		<div class="row">

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
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">司机姓名</label>
					<div class="col-sm-2" style="margin-top: 5px;">${driverName }
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">车辆信息</label>
					<div class="col-sm-2" style="margin-top: 5px;">${ car.brand_name },${ car.type_name },${ car.car_number }
					</div>
				</div>
			</div>
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
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: right;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">总价</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						${order.driver_money}</div>
				</div>
			</div>
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
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<table id="grid-table"></table>
				<div id="grid-pager"></div>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</form>
	<script type="text/javascript">
    //初始化
    $(document).ready(function () {
        var state = "${order.state}";
        var cp = "${order.is_complain}";
    	console.log(state);
               var rowDataNames = [];
                $('[data-rel=tooltip]').tooltip({container:'body'});
                initButton([{
                    name: "返回", //这里是静态页的地址
                    click: function(){
                    	if(state == 2){
                    		 loadHtml("./mytask/ongoing");
                    	}else if(state == 3){
                    		loadHtml("./mytask/completed");
                    	}else if(state == 1 && cp == 0){
                            loadHtml("./mytask/notBegin");
                        }else{
                            loadHtml("./mytask/dispute");
                        }
                    	
                       
                    }
                }
                ])
        });
 
</script>

</body>
</html>