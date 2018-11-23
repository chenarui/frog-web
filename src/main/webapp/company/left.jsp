<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="./js/jquery-1.11.3.min.js"></script>
<div class="sidebar sidebar-fixed" id="sidebar">
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {
		}
	</script>

	<ul class="nav nav-list">
		<li id="yonghu"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-user"></i> <span class="menu-text">任务大厅</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="qianduanyonghu"><a href="#./taskList"
					data-href="./taskList"> <i class="icon-double-angle-right"></i>
						任务大厅
				</a></li>
			</ul></li>
		<!-- 		<li id="dingdan"> -->
		<!-- 			<a data-href="#" class="dropdown-toggle"> -->
		<!-- 				<i class="icon-book"></i> -->
		<!-- 				<span class="menu-text">任务管理</span> -->
		<!-- 				<b class="arrow icon-angle-down"></b> -->
		<!-- 			</a> -->
		<!-- 			<ul class="submenu"> -->
		<!-- 				<li id="dingdanyibiaopan"> -->
		<!-- 					<a href="#./taskManage" data-href="./taskManage"> -->
		<!-- 						<i class="icon-double-angle-right"></i> -->
		<!-- 						任务列表 -->
		<!-- 					</a> -->
		<!-- 				</li> -->
		<!-- 			</ul> -->
		<!-- 		</li> -->
		<li id="woderenwu"><a data-href="#" class="dropdown-toggle">
				<i class="icon-money"></i> <span class="menu-text">我的任务</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="jiangjinchi"><a href="#./mytask/notBegin"
					data-href="./mytask/notBegin"> <i
						class="icon-double-angle-right"></i> 未开始
				</a></li>
				<li id="jiangjinchi"><a href="#./mytask/ongoing"
					data-href="./mytask/ongoing"> <i
						class="icon-double-angle-right"></i> 进行中
				</a></li>
				<li id="shourumingxi"><a href="#./mytask/completed"
					data-href="./mytask/completed"> <i
						class="icon-double-angle-right"></i> 已完成
				</a></li>
				<li id="zhichumingxi"><a href="#./mytask/dispute"
					data-href="./mytask/dispute"> <i
						class="icon-double-angle-right"></i> 争议中
				</a></li>
				<!-- 				<li id="tixianshenqing"> -->
				<!-- 					<a href="#./cash/withdrawList" data-href="./cash/withdrawList"> -->
				<!-- 						<i class="icon-double-angle-right"></i> -->
				<!-- 						提现申请 -->
				<!-- 					</a> -->
				<!-- 				</li> -->
			</ul></li>
		<li id="cheliang"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-truck"></i> <span class="menu-text">我的账户</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="chelaingleixing"><a href="#./cash/cashList"
					data-href="./cash/cashList"> <i class="icon-double-angle-right"></i>
						提现
				</a></li>
			</ul></li>
		<li id="fankui"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-comments"></i> <span class="menu-text">我的信息</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="yonghuliuyan"><a href="#./companyInfo"
					data-href="./companyInfo"> <i class="icon-double-angle-right"></i>
						企业基本信息
				</a></li>
				<li id="yonghuliuyan"><a href="#./carInfo"
					data-href="./carInfo"> <i class="icon-double-angle-right"></i>
						车辆信息
				</a></li>
				<li id="sijiliuyan"><a href="#./mytask/driverList"
					data-href="./mytask/driverList"> <i
						class="icon-double-angle-right"></i> 司机信息
				</a></li>
			</ul></li>
		<li id="xiaoxi"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-envelope"></i> <span class="menu-text">我的评价</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="yonghutuisong"><a href="#./mytask/myEval"
					data-href="./mytask/myEval"> <i class="icon-double-angle-right"></i>
						我的评价
				</a></li>
				<li id="sijituisong"><a href="#./mytask/evalMy"
					data-href="./mytask/evalMy"> <i class="icon-double-angle-right"></i>
						评价我的
				</a></li>
			</ul></li>
		<li id="xitong"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-cogs"></i> <span class="menu-text">我的站内信</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="fenchengbili"><a href="#./mytask/sysMessage"
					data-href="./mytask/sysMessage"> <i
						class="icon-double-angle-right"></i> 系统通知
				</a></li>
				<!-- 				<li id="yognhupingjia"> -->
				<!-- 					<a href="#./config/userEval" data-href="./config/userEval"> -->
				<!-- 						<i class="icon-double-angle-right"></i> -->
				<!-- 						用户端评价标签配置 -->
				<!-- 					</a> -->
				<!-- 				</li> -->
				<!-- 				<li id="yonghutousu"> -->
				<!-- 					<a href="#./config/userComplain" data-href="./config/userComplain"> -->
				<!-- 						<i class="icon-double-angle-right"></i> -->
				<!-- 						用户端投诉标签配置 -->
				<!-- 					</a> -->
				<!-- 				</li> -->
				<!-- 				<li id="sijipinggjia"> -->
				<!-- 					<a href="#./config/driverEval" data-href="./config/driverEval"> -->
				<!-- 						<i class="icon-double-angle-right"></i> -->
				<!-- 						司机端评价标签配置 -->
				<!-- 					</a> -->
				<!-- 				</li> -->
			</ul></li>
		<li id="xiaoxi"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-envelope"></i> <span class="menu-text">系统设置</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="yonghutuisong"><a href="#./changepasswordJSP"
					data-href="./changepasswordJSP"> <i
						class="icon-double-angle-right"></i> 修改密码
				</a></li>
				<li id="sijituisong"><a href="#./feedback"
					data-href="./feedback"> <i class="icon-double-angle-right"></i>
						意见反馈
				</a></li>
			</ul></li>
	</ul>
	<!-- /.nav-list -->

	<div class="sidebar-collapse" id="sidebar-collapse">
		<i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
			data-icon2="icon-double-angle-right"></i>
	</div>

	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {
		}
		
		/* $('li').css("display","none"); */
		$("#haunying").css("display","block");
		$("#dengchu").css("display","block");
		/* //$("#dengchuul").css("display","block");
	      // $(document).ready(function () {
        	  var ids = new Array;
             <c:forEach items="${sessionScope.list}" var="p">
             ids.push('${p.getModel_id()}');
             </c:forEach>
             //console.log(ids);
             if (ids.length != 0) {
                 for(var i = 0;i < ids.length;i++){
                     if(ids[i] == 1 || ids[i] == 2 || ids[i] == 3){
                         $('#yonghu').show();
                     }
                     if(ids[i] == 2){
                         $('#qianduanyonghu').show();
                     }
                     if(ids[i] == 3){
                         $('#houtaiyonghu').show();
                     }
                     if(ids[i] == 4 || ids[i] == 5 || ids[i] == 6){
                         $('#siji').show();
                     }
                     if(ids[i] == 5){
                         $('#sijiguanli').show();
                     }
                     if(ids[i] == 6){
                         $('#cheliangguanli').show();
                     }
                     if(ids[i] == 7 || ids[i] == 8 || ids[i] == 9){
                         $('#dingdan').show();
                     }
                     if(ids[i] == 8){
                         $('#dingdanyibiaopan').show();
                     }
                     if(ids[i] == 9){
                         $('#dingdanliebiao').show();
                     }
                     if(ids[i] == 10 || ids[i] == 11 || ids[i] == 12 || ids[i] == 13 || ids[i] == 14){
                         $('#xianjin').show();
                     }
                     if(ids[i] == 11){
                         $('#jiangjinchi').show();
                     }
                     if(ids[i] == 12){
                         $('#shourumingxi').show();
                     }
                     if(ids[i] == 13){
                         $('#zhichumingxi').show();
                     }
                     if(ids[i] == 14){
                         $('#tixianshenqing').show();
                     }
                     if(ids[i] == 15 || ids[i] == 16 || ids[i] == 17){
                         $('#cheliang').show();
                     }
                     if(ids[i] == 16){
                         $('#chelaingleixing').show();
                     }
                     if(ids[i] == 17){
                         $('#cheliangshuxing').show();
                     }
                     if(ids[i] == 18 || ids[i] == 19 || ids[i] == 20){
                         $('#fankui').show();
                     }
                     if(ids[i] == 19){
                         $('#yonghuliuyan').show();
                     }
                     if(ids[i] == 20){
                         $('#sijiliuyan').show();
                     }
                     if(ids[i] == 21 || ids[i] == 22 || ids[i] == 23){
                         $('#xiaoxi').show();
                     }
                     if(ids[i] == 22){
                         $('#yonghutuisong').show();
                     }
                     if(ids[i] == 23){
                         $('#sijituisong').show();
                     }
                     if(ids[i] == 24 || ids[i] == 25 || ids[i] == 26 || ids[i] == 27 || ids[i] == 28){
                         $('#xitong').show();
                     }
                     if(ids[i] == 25){
                         $('#fenchengbili').show();
                     }
                     if(ids[i] == 26){
                         $('#yognhupingjia').show();
                     }
                     if(ids[i] == 27){
                         $('#yonghutousu').show();
                     }
                     if(ids[i] == 28){
                         $('#sijipinggjia').show();
                     }
                     
                }
             } 
       // }); */
	</script>
</div>