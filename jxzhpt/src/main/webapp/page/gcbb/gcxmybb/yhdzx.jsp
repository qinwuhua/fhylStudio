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
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;养护路面大中修工程进度报表</div>
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
        						<input type="text" id="jssj"  class="easyui-datebox" style="width:150px;">
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
								<caption align="top" style="font-size:x-large;font-weight: bolder;">2015养护路面大中修工程进度报表 </caption>
								<thead>
									<tr>
										<td rowspan="4">项目名称</td>
										<td rowspan="4">是否归口市局养护部门</td>
										<td rowspan="4">建设地点</td>
										<td rowspan="4">路线编号</td>
										<td rowspan="4">起讫点桩号</td>
										<td rowspan="4">里程长度（km）</td>
										<td colspan="3">养护类别（KM）</td>
										<td rowspan="4">开工日--竣工日</td>
										<td rowspan="4">原路面类型</td>
										<td rowspan="4">设计路面类型</td>
										<td colspan="15">主 要 工 程数 量 完 成 情 况</td>
										<td colspan="6">投 资 额 完 成 情 况 </td>
										<td rowspan="4">形象进度<br>（未开工\在建\完工）</td>
										<td rowspan="4">备注</td>
									</tr>	
									<tr>
										<td rowspan="3">大修（KM）</td>
										<td rowspan="3">中修（KM）</td>
										<td rowspan="3">预防性养护</td>
										<td colspan="5">垫层</td>
										<td colspan="5">基层</td>
										<td colspan="5">面层</td>
										<td rowspan="3">计划（万元）</td>
										<td rowspan="3">批准预算（万元）</td>
										<td rowspan="3">本月完成（万元）</td>
										<td colspan="3">累计</td>
									</tr>
									<tr>
										<td rowspan="2">计划数量（M³）</td>										
										<td rowspan="2">本月完成数量（M³）</td>
										<td colspan="3">累计</td>
										<td rowspan="2">计划数量（M³）</td>										
										<td rowspan="2">本月完成数量（M³）</td>
										<td colspan="3">累计</td>
										<td rowspan="2">计划数量（M³）</td>										
										<td rowspan="2">本月完成数量（M³）</td>
										<td colspan="3">累计</td>
										<td rowspan="2">年初至本月完成（万元）</td>
										<td rowspan="2">自开工累计完成（万元）</td>
										<td rowspan="2">完成比例(%)</td>
									</tr>
									<tr>
										<td>年初至本月完成数量（M³）</td>
										<td>自开工累计完成数量（M³）</td>
										<td>完成比例(%)</td>
										<td>年初至本月完成数量（M³）</td>
										<td>自开工累计完成数量（M³）</td>
										<td>完成比例(%)</td>
										<td>年初至本月完成数量（M³）</td>
										<td>自开工累计完成数量（M³）</td>
										<td>完成比例(%)</td>
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