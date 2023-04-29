<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <span style="font-size:18px;">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title>动态表格</title> 
<style type="text/css"> 
body{ background-color:#9CC; text-align:center} 
table{ margin:10px auto;} 
tr th { border: 1px solid #096;} 
td{border: 1px solid #096;} 
</style> 
<script type="text/javascript"> 
/*在函数的外部只能声明一些变量之类的，不能用操作方法，因为没有函数去调用执行它。*/ 
//在载入页面的时候就在表格头放入选择框，因为是一次性的 
window.onload = function(){ 
var tab = document.getElementById('tab'); 
var firsttr = document.getElementsByTagName('tr')[0]; 
var childtd = firsttr.childNodes; 
//在第一行第一列上加入选择框 
var inp = document.createElement('input'); 
inp.type = 'checkbox'; 

//DOM Leve 2 事件注册 
catchEvent(inp,'click',function(){ //注册函数 不同状态进行判断 
if(inp.checked ==true){ 
allSelect(); 
}else{ 
cancelSelect(); 
} 
}); 
//catchEvent(inp,'click',allSelect); 
//catchEvent(inp,'change',cancelSelect); 
childtd[0].appendChild(inp); 

} 
//增加一行 
//var count =0;//增加一列用来 计数 
function addRow(){ 
//count++; 
var tab = document.getElementById('tab'); 
var firsttr = document.getElementsByTagName('tr')[0]; 
var childtd = firsttr.childNodes; 
var tr = document.createElement('tr'); 
var arrtd = new Array(); 
var arrinp = new Array(); 
for(var i =0;i<childtd.length;i++){ 
arrtd[i] = document.createElement('td'); 
arrinp[i] = document.createElement('input'); 
if(i==0){ 
arrinp[i].type = 'checkbox'; 
arrinp[i].name = 'selectbox'; 
}else if(i==1){ 
//arrinp[i] = document.createTextNode(count); 
arrinp[i] = document.createTextNode(''); 
} 
arrtd[i].appendChild(arrinp[i]);//思考为什么 input也要加上数组。 
tr.appendChild(arrtd[i]); 
} 

tab.appendChild(tr); 
newSort(); 
} 
//删除操作 
function deleteRow(){ 
var parentTr = new Array();//先把被选中的行放在一个数组上 
var box = document.getElementsByName('selectbox'); 
var tab = document.getElementById('tab'); 
for(var i = 0;i<box.length;i++){ 
if(box[i].checked==true){ 
var parent = box[i].parentNode; 
parentTr[i] = parent.parentNode;//如果直接这种为放在里面为什么不能完全删除？？是因为反应不够吗？ 
//tab.removeChild(parentTr); 
} 
} 
for(var i = 0;i<parentTr.length;i++){ //这样做才能把选中的全部删除 
if(parentTr[i]){ //这边要先判断一下是否为空值，如果不为空才去移除，否者会报错。 
tab.removeChild(parentTr[i]); 
} 
} 
newSort(); 
} 

//如果执行删除的话则，重新进行排序 
function newSort(){ 
var text = new Array(); 
var child_td = new Array(); 
var arr_tr = document.getElementsByTagName('tr'); 
for(var i = 1;i<arr_tr.length;i++){ 
child_td[i] = arr_tr[i].childNodes[1];//获得从第二行开始所有第二列的节点 
if(child_td[i].childNodes[0]){ 
child_td[i].removeChild(child_td[i].childNodes[0]); 
} 
text[i] = document.createTextNode(i); 
child_td[i].appendChild(text[i]); 

} 
} 
//全选操作 
function allSelect(){ 
var box = document.getElementsByName('selectbox'); 
for(var i= 0;i<box.length;i++){ 
box[i].checked = true; 
} 
} 

//全部取消选择 
function cancelSelect(){ 
var box = document.getElementsByName('selectbox'); 
for(var i = 0;i<box.length;i++){ 
if(box[i].checked == true){ 
box[i].checked =false; 
} 
} 
} 
//事件注册函数 
function catchEvent(eventobj,event,eventHandler){ 
if(eventobj.addEventListener){ 
eventobj.addEventListener(event,eventHandler,false); 
}else if(eventobj.attachEvent){ 
event = 'on'+event; 
eventobj.attachEvent(event,eventHandler); 
} 
} 

//catchEvent(add,'click',addRow); 

</script> 
</head> 

<body> 
<h3>动态表格</h3> 
<input type="button" value="增加" id="add" onclick="addRow()" /> 
<input type="button" value="全部选择" onclick="allSelect()" /> 
<input type="button" value="全部取消" onclick="cancelSelect()" /> 
<input type="button" value="删除" id="delete" onclick="deleteRow()"/> 
<table id="tab" cellpadding="5px" cellspacing="0px"> 
<tr><td></td><td>序号</td><td>题目一</td><td>题目二</td><td>题目三</td></tr> 
</table> 
</body> 
</html></span>

