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
	var gydw1=$("#gydw").combotree("getValues");
	if(gydw1.length==0||gydw1.length==1){
		if($.cookie("unit2")=='_____36')
			gydw1str='36';
		else
		gydw1str=$.cookie("unit2");
	}else{
		gydw1str=gydw1.join(",");
	}
	var xzqh1=$("#xzqh").combotree("getValues");
	if(xzqh1.length==0||xzqh1.length==1){
		xzqh1str=$.cookie("dist2");
	}else{
		xzqh1str=xzqh1.join(",");
	}
	$("#titleYear").html($("#year").combotree("getValue"));
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcbb/getGzgcjz.do',
		dataType:"json",
		data:"dist="+xzqh1str+"&unit="+gydw1str+"&nf="+$("#year").combotree("getValue"),
		success:function(msg){
			var str="";
			$("#table_tbody").html("");
			if(msg!=null){
				for(var i=0;i<msg.length;i++){
					if(i!=6){
						if(i==0||i==3){
							str+="<tr align='center'><td rowspan='3'>"+msg[i].v_0+"</td>"+"<td>"+msg[i].v_1+"</td>"+"<td>"+msg[i].v_2+"</td>"+"<td>"+msg[i].v_3+"</td>"
							+"<td>"+msg[i].v_4+"</td>"+"<td>"+msg[i].v_5+"</td>"+"<td>"+msg[i].v_6+"</td>"+"<td>"+msg[i].v_7+"</td>"
							+"<td>"+msg[i].v_8+"</td>"+"<td>"+msg[i].v_9+"</td>"+"<td>"+msg[i].v_10+"</td>"+"<td>"+msg[i].v_11+"</td>"
							+"<td>"+msg[i].v_12+"</td>"+"<td>"+msg[i].v_13+"</td>"+"<td>"+msg[i].v_14+"</td>"+"<td>"+msg[i].v_15+"</td>"
							+"<td>"+msg[i].v_16+"</td>"+"<td>"+msg[i].v_17+"</td></tr>";
						}else{
							str+="<tr align='center'><td>"+msg[i].v_1+"</td>"+"<td>"+msg[i].v_2+"</td>"+"<td>"+msg[i].v_3+"</td>"
							+"<td>"+msg[i].v_4+"</td>"+"<td>"+msg[i].v_5+"</td>"+"<td>"+msg[i].v_6+"</td>"+"<td>"+msg[i].v_7+"</td>"
							+"<td>"+msg[i].v_8+"</td>"+"<td>"+msg[i].v_9+"</td>"+"<td>"+msg[i].v_10+"</td>"+"<td>"+msg[i].v_11+"</td>"
							+"<td>"+msg[i].v_12+"</td>"+"<td>"+msg[i].v_13+"</td>"+"<td>"+msg[i].v_14+"</td>"+"<td>"+msg[i].v_15+"</td>"
							+"<td>"+msg[i].v_16+"</td>"+"<td>"+msg[i].v_17+"</td></tr>";
						}
					}else{
						str+="<tr align='center'><td>"+msg[i].v_0+"</td>"+"<td>"+msg[i].v_1+"</td>"+"<td>"+msg[i].v_2+"</td>"+"<td>"+msg[i].v_3+"</td>"
						+"<td>"+msg[i].v_4+"</td>"+"<td>"+msg[i].v_5+"</td>"+"<td>"+msg[i].v_6+"</td>"+"<td>"+msg[i].v_7+"</td>"+"<td>"+msg[i].v_8+"</td>"+"<td>"+msg[i].v_9+"</td>"+"<td>"+msg[i].v_10+"</td>"+"<td>"+msg[i].v_11+"</td>"
						+"<td>"+msg[i].v_12+"</td>"+"<td>"+msg[i].v_13+"</td>"+"<td>"+msg[i].v_14+"</td>"+"<td>"+msg[i].v_15+"</td>"
						+"<td>"+msg[i].v_16+"</td>"+"<td>"+msg[i].v_17+"</td></tr>";
					}
				}
			}else{
				str+="<tr align='center'><td colspan='18'>暂无数据</td></tr>";
			}
			$("#table_tbody").html(str);
		}
	});
}
function exportExcel(){
	var gydw1=$("#gydw").combotree("getValues");
	if(gydw1.length==0||gydw1.length==1){
		if($.cookie("unit2")=='_____36')
			gydw1str='36';
		else
		gydw1str=$.cookie("unit2");
	}else{
		gydw1str=gydw1.join(",");
	}
	var xzqh1=$("#xzqh").combotree("getValues");
	if(xzqh1.length==0||xzqh1.length==1){
		xzqh1str=$.cookie("dist2");
	}else{
		xzqh1str=xzqh1.join(",");
	}
	var data="flag=flag&nf="+$("#year").combotree("getValue");
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydw1str,xzqh:xzqh1str},function(){
		window.location.href='/jxzhpt/gcbb/getGzgcjz.do?'+data;
	 });
}
</script>
</head>
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;计划统计报表>&nbsp;路网结构改造建议计划汇总表（分国省）</div>
			</div>
			
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:100%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
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
        						<input id="year" style="width:80px;"/>
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'"
                                        onmouseout="this.src='../../../images/Button/Serch01.gif' " onclick="startSearch()" style="border-width:0px;cursor: hand;vertical-align: -50%;" />
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
							<div data-options="region:'center',border:false" style="overflow-y:hidden;">
							<table width="2000px" class="table_body">
								<caption align="top" style="font-size:x-large;font-weight: bolder;"><span id="titleYear" style="font-size:x-large;font-weight: bolder;"></span>年公路路网结构改造工程进展情况汇总表</caption>
								<thead>
									<tr>
										<td rowspan="3" colspan="2">项目</td>
										<td colspan="5">计划下达</td>
										<td colspan="5">实际完成</td>
										<td colspan="6"></td>
									</tr>	
									<tr>
										<td colspan="2">工程量</td>
										<td colspan="3">投资</td>
										<td colspan="2">工程量</td>
										<td colspan="3">投资</td>
										<td>已拨付资金</td>
										<td>拨付比例</td>
										<td>完成工程量</td>
										<td>完成总投资</td>
										<td>完成中央投资</td>
										<td>地方配套资金</td>
									</tr>
									<tr>
										<td>单位1</td>
										<td>单位2</td>
										<td>总投资(万元)</td>
										<td>中央投资(万元)</td>
										<td>地方自筹(万元)</td>
										<td>单位1</td>
										<td>单位2</td>
										<td>总投资(万元)</td>
										<td>中央投资(万元) </td>
										<td>地方自筹(万元)</td>
										<td>(万元)</td>
										<td>(%)</td>
										<td>比例</td>
										<td>比例</td>
										<td>比例</td>
										<td>到位比例</td>
									</tr>
									<tr>
										<td colspan="2">甲</td>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>5</td>
										<td>6</td>
										<td>7</td>
										<td>8 </td>
										<td>9</td>
										<td>10</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
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