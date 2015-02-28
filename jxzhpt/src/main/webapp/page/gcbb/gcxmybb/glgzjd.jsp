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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadUnit("gydw",$.cookie("unit"));
			loadDist("xzqh",$.cookie("dist"));
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
}
a:active {
 text-decoration: none;
}
table {
	border-collapse:collapse;
}
table thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
-->
</style>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;公路工程改造进度完成情况汇总表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>起始年月：</span>
        						<input type="text" id="kssj" class="easyui-datebox" style="width:150px;">
        						<span>截止年月：</span>
        						<input type="text" id="jssj" class="easyui-datebox" style="width:150px;">
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" />
<%-- 									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" /> --%>
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>行政等级：</span>
        						<select style="width:150px;">
        							<option>全部</option>
        							<option>国道</option>
        							<option>省道</option>
        							<option>县道</option>
        							<option>乡道</option>
        							<option>村道</option>
        							<option>专道</option>
        						</select>
        						<span>路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;线：</span>
        						<input type="text"  style="width: 145px">
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%-- 									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" /> --%>
									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" />
        					</p>         					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div style="width:100%;height:150px">
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow-y:hidden;">
							<table width="4500px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">普通国省干线公路建设项目工程进度完成情况汇总表</caption>
								<thead>
									<tr>
										<td rowspan="3">序号</td>
										<td rowspan="3">路线编码</td>
										<td rowspan="3">项目名称</td>
										<td rowspan="3">年度计划</td>
										<td rowspan="3">改造公里（公里）</td>
										<td rowspan="3">原技术等级</td>
										<td rowspan="3">建设技术标准</td>
										<td rowspan="3">开工时间</td>
										<td colspan="11">计划工程</td>
										<td colspan="12">本月完成工程量</td>
										<td colspan="12">自开工累计完成工程量</td>
										<td colspan="4">本年元月至本月累计完成工程量</td>
										<td rowspan="3">备注</td>
									</tr>	
									<tr>
										<td rowspan="2">投资额（万元）</td>
										<td rowspan="2">路基土石方（m³）</td>
										<td colspan="2">桥梁</td>
										<td rowspan="2">涵洞（米）</td>
										<td colspan="2">隧道</td>
										<td colspan="4">路面工程（公里）</td>
										<td rowspan="2">投资额（万元）</td>
										<td rowspan="2">占投资比例（%）</td>
										<td rowspan="2">路基土石方 （m³）</td>
										<td colspan="2">桥梁</td>
										<td rowspan="2">涵洞（米）</td>
										<td colspan="2">隧道</td>
										<td colspan="4">路面工程（公里）</td>
										<td rowspan="2">投资额（万元）</td>
										<td rowspan="2">占投资比例（%）</td>
										<td rowspan="2">路基土石方（m³）</td>
										<td colspan="2">桥梁</td>
										<td rowspan="2">涵洞（米）</td>
										<td colspan="2">隧道</td>
										<td colspan="4">路面工程（公里）</td>
										<td rowspan="2">投资额（万元）</td>
										<td rowspan="2">占投资比例（%）</td>
										<td colspan="2">路面工程（公里）</td>
									</tr>
									<tr>
										<td>米</td>
										<td>座</td>
										<td>米</td>
										<td>座</td>
										<td>垫层</td>
										<td>基层</td>
										<td>沥青路面</td>
										<td>水泥路面</td>
										<td>米</td>
										<td>座</td>
										<td>米</td>
										<td>座</td>
										<td>垫层</td>
										<td>基层</td>
										<td>沥青路面</td>
										<td>水泥路面</td>
										<td>米</td>
										<td>座</td>
										<td>米</td>
										<td>座</td>
										<td>垫层</td>
										<td>基层</td>
										<td>沥青路面</td>
										<td>水泥路面</td>
										<td>沥青路面</td>
										<td>水泥路面</td>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>