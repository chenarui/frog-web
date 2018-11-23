<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.driver_pic1 {
	width: 314px;
	height: 171px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">序号</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.driver_id}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">姓名</label>
				<div class="col-sm-2" style="margin-top: 5px;">${driver.name}
				</div>
			</div>
		</div>

		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">身份证号</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.id_card}</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">身份证照片</label>
				<div class="col-sm-2 driver_pic1" style="margin-top: 5px;">
					<img src=${driver.id_front_url } style="height: 100%; width: 100%;">
				</div>
				<div class="col-sm-2 driver_pic1"
					style="margin-top: 5px; margin-left: 50px">
					<img src=${driver.id_back_url } style="height: 100%; width: 100%;">
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">驾驶证照片</label>
				<div class="col-sm-2 driver_pic1" style="margin-top: 10px;">
					<img src=${driver.driver_card_url
						} style="height: 100%; width: 100%;">
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">手机</label>
				<div class="col-sm-2" style="margin-top: 5px;">
					${driver.phone}</div>
			</div>
		</div>


		<!--         <div class="col-xs-12" > -->
		<!--             <div class="form-group"> -->
		<!--                 <label Style="text-align: left;font-weight: bold;" class="col-sm-1 control-label no-padding-right" for="form-field-6">状态</label> -->
		<!--                 <div class="col-sm-2" style="margin-top: 5px;"> -->
		<%--                    ${driver.stateStr} --%>
		<!--                 </div> -->
		<!--             </div> -->
		<!--         </div> -->
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: left; font-weight: bold;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">所有车辆</label>
			</div>
		</div>
		<form class="form-horizontal" role="form"></form>
		<div class="col-xs-12" style="margin-left: 10px">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
	    $(document).ready(function () {
	    	var id = '${id}';
	    	console.log(id);
	        var rowDataNames = [];
	         $('[data-rel=tooltip]').tooltip({container:'body'});
             $("#grid-table").jqGrid(
                     {
                         url : './mytask/driverDetailJson?id='+id,
                         datatype : "json",
                          page:'${page}',
                         colModel : [ {
                             label : '序号',
                             name : 'car_id',
                             width : 160,
                             sortable:false
                         }, 
                         {
                             label : '车牌号',
                             name : 'car_number',
                             width : 160,
                             sortable:false
                         },
                         {
                             label : '品牌',
                             name : 'brand_name',
                             width : 160,
                             sortable:false
                         }, {
                             label : '车型',
                             name : 'type_name',
                             width : 160,
                             sortable:false
                         }, {
                             label : '吨位/(吨)',
                             name : 'car_carry',
                             width : 160,
                             sortable:false
                         }, {
                             label : '车长/(米)',
                             name : 'car_length',
                             width : 160,
                             sortable:false
                         } ,{
                             label : '容积/(立方米)',
                             name : 'car_volume',
                             width : 160,
                             sortable:false
                         },],
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

           


	         initButton([{
	             name: "返回", //这里是静态页的地址
	             click: function(){
	                 loadHtml("./mytask/driverList");
	             }
	         }
	         ])
	 });
	    function changestate(id){
			var state = 1;
			var reason = "";
			$.ajax({
	    		 url:'./driver/changestate',
	    		 data:{id:id,state:state,reason:reason},
	    		 success:function(msg){
	    			if(msg==1){
	    				alert("操作成功");
	 					loadHtml("./driver/driverList");
	    			}else{
	    				alert("操作失败");
	    			}
 					
	    		 }
	    	 });
		}
		function changestate1(id){
			$('#editHidden2').val(id);
			$("#editMoneyDiv2").dialog("open");
		}
		$("#editMoneyDiv2").dialog({
		    autoOpen : false,
		    height : 200,
		    width : 500,
		    modal : true,
		    title : '未通过原因',
		    buttons : {
		        "确定" : function() {
		        	var state = 2;
					var reason = $('#editRiderMoney2').val();
		        	var id =  $('#editHidden2').val();
		        	$.ajax({
			    		 url:'./driver/changestate',
			    		 data:{id:id,state:state,reason:reason},
			    		 success:function(msg){
			    			if(msg==1){
			    				alert("操作成功");
			 					$("#editMoneyDiv2").dialog("close");
			 					loadHtml("./driver/driverList");
			    			}else{
			    				alert("操作失败");
			    			}
		 					
			    		 }
			    	 })
			        } ,
		         "取消" : function() {
		        	$("#editMoneyDiv2").dialog("close");
		        }
		    },
		  
	 });
    </script>
</body>
</html>