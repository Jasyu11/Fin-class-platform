<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>单企业查询</title>
</head>
<body>
<div class="box1"	>
	<a href="homepage.jsp"><h1><span class="stress">企业</span>模糊聚类平台</h1></a>
	
</div>
<div style="text-align: center; width: 500px; height: 800px;  position: absolute;  left: 50%; transform:translateX(-50%)">
<h1>单企业查询</h1>
<form  method="post" action="InquireSingleAction">
	<br>
<h2>企业名称：<input type="text"  name="name" placeholder="请输入企业名称" id="name" onchange="exam()"/></h2>
<br>
<h2>注册资本：<input type="number" min="0" name="registered_capital" placeholder="单位：万元" onchange="exam()" id="registered_capital"></h2>
<br>
<h2>持股比例：<input type="number"  min="0"name="shareholding_ratio" placeholder="单位：%" id="shareholding_ratio" onchange="exam()"></h2>
<br>
<h2>企业年报累计认缴额：<input type="number"  min="0"name="ent_year_subscription" placeholder="单位：万元" id="ent_year_subscription" onchange="exam()"></h2>
<br>
<h2>企业年报累计实缴额：<input  name="ent_year_paid"  min="0" type="number"  placeholder="单位：万元" id="ent_year_paid" onchange="exam()"></h2>
<br>
<h2>企业出资信息认缴出资额:<input type="number" min="0"  name="ent_contribution" placeholder="单位：万元" id="ent_contribution" onchange="exam()"></h2>
<br>
<input type="submit" id="confirm" value="确定"/>
</form>
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
a{
color:black;
text-decoration:none;
}
</style>
<script>
var confirm_button=document.getElementById("confirm");
confirm_button.disabled="disabled";
function exam(){
	var target=event.target
	if(target.value.replace(/(^\s*)|(\s*$)/g, "")=="")
		alert("当前项不能为空")
	var flag1=document.getElementById("name").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag2=document.getElementById("registered_capital").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag3=document.getElementById("shareholding_ratio").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag4=document.getElementById("ent_year_subscription").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag5=document.getElementById("ent_year_paid").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag6=document.getElementById("ent_contribution").value.replace(/(^\s*)|(\s*$)/g, "");
	console.log(flag2);
	if(flag1!=""&&flag2!=""&&flag3!=""&&flag4!=""&&flag5!=""&&flag6!=""){
		console.log(1)
		var confirm_button=document.getElementById("confirm");
		confirm_button.disabled="";	
		}
	else
		{
		console.log(0);
		var confirm_button=document.getElementById("confirm");
		confirm_button.disabled="disabled";	
		}
}
</script>
</html>