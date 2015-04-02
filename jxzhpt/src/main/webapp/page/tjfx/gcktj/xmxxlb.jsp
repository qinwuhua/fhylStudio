<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目信息列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript">
		var xmlx;
		$(function(){
			var url,columns;
			xmlx=getQueryString("xmlx");
			if(getQueryString("xmlx")==1){
				url="../../../jhgl/queryGcgjList.do";
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.plan_lx_gcgjs[0].gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.plan_lx_gcgjs[0].lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.plan_lx_gcgjs[0].lxbm;}},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'sbnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}else if(getQueryString("xmlx")==2){
				url="../../../jhgl/queryGcsjList.do";
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.plan_lx_gcsjs[0].gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.plan_lx_gcsjs[0].lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.plan_lx_gcsjs[0].lxbm;}},{field:'pftz',title:'批复金额',width:80,align:'center'},{field:'jhnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}else if(getQueryString("xmlx")==3){
				url="../../../jhgl/queryShuihList.do";
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.shuihs[0].gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.shuihs[0].lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.shuihs[0].lxbm;}},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'sbnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}else if(getQueryString("xmlx")==4){
				url="../../../jhgl/queryYhdzxList.do";
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.plan_lx_yhdzxs[0].gydwmc;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.plan_lx_yhdzxs[0].lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.plan_lx_yhdzxs[0].lxbm;}},{field:'totalsubsidyfund',title:'批复金额',width:80,align:'center'},{field:'sbnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}else if(getQueryString("xmlx")==5){
				url="../../../jhgl/queryAbgcList.do";
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.jckabgc.gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.jckabgc.lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.jckabgc.lxbm;}},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'jhnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}else if(getQueryString("xmlx")==6){
				url="../../../jhgl/queryWqgzList.do";
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.jckwqgz.gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.jckwqgz.lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.jckwqgz.lxbm;}},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'sbnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}else if(getQueryString("xmlx")==7){
				$('#xmlx').html("灾害防治");
				url="../../../jhgl/queryZhfzList.do";
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.jckzhfz.gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.jckzhfz.lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.jckzhfz.lxbm;}},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'sbnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}
			xmxxlist(url, columns,getQueryString("nf"));
			getBarChart();
		});
		function openWin(id){
			var url="/jxzhpt/page/jhgl/jhkxx/";
			if(xmlx=="1")
				url+="gclmgj.jsp";
			else if(xmlx=="2")
				url+="gclmsj.jsp";
			else if(xmlx=="3")
				url+="shxm.jsp";
			else if(xmlx=="4")
				url+="yhdzx.jsp";
			else if(xmlx=="5")
				url+="abgc.jsp";
			else if(xmlx=="6")
				url+="wqgz.jsp";
			else if(xmlx=="7")
				url+="zhfz.jsp";
			openDialog('xmxx_xx','项目计划详情',url,id);
		}
		function getQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null)
				return unescape(r[2]);
			return null;
		}
		function getBarChart(){
			var xzqhdm=$.cookie("unit").substring(5);
			if(xzqhdm=="360000")
				xzqhdm=xzqhdm.substring(0,2)+"____";
			else
				xzqhdm=xzqhdm.substring(0,4)+"__";
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");
		    barChart_1.width =580;
		    barChart_1.height =300;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
			$.ajax({
				type:'post',
				async : false,
				url:'../../../tjfx/queryXmlxTj.do',
				data:'xzqhdm='+xzqhdm+'&xmlx='+xmlx+'&ftlName='+$("input[name='radioTj']:checked").val()+'&nf='+getQueryString("nf"),
				dataType:'text',
				success:function(data){
					barChart_1.setData(data);
				}
			});
		}
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2">
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;工程库统计分析>&nbsp;项目统计</div>
					</div>
	            </td>
        	</tr>
        	<tr>
        		<td style="padding-left: 10px;padding-top: 10px;" width="40%">
        			<div>
        				<div>
        					<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">
        					江西省—<span id="xmlx"></span>项目包含路线【<span id="xmcount"></span>】个
        				</div>
        				<div style="padding-top: 5px;">
        					<table id="grid"></table>
        				</div>
        			</div>
        		</td>
        		<td style="text-align: center;vertical-align:middle;" rowspan="2">
        			<img alt="表通" title="sdfds" src="${pageContext.request.contextPath}/page/tjfx/img/xmtjdt.png" height="600">
        		</td>
        	</tr>
        	<tr>
        		<td style="padding-left: 10px;padding-top: 10px;">
        			<input type="radio" onclick="getBarChart()" checked="checked" name="radioTj" value="ztz"/>按项目投资统计
        			<input type="radio" onclick="getBarChart()" name="radioTj" value="sl">按项目数量统计
        			<div id="anychart_div" style="width:97%;height:300px;margin:10px;"> 
						<div>
							<param name="wmode" value="transparent" />
						</div>
					</div>
        		</td>
        	</tr>
		</table>
	</div>
	<div id="xmxx_xx"></div>
</body>
</html>