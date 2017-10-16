<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库审核危桥改造项目</title>
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
	
	var urlid=getUrlParame('id');
	if(urlid==null){
		xmnfdx("xmnf"); 
		xzdjdx('gldj');
	}else{
		setxmnf("xmnf",urlid);
		setxzdj('gldj',urlid);
	}
	jsdjdx('jsdj');
	kjfldx('akjfl');
	tsdqdx('tsdq');
	if(getParam("t")=='1') {
		$('#shzt').combobox("setValue",'未审核');
	}
	jckshWqgz();
});
function xgShzt(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要审核项目！");
		return;
	}
	var id=rows[0].id;
	for(var i=0;i<rows.length;i++){
		if(rows[i].zgshzt=='已审核'){
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
				 url : "/jxzhpt/xmjck/xgJckWqgzShzt.do",
				 dataType : 'json',
				 data : "delstr="+id+"&shbm="+$.cookie("unit"),
				 success : function(msg){
					 if(msg){
						 alert('审核成功！');
						 $("#grid").datagrid('reload');
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
	if($.cookie("unit2")=='______36'){
			alert("对不起，无法退回！");
			return;
		}
	if(rows[i].sbzt=='未上报' && rows[i].sbthcd==11){
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
	if(rows[i].zgshzt=='已审核'){
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
				 url : "/jxzhpt/xmjck/xgJckWqgzTHxj.do",
				 dataType : 'json',
				 data : 'delstr=' +id,
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
		<div id="p_top">五年项目库>&nbsp;<span id='bstext'></span>>路网结构改造工程>&nbsp;危桥改造项目</div>
		</div>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 5px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #cde0f3;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<table style=" margin:5px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="28">
								<td align="right">管养单位：</td>
                              	 <td colspan="3" ><select id="gydw" style="width:224px">
                              	</select></td>
                             	<td align="right">行政区划：</span>
                              	 <td colspan="3" ><select id="xzqhmc" style="width:225px">
                              	</select></td>
                               <td align="right">规划路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:70px;" /></td>
        						<td align="right">规划路线编码：</td>
                              	<td><input type="text" id="lxbm"style="width:68px"/></td>
                       </tr>
                       <tr height="28">
							  <!-- <td>项目年份：</td>
                              <td>	
                                <select id="xmnf" style="width:70px"></select>
                                <span style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;项目状态： </span>
                              	<select id="xmtype" style="width:70px;display: none;"></select>
                              </td> -->
                               <td align="right">审核状态：</td>
                              	<td><select id="shzt" style="width:70px"class="easyui-combobox">
                              	</select></td>
                             <td align="right">特殊地区：</td>
                              	<td><select id="tsdq" class="easyui-combobox" style="width:70px">
                              	</select></td>
                            <!--<td align="right">技术等级：</td>
                              	<td><select id="jsdj" style="width:45px"class="easyui-combobox">
                              	</select></td>
                              	<td align="right">按跨径分类：</td>
                              	<td><select id="akjfl" style="width:54px"class="easyui-combobox">
                              	</select></td> -->
                              	
                              <td align="right">原路线名称：</td>
        					  <td><input type="text" id="xlxmc" style="width:67px;" /></td>        				
        					  <td align="right">原路线编码：</td>
                              <td><input type="text" id="xlxbm"style="width:66px"/></td>	                             
                              <td align="right">规划桥梁编号：</td>
                              <td>	<input type="text" id="qlbh"style="width:70px"/></td>
                              <td align="right">原行政等级：</td>
                              	<td><select id="gldj" style="width:70px"class="easyui-combobox">
                              	</select></td>
                        </tr>
                         <tr height="28">
                                <td align="right">技术等级：</td>
                              	<td><select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              	<td align="right">按跨径分类：</td>
                              	<td><select id="akjfl" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              <td align="right">规划桥梁名称：</td>
                              	<td><input type="text" id="qlmc"style="width:67px"/></td>
                              
                              <td align="right">项目库类型：</td>
								<td " style="background-color: #ffffff; height: 20px; " align="left">
									<select class="easyui-combobox" id='xmklx' style=" width:70px;">
										<option value="" selected>请选择</option>
										<option value="部库">部库</option>
										<option value="省库">省库</option>
										
									</select>
								</td></tr><tr>
                              <td colspan="10">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="jckshWqgz();"style="border-width:0px;cursor: hand;" />
								<img name="shenPi" id="shenPi" src="../../../images/Button/sp1.jpg" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'   " src="" onclick="xgShzt();" style="border-width:0px;" />
								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuiHui();" style="border-width:0px;" />
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" onclick="exportExcel_wqgz_sh();" style="border-width:0px;cursor: hand;" />
							 </td>
                            </tr></table>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 0px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="wqgz1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个危桥改造项目。</td>
        </tr>
        <tr>
            	<td style="padding-left: 10px;padding-top:0px; font-size:12px;">
            			<table id="grid" width="100%" ></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
