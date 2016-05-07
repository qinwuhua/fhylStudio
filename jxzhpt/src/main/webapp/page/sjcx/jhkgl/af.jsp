<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安防工程项目</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			jsdjdx('ddlPDDJ');
			
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("sbnf"); 
				xzdjdx('ddlGldj');
			}else{
				setxmnf("sbnf",urlid);
				setxzdj('ddlGldj',urlid);
			}
			
			tsdqdx('ddlTSDQ');
			searchAbgc();
			/*}else{
				alert("只有省级用户才能查看审核中的计划信息");
			}*/
		});
		function searchAbgctj(){
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
			var jh={xmlx:'af',jhnf:xmnf,sbzt:null,spzt:null,jh_sbthcd:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:jsdj,lxbm:null,gldj:gldj,tsdq:tsdq};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#lxbm').val()!=""){
				lx.lxbm=$('#lxbm').val();
			}
			
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				jh.jh_sbthcd=4;
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				jh.jh_sbthcd=6;
			}else{
				jh.sbzt='1';
				jh.jh_sbthcd=4;
			}
			

			querySumAbgc(jh,lx);

		}
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
			var jh={xmlx:'af',jhnf:xmnf,sbzt:null,spzt:null,jh_sbthcd:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:jsdj,lxbm:null,gldj:gldj,tsdq:tsdq};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#lxbm').val()!=""){
				lx.lxbm=$('#lxbm').val();
			}
			
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				jh.jh_sbthcd=4;
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				jh.jh_sbthcd=6;
			}else{
				jh.sbzt='1';
				jh.jh_sbthcd=4;
			}
			querySumAbgc(jh,lx);
			afgcxm_sh(jh,lx);
		}
		function batchSp(){
			var jh={xmlx:'af',sbnf:$('#sbnf').combobox("getValue"),sbzt:'1',spzt:null,jh_sbthcd:4};
			var lx={gydw:null,gydwdm:null,gydwbm:filterGydwdm($.cookie("unit")),
					xzqhdm:$.cookie("unit")};
			var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,
					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,'jh.jh_sbthcd':jh.jh_sbthcd};
			$.ajax({
				type:'post',
				async:false,
				url:'../../../jhgl/editAbgcStatusBatch.do',
				data:params,
				dataType:'json',
				success:function(data){
					if(data.result=="true"){
						alert("全部审批成功！");
						searchAbgc();
					}
				}
			});
		}
		function sp(id,jh_sbthcd){
			var date=new Date();
			var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
				" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			var jh={'jh.xmlx':'af','jh.id':id,'jh.spsj':sbsj,'jh.spbmdm':$.cookie("unit"),'jh.spzt':'1',
					'jh.jh_sbthcd':Number(jh_sbthcd)+2};
			if(editStatus(jh)){
				alert("审批成功！");
				searchAbgc();
			}
		}
		function tuihhui(id,jh_sbthcd){
			var jh={'jh.xmlx':'af','jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':Number(jh_sbthcd)-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchAbgc();
			}
		}
		function editStatus(jh){
			var result;
			$.ajax({
				type:'post',url:'../../../jhgl/editStatus.do',
				dataType:'json',data:jh,async:false,
				success:function(data){
					if(data.result)
						result = true;
					else
						result = false;
				},
				error:function(){
					result=false;
				}
			});
			return result;
		}
		function dcExcel(){
			var param="lx.gydwbm="+getgydw("gydw")+"&lx.xzqhdm="+getxzqhdm('xzqh')+"&jh.xmlx=af";
			param+="&jh.jhnf="+$('#sbnf').combobox("getValue");
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				param+="&jh.jh_sbthcd=4";
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				param+="&jh.jh_sbthcd=6";
			}else{
				param+="&jh.jh_sbthcd=4&jh.sbzt=1";
			}
			
			window.location.href="/jxzhpt/jhgl/exportExcelAbgcJhSh.do?"+param;
		}
		function importAbgcSh(){
			var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page : '/jxzhpt/js/uploader/upload.jsp?url='+"/jxzhpt/jhgl/importExcelAbgcJhSh.do"+'&flag='+"wqgzjhsh",
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
		function tz(id){
			YMLib.Var.id=id;
			YMLib.UI.createWindow('ab_tz','安防工程',"/jxzhpt/page/jhgl/jhkgl/abgc_tz.jsp",'wq_tz',500,200);
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
		<div id="p_top">计划管理>&nbsp;计划查询>&nbsp;<span id="bstext"></span>>&nbsp;安防工程项目</div>
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
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:100px;" /></td>
        						<td>路线编码：</td>
        						<td><input name="txtRoad" type="text" id="lxbm" style="width:100px;" /></td>
        					</tr>
        					<tr height="32">
        						<td>上报年份：</td>
        						<td><select id="sbnf" style="width: 75px;"></select></td>
        						<td>审批状态：</td>
        						<td><select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:70px;">
									<option selected="selected" value="">全部</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select></td>
								<td>特殊地区：</td>
								<td><select name="ddlTSDQ" class="easyui-combobox" id="ddlTSDQ" style="width:80px;"></select></td>
								<td>技术等级：</td>
								<td><select name="ddlPDDJ" class="easyui-combobox" id="ddlPDDJ" style="width:65px;"></select></td>
								<td>行政等级：</td>
								<td><select name="ddlGldj" class="easyui-combobox" id="ddlGldj" style="width:104px;"></select></td>
								<td>是否有补助历史：</td>
								<td><select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select></td>
        					</tr>
        					<tr height="32">
                              	<td colspan="10">
        							<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchAbgc()" style="vertical-align:middle;padding-left: 10px;"/>
<%--         							<img name="shenPi" id="shenPi" onclick="batchSp()" src="${pageContext.request.contextPath}/images/Button/qbsp1.png" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qbsp2.png'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qbsp1.png'" style="vertical-align:middle;padding-left: 3px;"/> --%>
        							<img alt="导出Excel" onclick="dcExcel()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
<!--         							<img id="drExcel" onclick="importAbgcSh()" alt="导入" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
                             	</td>
                           	</tr>
        				</table>
        			</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安防工程项目，
        			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<div id="abgc_sh" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
