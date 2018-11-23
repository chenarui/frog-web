<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	width: 60px;
}

.fanmian {
	position: absolute;
	top: 0px;
	text-align: left;
	right: 16%;
}

.vcode_text {
	width: 129px;
	color: white;
	text-align: center;
	display: inline-block;
	vertical-align: top;
	background-color: #1da1f2;
	margin-left: 56px;
	border-radius: 7px;
	height: 30px !important;
	font-size: 15px;
	line-height: 30px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="row">
		<input type="hidden" id="Huploadfile1" name="" value="" /> <input
			type="hidden" id="Huploadfile2" value="" /> <input type="hidden"
			id="Huploadfile3" value="" />
		<form class="form-horizontal" role="form">
			<div class="col-xs-12" style="margin-top: 10px;">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">手机号</label>
					<div class="col-sm-9">
						<input data-rel="tooltip" id="phone" value="" type="text"
							class="col-sm-3 searchKey" name="car_carry"
							data-placement="bottom"
							onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">验证码</label>
					<div class="vcode">
						<input type="text" id="vcode_id" class="vcode_input"
							placeholder="" style="margin-left: 12px;">
						<div class="vcode_text" onclick="sendVcode(this);">发送验证码</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12" id="xingming">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">姓名</label>
					<div class="col-sm-9">
						<input data-rel="tooltip" id="name" value="" type="text"
							class="col-sm-3 searchKey" name="name" data-placement="bottom">
					</div>
				</div>
			</div>
			<div class="col-xs-12" id="jiashi">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">驾驶证</label>
					<div class="col-sm-9">
						<img src="" id="imgsrc1" style="width: 314px; height: 171px;">
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
			<div class="col-xs-12" id="shenfenid">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">身份证号</label>
					<div class="col-sm-9">
						<input data-rel="tooltip" id="id_card" value="" type="text"
							class="col-sm-3 searchKey" name="car_volume"
							data-placement="bottom" maxlength="18" onblur="myFunction()">
					</div>
				</div>
			</div>
			<div class="col-xs-12" style="position: relative;" id="shenfenpic">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-right"
						for="form-field-6">身份证照片</label>
					<div class="col-sm-9">
						<img src="" id="imgsrc2" style="width: 314px; height: 171px;">
					</div>
				</div>
				<div class="col-sm-12" style="text-align: left; left: 12%;">
					<a href="javascript:;" class="upload upload3 ">上传正面照 <input
						class="change" type="file" id="uploadfile2" name="myfile"
						onChange=" ajaxFileUpload(2);" />
					</a>

				</div>
				<div class="col-sm-6 fanmian" style="">
					<img src="" id="imgsrc3" style="width: 314px; height: 171px;">
					<a href="javascript:;" class="upload upload3 "
						style="top: 111px; right: 27%">上传反面照 <input class="change"
						type="file" id="uploadfile3" name="myfile"
						onChange=" ajaxFileUpload(3);" />
					</a>
				</div>

			</div>

		</form>
	</div>
	<!-- /.row -->
	<script type="text/javascript">
    initButton([{
        name: "保存", //这里是静态页的地址
        click: function(){
            var name = $('#name').val();
            var Huploadfile1 = $('#Huploadfile1').val();
            var id_card = $('#id_card').val();
            var Huploadfile2 = $('#Huploadfile2').val();
            var Huploadfile3 = $('#Huploadfile3').val();
            var phone = $('#phone').val();
            var id = $('#id').val();
            var vcode = $('#vcode_id').val();
            if(!vcode){
            	alert("请输入验证码");
            	return;
            }
            var pattern = /^1[34578]\d{9}$/; 
            if( !pattern.test(phone)){
                alert("手机号不正确");
                return;
            }
            console.log(Huploadfile1);
            if(Huploadfile1 == -1){
            	$.ajax({
                     url:'./mytask/addDriver',
                     type:"POST",
                     async:false,
                     data:{phone:phone,vcode:vcode,apptype:3,type:0},
                     success:function(msg){
                         if(msg.c == 4){
                             alert(msg.m);
                             loadHtml('./mytask/driverList');
                             return;
                         }else if(msg.c == 5){
                             alert(msg.m);
                             return;
                         }else if(msg.c == 3){
                             alert(msg.m);
                             return;
                         }
                         alert("新增失败");
                         return;
                         
                     }
                 })
            }else if(!name || !Huploadfile1 ||!id_card|| !Huploadfile2|| !Huploadfile3|| !phone){
                alert("请填写完整");
                return;
            } else if( id_card.length < 18){
                alert("身份证位数不足18位");
                return;
            } else if(name && Huploadfile1 && id_card && Huploadfile2 && Huploadfile3 && phone){
            	$.ajax({
                     url:'./mytask/addDriver',
                     type:"POST",
                     async:false,
                     data:{id:id,name:name,driver_card:Huploadfile1,id_card:id_card,id_front:Huploadfile2,
                         id_back:Huploadfile3,phone:phone,vcode:vcode,apptype:3,type:0},
                     success:function(msg){
                         if(msg.c == 4){
                             alert(msg.m);
                             loadHtml('./mytask/driverList');
                             return;
                         }else if(msg.c == 5){
                             alert(msg.m);
                             return;
                         }else if(msg.c == 3){
                             alert(msg.m);
                             return;
                         }
                         alert("新增失败");
                         return;
                         
                     }
                 })
            }
        }   
    },
    {
        name: "返回", 
        click: function(){
        	wait = 0;
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
        var wait=60;  
        function sendVcode(it){
        	//防止重复点击
            if($('.vcode_text').text() != '发送验证码'){
                return;
            }
            var phone = $('#phone').val();
            if(!phone){
                alert("请输入手机号");
                return;
            }
            //发送验证码
            $.ajax({
                url : './getVCode',
                type : "post",
                async: false,
                //data : $('.form-horizontal').serialize(),// 你的formid
                data:{phone:phone,type:0},
                dataType:'json',
                success : function(msg) {
                    console.log(msg.code);
                    if(msg.c == 2){
                        alert(msg.m);
                        return;
                    }else if(msg.c == 8){
                    	alert(msg.m);
                         $('#Huploadfile1').val(-1);
	                      $("#xingming").css("display","none");
	                      $("#jiashi").css("display","none");
	                      $("#shenfenid").css("display","none");
	                      $("#shenfenpic").css("display","none");
                    }
                }
            })
            $('.vcode_text').css("background-color","#607D8B");
            time();
           
        }
        function time() { 
            if (wait == 0) {  
                $('.vcode_text').text("发送验证码");
                $('.vcode_text').css("background-color","#1da1f2");
                wait = 60;  
            } else {  
            	if($('.vcode_text').css("background-color") != '#1da1f2'){
            		$('.vcode_text').text("发送验证码(" + wait + ")");
                    wait--;  
                    setTimeout(function() {  
                        time()  
                    },  
                    1000)  
            	}
            	
            }  
        } 
        
        function myFunction(){
        	 var id_card = $('#id_card').val();
        	 if(!/^\d{17}(\d|x)$/i.test( id_card)) alert("你输入的身份证长度或格式错误");return;
        }
    </script>
</body>
</html>