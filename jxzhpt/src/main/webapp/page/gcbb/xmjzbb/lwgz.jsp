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
// 			loadUnit("gydw",$.cookie("unit"));
// 			loadDist("xzqh",$.cookie("dist"));
			setjhxdnf();
		});
		function setjhxdnf(){
			alert("xx");
			$("#jhxdnf").combotree({    
			    url: '/jxzhpt/xmjzbb/setjhxdnf.do',    
			    required: true   
			})
		}
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
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;项目进展报表>&nbsp;路网结构改造工程项目进展情况表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:1050px; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:168px;"></select>
        						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:179px;"></select>
        						&nbsp;&nbsp;
        						<span>资金下达年份：</span>
        						<input type="text" id="jhxdnf" >
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" />
<%-- 									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" /> --%>
        					</p>
        					<p style="margin: 8px 0px 8px 20px;"> 						
        						<span>特殊地区：</span>
        						<select style="width:50px;">
        							<option>全部</option>
        							<option>丘陵</option>
        							<option>河流</option>
        						</select>
        						<span>建设状态：</span>
        						<select id="jszt" style="width:50px;">
        						<option>全部</option>
        						<option>全部</option>
        						<option>未开工</option>
        						<option>在建</option>
        						<option>竣工</option>
        						</select>

        						&nbsp;&nbsp;
        						<span>累计拨付资金：</span>
        						<select style="width:50px;">
        							<option>全部</option>
        							<option>零</option>
        							<option>非零</option>
        						</select>
        						
        						<span>未拨付资金：</span>
        						<select style="width:50px;">
        							<option>全部</option>
        							<option>零</option>
        							<option>非零</option>
        						</select>
        						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						<span>项目名称：</span>
        						<input type="text"  style="width:128px;">
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
							<table width="3000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">路网结构改造工程项目资金拔付情况表</caption>
								<thead>
									<tr>
										<td rowspan="2">序号</td>
										<td rowspan="2">所在设区市</td>
										<td rowspan="2">特殊区域</td>
										<td rowspan="2">项目名称</td>
										<td rowspan="2">建设性质</td>
										<td colspan="3">项目段落</td>
										<td rowspan="2">工程分类</td>
										<td rowspan="2">计划下达年度</td>
										<td rowspan="2">计划下达资金（万元）</td>
										<td rowspan="2">概预算（万元）</td>
										<td rowspan="2">已拨付资金（万元）</td>
										<td rowspan="2">本次拨付资金（万元）</td>
										<td rowspan="2">累计拨付资金（万元）</td>
										<td rowspan="2">未拨付资金（万元）</td>
										<td rowspan="2">建设状态</td>
										<td rowspan="2">完工桥长或隐患里程</td>
										<td rowspan="2">开工日期</td>
										<td rowspan="2">完工日期</td>
										<td rowspan="2">预计完工时间</td>
										<td rowspan="2"> 情况说明 </td>
										<td rowspan="2"> 计划下达文号 </td>
										<td rowspan="2"> 相关处室意见</td>
										<td rowspan="2"> 财审处意见 </td>
									</tr>
									<tr>
										<td>起点桩号<br>或中心桩号</td>
										<td> 迄点桩号 </td>
										<td>桥长或隐<br>患里程（延米）</td>
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