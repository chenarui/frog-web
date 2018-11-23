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
		<form class="form-horizontal" role="form"></form>
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
		$(document).ready(
				function() {
					var rowDataNames = [];
					$("#grid-table").jqGrid(
							{
								url : './admin/userListJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '管理员编号',
									name : 'admin_id',
									width : 50,
									sortable:false
								}, {
									label : '管理员账号',
									name : 'account',
									width : 50,
									sortable:false
								}, {
									label : '名称',
									name : 'name',
									width : 50,
									sortable:false
								}, {
									label : '手机号',
									name : 'phone',
									width : 50,
									sortable:false
								}, {
									label : '操作',
									name : '',
									width : 60,
									sortable:false,
									formatter : operate
								}, ],
								multiselect : false,
								multiboxonly : true,
								sortable:true,
								rownumbers:true,
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
 						name : "新增",
 						click : function() {
 							loadHtml('./admin/addAdmin?');
 						}
 					} ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="edit(\''
 				+ rowObject.admin_id + '\')" style="margin-right:10px;">编辑</button>';
 			html += '<button class="btn btn-xs btn-primary" onclick="del(\''
 	 				+ rowObject.admin_id + '\',\''+rowObject.name+'\')" style="margin-right:10px;">删除</button>';
	 		html += '<button class="btn btn-xs btn-primary" onclick="aurthorityManage(\''
 	 	                + rowObject.admin_id + '\')" style="margin-right:10px;">权限配置</button>';
 	 	    html += '<button class="btn btn-xs btn-primary" onclick="resertPwd(\''
 	 	                + rowObject.admin_id + '\')" style="margin-right:10px;">重置密码</button>';
			return html;
		}
		
		function edit(admin_id){
			loadHtml('./admin/editAdmin?admin_id='+admin_id);
		}
		
		function resertPwd(admin_id){
            if(confirm("确定重置密码为默认密码:888888?")){
                    $.ajax({
                        url:'./admin/resertPwd',
                        data:{admin_id:admin_id},
                        dataType:'json',
                        type : "post",
                        success : function(msg) {
                            console.log(msg);
                            if (msg.c == 1) {
                                alert("修改成功");
                                loadHtml("./admin/userList");
                            } else {
                                alert(msg.m);
                                return;
                            }
                        }
                    })
            }else{
            	return;
            }
			
        }
		
		function aurthorityManage(admin_id){
            loadHtml('./admin/aurthorityManage?admin_id='+admin_id);
        }
		
		function del(admin_id,name){
			if(confirm("确定删除"+name+"账户?")){
				$.ajax({
					url:'./admin/delAdmin',
					data:{admin_id:admin_id},
					dataType:'json',
					type : "post",
					success : function(msg) {
						console.log(msg);
						if (msg.c == 1) {
							alert("删除成功");
							loadHtml("./admin/userList");
						} else {
							alert(msg.m);
							return;
						}
					}
				})
			}
		}
	</script>
</body>
</html>