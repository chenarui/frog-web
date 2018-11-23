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
		<div class="row" style="margin-left: 3%; margin-top: 20px;">
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">用户管理</label> <input name="permissionclass"
						class="permissionclass1" type="checkbox" value="1">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check1">
					<label Style="text-align: center;" class="" for="form-field-6">前端用户管理</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="2"> <label Style="text-align: center;" class=""
						for="form-field-6">后台用户管理</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="3">
				</div>
			</div>
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">司机管理</label> <input name="permissionclass"
						class="permissionclass2" type="checkbox" value="4">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check2">
					<label Style="text-align: center;" class="" for="form-field-6">司机管理</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="5"> <label Style="text-align: center;" class=""
						for="form-field-6">车辆管理</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="6">
				</div>
			</div>
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">公司管理</label> <input name="permissionclass"
						class="permissionclass9" type="checkbox" value="30">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check9">
					<label Style="text-align: center;" class="" for="form-field-6">公司管理</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="31">
				</div>
			</div>
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">订单管理</label> <input name="permissionclass"
						class="permissionclass3" type="checkbox" value="7">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check3">
					<label Style="text-align: center;" class="" for="form-field-6">订单仪表盘</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="8"> <label Style="text-align: center;" class=""
						for="form-field-6">订单列表</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="9">
				</div>
			</div>
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">现金管理</label> <input name="permissionclass"
						class="permissionclass4" type="checkbox" value="10">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check4">
					<label Style="text-align: center;" class="" for="form-field-6">资金池</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="11"> <label Style="text-align: center;" class=""
						for="form-field-6">收入明细</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="12"> <label
						Style="text-align: center;" class="" for="form-field-6">支出明细</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="13"> <label Style="text-align: center;" class=""
						for="form-field-6">提现申请</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="14"> <label
						Style="text-align: center;" class="" for="form-field-6">公司提现申请</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="29">
				</div>
			</div>
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">车辆配置</label> <input name="permissionclass"
						class="permissionclass5" type="checkbox" value="15">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check5">
					<label Style="text-align: center;" class="" for="form-field-6">车辆类型配置</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="16"> <label Style="text-align: center;" class=""
						for="form-field-6">车辆属性搜索配置</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="17">
				</div>
			</div>
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">反馈管理</label> <input name="permissionclass"
						class="permissionclass6" type="checkbox" value="18">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check6">
					<label Style="text-align: center;" class="" for="form-field-6">用户留言反馈</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="19"> <label Style="text-align: center;" class=""
						for="form-field-6">司机留言反馈</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="20"> <label
						Style="text-align: center;" class="" for="form-field-6">企业留言反馈</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="36">
				</div>
			</div>
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">消息列表</label> <input name="permissionclass"
						class="permissionclass7" type="checkbox" value="21">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check7">
					<label Style="text-align: center;" class="" for="form-field-6">用户端推送记录</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="22"> <label Style="text-align: center;" class=""
						for="form-field-6">司机推送记录</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="23">
				</div>
			</div>
			<div class="col-xs-12" style="margin-bottom: -15px;">
				<div class="form-group">
					<label Style="text-align: center; color: red;" class=""
						for="form-field-6">系统配置</label> <input name="permissionclass"
						class="permissionclass8" type="checkbox" value="24">
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group" id="check8">
					<label Style="text-align: center;" class="" for="form-field-6">分成比例配置</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="25"> <label Style="text-align: center;" class=""
						for="form-field-6">用户端评价标签配置</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="26"> <label
						Style="text-align: center;" class="" for="form-field-6">用户端投诉标签配置</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="27"> <label Style="text-align: center;" class=""
						for="form-field-6">司机端评价标签配置</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="28"> <label
						Style="text-align: center;" class="" for="form-field-6">可提现银行标签配置</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="32"> <label Style="text-align: center;" class=""
						for="form-field-6">充值文案配置</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="33"> <label
						Style="text-align: center;" class="" for="form-field-6">关于用户端信息配置</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="34"> <label Style="text-align: center;" class=""
						for="form-field-6">关于司机端信息配置</label> <input name="permissionclass"
						id="permissionclass" type="checkbox" value="35"> <label
						Style="text-align: center;" class="" for="form-field-6">关于用户端用户协议配置</label>
					<input name="permissionclass" id="permissionclass" type="checkbox"
						value="37"> <label Style="text-align: center;" class=""
						for="form-field-6">关于货物托运服务协议配置</label> <input
						name="permissionclass" id="permissionclass" type="checkbox"
						value="38">
				</div>
			</div>

			<div class="col-xs-3"
				style="clear: both; float: initial; margin-top: 70px;">
				<div class="form-group">
					<button class="btn btn-info" type="button"
						style="margin-left: 30%;" onclick="submitaction()">
						<i class="icon-ok bigger-110"></i> 保存
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
    $(document).ready(function () {
        var ids = new Array;
        <c:forEach items="${list}" var="p">
        ids.push('${p.getModel_id()}');
        </c:forEach>
        console.log(ids);
        console.log("${admin_id}");
        if(ids.length == 0){
        	$("input[name='permissionclass']").each(function () {
                    $(this).prop("checked",false);
   		     });
        }else{
            $.each(ids, function (index, item) {
                $("input[name='permissionclass']").each(function () {
                    if ($(this).val() == item) {
                       $(this).prop("checked",true);
                     }
                 });
           });
        }
    });
    function submitaction(){
    	var permissions = document.getElementsByName("permissionclass");
        choosePMS = '';
        //获取被选中的checkbox
        for(k in permissions){
            if(permissions[k].checked){
             choosePMS += permissions[k].value+","; 
            }
        }
        var admin_id= "${admin_id}";
        console.log(choosePMS);
        if(choosePMS ==""){
        	alert("请选择要配置的权限");
        	return;
        }
        if(confirm("确定要保存当前权限配置?")){
        	$.ajax({
                url:'./admin/saveAurthority',
                data:{model_id:choosePMS,admin_id:admin_id},// 你的formid
                success:function(msg){
                    if (msg.c == 1) {
                        alert("保存成功");
                        loadHtml("./admin/userList");
                    } else {
                        alert("服务异常");
                        return;
                    }
                }
            })
        }else{
        	return;
        }
        
    }
    
    function goback(){
        loadHtml("./admin/userList");
    }
    
    
    $(document).on('click','.permissionclass1',function(){
         if(!$(this).prop("checked")){
            $("#check1").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
        	  $("#check1").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
   $(document).on('click','.permissionclass2',function(){
         if(!$(this).prop("checked")){
            $("#check2").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
              $("#check2").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
   $(document).on('click','.permissionclass3',function(){
         if(!$(this).prop("checked")){
            $("#check3").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
              $("#check3").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
   $(document).on('click','.permissionclass4',function(){
         if(!$(this).prop("checked")){
            $("#check4").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
              $("#check4").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
   $(document).on('click','.permissionclass5',function(){
         if(!$(this).prop("checked")){
            $("#check5").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
              $("#check5").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
   $(document).on('click','.permissionclass6',function(){
         if(!$(this).prop("checked")){
            $("#check6").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
              $("#check6").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
   $(document).on('click','.permissionclass7',function(){
         if(!$(this).prop("checked")){
            $("#check7").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
              $("#check7").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
   $(document).on('click','.permissionclass8',function(){
         if(!$(this).prop("checked")){
            $("#check8").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
              $("#check8").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
    $(document).on('click','.permissionclass9',function(){
         if(!$(this).prop("checked")){
            $("#check9").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",false);
            });
        }else{
              $("#check9").find('input[id="permissionclass"]').each(function(){
                $(this).prop("checked",true);
            }); 
         } 
   })
</script>

</body>
</html>