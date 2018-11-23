<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.upload {
	padding: 4px 10px;
	height: 20px;
	line-height: 20px;
	position: relative;
	border: 1px solid #999;
	text-decoration: none;
	color: #666;
	margin-left: 21px;
}

.change {
	position: absolute;
	overflow: hidden;
	right: 0;
	top: 0;
	opacity: 0;
	width: 100px;
}

.fanmian {
	position: absolute;
	top: 0px;
	text-align: left;
	right: 16%;
}
</style>
</head>
<body>
	<div class="row">
		<input type="hidden" id="Huploadfile3" value="${company.id_back }" />
		<input type="hidden" id="Huploadfile2" value="${company.id_front }" />
		<input type="hidden" id="Huploadfile1" value="${company.company_pic}" />
		<input type="hidden" id="Huploadfile4" value="${company.logo}" />
		<form class="form-horizontal" role="form">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">企业名称</label>
					<div class="col-sm-9">
						<input data-rel="tooltip" id="cpnName" value="${company.name }"
							type="text" class="col-sm-3 searchKey" name="car_type"
							data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">公司LOGO</label>
					<div class="col-sm-9">
						<img src="${company.logo_url }" id="imgsrc4"
							style="width: 314px; height: 171px;">
					</div>
				</div>
				<div class="col-sm-12"
					style="text-align: left; left: 12%; margin-bottom: 0.5%;">
					<a href="javascript:;" class="upload upload3 ">上传公司LOGO <input
						class="change" type="file" id="uploadfile4" name="myfile"
						onChange=" ajaxFileUpload(4);" />
					</a>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">营业执照</label>
					<div class="col-sm-9">
						<img src="${company.company_pic_url }" id="imgsrc1"
							style="width: 314px; height: 171px;">
					</div>
				</div>
				<div class="col-sm-12" style="text-align: left; left: 12%;">
					<a href="javascript:;" class="upload upload3 ">上传营业执照 <input
						class="change" type="file" id="uploadfile1" name="myfile"
						onChange=" ajaxFileUpload(1);" />
					</a>
				</div>
			</div>
			<div class="col-xs-12" style="margin-top: 10px;">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">法人</label>
					<div class="col-sm-9">
						<input id="level" data-rel="tooltip" id="companyFname"
							value="${company.f_name}" type="text" class="col-sm-3 searchKey"
							name="car_carry" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">身份证号</label>
					<div class="col-sm-9">
						<input data-rel="tooltip" id="cpnIDCard"
							value="${company.id_card}" type="text" class="col-sm-3 searchKey"
							name="car_volume" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-12" style="position: relative;">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">身份证照片</label>
					<div class="col-sm-9">
						<img src="${company.id_front_url }" id="imgsrc2"
							style="width: 314px; height: 171px;">
					</div>
				</div>
				<div class="col-sm-12" style="text-align: left; left: 12%;">
					<a href="javascript:;" class="upload upload3 ">上传正面照 <input
						class="change" type="file" id="uploadfile2" name="myfile"
						onChange=" ajaxFileUpload(2);" />
					</a>
				</div>
				<div class="col-sm-6 fanmian">
					<img src="${company.id_back_url }" id="imgsrc3"
						style="width: 314px; height: 171px;"> <a
						href="javascript:;" class="upload upload3 "
						style="top: 111px; right: 27%">上传反面照 <input class="change"
						type="file" id="uploadfile3" name="myfile"
						onChange=" ajaxFileUpload(3);" />
					</a>
				</div>

			</div>

			<div class="col-xs-12" style="margin-top: 10px;">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">是否审核通过</label>
					<div class="col-sm-9">
						<c:if test="${company.state == 1}">
							<input data-rel="tooltip" type="text" value="已审核"
								readonly="readonly" class="col-sm-3 searchKey" name="send_area"
								data-placement="bottom">
						</c:if>
						<c:if test="${company.state == 0}">
							<input data-rel="tooltip" type="text" value="未审核"
								readonly="readonly" class="col-sm-3 searchKey" name="send_area"
								data-placement="bottom">
						</c:if>
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
		initButton([{
	        name: "提交修改", //这里是静态页的地址
	        click: function(){
	        	var cpnName = $('#cpnName').val();
	        	var Huploadfile1 = $('#Huploadfile1').val();
	        	var cpnIDCard = $('#cpnIDCard').val();
	        	var Huploadfile2 = $('#Huploadfile2').val();
	        	var Huploadfile3 = $('#Huploadfile3').val();
	        	var Huploadfile4 = $('#Huploadfile4').val();
	        	var cpnFName = $('#level').val();
	        	console.log("Huploadfile4"+Huploadfile4);
	        	if(!cpnName || !Huploadfile1 ||!cpnIDCard|| !Huploadfile2|| !Huploadfile3 || !Huploadfile4 || !cpnFName){
	        		alert("请填写完整");
	        		return;
	        	}
	        	$.ajax({
	        		url:'./changeCPNInfo',
	        		data:{cname:cpnName,cpic:Huploadfile1,cid_card:cpnIDCard,id_front:Huploadfile2,
	        			id_back:Huploadfile3,fname:cpnFName,logo:Huploadfile4},
	        		success:function(msg){
	        			if(msg.c == 1){
	        				alert(msg.m);
	        				return;
	        			}
	        			alert(msg.m);
	        			loadHtml('./companyInfo');
	        		}
	        	})
	        }	
		}])
		$(function(){
			
		})
		
		function ajaxFileUpload(n) {
        $.ajaxFileUpload(
            {
                url: '/wuliu-web/company/uploadFile', //用于文件上传的服务器端请求地址
                secureuri: false, //是否需要安全协议，一般设置为false
                fileElementId: 'uploadfile'+n, //文件上传域的ID
                dataType: 'JSON', //返回值类型 一般设置为json
                data:{type:1},
                success: function (data, status){  //服务器成功响应处理函数
                	data = data.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                	data = data.replace(/<PRE.*?>/g, '');
                	data = data.replace("<PRE>", '');
                	data = data.replace("</PRE>", '');
                	data = data.replace("<pre>", '');
                	data = data.replace("</pre>", ''); 
                	data = eval("("+data+")");
                	var dataid = data.r;
                	var gld = eval("("+dataid+")");
                	$('.upload'+n).text("上传成功！");
                	$('#Huploadfile'+n).val(gld.fileid);
                	$('#imgsrc'+n).attr("src",gld.fileurl);
                }
               
            }
        )
    }
		</script>

</body>
</html>