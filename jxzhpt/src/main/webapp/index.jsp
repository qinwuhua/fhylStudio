<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>江西省公路业务综合管理平台</title>
<link rel="stylesheet" type="text/css" href="css/xzjm.css" />
<link href="./css/searchAndNavigation.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css" />
<script type="text/javascript" src="./easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
<script type="text/javascript" src="./js/YMLib.js"></script>
<script type="text/javascript">
$(function(){
	if(getParam("userName")!=""){
		loginCheck(getParam("userName"));
	}else{
		selSes();
		selQxByUser();
	}
});
function selQxByUser(){
	$.ajax({
		type : "POST",
		url : "xtgl/selQxByUser.do",
		dataType : 'json',
		data :"param.roleid="+$.cookie("roleid"),
		success : function(msg){
			if(msg){
				var qx1= new Array();
				var qx2= new Array();
				var qx3= new Array();
				var qx4= new Array();
				for(var i=0;i<msg.length;i++){
					//第一层
					if(msg[i].id.length==4) qx1.push(msg[i].id);
					//第2层
					if(msg[i].id.length==6) qx2. push(msg[i].id);
					//第3层
					if(msg[i].id.length==8) qx3. push(msg[i].id);
					//第4层
					if(msg[i].id.length==10) qx4. push(msg[i].id);
				}
				YMLib.Var.qx1=qx1;
				YMLib.Var.qx2=qx2;
				YMLib.Var.qx3=qx3;
				YMLib.Var.qx4=qx4;
				//$.cookie("qx1",qx1, {expires: 1});
	     		$.cookie("qx2",qx2, {expires: 1});
	     		$.cookie("qx3",qx3, {expires: 1});
	     		$.cookie("qx4",qx4, {expires: 1});
	     	 }
		 }
	});
}

function menuQx(_location,_flag){
	
	var qx=YMLib.Var.qx1;
	var flag=false;
	for(var i=0;i<qx.length;i++){
		if(qx[i]==_flag){
			flag=true;
			document.location.href=_location;
			break;
		}
	}
	if(flag==false) alert("您暂无此权限！");
}
</script>
</head>
<body style="margin:0 0 0 0;min-width: 1000px;height:100%; overflow:hidden;">

<div id="topbg">
	<div class="topnv"><img src="images/toplogo.jpg" width="1000" height="86" /></div>
</div>
	<div id="main">
        <div class="xznr">
        <img src="images/xtbg.jpg" width="1440"/>
            <table  border="0" align="center" cellpadding="0" cellspacing="1"  class="xztable"  >
            <tr align="center">
            <td><a href="javascript:void(0)" onclick="menuQx('./jhgl_index.jsp','0101')"><img src="images/xz_1.png" width="182" height="250"/></a></td>
            <td style="display:none;"><a href="javascript:void(0)" onclick="menuQx('./dlxx_index.jsp','0102')"><img src="images/xz_2.png" width="182" height="250" /></a></td>
            <td><a href="javascript:void(0)" onclick="menuQx('./wjsj_index.jsp','0103')"><img src="images/xz_3.png" width="182" height="250" /></a></td>
            <td><a href="javascript:void(0)" onclick="menuQx('./zcwj_index.jsp','0102')"><img src="images/xz_5.png" width="182" height="250" /></a></td>
            <td><a href="javascript:void(0)" onclick="menuQx('./xtgl_index.jsp','0104')"><img src="images/xz_4.png" width="182" height="250" /></a></td>
            </tr>
            </table>
         </div>
</div>
<div id="foot">
	<div class="foot"><p>监制单位：江西省公路管理局&nbsp;&nbsp;&nbsp;&nbsp;技术支持：北京恒达时讯科技股份有限公司<a onclick="clearSession()" href="javascript:void(0)" style="position:absolute;right:20px;color:#f2f8fe;">退出系统</a></p>
	</div>
</div>
</body>
</html>
