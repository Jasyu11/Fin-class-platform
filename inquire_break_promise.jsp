<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="webjars/jquery/3.3.1-2/jquery.min.js"></script>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>失信企业查询</title>
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
<div id="box2"></div>
<!-- 分页框 -->
<div id="box3">
<a onclick="test()">1</a>
<a onclick="test()" >2</a>
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
		.stress{
	font-size:95px;}
.ent_show{
	height:150px;
	width:1000px;
	border:solid black 1px;
	float:left;
}
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
					str+="<div class=ent_show><div class=ent_data>企业代号<font style="+"font-size:25px;"
			    	+">"+obj[i].name+"</font>";
			    	if(obj[i].whether_break_promise>0)
			    	str+="<br>是否工信部失信企业<font style=color:red;font-size:30px>"+obj[i].whether_break_promise;
			    	else
			    	str+="<br>是否工信部失信企业<font>"+obj[i].whether_break_promise;
			    	if(obj[i].blacklist_or_not!=0)
			    	str+="</font>&emsp;是否列入黑名单<font style=color:red;font-size:30px>"+obj[i].blacklist_or_not;
			    	else
			    	str+="</font>&emsp;是否列入黑名单<font >"+obj[i].blacklist_or_not;
			    	if(obj[i].abnormal_time>0)
			    	str+="</font>&emsp;企业异常次数:<font style=color:red;font-size:30px>"+obj[i].abnormal_time;
			    	else
			    	str+="</font>&emsp;企业异常次数:<font>"+obj[i].abnormal_time;
			    	if(obj[i].accumulated_tax_arrears>0)
			    	str+="</font><br><br>企业累计欠税额:<font style=color:red;font-size:30px>"+obj[i].accumulated_tax_arrears;
			    	else
			       	str+="</font><br><br>企业累计欠税额:<font>"+obj[i].accumulated_tax_arrears;
			       	if(obj[i].number_of_penalty>0)
			    	str+="</font>&emsp;行政处罚次数:<font style=color:red;font-size:30px>"+obj[i].number_of_penalty;
			    	else
			    	str+="</font>&emsp;行政处罚次数:<font>"+obj[i].number_of_penalty;
			    	
			    	if(obj[i].time_of_comprehensive_punishment>0)
			    	str+="</font>&emsp;综合处罚次数:<font style=color:red;font-size:30px>"+obj[i].time_of_comprehensive_punishment+"</font></div><div class=ent_rank><font>信用等级</font>"+"<font "+"style=font-size:30px;"+"margin:20px"+">"+obj[i].ent_credit_rank+"</font></div></div>";
			    	else
			    	str+="</font>&emsp;综合处罚次数:<font>"+obj[i].time_of_comprehensive_punishment+"</font></div><div class=ent_rank><font>信用等级</font>"+"<font "+"style=font-size:30px;"+"margin:20px"+">"+obj[i].ent_credit_rank+"</font></div></div>";
				}
			}
			div_show.innerHTML+=str;
		}
	}
	xmlhttp.open("GET","InquireBreakPromise","true");
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
		if(JSON.stringify(obj[i])){
		if((obj[i].name).indexOf(key.value)!=-1){
			flag=1;
			new_obj[current_count]=obj[i];
			current_count=current_count+1;
			if(current_count<10){
				str+="<div class=ent_show><div class=ent_data>企业代号<font style="+"font-size:25px;"
		    	+">"+obj[i].name+"</font>";
		    	if(obj[i].whether_break_promise>0)
		    	str+="<br>是否工信部失信企业<font style=color:red;font-size:30px>"+obj[i].whether_break_promise;
		    	else
		    	str+="<br>是否工信部失信企业<font>"+obj[i].whether_break_promise;
		    	if(obj[i].blacklist_or_not!=0)
		    	str+="</font>&emsp;是否列入黑名单<font style=color:red;font-size:30px>"+obj[i].blacklist_or_not;
		    	else
		    	str+="</font>&emsp;是否列入黑名单<font >"+obj[i].blacklist_or_not;
		    	if(obj[i].abnormal_time>0)
		    	str+="</font>&emsp;企业异常次数:<font style=color:red;font-size:30px>"+obj[i].abnormal_time;
		    	else
		    	str+="</font>&emsp;企业异常次数:<font>"+obj[i].abnormal_time;
		    	if(obj[i].accumulated_tax_arrears>0)
		    	str+="</font><br><br>企业累计欠税额:<font style=color:red;font-size:30px>"+obj[i].accumulated_tax_arrears;
		    	else
		       	str+="</font><br><br>企业累计欠税额:<font>"+obj[i].accumulated_tax_arrears;
		       	if(obj[i].number_of_penalty>0)
		    	str+="</font>&emsp;行政处罚次数:<font style=color:red;font-size:30px>"+obj[i].number_of_penalty;
		    	else
		    	str+="</font>&emsp;行政处罚次数:<font >"+obj[i].number_of_penalty;
		    	if(obj[i].time_of_comprehensive_punishment>0)
		    	str+="</font>&emsp;综合处罚次数:<font style=color:red;font-size:30px>"+obj[i].time_of_comprehensive_punishment+"</font></div><div class=ent_rank><font>信用等级</font>"+"<font "+"style=font-size:30px;"+"margin:20px"+">"+obj[i].ent_credit_rank+"</font></div></div>";
		    	else
		    	str+="</font>&emsp;综合处罚次数:<font>"+obj[i].time_of_comprehensive_punishment+"</font></div><div class=ent_rank><font>信用等级</font>"+"<font "+"style=font-size:30px;"+"margin:20px"+">"+obj[i].ent_credit_rank+"</font></div></div>";
			}
		}
		}
	
	if(flag==0){
		str="<h1>无搜索结果</h1>"
		var page_show=document.getElementById("box3");
		page_show.innerHTML="";
	}
	else{
		obj=new_obj;
	}
	div_show.innerHTML=str;
}

