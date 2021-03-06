<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>智慧物流企业端</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- basic styles -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/dropzone.css" />
<link rel="stylesheet" href="assets/css/common.css">
<link rel="stylesheet" href="assets/css/sort.css">
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/css/styles.css">
<!--[if IE 7]>
	  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
	<![endif]-->

<!-- page specific plugin styles -->
<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
<!-- ace styles -->
<link rel="stylesheet" href="assets/css/ui.jqgrid.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<link rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet"
	href="css/bootstrap-datetimepicker.css" />

<!--[if lte IE 8]>
	  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
	<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->

<script src="assets/js/ace-extra.min.js"></script>
<script src="js/common.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body class="navbar-fixed ">
	<jsp:include page="top.jsp"></jsp:include>
	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>
			<jsp:include page="left.jsp"></jsp:include>
			<div class="main-content">
				<jsp:include page="breadcrumbs.jsp"></jsp:include>
				<div class="page-content">
					<!-- href-page-out -->
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->
		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!--[if !IE]> -->
	<!-- 	<script src="http://webapi.amap.com/maps?v=1.3&key=1e09caa94a6f4f1503e8970a6283cbc1"></script> -->
	<!-- <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&key=1e09caa94a6f4f1503e8970a6283cbc1"></script>  -->
	<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
	<!-- <![endif]-->
	<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
	<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>
	<script src="assets/js/dropzone.min.js"></script>
	<script src="assets/js/jquery-ui-1.10.3.full.min.js"></script>
	<!-- page specific plugin scripts -->
	<script src="assets/js/jqGrid/jquery.jqGrid.min.js"></script>
	<script src="assets/js/jqGrid/i18n/grid.locale-en.js"></script>
	<!-- ace scripts -->
	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>
	<script src="js/jQuery.md5.js"></script>
	<script src="js/ajaxfileupload.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		jQuery(function($) {
			var href = getarg(window.location.href);
			if(href){
				loadHtml(href);
				$(".nav-list a").each(function(){
					var datahref = $(this).attr("data-href");
					if(href==datahref){
						var obj = $(this).parent();
						obj.addClass("active");
						obj.parent().show();
						obj.parent().parent().addClass("open");
						var html = getHtml(obj,"");
						while(!obj.parent().hasClass("nav-list")){
							obj = obj.parent();
							html = getHtml(obj,html);
						}
						$(".breadcrumb").empty();
						$(".breadcrumb").append(html);
					}
				})
			}
			$(".nav-list").find("a").on("click",function(){
				if(!$(this).hasClass("dropdown-toggle")){
					var url = $(this).attr("data-href");
					$('.ui-dialog').remove();
					loadHtml(url);
					$(".nav-list").children("li").each(function(){
						if(!$(this).children("a").hasClass("dropdown-toggle")){
							$(this).removeClass("active");
						}
						$(this).find("li.active").removeClass("active");
					});
					$(this).parent().addClass("active");
					var obj = $(this).parent();
					var html = getHtml(obj,"");
					while(!obj.parent().hasClass("nav-list")){
						obj = obj.parent();
						html = getHtml(obj,html);
					}
					$(".breadcrumb").empty();
					$(".breadcrumb").append(html);
				}
			})
		})
	
		</script>
</body>
</html>