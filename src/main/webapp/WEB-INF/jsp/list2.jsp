<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
  <script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
  
</head>
<body>
           
<!--<table class="layui-hide" id="hgxData"></table>-->
              
<table class="layui-table" lay-data="{width: 892, height:332, url:'/hgxcloud/contentList', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
      <th lay-data="{field:'title', width:80}">çè¨æ é¢</th>
      <th lay-data="{field:'content', width:80, sort: true}">çè¨åå®¹</th>
      <th lay-data="{field:'phone', width:80}">çµè¯</th>
      <th lay-data="{field:'createtime', width:160}">åå»ºæ¶é´</th>
      <th lay-data="{field:'updatetime', width:80, sort: true}">ä¿®æ¹æ¶é´</th>     
      
    </tr>
  </thead>
</table>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">æ¥ç</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">ç¼è¾</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">å é¤</a>
</script>          

 
<script>
	
layui.use('table', function(){
  var table = layui.table;
  //çå¬è¡¨æ ¼å¤éæ¡éæ©
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  //çå¬å·¥å·æ¡
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('IDï¼'+ data.id + ' çæ¥çæä½');
    } else if(obj.event === 'del'){
      layer.confirm('ççå é¤è¡ä¹', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('ç¼è¾è¡ï¼<br>'+ JSON.stringify(data))
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //è·åéä¸­æ°æ®
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //è·åéä¸­æ°ç®
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('éä¸­äºï¼'+ data.length + ' ä¸ª');
    }
    ,isAll: function(){ //éªè¯æ¯å¦å¨é
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? 'å¨é': 'æªå¨é')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});	
	

</script>

</body>
</html>