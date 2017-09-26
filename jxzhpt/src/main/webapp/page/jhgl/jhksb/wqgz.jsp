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
		var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
		var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
		var xian=true;
		if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
			xian=false;
		}
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			//loadBmbm2('ddlPDDJ','技术等级');
			//loadBmbm2('ddlGldj','行政等级');
			//tsdq('ddlTSDQ');
			
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
			//sbnf("sbnf");
			//$('#sbnf').combobox("setValue",myDate.getFullYear());
			/* var jh={jhnf:$('#sbnf').combobox("getValue"),sbzt:null,spzt:'0',jh_sbthcd:0,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			if(!xian){
				jh.jh_sbthcd=2;
			}
			if(getParam("t")=='1'){
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
				jh.spzt=null;
			}
			querySumWqgz(jh,lx);
			wqxm_sb(jh,lx); */
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
			var jh={jhnf:xmnf,sbzt:null,spzt:null,jh_sbthcd:0,sfylsjl:$('#sfylsjl').combo("getValue")};
			if(!xian){
				jh.jh_sbthcd=2;
			}
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
			
			if($('#ddlSHZT').combobox('getValue')=="未上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}else if($('#ddlSHZT').combobox('getValue')=="已上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=2;
				}else{
					jh.jh_sbthcd=4;
				}
			}else{
				jh.spzt='0';
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
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
			var jh={jhnf:xmnf,sbzt:null,spzt:null,jh_sbthcd:0,sfylsjl:$('#sfylsjl').combo("getValue")};
			if(!xian){
				jh.jh_sbthcd=2;
			}
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:jsdj,gldj:gldj,lxbm:$("#lxbm").val(),qlmc:null,qlbh:null,akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			
			if($('#ddlSHZT').combobox('getValue')=="未上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}else if($('#ddlSHZT').combobox('getValue')=="已上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=2;
				}else{
					jh.jh_sbthcd=4;
				}
			}else{
				jh.spzt='0';
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}
			querySumWqgz(jh,lx);
			wqxm_sb(jh,lx);
		}
		function dcExcel(){
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
			var jh={jhnf:xmnf,sbzt:"",spzt:"",jh_sbthcd:0,sfylsjl:$('#sfylsjl').combo("getValue")};
			if(!xian){
				jh.jh_sbthcd=2;
			}
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:"",jsdj:jsdj,gldj:gldj,lxbm:$("#lxbm").val(),qlmc:"",qlbh:"",akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			
			if($('#ddlSHZT').combobox('getValue')=="未上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}else if($('#ddlSHZT').combobox('getValue')=="已上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=2;
				}else{
					jh.jh_sbthcd=4;
				}
			}else{
				jh.spzt='0';
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}
// 			var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
// 					'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
// 					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
// 					"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,
// 					"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq};
			var param="jh.sbzt="+jh.sbzt+"&jh.spzt="+jh.spzt+"&jh.sbnf="+jh.jhnf+"&jh.jhkgsj="+jh.jhkgsj+
					"&jh.sfylsjl="+jh.sfylsjl+"&jh.jh_sbthcd="+jh.jh_sbthcd+
					"&lx.gydwbm="+getgydw("gydw")+"&lx.xzqhdm="+getxzqhdm('xzqh')+"&lx.lxmc="+lx.lxmc+
					"&lx.lxbm="+lx.lxbm+"&lx.qlmc="+lx.qlmc+"&lx.akjfl="+lx.akjfl+"&lx.jsxz="+lx.jsxz+
					"&lx.jsdj="+lx.jsdj+"&lx.gldj="+lx.gldj+"&lx.tsdq="+lx.tsdq;
			alert(param);
			window.location.href="/jxzhpt/jhgl/exportExcelWqgzJhSb.do?"+param;
		}
		function sbList(){
			//判断是否能上报，如果可以上报就查询所有要上报的计划，并上报
				var param={'jh.sbnf':zjqf['zjqf.nf'],'jh.jh_sbthcd':0,
						'lx.gydwbm':$.cookie("unit")};
				if(roleName()=="市级"){
					param['jh.jh_sbthcd']=2;
				}
				$.ajax({
					type:'post',
					url:'../../../jhgl/queryWqgzByStatus.do',
					async:false,
					data:param,
					dataType:'json',
					success:function(data){
						if(data.length>0){
							$.each(data,function(index,item){
								var date=new Date();
								var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
									" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
								var jh={'jh.id':item.id,'jh.sbsj':sbsj,'jh.sbbmdm':$.cookie("unit"),'jh.sbzt':'1',
										'jh.jh_sbthcd':parseInt(item.jh_sbthcd,10)+2};
								if(xian){
									jh['jh.sbzt']='0';
								}
								editStatus(jh);
							});
							alert("上报成功！");
							searchWqgz();
						}else{
							alert("无需要上报的计划！");
						}
					}
				});
		}
		function sb(id,jh_sbthcd){
			var date=new Date();
			var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
				" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			var jh={'jh.id':id,'jh.sbsj':sbsj,'jh.sbbmdm':$.cookie("unit"),'jh.sbzt':'1',
					'jh.jh_sbthcd':Number(jh_sbthcd)+2};
			if(xian){
				jh['jh.sbzt']='0';
			}
			if(editStatus(jh)){
				alert("上报成功！");
				searchWqgz();
			}
		}
		function tuihui(id,jh_sbthcd){
			var jh={'jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':Number(jh_sbthcd)-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchWqgz();
			}
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
		<div id="p_top">计划管理>&nbsp;计划申报>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;危桥改造项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 3px;">
        			<fieldset id=""searchField style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:3px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
								<tr height="27">
	        						<td align="right">管养单位：</td>
	        						<td colspan="3" ><select id="gydw" style="width:185px;"></select></td>
	        						<td align="right">行政区划：</td>
	        						<td colspan="3" ><select id="xzqh" style="width:200px;"></select></td>
	        						<td align="right">路线名称：</td>
	        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:70px;" /></td>
	        						<td align="right">桥梁名称：</td>
	        						<td><input name="txtBridge" type="text" id="txtBridge" style="width:70px;" /></td>
	        					</tr>
	        					<tr height="27">
	        						<td align="right">上报年份：</td>
	        						<td><select id="sbnf" style="width: 55px;"></select></td>
	        						<td align="right">上报状态：</td>
	        						<td><select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:55px;">
										<option selected="selected" value="">全部</option>
										<option value="未上报">未上报</option>
										<option value="已上报">已上报</option>
									</select></td>
									<td align="right">特殊地区：</td>
									<td><select name="ddlTSDQ" class="easyui-combobox" id="tsdq" style="width:70px;">
									</select></td>
									<td align="right">技术等级：</td>
									<td><select name="ddlPDDJ" class="easyui-combobox" id="jsdj" style="width:57px;">
									</select></td>
									<td align="right">原行政等级：</td>
									<td><select name="ddlGldj" class="easyui-combobox" id="gldj" style="width:75px;">
									</select></td>
									<td align="right">跨径分类：</td>
	        						<td><select name="ddlAKJFL" class="easyui-combobox" id="akjfl" style="width:72px;">
										<!-- <option selected="selected" value="">全部</option>
										<option value="特大桥">特大桥</option>
										<option value="大桥">大桥</option>
										<option value="中桥">中桥</option>
										<option value="小桥">小桥</option> -->
									</select></td>
	        					</tr>
								<tr height="27">
									<td align="right">路线编码：</td>
	        						<td><input name="txtRoad" type="text" id="lxbm" style="width:53px;" /></td>
									<td align="right">建设性质：</td>
	        						<td><select id="jsxz" class="easyui-combobox" style="width:55px;"data-options="panelHeight:'100'" onchange="setbz()">
										<option value=""selected>全部</option>
										<option value="加固改造">加固改造</option>
										<option value="拆除重建">拆除重建</option>
	<!-- 									<option value="大修">大修</option> -->
										</select></td>	
									<td align="right">补助历史：</td>
									<td><select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:70px;">
										<option value="" selected="selected">全部</option>
										<option value="无">否</option>
										<option value="是">是</option>
									</select> </td>
									<td align="right">桥梁编码：</td>
	        						<td><input name="txtRoad" type="text" id="txtqlbm" style="width:55px;" />
	                              	</td><td align="right"> 项目库类型：</td>
									<td>	
											<select class="easyui-combobox" id='xmklx' style="width:75px;">
												<option value="" selected>请选择</option>
												<option value="部库">部库</option>
												<option value="省库">省库</option>
											</select></td>
											</tr><tr height="28">
	                              	<td colspan="10">
									
									<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" style="vertical-align:middle;padding-left: 8px;"/>
	<%--         						<img onclick="sbList()" id="btnShangbao" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qbshangbao_2.png'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qbshangbao_1.png'" src="${pageContext.request.contextPath}/images/Button/qbshangbao_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
	        						<img alt="导出Excel"  onclick="dcExcel()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
									</td>
	                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:0px 0px 5px 20px; font-size: 12px;">
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
