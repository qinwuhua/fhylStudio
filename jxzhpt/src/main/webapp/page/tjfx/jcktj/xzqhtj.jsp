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
			sbnf("searchYear");
			load();
		});
		function load(){
			jckxzqhtj();
		}
		function jckxzqhtj(){
			$('#grid').datagrid({
			    url:'../../../tjfx/queryJcktj.do',
			    queryParams:{'nf':$('#searchYear').combobox('getValue')},
			    striped:true,
			    fitColumns:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:20,
			    height:355,
			    width:1030,
			    columns:[
						    [
						     	{field:'xzqhmc',title:'行政区划',width:100,align:'center',rowspan:2},
						     	{title:'危桥改造',colspan:2},
						     	{title:'安保工程',colspan:2},
						     	{title:'灾害防治',colspan:2},
						    ],
						    [
						     	{field:'WQLCZJ',title:'危桥长度总计(米)',width:100,align:'center',rowspan:1},
						     	{field:'WQXMZJ',title:'危桥数量总计',width:100,align:'center',rowspan:1},
						     	{field:'ABLCZJ',title:'隐患里程总计(公里)',width:100,align:'center',rowspan:1},
						     	{field:'ABXMZJ',title:'项目数量总计',width:100,align:'center',rowspan:1},
						     	{field:'ZHLCZJ',title:'隐患里程总计(公里)',width:100,align:'center',rowspan:1},
						     	{field:'ZHXMZJ',title:'项目数量总计',width:100,align:'center',rowspan:1},
						    ]
					    ],
			    onLoadSuccess:function(){
			    	queryBar();
			    },
			    onSelect:function(rowIndex, rowData){
			    }
			});
		}
		function queryBar(){
			alert($('#selxmlx').val());
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
		    barChart_1.width =980;
		    barChart_1.height =300;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
		    $.ajax({
				type:"post",
				url:"../../../tjfx/queryJcktj1.do?xmlx="+$('#selxmlx').val(),
				dataType:'text',
				success:function(msg){
					barChart_1.setData(msg);
				}
			});
		}
		function sbnf(id){
			var myDate = new Date();
			var years=[];
			var first;
			for(var i=0;i<=10;i++){
				if(i==0)
					first=myDate.getFullYear()-i;
				years.push({text:(myDate.getFullYear()-i)});
			}
			$('#'+id).combobox({    
			    data:years,
			    valueField:'text',    
			    textField:'text'   
			});
			$('#'+id).combobox("setValue",first);
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">统计分析>&nbsp;基础库统计分析>&nbsp;行政区划统计</div>
	</div>
		<table id="table_message" width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
        		<td style="padding-left: 8px;padding-right: 8px;padding-top: 8px;" colspan="2">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div id="searchDiv">
        					<p style="margin:8px 0px 8px 20px;">
        						<span>年份：</span>
        						<select id="searchYear" style="width:80px;">
		        					<option value="2011">2011年</option>
		        					<option value="2012">2012年</option>
		      						<option value="2013">2013年</option>
		        					<option value="2014">2014年</option>
		        					<option selected="selected" value="2015">2015年</option>
		        				</select>
        						<img alt="搜索" onclick="load()" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
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