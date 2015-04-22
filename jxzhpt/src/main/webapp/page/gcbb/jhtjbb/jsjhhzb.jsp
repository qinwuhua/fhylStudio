<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
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
table tbody tr td {
	text-align:center; 	
	font-size:1em;
/* 	font-weight:bold; */
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
-->
</style>
<script type="text/javascript">
$(function(){
	selYearList("year");
	loadUnit1("gydw",$.cookie("unit"));
	loadDist1("xzqh",$.cookie("dist"));
	startSearch();
});
function startSearch(){
	$("#titleYear").html($("#year").combotree("getValue"));
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcbb/getLwjgjshzb.do',
		dataType:"json",
		data:"dist="+$("#xzqh").combotree("getValue")+"&unit="+$("#gydw").combotree("getValue")+"&nf="+$("#year").combotree("getValue"),
		success:function(msg){
			var str="";
			$("#table_tbody").html("");
			if(msg!=null){
				for(var i=0;i<msg.length;i++){
					
					if(i!=6){
						if(i==0||i==3){
							str+="<tr align='center'><td rowspan='3'>"+msg[i].v_0+"</td>"+"<td>"+msg[i].v_1+"</td>"+"<td>"+msg[i].v_2+"</td>"+"<td>"+msg[i].v_3+"</td>"
							+"<td>"+msg[i].v_4+"</td>"+"<td>"+msg[i].v_5+"</td>"+"<td>"+msg[i].v_6+"</td>"+"<td>"+msg[i].v_7+"</td></tr>";
						}else{
							str+="<tr align='center'><td>"+msg[i].v_1+"</td>"+"<td>"+msg[i].v_2+"</td>"+"<td>"+msg[i].v_3+"</td>"
							+"<td>"+msg[i].v_4+"</td>"+"<td>"+msg[i].v_5+"</td>"+"<td>"+msg[i].v_6+"</td>"+"<td>"+msg[i].v_7+"</td></tr>";
						}
					}else{
						str+="<tr align='center'><td>"+msg[i].v_0+"</td>"+"<td>"+msg[i].v_1+"</td>"+"<td>"+msg[i].v_2+"</td>"+"<td>"+msg[i].v_3+"</td>"
						+"<td>"+msg[i].v_4+"</td>"+"<td>"+msg[i].v_5+"</td>"+"<td>"+msg[i].v_6+"</td>"+"<td>"+msg[i].v_7+"</td></tr>";
					}
				}
			}else{
				str+="<tr align='center'><td colspan='8'>暂无数据</td></tr>";
			}
			$("#table_tbody").html(str);
		}
	});
}
function exportExcel(){
	window.location.href = "/jxzhpt/gcbb/getLwjgjshzb.do?flag=flag&dist="+$("#xzqh").combotree("getValue")+"&unit="+$("#gydw").combotree("getValue")+"&nf="+$("#year").combotree("getValue");
}
</script>
</head>
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;计划统计报表>&nbsp;路网结构改造建设计划汇总表</div>
			</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.8%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>单位名称：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>上报年份：</span>
        						<select id="year" style="width:80px;">
        						</select>
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'"
                                        onmouseout="this.src='../../../images/Button/Serch01.gif' " onclick="startSearch()"  style="border-width:0px;cursor: hand;vertical-align: -50%;" />
									 <img alt="导出Excel" src="../../../images/Button/dcecl1.gif" onmouseover="this.src='../../../images/Button/dcecl2.gif'"
                                        onmouseout="this.src='../../../images/Button/dcecl1.gif' " onclick="exportExcel()" style="vertical-align: -50%;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-110)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" height="100%" style="overflow: auto;">
							<table width="1200px" class="table_body" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;"><span id="titleYear" style="font-size:x-large;font-weight: bolder;"></span>年路网结构改造建议计划汇总表</caption>
								<thead>
									<tr>
										<td width="150px;"></td>
										<td width="150px;"></td>
										<td width="150px;">座/项目数</td>
										<td width="150px;">延米</td>
										<td width="150px;">处治里程</td>
										<td width="150px;">补助资金(万元)</td>
										<td width="150px;">部安排资金</td>
										<td width="150px;">总投资(万元)</td>
									</tr>
								</thead>
								<tbody id="table_tbody"></tbody>
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