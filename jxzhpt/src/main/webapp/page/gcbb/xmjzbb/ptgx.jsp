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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			setjhxdnf();
			settsdq();
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			showAll();
		});
		function setjhxdnf(){
			$("#jhxdnf").combotree({    
				checkbox: true,
			    url: '/jxzhpt/xmjzbb/setjhxdnf.do',    
			    required: false,
			    multiple:true
			})
		}
		function settsdq(){
			$("#tsdq").combotree({    
				checkbox: true,
			    url: '/jxzhpt/xmjzbb/settsdq.do?xzqh='+$.cookie("dist"),    
			    required: false,
			   // multiple:true
			})
		}
		function showAll(){
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
			}
		var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var jhxdnf=$("#jhxdnf").combotree("getValues");
			var jszt=$("#jszt").val();
			var qxkg=$("#qxkg").val();
			var ljbf=$("#ljbf").val();
			var wbf=$("#wbf").val();
			var tsdq=$("#tsdq").combobox("getText");
			var data="xmbb.jhxdnf="+jhxdnf+"&xmbb.jszt="+jszt+"&xmbb.gydw="+gydwstr+"&xmbb.xzqh="+xzqhstr+"&xmbb.ljbf="+ljbf+"&xmbb.wbf="+wbf+"&xmbb.qxkg="+qxkg+"&xmbb.tsdq="+tsdq;

			var tbody = $("#ptgxlist");
					tbody.empty();
			$.ajax({
				url:"/jxzhpt/xmjzbb/getPtgxbb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					
					var tbodystr="";
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							if(msg[i].sl>1){
								var j=msg[i].sl;
								for(var k=0;k<j;k++)
									{
										
									   if(k==0){
										   tbodystr=tbodystr+ "<tr><td >"+msg[i].v_0+"</td><td>"
											+msg[i].v_1+"</td><td>"
											+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
											+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
											+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
											+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"+msg[i].v_10+"</td><td>"
											+msg[i].v_11+"</td><td>"
											+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
											+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"
											+msg[i].v_16+"</td><td>"+msg[i].v_17+"</td><td>"
											+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"+msg[i].v_20+"</td><td>"
											+msg[i].v_21+"</td><td>"
											+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
											+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"
											+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"
											+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"+msg[i].v_30+"</td><td>"
											+msg[i].v_31+"</td><td>"
											+msg[i].v_32+"</td><td>"+msg[i].v_33+"</td><td>"
											+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"
											+msg[i].v_36+"</td><td>"+msg[i].v_37+"</td><td>"
											+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td><td>"+msg[i].v_40+"</td><td>"
											+msg[i].v_41+"</td><td>"
											+msg[i].v_42+"</td><td>"+msg[i].v_43+"</td><td>"
											+msg[i].v_44+"</td><td>"+msg[i].v_45+"</td><td>"
											+msg[i].v_46+"</td><td>"+msg[i].v_47+"</td><td>"
											+msg[i].v_48+"</td><td>"+msg[i].v_49+"</td><td>"+msg[i].v_50+"</td><td>"
											+msg[i].v_51+"</td><td>"
											+msg[i].v_52+"</td><td>"+msg[i].v_53+"</td><td>"
											+msg[i].v_54+"</td><td>"+msg[i].v_55+"</td><td>"
											+msg[i].v_56+"</td><td>"+msg[i].v_57+"</td><td>"
											+msg[i].v_58+"</td><td>"+msg[i].v_59+"</td><td>"+msg[i].v_60+"</td><td>"
											+msg[i].v_61+"</td></tr>";
										  /*  tbodystr=tbodystr+"<tr><td  rowspan="+j+">"+msg[i].XH+"</td><td  rowspan="+j+">"+msg[i].XMMC+"</td><td  rowspan="+j+">"
											+msg[i].XZQHMC+"</td><td  rowspan="+j+">"+msg[i].TSDQ+"</td><td>"
											+msg[i].XDNF+"</td><td  rowspan="+j+">"+msg[i].QDZH+"</td><td  rowspan="+j+">"
											+msg[i].ZDZH+"</td><td  rowspan="+j+">"+msg[i].YHLC+"</td><td  rowspan="+j+">"
											+msg[i].PFZTZ+"</td><td>"+msg[i].JHXDZJ+"</td><td>"
											+msg[i].BNBFZJ+"</td><td>"+ybf+"</td><td>"+wbf+"</td><td  rowspan="+j+">"
											+msg[i].JSZT+"</td><td  rowspan="+j+">"+msg[i].DC+"</td><td  rowspan="+j+">"
											+msg[i].JC+"</td><td  rowspan="+j+">"+msg[i].WGLC+"</td><td  rowspan="+j+">"
											+msg[i].WKGLC+"</td><td  rowspan="+j+">"+msg[i].SJKGSJ+"</td><td  rowspan="+j+">"
											+msg[i].SFQXKG+"</td><td  rowspan="+j+">"+msg[i].KGDL+"</td><td  rowspan="+j+">"
											+msg[i].SJWGSJ+"</td><td  rowspan="+j+">"+msg[i].YJWGSJ+"</td><td  rowspan="+j+">"
											+msg[i].QKSM+"</td><td>"+msg[i].XDWH+"</td><td>" 
											+msg[i].XGCSYJ+"</td><td>"+msg[i].CSCYJ+"</td></tr>";*/
										}else{
											/* tbodystr=tbodystr+"<tr><td  >"+msg[i+k].XDNF+"</td><td  >"
											+msg[i+k].JHXDZJ+"</td><td  >"+ybf+"</td><td  >"
											+msg[i].BNBFZJ+"</td><td>"+wbf+"</td><td  >"+msg[i+k].XDWH+"</td><td  >"
											+msg[i+k].XGCSYJ+"</td><td  >"+msg[i+k].CSCYJ+"</td></tr>"; */
											tbodystr=tbodystr+ "<tr><td >"+msg[i].v_0+"</td><td>"
											+msg[i].v_1+"</td><td>"
											+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
											+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
											+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
											+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"+msg[i].v_10+"</td><td>"
											+msg[i].v_11+"</td><td>"
											+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
											+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"
											+msg[i].v_16+"</td><td>"+msg[i].v_17+"</td><td>"
											+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"+msg[i].v_20+"</td><td>"
											+msg[i].v_21+"</td><td>"
											+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
											+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"
											+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"
											+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"+msg[i].v_30+"</td><td>"
											+msg[i].v_31+"</td><td>"
											+msg[i].v_32+"</td><td>"+msg[i].v_33+"</td><td>"
											+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"
											+msg[i].v_36+"</td><td>"+msg[i].v_37+"</td><td>"
											+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td><td>"+msg[i].v_40+"</td><td>"
											+msg[i].v_41+"</td><td>"
											+msg[i].v_42+"</td><td>"+msg[i].v_43+"</td><td>"
											+msg[i].v_44+"</td><td>"+msg[i].v_45+"</td><td>"
											+msg[i].v_46+"</td><td>"+msg[i].v_47+"</td><td>"
											+msg[i].v_48+"</td><td>"+msg[i].v_49+"</td><td>"+msg[i].v_50+"</td><td>"
											+msg[i].v_51+"</td><td>"
											+msg[i].v_52+"</td><td>"+msg[i].v_53+"</td><td>"
											+msg[i].v_54+"</td><td>"+msg[i].v_55+"</td><td>"
											+msg[i].v_56+"</td><td>"+msg[i].v_57+"</td><td>"
											+msg[i].v_58+"</td><td>"+msg[i].v_59+"</td><td>"+msg[i].v_60+"</td><td>"
											+msg[i].v_61+"</td></tr>";
										}
									}	
								i=i+j-1;
							}else{
								/* tbodystr=tbodystr+"<tr><td >"+msg[i].XH+"</td><td>"+msg[i].XMMC+"</td><td>"
								+msg[i].XZQHMC+"</td><td>"+msg[i].TSDQ+"</td><td>"
								+msg[i].XDNF+"</td><td>"+msg[i].QDZH+"</td><td>"
								+msg[i].ZDZH+"</td><td>"+msg[i].YHLC+"</td><td>"
								+msg[i].PFZTZ+"</td><td>"+msg[i].JHXDZJ+"</td><td>"
								+msg[i].BNBFZJ+"</td><td>"+msg[i].BFZJ+"</td><td>"+msg[i].WBFZJ+"</td><td>"
								+msg[i].JSZT+"</td><td>"+msg[i].DC+"</td><td>"
								+msg[i].JC+"</td><td>"+msg[i].WGLC+"</td><td>"
								+msg[i].WKGLC+"</td><td>"+msg[i].SJKGSJ+"</td><td>"
								+msg[i].SFQXKG+"</td><td>"+msg[i].KGDL+"</td><td>"
								+msg[i].SJWGSJ+"</td><td>"+msg[i].YJWGSJ+"</td><td>"
								+msg[i].QKSM+"</td><td>"+msg[i].XDWH+"</td><td>"
								+msg[i].XGCSYJ+"</td><td>"+msg[i].CSCYJ+"</td></tr>"; */
								tbodystr=tbodystr+ "<tr><td >"+msg[i].v_0+"</td><td>"
								+msg[i].v_1+"</td><td>"
								+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
								+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
								+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
								+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"+msg[i].v_10+"</td><td>"
								+msg[i].v_11+"</td><td>"
								+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
								+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"
								+msg[i].v_16+"</td><td>"+msg[i].v_17+"</td><td>"
								+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"+msg[i].v_20+"</td><td>"
								+msg[i].v_21+"</td><td>"
								+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
								+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"
								+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"
								+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"+msg[i].v_30+"</td><td>"
								+msg[i].v_31+"</td><td>"
								+msg[i].v_32+"</td><td>"+msg[i].v_33+"</td><td>"
								+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"
								+msg[i].v_36+"</td><td>"+msg[i].v_37+"</td><td>"
								+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td><td>"+msg[i].v_40+"</td><td>"
								+msg[i].v_41+"</td><td>"
								+msg[i].v_42+"</td><td>"+msg[i].v_43+"</td><td>"
								+msg[i].v_44+"</td><td>"+msg[i].v_45+"</td><td>"
								+msg[i].v_46+"</td><td>"+msg[i].v_47+"</td><td>"
								+msg[i].v_48+"</td><td>"+msg[i].v_49+"</td><td>"+msg[i].v_50+"</td><td>"
								+msg[i].v_51+"</td><td>"
								+msg[i].v_52+"</td><td>"+msg[i].v_53+"</td><td>"
								+msg[i].v_54+"</td><td>"+msg[i].v_55+"</td><td>"
								+msg[i].v_56+"</td><td>"+msg[i].v_57+"</td><td>"
								+msg[i].v_58+"</td><td>"+msg[i].v_59+"</td><td>"+msg[i].v_60+"</td><td>"
								+msg[i].v_61+"</td></tr>";
							}
						}
						tbody.append(tbodystr);
					}
				}
			});
		}
		function exportPtgx(){
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
			}
		var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var jhxdnf=$("#jhxdnf").combotree("getValues");
			var jszt=$("#jszt").val();
			var qxkg=$("#qxkg").val();
			var ljbf=$("#ljbf").val();
			var wbf=$("#wbf").val();
			var tsdq=$("#tsdq").combobox("getValue");
			var data="flag=flag&xmbb.jhxdnf="+jhxdnf+"&xmbb.jszt="+jszt+"&xmbb.ljbf="+ljbf+"&xmbb.wbf="+wbf+"&xmbb.qxkg="+qxkg+"&xmbb.tsdq="+tsdq;
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
				window.location.href='/jxzhpt/xmjzbb/getPtgxbb.do?'+data;
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

