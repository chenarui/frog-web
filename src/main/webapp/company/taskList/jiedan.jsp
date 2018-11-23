<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<script type="text/javascript">
		 $(document).ready(function () {
	    		var rowDataNames = [];
	            $("#grid-table").jqGrid({
	                url: './getDrivers?orderid='+'${order}',
	                datatype: "json",
	                page:'${page}',
	                colModel: [
						{ label: '司机编号', name: 'driver_id', width: 150 },
						{ label: '姓名', name: 'name', width: 150 },
	                    { label: '手机号码', name: 'phone', width: 150},
	                    { label: '身份证号码', name: 'id_card', width: 150 },
	                    { label: '性别', name: '', width: 150 ,formatter:sexstatus},
	                    { label: '操作', width: 200 , formatter:changestatus}
	                ],
	                multiselect : false,
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
	            
		}); 
		
		 $('[data-rel=tooltip]').tooltip({
				container : 'body'
			});
        
        initButton([{
		        name: "返回", //这里是静态页的地址
		        click: function(){
		        	var flag = '${flag}';
		        	var id= '${order}';
		        	console.log(flag);
		        	console.log(id);
		        	if(flag == 1){
		        		loadHtml('./checkDetail?orderid='+id);
		        	}else{
		        		loadHtml('./taskList');
		        	}
		        }	
			}])
		
		function status(cellvalue, options, rowObject){
   			if(rowObject.reviewstate==0){
   				return "已审核";
   			}
   			if(rowObject.reviewstate==1){
   				return "未审核";
   			}
   		}
		
        function changestatus(cellvalue, options, rowObject){	
     		var html = '';
       		html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="checkDetail(\''+rowObject.driver_id +'\')">查看详情</button>';
       		html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="checkDetail(\''+rowObject.driver_id +'\')">派单</button>';
       		return html; 
     	}
		
        function checkDetail(driverid){
        	loadHtml('./checkDriverDetail?driverid='+driverid+"&orderid="+'${order}');
        }
        
        function getOrder(orderid){
        	$.ajax({
		  		url:'./getDrivers',
		  		data:{orderid:orderid},
		  		async:false,
		  		success:function(msg){
		  			 $('#chooseDriver').empty();
		  			 html = '';
		  			 if(msg){
		  				 for(var i = 0 ;i<msg.length;i++){
		  					 /**
		  					 <div class=" col-sm-3">
								<div class=" form-xs form-group row">
									<label for="addGrade" class="col-xs-4 control-label">司机2</label>
										<button class="btn btn-xs btn-primary">选择</button>
								</div>
							</div>	
		  					 */
		  					 html += '<div class=" col-sm-5">';
		  					 html += '<div class=" form-xs form-group row">';
		  					 html += '<label for="addGrade" class="col-xs-5 control-label">司机：'+msg[i].name+'</label>';
		  					 html += '<button class="btn btn-xs btn-primary" onclick="choose(\''+orderid+ '\'\,\''+msg[i].driver_id+'\'\,\''+msg[i].listcar+'\')">选择车辆</button>';
		  					 html += '</div></div>';
		  				 }
		  			 }
		  			$('#chooseDriver').append(html);
   		 		}
   			 }); 
        	$("#chooseDriver").dialog("open");
        	
        }
        function choose(orderid,driverid,listcar){
       		 $.ajax({
		   		 url:'./getOrder',
		   		 data:{orderid:orderid,driverid:driverid},
		   		 success:function(msg){
		   			if(msg.c == 1){
		   				alert(msg.m);
							return;
		   			}
		   			alert(msg.m);
		   			loadHtml("./taskList");
   				 }
   		 	}); 
        }
        
        $( "#chooseDriver" ).dialog({
		    autoOpen : false,
		    height : 650,
		    width : 1000,
		    modal : true,
		    title : '',
		    buttons : {
		         "关闭" : function() {
		        	$("#chooseDriver").dialog("close");
		        } 
		    },
		    show: {
		        effect: "blind",
		        duration: 100
		    },
		    hide: {
		        effect: "blind",
		        duration: 50
		    }
		});
        
        function sexstatus(cellvalue, options, rowObject){
        	if(rowObject.sex == 1){
        		return '男';
        	}
        	if(rowObject.sex == 2){
        		return '女';
        	}
        }
		</script>
</body>
</html>