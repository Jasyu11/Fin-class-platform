<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="webjars/jquery/3.3.1-2/jquery.min.js"></script>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优秀企业列表</title>
</head>
<body>
<div class="box1" 	>
	<a href="homepage.jsp" ><h1><span class="stress">企业</span>模糊聚类平台</h1></a>
</div>
<!-- 搜索框 -->
<div id="search_box">
<div>
<input id="key"></input><button onclick="search()">搜索</button>
</div>
</div>
<!-- 展示框 -->
<div id="box2">
<h1>加载中...</h1>
</div>
<!-- 分页框 -->
<div id="box3">
<a onclick="test()">1</a>
<a onclick="test()">2</a>
<a onclick="test()">3</a>
<a onclick="test()">4</a>
<a onclick="test()">5</a>
<a onclick="test()">6</a>
<a onclick="test()">7</a>
<a onclick="test()">8</a>
<a onclick="test()">9</a>
</div>
</body>
<style>
.box1{
	height:100px;
	background-image: url(bg-d2658914.jpg);
	line-height:100px;
	width:1889px;}
.box1 a{
	text-decoration: none;
	color:#D0D9E0;}
#search_box{
	width:1889px;
	height:35px;
	position:relative;
	}
#search_box input{
	position:absolute;
	right:5%;
}
#search_box button{
	position:absolute;
	right:2%;
}
#box2{
	height:1200px;
	width:1000px;
	margin:0 auto;}
	
#box3{
	height:100px;
	width:1000px;
	margin:0 auto;
	border-top:0px;
	 text-align: center;           
	  margin-top: 50px;       
	}
#box3 a{ text-decoration: none;          
		  border:1px solid #f9d52b;           
		 padding: 5px 7px;       
		 color: #767675;            
		cursor: pointer;}
.ent_show{
	height:150px;
	width:1000px;
	border:solid black 1px;
	float:left;
}
.stress{
	font-size:95px;}
.ent_data{
	height:150px;
	width:800px;
	float:left;
	border-right:solid black 1px;}
	</style>
<script>
var count=0;
var obj;
var display_count=8; //每页显示的内容数
var current_page=1;//当前页
window.onload=function(){
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
			count=obj.length;
			var div_show=document.getElementById("box2");
			var str="";
			for(var i=0;i<current_page*display_count;i++){
				if(JSON.stringify(obj[i])){
				str+="<div class=ent_show>企业代号<font style="+"font-size:25px;"
		    	+">"+obj[i].name+"</font>";
		    	if(obj[i].intellectual_property_rights>0)
		    	str+="<br>企业知识产权数<font style=color:blue;font-size:30px>"+obj[i].intellectual_property_rights;
		    	else
		    	str+="<br>企业知识产权数<font>"+obj[i].intellectual_property_rights;
		    	if(obj[i].whether_wellknown_trademark>0)
		    	str+="</font>&emsp;是否驰名商标<font style=color:blue;font-size:30px >"+obj[i].whether_wellknown_trademark;
		    	else
		    	str+="</font>&emsp;是否驰名商标<font >"+obj[i].whether_wellknown_trademark;
		    	if(obj[i].number_of_patent_applications>0)
		    	str+="</font>&emsp;专利申请次数:<font style=color:blue;font-size:30px>"+obj[i].number_of_patent_applications;
		    	else
		    	str+="</font>&emsp;专利申请次数:<font>"+obj[i].number_of_patent_applications;
		    	if(obj[i].whether_famous_trademark>0)
		    	str+="</font><br><br>是否著名商标:<font style=color:blue;font-size:30px>"+obj[i].whether_famous_trademark;
		    	else
		       	str+="</font><br><br>是否著名商标:<font>"+obj[i].whether_famous_trademark;
		       	if(obj[i].number_of_copyright_application>0)
		    	str+="</font>&emsp;著作权申请次数:<font style=color:blue;font-size:30px>"+obj[i].number_of_copyright_application;
		    	else
		    	str+="</font>&emsp;著作权申请次数:<font >"+obj[i].number_of_copyright_application;
		    	if(obj[i].whether_keep_promise>0)
		    	str+="</font>&emsp;是否为守信用重合同企业:<font style=color:blue;font-size:30px>"+obj[i].whether_keep_promise+"</font></div>";
		    	else
		    	str+="</font>&emsp;是否为守信用重合同企业:<font>"+obj[i].whether_keep_promise+"</font></div>";
				}
			}
			div_show.innerHTML=str;
			}
		}
		xmlhttp.open("GET","InquireGreatEnt","true");
		xmlhttp.send();
	}
	function search(){
		var key=document.getElementById("key");
		var flag=0;
		var div_show=document.getElementById("box2");
		div_show.innerHTML="";
		var str=""
		var current_count=0;
		var new_obj={};
		for(i=0;i<count;i++)
			if((obj[i].name).indexOf(key.value)!=-1){
				flag=1;
				new_obj[current_count]=obj[i];
				current_count=current_count+1;
				if(current_count<10){
					str+="<div class=ent_show>企业代号<font style="+"font-size:25px;"
			    	+">"+obj[i].name+"</font>";
			    	if(obj[i].intellectual_property_rights>0)
			    	str+="<br>企业知识产权数<font style=color:blue;font-size:30px>"+obj[i].intellectual_property_rights;
			    	else
			    	str+="<br>企业知识产权数<font>"+obj[i].intellectual_property_rights;
			    	if(obj[i].whether_wellknown_trademark>0)
			    	str+="</font>&emsp;是否驰名商标<font style=color:blue;font-size:30px >"+obj[i].whether_wellknown_trademark;
			    	else
			    	str+="</font>&emsp;是否驰名商标<font >"+obj[i].whether_wellknown_trademark;
			    	if(obj[i].number_of_patent_applications>0)
			    	str+="</font>&emsp;专利申请次数:<font style=color:blue;font-size:30px>"+obj[i].number_of_patent_applications;
			    	else
			    	str+="</font>&emsp;专利申请次数:<font>"+obj[i].number_of_patent_applications;
			    	if(obj[i].whether_famous_trademark>0)
			    	str+="</font><br><br>是否著名商标:<font style=color:blue;font-size:30px>"+obj[i].whether_famous_trademark;
			    	else
			       	str+="</font><br><br>是否著名商标:<font>"+obj[i].whether_famous_trademark;
			       	if(obj[i].number_of_copyright_application>0)
			    	str+="</font>&emsp;著作权申请次数:<font style=color:blue;font-size:30px>"+obj[i].number_of_copyright_application;
			    	else
			    	str+="</font>&emsp;著作权申请次数:<font >"+obj[i].number_of_copyright_application;
			    	if(obj[i].whether_keep_promise>0)
			    	str+="</font>&emsp;是否为守信用重合同企业:<font style=color:blue;font-size:30px>"+obj[i].whether_keep_promise+"</font></div>";
			    	else
			    	str+="</font>&emsp;是否为守信用重合同企业:<font>"+obj[i].whether_keep_promise+"</font></div>";
		}
	}
		if(flag==0){
			str="<h1>无搜索结果</h1>"
			var page_show=document.getElementById("box3");
			page_show.innerHTML="";
		}
		else
			obj=new_obj;
		div_show.innerHTML=str;
	}
</script>
</html>