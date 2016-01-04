<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>病害隧道项目</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_bhsd.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('tzlx','调整类型');
			var myDate = new Date();
			plannf("sbnf");
// 			$('#sbnf').combobox("setValue",myDate.getFullYear());
			queryZjqf($('#sbnf').combobox("getValue"));
			var jh={jhnf:$('#sbnf').combobox("getValue"),sbzt:'1',spzt:'1',jh_sbthcd:$.cookie("unit2").length,
					shFlag:'1'};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
				querySumWqgzTz(jh,lx);
				wqxmTz(jh,lx);
		});
		function searchWqgz(){
			var gydwstr;
			var xzqhstr;
			var gydw=$.cookie("unit2");
			gydwstr= $.cookie("unit2");
			/* var gydw=$("#gydw").combotree("getValues");
	 		if(gydw.length==0){
	 			gydwstr= $.cookie("unit2");
	 		}else if(gydw.length==1){
	 			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
	     		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
	 			gydwstr=gydw[0] ;
	 		}else{
	 			gydwstr= gydw.join(',');
	 		} */
// 			var xzqhdm=$("#xzqh").combotree("getValues");
// 	 		if(xzqhdm.length==0){
// 	 			xzqhstr= $.cookie("dist2");
// 	 		}else if(xzqhdm.length==1){
// 	 			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
// 	     		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
// 	     		xzqhstr=xzqhdm[0] ;
// 	 		}else{
// 	 			xzqhstr= xzqhdm.join(',');
// 	 		}
	 		
			var jh={jhnf:$('#sbnf').combobox("getValue"),sbzt:'1',spzt:null,jh_sbthcd:$.cookie("unit2").length,shFlag:'1'};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:null,lxbm:null,sddm:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sdmc').val()!=''){
				lx.sdmc=$('#sdmc').val();
			}
			if($('#sddm').val()!=''){
				lx.sddm=$('#sddm').val();
			}
			if($('#sbnf').combobox('getValue')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlSDZT').combobox('getValue')=="未审定"){
				jh.jh_sdzt='0';
			}else if($('#ddlSDZT').combobox('getValue')=="已审定"){
				jh.jh_sdzt='1';
				
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.jsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#tzlx').combobox('getText')!="全部"){
				jh.tz_type=$('#tzlx').combobox('getValue');
			}
// 			queryZjqf($('#sbnf').combobox("getValue"));
			querySumWqgzTz(jh,lx);
			wqxmTz(jh,lx);
		}
		
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库调整>&nbsp;病害隧道项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 8px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;border:1px solid #e4e5e6;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:227px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:90px;" />
        						<span>&nbsp;隧道名称：</span>
        						<input name="sdmc" type="text" id="sdmc" style="width:90px;" />
        						<span>&nbsp;隧道代码：</span>
        						<input name="sddm" type="text" id="sddm" style="width:90px;" />
        					</p>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>计划年份：</span>
        						<select id="sbnf" style="width: 80px;"></select>
        						<span>&nbsp;审定状态：</span>
        						<select name="ddlSDZT" class="easyui-combobox" id="ddlSDZT" style="width:70px;">
									<option selected="selected" value="">全部</option>
									<option value="未审定">未审定</option>
									<option value="已审定">已审定</option>
								</select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" class="easyui-combobox" id="ddlPDDJ" style="width:65px;">
								</select>
								<span>&nbsp;调整类型：</span>
								<select name="tzlx" class="easyui-combobox" id="tzlx" style="width:100px;">
								</select>
        					</p>
							<p style="margin:8px 0px 4px 20px;">
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" style="vertical-align:middle;padding-left: 10px;"/>
        						<img alt="导出Excel" onclick="exportExceltz('bhsd','tz')" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
							</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个病害隧道项目，
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
