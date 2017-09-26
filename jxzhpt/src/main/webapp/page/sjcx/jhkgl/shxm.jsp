<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>灾毁重建项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/sjcx/jhkgl/js/plan_shuih.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','行政等级');
			tsdq('tsdq');
			sbnf("sbnf");
			var jh={sbnf:null,sbzt:null,spzt:null,jh_sbthcd:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwdm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			querySumShuih(jh,lx);
			shxm(jh,lx);
		});
		function searchShuih(){
			var jh={sbnf:null,sbzt:null,spzt:null,jh_sbthcd:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwdm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,yjsdj:null,lxbm:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.sbnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.yjsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#ddlGldj').combobox('getText')!='全部'){
				lx.lxbm=$('#ddlGldj').combobox('getValue');
			}
			if($('#tsdq').combobox('getValue')!=''){
				lx.tsdqbm=$('#tsdq').combobox('getValue');
			}
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				var xian=true;
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
					xian=false;
				}
				if($('#ddlSHZT').combo("getValue")=="未上报"){
					if(xian){
						jh.jh_sbthcd=0;
					}else{
						jh.jh_sbthcd=2;
					}
				}else if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}else if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}else if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}
			querySumShuih(jh,lx);
			shxm(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function exportExcel_shuih(){
			var param="jh.jh_sbthcd="+"&jh.sbzt="+"&jh.spzt="+"&lx.gydwdm="+$.cookie("unit");
			window.location.href="/jxzhpt/jhgl/exportExcel_shuih.do?"+param;
		}
		function addShuih(){
			parent.YMLib.UI.createWindow('add_shuih','灾毁重建项目',"/jxzhpt/page/jhgl/add/shuihAdd.jsp",'addshuih',980,500);
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">数据查询>&nbsp;计划管理>&nbsp;灾毁重建项目管理</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:227px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:100px;" />
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>上报年份：</span>
        						<select id="sbnf" style="width: 80px;"></select>
        						<span>&nbsp;计划状态：</span>
        						<select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:70px;">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select>
								<span>&nbsp;特殊地区：</span>
								<select name="tsdq" class="easyui-combobox" id="tsdq" style="width:80px;"></select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" class="easyui-combobox" style="width:65px;"></select>
								<span>&nbsp;原行政等级：</span>
								<select name="ddlGldj" id="ddlGldj" class="easyui-combobox" style="width:104px;"></select>
								<span>&nbsp;补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="否" selected="selected">否</option>
									<option value="是">是</option>
								</select>
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<img onclick="searchShuih()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【 <span id="lblCount" style="font-weight: bold;color: #FF0000">0</span> 】个灾毁重建项目，总里程共
        			【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，项目里程共【&nbsp;<span id="lblXMLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<div id="shxm_xx" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
