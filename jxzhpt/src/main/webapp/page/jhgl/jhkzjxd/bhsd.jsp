<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>病害隧道项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_bhsd.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("sbnf"); 
				xzdjdx('gldj');
			}else{
				setxmnf("sbnf",urlid);
				setxzdj('gldj',urlid);
			}
			
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			var jh={jhnf:$('#sbnf').combobox('getValue'),sbnf:null,sbzt:null,spzt:null,
					jh_sbthcd:$.cookie("unit2").length};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			querySumWqgz(jh,lx);
			
			if($.cookie("unit2").length==7 || $.cookie("unit2").length==2){
				$('#imglrjh').show();
			}
			wqxm_zjxd(jh,lx);
		});
		function searchWqgz(){
	 		var jh={jhnf:$('#sbnf').combobox('getValue'),sbzt:null,spzt:null,
					jh_sbthcd:$.cookie("unit2").length};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:null,lxbm:null,sddm:null};
			
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sdmc').val()!=''){
				lx.sdmc=$('#sdmc').val();
			}
			if($('#sddm').val()!=''){
				lx.sddm=$('#sddm').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlSHZT').combobox('getValue')=="未开工"){
				jh.kgzt="0";
				jh.jgzt="0";
			}else if($('#ddlSHZT').combobox('getValue')=="在建"){
				jh.kgzt="1";
				jh.jgzt="0";
			}else if($('#ddlSHZT').combobox('getValue')=="竣工"){
				jh.kgzt="1";
				jh.jgzt="1";
			}
			
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.jsdj=$('#ddlPDDJ').combobox('getValue');
			}
			wqxm(jh,lx);
			querySumWqgz(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		
		
	</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;计划下达>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;病害隧道项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;border:1px solid #e4e5e6;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        						<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="32">
        						<td align="right">管养单位：</td>
        						<td colspan="3" ><select id="gydw" style="width:197px;"></select> </td>
        						<td align="right">行政区划：</td>
        						<td colspan="3" ><select id="xzqh" style="width:214px;"></select></td>
        						<td align="right">路线名称：</td>
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:90px;" /></td>
        						<td align="right">隧道名称：</td>
        						<td><input name="sdmc" type="text" id="sdmc" style="width:90px;" /></td>
        						
        					</tr>
        						<tr height="32">
        						<td align="right">隧道代码：</td>
        						<td><input name="sddm" type="text" id="sddm" style="width:60px;" /></td>
        						<td align="right">计划年份：</td>
        						<td><select id="sbnf" style="width: 60px;"></select></td>
<!--         						<span>&nbsp;计划状态：</span> -->
<!--         						<select name="ddlSHZT" id="ddlSHZT" style="width:70px;" class="easyui-combobox"> -->
<!-- 									<option selected="selected" value="">全部</option> -->
<!-- 									<option value="未上报">未上报</option> -->
<!-- 									<option value="已上报">已上报</option> -->
<!-- 									<option value="未审核">未审核</option> -->
<!-- 									<option value="已审核">已审核</option> -->
<!-- 								</select> -->
								<td align="right">技术等级：</td>
								<td><select name="ddlPDDJ" id="ddlPDDJ" style="width:65px;" class="easyui-combobox">
								</select></td>
								<td align="right">建设状态：</td>
        						<td><select name="ddlSHZT" id="ddlSHZT" class="easyui-combobox" style="width:70px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="未开工">未开工</option>
									<option value="在建">在建</option>
									<option value="竣工">竣工</option>
								</select></td>
        					</tr>
							<tr height="32">
<!-- 								<span>补助历史：</span> -->
<!-- 								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;"> -->
<!-- 									<option value="" selected="selected">全部</option> -->
<!-- 									<option value="无">否</option> -->
<!-- 									<option value="是">是</option> -->
<!-- 								</select> -->
<td colspan="12">
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" style="vertical-align:middle;"/>
<%-- 								<img alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportModule('Plan_Bridge')"/> --%>
<%-- 								<img alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" onclick="importData_jh('wqgz_jh')" style="vertical-align:middle;"/> --%>
				                <img onclick="dropWqgzs()" alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" style="vertical-align:middle;">
				                <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportExcel('bhsd','gl')"/>
<%-- 				                <img onclick="shangB()" id="btnShangbao" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/shangbao_1.png'" src="${pageContext.request.contextPath}/images/Button/shangbao_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
<!-- 								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="th_jhkgl('bhsd_th.jsp','500','200');" style="border-width:0px;cursor: hand;vertical-align:middle;" /> -->
							</td></tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个病害隧道项目，
        			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid" ></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
<div id="zjxd_bhsd" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
