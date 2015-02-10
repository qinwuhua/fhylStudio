<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="js/aqgl.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadUnit("gydw",'36');
			$("#ddlYear").val();
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=2010;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
			}
			$("#yf"+m).attr("selected","selected");
			showAll();
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
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程管理>&nbsp;安全应急管理>&nbsp;安全管理月报表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 1% 0% 1% 2%;">
        						<span>上传单位：</span>
        						<select id="gydw" style="width:150px;"></select>
        							&nbsp;&nbsp;
        						<span>文件名称：</span>
        							<input type="text" id="wjmc" >
        							
        							<span>年份：</span>
        							<select name="ddlYear" id="ddlYear" style="width: 60px;">

									</select>
									<span>月份：</span>
									<select name="ddlMonth" id="ddlMonth">
										<option selected="selected" value="">全部</option>
										<option id="yf1" value="1">01</option>
										<option id="yf2" value="2">02</option>
										<option id="yf3" value="3">03</option>
										<option id="yf4" value="4">04</option>
										<option id="yf5" value="5">05</option>
										<option id="yf6" value="6">06</option>
										<option id="yf7" value="7">07</option>
										<option id="yf8" value="8">08</option>
										<option id="yf9" value="9">09</option>
										<option id="yf10" value="10">10</option>
										<option id="yf11" value="11">11</option>
										<option id="yf12" value="12">12</option> 
									</select>
									<span>状态：</span>
									<select id="type">
										<option value="全部">全部</option> 
										<option value="上传">上传</option> 
										<option value="接收">接收</option> 
									</select>
									&nbsp;&nbsp;
									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -40%;" onclick="showAll()"/>
									 <img alt="添加" src="${pageContext.request.contextPath}/images/Button/tianjia1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/tianjia2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/tianjia1.gif' " onclick="aqgltj()" style="border-width:0px;cursor: hand;vertical-align: -40%;" />
                                    <img alt="下载模板" src="${pageContext.request.contextPath}/images/Button/XZMB1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/XZMB2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/XZMB1.gif' " onclick="aqmbgl()" style="border-width:0px;cursor: hand;vertical-align: -40%;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td style="padding-top: 1%;padding-left:10px;">
                    <div>
				<table id="datagrid" >
				</table>
				</div>
				</td>
				</tr>
				
		</table>
	</div>
</body>
</html>