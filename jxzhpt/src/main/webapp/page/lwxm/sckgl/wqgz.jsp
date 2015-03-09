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
	loadUnit("gydw",$.cookie("unit"));
	loadDist("xzqhmc",$.cookie("dist"));
	sckglWqgz();
});

function delSckwqgz(){
	var rows=$('#grid').datagrid('getSelections');
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
						 $("#grid").datagrid('reload');
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
		<div id="p_top">路网项目>&nbsp;项目审查库管理>&nbsp;危桥改造项目</div>
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
                              	<select id="gydw" style="width:218px">
                              	</select>
                             	<span>&nbsp;行政区划：</span>
                              	<select id="xzqhmc" style="width:218px">
                              	</select>
                               <span>&nbsp;路线名称：</span>
        						<input type="text" id="lxmc" style="width:95px;" />
                              <span>&nbsp;桥梁名称：</span>
                              	<input id="qlmc" type="text" style="width:95px"/>
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="xmnf" style="width:70px">
                              		<option selected="selected" value="">全部</option>
                              		<option value="2015年">2015年</option>
									<option value="2014年">2014年</option>
									<option value="2013年">2013年</option>
									<option value="2012年">2012年</option>
									<option value="2011年">2011年</option>
                              	</select>
                              <span style="display: none;">&nbsp;项目状态： </span>
                              	<select id="xmtype" style="width:70px;display: none;">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">待上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">已入库</option>
									<option value="已审核">已下达</option>
                              	</select>
                               <span>&nbsp;上报状态：</span>
                              	<select id="sbzt" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
                              	</select>
                              <span>&nbsp;特殊地区：</span>
                              	<select id="tsdq" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
                              	</select>
                              <span>&nbsp;技术等级：</span>
                              	<select id="jsdj" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="一级公路">一级公路</option>
									<option value="二级公路">二级公路</option>
									<option value="三级公路">三级公路</option>
									<option value="四级公路">四级公路</option>
									<option value="等外公路">等外公路</option>
                              	</select>
                              	<span>&nbsp;按跨径分类：</span>
                              	<select id="akjfl" style="width:87px">
                              		<option selected="selected" value="">全部</option>
									<option value="特大桥">特大桥</option>
									<option value="大桥">大桥</option>
									<option value="中桥">中桥</option>
									<option value="小桥">小桥</option>
                              	</select>
                              	<span>&nbsp;补助历史：</span>
                              	<select id="bzls" style="width:100px">
                              		<option selected="selected" value="">全部</option>
									<option value="无">无补助历史</option>
									<option value="有">有补助历史</option>
                              	</select>
                             </p>
                             <p style="margin:8px 0px 4px 20px;">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="sckglWqgz();"style="border-width:0px;cursor: hand;" />
								<img name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;" />
								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuiHui();" style="border-width:0px;" />
								<img name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" onclick="exportModule_sc('SCK_Bridge')" style="border-width:0px;cursor: hand;" />
								<img name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="importData_sc('wqgz_sc');" style="border-width:0px;" />
                                <img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addSck('wqgz_add.jsp','900','500');" style="border-width:0px;" />
                                <img name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="delSckwqgz();" style="border-width:0px;" />
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" onclick="exportExcel_wqgz_scgl()" style="border-width:0px;cursor: hand;" />
							  </p>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="wqgz1" style="font-weight: bold; color: #FF0000">15</span>&nbsp;】个危桥改造项目。</td>
        </tr>
         <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
