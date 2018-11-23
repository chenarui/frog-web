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
				class="icon-user"></i> <span class="menu-text">用户管理</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="qianduanyonghu"><a href="#./user/userList"
					data-href="./user/userList"> <i class="icon-double-angle-right"></i>
						前端用户管理
				</a></li>
				<li id="houtaiyonghu"><a href="#./admin/userList"
					data-href="./admin/userList"> <i
						class="icon-double-angle-right"></i> 后台用户管理
				</a></li>
			</ul></li>
		<li id="siji"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-user"></i> <span class="menu-text">司机管理</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="sijiguanli"><a href="#./driver/driverList"
					data-href="./driver/driverList"> <i
						class="icon-double-angle-right"></i> 司机管理
				</a></li>
				<li id="cheliangguanli"><a href="#./driver/carList"
					data-href="./driver/carList"> <i
						class="icon-double-angle-right"></i> 车辆管理
				</a></li>
			</ul></li>
		<li id="gongsi"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-user"></i> <span class="menu-text">公司管理</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="gongsiguanli"><a href="#./company/companyList"
					data-href="./company/companyList"> <i
						class="icon-double-angle-right"></i> 公司管理
				</a></li>
			</ul></li>
		<li id="dingdan"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-book"></i> <span class="menu-text">订单管理</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="dingdanyibiaopan"><a href="#./order/orderChart"
					data-href="./order/orderChart"> <i
						class="icon-double-angle-right"></i> 订单仪表盘
				</a></li>
				<li id="dingdanliebiao"><a href="#./order/orderList"
					data-href="./order/orderList"> <i
						class="icon-double-angle-right"></i> 订单列表
				</a></li>
			</ul></li>
		<li id="xianjin"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-money"></i> <span class="menu-text">现金管理</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="jiangjinchi"><a href="#./cash/cashPool"
					data-href="./cash/cashPool"> <i class="icon-double-angle-right"></i>
						资金池
				</a></li>
				<li id="shourumingxi"><a href="#./cash/incomeList"
					data-href="./cash/incomeList"> <i
						class="icon-double-angle-right"></i> 收入明细
				</a></li>
				<li id="zhichumingxi"><a href="#./cash/expendList"
					data-href="./cash/expendList"> <i
						class="icon-double-angle-right"></i> 支出明细
				</a></li>
				<li id="tixianshenqing"><a href="#./cash/withdrawList"
					data-href="./cash/withdrawList"> <i
						class="icon-double-angle-right"></i> 司机提现申请
				</a></li>
				<li id="gongsitixianshenqing"><a
					href="#./cash/wcompanyWithdrawList"
					data-href="./cash/companyWithdrawList"> <i
						class="icon-double-angle-right"></i> 公司提现申请
				</a></li>
			</ul></li>
		<li id="cheliang"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-truck"></i> <span class="menu-text">车辆配置</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="chelaingleixing"><a href="#./car/carType"
					data-href="./car/carType"> <i class="icon-double-angle-right"></i>
						车辆类型配置
				</a></li>
				<li id="cheliangshuxing"><a href="#./car/carProperty"
					data-href="./car/carProperty"> <i
						class="icon-double-angle-right"></i> 车辆属性搜索配置
				</a></li>
			</ul></li>
		<li id="fankui"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-comments"></i> <span class="menu-text">反馈管理</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="yonghuliuyan"><a href="#./user/feedback"
					data-href="./user/feedback"> <i class="icon-double-angle-right"></i>
						用户留言反馈
				</a></li>
				<li id="sijiliuyan"><a href="#./driver/feedback"
					data-href="./driver/feedback"> <i
						class="icon-double-angle-right"></i> 司机留言反馈
				</a></li>
				<li id="qiyefankui"><a href="#./user/feedbackCpy"
					data-href="./user/feedbackCpy"> <i
						class="icon-double-angle-right"></i> 企业留言反馈
				</a></li>
			</ul></li>
		<li id="xiaoxi"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-envelope"></i> <span class="menu-text">消息列表</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="yonghutuisong"><a href="#./user/pushList"
					data-href="./user/pushList"> <i class="icon-double-angle-right"></i>
						用户端推送记录
				</a></li>
				<li id="sijituisong"><a href="#./driver/pushList"
					data-href="./driver/pushList"> <i
						class="icon-double-angle-right"></i> 司机推送记录
				</a></li>
			</ul></li>
		<li id="xitong"><a data-href="#" class="dropdown-toggle"> <i
				class="icon-cogs"></i> <span class="menu-text">系统配置</span> <b
				class="arrow icon-angle-down"></b>
		</a>
			<ul class="submenu">
				<li id="fenchengbili"><a href="#./config/division"
					data-href="./config/division"> <i
						class="icon-double-angle-right"></i> 分成比例配置
				</a></li>
				<li id="yognhupingjia"><a href="#./config/userEval"
					data-href="./config/userEval"> <i
						class="icon-double-angle-right"></i> 用户端评价标签配置
				</a></li>
				<li id="yonghutousu"><a href="#./config/userComplain"
					data-href="./config/userComplain"> <i
						class="icon-double-angle-right"></i> 用户端投诉标签配置
				</a></li>
				<li id="sijipinggjia"><a href="#./config/driverEval"
					data-href="./config/driverEval"> <i
						class="icon-double-angle-right"></i> 司机端评价标签配置
				</a></li>
				<li id="tixianyinhang"><a href="#./config/bank"
					data-href="./config/bank"> <i class="icon-double-angle-right"></i>
						可提现银行标签配置
				</a></li>
				<li id="chongzhiwenan"><a href="#./config/recharge"
					data-href="./config/recharge"> <i
						class="icon-double-angle-right"></i> 充值文案配置
				</a></li>
				<li id="yonghuxinxi"><a href="#./config/aboutUser"
					data-href="./config/aboutUser"> <i
						class="icon-double-angle-right"></i> 关于用户端信息配置
				</a></li>
				<li id="sijixinxi"><a href="#./config/aboutDriver"
					data-href="./config/aboutDriver"> <i
						class="icon-double-angle-right"></i> 关于司机端信息配置
				</a></li>
				<li id="yonghuxieyi"><a href="#./config/userAgreement"
					data-href="./config/userAgreement"> <i
						class="icon-double-angle-right"></i> 关于用户端用户协议配置
				</a></li>
				<li id="fuwuxieyi"><a href="#./config/serviceAgreement"
					data-href="./config/serviceAgreement"> <i
						class="icon-double-angle-right"></i> 关于货物托运服务协议配置
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
		
		$('li').css("display","none");
		$("#haunying").css("display","block");
		$("#dengchu").css("display","block");
		//$("#dengchuul").css("display","block");
	       $(document).ready(function () {
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
                     if(ids[i] == 30 || ids[i] == 31){
                         $('#gongsi').show();
                     }
                     if(ids[i] == 31){
                         $('#gongsiguanli').show();
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
                     if(ids[i] == 10 || ids[i] == 11 || ids[i] == 12 || ids[i] == 13 || ids[i] == 14 || ids[i] == 29){
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
                     if(ids[i] == 29){
                         $('#gongsitixianshenqing').show();
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
                     if(ids[i] == 18 || ids[i] == 19 || ids[i] == 20 || ids[i] == 36){
                         $('#fankui').show();
                     }
                     if(ids[i] == 19){
                         $('#yonghuliuyan').show();
                     }
                     if(ids[i] == 20){
                         $('#sijiliuyan').show();
                     }
                     if(ids[i] == 36){
                         $('#qiyefankui').show();
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
                     if(ids[i] == 24 || ids[i] == 25 || ids[i] == 26 || ids[i] == 27 || ids[i] == 28 || ids[i] == 32 || ids[i] == 33
                    		 || ids[i] == 34 || ids[i] == 35 || ids[i] == 37 ){
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
                     if(ids[i] == 32){
                         $('#tixianyinhang').show();
                     }
                     if(ids[i] == 33){
                         $('#chongzhiwenan').show();
                     }
                     if(ids[i] == 34){
                         $('#yonghuxinxi').show();
                     }
                     if(ids[i] == 35){
                         $('#sijixinxi').show();
                     }
                     if(ids[i] == 37){
                         $('#yonghuxieyi').show();
                     }
                     if(ids[i] == 38){
                         $('#fuwuxieyi').show();
                     }
                     
                }
             }
        });
	</script>
</div>