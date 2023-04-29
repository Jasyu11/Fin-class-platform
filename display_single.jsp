<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="entity.enterprise"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查询结果</title>
</head>
<script>

</script>
<body>
<div class="box1"	>
	<a href="homepage.jsp"><h1><span class="stress">企业</span>模糊聚类平台</h1></a>

</div>
<br>
<div class="box2">
<ul>
<%enterprise ent=(enterprise)request.getAttribute("enterprise"); %>
<li>企业名称<br><%=ent.getName() %></li>
<li>企业注册资本<br><%=ent.getRegistered_capital() %>万元</li>
<li>企业出资信息认缴出资额<br><%=ent.getEnt_contribution() %>万元</li>
<li>企业持股比例<br><%=ent.getShareholding_ratio() %>%</li>
<li>企业年报信息认缴额<br><%=ent.getEnt_contribution_year_subscription() %>万元</li>
<li>企业年报信息实缴额<br><%=ent.getEnt_contribution_year_paid() %>万元</li>
<li>所属簇<br><%=ent.getType() %></li>
<li>模糊聚类结果<br><%=ent.getDescription() %></li>
</ul></div>
<br></br>
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
.box2{
	background-color: palegreen;
	width:100%;
	height:600px;
	text-align:center
}
.box2 ul{
	display:line-block;
	overflow: hidden;
	}
.box2 ul li{
	list-style-type:none;
	margin:20px;
	}
a{
color:black;
text-decoration:none;
}
</style>

</html>