#bbtable {
	border-collapse:collapse;
}
#bbtable thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
#bbtable tbody tr td {
	text-align:center; 	
	font-size:1em;
/* 	font-weight:bold; */
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
-->
</style>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop" style="30px;">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;项目进展报表>&nbsp;普通干线公路建设项目进展情况表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>建设状态：</span>
        						<select id="jszt" style="width:50px;">
        						<option value="">全部</option>
        						<option>未开工</option>
        						<option>在建</option>
        						<option>竣工</option>
        						</select>
        						<span>资金下达年份：</span>
        						<input type="text" id="jhxdnf" style="width:137px;">
        						<span>特殊地区：</span>
        						<input type="text" id="tsdq"  style="width:73px;">
        						&nbsp;&nbsp;
        						 
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        					<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>全线开工：</span>
        						<select id="qxkg" style="width:50px;">
        							<option value="">全部</option>
        							<option>是</option>
        							<option>否</option>
        						</select>
        						<span>累计拨付资金：</span>
        						<select id="ljbf" style="width:137px;">
        							<option value="">全部</option>
        							<option value=" and (bfzj is null or bfzj=0)">零</option>
        							<option value=" and bfzj!=0">非零</option>
        						</select>
        						<span>未拨付资金：</span>
        						<select id="wbf" style="width:62px;">
        							<option value="">全部</option>
        							<option value="and wbfzj=0">零</option>
        							<option value="and (wbfzj is null or wbfzj!=0)">非零</option>
        						</select></p>
        					<p style="margin: 8px 0px 8px 20px;">	
        					<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()"/>
        						&nbsp;&nbsp;
