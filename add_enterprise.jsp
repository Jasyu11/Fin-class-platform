<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ page import="entity.enterprise"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加企业</title>
</head>
<body>

<div id="content">
<h1>添加企业信息</h1>
<span class="gap">公司名:</span>
<input id="ent_name" type="text" onchange="exam()" >
<br><br>
<span class="gap">注册资本:</span><input id="registered_capital" min="0"	placeholder="单位：万元" onchange="exam()" type="number" ><br><br>
<span class="gap">持股比例:</span><input id="shareholding_ratio" min="0" placeholder="%" onchange="exam()" type="number"  ><br><br>
<span class="gap">企业年报信息认缴额:</span><input id="ent_year_subscription" min="0" placeholder="单位：万元" onchange="exam()" type="number"   ><br><br>
<span class="gap">企业年报信息实缴额:</span><input id="ent_year_paid"  min="0" placeholder="单位：万元"  onchange="exam()" type="number" ><br><br>
<span class="gap">企业出资信息认缴出资额:</span><input id="ent_contribution" min="0" placeholder="单位：万元" onchange="exam()" type="number"  ><br><br>
<button id="confirm" onclick="add()">添加</button>
</div>
</body>
<style>
	.gap{
		display: inline-block;
		width: 100px;
		}
	body{
		text-align: center;
		}
	#content{
		margin:0 auto;
		width:500px;
		height:600px;
		border:solid black 1px;
		float:left;
		padding-top:5px;
		}
</style>
<script type="text/javascript">
var confirm_button=document.getElementById("confirm");
confirm_button.disabled="disabled";	
function add(){
	var ent=new Object;
	var ent_count=getQueryVariable("ent_count");
	ent.name=document.getElementById("ent_name").value;
	ent.registered_capital=document.getElementById("registered_capital").value;
	ent.shareholding_ratio=document.getElementById("shareholding_ratio").value;
	ent.ent_year_subscription=document.getElementById("ent_year_subscription").value;
	ent.ent_year_paid=document.getElementById("ent_year_paid").value;
	ent.ent_contribution=document.getElementById("ent_contribution").value;
	window.opener.document.getElementById("enterprise"+ent_count).value=ent.name+";"+
	ent.registered_capital+";"+ent.shareholding_ratio+";"+ent.ent_year_subscription+";"+
	ent.ent_year_paid+";"+ent.ent_contribution;
	window.close();
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
function exam(){
	var target=event.target
	if(target.value.replace(/(^\s*)|(\s*$)/g, "")=="")
		alert("当前项不能为空")
	var flag1=document.getElementById("ent_name").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag2=document.getElementById("registered_capital").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag3=document.getElementById("shareholding_ratio").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag4=document.getElementById("ent_year_subscription").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag5=document.getElementById("ent_year_paid").value.replace(/(^\s*)|(\s*$)/g, "");
	var flag6=document.getElementById("ent_contribution").value.replace(/(^\s*)|(\s*$)/g, "");
	console.log(flag2);
	if(flag1!=""&&flag2!=""&&flag3!=""&&flag4!=""&&flag5!=""&&flag6!=""){
		var confirm_button=document.getElementById("confirm");
		confirm_button.disabled="";	
		}
	else
		{
		var confirm_button=document.getElementById("confirm");
		confirm_button.disabled="disabled";	
		}
}
</script>