<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/SimpleCanleder.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SimpleCanleder.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/abgc.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm2("kgzt","开工状态");
			loadDist1("xzqh",$.cookie("dist")); 
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','行政等级');
			tsdq('ddlTSDQ');
			if(getParam("t")=='1'){
				$("#ybzt").val('未上报');
			}
			//gcglxmnf("ddlYear");
			
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("ddlYear"); 
				xzdjdx('ddlGldj');
			}else{
				setxmnf("ddlYear",urlid);
				setxzdj('ddlGldj',urlid);
			}
			
			showAll();
		});
		function dcExcel(){
			var gydw=$("#gydw").combotree("getValues");
			if(gydw.length==0){
				if($.cookie("unit2")=='_____36')
					gydwstr=36;
				else gydwstr= $.cookie("unit2");
			}else if(gydw.length==1){
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				gydwstr=gydw[0] ;
			}else{
				gydwstr= gydw.join(',');
			}var jgzt='0';
			var yhjb=$.cookie("unit2");
			var sfsj='';
			if(yhjb.length==11){
				yhtype='县级';
				sfsj=11;
			}
			if(yhjb.length==9||yhjb.length==8){
				yhtype='市级';
				sfsj=9;
			}
			if(yhjb.length<8&&yhjb.length>=2){
				yhtype='省级';
				sfsj=7;
			}
			var kgzt=$("#kgzt").combobox("getValue");
			var lxmc=$("#lxmc").val();
			var xmnf=$("#ddlYear").val();
			var ybzt=$("#ybzt").val();
			var data="gcglabgc.kgzt="+kgzt+"&gcglabgc.jgzt="+jgzt+"&gcglabgc.lxmc="+lxmc+
		 	"&gcglabgc.ybzt="+ybzt+"&gcglabgc.sfsj="+sfsj+"&gcglabgc.xmnf="+xmnf;
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr},function(){
				window.location.href='/jxzhpt/gcgl/dcabgcExcel.do?'+data;
			 });
		}
	</script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
-->
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
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<div id="righttop">
					<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;<span id="astext">进度填报</span>>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;安保工程项目</div>
				</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top:5px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 0 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:5px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="30">
        						<td align="right">管养单位：</td>
        						<td colspan="3"><input id="gydw" style="width: 190px;"></td>
        						<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:120px;"></select></td>
        						<td align="right">开工状态：</td>
        						<td><input id="kgzt" style="width: 75px;"></td>
        						<td align="right">项目年份：</td>
        						<td><select name="ddlYear" id="ddlYear" style="width: 55px;">
        						<option value="">全部</option>
        						</select></td>
        						</tr>
        						<tr height="30">
								
								<td align="right">技术等级：</td>
								<td><select name="ddlPDDJ" id="ddlPDDJ" style="width:55px; vertical-align:middle;"></select></td>
								<td align="right">原行政等级：</td>
								<td><select name="ddlGldj" id="ddlGldj" style="width:60px; vertical-align:middle;"></select></td>
        						<td align="right">特殊地区：</td>
								<td><select name="ddlTSDQ" id="ddlTSDQ" style="width:120px; vertical-align:middle;">
								</select></td>
								<td align="right">路线名称：</td>
        							<td><input type="text" id="lxmc" style="width: 75px;"></td>
								<td align="right">月报状态：</td>
        						<td><select id="ybzt" style="width: 55px;">
        							<option value="">全&nbsp;&nbsp;部</option>
        							<option value="已上报">已上报</option>
        							<option value="未上报">未上报</option>
        						</select></td>
								</tr>
								<tr height="30">
								<td align="right"> 项目库类型</td>
								<td><select class="easyui-combobox" id='xmklx' style="width:55px; ">
									<option value="" selected>请选择</option>
									<option value="部库">部库</option>
									<option value="省库">省库</option>
								</select></td></tr>
								<tr height="30">
								<td colspan="10">
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll()"/>
        					 	<img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="dcExcel()"/>
        						</td></tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
	        <tr>
	            <td width="100%" style="padding-top: 1%;padding-left:10px;">
	                 <div>
						<table id="datagrid" ></table>
					</div>
				</td>
			</tr>	
		</table>
	</div>
</body>
</html>