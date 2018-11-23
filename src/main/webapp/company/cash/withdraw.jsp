<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form class="form-horizontal" role="form">
		<div class="row">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center; font-size: 15px;"
						class="col-sm-1 control-label no-padding-right" for="form-field-3">提现金额</label>
					<div class="col-sm-4">
						<input id="ratio" value="${ratio}" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey required" maxlength="12"
							style="width: 218px; text-align: center;" placeholder="请输入"
							name="ratio" title="请输入" data-placement="bottom"
							onkeyup="this.value=this.value.replace(/[^0-9-^.]+/,'');" />
					</div>
				</div>
			</div>

			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center; font-size: 15px;"
						class="col-sm-1 control-label no-padding-right" for="form-field-3">提现方式</label>
					<div class="col-sm-2">
						<select class="col-sm-10 control-label no-padding-right"
							id="gettype" onchange="changeSelect()">
							<option value="">请选择</option>
							<option value="1">支付宝</option>
							<option value="2">银行卡</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-xs-12" id="bankDiv" style="display: none">
				<div class="form-group">
					<label Style="text-align: center; font-size: 15px;"
						class="col-sm-1 control-label no-padding-right" for="form-field-3">银行选择</label>
					<div class="col-sm-2">
						<select class="col-sm-10 control-label no-padding-right"
							id="bankSelect">
							<option value=""></option>
							<c:forEach items="${listConfig }" var="c">
								<option value="${c.value }">${c.value }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center; font-size: 15px;"
						class="col-sm-1 control-label no-padding-right" for="form-field-3">支付宝或银行卡号</label>
					<div class="col-sm-2">
						<input id="number" value="" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey required" maxlength="24"
							style="width: 218px; text-align: center;" placeholder="请输入"
							name="ratio" title="请输入" data-placement="bottom" />
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center; font-size: 15px;"
						class="col-sm-1 control-label no-padding-right" for="form-field-3">账户余额</label>
					<div class="col-sm-1" style="margin-top: 6px;">${balance}元</div>
				</div>
			</div>
			<div class="col-xs-3"
				style="clear: both; float: initial; margin-top: 70px;">
				<div class="form-group">
					<button class="btn btn-info" type="button"
						style="margin-left: 30%;" onclick="submitaction()">申请提现</button>
					<button class="btn" type="button"
						style="margin-left: 70%; margin-top: -42px;" onclick="goback()">
						<i class="icon-undo bigger-110"></i> 取消
					</button>
				</div>
			</div>
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
    function submitaction(){
        //class上加上required,checkReuqired会自动校验参数，提示title不能为空
        var price = $('#ratio').val();
        var balance =  '${balance}';
        var  price2 = eval(price);
        var  balance2 = eval(balance);
        var gettype = $('#gettype').val();
        if(!gettype){
        	alert("请选择提现方式");
        	return;
        }
        var bankSelect = $('#bankSelect').val();
        if(gettype == 2 && !bankSelect){
        	alert("请选择提现的银行");
        	return;
        }
        var number = $('#number').val();
        if(!number){
        	alert("请输入支付宝或者银行卡号");
        	return;
        }
        if(gettype == 2 && bankSelect && number.length < 16 ){
        	alert("银行卡号位数不正确");
        	return;
        }
        if(gettype == 2 && bankSelect && number.length>19){
            alert("银行卡号位数不正确");
            return;
        }
        if(!price || price2 <= 0){
        	alert("请输入提现金额");
        }else if(price2 > balance2){
        	alert("提现金额不能大于余额");
        } else{
        	if(confirm("确定要提现?")){
        		 $.ajax({
                     url : './cash/addWithdraw',
                     type : "post",
                      data:{price:price,type:gettype,bank:bankSelect,number:number},
                     dataType:'json',
                     success : function(msg) {
                         var msg = eval('('+msg+')');
                         console.log(msg);
                         if (msg.code == 0) {
                             alert("操作失败");
                             return;
                         } else {
                             alert("申请成功");
                             loadHtml("./cash/cashList");
                         }
                     }
                 })
        	}else{
        		return;
        	}
        }
       
    }
    
    function goback(){
    	 loadHtml("./cash/cashList");
    }
    
    function changeSelect(){
		var gettype = $('#gettype').val(); 
		if(!gettype){
			$('#bankDiv').css("display","none");
			$("#bankSelect").val("");
		}
		if(gettype == 1){
			$('#bankDiv').css("display","none");
			$("#bankSelect").val("");
		}
		if(gettype == 2){
			$('#bankDiv').css("display","block");
		}
    }
 </script>
</body>
</html>
</html>