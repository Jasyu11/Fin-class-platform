<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>查询结果</title>
</head>
<body>
<div class="box1"	>
	<a href="homepage.jsp"><h1><span class="stress">企业</span>模糊聚类平台</h1></a>
</div>
<div class="box2">
<input id="key"></input><button onclick="search()" >搜索</button>
</div>
<div id="box3">
<ul id="show_ul"></ul>
</div>
<div id="navigator" onclick="page_up()"><button>上一页</button><font id="page_show"></font><button onclick="page_down">下一页</button></div>
</body>
<style>
.stress{
	font-size:95px;}
.box1{
	height:100px;
	background-color:lightblue;
	line-height:100px;
	width:1889px;
}
.box1 a{
	text-decoration:none;
	color:black;}
.box2{
	width:1889px;
	height:25px;
	border:1px solid black;
	}
#box3{
	width:1889px;
	height:550px;
	border:1px black solid;}
#box3 li{
	display:inline;}
.ent_show{
	width:250px;
	height:450px;
	border:1px solid black;
	float:left;
	margin-right:50px;
	margin-top:20px;}
</style>
<script>
var display_count=5;
var current_page=1;
var obj=decodeURI(decodeURI(getQueryVariable("array")));
obj=JSON.parse(obj);
console.log(obj);
var total_page=Math.ceil(obj.length/display_count);
var count=obj.length;
window.onload=function(){
	
	var ul_show=document.getElementById("show_ul");
	
	var str="";
	for(var i=(current_page-1)*display_count;i<(display_count*current_page);i++)
		if(JSON.stringify(obj[i]))
		str+="<li><div class=ent_show>企业名称:"+obj[i].name
		+"<br>注册资本:"+obj[i].registered_capital+"万元"
		+"<br>年报信息认缴额:"+obj[i].ent_contribution_year_subscription+"万元"
		+"<br>年报信息实缴额:"+obj[i].ent_contribution_year_paid+"万元"
		+"<br>出资信息认缴出资额:"+obj[i].ent_contribution+"万元"
		+"<br>所属簇:"+obj[i].type
		+"<br><br><font style=font-size:30px>企业描述:</font>"+obj[i].description+"</div></li>";
	ul_show.innerHTML=str;
	var page_show=document.getElementById("page_show");
	page_show.innerHTML="<font>"+current_page+"/"+total_page+"</font>"
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
function page_up(){
	if(current_page!=1){
		current_page=current_page-1;
		var ul_show=document.getElementById("show_ul");
		var count=obj.length;
		var str="";
		for(var i=(current_page-1)*display_count;i<(display_count*current_page);i++)
			if(JSON.stringify(obj[i]))
			str+="<li><div class=ent_show>企业名称:"+obj[i].name
			+"<br>注册资本:"+obj[i].registered_capital+"万元"
			+"<br>年报信息认缴额:"+obj[i].ent_contribution_year_subscription+"万元"
			+"<br>年报信息实缴额:"+obj[i].ent_contribution_year_paid+"万元"
			+"<br>出资信息认缴出资额:"+obj[i].ent_contribution+"万元"
			+"<br><br><font style=font-size:30px>企业描述:</font>"+obj[i].description+"</div></li>";
		ul_show.innerHTML=str;
		var page_show=document.getElementById("page_show");
		page_show.innerHTML="<font>"+current_page+"/"+total_page+"</font>"
	}
	else
		alert("已是首页")
}
function page_down(){
	if(current_page!=total_page){
		current_page=current_page+1;
		var ul_show=document.getElementById("show_ul");
		var count=obj.length;
		var str="";
		for(var i=(current_page-1)*display_count;i<(display_count*current_page);i++)
			if(JSON.stringify(obj[i]))
			str+="<li><div class=ent_show>企业名称:"+obj[i].name
			+"<br>注册资本:"+obj[i].registered_capital+"万元"
			+"<br>年报信息认缴额:"+obj[i].ent_contribution_year_subscription+"万元"
			+"<br>年报信息实缴额:"+obj[i].ent_contribution_year_paid+"万元"
			+"<br>出资信息认缴出资额:"+obj[i].ent_contribution+"万元"
			+"<br><br><font style=font-size:30px>企业描述:</font>"+obj[i].description+"</div></li>";
		ul_show.innerHTML=str;
		var page_show=document.getElementById("page_show");
		page_show.innerHTML="<font>"+current_page+"/"+total_page+"</font>"
	}
	else
		alert("已是末页");
}
function search(){
	var key=document.getElementById("key");
	var flag=0;
	var ul_show=document.getElementById("show_ul");
	ul_show.innerHTML="";
	var str=""
	var current_count=0;
	var new_obj={};
	current_page=1;
	for(i=0;i<count;i++)
		if(JSON.stringify(obj[i])){
		if((obj[i].name).indexOf(key.value)!=-1){
			flag=1;
			new_obj[current_count]=obj[i];
			current_count=current_count+1;
			if(current_count<display_count){
				str+="<li><div class=ent_show>企业名称:"+obj[i].name
				+"<br>注册资本:"+obj[i].registered_capital+"万元"
				+"<br>年报信息认缴额:"+obj[i].ent_contribution_year_subscription+"万元"
				+"<br>年报信息实缴额:"+obj[i].ent_contribution_year_paid+"万元"
				+"<br>出资信息认缴出资额:"+obj[i].ent_contribution+"万元"
				+"<br><br><font style=font-size:30px>企业描述:</font>"+obj[i].description+"</div></li>";
			}
		}
	}
	if(flag==0){
		str="<h1>无搜索结果</h1>"
	}
	else
		obj=new_obj;
	ul_show.innerHTML=str;
}
</script>
</html>