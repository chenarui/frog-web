<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 60px;
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
		<input type="hidden" id="Huploadfile1" name=""
			value="${driver.driver_card}" /> <input type="hidden"
			id="Huploadfile2" value="${driver.id_front }" /> <input
			type="hidden" id="Huploadfile3" value="${driver.id_back }" /> <input
			type="hidden" id="id" value="${driver.driver_id }" />
		<form class="form-horizontal" role="form">
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">姓名</label>
					<div class="col-sm-9">
						<input data-rel="tooltip" id="name" value="${driver.name }"
							type="text" class="col-sm-3 searchKey" name="name"
							data-placement="bottom" maxlength="20">
					</div>
				</div>
			</div>

			<div class="col-xs-12" style="margin-top: 10px;">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">手机号</label>
					<div class="col-sm-9">
						<input data-rel="tooltip" id="phone" value="${driver.phone}"
							type="text" class="col-sm-3 searchKey" name="car_carry"
							data-placement="bottom" maxlength="11" onblur="checkPhone()">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">身份证号</label>
					<div class="col-sm-9">
						<input data-rel="tooltip" id="id_card" value="${driver.id_card}"
							type="text" class="col-sm-3 searchKey" name="car_volume"
							data-placement="bottom" maxlength="18" onblur="myFunction()">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">驾驶证</label>
					<div class="col-sm-9">
						<img src="${driver.driver_card_url}" id="imgsrc1"
							style="width: 314px; height: 171px;">
					</div>
				</div>
				<div class="col-sm-12"
					style="text-align: left; left: 12%; margin-bottom: 1%;">
					<a href="javascript:;" class="upload upload3 ">上传驾驶证 <input
						class="change" type="file" id="uploadfile1" name="myfile"
						onChange=" ajaxFileUpload(1);" />
					</a>
				</div>
			</div>
			<div class="col-xs-12" style="position: relative;">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">身份证照片</label>
					<div class="col-sm-9">
						<img src="${driver.id_front_url }" id="imgsrc2"
							style="width: 314px; height: 171px;">
					</div>
				</div>
				<div class="col-sm-12" style="text-align: left; left: 12%;">
					<a href="javascript:;" class="upload upload3 ">上传正面照 <input
						class="change" type="file" id="uploadfile2" name="myfile"
						onChange=" ajaxFileUpload(2);" /> <!--                      <input  type="hidden" id="Huploadfile2" value=""  /> -->
					</a>

				</div>
				<div class="col-sm-6 fanmian" style="">
					<img src="${driver.id_back_url }" id="imgsrc3"
						style="width: 314px; height: 171px;"> <a
						href="javascript:;" class="upload upload3 "
						style="top: 111px; right: 27%">上传反面照 <input class="change"
						type="file" id="uploadfile3" name="myfile"
						onChange=" ajaxFileUpload(3);" /> <!--                      <input  type="hidden" id="Huploadfile3" value=""  /> -->
					</a>
				</div>

			</div>

		</form>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
    initButton([{
        name: "提交修改", //这里是静态页的地址
        click: function(){
            var name = $('#name').val();
            var Huploadfile1 = $('#Huploadfile1').val();
            var id_card = $('#id_card').val();
            var Huploadfile2 = $('#Huploadfile2').val();
            var Huploadfile3 = $('#Huploadfile3').val();
            var phone = $('#phone').val();
            var id = $('#id').val();
            console.log(Huploadfile1);
            console.log(Huploadfile2);
            console.log(Huploadfile3);
            if(!name || !Huploadfile1 ||!id_card|| !Huploadfile2|| !Huploadfile3|| !phone){
                alert("请填写完整");
                return;
            }
            if( id_card.length < 18){
                alert("身份证位数不足18位");
                return;
            }
            var pattern = /^1[34578]\d{9}$/; 
            if( !pattern.test(phone)){
                alert("手机号不正确");
                return;
            }
            $.ajax({
                url:'./mytask/saveDriver',
                type:"POST",
                data:{id:id,name:name,driver_card:Huploadfile1,id_card:id_card,id_front:Huploadfile2,
                    id_back:Huploadfile3,phone:phone},
                success:function(msg){
                    if(msg == 0){
                        alert("修改失败");
                        return;
                    }
                    alert("修改成功");
                    loadHtml('./mytask/driverList');
                    
                }
            })
        }   
    },
    {
        name: "返回", 
        click: function(){
        	 loadHtml('./mytask/driverList');
        }
    }
    ]);
    
        function ajaxFileUpload(n) {
            $.ajaxFileUpload(
                {
                    url: '/frog-web/company/uploadFile', //用于文件上传的服务器端请求地址
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
                        console.log(gld.fileid);
                        $('.upload'+n).text("上传成功！");
                        $('#Huploadfile'+n).val(gld.fileid);
                        $('#imgsrc'+n).attr("src",gld.fileurl);
                    }
                   
                }
            )
        }
        
        function myFunction(){
            var id_card = $('#id_card').val();
            if(!/^\d{17}(\d|x)$/i.test( id_card)) alert("你输入的身份证长度或格式错误");return;
       }
        
        function checkPhone(){
        	var phone = $('#phone').val();
        	var pattern = /^1[34578]\d{9}$/; 
        	if( !pattern.test(phone)){
        		alert("手机号不正确");
        		return;
        	}
        }
       
    </script>
</body>
</html>