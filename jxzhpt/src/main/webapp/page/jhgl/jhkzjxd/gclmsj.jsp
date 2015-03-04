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
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_gcsj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			loadBmbm("ddlPDDJ", "技术等级");
			loadBmbm("ddlGldj", "公路等级");
			gydwComboxTree("gydw");
			xzqhComboxTree("xzqh");
			tsdq('ddlTSDQ');
			$.ajax({
				type:'post',
				url:'../../../jhgl/querySumMessage.do',
				dataType:'json',
				success:function(data){
					$('#lblCount').html(data.id);
					$('#lblXDZJ').html(data.jhsybbzje);
				}
			});
			var jh={jhnf:null,sbzt:'1',spzt:'1',jh_sbthcd:6},
			lx={lxmc:null,gydwdm:filterGydwdm($.cookie("unit"))};
			sbnf("sbnf");
			gclmsjxm_zjxd(jh,lx);
		});
		function searchGcsj(){
			var jh={jhnf:null,sbzt:"1",spzt:"1",jh_sbthcd:6};
			var lx={gydw:$("#gydw").combo("getText"),gydwdm:$("#gydw").combo("getValue"),lxmc:null,xzqhmc:null,
					xzqhdm:$("#xzqh").combo("getValue"),yjsdj:null,lxbm:null};
			lx.gydwdm = filterGydwdm(lx.gydwdm);
			lx.xzqhdm=filterXzqhdm(lx.xzqhdm);
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
			gclmsjxm_zjxd(jh,lx);
		}
		$(window).resize(function () { 
			$('#grdab').datagrid('resize'); 
		});
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">计划管理>&nbsp;项目计划库资金下达>&nbsp;工程改造路面升级项目</div>
					</div>
	            </td>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 8px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:237px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:214px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:100px;" />
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<span style="vertical-align:middle;">上报年份：</span>
        						<select id="sbnf" style="width: 80px;vertical-align:middle;"></select>
								<span style="vertical-align:middle;">&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" id="ddlTSDQ" style="width:80px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
									<option value="FEE9AE40475863D6E040007F010045D7">cs</option>
									<option value="517e0f37-12cd-4de9-a452-6aca259457c1">csss</option>
								</select>
								<span style="vertical-align:middle;">&nbsp;建设状态：</span>
        						<select name="ddlSHZT" id="ddlSHZT" style="width:70px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
								</select>
								<span style="vertical-align:middle;">&nbsp;技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" style="width:65px;vertical-align:middle;">
								</select>
								<span style="vertical-align:middle;">&nbsp;公路等级：</span>
								<select name="ddlGldj" id="ddlGldj" style="width:104px;vertical-align:middle;">
								</select>
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchGcsj()" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 30px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">2</span>&nbsp;】个路面升级项目，
        			下发资金共【&nbsp;<span id="lblXDZJ" style="font-weight: bold; color: #FF0000">6</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grdab" width="100%" height="320px"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	</div>
	
	<div id="zjxd_gclmsj" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>