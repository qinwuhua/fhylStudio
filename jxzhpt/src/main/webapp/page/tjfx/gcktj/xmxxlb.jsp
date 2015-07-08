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
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	<script type="text/javascript">
		var xmlx;
		$(function(){
			var url,columns;
			var params;
			if(parent.YMLib.Var.xmlx=='升级改造工程'){
				url="../../../qqgl/queryJhsh.do";
				params={'jhsh.xmlx':1,'jhsh.xdzt':-1,'jhsh.xzqhdm':parent.YMLib.Var.xzqhdm,'jhsh.xmbm':parent.YMLib.Var.nf};
				columns=[[{field:'gydw',title:'管养单位',width:120,align:'center'},{field:'xmmc',title:'项目名称',width:90,align:'center'},{field:'ghlxbh',title:'路线编码',width:100,align:'center'},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'jhnf',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){return row.xmbm.substring(0,4);}},{field:'jhjz',title:'查看详细',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.xmbm+"'"+')">查看详细</a>';}}]];
			}else if(parent.YMLib.Var.xmlx=='路面改造工程'){
				url="../../../qqgl/queryJhsh.do";
				params={'jhsh.xmlx':2,'jhsh.xdzt':-1,'jhsh.xzqhdm':parent.YMLib.Var.xzqhdm,'jhsh.xmbm':parent.YMLib.Var.nf};
				columns=[[{field:'gydw',title:'管养单位',width:120,align:'center'},{field:'xmmc',title:'项目名称',width:90,align:'center'},{field:'ghlxbh',title:'路线编码',width:100,align:'center'},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'jhnf',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){return row.xmbm.substring(0,4);}},{field:'jhjz',title:'查看详细',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.xmbm+"'"+')">查看详细</a>';}}]];
			}else if(parent.YMLib.Var.xmlx=='新建工程'){
				url="../../../qqgl/queryJhsh.do";
				params={'jhsh.xmlx':3,'jhsh.xdzt':-1,'jhsh.xzqhdm':parent.YMLib.Var.xzqhdm,'jhsh.xmbm':parent.YMLib.Var.nf};
				columns=[[{field:'gydw',title:'管养单位',width:120,align:'center'},{field:'xmmc',title:'项目名称',width:90,align:'center'},{field:'ghlxbh',title:'路线编码',width:100,align:'center'},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'jhnf',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){return row.xmbm.substring(0,4);}},{field:'jhjz',title:'查看详细',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.xmbm+"'"+')">查看详细</a>';}}]];
			}else if(parent.YMLib.Var.xmlx=='养护大中修工程'){
				url="../../../qqgl/queryJhsh2.do";
				params={'jhsh.xmlx':4,'jhsh.xdzt':-1,'jhsh.xzqhdm':parent.YMLib.Var.xzqhdm,'jhsh.xmbm':parent.YMLib.Var.nf};
				columns=[[{field:'gydw',title:'管养单位',width:120,align:'center'},{field:'xmmc',title:'项目名称',width:90,align:'center'},{field:'ghlxbh',title:'路线编码',width:100,align:'center'},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'jhnf',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){return row.xmbm.substring(0,4);}},{field:'jhjz',title:'查看详细',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.xmbm+"'"+')">查看详细</a>';}}]];
			}else if(parent.YMLib.Var.xmlx=='灾毁重建'){
				url="../../../qqgl/queryJhsh2.do";
				params={'jhsh.xmlx':5,'jhsh.xdzt':-1,'jhsh.xzqhdm':parent.YMLib.Var.xzqhdm,'jhsh.xmbm':parent.YMLib.Var.nf};
				columns=[[{field:'gydw',title:'管养单位',width:120,align:'center'},{field:'xmmc',title:'项目名称',width:90,align:'center'},{field:'ghlxbh',title:'路线编码',width:100,align:'center'},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'jhnf',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){return row.xmbm.substring(0,4);}},{field:'jhjz',title:'查看详细',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.xmbm+"'"+')">查看详细</a>';}}]];
			}else if(parent.YMLib.Var.xmlx=='安保工程'){
				url="../../../jhgl/queryAbgcList.do";
				params={'jh.jhnf':parent.YMLib.Var.nf,'lx.xzqhdm':parent.YMLib.Var.xzqhdm};
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.jckabgc.gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.jckabgc.lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.jckabgc.lxbm;}},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'jhnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}else if(parent.YMLib.Var.xmlx=='危桥改造'){
				url="../../../jhgl/queryWqgzList.do";
				params={'jh.sbnf':parent.YMLib.Var.nf,'lx.xzqhdm':parent.YMLib.Var.xzqhdm};
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.jckwqgz.gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.jckwqgz.lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.jckwqgz.lxbm;}},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'sbnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}else if(parent.YMLib.Var.xmlx=='灾害防治'){
				url="../../../jhgl/queryZhfzList.do";
				params={'jh.sbnf':parent.YMLib.Var.nf,'lx.xzqhdm':parent.YMLib.Var.xzqhdm};
				columns=[[{field:'gydwmc',title:'管养单位',width:120,align:'center',formatter:function(value,row,index){return row.jckzhfz.gydw;}},{field:'lxmc',title:'路线名称',width:90,align:'center',formatter:function(value,row,index){return row.jckzhfz.lxmc;}},{field:'lxbm',title:'路线编码',width:100,align:'center',formatter:function(value,row,index){return row.jckzhfz.lxbm;}},{field:'pfztz',title:'批复金额',width:80,align:'center'},{field:'sbnf',title:'上报年份',width:80,align:'center'},{field:'jhjz',title:'计划进展',width:80,align:'center',formatter:function(value,row,index){return '<a href="javascript:openWin('+"'"+row.id+"'"+')">查看详细</a>';}}]];
			}
			$('#xmlx').html(parent.YMLib.Var.xmlx);
			$('#xzqhmc').html(parent.YMLib.Var.xzqh);
			xmxxlist(url, columns,params);
			getBarChart();
		});
		function xmxxlist(url,columns,params){
			$('#grid').datagrid({
			    url:url,
			    queryParams:params,
			    singleSelect:true,
			    striped:true,
			    pagination:true,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:10,
			    height:255,
			    width:565,
			    columns:columns,
			    onSelect:function(rowIndex,rowData){
			    	
			    },
			    onLoadSuccess:function(){
			    	var d= $('#grid').datagrid('getData');
			    	$('#xmcount').html(d.total);
			    }
			});
		}
		function openWin(id){
			var url="";
			if(parent.YMLib.Var.xmlx=='升级改造工程'){
				YMLib.Var.xmbm=id;
				url="/jxzhpt/page/qqgl/jhsh/lmsj_xx.jsp";
			}else if(parent.YMLib.Var.xmlx=='路面改造工程'){
				YMLib.Var.xmbm=id;
				url="/jxzhpt/page/qqgl/jhsh/lmgz_xx.jsp";
			}else if(parent.YMLib.Var.xmlx=='新建工程'){
				YMLib.Var.xmbm=id;
				url="/jxzhpt/page/qqgl/jhsh/xjgc_xx.jsp";
			}else if(parent.YMLib.Var.xmlx=='灾害防治'){
				YMLib.Var.xmbm=id;
				url="/jxzhpt/page/qqgl/jhsh/shxm_xx1.jsp";
			}else if(parent.YMLib.Var.xmlx=='养护大中修工程'){
				YMLib.Var.xmbm=id;
				url="/jxzhpt/page/qqgl/jhsh/yhdzx_xx1.jsp";
			}else if(parent.YMLib.Var.xmlx=='安保工程'){
				YMLib.Var.jhbm=id;
				url="/jxzhpt/page/jhgl/jhkxx/abgc.jsp";
			}else if(parent.YMLib.Var.xmlx=='危桥改造'){
				YMLib.Var.jhbm=id;
				url="/jxzhpt/page/jhgl/jhkxx/wqgz.jsp";
			}else if(parent.YMLib.Var.xmlx=='灾害防治'){
				YMLib.Var.jhbm=id;
				url="/jxzhpt/page/jhgl/jhkxx/zhfz.jsp";
			}
			
			YMLib.UI.createWindow1("xx",parent.YMLib.Var.xmlx,url,"xx",980,400);
		}
		function getBarChart(){
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
				data:'xzqhdm='+parent.YMLib.Var.xzqhdm+'&xmlx='+parent.YMLib.Var.xmlx+'&ftlName='+$("input[name='radioTj']:checked").val()+'&nf='+parent.YMLib.Var.nf,
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
        					<span id="xzqhmc"></span>—<span id="xmlx"></span>项目包含路线【<span id="xmcount"></span>】个
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