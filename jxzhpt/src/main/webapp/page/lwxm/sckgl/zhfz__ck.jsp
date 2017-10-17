<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库管理灾害防治项目</title>
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
	//xmnf("xmnf"); 
	loadBmbm2("sbzt", "上报状态");
	////loadBmbm2("lxjsdj", "技术等级");
	//loadBmbm2("bz", "行政等级");
	loadBmbm2("bzls", "补助历史");
	xmnfdx("xmnf"); 
	jsdjdx('jsdj');
	xzdjdx('gldj');
	tsdqdx('tsdq');//tsdq("tsdq");
	if(getParam("t")=='1') {
		$('#sbzt').combobox("setValue",'未上报');
	}
	sckglZhfz123();
});

function delSckzhfz(){
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
				 url : "/jxzhpt/xmsck/deleteSckZhfz.do",
				 dataType : 'json',
				 data : 'delstr=' +sckid,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 sckglZhfz123();
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
			 url : "/jxzhpt/xmsck/xgSckZhfzSbzt.do",
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
				 url : "/jxzhpt/xmsck/xgSckZhfzTH.do",
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
		<div id="p_top">路网项目>&nbsp;项目审查库管理>&nbsp;灾害防治项目</div>
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
                              	</select></td>
                              <td>上报状态：</td>
                              	<td><select id="sbzt" style="width:70px"class="easyui-combobox">
                              	</select></td>
                             <td>特殊地区：</td>
                              	<td><select id="tsdq"  style="width:70px"class="easyui-combobox">
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
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="sckglZhfz123();" style="border-width:0px;cursor: hand;" />
<!-- 								<img name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;" /> -->
<!-- 								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuiHui();" style="border-width:0px;" /> -->
<!-- 								<img name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" onclick="exportModule_sc('SCK_Disaster')" style="border-width:0px;cursor: hand;" /> -->
<!-- 								<img name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="importData_sc('zhfz_sc');" style="border-width:0px;" /> -->
<!--                                 <img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addSck('zhfz_add.jsp','900','500');" style="border-width:0px;" /> -->
<!--                                 <img name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="javascript:delSckzhfz();" style="border-width:0px;" /> -->
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" onclick="exportExcel_zhfz_scgl()" style="border-width:0px;cursor: hand;" />
							</td>
                            </tr></table>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="abgc1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个灾害防治项目，
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
