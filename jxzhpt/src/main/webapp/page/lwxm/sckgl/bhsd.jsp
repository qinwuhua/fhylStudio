<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库管理病害隧道项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/jm.css" />
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
<script type="text/javascript" src="../js/qqgl.js"></script>
<script type="text/javascript">
$(function(){
	loadDist1("xzqhmc",$.cookie("dist"));
	xmnf("xmnf"); 
	loadBmbm2("sbzt", "上报状态");
	loadBmbm2("jsdj", "技术等级");
	loadBmbm2("acdfl", "隧道分类");
// 	loadBmbm2("bzls", "补助历史");
	if(getParam("t")=='1') {
		$('#sbzt').combobox("setValue",'未上报');
	}
	sckglBhsd();
});

function delSckbhsd(){
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
		if(rows[i].sck_shzt=='已审核'){
			alert("有项目已审核，不能执行删除操作！");
			return;
		}
	}
	for(var i=1;i<rows.length;i++){
		sckid+=","+rows[i].sckid ;
	}
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/nmyhgc/xmsck/deleteSckbhsd.do",
				 dataType : 'json',
				 data : 'delstr=' +sckid,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 sckglBhsd();
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
	if($.cookie("unit2")=='15'){
		alert("对不起，您无法上报！");
		return;
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
			 url : "/nmyhgc/xmsck/xgSckbhsdSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！'); 
					 $("#grid").datagrid('reload');
					 sckglBhsd();
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

function delSckbhsd1(sckid,sck_sbzt){
	if(sck_sbzt=='已上报'){
		alert("有项目已上报，不能执行删除操作！");
		return;
	}
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/nmyhgc/xmsck/deleteSckbhsd.do",
				 dataType : 'json',
				 data : 'delstr=' +sckid,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 sckglBhsd();
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

function shangB1(sckid,sck_sbzt){
	if($.cookie("unit2")=='15'){
		alert("对不起，您无法上报！");
		return;
	}
    if(sck_sbzt=='已上报'){
		alert("有项目已上报，请勿重复操作！");
		return ;
	}
	
	if(confirm('您确定上报该项目？')){
		var data = "delstr="+sckid+"&sck_sbbm="+$.cookie("unit")+"&sck_sbthcd="+($.cookie("unit2").length-2);
		$.ajax({
			 type : "POST",
			 url : "/nmyhgc/xmsck/xgSckbhsdSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！'); 
					 $("#grid").datagrid('reload');
					 sckglBhsd();
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
<div id="righttop" class="dqwz">
		<div id="p_top">前期项目>&nbsp;方案审查库管理>&nbsp;病害隧道项目</div>
		</div>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<p style="margin:8px 0px 4px 20px;">
                             	<span>&nbsp;行政区划：</span>
                              	<select id="xzqhmc" style="width:218px">
                              	</select>
                               <span>&nbsp;隧道代码：</span>
        						<input type="text" id="sddm" style="width:72px;" />
                              	<span>&nbsp;隧道名称：</span>
                              	<input id="sdmc" type="text" style="width:76px"/>
                              	<span>&nbsp;路线编码：</span>
        						<input type="text" id="lxbm" style="width:70px;" />
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="xmnf" style="width:70px">
                              	</select>
                               <span>&nbsp;&nbsp;&nbsp;&nbsp;上报状态：</span>
                              	<select id="sbzt" style="width:70px"class="easyui-combobox">
                              	</select>
                              <span>&nbsp;&nbsp;&nbsp;&nbsp;技术等级：</span>
                              	<select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;隧道分类：</span>
                              	<select id="acdfl" style="width:65px"class="easyui-combobox">
                              	</select>
<!--                               	<span>&nbsp;补助历史：</span> -->
<!--                               	<select id="bzls" style="width:80px"class="easyui-combobox"> -->
<!--                               	</select> -->
                              	<span>&nbsp;路线名称：</span>
        						<input type="text" id="lxmc" style="width:70px;" />
                              	 
                             </p>
                             <p style="margin:8px 0px 4px 20px;">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="sckglBhsd();"style="border-width:0px;cursor: hand;" />
								<img name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;" />
								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="th_sckgl('bhsd_th.jsp','500','200');" style="border-width:0px;" />
								<img name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" onclick="exportModule_sc('SCK_bhsd')" style="border-width:0px;cursor: hand;" />
								<img name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="importData_sc('bhsd_sc');" style="border-width:0px;" />
                                <img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addSck('bhsd_add.jsp','900','500');" style="border-width:0px;" />
                                <img name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="delSckbhsd();" style="border-width:0px;" />
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" onclick="exportExcel_bhsd_scgl()" style="border-width:0px;cursor: hand;" />
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
