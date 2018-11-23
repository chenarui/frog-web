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
                                url : './user/cashDetailJson?user_id='+user_id,
                                //data:{user_id:user_id},
                                type:'post',
                                datatype : "json",
                                 page:'${page}',
                                colModel : [  {
                                    label : '日期',
                                    name : 'add_time',
                                    width : 50,
                                    formatter : timeFmt,
                                }, {
                                    label : '账单内容',
                                    name : 'subject',
                                    width : 50
                                }, {
                                    label : '交易前余额',
                                    name : 'b_balance',
                                    width : 50
                                }, {
                                    label : '交易金额',
                                    name : 'price',
                                    width : 50
                                }, {
                                    label : '交易后余额',
                                    name : 'a_balance',
                                    width : 50
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
        
         
         function timeFmt(cellvalue, options, rowObject) {
             var html = '';
             var html = getLocalTime(rowObject.add_time / 1000);
             return html;
         }
         
         function getLocalTime(nS) {
             return new Date(parseInt(nS) * 1000).toLocaleString().replace(
                     /年|月/g, "-").replace(/日/g, " ");
         }
         
         

    </script>
</body>
</html>