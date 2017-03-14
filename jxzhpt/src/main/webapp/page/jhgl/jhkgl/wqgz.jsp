<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_wqgz.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
	var gljjtj="";
		$(function(){
			//sbnf("sbnf");
			
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			//loadBmbm2('ddlPDDJ','技术等级');
			//loadBmbm2('ddlGldj','行政等级');
			//tsdq('tsdq');

			//xmnfdx("sbnf");
			//xzdjdx('gldj');
			
			var urlid=getUrlParame('id');
			gljjtj=getgljjtj(urlid);
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
			/* var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var akjfl=$("#akjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			
			
			var jh={jhnf:xmnf,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			 */
			//querySumWqgz(jh,lx);
			if($.cookie("unit2").length==7 || $.cookie("unit2").length==2){
				$('#imglrjh').show();
			}
			//querySumWqgz(jh,lx);
			//wqxm(jh,lx);
			searchWqgz();
		});
		function tjwqgz(){
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
			var jh={jhnf:xmnf,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:jsdj,gldj:gldj,lxbm:$('#lxbm').val(),qlmc:null,qlbh:null,akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
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
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}
			
			//wqxm(jh,lx);
			querySumWqgz(jh,lx);
		}
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
			
			var jh={jhnf:xmnf,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:jsdj,gldj:gldj,lxbm:$('#lxbm').val(),qlmc:null,qlbh:null,akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq,xmklx:$("#xmklx").combobox('getValue')};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
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
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}
			
			wqxm(jh,lx);
			querySumWqgz(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
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
		<div id="p_top">计划管理>&nbsp;计划查询>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;危桥改造项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
        						<td>管养单位：</td>
        						<td  colspan="3" style="width:220px;"><select id="gydw" style="width:220px;"></select></td>
        						<td>行政区划：</td>
        						<td  colspan="3" style="width:230px;"><select id="xzqh" style="width:230px;"></select></td>
        						<td>路线名称：</td>
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:90px;" /></td>
        						<td>桥梁名称：</td>
        						<td><input name="txtBridge" type="text" id="txtBridge" style="width:90px;" /></td>
        						<td>路线编码：</td>
        						<td><input name="txtRoad" type="text" id="lxbm" style="width:90px;" /></td>
        						
        					</tr>
        					<tr height="32">
        						<td>上报年份：</td>
        						<td><select id="sbnf" style="width: 80px;"></select></td>
        						<td>计划状态：</td>
        						<td><select name="ddlSHZT" id="ddlSHZT" style="width:70px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select></td>
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:80px;" class="easyui-combobox">
									<!-- <option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
									<option value="FEE9AE40475863D6E040007F010045D7">cs</option>
									<option value="517e0f37-12cd-4de9-a452-6aca259457c1">csss</option> -->
								</select></td>
								<td>技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:65px;" class="easyui-combobox">
								</select></td>
								<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:94px;" class="easyui-combobox">
								</select></td>
								<td>跨径分类：</td>
        						<td><select name="akjfl" id="akjfl" style="width:94px;" class="easyui-combobox">
									<!-- <option selected="selected" value="">全部</option>
									<option value="特大桥">特大桥</option>
									<option value="大桥">大桥</option>
									<option value="中桥">中桥</option>
									<option value="小桥">小桥</option> -->
								</select></td>
								<td>建设性质：</td>
        						<td><select id="jsxz" class="easyui-combobox" data-options="panelHeight:'100'" onchange="setbz()">
									<option value=""selected>全部</option>
									<option value="加固改造">加固改造</option>
									<option value="拆除重建">拆除重建</option>
<!-- 									<option value="大修">大修</option> -->
									</select></td>	
        					</tr>
								<tr height="32">
								<td>是否有补助历史：</td>
								<td><select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select></td>
								<td>桥梁编码：</td>
        						<td><input name="txtRoad" type="text" id="txtqlbm" style="width:80px;" />
								</td>
									<td> 项目库类型：</td>
									<td>	
											<select class="easyui-combobox" id='xmklx'>
												<option value="" selected>请选择</option>
												<option value="部库">部库</option>
												<option value="省库">省库</option>
											</select></td>
                              <td colspan="12">
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" style="vertical-align:middle;"/>
								<img alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportModule('Plan_Bridge')"/>
								<img alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" onclick="importData_jh('wqgz_jh')" style="vertical-align:middle;"/>
				                <img onclick="dropWqgzs()" alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" style="vertical-align:middle;"/>
				                <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportExcel('wqgz')"/>
								<!-- <img id="imglrjh" alt="列入计划" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/lrjh_2.png'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/lrjh_1.png'" src="${pageContext.request.contextPath}/images/Button/lrjh_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;display: none;"  onclick="showLrjh('lrjh_wq.jsp','1100','500');"/> -->
							</td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个危桥改造项目，
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
