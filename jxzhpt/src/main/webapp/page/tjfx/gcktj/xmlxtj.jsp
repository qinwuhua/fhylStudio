<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>按项目类型统计</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	<script type="text/javascript">
		$(function(){
			loadXzqh("xzqh",$.cookie("dist"));
			sbnf("searchYear");
			loadData();
		});
		
		function loadData(){
			var xzqhdm=parent.YMLib.Var.xzqhdm!=null ? parent.YMLib.Var.xzqhdm : $('#xzqh').combobox("getValue");
			
			$('#grid').datagrid({
				url:'../../../tjfx/queryGckXmlxtj.do',
			    queryParams:{'nf':$('#searchYear').combobox('getValue'),'xzqhdm':xzqhdm},
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:20,
			    height:255,
			    width:$('#searchDiv').width(),
			    columns:[
			             [
					     	{field:'XMLX',title:'项目类型',width:100,align:'center',rowspan:2},
					     	{title:'合计',colspan:2},
					     	{title:'未开工项目合计',colspan:2},
					     	{title:'在建项目合计',colspan:2},
					     	{title:'竣工项目合计',colspan:2}
					    ],
					    [
					     	{field:'ZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					     	{field:'SL',title:'数量',width:100,align:'center',rowspan:1},
					     	{field:'WKGZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					     	{field:'WKGSL',title:'数量',width:100,align:'center',rowspan:1},
					     	{field:'ZJZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					     	{field:'ZJSL',title:'数量',width:100,align:'center',rowspan:1},
					     	{field:'WGZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					     	{field:'WGSL',title:'数量',width:100,align:'center',rowspan:1}
					    ]
				],
				onLoadSuccess:function(){
					loadBar1(xzqhdm);
					loadBar2(xzqhdm);
					parent.YMLib.Var.xzqhdm=null;
			    },
				onSelect:function(rowIndex, rowData){
					window.location.href='../gcktj/xmxxlb.jsp?xmlx='+rowIndex+'&nf='+$('#searchYear').combo('getValue');
				}
			});
		}
		function loadBar1(xzqhdm){
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");
		    barChart_1.width =980;
		    barChart_1.height =300;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
		    $.ajax({
				type:"post",
				url:'../../../tjfx/queryGckXmlxtjt.do',
				data:'xzqhdm='+xzqhdm+'&nf='+$('#searchYear').combo('getValue')+'&ftlName=gckbar2.ftl&xmlx=项目类型-金额',
				dataType:'text',
				success:function(msg){
					//var right=window.parent.window.document.getElementById("rightContent").contentWindow;
					barChart_1.setData(msg);
				}
			});
		}
		
		function loadBar2(xzqhdm){
			barChart_2= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");
		    barChart_2.width =980;
		    barChart_2.height =300;
		    barChart_2.padding =0;
		    barChart_2.wMode="transparent1";
		    barChart_2.write("anychart_div1");
		    var date=new Date();
		    $.ajax({
				type:"post",
				url:'../../../tjfx/queryGckXmlxtjt.do',
				data:'xzqhdm='+xzqhdm+'&nf='+$('#searchYear').combo('getValue')+'&ftlName=gckbar3.ftl&xmlx=项目类型-数量',
				dataType:'text',
				success:function(msg){
					//var right=window.parent.window.document.getElementById("rightContent").contentWindow;
					barChart_2.setData(msg);
				}
			});
		}
		function loadXzqh(id, dwbm) {
			$('#' + id).combotree({
				checkbox : true,
				url : '/jxzhpt/xtgl/selAllXzqh.do?yhdw=' + dwbm,
				onBeforeExpand : function(node, param) {
					$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="
							+ node.id;
				},
				onSelect : function(node) {
					YMLib.Var.DistName = node.text;
				}
			});
			$('#' + id).combotree('setValue', dwbm);
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
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2">
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;工程库统计分析>&nbsp;项目类型统计</div>
					</div>
	            </td>
        	</tr>  
        	<tr>
        		<td style="padding-left: 8px;padding-right: 8px;padding-top: 8px;" colspan="2">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div id="searchDiv">
        					<p style="margin:8px 0px 8px 20px;">
        						<span style="vertical-align:middle;">&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;vertical-align:middle;"></select>
        						<span>&nbsp;年份：</span>
        						<select id="searchYear" style="width:80px;">
		        					<option value="2011">2011年</option>
		        					<option value="2012">2012年</option>
		      						<option value="2013">2013年</option>
		        					<option value="2014">2014年</option>
		        					<option selected="selected" value="2015">2015年</option>
		        				</select>
        						<img alt="搜索" onclick="loadData()" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;" colspan="2">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td style="text-align: center;vertical-align:middle;padding-top: 10px;">
        			<div id="anychart_div" style="width:97%;height:300px;margin:10px;"> 
						<div>
							<param name="wmode" value="transparent" />
						</div>
					</div>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: center;vertical-align:middle;padding-top: 10px;">
        			<div id="anychart_div1" style="width:97%;height:300px;margin:10px;"> 
						<div>
							<param name="wmode1" value="transparent1" />
						</div>
					</div>
        		</td>
        	</tr>
		</table>
	</div>
</body>
</html>