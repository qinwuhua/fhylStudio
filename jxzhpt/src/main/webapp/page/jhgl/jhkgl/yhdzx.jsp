<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_yhdzx.js"></script>
	<script type="text/javascript">
		$(function(){
			gydwComboxTree("gydw");
			loadDist("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','公路等级');
			tsdq('tsdq');
			var jh={sbzt:null,spzt:null,jh_sbthcd:null};
			sbnf('sbnf');
			var lx={gydwdm:filterGydwdm($.cookie("unit"))};
			querySumYhdzx(jh,lx);
			yhdzxxm(jh,lx);
		});
		function searchYhdzx(){
			var jh={sbzt:null,spzt:null,jh_sbthcd:null};
			var lx={gydwdm:filterGydwdm($.cookie("unit"))};
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
				lx.tsdq=$('#tsdq').combobox('getValue');
			}
			var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
			var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
			var xian=true;
			if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
				xian=false;
			}
			if($('#jhzt').combo("getValue")=="未上报"){
				if(xian){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}else if($('#jhzt').combo("getValue")=="已上报"){
				if(xian){
					jh.jh_sbthcd=2;
				}else{
					jh.jh_sbthcd=4;
				}
			}else if($('#jhzt').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
			}else if($('#jhzt').combo("getValue")=="已审核"){
				jh.jh_sbthcd=6;
			}
			querySumYhdzx(jh,lx);
			yhdzxxm(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function exportExcel_yhdzx(){
			var gydw=filterGydwdm($("#gydw").combo("getValue"));
			if(gydw==null){
				gydw="";
			}
			var param="jh.jh_sbthcd="+"&jh.sbzt="+"&jh.spzt="+"&lx.gydwdm="+gydw;
			window.location.href="/jxzhpt/jhgl/exportExcel_yhdzx.do?"+param;
		}
		function addLmsj(){
			parent.YMLib.UI.createWindow('add_yhdzx','添加养护大中修',"/jxzhpt/page/jhgl/add/yhdzxAdd.jsp",'addyhdzx',980,500);
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;养护大中修项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:237px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:170px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" id="txtRoad" style="width:80px;"  type="text"/>
        						<span>&nbsp;计划状态：</span>
        						<select id="jhzt" class="easyui-combobox" name="jhzt" style="width: 70px;">
									<option value="全部">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select>
        					</p>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>上报年份：</span>
        						<select id="sbnf" class="easyui-combobox" style="width: 80px;"></select>
								<span>&nbsp;特殊地区：</span>
								<select name="tsdq" class="easyui-combobox" id="tsdq" style="width:80px;">
									<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
									<option value="FEE9AE40475863D6E040007F010045D7">cs</option>
									<option value="517e0f37-12cd-4de9-a452-6aca259457c1">csss</option>
								</select>
								<span>&nbsp;公路等级：</span>
								<select name="ddlGldj" class="easyui-combobox" id="ddlGldj" style="width:170px;">
								</select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" class="easyui-combobox" id="ddlPDDJ" style="width:84px;">
								</select>
        					</p>
        					<p style="margin-left:12px;margin-bottom: 5px;">
        						<img onclick="searchYhdzx()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
								<img alt="导出模版" onclick="exportYh('Plan_Yhdzx')" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" />
								<img onclick="addLmsj()" name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src="" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img alt="导入" onclick="importData_jh('yhdzx_jh')" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
				                <img alt="删除"  onclick="dropYhdzxs()" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" style="vertical-align:middle;">
				                <img onclick="exportExcel_yhdzx()" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个养护大中修项目，
        			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			核对里程共【&nbsp;<span id="lblHDLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里；
        			总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			总补助资金【&nbsp;<span id="lblZBZZJ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
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
	
	<!-- <div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
</body>
</html>
