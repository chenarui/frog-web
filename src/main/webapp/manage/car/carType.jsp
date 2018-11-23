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
							data-src="${p.cartype_id}" class="icon2">
						<div class="input_con" style="display: none"
							id="cnaminput_${p.cartype_id}">
							<input type="text" value="${p.name}" id="value_${p.cartype_id}"
								name="name1" class="search_food"> <input type="hidden"
								id="cartype_id" name="cartype_id" value="${p.cartype_id}">
						</div>
						<div class="search_sort" id="laber_${p.cartype_id}"
							style="margin-top: 10px; font-size: 16px">${p.name}</div>
						<div class="search_sort" id="laber2_${p.cartype_id}"
							style="margin-top: 5px; font-size: 16px">
							<c:forEach items="${p.propertyList}" var="k">
                      ${k.name}&nbsp;
                     </c:forEach>
						</div>
						<div class="search_sort" id="laberbox_${p.cartype_id}"
							style="display: none; margin-top: 5px; font-size: 16px">
							<input type="checkbox" value="1" name="name" class=""> <label
								style="font-size: 13px; margin-left: 2px; margin-right: 15px;">车长</label>
							<input type="checkbox" value="2" name="name" class=""> <label
								style="font-size: 13px; margin-left: 2px; margin-right: 15px;">尺寸</label>
							<input type="checkbox" value="3" name="name" class=""> <label
								style="font-size: 13px; margin-left: 2px; margin-right: 15px;">载重</label>
						</div>
						<div class="editor" onclick="editer(${p.cartype_id})"
							id="editer_${p.cartype_id}">
							<img src="assets/images/sort/sort_icon3.png" class="icon3">
						</div>
						<div class="text" style="display: none" id="sure_${p.cartype_id}"
							onclick="editsave(${p.cartype_id})">确定</div>
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
      $("#laberbox_"+id).show();
      $("#laber_"+id).hide();
      $("#laber2_"+id).hide();
      $("#editer_"+id).hide();
      $.ajax({
          url:'./car/typePropList',
          data:{cartype_id:id},
          async: false,
          success:function(msg){
              ids = msg;
          }
      })
      var items = ids;
      console.log(items);
            $.each(items, function (index, item) {
                      $("input[name='name']").each(function () {
                          if ($(this).val() == item) {
                              //$(this).attr("checked","checked");
                                 $(this).prop("checked",true);
                          }
                      });
                  });
  }
  
  $(".add").on("click",function(){
	    var html ='';
	    html = '<form id="addform"><div class="sort_cont">';
        html += ' <div class="input_con">';
        html += '<input type="text" id="addinput" name="name" class="search_food">';
        html += '</div>';
        html += '<div class="search_sort" id="laberbox" style="margin-top: 5px;font-size: 16px">';
        html += '<input type="checkbox" value="1" id="value_${p.cartype_id}" name="proid" class="pro">';
        html += '<label style="font-size: 13px;margin-left: 2px;margin-right: 15px;">车长</label>';
       	html += '<input type="checkbox" value="2" id="value_${p.cartype_id}" name="proid" class="pro">';
     	html += '<label style="font-size: 13px;margin-left: 2px;margin-right: 15px;">尺寸</label>';
       	html += '<input type="checkbox" value="3" id="value_${p.cartype_id}" name="proid" class="pro"> ';
      	html += '<label style="font-size: 13px;margin-left: 2px;margin-right: 15px;">载重</label>';
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
      var cartype_id = ids.join(",");
      if(cartype_id == ''){
          alert("请选择要删除的类型!");
          return;  
      }
      if(confirm("确定要删除?")){
          if(cartype_id != ''){
          $.ajax({
              url:'./car/delCarType',
                data:{cartype_id:cartype_id},
                type:'post',
                dataType:'json',
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
          }else{
          return;
          }
      }
  })
  
  function addUserEval(){
      var name = $("#addinput").val();
      var i = 0;
      var ids = new Array();
      $("#laberbox").find('input:checkbox[name="proid"]:checked').each(function(){
          ids[i]= $(this).attr("value");
          i++;
      });
      var proIds = ids.join(",");
      console.log(proIds);
      if(!name){
          alert("请输入车辆类型!");
          return;
      }
      if(!proIds){
    	  alert("请选择车辆属性!");
          return;
      }
      $.ajax({
          url:'./car/addCarType',
            data:{name:name,proIds:proIds},
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
  
  function editsave(cartype_id){
      var name = $("#value_"+cartype_id).val();
      console.log(name);
      var i = 0;
      var ids = new Array();
      $("#laberbox_"+cartype_id).find('input:checkbox[name="name"]:checked').each(function(){
          ids[i]= $(this).attr("value");
          i++;
      });
      var proIds = ids.join(",");
      console.log(proIds);
      console.log(cartype_id);
      if(!name){
          alert("请输入车辆类型!");
          return;
      }
      if(!proIds){
          alert("请选择车辆属性!");
          return;
      }
      if(confirm("确定要修改?")){
      $.ajax({
          url:'./car/updateCarType',
            data:{proIds:proIds,name:name,cartype_id:cartype_id},
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