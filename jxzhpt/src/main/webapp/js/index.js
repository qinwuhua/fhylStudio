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
		     		$.cookie("dist2",dist2, {expires: 1});
		     		
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
/**
 * 查询登录者的权限放cookie中
 */
function selQxByUser(){
	$.ajax({
		type : "POST",
		url : "xtgl/selQxByUser.do",
		dataType : 'json',
		data:"",
		success : function(msg){
			
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