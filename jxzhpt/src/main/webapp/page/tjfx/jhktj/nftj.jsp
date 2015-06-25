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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$('#grid').datagrid({
				url:'../../../jhgl/queryChildXzqh.do',
			    queryParams:{'xzqh.id':'36__00'},
			    fitColumns:false,
			    singleSelect:true,
			    striped:grid.striped,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:20,
			    height:375,
			    width:$('#grid').width(),
			    columns:[
			 		[
						{field:'name',title:'行政区划',width:100,align:'center',rowspan:2},
						{title:'合计',colspan:4},
						{title:'路面升级',colspan:4},
						{title:'路面改建',colspan:4},
						{title:'新建工程',colspan:4},
						{title:'水毁项目',colspan:4},
						{title:'养护大中修',colspan:4},
						{title:'危桥改造',colspan:4},
						{title:'安保工程',colspan:4},
						{title:'灾害防治',colspan:4}
					],
					[
					 	{field:'ZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'CGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
					    {field:'STZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'SL',title:'数量',width:60,align:'center',rowspan:1},
					    {field:'LMSJZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'LMSJCGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
					    {field:'LMSJSTZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'LMSJSL',title:'数量',width:60,align:'center',rowspan:1},
					    {field:'LMGJZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'LMGJCGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
						{field:'LMGJSTZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'LMGJSL',title:'数量',width:60,align:'center',rowspan:1},
					    {field:'XJZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'XJCGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
					    {field:'XJSTZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'XJSL',title:'数量',width:60,align:'center',rowspan:1},
					    {field:'SHZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'SHCGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
					    {field:'SHSTZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'SHSL',title:'数量',width:60,align:'center',rowspan:1},
					    {field:'YHDZXZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'YHDZXCGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
					    {field:'YHDZXSTZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'YHDZXSL',title:'数量',width:60,align:'center',rowspan:1},
					    {field:'WQGZZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'WQGZCGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
					    {field:'WQGZSTZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'WQGZSL',title:'数量',width:60,align:'center',rowspan:1},
					    {field:'ABGCZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'ABGCCGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
					    {field:'ABGCSTZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'ABGCSL',title:'数量',width:60,align:'center',rowspan:1},
					    {field:'ZHFZZTZ',title:'总投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'ZHFZCGS',title:'车购税(万元)',width:100,align:'center',rowspan:1},
					    {field:'ZHFZSTZ',title:'省投资(万元)',width:100,align:'center',rowspan:1},
					    {field:'ZHFZSL',title:'数量',width:60,align:'center',rowspan:1},
					]
			 	],
			 	onLoadSuccess:function(){
			 		var rows = $('#grid').datagrid("getRows");
			 		$.each(rows,function(index,item){
			 			queryMsgByXzqhdm(index,item.id);
			 		});
			 	}
			});
			queryjhkBar();
		});
		/**根据传入的下标和行政区划代码更新对应行数据
		* @param index grid的下标
		* @param xzqhdm 行政区划代码
		*/
		function queryMsgByXzqhdm(index,xzqhdm){
			$.ajax({
				type:'post',
				url:'../../../tjfx/queryNftj.do',
				async:false,
				dataType:'json',
				data:'nf='+$('#startYear').val()+'&xzqhdm='+xzqhdm,
				success:function(result){
		 			$('#grid').datagrid('updateRow',{
		 				index: index,
		 				row: result
		 			});
				}
 			});
		}
		function search(){
			jhkxzqhtj();
			queryjhkBar();
		}
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;计划库统计分析>&nbsp;年份项目统计</div>
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
        					<p style="margin:8px 0px 8px 20px;vertical-align:middle;">
        						<span style="vertical-align:middle;">统计年份：</span>
        						<select id="startYear" style="width:70px;vertical-align:middle;">
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
            		<div style="width:97%;">
            			<table id="grid" width="100%"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;">
	        			<div style="">
	        				<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">项目信息分布
	        			</div>
	        			<div style="height:300px;border: 1px #C0C0C0 solid;text-align: center;">
	        				<div id="anychart_div" style="width:900px;height:300px;margin:10px;"> 
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