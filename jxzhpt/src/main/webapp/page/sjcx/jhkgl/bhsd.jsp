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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="./js/plan_bhsd.js"></script>
	<script type="text/javascript">
		$(function(){
			sbnf("sbnf");
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
			wqxm(jh,lx);
		});
		function searchWqgz(){
			var gydwstr;
			var xzqhstr;
			
			var jh={jhnf:$('#sbnf').combobox('getValue'),sbzt:null,spzt:null,
					jh_sbthcd:$.cookie("unit2").length};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:null,lxbm:null,qlmc:null,akjfl:null};
			
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
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				if($('#ddlSHZT').combo("getValue")=="未上报"){
				   jh.sbzt='0';
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					jh.sbzt='1';
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.spzt='0';
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.spzt='1';
				}
			}else{
				jh.sbzt=null;
				jh.spzt=null;
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
</head>
<body>
	<div id="righttop">
		<div id="p_top">数据查询>&nbsp;计划管理>&nbsp;病害隧道项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;border:1px solid #e4e5e6;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:227px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:90px;" />
        						<span>&nbsp;隧道名称：</span>
        						<input name="sdmc" type="text" id="sdmc" style="width:90px;" />
        						<span>&nbsp;隧道代码：</span>
        						<input name="sddm" type="text" id="sddm" style="width:90px;" />
        					</p>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>上报年份：</span>
        						<select id="sbnf" style="width: 80px;"></select>
        						<span>&nbsp;计划状态：</span>
        						<select name="ddlSHZT" id="ddlSHZT" style="width:70px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" style="width:65px;" class="easyui-combobox">
								</select>
								&nbsp;&nbsp;
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" 
								style="border-width:0px;cursor: hand;vertical-align: -60%;"/>
							</p>
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
	
	<div id="wqgz_xx" style="text-align: left;font-size: 12px;width:80%;"></div>
	<div id="wqgz_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
