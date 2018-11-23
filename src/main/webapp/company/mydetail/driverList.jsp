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
		<form class="form-horizontal" role="form">
			<div class="col-xs-4">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">姓名</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="name" title="姓名" data-placement="bottom">
					</div>
				</div>
			</div>
			<!--             <div class="col-xs-4"> -->
			<!--                 <div class="form-group"> -->
			<!--                     <label class="col-sm-4 control-label no-padding-right" -->
			<!--                         for="form-field-6" style="font-weight: bold">身份证</label> -->
			<!--                     <div class="col-sm-8"> -->
			<!--                             <input data-rel="tooltip" type="text" class="col-sm-10 searchKey" -->
			<!--                             name="id_card" title="身份证" -->
			<!--                             data-placement="bottom" > -->
			<!--                     </div> -->
			<!--                 </div> -->
			<!--             </div> -->
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
		</form>

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
								url : './mytask/driverListJson',
								datatype : "json",
								 page:'${page}',
								colModel : [ {
									label : '序号',
									name : 'driver_id',
									width : 100,
									sortable:false
								}, 
								{
                                    label : '姓名',
                                    name : 'name',
                                    width : 200,
                                    sortable:false
                                },
                                {
                                    label : '身份证',
                                    name : 'id_card',
                                    width : 200,
                                    sortable:false
                                },{
									label : '身份证正面',
									name : 'id_front_url',
									width : 150,
									formatter:loadpicture,
									sortable:false
								},{
                                    label : '身份证反面',
                                    name : 'id_back_url',
                                    width : 150,
                                    formatter:loadpicture2,
                                    sortable:false
                                }, {
                                    label : '驾驶证',
                                    name : 'driver_card_url',
                                    width : 150,
                                    formatter:loadpicture3,
                                    sortable:false
                                }, {
                                    label : '手机',
                                    name : 'phone',
                                    width : 200,
                                    sortable:false
                                }, {
                                    label : '审核状态',
                                    name : '',
                                    width : 150,
                                    formatter:changeState,
                                }, {
									label : '操作',
									name : '',
									width : 350,
									formatter : operate,
									sortable:false
								}, ],
								multiselect : true,
								multiboxonly : true,
								rownumbers:true,
								/* onSelectRow : function(rowId, status, e) {
									rowDataNames = [];
									var rowIds = jQuery("#jqGrid").jqGrid(
											'getGridParam', 'selarrrow');
									$(rowIds).each(
											function(i, rowId) {
												rowDataNames.push($("#jqGrid")
														.jqGrid('getRowData',
																rowId))
											});
								}, */
								viewrecords : true, // show the current page, data rang and total records on the toolbar
								rowList : [ 10, 20, 30 ],
								autowidth : false,
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
				    initButton([
	                {
						name : "查询",
						click : function() {
						    searchFrom('./mytask/driverListJson?');
						}
				    },
	                {
		                 name: "新增", //这里是静态页的地址
		                 click: function(){
		                     loadHtml("./mytask/add");
		                 }
	                }
		             ])
				});

		function operate(cellvalue, options, rowObject) {
			var html = '';
 			html += '<button class="btn btn-xs btn-primary" onclick="detail(\''
 				+ rowObject.driver_id + '\')" style="margin-right:10px;">查看详情</button>';
 			html += '<button class="btn btn-xs btn-primary" onclick="edit(\''
 	 			+ rowObject.driver_id + '\')" style="margin-right:10px;">修改信息</button>';
 			html += '<button class="btn btn-xs btn-primary" onclick="addCar(\''
                + rowObject.driver_id + '\')" style="margin-right:10px;">新增车辆</button>';
 	 		html += '<button class="btn btn-xs btn-primary" onclick="deldriver(\''
 	 	 		+ rowObject.driver_id + '\')" style="margin-right:10px;">删除</button>';
			return html;
		}
	
		function detail(id){
			loadHtml("./mytask/driverDetail?id="+id);
		}
		function edit(id){
			loadHtml("./mytask/editDriver?id="+id);
		}
		function addCar(id){
            loadHtml("./mytask/addCar?driver_id="+id);
        }
		function deldriver(id){
			if(confirm("你确定删除该司机信息？")){
				$.ajax({
		    		 url:'./mytask/delDriver',
		    		 data:{id:id},
		    		 success:function(msg){
		    			if(msg==1){
		    				alert("操作成功");
		 					loadHtml("./mytask/driverList");
		    			}else{
		    				alert("操作失败");
		    			}
	 					
		    		 }
		    	 });
			}
		}
	
		function loadpicture(cellvalue, options, rowObject){
	       	var html = '';
	  		html += '<img src=\''+rowObject.id_front_url +'\' style="height: 80px; width: 80px;">' ;
	   		return html;
	    }
		function loadpicture2(cellvalue, options, rowObject){
            var html = '';
            html += '<img src=\''+rowObject.id_back_url +'\' style="height: 80px; width: 80px;">' ;
            return html;
        }
		function loadpicture3(cellvalue, options, rowObject){
            var html = '';
            html += '<img src=\''+rowObject.driver_card_url +'\' style="height: 80px; width: 80px;">' ;
            return html;
        }
		
		function changeState(cellvalue, options, rowObject){
			var html = '';
			if(rowObject.state == 0){
				html += '未审核'; 
			}else if(rowObject.state == 1){
				html += '已审核'; 
			}else{
			    html += '审核被拒绝'; 
			}
			  return html;
		}
	

	</script>
</body>
</html>