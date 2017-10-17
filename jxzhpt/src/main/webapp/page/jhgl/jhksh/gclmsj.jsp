<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面升级项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_gcsj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('yjsdj','技术等级');
			loadBmbm2('gldj','行政等级');
			tsdq('ddlTSDQ');
			sbnf("sbnf");
			var jh={jhnf:null,sbzt:'1',spzt:null,jh_sbthcd:4,sfylsjl:$('#sfylsjl').combo("getValue")},
			lx={lxmc:null,gydwdm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			//if(roleName()=="省级"){
				if(getParam("t")=='1'){
					jh.jh_sbthcd=4;
					jh.sbzt=null;
				}
				queryGcsjSum(jh,lx);
				gclmsjxm_sh(jh,lx);
			/*}else{
				alert("只有省级用户才能查看审核中的计划信息");
			}*/
		});
		function searchGcsj(){
			var jh={jhnf:null,sbzt:null,spzt:null,jh_sbthcd:4,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwdm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),
					lxmc:null,xzqhmc:null,yjsdj:null,lxbm:null};
			if($("#sbnf").combo("getValue")!=""){
				jh.sbnf=$("#sbnf").combo("getValue");
			}
			if($('#txtlxmc').val()!=""){
				lx.lxmc=$('#txtlxmc').val();
			}
			if($("#yjsdj").combo("getValue")!=""){
				lx.yjsdj= $("#yjsdj").combo("getValue");
			}
			if($("#gldj").combo("getValue")!=""){
				lx.lxbm=$("#gldj").combo("getValue");
			}
			if($("#ddlTSDQ").combo("getValue")!=""){
				lx.tsdqbm=$("#ddlTSDQ").combo("getValue");
			}
			if($('#ddlSHZT').combo("getValue")=="未审核"){
				jh.jh_sbthcd=4;
			}else if($('#ddlSHZT').combo("getValue")=="已审核"){
				jh.jh_sbthcd=6;
			}else{
				jh.jh_sbthcd=4;
				jh.sbzt='1';
			}
			queryGcsjSum(jh,lx);
			gclmsjxm_sh(jh,lx);
		}
		function sp(id,jh_sbthcd){
			var date=new Date();
			var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
				" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			var jh={'jh.id':id,'jh.spsj':sbsj,'jh.spbmdm':$.cookie("unit"),'jh.spzt':'1',
					'jh.jh_sbthcd':Number(jh_sbthcd)+2};
			if(editStatus(jh)){
				alert("审批成功！");
				searchGcsj();
			}
		}
		function batchSp(){
			var list=$('#grdab').datagrid("getSelections");
			if(list.length==0){
				alert("请选择要审批的计划！");
				return;
			}
			var jh={'jh.id':'','jh.spzt':'','jh.jh_sbthcd':''};
			$.each(list,function(index,item){
				if(index==list.length-1){
					jh['jh.id']+=item.id;
					jh['jh.spzt']+=item.spzt;
					jh['jh.jh_sbthcd']+=item.jh_sbthcd;
				}else{
					jh['jh.id']+=item.id+',';
					jh['jh.spzt']+=item.spzt+',';
					jh['jh.jh_sbthcd']+=item.jh_sbthcd+',';
				}
			});
			$.ajax({
				type:'post',
				url:'../../../jhgl/editGcsjSpBatch.do',
				dataType:'json',
				data:jh,
				success:function(data){
					if(data.result=="true"){
						alert("审批成功！");
						searchGcsj();
					}else{
						alert("审批失败！");
					}
				},
				error:function(){
					alert("系统错误！");
				}
			});
		}
		function tuihui(id,jh_sbthcd){
			var jh={'jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':Number(jh_sbthcd)-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchGcsj();
			}
		}
		$(window).resize(function () { 
			$('#grdab').datagrid('resize'); 
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库审核>&nbsp;工程改造路面升级项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 8px;">
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
        						<input name="txtRoad" type="text" id="txtlxmc" style="width:100px;" />
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>上报年份：</span>
        						<select id="sbnf" style="width: 80px;"></select>
        						<span>&nbsp;审批状态：</span>
        						<select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:70px;">
									<option selected="selected" value="">全部</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select>
								<span>&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" class="easyui-combobox" id="ddlTSDQ" style="width:80px;"></select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" class="easyui-combobox" id="yjsdj" style="width:65px;"></select>
								<span>&nbsp;原行政等级：</span>
								<select name="ddlGldj" class="easyui-combobox" id="gldj" style="width:104px;"></select>
								<span>&nbsp;补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="否">否</option>
									<option value="是">是</option>
								</select>
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchGcsj()" style="vertical-align:middle;padding-left: 10px;"/>
        						<img name="shenPi" id="shenPi" onclick="batchSp()" src="${pageContext.request.contextPath}/images/Button/qbsp1.png" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qbsp2.png'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qbsp1.png'" style="vertical-align:middle;padding-left: 3px;"/>
        						<img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【 <span id="lblCount" style="font-weight: bold; color: #FF0000">0</span> 】个路面升级项目，总里程共
        			【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，项目里程共【&nbsp;<span id="lblXMLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，其中中央车购税【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，省投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grdab"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	<!-- <div id="gclmsj_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
	<div id="gclmsj_sh" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
