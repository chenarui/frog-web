<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form class="form-horizontal" role="form"
		action="./user/userListJson2?">
		<div class="row">
			<div class="col-xs-12">
				<div class="form-group">
					<label Style="text-align: center;"
						class="col-sm-1 control-label no-padding-right" for="form-field-6">标题</label>
					<div class="col-sm-2" style="margin-left: -12px;">
						<input id="title" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey required" maxlength="20"
							placeholder="必填" name="title" data-placement="bottom">
					</div>
				</div>
			</div>
			<label Style="text-align: center;"
				class="col-sm-1 control-label no-padding-right" for="form-field-6">内容</label>
			<div class="" style="margin-left: 20px; margin-bottom: 20px;">
				<textarea rows="10" cols="80" id="message" placeholder="请输入内容"></textarea>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<input type="radio" name="user" id="user" onclick="changeUser()"
						class="col-sm-1 control-label no-padding-right"
						style="width: 20px; margin-top: 5px; margin-left: 30px;">
					<label style="text-align: center; font-size: 16px;" class=""
						for="form-field-6">个人</label>
				</div>
				<div class="form-group"
					style="margin-left: 100px; margin-top: -50px;">
					<input type="radio" name="user" id="alluser"
						onclick="changeAllUser()" value="0" style="margin-top: 11px;">
					<label Style="text-align: center; font-size: 16px;" class=""
						for="form-field-6">全部</label>
				</div>
			</div>


			<div class="col-xs-3"
				style="clear: both; float: initial; margin-top: 70px;">
				<div class="form-group">
					<button class="btn btn-info" type="button"
						style="margin-left: 10%; margin-top: 2px;"
						onclick="submitaction()">
						<i class="icon-ok bigger-110"></i> 消息推送
					</button>
					<button class="btn" type="button" style="margin-left: 16%;"
						onclick="goback()">
						<i class="icon-undo bigger-110"></i> 取消
					</button>
				</div>
			</div>
			<div id="id_top" style="display: none">
				<div class="col-xs-4">
					<div class="form-group">
						<label class="col-sm-4 control-label no-padding-right"
							for="form-field-6" style="font-weight: bold">手机号</label>
						<div class="col-sm-8">
							<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
								name="phone" title="手机号" data-placement="bottom">
						</div>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="form-group">
						<label class="col-sm-4 control-label no-padding-right"
							for="form-field-6" style="font-weight: bold">昵称</label>
						<div class="col-sm-8">
							<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
								name="name" title="昵称" data-placement="bottom">
						</div>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="form-group">
						<label class="col-sm-4 control-label no-padding-right"
							for="form-field-6" style="font-weight: bold">用户类型</label>
						<div class="col-sm-8">
							<select data-rel="tooltip" class="col-sm-10 searchKey"
								name="type" title="用户类型" data-placement="bottom" id="type">
								<option value=""></option>
								<option value="1">个人用户</option>
								<option value="2">企业用户</option>
							</select>
						</div>
					</div>
				</div>

				<div class="col-xs-4">
					<div class="form-group">
						<label class="col-sm-4 control-label no-padding-right">最后登录时间</label>
						<div class="col-sm-8">
							<div
								class="input-daterange input-group col-sm-10 no-padding-right no-padding-left">
								<input data-rel="tooltip"
									style="cursor: pointer; background-color: #fff !important; width: 100px;"
									readonly="readonly" type="text"
									class="form-control input-xs searchKey form_datetime "
									title="最后登录时间" id="startTime" name="startTime"
									placeholder="开始时间"> <span
									class="input-group-addon addon-xs"> <i
									class="fa fa-exchange"></i>
								</span> <input data-rel="tooltip"
									style="cursor: pointer; background-color: #fff !important; width: 100px;"
									readonly="readonly" type="text"
									class="form-control input-xs searchKey form_datetime"
									title="最后登录时间" id="endTime" name="endTime" placeholder="结束时间">
							</div>
						</div>
					</div>
				</div>
				<!--             <input type="submit" value="查询" class="btn btn-xs btn-primary"> -->
				<!--              <div class="col-xs-3" style="clear:both;float: initial;margin-top: 70px;"> -->
				<!--         </div> -->
			</div>

			<div class="col-xs-12" id="formB">
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
             console.log("${userInfo}");
                 $('[data-rel=tooltip]').tooltip({
                     container : 'body'
                 }); 
    });

     $('.form_datetime').datetimepicker({
         language:  'zh-CN',
         weekStart: 1,
         todayBtn:  1,
         autoclose: 1,
         todayHighlight: 1,
         startView: 2,
         minView: 2,
         forceParse: 0,
         format:'yyyy-mm-dd'
     });
     
     function usertype(cellvalue, options, rowObject) {
         var html = '';
         if (rowObject.type == 1) {
             html = '个人用户';
         } else {
             html = '企业用户';
         }
         return html;
     }

    function submitaction(){
        var allcheck = document.getElementById("alluser").checked;
        var onecheck = document.getElementById("user").checked;
        var content = $("#message").val();
        var title = $("#title").val();
        console.log(allcheck);
        if(!title){
            alert("请输入标题!");
            return;
        }
        if(!content){
            alert("请输入内容!");
            return;
        }
        if(allcheck && onecheck){
        	alert("请选择推送个人或全部");
        	return;
        }
        if(!allcheck && !onecheck){
            alert("请选择推送个人或全部");
            return;
        }
        if(allcheck){           
                $.ajax({
                    url : './user/savePush',
                    type : "post",
                    data : {title:title,content:content},
                    dataType:'json',
                    success : function(msg) {
                        console.log(msg);
                        if (msg.code == 1) {
                            alert("推送成功");
                            loadHtml("./user/pushList");
                        } else {
                            alert("推送失败");
                            return;
                        }
                    }
                })
        }else if(onecheck){
        	var user_id = [];
            console.log(title);
            console.log(content);
           var rowIds = jQuery("#grid-table").jqGrid(
                   'getGridParam', 'selarrrow');
           $(rowIds).each(function(i,rowId) {
                       user_id.push($("#grid-table").jqGrid('getRowData',rowId).user_id)
           });
           console.log(user_id.length);
           if(user_id.length == 0){
               alert("请选择要推送的用户名");
               return;
           }
           $.ajax({
               url : './user/savePush',
               type : "post",
               data : {user_id:user_id,title:title,content:content},
               dataType:'json',
               traditional: true,
               success : function(msg) {
                   console.log(msg);
                   if (msg.code == 1) {
                       alert("推送成功");
                       loadHtml("./user/pushList");
                   } else {
                       alert("推送失败");
                       return;
                   }
               }
           })
        	
        }
    }
    
    function goback(){
        loadHtml("./user/pushList");
    }
    function replaceSpace(obj){
            obj.value = obj.value.replace(/(^\s*)|(\s*$)/g, "");
    } 
    
    function changeUser(){
    	 $("#id_top").css("display","block");
    	 $("#formB").css("display","block");
    	 $("#nav-search").css("display","block");
         var user_id = [];
         var rowDataNames = [];
         $("#grid-table").jqGrid(
                 {
                     url : './user/userListJson2',
                     datatype : "json",
                      page:'${page}',
                     colModel : [ {
                         label : '用户编号',
                         name : 'user_id',
                         width : 50,
                         sortable:false
                     }, {
                         label : '昵称',
                         name : 'name',
                         width : 50,
                         sortable:false
                     }, {
                         label : '手机号',
                         name : 'phone',
                         width : 50,
                         sortable:false
                     }, {
                         label : '类型',
                         name : 'type',
                         width : 50,
                         sortable:false,
                         formatter : usertype
                     }, 
                     {
                         label : '余额',
                         name : 'balance',
                         width : 50,
                         sortable:false
                     }, {
                         label : '评分',
                         name : 'eva_point',
                         width : 50,
                         sortable:false
                     }, ],
                     multiselect : true,
                     multiboxonly : true,
                     sortable:false,
                     rownumbers:false,
                     onSelectRow : function(rowId, status, e) {
                         user_id = [];
                         var rowIds = jQuery("#grid-table").jqGrid(
                                 'getGridParam', 'selarrrow');
                         $(rowIds).each(
                                 function(i, rowId) {
                                     user_id.push($("#grid-table").jqGrid('getRowData',rowId).user_id)
                         });
                         //console.log(user_id);
                     },
                     viewrecords : true, // show the current page, data rang and total records on the toolbar
                     rowList : [ 10, 20, 30 ],
                     autowidth : true,
                     height : $(window).height() - 300,
                     rowNum: 10,
                     pager : "#grid-pager",
                     jsonReader : {
                         root : 'rows',
                         repeatitems : false,
                         page : "page", // json中代表当前页码的数据  
                         records : "records", // json中代表数据行总数的数据 
                         total : "total"
                     },
                     loadComplete : function() {
                         var table = this;
                         setTimeout(function() {
                             updatePagerIcons(table);
                         }, 0);
                     },
                 });
         $('[data-rel=tooltip]').tooltip({
             container : 'body'
         }); 
         initButton([ {
             name : "查询",
             click : function() {
                 searchFrom('./user/userListJson2?');
             },
         } ]);
    }
    
   function changeAllUser(){
	   $("#formB").css("display","none");
	   $("#id_top").css("display","none");
	   $("#nav-search").css("display","none");
   }
</script>

</body>
</html>