<%-- 									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportPtgx()" style="vertical-align: -50%;" /> --%>
        					</p>        					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-150)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="3500px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">普通干线公路建设项目进展情况表</caption>
								<thead>
									<tr>
										<td rowspan="2" style="width: 67px">序号</td>
										<td rowspan="2" style="width: 160px">项目编码</td>
										<td rowspan="2" style="width: 160px">项目名称</td>
										<td rowspan="2" style="width: 160px">建设类型</td>
										<td rowspan="2" style="width: 160px">所在地市</td>
										<td rowspan="2" style="width: 160px">县区</td>
										<td rowspan="2" style="width: 150px">特殊区域</td>
										<td rowspan="2" style="width: 160px">计划年度</td>
										<td rowspan="2" style="width: 160px">首次资金下达年度</td>
										<td rowspan="2" style="width: 160px">起点桩号</td>
										<td rowspan="2" style="width: 160px">讫点桩号</td>
										<td rowspan="2" style="width: 140px">计划里程（里程）</td>
										<td rowspan="2" style="width: 140px">施工图起点桩号</td>
										<td rowspan="2" style="width: 140px">施工图讫点桩号</td>
										<td rowspan="2" style="width: 140px">施工图里程</td>
										<td rowspan="2" style="width: 140px">概算总投资(万元)</td>
										<td colspan="8" style="width: 140px">计划下达资金(万元)</td>
										<td colspan="8" style="width: 140px">本年拨付资金（万元）</td>
										<td colspan="8" style="width: 140px">累计拨付资金（万元）</td>
										<td colspan="8" style="width: 140px">未拨付资金（万元）</td>
										<td rowspan="2" style="width: 140px">建设状态</td>
										<td rowspan="2" style="width: 140px"> 垫层（m³ </td>
										<td rowspan="2" style="width: 140px">基层（m³）</td>
										<td rowspan="2" style="width: 140px">完工里程（公里）</td>
										<td rowspan="2" style="width: 140px">未开工里程(公里)</td>
										<td rowspan="2" style="width: 140px">开工日期</td>
										<td rowspan="2" style="width: 140px">全线开工</td>
										<td rowspan="2" style="width: 140px">开工段落</td>
										<td rowspan="2" style="width: 140px">完工日期</td>
										<td rowspan="2" style="width: 140px"> 预计完工时间 </td>
										<td rowspan="2" style="width: 140px"> 情况说明 </td>
										<td rowspan="2" style="width: 140px"> 计划下达文号 </td>
										<td rowspan="2" style="width: 140px"> 相关处室意见</td>
										<td rowspan="2" style="width: 140px"> 财审处意见 </td>
									</tr>
									<tr>
										<td style="width: 140px">1、车购税</td>
										<td style="width: 140px">2、国债</td>
										<td style="width: 140px">3、省債</td>
										<td style="width: 140px">4、债券</td>
										<td style="width: 140px">5、燃油税</td>
										<td style="width: 140px">6、厅贷款</td>
										<td style="width: 140px">7、奖励</td>
										<td style="width: 140px">8、其他</td>
										<td style="width: 140px">1、车购税</td>
										<td style="width: 140px">2、国债</td>
										<td style="width: 140px">3、省債</td>
										<td style="width: 140px">4、债券</td>
										<td style="width: 140px">5、燃油税</td>
										<td style="width: 140px">6、厅贷款</td>
										<td style="width: 140px">7、奖励</td>
										<td style="width: 140px">8、其他</td>
										<td style="width: 140px">1、车购税</td>
										<td style="width: 140px">2、国债</td>
										<td style="width: 140px">3、省債</td>
										<td style="width: 140px">4、债券</td>
										<td style="width: 140px">5、燃油税</td>
										<td style="width: 140px">6、厅贷款</td>
										<td style="width: 140px">7、奖励</td>
										<td style="width: 140px">8、其他</td>
										<td style="width: 140px">1、车购税</td>
										<td style="width: 140px">2、国债</td>
										<td style="width: 140px">3、省債</td>
										<td style="width: 140px">4、债券</td>
										<td style="width: 140px">5、燃油税</td>
										<td style="width: 140px">6、厅贷款</td>
										<td style="width: 140px">7、奖励</td>
										<td style="width: 140px">8、其他</td>
									</tr>
								</thead>
								<tbody id="ptgxlist">
								
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>