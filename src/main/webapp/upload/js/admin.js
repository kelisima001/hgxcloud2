$(document).ready(function(){
	$("#slider1").slider({
		callback: function(result) {
			$("#result1").text(result);
			$("#slider1").data("result",result);
		}
	});
	
	$("#btnOk").click(function(){
		var uname=$("#uname").val().trim();
		var password=$("#password").val().trim();
		if(uname==null){
			alert("用户名不能为空")
			return false;
		}
		if(password==null){
			alert("密码不能为空")
			return false;
		}
		if(!$("#slider1").data("result")){
			alert("没有验证");
			return false;
		}
		var params={
			"uname":uname,
			"password":password
		};
		var url="/hgxcloud/admin/login";
		$.ajax({
            url: url,
            data: params,
            dataType: "json",
            
            type: 'get',
            
            success: function (result) {
            	/*alert("456");*/
            	
            	
	        	window.location.href="/hgxcloud/list";
	        }
	        /*error:function (result) {
	        	console.log(result);
	        	alert("保存失败");
	        }*/
	        
        }); 
		
	})
	
	
});