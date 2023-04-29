<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>批量查询</title>
</head>
<body>
<div class="box1"	>
	<a href="homepage.jsp"><h1><span class="stress">企业</span>模糊聚类平台</h1></a>
</div>
<br></br>
<h1>批量查询</h1>
<h5>公司名称；注册资本；持股比例；年报认缴额；年报实缴额；出资信息认缴出资额</h5>
<div class="box2"  id="data"></div>
<div>
<button onclick="add()">添加</button>
<button onclick="back()">撤销</button>
<button onclick="inquire()">查询</button>
</div>

</body>
<script>
var ent_count=0;
function inquire(){
	var i=1;
	var array=[];
	for(i=1;i<=ent_count;i++){
		var obj=document.getElementById("enterprise"+i); //获取input框
		var json_object={};
		var vars=obj.value.split(";"); //截断
		json_object.name=vars[0];
		json_object.registered_capital=vars[1];
		json_object.shareholding_ratio=vars[2];
		json_object.ent_year_subscription=vars[3];
		json_object.ent_year_paid=vars[4];
		json_object.ent_contribution=vars[5];
		array.push(json_object);
	}
	array=JSON.stringify(array);
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
			var obj=JSON.parse(source);
			console.log(obj);
			obj=JSON.stringify(obj);
			window.location.href="display_batch.jsp?array="+encodeURI(encodeURI(obj));
		}
	}
	xmlhttp.open("GET","InquireBatchAction?array="+encodeURI(encodeURI(array)),"true");
	xmlhttp.send();	
}
function add(){
	ent_count=ent_count+1;
	var input=document.createElement("input");
	input.id="enterprise"+ent_count;
	input.className="ent";
	var ent_show=document.getElementById("data");
	ent_show.appendChild(input);
	window.open("add_enterprise.jsp?ent_count="+ent_count,"_blank","width=600, height=700,resizable=no");
}
function back(){
	var obj=document.getElementById("enterprise"+ent_count);
	obj.remove();
	ent_count=ent_count-1;
}
</script>
<style>
.stress{
	font-size:95px;}
	.ent{
		width:550px;
		height:20px;
		type:text;
}
.box1{
	height:100px;
	background-color:lightblue;
	line-height:100px;
	width:100%;
}
.box1 a{
	text-decoration:none;
	color:black;
	}
.box2{
	width:80%;
	height:500px;
	resize:none;
	border:solid black 1px;
}
</style>
</html>