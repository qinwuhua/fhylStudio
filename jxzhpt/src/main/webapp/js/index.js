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
	checkText();//检查文本框是否输入
	if(bl){
		$.ajax({
			type : "POST",
			url : "xtgl/login.do",
			dataType : 'json',
			data :"master.truename="+name+"&master.password="+password,
			success : function(msg){
				if(msg){
		     		$.cookie("truename",msg.TRUENAME, {expires: 1});//将用户名放入cookie中
		     		$.cookie("unit",msg.UNIT, {expires: 1});
		     		var unit2=msg.UNIT;
		     		if(unit2.substr(unit2.length-2,unit2.length)=="00") unit2=unit2.substr(0,unit2.length-2);
		     		if(unit2.substr(unit2.length-2,unit2.length)=="00") unit2=unit2.substr(0,unit2.length-2);
		     		$.cookie("unit2",unit2, {expires: 1});
		     		
		     		if(msg.UNIT=="36") $.cookie("dist","360000", {expires: 1});
		     		else $.cookie("dist",msg.UNIT.substr(msg.UNIT.length-6,msg.UNIT.length), {expires: 1});
		     		
		     		var dist2=msg.UNIT.substr(msg.UNIT.length-6,msg.UNIT.length);
		     		if(dist2.substr(dist2.length-2,dist2.length)=="00") dist2=dist2.substr(0,dist2.length-2);
		     		if(dist2.substr(dist2.length-2,dist2.length)=="00") dist2=dist2.substr(0,dist2.length-2);		     		
		     		$.cookie("dist2",dist2, {expires: 1});
		     		
		     		$.cookie("roleid",msg.ROLEID, {expires: 1});
		     		document.location.href="./index.jsp";
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
	}
	
}

function selSes(){
	$.ajax({
		 type : "POST",
		 url : "xtgl/selQx.do",
		 dataType : 'json',
	     success : function(msg){
	    	 if(msg){
	    		 //var qx = ","+msg.resourceid+",";
	    		//$.cookie("QX",qx, {expires: 1});//设置权限
	    		// loadMenu(qx);
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
	    	 document.location.href="login.jsp";
		  },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}
