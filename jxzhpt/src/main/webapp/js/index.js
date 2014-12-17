//登录专用js
var bl = false;
var name;
var password;
function checkText(){
	name = $("#name").val();
	password = $("#password").val();
	if(name == ""){
		alert(' 用户名不能为空！');
		$("#name").focus();
		return;
	}else if(password == ""){
		alert(' 密码不能为空！');
		$("#password").focus();
		return;
	}
	bl = true;
}

//点击登录按钮时
function login(){
	document.location.href="./index.jsp";
	/*
	checkText();//检查文本框是否输入
	if(bl){
		$.ajax({
			 type : "POST",
			 url : "xtgl/login.do",
			 dataType : 'json',
			 data :"master.name="+name+"&master.password="+password,
		     success : function(msg){
		     	 if(msg){
		     		$.cookie("username",name, {expires: 1});//将用户名放入cookie中
		     		$.cookie("tel",msg.tel, {expires: 1});//将电话放入cookie中
		     		$.cookie("truename",msg.truename, {expires: 1});//将用户名放入cookie中
		     		$.cookie("password",password, {expires: 1});
		     		$.cookie("dept",msg.dept, {expires: 1});
		     		$.cookie("deptname",msg.deptname, {expires: 1});
		     		$.cookie("dist",msg.dist, {expires: 1});
		     		document.location.href="/hbdtxt/index.jsp";
		     		//$('#index_layout').css('visibility', 'visible');
		     	 }
		     	 else{
		     		alert("用户名或密码不正确！！");
		     	 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}*/
	
}
/**
 * 查询登录者的权限放cookie中
 */
function selQx(){
	$.ajax({
		 type : "POST",
		 url : "xtgl/selQx.do",
		 dataType : 'json',
	     success : function(msg){
	    	 if(msg){
	    		 $('#index_layout').css('visibility', 'visible');
	    		 var qx = ","+msg.resourceid+",";
	    		 $.cookie("QX",qx, {expires: 1});//设置权限
	    		 loadMenu(qx);
	    	 }else{
	    		 document.location.href="login.jsp";
		     	 alert("session失效，请重新登录！！");
	     	 }
		  },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}
/**
 * 退出系统时清除session
 */
function clearSession(){
	$.ajax({
		 type : "POST",
		 url : "xtgl/clearSession.do",
		 dataType : 'json',
	     success : function(msg){
		  },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}

function loadMenu(qx){
	var index = "";
	for ( var i = 1; i < 8; i++) {
		var temp = ",0"+i+",";
		if(qx.indexOf(temp) != -1){
			if(index != "")
				index = i;
			$("#d" + i).show();
		}else{
			$("#d" + i).css('display','none');
		}
	}
		
	
	if(index == 1){
		$("#c2,#c3,#c4,#c5,#c6,#c7").hide();
        $("#c1").show();
	    $("#Menu_1").addClass('now');
        $("#c1f").attr("src", "page/YHFrame/c1.jsp");
        c1 = false;

	}else if(index == 2){
        $("#c1,#c3,#c4,#c5,#c6,#c7").hide();
        $("#c2").show();
	    $("#Menu_2").addClass('now');
        $("#c2f").attr("src", "page/YHFrame/c2.jsp");
        c2 = false;
	}else  if(index == 3){
	       $("#c1,#c2,#c4,#c5,#c6,#c7").hide();
	       $("#c3").show();
		   $("#Menu_3").addClass('now');
	       $("#c3f").attr("src", "page/YHFrame/c3.jsp");
	       c3 = false;
	}else if(index == 4){
		 $("#c1,#c2,#c3,#c5,#c6,#c7").hide();
	     $("#c4").show();
		 $("#Menu_4").addClass('now');
        $("#c4f").attr("src", "page/YHFrame/c4.jsp");
        c4 = false;
	}else if(index == 5){
		$("#c1,#c2,#c3,#c4,#c6,#c7").hide();
        $("#c5").show();
	    $("#Menu_5").addClass('now');
        $("#c5f").attr("src", "page/YHFrame/c5.jsp");
        c5 = false;
	}else if(index == 6){
		$("#c1,#c2,#c3,#c4,#c5,#c7").hide();
        $("#c6").show();
	    $("#Menu_6").addClass('now');
        $("#c6f").attr("src", "page/YHFrame/c6.jsp");
        c6 = false;
	}else if(index == 7 ){ alert("here");
		$("#c1,#c2,#c3,#c4,#c5,#c6").hide();
        $("#c7").show();
	    $("#Menu_7").addClass('now');
        $("#c7f").attr("src", "page/YHFrame/c7.jsp");
        c7 = false;
	}
		
}