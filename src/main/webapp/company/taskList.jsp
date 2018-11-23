<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row">

		<form class="form-horizontal" role="form">
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆类型</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="car_type" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车辆长度</label>
					<div class="col-sm-8">
						<input onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"
							id="phone" data-rel="tooltip" type="text"
							class="col-sm-10 searchKey" name="car_length"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">车载载重</label>
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
						for="form-field-6">车辆体积</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="car_volume" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">出发地城市</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="send_city" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">出发地区域</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="send_area" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">到达地城市</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="recive_city" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">到达地区域</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="text" class="col-sm-10 searchKey"
							name="recive_area" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
					<label class="col-sm-4 control-label no-padding-right"
						for="form-field-6">出发时间</label>
					<div class="col-sm-8">
						<input data-rel="tooltip" type="date" class="col-sm-10 searchKey"
							name="send_date" data-placement="bottom">
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
		/* $(document).ready(function () {
	    		var rowDataNames = [];
	            $("#grid-table").jqGrid({
	                url: './seachTask',
	                datatype: "json",
	                page:'${page}',
	                colModel: [
						{ label: '订单编号', name: 'order_id', width: 50 },
						{ label: '出发省份名称', name: 'send_province_name', width: 50 },
	                    { label: '出发城市名称', name: 'send_city_name', width: 50},
	                    { label: '出发区域名称', name: 'send_area_name', width: 50 },
	                    { label: '到达省份名称', name: 'recive_province_name', width: 50 },
	                    { label: '到达城市名称', name: 'recive_city_name', width: 50 },
	                    { label: '到达区域名称', name: 'recive_area_name', width: 50 },
	                    { label: '货物类型', name: 'cago_name', width: 50 },
	                    { label: '货物长度', name: 'cago_length', width: 50},
	                    { label: '货物数量', name: 'cago_num', width: 50},
	                    { label: '总重量', name: 'carry', width: 50},
	                    { label: '操作', width: 50 , formatter:changestatus}
	                ],
	                multiselect: true,
	                multiboxonly: true,
	                onSelectRow: function (rowId, status, e) {
	                	rowDataNames = [];
	                    var rowIds = jQuery("#jqGrid").jqGrid('getGridParam', 'selarrrow');
	                    $(rowIds).each(function(i,rowId){
	                        rowDataNames.push($("#jqGrid").jqGrid('getRowData',rowId))
	                    });
	                },
	                viewrecords: true, // show the current page, data rang and total records on the toolbar
					rowList:[10,20,30],
	                autowidth:true,
	                height: $(window).height()-300,
	                rowNum: 10,
	                pager: "#grid-pager",
	            	jsonReader: { root: 'rows', repeatitems: false ,page: "page",   // json中代表当前页码的数据  
	            	    records: "records", // json中代表数据行总数的数据 
	            	    total: "total"},
	            	loadComplete : function() {
							var table = this;
							setTimeout(function(){
								updatePagerIcons(table);
							}, 0);
						}
	            });
	            
		});
		
		$('[data-rel=tooltip]').tooltip({container:'body'});
        
        initButton([{
		        name: "查询", //这里是静态页的地址
		        click: function(){
		        	searchFrom('./company/seachcompany?');
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
       		html += '<button style="margin-left: 5px;margin-top: 5px;" class="btn btn-xs btn-primary" onclick="checkDetail(\''+rowObject.userid +'\')">查看详情</button>';
       		return html; 
     	}
        
        function handleAction(userid){
        	var bool = confirm("是否确认审核通过？");
        	if(bool == true){
	        	$.ajax({
	        		url:"./company/updatecompany",
	        		type:"post",
	        		data:{userid:userid},
	        		success:function(){
	        			jQuery("#grid-table").trigger('reloadGrid');
	        		}
	        	});	
        	}
        	return;
        }
        function changPrice(userid,balance) {
        			$('#orderid').val(userid);
        			$('#logistic').val(balance);
					$('#logisticnum').val(balance);
					$('.tipsOt').show();
		}
		
		function deliverGoods() {
			var orderid = $('#orderid').val();
			var logistic = $('#logistic').val().trim();
			var logisticnum = $('#logisticnum').val().trim();
			if (logisticnum == '') {
				alert("请输入余额！");
				return;
			}
			if (isNaN(logisticnum)) {
				alert("请输入数字！");
				return;
			}
			var dot = logisticnum.indexOf(".");
			if (dot != -1) {
				var dotCnt = logisticnum.substring(dot+1,logisticnum.length);
                if(dotCnt.length > 2){
                    alert("小数位已超过2位！");
                    return;
                }
			}
			var bool = confirm("是否确认？");
			var type = 3;
			if (logisticnum < logistic) {
				if(!bool){
					type = 4;
				return;
				}
			}
			$.ajax({
				url : './company/changPrice',
				data : {
					userid : orderid,
					type : type,
					balance : logisticnum
				},
				success : function(msg) {
					if (msg != null) {
						if (msg.code == 1) {
							alert(msg.message);
							loadHtml("./company/company");
						} else {
							alert(msg.message);
						}
					}
				}
			})
		}
		function cancel() {
			$('.tipsOt').hide();
		}
		
		 function checkDetail(id){
		 		$("#companyDetail").dialog("open");
		 		$.ajax({
		 			url:'./company/getcompanyByid',
		 			data:{userid:id},
		 			success:function(msg){
		 				console.log(msg);
		 				if(msg != null){
		 					$('#phoneH').val(msg.phone);
		 					$('#nicknameH').val(msg.nickname);
		 					$('#blicense_picH').attr("src",msg.blicense_picurl);
		 					$('#blicense_numH').val(msg.blicenseNum);
		 					$('#addressH').val(msg.address);
		 					$('#sexH').val(msg.sex);
		 					$('#birthdayH').val(msg.birthdayStr);
		 					$('#positionH').val(msg.position);
		 					$('#rnameH').val(msg.rname);
		 					$('#levelH').val(msg.level);
		 				}
		 			}
		 		})
		 	 }

			 $( "#companyDetail" ).dialog({
				    autoOpen : false,
				    height : 650,
				    width : 1000,
				    modal : true,
				    title : '',
				    buttons : {
				         "关闭" : function() {
				        	$("#companyDetail").dialog("close");
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
			 function goback(){
				 $("#companyDetail").dialog("close");
			 } */
		</script>

</body>
</html>