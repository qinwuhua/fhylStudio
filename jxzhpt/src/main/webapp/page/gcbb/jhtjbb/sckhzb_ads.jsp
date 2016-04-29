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
#bbtable {
	border-collapse:collapse;
}
#bbtable thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
#bbtable tbody tr td {
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
	//$("#titleYear").html($("#year").combotree("getValue"));
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	/* var dwlx='';
	if($.cookie("unit").substr(0,1)=='1'){
		dwlx='交通局';
	}else{
		dwlx='公路局';
	} */
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcbb/getSckhzbAds.do',
		dataType:"json",
		data:"dist="+xzqhstr+"&unit="+gydwstr+"&nf="+$("#year").combotree("getValue"),
		//+"&dwlx="+dwlx,
		success:function(msg){
			var str="";
			$("#table_tbody").html("");
			if(msg!=null){
				for(var i=0;i<msg.length;i++){
					str+="<tr align='center'>"+
							"<td>"+msg[i].v_0+"</td>"+
							"<td>"+msg[i].v_1+"</td>"+
							"<td>"+msg[i].v_2+"</td>"+
							"<td>"+msg[i].v_3+"</td>"+
							"<td>"+msg[i].v_4+"</td>"+
							"<td>"+msg[i].v_5+"</td>"+
							"<td>"+msg[i].v_6+"</td>"+
							"<td>"+msg[i].v_7+"</td>"+
							"<td>"+msg[i].v_8+"</td>"+
							"<td>"+msg[i].v_9+"</td>"+
							"<td>"+msg[i].v_10+"</td>"+
							"<td>"+msg[i].v_11+"</td>"+
							"<td>"+msg[i].v_12+"</td>"+
							"<td>"+msg[i].v_13+"</td>"
						 	+"<td>"+msg[i].v_14+"</td>"
						 	+"<td>"+msg[i].v_15+"</td>"
							+"<td>"+msg[i].v_16+"</td>"
							+"<td>"+msg[i].v_17+"</td>"
							+"<td>"+msg[i].v_18+"</td>"
							+"<td>"+msg[i].v_19+"</td>"
							+"<td>"+msg[i].v_20+"</td>"
							+"<td>"+msg[i].v_21+"</td>"
							+"<td>"+msg[i].v_22+"</td>"
							+"<td>"+msg[i].v_23+"</td>"
							+"<td>"+msg[i].v_24+"</td>"
							+"<td>"+msg[i].v_25+"</td>"
							+"<td>"+msg[i].v_26+"</td>"
							+"<td>"+msg[i].v_27+"</td>"
							+"<td>"+msg[i].v_28+"</td>"
							+"<td>"+msg[i].v_29+"</td>"
							+"<td>"+msg[i].v_30+"</td>"
							+"<td>"+msg[i].v_31+"</td>"
							+"<td>"+msg[i].v_32+"</td>"
							+"<td>"+msg[i].v_33+"</td>"
							+"<td>"+msg[i].v_34+"</td>"
							+"<td>"+msg[i].v_35+"</td>"
							+"<td>"+msg[i].v_36+"</td>"
							
						+"</tr>";
				}
			}else{
				str+="<tr align='center'><td colspan='22'>暂无数据</td></tr>";
			}
			$("#table_tbody").html(str);
		}
	});
}
function exportExcel(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	/* var dwlx='';
	if($.cookie("unit").substr(0,1)=='1'){
		dwlx='交通局';
	}else{
		dwlx='公路局';
	} */
	var data="flag=flag&nf="+$("#year").combotree("getValue");
	//+"&dwlx="+dwlx;
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
		window.location.href='/jxzhpt/gcbb/getSckhzbAds.do?'+data;
	 });
}
</script>
</head>
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;计划统计报表>&nbsp;交通部固定资产投资建设计划（分地市）</div>
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
                                        onmouseout="this.src='../../../images/Button/Serch01.gif' " 
                                        onclick="startSearch()" style="border-width:0px;cursor: hand;vertical-align: -50%;" />
									 <img alt="导出Excel" src="../../../images/Button/dcecl1.gif" onmouseover="this.src='../../../images/Button/dcecl2.gif'"
                                        onmouseout="this.src='../../../images/Button/dcecl1.gif' " 
                                        onclick="exportExcel()" style="vertical-align: -50%;" />
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
							<div data-options="region:'center',border:false" style="overflow: auto;">
							<table id="bbtable" class="table_body" width="1700px" >
								<!-- <caption align="top" style="font-size:x-large;font-weight: bolder;"><span id="titleYear" style="font-size:x-large;font-weight: bolder;"></span>年交通固定资产投资建设计划(路网结构改造)</caption> -->
								<thead>
									<tr>
										<td rowspan="3" style="width: 135px">项目所在地区</td>
										<td colspan="9">危桥改造</td>
										<td colspan="9">病隧改造</td>
										<td colspan="9">安防工程</td>
										<td colspan="9">灾害防治</td>
										<!-- //<td colspan="3">总计</td> -->
									</tr>
									<tr>
										<td colspan="3">小计</td>
										<td colspan="3">公路局</td>
										<td colspan="3">交通局</td>
										<td colspan="3">小计</td>
										<td colspan="3">公路局</td>
										<td colspan="3">交通局</td>
										<td colspan="3">小计</td>
										<td colspan="3">公路局</td>
										<td colspan="3">交通局</td>
										<td colspan="3">小计</td>
										<td colspan="3">公路局</td>
										<td colspan="3">交通局</td>
										<!-- <td style="width: 140px">合计</td>
										<td style="width: 140px">公路</td>
										<td style="width: 140px">交通</td> -->
									</tr>		
									<tr>
										<td style="width: 55px">座</td>
										<td style="width: 55px">延米</td>
										<td style="width: 140px">投资估算(万元)</td>
										<td style="width: 55px">座</td>
										<td style="width: 55px">延米</td>
										<td style="width: 140px">投资估算(万元)</td>
										<td style="width: 55px">座</td>
										<td style="width: 55px">延米</td>
										<td style="width: 140px">投资估算(万元)</td>
										
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">隧道长度(m)</td>
										<td style="width: 140px">投资估算(万元)</td>
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">隧道长度(m)</td>
										<td style="width: 140px">投资估算(万元)</td>
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">隧道长度(m)</td>
										<td style="width: 140px">投资估算(万元)</td>
										
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">处治里程(km)</td>
										<td style="width: 140px">投资估算(万元)</td>
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">处治里程(km)</td>
										<td style="width: 140px">投资估算(万元)</td>
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">处治里程(km)</td>
										<td style="width: 140px">投资估算(万元)</td>
										
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">处治里程(km)</td>
										<td style="width: 140px">投资估算(万元)</td>
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">处治里程(km)</td>
										<td style="width: 140px">投资估算(万元)</td>
										<td style="width: 55px">项目数量</td>
										<td style="width: 140px">处治里程(km)</td>
										<td style="width: 140px">投资估算(万元)</td>
										
									<!-- 	<td style="width: 140px">补助资金(万元)</td>
										<td style="width: 140px">补助资金(万元)</td>
										<td style="width: 140px">补助资金(万元)</td> -->
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