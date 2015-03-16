<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目类型统计趋势分析</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jhkglGrid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			xzqhComboxTree("xzqh");
			search();
		});
		function search(){
			var xzqhdm=$('#xzqh').combotree("getValue");
			if(new RegExp("^36[0-9]{2}[1-9][0-9]$").test(xzqhdm) || new RegExp("^36[0-9]{2}[0-9][1-9]$").test(xzqhdm)){
				xzqhdm=xzqhdm;
			}else if(new RegExp("^36[0-9][1-9][0-9]{2}$").test(xzqhdm) || new RegExp("^36[1-9][0-9][0-9]{2}$").test(xzqhdm)){
				xzqhdm=xzqhdm.substring(0,4)+"__";
			}else if(new RegExp("^360000$").test(xzqhdm)){
				xzqhdm=xzqhdm.replace(/0000/,"____");
			}
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
		    barChart_1.width =980;
		    barChart_1.height =450;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
			$.ajax({
				type:'post',
				url:"../../../tjfx/queryJhktjt3.do?xzqhdm="+xzqhdm+"&nf="+$('#startYear').val()+"&end="+$('#endYear').val(),
				dataType:'text',
				success:function(data){
					barChart_1.setData(data);
				}
			});
		}
	</script>
</head>
<body>
	<div style="text-align:left;font-size:12px;margin:0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2">
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;计划库统计分析>&nbsp;项目类型统计趋势分析</div>
					</div>
	            </td>
        	</tr>  
        	<tr>
        		<td style="padding-left: 8px;padding-right: 8px;padding-top: 8px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 8px 20px;">
        						<span style="vertical-align:middle;">&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;vertical-align:middle;"></select>
        						&nbsp;开始年份
        						<select id="startYear" style="width:70px;">
        							<option value="2011" selected="selected">2011年</option>
        							<option value="2012">2012年</option>
        							<option value="2013">2013年</option>
        							<option value="2014">2014年</option>
        							<option value="2015">2015年</option>
        						</select>
        						结束年份
        						<select id="endYear" style="width:70px">
        							<option value="2011">2011年</option>
        							<option value="2012">2012年</option>
        							<option value="2013">2013年</option>
        							<option value="2014">2014年</option>
        							<option value="2015" selected="selected">2015年</option>
        						</select>
        						<img onclick="search()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td style="text-align: center;vertical-align:middle;">
        			<div id="anychart_div" style="width:97%;height:300px;"> 
						<div>
							<param name="wmode" value="transparent" />
						</div>
					</div>
        		</td>
        	</tr>
		</table>
	</div>
</body>
</html>