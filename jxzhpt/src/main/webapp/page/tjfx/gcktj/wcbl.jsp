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
			loadGrid();
		});
		function loadGrid(){
			$('#grid').datagrid({
			    url:'../../../tjfx/queryGckWcbl.do',
			    queryParams:{'nf':$('#searchYear').combobox('getValue')},
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:20,
			    height:330,
			    width:$('#grid').width(),
			    columns:
			    	[
				    	[
							{field:'XZQH',title:'行政区划',width:100,align:'center',rowspan:2},
							{title:'里程',colspan:3},
							{title:'车购税',colspan:3},
							{title:'完成投资额',colspan:3}
						],
						[
							{field:'ZLC',title:'总里程',width:100,align:'center',rowspan:1},
							{field:'WCLC',title:'完成里程',width:100,align:'center',rowspan:1},
							{field:'LCBL',title:'完成比例',width:100,align:'center',rowspan:1},
							
							{field:'CGS',title:'计划车购税',width:100,align:'center',rowspan:1},
							{field:'DWCGS',title:'到位车购税',width:100,align:'center',rowspan:1},
							{field:'CGSBL',title:'到位比例',width:100,align:'center',rowspan:1},
							
							{field:'ZTZ',title:'计划总投资',width:100,align:'center',rowspan:1},
							{field:'WCTZ',title:'完成投资',width:100,align:'center',rowspan:1},
							{field:'TZBL',title:'完成投资比例',width:100,align:'center',rowspan:1},
						]
			    	],
			    onLoadSuccess:function(){
			    	loadTjt();
			    }
			});

		}
		
		function loadTjt(){
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");
		    barChart_1.width =980;
		    barChart_1.height =300;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
		    $.ajax({
				type:"post",
				url:'../../../tjfx/queryGckWcblt.do',
				data:'nf='+$('#searchYear').combo('getValue')+'&ftlName=gck_wctj.ftl&xmlx=完成比例',
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
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;工程库统计分析>&nbsp;与上年完成投资额比</div>
					</div>
	            </td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div style="margin-bottom:10px;">
            			<span style="vertical-align:middle;">年份：</span>
        				<select id="searchYear" style="width:80px;">
        					<option value="2011">2011年</option>
        					<option value="2012">2012年</option>
      						<option value="2013">2013年</option>
        					<option value="2014">2014年</option>
        					<option selected="selected" value="2015">2015年</option>
        				</select>
        				<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="importExcel()" style="vertical-align:middle;"/>
            		</div>
            		<div>
            			<table id="grid" width="99%"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 5px;">
	        			<div style="">
	        				<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">与上年完成投资额比柱状图
	        			</div>
	        			<div style="height: 300px;border: 1px #C0C0C0 solid;text-align: center;">
	        				<div id="anychart_div" style="width:97%;height:300px;margin:10px;"> 
								<div>
									<param name="wmode" value="transparent" />
								</div>
							</div>
	        			</div>
	        		</div>
        		</td>
        	</tr>
		</table>
	</div>
</body>
</html>