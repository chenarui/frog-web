<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div class="row">
		<div class="col-xs-12">
			<div class="form-group">
				<label Style="text-align: center; margin-left: -2%;"
					class="col-sm-1 control-label no-padding-right" for="form-field-6">我的评分</label>
				<div class="col-sm-2" style="margin-top: 5px; font-weight: bold;">
					<fmt:formatNumber type="number" value="${avg}" pattern="0.0"
						maxFractionDigits="1" />
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="form-group"></div>
		</div>
		<div class="col-xs-12">
			<div class="form-group">
				<c:forEach items="${set}" var="p">
					<label Style="text-align: center; margin-right: 20px;"
						class="btn btn-xs btn-primary" for="form-field-6">${p}</label>
				</c:forEach>
			</div>
		</div>
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
                                url : './mytask/evalMyJson',
                                datatype : "json",
                                 page:'${page}',
                                 colModel: [
                                            { label: '订单号', name: 'order_num', width: 200},
                                            { label: '日期', name: 'add_time', width: 200,formatter : timeFmt },
                                            { label: '评价内容', name: 'content', width: 800},
                                            { label: '评价标签', name: 'tag', width: 250},
                                            { label: '评价人', name: 'name', width: 100},
                                            { label: '评分', name: 'point',width: 100, }
                                        ],
                                multiselect : false,
                                multiboxonly : true,
                                sortable:true,
                                rownumbers:true,
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

//                      initButton([ {
//                          name : "查询",
//                          click : function() {
//                              searchFrom('./mytask/ongoingJson?');
//                          }
//                      } ])
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
        
    
        function timeFmt(cellvalue, options, rowObject) {
            var html = getLocalTime(rowObject.add_time / 1000);

            return html;
        }
        
        function timeFmt2(cellvalue, options, rowObject) {
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