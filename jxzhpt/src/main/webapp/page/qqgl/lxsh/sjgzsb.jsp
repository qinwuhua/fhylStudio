<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<script type="text/javascript">
		$(function(){
// 			if($.cookie('unit')=='36')
// 				location.href='sjgzsh.jsp';
			loadGhlx('ghlxbm');
			loadylx('lxbm');
			tsdqdx('tsdq');
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('jsjsdj','技术等级');
			loadGldj('gldj');
			loadBmbm3('lsxmlx','历史项目类型');  
			loadBmbm3('lsxmnf','历史项目年份');  
			urlxmnf("xmnf",getUrlParame('id'));
			setTimeout("showAll()",'1700');
			
		});
		function shangB(){
			var rows=$('#datagrid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要上报项目！");
				return;
			}
			var id=rows[0].id;
			var sbthcd=0;
			if($.cookie("unit2").length==7 ){
				alert("省级用户请移到审核模块进行操作");
				return;
			}else{
				sbthcd=$.cookie("unit2").length-2;
			}
			for(var i=0;i<rows.length;i++){
				if(rows[i].sbzt1=='1'){
					alert("有项目已上报，请检查后操作！");
					return ;
				}
			}
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].id ;
			}
			if(confirm('您确定上报该项目？')){
				var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/qqgl/sbsjgzSbzt.do",
					 dataType : 'json',
					 data : data,
					 success : function(msg){
						 if(msg){
							 alert('上报成功！');
							 $("#datagrid").datagrid('reload');
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
			var rows=$('#datagrid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要退回项目！");
				return;
			}
			var id=rows[0].id;
			for(var i=0;i<rows.length;i++){
			if(rows[i].sbzt1=='0' && rows[i].sbthcd==11){
				alert("对不起，无法退回！");
				return;
			}
			if(rows[i].tbbmbm==$.cookie("unit")){
				alert("对不起，由您添加的项目无法退回！");
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
			var sbthcd=0;
			sbthcd=$.cookie("unit2").length+2;
			var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
			if(confirm('您确定退回该项目？')){
					$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/thSjgzSbzt.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
							 if(msg){
								 alert('退回成功！');
								 $("#datagrid").datagrid('reload');
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
		function delsjgz(){
			if($.cookie("unit2").length==7 ){
				alert("省级用户请移到审核模块进行操作");
				return;
			}
			var rows=$('#datagrid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要删除项目！");
				return;
			}
			for(var i=0;i<rows.length;i++){
				if(rows[i].sbthcd<$.cookie("unit2").length){
					alert("对不起，该项目已上报，不能执行删除操作！");
					return;
				}
			}
			var id=rows[0].xmbm;
			
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].xmbm ;
			}
			
			var data="lxsh.xmbm="+id;
			if(confirm('您确定删除该项目？')){
					$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/delSjgz.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
							 if(msg){
								 alert('删除成功！');
								 $("#datagrid").datagrid('reload');
							 }else{
								 alert('删除失败！');
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
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">前期管理>&nbsp;项目立项申请>&nbsp;改建工程项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-top: 10px;height: 100px;">
        			<fieldset id="searchField" style="width:99%; text-align: left; vertical-align: middle;height: 120px; padding-bottom:10px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
								<tr>
					<!-- <td>管养单位：</td>
        						<td colspan="3" style="width:220px;"><select id="gydw" style="width:220px;"></select></td> -->
        						<!-- <td>行政区划：</td>
        						<td colspan="3" style="width:220px;"><select id="xzqh" style="width:220px;"></select></td>
        						<td>项目名称：</td>
        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
        						<td>原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
        						<td>项目年份：</td>
        						<td><select id="xmnf" style="width:70px;">
								</select></td> -->
        						<td>行政区划：</td>
        						<td colspan="3" style="width:220px;"><select id="xzqh" style="width:220px;"></select></td>
        						<td>项目名称：</td>
        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
        						<td>原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>	
								<td>原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
							
        					</tr>
        					<tr height="32">
        						<td>项目年份：</td>
        						<td><select id="xmnf" style="width:70px;">
								</select></td>
        						<td>建设技术等级：</td>
								<td>
								<select name="jsjsdj" id="jsjsdj" style="width:65px;" class="easyui-combobox"></select>
								</td>
								<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
        						<td>规划路线名称：</td>
        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
                               	<td>是否有补助历史：</td>
		        				<td><select id="lsjl" style="width:80px;" class="easyui-combobox">
											<option selected="selected" value="">全部</option>
											<option value="是">是</option>
											<option value="否">否</option>
										</select></td>
        					</tr>
        					<tr height="32">
								<!-- <td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:88px;" >
								</select></td>-->
								<!-- <td>技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:65px;" class="easyui-combobox"></select></td> -->
								<!-- <td>建设技术等级：</td>
								<td>
								<select name="jsjsdj" id="jsjsdj" style="width:65px;" class="easyui-combobox"></select>
								</td>
								<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
        						<td>原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
		        				<td>是否有历史记录：</td>
		        				<td><select id="lsjl" style="width:80px;" class="easyui-combobox">
											<option selected="selected" value="">全部</option>
											<option value="是">是</option>
											<option value="否">否</option>
										</select></td> -->
								<td>上报状态：</td>
        						<td><select id="sbzt" style="width:80px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="0">未上报</option>
									<option value="1">已上报</option>
								</select></td>
								
								<td>现技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:65px;" class="easyui-combobox"></select></td>
								
        						 <td>规划路线编码：</td>
        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
								<td>项目库类型：</td>
								<td>
									<select id='xmklx' class="easyui-combobox" style="width: 65px;">
										<option value="">请选择</option>
										<option value="部库">部库</option>
										<option value="省库">省库</option>
									</select>
								</td>
								<td>历史项目类型：</td>
								<td>
									<select id='lsxmlx' class="easyui-combobox" style="width: 95px;">
									</select>
								</td>
        					</tr>
        					<tr>
								<td>历史计划年份：</td>
								<td>
									<select id='lsxmnf' class="easyui-combobox" style="width: 95px;">
									</select>
								</td>
                              <td colspan="10">
                              <!-- 筛选历史条件 -->
								
        						<img onclick="showAll()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
<%-- 								<img alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportModule('Plan_Security')"/> --%>
<%-- 								<img alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" onclick="importData_jh('abgc_jh')" style="vertical-align:middle;"/> --%>
								<img name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;vertical-align:middle;" />
<!-- 								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuiHui();" style="border-width:0px;vertical-align:middle;" /> -->
								<img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addLXSH('sjgzsb_add.jsp','900','490');" style="border-width:0px;vertical-align:middle;"/>
				                <img  name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif"  onclick="dclxshModule('sjgz');" style="border-width:0px;cursor: hand;vertical-align:middle;" />
								<img name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="import_sjgz('sjgzsb')" style="border-width:0px;vertical-align:middle;" />
				                <img  name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" onclick="dcMoBan('sjgz');" style="border-width:0px;cursor: hand;vertical-align:middle;" />
				                <img alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" onclick="delsjgz()" style="vertical-align:middle;">
<%-- 				                <img onclick="exportExcel('abgc')" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
				             </td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
            		<div><table id="datagrid"></table></div>
            	</td>
        	</tr>
		</table>
	
	<!-- <div id="abgc_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
	<div id="abgc_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
