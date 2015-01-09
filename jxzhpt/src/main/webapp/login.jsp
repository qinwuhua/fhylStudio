<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>江西省公路业务综合管理平台</title>
<link rel="stylesheet" type="text/css" href="css/Login.css" />
<script type="text/javascript" src="./easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/YMLib.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body style="margin:0 0 0 0; min-width: 1000px;overflow-x:hidden; ">
<div id="bg">
	<div class="dlflash">
<div style="width:1000px;  height:258px;position:relative;top:49px;left:0px; margin:0 auto;">
<script type="text/javascript" src="js/wpFlashWrite.js"></script>
<script type="text/javascript">
<!--
 wpFlashWrite('images/login.swf',1000,570,'wpFlash70814','','');
//-->
$(function(){
	$("#name").focus();
});
function rewrite(){
	$("#name").val("");
	$("#password").val("");
	$("#name").focus();
}
</script>

                
               <div id="perDword" class="perDword" >
            	<table width="100%" border="0" cellspacing="0" cellpadding="0" height="118px">
           <tr>
           <td colspan="3">用户名：<input name="tbUser" type="text" id="name" style="height:23px;width:180px; line-height:23px;" /></td>
           </tr>
           <tr>
           <td colspan="3">密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="tbPwd" type="password" id="password" style="height:23px;width:180px; line-height:23px;" /></td>
           </tr>
           <tr>
           <td width="15%"></td>
           <td align="center" > <input type="image" name="imgLogin" id="imgLogin" onmouseleave="onmousebutton(this);" onmouseover="onmousebutton(this);" src="images/dlClick.gif" onclick="login();" style="border-width:0px;" /></td>
           
           <td align="left">
           <input type="image" name="imgLogin" id="imgLogin" onmouseleave="onmousebutton(this);" onmouseover="onmousebutton(this);" src="images/DR2.gif" onclick="rewrite()" style="border-width:0px;" />
           </td>
           </tr>
           </table>
               </div> 
		</div>

</div>
</div>
</body>
</html>
