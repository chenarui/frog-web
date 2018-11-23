<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="right" style="width: 1188px;">
		<div class="add_del">
			<div class="part_left">
				<div class="left_btn del">删除</div>
				<div class="left_btn add">新增</div>
			</div>
		</div>
		<div class="food_sort">
			<c:forEach items="${list }" var="p">
				<form id="editform_1">
					<div class="sort_cont">
						<img src="assets/images/sort/sort_icon4.png"
							data-src="${p.config_id}" class="icon2">
						<div class="input_con" style="display: none"
							id="cnaminput_${p.config_id}">
							<input type="text" value="${p.value}" id="value_${p.config_id}"
								name="value" class="search_food"> <input type="hidden"
								id="config_id" name="config_id" value="${p.config_id}">
						</div>
						<div class="search_sort" id="laber_${p.config_id}">
							${p.value}</div>
						<div class="editor" onclick="editer(${p.config_id})"
							id="editer_${p.config_id}">
							<img src="assets/images/sort/sort_icon3.png" class="icon3">
						</div>
						<div class="text" style="display: none" id="sure_${p.config_id}"
							onclick="editsave(${p.config_id})">确定</div>
						<%--                 <div class="text" style="display:none" id="goback_${p.config_id}" onclick="goback()">取消</div> --%>
					</div>
				</form>

			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
    //初始化
    
  $(document).ready(function() {
        var totalH = $(document).height();
        $('.left').height(totalH );
        var totalW = $(window).width();
        $('.right').width(totalW - 210-25);
    })
    
    function editer(id){
      $("#cnaminput_"+id).show();
      $("#sure_"+id).show();
      $("#laber_"+id).hide();
      $("#editer_"+id).hide();
      //$("#file_1").show();
  }
  
  $(".add").on("click",function(){
	    var html ='';
	    html = '<form id="addform"><div class="sort_cont">';
        html += ' <div class="input_con">';
        html += '<input type="text" id="addinput" name="name" class="search_food">';
        html += '</div>';
        html += '<div class="text" onclick="addUserEval()">确定</div>';
        html += '</div></form>';
      $(".food_sort").append(html);
      $("#addinput").focus();
      $(".add").off();
  })
  
  $(".icon2").on("click",function(){
      if($(this).hasClass("iconcheck")){
          $(this).removeClass("iconcheck");
          $(this).attr("src","assets/images/sort/sort_icon4.png");
      }else{
          $(this).addClass("iconcheck");
          $(this).attr("src","assets/images/sort/sort_icon2.png");
      }
  })
  
  $(document).on("click",".del",function(){
	  var i = 0;
      var ids = new Array();
      $(".iconcheck").each(function(){
          ids[i]= $(this).attr("data-src");
          i++;
      });
      var config_id = ids.join(",");
	  if(config_id == ''){
		  alert("请选择要删除的标签!");
          return;  
	  }
	  if(confirm("确定要删除?")){
         if(config_id != ''){
             $.ajax({
                 url:'./config/delBank',
                   data:{config_id:config_id},
                   type:'post',
                   dataType:'json',
                   //async:false,
                   success:function(data){
                       data = eval('('+data+')');
                       var code = data.code;
                       if(code==1){
                           alert("删除成功！");
                           window.location.reload();
                       }else{
                           alert("删除失败");  
                       }
                   }
             })
         }
     }else{
    	 return;
     }
  })
  
  function addUserEval(){
      var value = $("#addinput").val();
      console.log(value);
      if(!value){
          alert("请输入标签!");
          return;
      }
      $.ajax({
          url:'./config/addBank',
            data:{value:value},
            type:'post',
            dataType:'json',
            success:function(data){
            	 data = eval('('+data+')');
                 var code = data.code;
                 if(code!=0){
                     alert("保存成功！");
                     window.location.reload();
                 }else{
                     alert("添加失败");  
                 }
            }
      })
  }
  
  function editsave(config_id){
      var value = $("#value_"+config_id).val();
      console.log(value);
      if(!value){
          alert("请输入标签!");
          return;
      }
      if(confirm("确定要修改?")){
    	  $.ajax({
              url:'./config/editBank',
                data:{config_id:config_id,value:value},
                type:'post',
                dataType:'json',
                success:function(data){
                    data = eval('('+data+')');
                    var code = data.code;
                    if(code!=0){
                        alert("保存成功！");
                        window.location.reload();
                    }else{
                        alert("添加失败");  
                    }
                }
          })
      }else{
    	  return;
      }
      
  }
  
 


 </script>
</body>
</html>