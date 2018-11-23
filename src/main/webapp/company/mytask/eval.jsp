<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
.pingjia ul {
	padding-left: 0;
	overflow: hidden;
}

.pingjia ul li {
	float: left;
	list-style: none;
	width: 27px;
	height: 27px;
	background: url(img/star.gif)
}

.pingjia ul li a {
	display: block;
	width: 100%;
	padding-top: 27px;
	overflow: hidden;
}

.pingjia ul li.light {
	background-position: 0 -29px;
}
</style>
<body>
	<div class="pingjia">
		<label
			Style="text-align: center; margin-top: 0px; margin-left: -14px; width: 70px; margin-right: 6px; font-weight: bold;"
			class="col-sm-1 control-label no-padding-right" for="form-field-6">评分</label>
		<ul>
			<li><a href="javascript:;">1</a></li>
			<li><a href="javascript:;">2</a></li>
			<li><a href="javascript:;">3</a></li>
			<li><a href="javascript:;">4</a></li>
			<li><a href="javascript:;">5</a></li>
			<li><a href="javascript:;">6</a></li>
		</ul>
	</div>
	<div class="right" style="width: 1188px;">
		<div class="pingjia">
			<label
				Style="text-align: center; margin-top: 40px; margin-left: -14px; width: 70px; margin-right: -8px; font-weight: bold;"
				class="col-sm-1 control-label no-padding-right" for="form-field-6">标签</label>
		</div>
		<div class="food_sort">
			<c:forEach items="${list }" var="p">
				<form id="editform_1">
					<div class="sort_cont" style="width: 200px; height: 80px;">
						<img src="assets/images/sort/sort_icon4.png" data-src="${p.value}"
							class="icon2">
						<div class="search_sort" id="laber_${p.config_id}">
							${p.value}</div>
					</div>
				</form>
			</c:forEach>
		</div>
	</div>
	<div style="clear: both"></div>
	<div class="row">
		<label
			Style="text-align: center; margin-top: 30px; margin-left: -24px; width: 100px; font-weight: bold;"
			class="col-sm-1 control-label no-padding-right" for="form-field-6">评价内容</label>
		<div class="" style="margin-left: 20px; margin-bottom: 20px;">
			<textarea rows="7" cols="120" id="message" placeholder="请输入评价"
				style="margin-top: 30px;"></textarea>
		</div>
		<div class="col-xs-3"
			style="clear: both; float: initial; margin-top: 70px;">
			<div class="form-group">
				<button class="btn btn-info" type="button" style="margin-left: 30%;"
					onclick="submitaction()">
					<i class="icon-ok bigger-110"></i> 评价
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

	<script type="text/javascript">
    //初始化
    
  $(document).ready(function() {
        var totalH = $(document).height();
        $('.left').height(totalH );
        var totalW = $(window).width();
        $('.right').width(totalW - 210-25);
        
        var num=finalnum = tempnum= 0;
        var lis = document.getElementsByTagName("li");
        //num:传入点亮星星的个数
        //finalnum:最终点亮星星的个数
        //tempnum:一个中间值
        function fnShow(num) {
	        finalnum= num || tempnum;//如果传入的num为0，则finalnum取tempnum的值
	        for (var i = 0; i < lis.length; i++) {
	         lis[i].className = i < finalnum? "light" : "";//点亮星星就是加class为light的样式
	        }
	         return finalnum;
        }
        for (var i = 1; i <= lis.length; i++) {
	         lis[i - 1].index = i;
	         lis[i - 1].onmouseover = function() { //鼠标经过点亮星星。
	          fnShow(this.index);//传入的值为正，就是finalnum
         }
         lis[i - 1].onmouseout = function() { //鼠标离开时星星变暗
        	  fnShow(0);//传入值为0，finalnum为tempnum,初始为0
         }
         lis[i - 1].onclick = function() { //鼠标点击,同时会调用onmouseout,改变tempnum值点亮星星
        	    tempnum= this.index;
         }
        }
     
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
  
  function submitaction(){
	  var content = $('#message').val();
    	var i = 0;
      var ids = new Array();
      $(".iconcheck").each(function(){
          ids[i]= $(this).attr("data-src");
          i++;
      });
      
      var tag = ids.join(",");
      var order_id = "${order_id}";
//       console.log(content);
//       console.log(order_id);
     
      var point = finalnum-29;
      console.log( point);
      if( point <= -29){
    	  alert("请打分!");
    	  return;
      }
	  if(tag == '' && !content){
		  alert("请评价!");
          return;  
	  }
             $.ajax({
                 url:'./mytask/addEval',
                   data:{content:content,tag:tag,order_id:order_id,point:point},
                   type:'post',
                   dataType:'json',
                   //async:false,
                   success:function(data){
                       data = eval('('+data+')');
                       var code = data.code;
                       if(code==1){
                           alert("评价成功！");
                           loadHtml("./mytask/completed");
                       }else{
                           alert("服务异常");  
                       }
                   }
             })

 }
  
  function goback(){
      loadHtml("./mytask/completed");
 }

  
 </script>
</body>
</html>