<%@ page contentType="text/html; charset=utf-8" import="javax.servlet.*,javax.servlet.http.*"
    pageEncoding="utf-8"%>
<html>
<head >
<title>hgxcloud后台登陆</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.slider.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div id="formDiv">
		<form id="loginForm" method="post">
			<p>hgxcloud后台登陆</p><br>
			用户名:&nbsp;&nbsp;
			<input type="text" id="uname" value="" /><br><br>
			密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="password" id="password" value="" /><br><br>
			<!-- <div id="dragverify"></div><br> -->
			<div class="container">
				<div class="demo1">
					<div id="slider1" class="slider"></div>
				</div>
			</div><br>
			<input id="btnOk" type="submit" value="提交" />
	        <input onclick="cancel()" type="button" value="取消" /><br>
	        
		</form>
	</div>
</body>
</html>