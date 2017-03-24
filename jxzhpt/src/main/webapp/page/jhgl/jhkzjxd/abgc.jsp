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
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			jsdjdx('ddlPDDJ');
			jhxdwhdx('jhxdwh','abgc');
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("sbnf"); 
				xzdjdx('ddlGldj');
			}else{
				setxmnf("sbnf",urlid);
				setxzdj('ddlGldj',urlid);
			}
			
			tsdqdx('ddlTSDQ');
			//var xmnf=$("#sbnf").combobox("getValues").join(",");
			//if(xmnf.substr(0,1)==',')
				//xmnf=xmnf.substr(1,xmnf.length);
			//var jh={jhnf:xmnf,jh_sbthcd:6,sfylsjl:$('#sfylsjl').combo("getValue")};
			//var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			//queryMessage(jh,lx);
			//abgcxm_zjxd(jh,lx);
			searchAbgc();
		});
		function searchAbgc(){
			
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jsdj=$("#ddlPDDJ").combobox("getValues").join(",");
			if(jsdj.substr(0,1)==',')
				jsdj=jsdj.substr(1,jsdj.length);
			var gldj=$("#ddlGldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			
			var tsdq=$("#ddlTSDQ").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length); 
			//alert(jhxdwh);
			var jh={jhxdwh:jhxdwh,jhnf:xmnf,sbzt:null,spzt:null,jh_sbthcd:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:jsdj,lxbm:null,gldj:gldj,tsdq:tsdq,xmklx:$("#xmklx").combobox('getValue')};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#lxbm').val()!=""){
				lx.lxmc=$('#lxbm').val();
			}
			if($('#ddlSHZT').combobox('getValue')=='未开工'){
				jh.kgzt="0";
				jh.jgzt="0";
			}else if($('#ddlSHZT').combobox('getValue')=='在建'){
				jh.kgzt="1";
				jh.jgzt="0";
			}else if($('#ddlSHZT').combobox('getValue')=='竣工'){
				jh.kgzt="1";
				jh.jgzt="1";
			}
			
			queryMessage(jh,lx);
			abgcxm_zjxd(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function queryMessage(jh,lx){
			var param={"jh.jhxdwh":jh.jhxdwh,"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
					"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
					"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd,'lx.xmklx':lx.xmklx};
			$.ajax({
				type:'post',
				url:'../../../jhgl/querySumAbgc.do',
				data:param,
				dataType:'json',
				success:function(data){
					if(data.id>0){
						$('#lblCount').html(data.id);
						$('#pfztz').html(data.pfztz);
						$('#btz').html(data.jhsybbzje);
						$('#stz').html("0");
						$('#dftz').html(data.jhsydfzczj);
						$('#xdzj').html(data.pfwh);
					}else{
						$('#lblCount').html("0");
						$('#pfztz').html("0");
						$('#btz').html("0");
						$('#stz').html("0");
						$('#dftz').html("0");
						$('#xdzj').html("0");
					}
				}
			});
		}
		function exportExcelZjxd(){
			var gydwbm=getgydw("gydw");
			var xzqhdm=getxzqhdm('xzqh');
			var gydwdm=$.cookie("unit");
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jsdj=$("#ddlPDDJ").combobox("getValues").join(",");
			if(jsdj.substr(0,1)==',')
				jsdj=jsdj.substr(1,jsdj.length);
			var gldj=$("#ddlGldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var tsdq=$("#ddlTSDQ").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var param="jh.jh_sbthcd=6"+"&lx.gydwdm="+gydwdm+"&lx.gydwbm="+gydwbm+"&lx.xzqhdm="+xzqhdm+
					"&lx.lxmc="+$('#txtRoad').val()+"&lx.lxjsdj="+jsdj+
					"&lx.lxbm="+$("#lxbm").val()+"&lx.tsdq="+tsdq+"&lx.gldj="+gldj+
					"&jh.jhnf="+xmnf;
			if($('#ddlSHZT').combo("getValue")=="未开工"){
				param+="&jh.kgzt=0";
			}else if($('#ddlSHZT').combo("getValue")=="在建"){
				param+="&jh.kgzt=1&jh.jgzt=0";
			}else if($('#ddlSHZT').combo("getValue")=="竣工"){
				param+="&jh.jgzt=1";
			}
			window.location.href="/jxzhpt/jhgl/exportAbgcZjxdExcel.do?"+param;
		}
	</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;计划下达>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;安保工程项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 8px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="32">
        						<td align="right">管养单位：</td>
        						<td colspan="3" ><select id="gydw" style="width:220px;"></select></td>
        						<td align="right">行政区划：</td>
        						<td colspan="3" ><select id="xzqh" style="width:184px;"></select></td>
        						<td align="right">路线名称：</td>
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:80px;" /></td>
        						<td align="right">路线编码：</td>
        						<td><input name="txtRoad" type="text" id="lxbm" style="width:80px;" /></td>
        					</tr>
        						<tr height="32">
        						<td align="right">上报年份</td>
        						<td><select id="sbnf" style="width: 65px; vertical-align:middle;"></select></td>
								<td align="right">特殊地区：</td>
								<td><select name="ddlTSDQ" id="ddlTSDQ" class='easyui-combobox' style="width:70px; vertical-align:middle;">
								</select></td>
								<td align="right">建设状态：</td>
        						<td><select name="ddlSHZT" id="ddlSHZT" class="easyui-combobox" style="width:50px; vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="未开工">未开工</option>
									<option value="在建">在建</option>
									<option value="竣工">竣工</option>
								</select></td>
								<td align="right">技术等级：</td>
								<td><select name="ddlPDDJ" id="ddlPDDJ" style="width:55px; vertical-align:middle;"></select></td>
								<td align="right">行政等级：</td>
								<td><select name="ddlGldj" id="ddlGldj" style="width:80px; vertical-align:middle;"></select></td>
								<td align="right">是否有补助历史：</td>
								<td><select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:80px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select></td>
        					</tr>
        					
        						<tr height="32">
        					<td align="right">计划下达文号：</td>
        						<td><select id="jhxdwh" class="easyui-combobox"  style="width: 65px">
        						</select></td>
        						<td align="right">项目库类型：</td>
										
											<td><select class="easyui-combobox" id='xmklx' style="width: 70px">
												<option value="" selected>请选择</option>
												<option value="部库">部库</option>
												<option value="省库">省库</option>
											</select></td>
									</tr><tr>	
									<td colspan="12">
        						<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchAbgc()" style="vertical-align:middle;"/>
        						<img alt="导出模版" onclick="exportExcelZjxd()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img alt="导入" onclick="importData_jh('abgc_zjxd')" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
        					</td></tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 30px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安保工程项目，
        			批复总投资【&nbsp;<span id="pfztz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="btz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中省投资【&nbsp;<span id="stz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="dftz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			总补助资金【&nbsp;<span id="xdzj" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left:10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<div id="zjxd_abgc" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
