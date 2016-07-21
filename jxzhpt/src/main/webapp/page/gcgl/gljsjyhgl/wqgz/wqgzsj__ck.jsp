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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/wqgz.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/SimpleCanleder.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SimpleCanleder.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm2("kgzt","开工状态");
			loadDist1("xzqh",$.cookie("dist")); 
			loadBmbm2('ddlGldj','行政等级');
			tsdq('ddlTSDQ');
			if(getParam("t")=='1'){
				$("#ybzt").val('未上报');
			}
			gcglxmnf("ddlYear");
			showAll1__ck();
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
			var qlmc=$("#qlmc").val();
			var ybzt=$("#ybzt").val();
			var xmnf=$("#ddlYear").val();
			var data="gcglwqgz.kgzt="+kgzt+"&gcglwqgz.jgzt="+jgzt+"&gcglwqgz.lxmc="+lxmc+
		 	"&gcglwqgz.qlmc="+qlmc+"&gcglwqgz.qlbh="+$('#qlbm').val()+
		 	"&gcglwqgz.ybzt="+ybzt+"&gcglwqgz.sfsj="+sfsj+"&gcglwqgz.xmnf="+xmnf
		 	+'&gcglwqgz.sfylrbwqk='+$("#sfylrbwqk").combobox("getValue")+'&gcglwqgz.gydwtj='+"and gydwbm like '1%'";
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr},function(){
				window.location.href='/jxzhpt/gcgl/dcwqgzsjExcel.do?'+data;
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
  cursor: pointer;
}
a:active {
 text-decoration: none;
}
-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 0.01%; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr><td>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程管理>&nbsp;公路建设及养护管理>&nbsp;危桥改造工程项目(交通局)</div>
					</div>
			</td>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="height:120px;width:99.8%;text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 1% 0% 1% 2%;">
        						<span>管养（监管）单位：</span>
        						<input id="gydw" style="width: 180px;">
        							<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						
        						<span>开工状态：</span>
        						<input id="kgzt" style="width: 70px;">
        						<span>路线名称：</span>
        							<input type="text" id="lxmc" style="width: 100px;">
        						<span>项目年份：</span> 
        						<select name="ddlYear" id="ddlYear" style="width: 70px;">
        						<option value="">全部</option>
        						</select>
        						
        						 <p style="margin: 1% 0% 1% 2%;">
								<span style=" vertical-align:middle;">行政等级：</span>
								<select name="ddlGldj" id="ddlGldj" style="width:102px; vertical-align:middle;"></select>
        						<span style=" vertical-align:middle;">特殊地区：</span>
								<select name="ddlTSDQ" id="ddlTSDQ" style="width:108px; vertical-align:middle;">
								</select>
								
        							<span>桥梁编码：</span>
        						<input type="text" id="qlbm" style="width: 100px;">
        						<span>桥梁名称：</span>
        						<input type="text" id="qlmc" style="width: 100px;">
        						
        							<span>月报状态：</span>
        						<select id="ybzt" style="width: 70px;">
        							<option value="">全&nbsp;&nbsp;部</option>
        							<option value="已上报">已上报</option>
        							<option value="未上报">未上报</option>
        						</select>
        						<span>是否部库：</span>
	        						<select id="sfylrbwqk" class="easyui-combobox"  style="width: 70px">
									<option value="" selected>全部</option>
									<option value="否" >否</option>
									<option value="是">是</option>
									</select>
								</p>
								<p style="margin: 1% 0% 1% 2%;">
									
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll1__ck()"/>        					
                                <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="dcExcel()"/>
        						</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td style="padding-top: 1%;padding-left: 10px;">
                    <div>
						<table id="datagrid" >
						</table>
					</div>
			</td>
		</tr>
	</table>
	</div>
	
</body>
</html>