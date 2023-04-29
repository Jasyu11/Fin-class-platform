<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业查查查</title>
</head>
<body>
<div class="box1" 	>
	<a href="homepage.jsp" ><h1><span class="stress">企业</span>模糊聚类平台</h1></a>
</div>
<div id="search_box">
<input placeholder="请键入企业代号" id="key" onchange="exam()"></input>
<button value="查询" onclick="inquire()" id="search_button">查询</button>
</div>
<div id="frame">
<div class="box2">
	<a href="inqure_single.jsp"><h2>个体查询</h2></a>
</div>
<div class="box3">
	<a href="inquire_batch.jsp"><h2>批量查询</h2></a>
</div>
<div class="box4">
<a href="inquire_break_promise.jsp"><h2>违规查询</h2></a></div>
<div class="box5">
<a href="inquire_good_ent.jsp"><h2>优秀企业</h2></a>
</div>
</div>
<div id="category"><h1 style=color:lightblue>企业门类</h1>
<ul>
<li onclick="get_category()" value=0>批发和零售业</li>
<li onclick="get_category()" value=1>房地产业</li>
<li onclick="get_category()" value=2>租赁和商务服务业</li>
<li onclick="get_category()" value=3>制造业</li>
<li onclick="get_category()" value=4>信息传输、软件和信息技术服务业</li>
<li onclick="get_category()" value=5>科学研究和技术服务页</li><br></br>
<li onclick="get_category()" value=6>建筑业</li>
<li onclick="get_category()" value=7>居民服务、修理和其他服务页</li>
<li onclick="get_category()" value=8>交通运输、仓储和邮政业</li>
<li onclick="get_category()" value=9>住宿和餐饮业</li>
<li onclick="get_category()" value=10>文化、体育和娱乐业</li>
<li onclick="get_category()" value=11>教育</li><br></br>
<li onclick="get_category()" value=12>水利、环境和公共设施管理业</li>
<li onclick="get_category()" value=13>电力、热力、燃气及水生产和供应业</li>
<li onclick="get_category()" value=14>金融业</li>
<li onclick="get_category()" value=15>农、林、牧、渔业</li>
<li onclick="get_category()" value=16>其他</li>
</ul></div>
</body>
<style>
#search_box{
	width:1889px;
	height:400px;
	line-height: 400px;
	text-align:center;
	background-color: lightblue;
	border:solid black 1px;
}
#search_box input{
	width:350px;
	height:50px;
	font-size:50px;
	border-radius: 10px;
	margin-top:100px;
	}
	#search_box button{
	width:250px;
	height:50px;
	font-size:25px;
	margin-top:100px;

	}
.stress{
	font-size:95px;}
.box1{
	height:100px;
	background-image: url(bg-d2658914.jpg);
	line-height:100px;
	width:1889px;
}
.box2{
	height:400px;
	width:400px;
	float:left;
	border:solid black 1px;
	border-radius: 30px;
	margin-right: 50px;
	margin-top:10px;
	 box-shadow:10px 10px 10px gray;
	line-height:1;
	}
.box2 a{
	font-size:90px;
	color:lightskyblue;
}

.box3{
	height:400px;
	width:400px;
	float:left;
	border:solid black 1px;
	border-radius: 30px;
	margin-right: 50px;
	margin-top:10px;
	 box-shadow:10px 10px 10px gray;
	line-height:1;
	}
.box3 a{
	font-size:90px;
	color:lightskyblue;
}
.box4{
	height:400px;
	width:400px;
	float:left;
	border:solid black 1px;
	border-radius: 30px;
	margin-right: 50px;
	margin-top:10px;
	 box-shadow:10px 10px 10px gray;
	line-height:1;
	}
.box4 a{
	font-size:90px;
	color:lightskyblue;
}
.box5{
	height:400px;
	width:400px;
	float:left;
	border:solid black 1px;
	border-radius: 30px;
	margin-right: 50px;
	margin-top:10px;
	 box-shadow:10px 10px 10px gray;
	line-height:1;
	}
.box5 a{
	font-size:90px;
	color:lightskyblue;
}
#frame{
 	width:1889px;
 	height:450px;
 	}
a{
	text-decoration: none;
	color:#D0D9E0;
}
#category{
	width:1889px;
	height:400px;
	border-top:solid black 1px;
	}
#category li{
	display:inline;
	margin:50px;
	font-size:25px;
	width: 100px;
    text-align: center;
    height: 50px;
    border:solid 1px lightblue;
    border-radius:10px;
    cursor:pointer;
	}
</style>
<script>
function inquire(){
	var key =document.getElementById("key")
	var value=key.value.replace(/(^\s*)|(\s*$)/g, "")
	if(value!="")
		window.location.href="inquire.jsp?key="+value;
	else
		window.location.href="homepage.jsp";
}
function get_category(){
	var target=event.target;
	window.location.href="GetCategroyEnt.jsp?category="+target.value+"&ch_category="+encodeURI(target.innerText,"utf-8");
}
function exam(){
	var target=event.target;
	value=target.value.replace(/(^\s*)|(\s*$)/g, "")
	if(value==""){
		var search_button=document.getElementById("search_button");
		search_button.disabled="disabled";
	}
	else{
		var search_button=document.getElementById("search_button");
		search_button.disabled="";
	}
}
</script>
</html>
</body>
</html>