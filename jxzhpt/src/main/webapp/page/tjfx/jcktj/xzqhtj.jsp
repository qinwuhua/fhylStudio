<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>按行政区划统计</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript">
		$(function(){
			jckxzqhtj();
			queryBar();
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">统计分析>&nbsp;基础库统计分析>&nbsp;行政区划统计</div>
	</div>
		<table id="table_message" width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;">
	        			<div style="">
	        				<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">项目信息分布
	        			</div>
	        			<div style="height: 350px;border: 1px #C0C0C0 solid;text-align: center;">
	        				<div align="left" style="text-align: left;margin-left: 10px;margin-top: 10px;">
	        					<select id="selxmlx" onchange="queryBar()" style="text-align: left;">
		        					<option value="abgc" selected="selected">安保工程</option>
		        					<option value="wqgz">危桥改造</option>
		        					<option value="zhfz">灾害防治</option>
	        					</select>
	        				</div>
	        				<div id="anychart_div" style="width:900px;height:300px;margin:0px;"> 
								<div>
									<param name="wmode" value="transparent" />
								</div>
							</div>
	        			</div>
	        		</div>
        		</td>
        	</tr>
		</table>
</body>
</html>