<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>	
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/bhsd.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit"));
			if(getParam("t")=='1'){
				$("#ybzt").val('未审核');
			}
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=2010;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
			}
			$("#ddlYear").val(myDate.getFullYear());
			showAll();
		});
	</script>
	<style type="text/css">
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
</style>
</head>
<body>
    <div id="righttop">
		<div id="p_top">工程管理>&nbsp;工程进度审核管理>&nbsp;病害隧道施工过程管理</div>
	</div>
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1%  0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 4px 20px;">
        					    <span>管养单位：</span>
        						<input id="gydw" style="width: 150px;">
        						<span>项目年份：</span> 
        						<select name="ddlYear" id="ddlYear" style="width: 80px;">
        						<option value="">全部</option>
        						</select>
        						&nbsp;
        						<span>月报状态：</span>
        						<select id="ybzt" style="width: 90px;">
        							<option value="">全&nbsp;&nbsp;部</option>
        							<option value="已审核">已审核</option>
        							<option value="未审核">未审核</option>
        						</select>
        						&nbsp;
        						<span>路线名称：</span>
        							<input type="text" id="lxmc" >
        						</p>
        						<p style="margin:8px 0px 4px 20px;">
        						<span>隧道名称：</span>
        							<input type="text" id="sdmc" >
        						&nbsp;
        						<span>隧道代码：</span>
        							<input type="text" id="sddm" >
        							&nbsp;&nbsp;
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -40%;" onclick="showAll()"/>        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td width="100%" style="padding-top: 1%;padding-left:10px;">
                    <div>
						<table id="datagrid" >
						</table>
					</div>
			</td>
		</tr>
	</table>
	
</body>
</html>