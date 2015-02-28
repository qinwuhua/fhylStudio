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
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;公路改造工程新上、续建工程项目完成情况表</div>
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
							<table width="4000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;"> 江西省2015年公路路网结构改造工程统计月报表（三）    灾害防治 </caption>
								<thead>
									<tr>
										<td colspan="11">一、 项 目 计 划</td>
										<td colspan="18">二、 本年元月至本月完成情况</td>
										<td colspan="2">三、本月进展情况</td>
										<td colspan="16">四、 自开工至本月底累计完成情况</td>
									</tr>
									<tr>
										<td rowspan="3">项目所在县市</td>
										<td rowspan="3">路线编码、项目名称及路线桩号</td>
										<td rowspan="3">原技术等级</td>
										<td rowspan="3">建设技术标准</td>
										<td rowspan="3">项目里程（公里）</td>
										<td rowspan="3">总投资（万元）</td>
										<td rowspan="3">中央车购税（万元）</td>
										<td rowspan="3">地方配套（万元）</td>
										<td rowspan="3">项目在建个数（个）</td>										
										<td rowspan="3">项目完工个数（个）</td>
										<td rowspan="3">项目未开工个数（个）</td>
										<td rowspan="3">本年实施里程(公里)</td>
										<td colspan="2">本年计划投资</td>
										<td colspan="6">累计资金到位（万 元）</td>
										<td rowspan="3">项目完成投资(万元)</td>
										<td colspan="8">完 成 工 程 量（公里)</td>
										<td rowspan="3">新增资金到位</td>
										<td rowspan="3">新增完成路面工程量（公里）</td>
										<td colspan="6">累计资金到位（万 元）</td>
										<td rowspan="3">项目完成投资（万元）</td>
										<td colspan="8">累 计 完 成 工 程 量 （ 公 里 )</td>
										<td rowspan="3">项目未完工程量（公里）</td>
									</tr>	
									<tr>
										<td rowspan="2">合计</td>
										<td rowspan="2">其中：<br>中央车购税</td>
										<td rowspan="2">合计</td>
										<td rowspan="2">中央车购税</td>
										<td colspan="2">地方配套</td>
										<td rowspan="2">省厅贴息(贷款)</td>
										<td rowspan="2">其他资金</td>
										<td colspan="5">按技术等级</td>
										<td colspan="2">按路面类型</td>
										<td rowspan="2">砂石垫层通车</td>
										<td rowspan="2">合计</td>
										<td rowspan="2">中央车购税</td>
										<td colspan="2">地方配套</td>
										<td rowspan="2">省厅贴息(贷款)</td>
										<td rowspan="2">其他资金</td>
										<td colspan="5">按技术等级</td>
										<td colspan="2">按路面类型</td>
										<td rowspan="2">砂石垫层通车</td>
									</tr>
									<tr>
										<td>小计</td>
										<td>其中：银行贷款</td>
										<td>小计</td>
										<td>一级</td>
										<td>二级</td>
										<td>三级</td>
										<td>四级</td>
										<td>沥青路</td>
										<td>水泥砼</td>
										<td>小计</td>
										<td>其中：银行贷款</td>
										<td>小计</td>
										<td>一级</td>
										<td>二级</td>
										<td>三级</td>
										<td>四级</td>
										<td>沥青路</td>
										<td>水泥砼</td>
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