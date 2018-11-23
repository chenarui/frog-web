<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row">
		<div id="editMoneyDiv2">
			<input type="hidden" id="editHidden2" value="">
			<div class=" col-sm-12">
				<div class=" form-xs form-group row">
					<label for="addGrade" class="col-xs-3 control-label">审核未通过</label>
					<div class="col-xs-8">
						<input type="text " class="form-control " id="editRiderMoney2"
							value="">
					</div>
				</div>
			</div>
		</div>
		<div id="divCenter" align="center"
			style="position: absolute; z-index: 9; display: none; width: 50%; height: 50%; left: 25%; top: 30%;">
			<a href="javascript:void(0);" onclick="picClose();"><img src=""
				id="bigimg" style="height: 500px; width: 600px;" /></a>
		</div>
		<c:if test="${driver.avatar_url != null}">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">头像</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<a name='fff' href='javascript:void(0);'
							onclick="picBig('${driver.avatar_url}');"><img
							src=${driver.avatar_url } style="height: 100px; width: 100px;"></a>
					</div>
				</div>
			</div>
		</c:if>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">昵称</label>
				<div class="col-sm-2" style="margin-top: 5px;">${driver.name}
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">手机号</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.phone}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">类型</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.companyName}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">身份证号</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.id_card}</div>
			</div>
		</div>
		<c:if test="${driver.id_front_url != null}">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">身份证正面照</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<a name='fff' href='javascript:void(0);'
							onclick="picBig('${driver.id_front_url}');"><img
							src=${driver.id_front_url } style="height: 100px; width: 100px;"></a>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${driver.id_back_url != null}">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">身份证反面照</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<a name='fff' href='javascript:void(0);'
							onclick="picBig('${driver.id_back_url}');"><img
							src=${driver.id_back_url } style="height: 100px; width: 100px;"></a>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${driver.third_avatar_url != null}">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">第三方头像</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<a name='fff' href='javascript:void(0);'
							onclick="picBig('${driver.third_avatar_url}');"><img
							src=${driver.third_avatar_url
							} style="height: 100px; width: 100px;"></a>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${driver.driver_card_url != null}">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">驾驶证照片</label>
					<div class="col-sm-2" style="margin-top: 5px;">
						<a name='fff' href='javascript:void(0);'
							onclick="picBig('${driver.driver_card_url}');"><img
							src=${driver.driver_card_url
							} style="height: 100px; width: 100px;"></a>
					</div>
				</div>
			</div>
		</c:if>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">余额</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.driverExtra.balance}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">评分</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.driverExtra.eva_point}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">状态</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.stateStr}</div>
			</div>
		</div>
		<c:if test="${driver.state==0 }">
			<button class="btn btn-xs btn-primary"
				onclick="changestate(${driver.driver_id})" style="left: 61px;">审核通过</button>
			<button class="btn btn-xs btn-primary"
				onclick="changestate1(${driver.driver_id})" style="left: 80px;">审核未通过</button>
		</c:if>
		<form class="form-horizontal" role="form"></form>
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
	    $(document).ready(function () {
	        var rowDataNames = [];
	         $('[data-rel=tooltip]').tooltip({container:'body'});
	         initButton([{
	             name: "返回", //这里是静态页的地址
	             click: function(){
	                 loadHtml("./driver/driverList");
	             }
	         }
	         ])
	 });
	    function changestate(id){
			var state = 1;
			var reason = "";
			$.ajax({
	    		 url:'./driver/changestate',
	    		 data:{id:id,state:state,reason:reason},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./driver/driverList");
	    			}else{
	    				alert("操作失败");
	    			}
 					
	    		 }
	    	 });
		}
		function changestate1(id){
			$('#editHidden2').val(id);
			$("#editMoneyDiv2").dialog("open");
		}
		$("#editMoneyDiv2").dialog({
		    autoOpen : false,
		    height : 200,
		    width : 500,
		    modal : true,
		    title : '未通过原因',
		    buttons : {
		        "确定" : function() {
		        	var state = 2;
					var reason = $('#editRiderMoney2').val();
		        	var id =  $('#editHidden2').val();
		        	$.ajax({
			    		 url:'./driver/changestate',
			    		 data:{id:id,state:state,reason:reason},
			    		 success:function(msg){
			    			if(msg==1){
			    				alert("操作成功");
			 					$("#editMoneyDiv2").dialog("close");
			 					loadHtml("./driver/driverList");
			    			}else{
			    				alert("操作失败");
			    			}
		 					
			    		 }
			    	 })
			        } ,
		         "取消" : function() {
		        	$("#editMoneyDiv2").dialog("close");
		        }
		    },
		  
	 });
		function picBig(imgsrc) {
			$("#bigimg").attr('src',imgsrc);
            var v = document.getElementById('divCenter');
            v.style.display = "block";
        }

        function picClose() {
            var v = document.getElementById('divCenter');
            v.style.display = "none";
        }
    </script>
</body>
</html>