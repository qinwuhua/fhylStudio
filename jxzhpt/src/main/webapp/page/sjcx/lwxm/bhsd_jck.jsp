<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理病害隧道项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/sjcx.js"></script>
<script type="text/javascript">
$(function(){
	loadUnit1("gydw",$.cookie("unit"));
	loadDist1("xzqhmc",$.cookie("dist"));
	xmnf("xmnf"); 
	loadBmbm2("sbzt", "上报状态");
	loadBmbm2("jsdj", "技术等级");
	loadBmbm2("acdfl", "隧道分类");
	if(getParam("t")=='1') {
		$('#sbzt').combobox("setValue",'未上报');
	}
	jckglBhsd();
});

function delJckbhsd1(id,sbzt){
	if(sbzt=='已上报'){
		alert("该项目已上报，不能执行删除操作！");
		return;
	}
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/nmyhgc/xmjck/deleteBhsdById.do",
				 dataType : 'json',
				 data : 'delstr=' +id,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 jckglBhsd();
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

function delJckbhsd(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要删除项目！");
		return;
	}
	var id=rows[0].id;
	for(var i=0;i<rows.length;i++){
		if(rows[i].sbzt2=='已上报'){
			alert("该项目已上报，不能执行删除操作！");
			return false;
		}
	}
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
	}
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/nmyhgc/xmjck/deleteBhsdById.do",
				 dataType : 'json',
				 data : 'delstr=' +id,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 jckglBhsd();
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

function shangB1(id,sbzt){
	if($.cookie("unit2")=='15'){
		alert("对不起，您无法上报！");
		return;
	}
	if(sbzt=='已上报'){
		alert("有项目已上报，请勿重复操作！");
		return ;
	}
	if(confirm('您确定上报该项目？')){
		var data = "delstr="+id+"&sbbm="+$.cookie("unit")+"&sbthcd="+($.cookie("unit2").length-2);
		$.ajax({
			 type : "POST",
			 url : "/nmyhgc/xmjck/xgJckBhsdSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#grid").datagrid('reload');
					 jckglBhsd();
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

function shangB(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要上报项目！");
		return;
	}
	var id=rows[0].id;
	if($.cookie("unit2")=='15'){
		alert("对不起，您无法上报！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].sbzt2=='已上报'){
			alert("有项目已上报，请勿重复操作！");
			return ;
		}
	}
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
	}
	if(confirm('您确定上报该项目？')){
		var data = "delstr="+id+"&sbbm="+$.cookie("unit")+"&sbthcd="+($.cookie("unit2").length-2);
		$.ajax({
			 type : "POST",
			 url : "/nmyhgc/xmjck/xgJckBhsdSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#grid").datagrid('reload');
					 jckglBhsd();
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
	var id=rows[0].id;
	for(var i=0;i<rows.length;i++){
	if($.cookie("unit2")=='15'){
			alert("对不起，无法退回！");
			return;
		}
	if(rows[i].sbzt2=='未上报' && rows[i].sbthcd==6){
		alert("对不起，无法退回！");
		return;
	}
	if(rows[i].tbbmbm==$.cookie("unit")){
		alert("对不起，您添加的项目无法退回！");
		return;
	}
	if(rows[i].sbthcd<$.cookie("unit2").length){
		alert("对不起，该项目已上报，不能执行退回操作！");
		return;
	}
	}	
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
	}
	if(confirm('您确定退回该项目？')){
			$.ajax({
				 type : "POST",
				 url : "/nmyhgc/xmjck/xgJckBhsdTH.do",
				 dataType : 'json',
				 data : 'delstr=' +id,
				 success : function(msg){
					 if(msg){
						 alert('退回成功！');
						 $("#grid").datagrid('reload');
						 jckglBhsd();
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
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">数据查询>&nbsp;路网管理>&nbsp;病害隧道项目基础库</div>
		</div>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #e4e4e5;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<p style="margin:8px 0px 4px 20px;">
								<span>管养单位：</span>
                              	<select id="gydw" style="width:235px">
                              	</select>
                             	<span>&nbsp;行政区划：</span>
                              	<select id="xzqhmc" style="width:218px">
                              	</select>
                               <span>&nbsp;路线名称：</span>
        						<input type="text" id="lxmc" style="width:70px; height:20px;" />
        						<span>&nbsp;路线编码：</span>
                              	<input type="text" id="lxbm"style="width:70px;height:20px;"/>
                              <span>&nbsp;隧道名称：</span>
                              	<input type="text" id="sdmc"style="width:70px;height:20px;"/>
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="xmnf"  style="width:70px">
                              	</select>
                               <span>&nbsp;&nbsp;&nbsp;&nbsp;上报状态：</span>
                              	<select id="sbzt" style="width:70px"class="easyui-combobox">
                              	</select>
                              <span>&nbsp;技术等级：</span>
                              	<select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;隧道分类：</span>
                              	<select id="acdfl" style="width:60px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;隧道编号：</span>
                              	<input type="text" id="sddm"style="width:70px;height:20px;"/>
                              	&nbsp;&nbsp;
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" 
								src="../../../images/Button/Serch01.gif" onclick="jckglBhsd();" style="border-width:0px;cursor: hand;vertical-align: -60%;" />
                             </p>
					</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="bhsd1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个病害隧道项目。</td>
        </tr>
	</table>
<!-- 	<tbody id="grid"></tbody> -->
	<div id="grid" width="100%" ></div>
</body>
</html>
