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
			//loadBmbm2('ddlPDDJ','技术等级');
			//loadBmbm2('ddlGldj','行政等级');
			//tsdq('ddlTSDQ');
			//var myDate = new Date();
			//sbnf("sbnf");
			jsdjdx('jsdj');
			
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("sbnf"); 
				xzdjdx('gldj');
			}else{
				setxmnf("sbnf",urlid);
				setxzdj('gldj',urlid);
			}
			
			kjfldx('akjfl');
			tsdqdx('tsdq');
			searchWqgz();
			/* $('#sbnf').combobox("setValue",myDate.getFullYear());
			var jh={jhnf:$('#sbnf').combobox("getValue"),sbzt:'1',spzt:null,jh_sbthcd:4,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			//if(roleName()=="省级"){
				if(getParam("t")=='1'){
					jh.jh_sbthcd=4;
					jh.sbzt=null;
				}
				querySumWqgz(jh,lx); */
// 				wqxm_sh(jh,lx);
			/*}else{
				alert("只有省级用户才能查看审核中的计划信息");
			}*/
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
			var jh={jhnf:xmnf,sbzt:null,spzt:null,jh_sbthcd:4,sfylsjl:$('#sfylsjl').combo("getValue")};
			
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:jsdj,gldj:gldj,lxbm:$("#lxbm").val(),qlmc:null,qlbh:null,akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq,xmklx:$("#xmklx").combobox('getValue')};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				jh.jh_sbthcd=4;
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				jh.jh_sbthcd=6;
			}else{
				jh.jh_sbthcd=4;
				jh.sbzt='1';
			}
			
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
			var jh={jhnf:xmnf,sbzt:null,spzt:null,jh_sbthcd:4,sfylsjl:$('#sfylsjl').combo("getValue")};
			
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:jsdj,gldj:gldj,lxbm:$("#lxbm").val(),qlmc:null,qlbh:null,akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq,xmklx:$("#xmklx").combobox('getValue')};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				jh.jh_sbthcd=4;
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				jh.jh_sbthcd=6;
			}else{
				jh.jh_sbthcd=4;
				jh.sbzt='1';
			}
			querySumWqgz(jh,lx);
			wqxm_sh(jh,lx);
		}
		function spBatch(){
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
			var jh={sbnf:xmnf,sbzt:'1',spzt:null,jh_sbthcd:4};
			var lx={gydw:$('#gydw').combobox('getText'),gydwbm:getgydw($.cookie("unit")),
					xzqhmc:$('#xzqh').combobox('getText'),xzqhdm:getxzqhdm('xzqh'),
					lxmc:null,jsdj:null,lxbm:null,qlmc:null,akjfl:null
			};
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,
					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,'jh.jh_sbthcd':jh.jh_sbthcd};
			$.ajax({
				type:'post',
				async:false,
				url:'../../../jhgl/editWqgzStatusBatch.do',
				data:params,
				dataType:'json',
				success:function(data){
					if(data.result){
						alert("全部审批成功！");
						searchWqgz();
					}
				}
			});
		}
		function sp(id,jh_sbthcd){
			var date=new Date();
			var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
				" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			var jh={'jh.id':id,'jh.spsj':sbsj,'jh.spbmdm':$.cookie("unit"),'jh.spzt':'1',
					'jh.jh_sbthcd':jh_sbthcd+2};
			if(editStatus(jh)){
				alert("审批成功！");
				searchWqgz();
			}
		}
		function tuihui(id,jh_sbthcd){
			var jh={'jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':jh_sbthcd-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchWqgz();
			}
		}
		function dcExcel(){
			var param="lx.gydwbm="+getgydw("gydw")+"&lx.xzqhdm="+getxzqhdm('xzqh');
			param+="&jh.sbnf="+$('#sbnf').combobox("getValue");
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				param+="&jh.jh_sbthcd=4";
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				param+="&jh.jh_sbthcd=6";
			}else{
				param+="&jh.jh_sbthcd=4&jh.sbzt=1";
			}
			alert(param);
			window.location.href="/jxzhpt/jhgl/exportExcelWqgzJhSh.do?"+param;
		}
		function importWqtzSh(){
			var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page : '/jxzhpt/js/uploader/upload.jsp?url='+"/jxzhpt/jhgl/importWqgzJhSh.do"+'&flag='+"wqgzjhsh",
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
			weatherDlg.ShowDialog();
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
		<div id="p_top">计划管理>&nbsp;计划审核>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;危桥改造项目</div>
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
	        						<td>管养单位：</td>
	        						<td colspan="3" style="width:215px;"><select id="gydw" style="width:215px;"></select></td>
	        						<td>行政区划：</td>
	        						<td colspan="3" style="width:224px;"><select id="xzqh" style="width:224px;"></select></td>
	        						<td>路线名称：</td>
	        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:90px;" /></td>
	        						<td>桥梁名称：</td>
	        						<td><input name="txtBridge" type="text" id="txtBridge" style="width:90px;" /></td>
	        						<td>路线编码：</td>
	        						<td><input name="txtRoad" type="text" id="lxbm" style="width:90px;" /></td>
	        					</tr>
	        					<tr height="32">
	        						<td>上报年份：</td>
	        						<td><select id="sbnf" style="width:75px;"></select></td>
	        						<td>上报状态：</td>
	        						<td><select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:70px;">
										<option selected="selected" value="">全部</option>
										<option value="未审核">未审核</option>
										<option value="已审核">已审核</option>
									</select></td>
									<td>特殊地区：</td>
									<td><select name="ddlTSDQ" class="easyui-combobox" id="tsdq" style="width:80px;">
									</select></td>
									<td>技术等级：</td>
									<td><select name="ddlPDDJ" class="easyui-combobox" id="jsdj" style="width:65px;">
									</select></td>
									<td>行政等级：</td>
									<td><select name="ddlGldj" class="easyui-combobox" id="gldj" style="width:94px;">
									</select></td>
									<td>跨径分类：</td>
	        						<td><select name="ddlAKJFL" class="easyui-combobox" id="akjfl" style="width:94px;">
										<option selected="selected" value="">全部</option>
										<option value="特大桥">特大桥</option>
										<option value="大桥">大桥</option>
										<option value="中桥">中桥</option>
										<option value="小桥">小桥</option>
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
										</select>
										</td>
										<td>桥梁编码：</td>
		        						<td><input name="txtRoad" type="text" id="txtqlbm" style="width:80px;" /></td>
										 <td> 项目库类型：</td>
										 <td>
											<select class="easyui-combobox" id='xmklx'>
												<option value="" selected>请选择</option>
												<option value="部库">部库</option>
												<option value="省库">省库</option>
											</select>
										</td>
										<td colspan="10">
										<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" style="vertical-align:middle;padding-left: 10px;"/>
		        						<img name="shenPi" id="shenPi" onclick="spBatch()" src="${pageContext.request.contextPath}/images/Button/qbsp1.png" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qbsp2.png'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qbsp1.png'" style="vertical-align:middle;padding-left: 3px;"/>
		        						<img alt="导出Excel" onclick="dcExcel()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
		        						<img id="drExcel" onclick="importWqtzSh()" alt="导入" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
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
        			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left:10px;font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	<div id="wqgz_xx" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
