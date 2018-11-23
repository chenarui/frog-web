<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row">
		<form class="form-horizontal" role="form">
			<input type="hidden" name="flag" value="1">

			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">品牌</label>
					<div class="col-sm-8">
						<input id="phone" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="brand_name"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车牌号</label>
					<div class="col-sm-8">
						<input id="phone" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="car_number"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆长度</label>
					<div class="col-sm-8">
						<input id="phone" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="car_length"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆载重</label>
					<div class="col-sm-8">
						<input id="level" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="car_carry"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆容积</label>
					<div class="col-sm-8">
						<input id="level" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="car_volume"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆类型</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="car_type" title="" data-placement="bottom" id="car_type">
							<option value="">请选择</option>
							<c:forEach items="${cList }" var="l">
								<option value="${l.name }">${l.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6" style="font-weight: bold">是否审核</label>
					<div class="col-sm-8">
						<select data-rel="tooltip" class="col-sm-10 searchKey"
							name="state" title="" data-placement="bottom" id="state">
							<option value="">请选择</option>
							<option value="1">未审核</option>
							<option value="2">已审核</option>
						</select>
					</div>
				</div>
			</div>

		</form>
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
	    		var ids = [];
	            $("#grid-table").jqGrid({
	                url: './seachCarInfo',
	                datatype: "json",
	                page:'${page}',
	                colModel: [
						{ label: '车牌号', name: 'car_number', width: 150 },
						{ label: '品牌', name: 'brand_name', width: 150 },
	                    { label: '车型', name: 'type_name', width: 200},
	                    { label: '车长/(米)', name: 'car_length', width: 150 },
	                    { label: '载重/(吨)', name: 'car_carry', width: 150 },
	                    { label: '容积/(立方米)', name: 'car_volume', width: 150 },
	                    { label: '司机', name: 'driverName', width: 150 },
	                    { label: '行驶证', width: 150, formatter:loadpicture },
	                    { label: '是否审核', name : 'state',width: 150, formatter: usertype },
	                    { label: '操作', width: 200 , formatter:changestatus},
	                    { label: '', hidden:true,name: 'driver_id', width: 150 },
	                ],
	                multiselect : true,
					multiboxonly : true,
					rownumbers:true,
					 onSelectRow : function(rowId, status, e) {
                         ids = [];
                         var rowIds = jQuery("#grid-table").jqGrid(
                                 'getGridParam', 'selarrrow');
                         $(rowIds).each(
                                 function(i, rowId) {
                                     ids.push($("#grid-table").jqGrid('getRowData',rowId).driver_id)
                         });
                     },
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
	        
	        initButton([{
			        name: "查询", //这里是静态页的地址
			        click: function(){
			        	searchFrom('./seachCar?');
			        }
	        },
	        {
	             name: "新增", //这里是静态页的地址
	             click: function(){
	                if(ids.length > 1 || ids.length == 0){
	                	alert("请选择一位司机");
	                	return;
	                }
	                loadHtml("./mytask/addCar?driver_id="+ids[0]+'&flag=0');
	             }
			        
				}])
	            
		}); 
		
	
		
        function changestatus(cellvalue, options, rowObject){	
     		var html = '';
       		html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="checkDetail(\''+rowObject.car_id +'\')">查看详情</button>';
       		html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="checkDetail(\''+rowObject.car_id +'\')">修改</button>';
       		return html; 
     	}
		
      //加载图片
	    function loadpicture(cellvalue, options, rowObject){
	       	var html = '';
	  		html += '<img src=\''+rowObject.drive_license_url +'\' style="height: 100px; width: 100px;">' ;
	   		return html;
	    }
      	
	    function checkDetail(carid){
	    	loadHtml('./carDetail?car_id='+carid);
	    }
	    
	    
        function usertype(cellvalue, options, rowObject) {
            var html = '';
            if (rowObject.state == 2) {
                html = '已审核';
            } else if(rowObject.state == 1){
                html = '未审核';
            }else{
            }
            return html;
        }
		</script>
</body>
</html>