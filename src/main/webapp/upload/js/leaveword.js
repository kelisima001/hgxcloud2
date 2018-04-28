$(document).ready(function() {
    /*changePic();*/
    //SetEmailVal();
	
	$("#slider1").slider({
		callback: function(result) {
			$("#result1").text(result);
			$("#slider1").data("result",result);
		}
	});
	
    $("#btnOk").click(function () {
        var title = $("#leaveword_title").val();
        title = $.trim(title);
        var content = $("#leaveword_content").val();
        content=$.trim(content);
        var email = $("#txtemail").val();
        email = $.trim(email);
        var captcha = $("#txtcode").val();
        captcha = $.trim(captcha);
        if (title.length == 0) {
            alert("请输入留言标题");
            $("#leaveword_title").focus();
            return false;
        }
        if (title.length > 200) {
            alert("留言标题最长支持200个字符");
            $("#leaveword_title").focus();
            return false;
        }
        if (content.length == 0) {
            alert("请输入留言内容");
            $("#leaveword_content").focus();
            return false;
        }
        if (content.length > 2000) {
            alert("留言内容最长支持2000个字符");
            $("#leaveword_content").focus();
            return false;
        }
		if(!$("#slider1").data("result")){
			alert("没有验证");
			return false;
		}
		if(/^[0-9]{4,20}$/.test(email)==false || email.length<4 || email.length>20){
			alert("电话只能填4-20位数字");
			$("#txtemail").focus();
			return false;
		}
        /*if (/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email) == false) {
            alert("邮箱格式不正确，请重新填写");
            $("#txtemail").focus();
            return false;
        }*/
        
        /*return false;*/
		var params={
			"title":title,
			"content":content,
			"phone":email
		};
		var url="/hgxcloud/saveContent";
		
		$.ajax({
            url: url,
            data: params,
            /*dataType: 'text',*/
            
            type: 'get',
            complete: function (result) {
            	console.log(result);
            	alert("保存留言成功,我们将尽快与您联系");
            }
			/*success: function (result) {
	        	console.log(result);
	        	alert("保存留言成功");
	        }*/
	        /*error:function (result) {
	        	console.log(result);
	        	alert("保存失败");
	        }*/
	        
        }); 
		/*alert("保存留言成功");*/
    });
});



function changePic() {
    var path = '/Customer/GenerateValidCode' + "?time=" + (new Date()).toLocaleTimeString() + "&sval=lyyz";
    $("#vpic").attr("src", path);
}

function cancel() {
    $("#leaveword").find(".u_textarea").val("");
    $("#leaveword").find(".u_input").val("");
    $("#leaveword").find("#leaveword_title").val('');
    $("#leaveword").find("#leaveword_content").val('');
    $("#leaveword").find("#txtemail").val('');
    $("#leaveword").find("#txtcode").val('');
    
}