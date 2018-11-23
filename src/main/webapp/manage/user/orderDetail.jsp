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
                    var user_id = ${user_id};
                    console.log(user_id);
                    $("#grid-table").jqGrid(
                            {
                                //url : './user/orderDetailJson',
                                url : './user/orderDetailJson?user_id='+user_id,
                                //data:{user_id:user_id},
                                type:'post',
                                datatype : "json",
                                 page:'${page}',
                                colModel : [ {
                                    label : '订单号',
                                    name : 'order_num',
                                    width : 50
                                }, {
                                    label : '发货人',
                                    name : 'send_name',
                                    width : 50
                                }, {
                                    label : '发货人手机',
                                    name : 'send_phone',
                                    width : 50
                                }, {
                                    label : '发货地址',
                                    name : 'send_address',
                                    width : 50
                                }, {
                                    label : '发货时间',
                                    name : 'send_time',
                                    width : 50,
                                    formatter : timeFmt,
                                }, {
                                    label : '收货人',
                                    name : 'recive_name',
                                    width : 50
                                }, {
                                    label : '收货人手机',
                                    name : 'recive_phone',
                                    width : 50
                                }, {
                                    label : '收货地址',
                                    name : 'recive_address',
                                    width : 50
                                }, {
                                    label : '收货时间',
                                    name : 'recive_time',
                                    width : 50,
                                    formatter : timeFmt2,
                                }, {
                                    label : '司机名称',
                                    name : 'driverName',
                                    width : 50
                                },{
                                    label : '司机电话',
                                    name : 'driverPhone',
                                    width : 50
                                }, {
                                    label : '状态',
                                    name : 'state',
                                    width : 50,
                                    formatter :changeState
                                },{
                                    label : '是否投诉',
                                    name : 'is_complain',
                                    width : 50,
                                    formatter :changeComplain
                                },{
                                    label : '是否打款',
                                    name : 'is_pay',
                                    width : 50,
                                    formatter :changePay
                                }, ],
                                multiselect : true,
                                multiboxonly : true,
                           /*      onSelectRow : function(rowId, status, e) {
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

                    $('[data-rel=tooltip]').tooltip({
                        container : 'body'
                    });

                    initButton([ {
                        name : "返回",
                        click : function() {
                            loadHtml("./user/userList");
                        }
                    } ])
                });

       /*  function operate(cellvalue, options, rowObject) {
            var html = '';
            html += '<button class="btn btn-xs btn-primary" onclick="detail(\''
                + rowObject.orderid + '\')" style="margin-right:10px;">查看详情</button>';
            return html;
        }
        function detail(id){
            loadHtml("./driver/driverDetail?driver_id="+id);
        }
         */
        function changeState(cellvalue, options, rowObject) {
            var html = '';
            if (rowObject.state == 0) {
                html = '未达成';
            } else if(rowObject.state == 1) {
                html = '未开始';
            }else if(rowObject.state == 2) {
                html = '运输中';
            }
            else if(rowObject.state == 3) {
                html = '已完成';
            }
            else if(rowObject.state == 4) {
                html = '已取消';
            }else if(rowObject.state == 5) {
                html = '已关闭';
            }
            return html;
        }
         
         function changeComplain(cellvalue, options, rowObject) {
             var html = '';
             if (rowObject.is_complain == 0) {
                 html = '未投诉';
             } else if(rowObject.is_complain == 1) {
                 html = '投诉中';
             }
             return html;
         }
         
         function changePay(cellvalue, options, rowObject) {
             var html = '';
             if (rowObject.is_pay == 0) {
                 html = '未打款';
             } else if(rowObject.is_pay == 1) {
                 html = '已打款';
             }
             return html;
         }
         
         function timeFmt(cellvalue, options, rowObject) {
        	 var html = '';
        	 var html = getLocalTime(rowObject.send_time / 1000);
             return html;
         }
         function timeFmt2(cellvalue, options, rowObject) {
             var html = '';
             var html = getLocalTime(rowObject.recive_time / 1000);
             return html;
         }
         
         function getLocalTime(nS) {
             return new Date(parseInt(nS) * 1000).toLocaleString().replace(
                     /年|月/g, "-").replace(/日/g, " ");
         }
         
         

    </script>
</body>
</html>