<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库审核安保工程项目</title>
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
// 	xmnf("xmnf"); 
	loadBmbm2("shzt", "审核状态");
// 	loadBmbm2("lxjsdj", "技术等级");
// 	loadBmbm2("bz", "行政等级");
	loadBmbm2("bzls", "补助历史");
	jsdjdx('jsdj');
	
	var urlid=getUrlParame('id');
	if(urlid==null){
		xmnfdx("xmnf"); 
		xzdjdx('gldj');
	}else{
		setxmnf("xmnf",urlid);
		setxzdj('gldj',urlid);
	}
	
	tsdqdx('tsdq');
// 	tsdq("tsdq");
	if(getParam("t")=='1') {
		$('#shzt').combobox("setValue",'未审核');
	}
	sckshAbgc123();
});

function xgShzt(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要审核项目！");
		return;
	}
	var sckid=rows[0].sckid;
	var nf=rows[0].xmnf;
	var tbbmbm=rows[0].tbbmbm;
	for(var i=0;i<rows.length;i++){
		if(rows[i].sck_shzt=='已审核'){
			alert("有项目已审核，请勿重复操作！");
			return ;
		}
	}
	for(var i=1;i<rows.length;i++){
		sckid+=","+rows[i].sckid ;
		nf+=","+rows[i].scxmnf;
		tbbmbm+=","+rows[i].tbbmbm;
	}
	if(confirm('您确定审核通过该项目？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmsck/xgSckAbgcShzt.do",
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
				 url : "/jxzhpt/xmsck/xgSckAbgcTH.do",
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
		<div id="p_top">前期管理>&nbsp;<span id="astext">项目立项</span>>&nbsp;<span id='bstext'></span>>&nbsp;路网结构改造工程>&nbsp;公路安防工程</div>
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
                                <td>路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:100px;" /></td>
        						<td>路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:100px;" /></td>
						</tr>
                         <tr height="32">
							  <td>项目年份：</td>
                              	<td><select id="xmnf" style="width:70px">
                              	</select>
                              <span style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;项目状态： </span>
                              	<select id="xmtype" style="width:70px;display: none;">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">待上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">已入库</option>
									<option value="已审核">已下达</option>
                              	</select></td>
                              <td>审核状态：</td>
                              	<td><select id="shzt" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              <td>特殊地区</td>
                              <td>	<select id="tsdq"  style="width:70px"class="easyui-combobox">
                              	</select></td>
                              <td>技术等级：</td>
                              	<td><select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              	<td>原行政等级：</td>
                              	<td><select id="gldj" style="width:104px"class="easyui-combobox">
                              	</select></td>
                              	<td>补助历史：</td>
                              	<td><select id="bzls" style="width:104px"class="easyui-combobox">
                              	</select></td>
                             </tr>
                             <tr height="32">
                              <td colspan="10">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'"onclick="sckshAbgc123();" src="../../../images/Button/Serch01.gif" style="border-width:0px;cursor: hand;" />
<!-- 								<img name="shenPi" id="shenPi" src="../../../images/Button/sp1.jpg" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'   " src="" onclick="xgShzt();" style="border-width:0px;" /> -->
<!--                                 <img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuiHui();" style="border-width:0px;" /> -->
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif"  onclick="exportExcel_abgc_scsh();" style="border-width:0px;cursor: hand;" />
							</td>
                            </tr></table>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="abgc1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安保工程项目，
        					总里程共【&nbsp;<span id="abgc2" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        					隐患里程共【&nbsp;<span id="abgc3" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里。</td>
        </tr>
         <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
