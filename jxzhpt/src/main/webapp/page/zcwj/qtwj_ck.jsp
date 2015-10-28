<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="js/xxcx.js"></script>
	<script type="text/javascript">
		$(function(){
			var data=parent.obj;
			$("#wjmc").text(data.wjmc);
			$("#wjgy").text(data.wjgy);
			var data1="id="+data.id;
			$.ajax({
				type:'post',
				url:'/jxzhpt/wjxt/selectWjfile.do',
				data:data1,
				dataType:'json',
				success:function(msg){
					if(msg.length==0){
						$('<li></li>').appendTo('.files').html("无附件");
					}
					for(var i=0;i<msg.length;i++)
					$('<li></li>').appendTo('.files').html(msg[i].wjname+'                   <a href="/jxzhpt/wjxt/downWjFile.do?id='+msg[i].id+'"  style="text-decoration:none;"> 下载 </a> ');
				}
			});	
		});
		
	</script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
 cursor: pointer;
}
a:active {
 text-decoration: none;
}
-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0"
			style="margin-top: 1px; margin-left: 1px;" cellspacing="0"
			cellpadding="0">
                <tr>
                    <td>
                        <br />
                        <table width="700px;" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                            cellpadding="0">
                            <tr style="height: 35px;">
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    padding-right: 5px; vertical-align: middle;" width="200px;">
                                    <b><font color="#009ACD" style=" font-size: 12px">文件名称 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" width="500px;">
                                <span id="wjmc"></span>
                                </td>
                            </tr>
                         <!--    
                            <tr style="height: 105px;">
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    width: 200px; padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style=" font-size: 12px">文件概要</font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                  <span id="wjgy"></span>
                                </td>
                            </tr> -->
                       		<tr style="height: 35px;">
                                 <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    width: 200px; padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style=" font-size: 12px">文件 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                   	<ul style="list-style: none;" class=files>
									</ul>
                                </td>
                            </tr>
                        </table>
                        <table width="700px" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                            margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                            cellspacing="0" cellpadding="0">
                            <tr style="height: 30px;">
                                <td align="center">
                                    <input onclick=" parent.$('#zcwj').window('destroy');" type="image" name="btnCancel" id="btnCancel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" style="border-width:0px;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
	</body>
</html>