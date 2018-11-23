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
		<div class="food_sort" id="food_sort1">
			<span class="" style="margin-left: 15px;; font-size: 20px;">车长</span>
			<div class="left_btn del" id="delete1">删除</div>
			<div class="left_btn add" id="add1">新增</div>
			<c:forEach items="${list1 }" var="p">
				<form id="editform_1">
					<div class="sort_cont" style="margin-top: 20px;">
						<img src="assets/images/sort/sort_icon4.png"
							data-src="${p.carproperty_set_id}" class="icon2">
						<div class="input_con" style="display: none"
							id="cnaminput_${p.carproperty_set_id}">
							<input type="text" value="${p.value}"
								id="value_${p.carproperty_set_id}" name="value"
								class="search_food"> <input type="hidden"
								id="carproperty_set_id" name="carproperty_set_id"
								value="${p.carproperty_set_id}">
						</div>
						<div class="search_sort" id="laber_${p.carproperty_set_id}">
							${p.value}&nbsp;米</div>
						<div class="editor" onclick="editer(${p.carproperty_set_id})"
							id="editer_${p.carproperty_set_id}">
							<img src="assets/images/sort/sort_icon3.png" class="icon3">
						</div>
						<div class="text" style="display: none"
							id="sure_${p.carproperty_set_id}"
							onclick="editsave(${p.carproperty_set_id})">确定</div>
					</div>
				</form>

			</c:forEach>
		</div>

		<div class="" style="clear: both;"></div>
		<!-- <div class="add_del" style="height: 5px;"> -->
		<!-- </div> -->
		<div class="food_sort" id="food_sort2" style="margin-top: 10px;">
			<span class="" style="margin-left: 15px;; font-size: 20px;">尺寸</span>
			<div class="left_btn del" id="delete2">删除</div>
			<div class="left_btn add" id="add2">新增</div>
			<c:forEach items="${list2 }" var="p">
				<form id="editform_1">
					<div class="sort_cont" style="margin-top: 20px;">
						<img src="assets/images/sort/sort_icon4.png"
							data-src="${p.carproperty_set_id}" class="icon2">
						<div class="input_con" style="display: none"
							id="cnaminput_${p.carproperty_set_id}">
							<input type="text" value="${p.value}"
								id="value_${p.carproperty_set_id}" name="value"
								class="search_food"> <input type="hidden"
								id="carproperty_set_id" name="carproperty_set_id"
								value="${p.carproperty_set_id}">
						</div>
						<div class="search_sort" id="laber_${p.carproperty_set_id}">
							${p.value}&nbsp;立方米</div>
						<div class="editor" onclick="editer(${p.carproperty_set_id})"
							id="editer_${p.carproperty_set_id}">
							<img src="assets/images/sort/sort_icon3.png" class="icon3">
						</div>
						<div class="text" style="display: none"
							id="sure_${p.carproperty_set_id}"
							onclick="editsave(${p.carproperty_set_id})">确定</div>
					</div>
				</form>

			</c:forEach>
		</div>

		<div class="" style="clear: both;"></div>
		<div class="food_sort" id="food_sort3" style="margin-top: 10px;">
			<span class="" style="margin-left: 15px;; font-size: 20px;">载重</span>
			<div class="left_btn del" id="delete3">删除</div>
			<div class="left_btn add" id="add3">新增</div>
			<c:forEach items="${list3 }" var="p">
				<form id="editform_1">
					<div class="sort_cont" style="margin-top: 20px;">
						<img src="assets/images/sort/sort_icon4.png"
							data-src="${p.carproperty_set_id}" class="icon2">
						<div class="input_con" style="display: none"
							id="cnaminput_${p.carproperty_set_id}">
							<input type="text" value="${p.value}"
								id="value_${p.carproperty_set_id}" name="value"
								class="search_food"> <input type="hidden"
								id="carproperty_set_id" name="carproperty_set_id"
								value="${p.carproperty_set_id}">
						</div>
						<div class="search_sort" id="laber_${p.carproperty_set_id}">
							${p.value}&nbsp;吨</div>
						<div class="editor" onclick="editer(${p.carproperty_set_id})"
							id="editer_${p.carproperty_set_id}">
							<img src="assets/images/sort/sort_icon3.png" class="icon3">
						</div>
						<div class="text" style="display: none"
							id="sure_${p.carproperty_set_id}"
							onclick="editsave(${p.carproperty_set_id})">确定</div>
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
  
  $("#add1").on("click",function(){
        var html ='';
        html = '<form id="addform"><div class="sort_cont" style="margin-top: 20px;">';
        html += ' <div class="input_con">';
        html += '<input type="text" id="addinput" name="name" class="search_food">';
        html += '</div>';
        html += '<div class="text" onclick="add1()">确定</div>';
        html += '</div></form>';
      $("#food_sort1").append(html);
      $("#addinput").focus();
      $(".add").off();
  })
  $("#add2").on("click",function(){
        var html ='';
        html = '<form id="addform"><div class="sort_cont" style="margin-top: 20px;">';
        html += ' <div class="input_con">';
        html += '<input type="text" id="addinput" name="name" class="search_food">';
        html += '</div>';
        html += '<div class="text" onclick="add2()">确定</div>';
        html += '</div></form>';
      $("#food_sort2").append(html);
      $("#addinput").focus();
      $(".add").off();
  })
  $("#add3").on("click",function(){
        var html ='';
        html = '<form id="addform"><div class="sort_cont" style="margin-top: 20px;">';
        html += ' <div class="input_con">';
        html += '<input type="text" id="addinput" name="name" class="search_food">';
        html += '</div>';
        html += '<div class="text" onclick="add3()">确定</div>';
        html += '</div></form>';
      $("#food_sort3").append(html);
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
  
  $(document).on("click","#delete1",function(){
      var i = 0;
      var ids = new Array();
      $(".iconcheck").each(function(){
          ids[i]= $(this).attr("data-src");
          i++;
      });
      var carproperty_set_id = ids.join(",");
      if(carproperty_set_id == ''){
          alert("请选择要删除的标签!");
          return;  
      }
      if(confirm("确定要删除?")){
         if(carproperty_set_id != ''){
             $.ajax({
                 url:'./car/delCarProperty',
                   data:{carproperty_set_id:carproperty_set_id},
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
  $(document).on("click","#delete2",function(){
      var i = 0;
      var ids = new Array();
      $(".iconcheck").each(function(){
          ids[i]= $(this).attr("data-src");
          i++;
      });
      var carproperty_set_id = ids.join(",");
      if(carproperty_set_id == ''){
          alert("请选择要删除的标签!");
          return;  
      }
      if(confirm("确定要删除?")){
         if(carproperty_set_id != ''){
             $.ajax({
            	 url:'./car/delCarProperty',
                   data:{carproperty_set_id:carproperty_set_id},
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
  $(document).on("click","#delete3",function(){
      var i = 0;
      var ids = new Array();
      $(".iconcheck").each(function(){
          ids[i]= $(this).attr("data-src");
          i++;
      });
      var carproperty_set_id = ids.join(",");
      if(carproperty_set_id == ''){
          alert("请选择要删除的标签!");
          return;  
      }
      if(confirm("确定要删除?")){
         if(carproperty_set_id != ''){
             $.ajax({
            	 url:'./car/delCarProperty',
                   data:{carproperty_set_id:carproperty_set_id},
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
  
  function add1(){
      var value = $("#addinput").val();
      console.log(value);
      if(!value){
          alert("请输入标签!");
          return;
      }
      $.ajax({
          url:'./car/addCarProperty',
            data:{value:value,carproperty_id:1},
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
  function add2(){
      var value = $("#addinput").val();
      console.log(value);
      if(!value){
          alert("请输入标签!");
          return;
      }
      $.ajax({
    	  url:'./car/addCarProperty',
          data:{value:value,carproperty_id:2},
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
  function add3(){
      var value = $("#addinput").val();
      console.log(value);
      if(!value){
          alert("请输入标签!");
          return;
      }
      $.ajax({
    	  url:'./car/addCarProperty',
          data:{value:value,carproperty_id:3},
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
  
  function editsave(carproperty_set_id){
      var value = $("#value_"+carproperty_set_id).val();
      console.log(value);
      console.log(carproperty_set_id);
      if(!value){
          alert("请输入标签!");
          return;
      }
      if(confirm("确定要修改?")){
          $.ajax({
              url:'./car/editCarProperty',
                data:{carproperty_set_id:carproperty_set_id,value:value},
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