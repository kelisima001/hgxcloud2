<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
import="javax.servlet.*,javax.servlet.http.*"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>全部留言记录</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
  <script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		
  		var admin=<%=session.getAttribute("user")%>; 
  		if(admin===null||!admin||admin==null||admin=='null'){
  			/* alert("null"); */
  			window.location.href="/hgxcloud/admin";
  		}
  		
  	});
  </script>
</head>
<body>
           
<table class="layui-hide" id="hgxData"></table>
              
          

 
<script>

layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#hgxData'
    ,url: "/hgxcloud/contentList"
    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
    	
      {field:'id', width:80, title: 'ID',sort: true}
      ,{field:'title', width:200, title: '留言标题'}
      ,{field:'content', width:600, title: '留言内容', sort: true}
      ,{field:'phone', width:120, title: '电话',sort: true}
      ,{field:'createtime', title: '创建时间', width: 120, sort: true} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
      ,{field:'updatetime', title: '修改时间', width: 120,sort: true}
    ]]
  	,page:true
	
	
	
	
  });
});

$(".laytable-cell-1-createtime").each(function(){
	var createtime=$(".laytable-cell-1-createtime").val().trim();
	var time=createtime.format("yyyyMMdd HH:mm:ss");
	createtime.val(time);
});

</script>

</body>
</html>