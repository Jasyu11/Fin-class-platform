<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>了解更多企业</title>
</head>
<body>
<div class="box1"	>
	<a href="homepage.jsp"><font style=font-weight:bolder;><span class="stress">企业</span>模糊聚类平台</font></a>
	<input id="key_box"></input><button onclick="search()">搜索</button>
</div>
<div id="box3">
<ul id="show_ul"><h1>加载中...</h1></ul>
</div>
<div id="navigator" ><button onclick="page_up()">上一页</button><font id="page_show"></font><button onclick="page_down()">下一页</button></div>
</body>
<style>
.stress{
	font-size:95px;}	
.box1{
	height:100px;
	background-color:lightblue;
	line-height:100px;
	width:100%;
}
.box1 a{
color:black;
text-decoration:none;
}
#key_box{
	margin-left:500px;
}
#box3{
	width:1889px;
	height:700px;
	border:1px black solid;}
#box3 li{
	display:inline;}
.ent_show{
	width:300px;
	height:500px;
	border:1px solid black;
	float:left;
	margin-right:50px;
	margin-top:20px;}
</style>
<script>
var display_count=5;
var current_page=1;
var total_page=0;
window.onload=function(){
	var key_box=document.getElementById("key_box");
	key_box.value=getQueryVariable("key");
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}
	else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readyState==4&&xmlhttp.status==200){
		var source=xmlhttp.responseText;
		obj=JSON.parse(source);
		console.log(obj);
		var count=obj.length;
		total_page=Math.ceil(count/display_count);
		var ul_show=document.getElementById("show_ul");
		var str="";
		if(obj.length>0){
			for(var i=(current_page-1)*display_count;i<(display_count*current_page);i++)
				if(JSON.stringify(obj[i]))
				str+="<li><div class=ent_show>企业代号:<br>"+obj[i].name
				+"<br>注册资本:"+obj[i].registered_capital+"万元"
				+"<br>从业人数:"+obj[i].number_of_employees+"人"
				+"<br>企业分支数:"+obj[i].number_of_branches+"个"
				+"<br>网店数量:"+obj[i].onlineshop_number+"个"
				+"<br><br><font style=font-size:30px>企业描述:</font>"+obj[i].description+"</div></li>";
			ul_show.innerHTML=str;
			var page_show=document.getElementById("page_show");
			page_show.innerHTML="<font>"+current_page+"/"+total_page+"</font>"
		}
		else{
			str="<h1>无搜索结果</h1>"
			ul_show.innerHTML=str;
		}
	}
	}
	xmlhttp.open("get","InquireAction?key="+getQueryVariable("key"),"true");
	xmlhttp.send();
}
function getQueryVariable(variable){
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
    }
    return(false);
}
function search(){
	var key_box=document.getElementById("key_box");
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}
	else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readyState==4&&xmlhttp.status==200){
			var source=xmlhttp.responseText;
			obj=JSON.parse(source);
			console.log(obj);
			var count=obj.length;
			total_page=Math.ceil(count/display_count);
			var ul_show=document.getElementById("show_ul");
			var str="";
			if(obj.length!=0){
				for(var i=(current_page-1)*display_count;i<(display_count*current_page);i++)
					if(JSON.stringify(obj[i]))
					str+="<li><div class=ent_show>企业代号:<br>"+obj[i].name
					+"<br>注册资本:"+obj[i].registered_capital+"万元"
					+"<br>从业人数:"+obj[i].number_of_employees+"人"
					+"<br>企业分支数:"+obj[i].number_of_branches+"个"
					+"<br>网店数量:"+obj[i].onlineshop_number+"个"
					+"<br><br><font style=font-size:30px>企业描述:</font>"+obj[i].description+"</div></li>";
				ul_show.innerHTML=str;
				var page_show=document.getElementById("page_show");
				page_show.innerHTML="<font>"+current_page+"/"+total_page+"</font>"
			}
			else{
				var str="<h1>无搜索结果</h1>";
				ul_show.innerHTML=str;
			}
		}
	}
	xmlhttp.open("get","InquireAction?key="+key_box.value,"true");
	xmlhttp.send();
}
function page_up(){
	if(current_page==1)
		alert("已是首页");
	else{
		var str="";
		current_page=current_page-1;
		var ul_show=document.getElementById("show_ul");
		for(var i=(current_page-1)*display_count;i<(display_count*current_page);i++)
			if(JSON.stringify(obj[i]))
			str+="<li><div class=ent_show>企业代号:<br>"+obj[i].name
			+"<br>注册资本:"+obj[i].registered_capital+"万元"
			+"<br>从业人数:"+obj[i].number_of_employees+"人"
			+"<br>企业分支数:"+obj[i].number_of_branches+"个"
			+"<br>网店数量:"+obj[i].onlineshop_number+"个"
			+"<br><br><font style=font-size:30px>企业描述:</font>"+obj[i].description+"</div></li>";
		ul_show.innerHTML=str;
		var page_show=document.getElementById("page_show");
		page_show.innerHTML="<font>"+current_page+"/"+total_page+"</font>"
	}
}
function page_down(){
	if(current_page==total_page)
		alert("已是末页")
	else{
		var str="";
		current_page=current_page+1;
		var ul_show=document.getElementById("show_ul");
		for(var i=(current_page-1)*display_count;i<(display_count*current_page);i++)
			if(JSON.stringify(obj[i]))
			str+="<li><div class=ent_show>企业代号:<br>"+obj[i].name
			+"<br>注册资本:"+obj[i].registered_capital+"万元"
			+"<br>从业人数:"+obj[i].number_of_employees+"人"
			+"<br>企业分支数:"+obj[i].number_of_branches+"个"
			+"<br>网店数量:"+obj[i].onlineshop_number+"个"
			+"<br><br><font style=font-size:30px>企业描述:</font>"+obj[i].description+"</div></li>";
		ul_show.innerHTML=str;
		var page_show=document.getElementById("page_show");
		page_show.innerHTML="<font>"+current_page+"/"+total_page+"</font>"
	}
}
</script>
</html>