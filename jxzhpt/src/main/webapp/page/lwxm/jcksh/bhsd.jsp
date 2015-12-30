<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库审核病害隧道项目</title>
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
	xmnf("xmnf"); 
	loadBmbm2("shzt", "审核状态");
	loadBmbm2("jsdj", "技术等级");
	loadBmbm2("acdfl", "隧道分类");
	if(getParam("t")=='1') {
		$('#shzt').combobox("setValue",'未审核');
	}
	jckshBhsd();
});
function xgShzt(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要审核项目！");
		return;
	}
	var id=rows[0].id;
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt=='已审核'){
			alert("有项目已审核，请勿重复操作！");
			return ;
		}
	}
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
	}
	if(confirm('您确定审核通过该项目？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmjck/xgJckBhsdShzt.do",
				 dataType : 'json',
				 data : "delstr="+id+"&shbm="+$.cookie("unit"),
				 success : function(msg){
					 if(msg){
						 alert('审核成功！');
						 $("#grid").datagrid('reload');
						 jckshBhsd();
					 }else{
						 alert('审核失败,请选择要上报项目！');
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
	if(rows[i].shzt=='已审核'){
		alert("对不起，项目已审核，不能执行退回操作！");
		return;
	}
	}	
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
	}
	if(confirm('您确定退回该项目？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmjck/xgJckBhsdTH.do",
				 dataType : 'json',
				 data : 'delstr=' +id,
				 success : function(msg){
					 if(msg){
						 alert('退回成功！');
						 $("#grid").datagrid('reload');
						 jckshBhsd();
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
<div id="righttop" >
		<div id="p_top">路网项目>&nbsp;项目基础库审核>&nbsp;病害隧道项目</div>
		</div>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;">
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
        						<input type="text" id="lxmc" style="width:70px;" />
        						<span>&nbsp;路线编码：</span>
                              	<input type="text" id="lxbm"style="width:70px"/>
                              <span>&nbsp;隧道名称：</span>
                              	<input type="text" id="sdmc"style="width:70px"/>
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="xmnf" style="width:70px">
                              	</select>
                               <span>&nbsp;&nbsp;&nbsp;&nbsp;审核状态：</span>
                              	<select id="shzt" style="width:70px"class="easyui-combobox">
                              	</select>
                              <span>&nbsp;&nbsp;&nbsp;&nbsp;技术等级：</span>
                              	<select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;隧道分类：</span>
                              	<select id="acdfl" style="width:60px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;隧道代码：</span>
                              	<input type="text" id="sddm"style="width:70px"/>
                             </p>
                             <p style="margin:8px 0px 4px 20px;">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="jckshBhsd();"style="border-width:0px;cursor: hand;" />
								<img name="shenPi" id="shenPi" src="../../../images/Button/sp1.jpg" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'   " src="" onclick="xgShzt();" style="border-width:0px;" />
								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="th_jcksh('bhsd_th.jsp','500','200');" style="border-width:0px;" />
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" onclick="exportExcel_bhsd_sh();" style="border-width:0px;cursor: hand;" />
							 </p>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="bhsd1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个病害隧道项目。</td>
        </tr>
        <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
