<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库审核危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
$(function(){
	loadUnit1("gydw",$.cookie("unit"));
	loadDist1("xzqhmc",$.cookie("dist"));
	loadBmbm2("shzt", "审核状态");
	loadBmbm2("bzls", "补助历史");
	var urlid=getUrlParame('id');
	if(urlid==null){
		xmnfdx("xmnf"); 
		//xzdjdx('gldj');
	}else{
		setxmnf("xmnf",urlid);
		//setxzdj('gldj',urlid);
	}
	
	jsdjdx('jsdj');
	xzdjdx('gldj');
	kjfldx('akjfl');
	tsdqdx('tsdq');
	if(getParam("t")=='1') {
		$('#shzt').combobox("setValue",'未审核');
	}
	sckshWqgz();
});

function xgShzt(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要审核项目！");
		return;
	}
	var sckid=rows[0].sckid;
	var nf=rows[0].scxmnf;
	var tbbmbm=rows[0].tbbmbm;
	for(var i=0;i<rows.length;i++){
		if(rows[i].sck_shzt=='已审核'){
			alert("有项目已审核，请勿重复操作！");
			return ;
		}
	}
	for(var i=1;i<rows.length;i++){
		sckid+=","+rows[i].sckid ;
		nf+=","+rows[i].xmnf;
		tbbmbm+=","+rows[i].tbbmbm;
	}
	if(confirm('您确定审核通过该项目？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmsck/xgSckWqgzShzt.do",
				 dataType : 'json',
				 data : 'delstr=' +sckid+"&sck_shbm="+$.cookie("unit")+"&nf="+nf+"&tbbmbm1="+tbbmbm,
				 success : function(msg){
					 if(msg){
						 alert('审核成功！');
						 $("#grid").datagrid('reload');
					 }else{
						 alert('审核失败,请选择要审核项目！');
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
	}
}
function tuiHui(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回项目！");
		return;
	}
	var sckid=rows[0].sckid;
	for(var i=0;i<rows.length;i++){
		if($.cookie("unit2")=='______36'){
			alert("对不起，无法退回！");
			return;
		}
	if(rows[i].sck_sbzt=='未上报' && rows[i].sck_sbthcd==11){
		alert("对不起，无法退回！");
		return;
	}
	if(rows[i].scbmbm==$.cookie("unit")){
		alert("对不起，您添加的项目无法退回！");
		return;
	}
	if(rows[i].sck_sbthcd<$.cookie("unit2").length){
		alert("对不起，该项目已上报，不能执行退回操作！");
		return;
	}
	if(rows[i].shzt=='已审核'){
		alert("对不起，项目已审核，不能执行退回操作！");
		return;
	}
	}	
	for(var i=1;i<rows.length;i++){
		sckid+=","+rows[i].sckid ;
	}
	if(confirm('您确定退回该项目？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmsck/xgSckWqgzTH.do",
				 dataType : 'json',
				 data : 'delstr=' +sckid,
				 success : function(msg){
					 if(msg){
						 alert('退回成功！');
						 $("#grid").datagrid('reload');
					 }else{
						 alert('退回失败,请选择要退回项目！');
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
	}
}
function exportExcel_wqgz_scsh1(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var akjfl="";
	akjfl=$("#akjfl").combobox("getValues").join(',');
		if(akjfl.substring(0,1)==','){
			akjfl=akjfl.substring(1,akjfl.length);
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&shzt='+$("#shzt").combobox("getValue")+
 	'&jsdj='+$("#jsdj").combobox("getValue")+
 	'&akjfl='+akjfl+
 	'&lxbm='+$("#lxbm").val()+
 	'&qlbh='+$("#qlbh").val()+
 	'&bzls='+$("#bzls").combobox("getValue")+
 	'&sck_sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_wqgz_scsh.do?"+param;
}

</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:6px;}
</style>
</head>
<body>
<div id="righttop">
		<div id="p_top">前期管理>&nbsp;<span id="astext">项目立项</span>>&nbsp;<span id='bstext'></span>>&nbsp;路网结构改造工程>&nbsp;危桥改造项目</div>
		</div>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #cde0f3;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<table style=" margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
						<td>管养单位：</td>
                      	<td colspan="3" style="width:220px;"><select id="gydw" style="width:220px">
                      	</select></td>
                     	<td>行政区划：</td>
                      	<td colspan="3" style="width:220px;"><select id="xzqhmc" style="width:220px">
                      	</select></td>
                       	<td align="right">桥梁编号：</td>
						<td><input type="text" id="qlbh" style="width:70px;" /></td>
                      	<td>桥梁名称：</td>
                      	<td><input id="qlmc" type="text" style="width:76px"/></td>
                              	
					</tr>
                       <tr height="32">
							  	<td>项目年份：</span>
                              	<td><select id="xmnf" style="width:70px">
                              	</select>
                              	<span style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;项目状态： </span>
                              	<select id="xmtype" style="width:70px;display: none;">
                              	</select></td>
                               	<td>审核状态：</td>
                              	<td><select id="shzt" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              	<td>特殊地区：</td>
                              	<td><select id="tsdq" style="width:70px"class="easyui-combobox">
                              	</select></td>
                             <td>技术等级：</td>
                              	<td>	
                              		<select id="jsdj" style="width:70px"class="easyui-combobox">
                              		</select>
                              	</td>
                              	<td>按跨径分类：</td>
                              	<td><select id="akjfl" style="width:74px"class="easyui-combobox">
                              	</select>
                              	<td>补助历史：</td>
                              	<td><select id="bzls" style="width:80px"class="easyui-combobox">
                              	</select></td>
                              	
                             </tr>
                             <tr height="32">
	                              <td>路线名称：</td>
	        						<td><input type="text" id="lxmc" style="width:70px;" /></td>
	                              <td>路线编码：</td>
	        						<td><input type="text" id="lxbm" style="width:70px;" /></td>
	                              <td>行政等级：</td>
	                              	<td><select id="gldj" style="width:70px"class="easyui-combobox">
	                              	</select></td>
	                              <td>项目库类型：</td>
								<td " style="background-color: #ffffff; height: 20px;" align="left">
									<select class="easyui-combobox" id='xmklx'>
										<option value="" selected>请选择</option>
										<option value="部库">部库</option>
										<option value="省库">省库</option>
										
									</select>
								</td>
								
	                              <td colspan="10">
									<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="sckshWqgz();"style="border-width:0px;cursor: hand;" />
									<img name="shenPi" id="shenPi" src="../../../images/Button/sp1.jpg" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'   " src="" onclick="xgShzt();" style="border-width:0px;" />
	                                <img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuiHui();" style="border-width:0px;" />
	                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif"  onclick="exportExcel_wqgz_scsh1();" style="border-width:0px;cursor: hand;" />
								 </td>
                            </tr></table>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="wqgz1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个危桥改造项目。</td>
        </tr>
         <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
