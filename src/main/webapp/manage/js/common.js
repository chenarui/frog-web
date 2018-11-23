//replace icons with FontAwesome icons like above
function updatePagerIcons(table) {
	var replacement = 
	{
		'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
	'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
	'ui-icon-seek-next' : 'icon-angle-right bigger-140',
	'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
};
$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
	var icon = $(this);
	var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
	
	if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
	})
}

function getSearchKey(){
	var parmas = "";
	$(".searchKey").each(function(){
		var name = $(this).attr("name");
		if(name){
			parmas +=name+"="+$(this).val()+"&";
		}
	})
	return parmas;
}

function searchFrom(url){
	var param = getSearchKey();//getSearchParam 在global.js里，它自动查询class="searchKey"的input
	var url = url+param;
	jQuery("#grid-table").setGridParam({url:url,page:1}).trigger("reloadGrid");
}


function getarg(url){
	arg=url.split("#");
	return arg[1];
} 

function initButton(jsondata){
	$("#nav-search").empty();
	var data = eval(jsondata);
	for(var i=0;i<data.length;i++){
		//解决闭包
		!function(i){
			var html = '<button class="btn btn-xs btn-primary" id="nav-search-btn'+i+'">'+data[i].name+'</button>';
			$("#nav-search").append(html);
			var callback =  data[i].click;
			$("#nav-search-btn"+i).on("click",function(){
				callback(); 	
			})
		}(i);
	}
}

function loadHtml(url){
	$.ajax( {
        url: url, //这里是静态页的地址
        type: "GET", //静态页用get方法，否则服务器会抛出405错误
        success: function(data){
           try {
	        	var jsondata = eval('('+data+')');
	           	var code = jsondata.c;
	           	console.log(code);
	           	if(code==100){
	           		window.location.href="./login";
	           	}
        	} catch(err) {
        		  $(".page-content").html(data);
        	} finally {
        	}
        }
	});
	$("#nav-search").empty();
}

function getHtml(obj,html){
	if(obj.children("a").children(".menu-text").length>0){
		html = "<li><i class='"+obj.children("a").children("i").attr('class')+"'></i>"+obj.children("a").children(".menu-text").text()+"</li>" + html;
	}else if(obj.children("a").length>0){
		if(html==""){
			html = "<li>"+ obj.children("a").text()+"</li>" + html;
		}else{
			html = "<li>"+ obj.children("a").text()+"</li>" + html;
		}
		
	}
	return html;
}


function FormatDate (date) {
    return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
}


function checkRequired(){
	var success = true;
	$(".required").each(function(){
		var val = $(this).val();
		if(!val){
			alert($(this).attr("title")+"不能为空!");
			success = false;
			return false;
		}
	})
	return success;
}

function checkPhone(phone){
	var reg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
    if(!reg.test(phone)){ 
    	alert("手机号码格式错误!");
		return false; 
    }
    return true;
}

//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
//例子：
//(new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
//(new Date()).format("yyyy-M-d h:m:s.S")   ==> 2006-7-2 8:9:4.18
Date.prototype.format = function (fmt) { //author: meizz
var o = {
 "M+": this.getMonth() + 1, //月份
 "d+": this.getDate(), //日
 "h+": this.getHours(), //小时
 "m+": this.getMinutes(), //分
 "s+": this.getSeconds(), //秒
 "q+": Math.floor((this.getMonth() + 3) / 3), //季度
 "S": this.getMilliseconds() //毫秒
};
if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
for (var k in o)
if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
return fmt;
}