function test(){
	var target=event.target;
	current_page=target.innerText;
	var div_show=document.getElementById("box2");
	div_show.innerHTML="";
	var str="";
	for(var i=(current_page-1)*display_count;i<current_page*display_count;i++){
		if(JSON.stringify(obj[i])){
			str+="<div class=ent_show><div class=ent_data>企业代号<font style="+"font-size:25px;"
	    	+">"+obj[i].name+"</font>";
	    	if(obj[i].whether_break_promise>0)
	    	str+="<br>是否工信部失信企业<font style=color:red;font-size:30px>"+obj[i].whether_break_promise;
	    	else
	    	str+="<br>是否工信部失信企业<font>"+obj[i].whether_break_promise;
	    	if(obj[i].blacklist_or_not!=0)
	    	str+="</font>&emsp;是否列入黑名单<font style=color:red;font-size:30px>"+obj[i].blacklist_or_not;
	    	else
	    	str+="</font>&emsp;是否列入黑名单<font >"+obj[i].blacklist_or_not;
	    	if(obj[i].abnormal_time>0)
	    	str+="</font>&emsp;企业异常次数:<font style=color:red;font-size:30px>"+obj[i].abnormal_time;
	    	else
	    	str+="</font>&emsp;企业异常次数:<font>"+obj[i].abnormal_time;
	    	if(obj[i].accumulated_tax_arrears>0)
	    	str+="</font><br><br>企业累计欠税额:<font style=color:red;font-size:30px>"+obj[i].accumulated_tax_arrears;
	    	else
	       	str+="</font><br><br>企业累计欠税额:<font>"+obj[i].accumulated_tax_arrears;
	       	if(obj[i].number_of_penalty>0)
	    	str+="</font>&emsp;行政处罚次数:<font style=color:red;font-size:30px>"+obj[i].number_of_penalty;
	    	else
	    	str+="</font>&emsp;行政处罚次数:<font>"+obj[i].number_of_penalty;
	    	if(obj[i].time_of_comprehensive_punishment>0)
	    	str+="</font>&emsp;综合处罚次数:<font style=color:red;font-size:30px>"+obj[i].time_of_comprehensive_punishment+"</font></div><div class=ent_rank><font>信用等级</font>"+"<font "+"style=font-size:30px;"+"margin:20px"+">"+obj[i].ent_credit_rank+"</font></div></div>";
	    	else
	    	str+="</font>&emsp;综合处罚次数:<font>"+obj[i].time_of_comprehensive_punishment+"</font></div><div class=ent_rank><font>信用等级</font>"+"<font "+"style=font-size:30px;"+"margin:20px"+">"+obj[i].ent_credit_rank+"</font></div></div>";
		}
	}
	div_show.innerHTML+=str;
}

</script>
</html>