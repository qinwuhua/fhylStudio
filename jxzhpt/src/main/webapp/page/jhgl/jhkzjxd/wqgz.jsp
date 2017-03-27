<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造项目</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_wqgz.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
// 			loadBmbm2('ddlPDDJ','技术等级');
// 			tsdq('ddlTSDQ');
// 			sbnf("sbnf");
			
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("sbnf"); 
				xzdjdx('gldj');
			}else{
				setxmnf("sbnf",urlid);
				setxzdj('gldj',urlid);
			}
			
			jsdjdx('jsdj');
			kjfldx('akjfl');
			tsdqdx('tsdq');
			 /*var jh={jhnf:null,jh_sbthcd:6,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			queryMessage(jh,lx);
			wqxm_zjxd(jh,lx); */
			searchWqgz();
		});
		function searchWqgz(){
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jsdj=$("#jsdj").combobox("getValues").join(",");
			if(jsdj.substr(0,1)==',')
				jsdj=jsdj.substr(1,jsdj.length);
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var akjfl=$("#akjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var jh={jhnf:xmnf,sbzt:'1',spzt:null,jh_sbthcd:6,jgzt:null,kgzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:jsdj,gldj:gldj,lxbm:$("#lxbm").val(),qlmc:null,qlbh:null,akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq,xmklx:$("#xmklx").combobox('getValue')};

			
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
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
			
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			
			queryMessage(jh,lx);
			wqxm_zjxd(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function queryMessage(jh,lx){
			
			var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt,
					'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
					"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,"lx.lxbm":lx.lxbm,"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq,'lx.xmklx':lx.xmklx};

			$.ajax({
				type:'post',
				url:'../../../jhgl/querySumWqgz.do',
				data:param,
				dataType:'json',
				success:function(data){
					if(data.id>0){
						$('#lblCount').html(data.id);
						$('#pfztz').html(data.pfztz);
						$('#stz').html("0");
						$('#btz').html(data.jhsybzje);
						$('#dftz').html(data.jhsydfzcje);
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
			var gydwdm=$.cookie("unit");
			var gydwbm=getgydw("gydw");
			var xzqhdm=getxzqhdm('xzqh');
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jsdj=$("#jsdj").combobox("getValues").join(",");
			if(jsdj.substr(0,1)==',')
				jsdj=jsdj.substr(1,jsdj.length);
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var akjfl=$("#akjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var param="jh.jh_sbthcd=6"+"&lx.gydwdm="+gydwdm+"&lx.gydwbm="+gydwbm+"&lx.xzqhdm="+xzqhdm+
					"&lx.lxmc="+$('#txtRoad').val()+"&lx.lxbm="+$('#lxbm').val()+"&lx.akjfl="+akjfl+
					"&lx.qlmc="+$('#txtBridge').val()+"&lx.tsdq="+tsdq+
					"&lx.jsdj="+jsdj+"&lx.gldj="+gldj+
					"&jh.sbnf="+xmnf+"&jh.sfylrbwqk=是";
			if($('#ddlSHZT').combo("getValue")=="未开工"){
				param+="&jh.kgzt=0";
			}else if($('#ddlSHZT').combo("getValue")=="在建"){
				param+="&jh.kgzt=1&jh.jgzt=0";
			}else if($('#ddlSHZT').combo("getValue")=="竣工"){
				param+="&jh.jgzt=1";
			}
			window.location.href="/jxzhpt/jhgl/exportWqgzZjxdExcel.do?"+param;
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
		<div id="p_top">计划管理>&nbsp;计划下达>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;危桥改造项目</div>
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
        						<td colspan="3" ><select id="gydw" style="width:205px;"></select></td>
        						<td align="right">行政区划：</td>
        						<td colspan="3" ><select id="xzqh" style="width:214px;"></select></td>
        						<td align="right">路线名称：</td>
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:80px;" /></td>
        						<td align="right">桥梁名称：</td>
        						<td><input name="txtBridge" type="text" id="txtBridge" style="width:80px;" /></td>
        					</tr>
        					<tr height="32">
        						<td align="right">上报年份：</td>
        						<td><select id="sbnf" style="width:60px;"></select></td>
        						<td align="right">建设状态：</td>
        						
        						<td><select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:60px;">
									<option selected="selected" value="">全部</option>
									<option value="未开工">未开工</option>
									<option value="在建">在建</option>
									<option value="竣工">竣工</option>
								</select></td>
								<td align="right">特殊地区：</td>
								<td><select name="ddlTSDQ" class="easyui-combobox" id="tsdq" style="width:70px;">
								</select></td>
								<td align="right">技术等级：</td>
								<td><select name="ddlPDDJ" class="easyui-combobox" id="jsdj" style="width:55px;">
								</select></td>
								<td align="right">行政等级：</td>
								<td><select name="ddlGldj" class="easyui-combobox" id="gldj" style="width:80px;">
								</select></td>
								<td align="right">跨径分类：</td>
        						<td><select name="ddlAKJFL" class="easyui-combobox" id="akjfl" style="width:82px;">
									<option selected="selected" value="">全部</option>
									<option value="特大桥">特大桥</option>
									<option value="大桥">大桥</option>
									<option value="中桥">中桥</option>
									<option value="小桥">小桥</option>
								</select></td>
        					</tr>
							<tr height="32">
								<td align="right">建设性质：</td>
        						<td><select id="jsxz" class="easyui-combobox" data-options="panelHeight:'100'" onchange="setbz()" style="width:60px;">
									<option value=""selected>全部</option>
									<option value="加固改造">加固改造</option>
									<option value="拆除重建">拆除重建</option>
<!-- 									<option value="大修">大修</option> -->
									</select></td>	
								<td align="right">路线编码：</td>
        						<td><input name="txtRoad" type="text" id="lxbm" style="width:58px;" /></td>
                             
                              
								<td align="right">是否有补助历史：</td>
								<td><select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:70px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select></td>
								<td align="right">桥梁编码：</td>
        						<td><input name="txtRoad" type="text" id="txtqlbm" style="width:53px;" /></td>
								<td align="right"> 项目库类型：</td>
										
											<td><select class="easyui-combobox" id='xmklx' style="width:80px;">
												<option value="" selected>请选择</option>
												<option value="部库">部库</option>
												<option value="省库">省库</option>
											</select></td>
										</tr>	<tr>
											 	<td colspan="12">
								<img onclick="searchWqgz()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
								<img alt="导出模版" onclick="exportExcelZjxd()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img alt="导入" onclick="importData_jh('wqgz_zjxd')" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
							</td>
                           </tr>
                          </table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个危桥改造项目，
        			批复总投资【&nbsp;<span id="pfztz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="btz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中省投资【&nbsp;<span id="stz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="dftz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			总补助资金【&nbsp;<span id="xdzj" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
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
	<div id="zjxd_wqgz" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>