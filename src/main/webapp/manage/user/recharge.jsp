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
						class="col-sm-1 control-label no-padding-right" for="form-field-3">充值金额</label>
					<div class="col-sm-1">
						<input id="ratio" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey required" maxlength="15"
							style="width: 150px; text-align: center;" placeholder="请输入金额"
							name="ratio" title="" data-placement="bottom" />
					</div>
				</div>
			</div>
			<div class="col-xs-3"
				style="clear: both; float: initial; margin-top: 70px;">
				<div class="form-group">
					<button class="btn btn-info" type="button"
						style="margin-left: 30%;" onclick="submitaction()">
						<i class="icon-ok bigger-110"></i> 充值
					</button>
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
        var ratio = $('#ratio').val();
        var id = '${user_id}';
        var money = eval(ratio);
        console.log(id);
        console.log(money);
        if(!ratio || money <= 0){
        	alert("请输入金额");
        	return;
        }else{
        	if(confirm("确定充值金额为 "+money)){
        		 $.ajax({
                     url : './user/charge',
                     type : "post",
                     data :{user_id:id,price:money},
                     dataType:'json',
                     success : function(msg) {
                         console.log(msg);
                         if (msg.code == 0) {
                             alert("操作失败");
                             return;
                         } else {
                             alert("充值成功");
                             loadHtml("./user/userList");
                         }
                     }
                 })
        	}else{
        		return;
        	}
        }
       
    }
    
    function goback(){
        loadHtml("./user/userList");
    }
    
    $("#ratio").keyup(function () {
        var reg = $(this).val().match(/\d+\.?\d{0,2}/);
        var txt = '';
        if (reg != null) {
            txt = reg[0];
        }
        $(this).val(txt);
    }).change(function () {
        $(this).keypress();
        var v = $(this).val();
        if (/\.$/.test(v))
        {
            $(this).val(v.substr(0, v.length - 1));
        }
    });
 </script>
</body>
</html>