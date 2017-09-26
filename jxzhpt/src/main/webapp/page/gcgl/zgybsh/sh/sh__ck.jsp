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
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/sh.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/SimpleCanleder.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SimpleCanleder.js"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script> --%>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','行政等级');
			tsdq('ddlTSDQ');
			if(getParam("t")=='1'){
				$("#ybzt").val('未审核');
			}
			gcglxmnf("ddlYear");
			var urlid=getUrlParame('id');
			//urlxmnf("ddlYear",urlid);
			showAll__ck();
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
				<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;<span id="astext">进度审核</span>>&nbsp;<span id="bstext"></span>>&nbsp;灾毁重建工程项目</div>
			</div>     
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1%  0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 1% 0% 1% 2%;">
        						<span>行政区划：</span>
        						<input id="xzqh" style="width: 208px;">
        						<span>路线名称：</span>
        							<input type="text" id="lxmc" style="width: 116px" >
        						<span>项目年份：</span> 
        						<select name="ddlYear" id="ddlYear" style="width: 70px;">
        						<option value="">全部</option>
        						</select>
        						
        						</p>
								   <p style="margin: 1% 0% 1% 2%;">
								<span style=" vertical-align:middle;">技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" style="width:70px; vertical-align:middle;"></select>
								<span style=" vertical-align:middle;">原行政等级：</span>
								<select name="ddlGldj" id="ddlGldj" style="width:70px; vertical-align:middle;"></select>
        						<span style=" vertical-align:middle;">特殊地区：</span>
								<select name="ddlTSDQ" id="ddlTSDQ" style="width:120px; vertical-align:middle;">
								</select>
        						<span>月报状态：</span>
        						<select id="ybzt" style="width: 70px;">
        							<option value="">全&nbsp;&nbsp;部</option>
        							<option value="已上报">已上报</option>
        							<option value="未上报">未上报</option>
        						</select>
								</p>
								<p style="margin: 1% 0% 1% 2%;">
								<span>路线编码：</span>
        						<span><input type="text" id="lxbm" style="width:95px;" /></span>
        						<span>项目名称：</span>
        						<span><input type="text" id="xmmc" style="width:95px;" /></span>
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll__ck()"/>        					</p>
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
	</div>
</body>
</html>