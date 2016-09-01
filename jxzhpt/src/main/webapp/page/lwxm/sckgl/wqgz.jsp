<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
$(function(){
	loadUnit1("gydw",$.cookie("unit"));
	loadDist1("xzqhmc",$.cookie("dist"));
	loadBmbm2("sbzt", "上报状态");
	//xmnfdx("xmnf"); 
	//jsdjdx('jsdj');
	var urlid=getUrlParame('id');
	if(urlid==null){
		xmnfdx("xmnf"); 
		//xzdjdx('gldj');
	}else{
		setxmnf("xmnf",urlid);
		//setxzdj('gldj',urlid);
	}
	
	xzdjdx('gldj');
	kjfldx('akjfl');
	tsdqdx('tsdq');
	loadBmbm2("bzls", "补助历史");
	if(getParam("t")=='1') {
		$('#sbzt').combobox("setValue",'未上报');
	}
	sckglWqgz();
});

function delSckwqgz(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要删除项目！");
		return;
	}
	var sckid=rows[0].sckid;
	for(var i=0;i<rows.length;i++){
		if(rows[i].sck_sbzt2=='已上报'){
			alert("有项目已上报，不能执行删除操作！");
			return false;
		}
	}
	for(var i=1;i<rows.length;i++){
		sckid+=","+rows[i].sckid ;
	}
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmsck/deleteSckWqgz.do",
				 dataType : 'json',
				 data : 'delstr=' +sckid,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 sckglWqgz();
					 }else{
						 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
}

function shangB(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要上报项目！");
		return;
	}
	var sckid=rows[0].sckid;
	if($.cookie("unit2")=='______36'){
		alert("对不起，您无法上报！");
		return;
	}
	if($.cookie("unit2").length==7){
		alert("该项目已上报到省级单位，请勿重复操作！");
		return ;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].sck_sbzt2=='已上报'){
			alert("有项目已上报，请勿重复操作！");
			return ;
		}
	}
	for(var i=1;i<rows.length;i++){
		sckid+=","+rows[i].sckid ;
	}
	if(confirm('您确定上报该项目？')){
		var data = "delstr="+sckid+"&sck_sbbm="+$.cookie("unit")+"&sck_sbthcd="+($.cookie("unit2").length-2);
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/xmsck/xgSckWqgzSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！'); 
					 $("#grid").datagrid('reload');
				 }else{
					 alert('上报失败,请选择要上报项目！');
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
//危桥改造审查库管理excel导出
function exportExcel_wqgz_scgl1(){
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
	akjfl=$("#akjfl").combobox("getValues").join(",");
		if(akjfl.substr(0,1)==',')
			akjfl=akjfl.substr(1,akjfl.length);
	var xmnf=$("#xmnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq="";
	tsdq=$("#tsdq").combobox("getValues").join(",");
		if(tsdq.substring(0,1)==',')
			tsdq=tsdq.substring(1,tsdq.length);
	var jsdj="";
	jsdj=$("#jsdj").combobox("getValues").join(",");
		if(jsdj.substring(0,1)==',')
			jsdj=jsdj.substring(1,jsdj.length);
	var gldj="";
	gldj=$("#gldj").combobox("getValues").join(",");
		if(gldj.substring(0,1)==','){
			gldj=gldj.substring(1,gldj.length);
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+xmnf+
 	'&sbzt='+$("#sbzt").combobox("getValue")+
 	'&jsdj='+jsdj+
 	'&akjfl='+akjfl+
 	'&lxbm='+$("#lxbm").val()+
 	'&qlbh='+$("#qlbh").val()+
 	'&bzls='+$("#bzls").combobox("getValue")+
 	'&sck_sbthcd='+cd+
 	'&tsdq='+tsdq+
 	'&gldj='+gldj;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_wqgz_scgl.do?"+param;
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
		<div id="p_top">路网项目>&nbsp;项目审查库管理>&nbsp;危桥改造项目</div>
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
                              	<td>路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:70px;" /></td>
						</tr>
                          <tr height="32">
							  <td>项目年份：</td>
                              	<td><select id="xmnf" style="width:70px">
                              	</select>
                              <span style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;项目状态： </span>
                              	<select id="xmtype" style="width:70px;display: none;">
                              	</select></td>
                              <td>上报状态：</td>
                              	<td><select id="sbzt" style="width:70px"class="easyui-combobox">
                              	</select></td>
                            <td>特殊地区：</td>
                              	<td><select id="tsdq" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              <td>技术等级：</td>
                              	<td><select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              	<td>按跨径分类：</td>
                              	<td><select id="akjfl" style="width:74px"class="easyui-combobox">
                              	</select></td>
                              <td>补助历史：</td>
                              	<td><select id="bzls" style="width:80px"class="easyui-combobox">
                              	</select></td>
                              <td>路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:70px;" /></td>
                              	 
                             </tr>
                            <tr height="32">
                            <td>行政等级：</td>
                              	<td><select id="gldj" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              <td colspan="10">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="sckglWqgz();"style="border-width:0px;cursor: hand;" />
								<img name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;" />
								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuiHui();" style="border-width:0px;" />
								<img name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" onclick="exportModule_sc('SCK_Bridge')" style="border-width:0px;cursor: hand;" />
								<img name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="importData_sc('wqgz_sc');" style="border-width:0px;" />
                                <img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addSck('wqgz_add.jsp','900','500');" style="border-width:0px;" />
                                <img name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="delSckwqgz();" style="border-width:0px;" />
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" onclick="exportExcel_wqgz_scgl1()" style="border-width:0px;cursor: hand;" />
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
