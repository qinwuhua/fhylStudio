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
			var data="xmbb.jhxdnf="+jhxdnf+"&xmbb.jszt="+jszt+"&xmbb.gydw="+gydwstr+"&xmbb.xzqh="+xzqhstr+"&xmbb.ljbf="+ljbf+"&xmbb.wbf="+wbf+"&xmbb.qxkg"+qxkg+"&xmbb.tsdq="+tsdq;
			//alert(data);
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
							if(msg[i].SL>1){
								var j=msg[i].SL;
								var ybf=0;
								var wbf=0;
								var sum=0;
								for(var k=0;k<j;k++)
									{
										if(msg[i].BFZJ-sum>0 && msg[i].BFZJ-sum>=msg[i+k].JHXDZJ){
											ybf=msg[i+k].JHXDZJ;
											wbf=0;
											sum=sum+msg[i+k].JHXDZJ;
										}else if(msg[i].BFZJ-sum>0 && msg[i].BFZJ-sum<msg[i+k].JHXDZJ){
											ybf=msg[i].BFZJ-sum;
											wbf=msg[i+k].JHXDZJ-(msg[i].BFZJ-sum);
											sum=sum+msg[i+k].JHXDZJ;
										}else{
											ybf=0;
											wbf=msg[i+k].JHXDZJ;
											sum=sum+msg[i+k].JHXDZJ;
										}
									
									   if(k==0){
										   tbodystr=tbodystr+"<tr><td  rowspan="+j+">"+msg[i].XH+"</td><td  rowspan="+j+">"+msg[i].XMMC+"</td><td  rowspan="+j+">"
											+msg[i].XZQHMC+"</td><td  rowspan="+j+">"+msg[i].TSDQ+"</td><td>"
											+msg[i].XDNF+"</td><td  rowspan="+j+">"+msg[i].QDZH+"</td><td  rowspan="+j+">"
											+msg[i].ZDZH+"</td><td  rowspan="+j+">"+msg[i].YHLC+"</td><td  rowspan="+j+">"
											+msg[i].PFZTZ+"</td><td>"+msg[i].JHXDZJ+"</td><td>"
											+ybf+"</td><td>"+wbf+"</td><td  rowspan="+j+">"
											+msg[i].JSZT+"</td><td  rowspan="+j+">"+msg[i].DC+"</td><td  rowspan="+j+">"
											+msg[i].JC+"</td><td  rowspan="+j+">"+msg[i].WGLC+"</td><td  rowspan="+j+">"
											+msg[i].WKGLC+"</td><td  rowspan="+j+">"+msg[i].SJKGSJ+"</td><td  rowspan="+j+">"
											+msg[i].SFQXKG+"</td><td  rowspan="+j+">"+msg[i].KGDL+"</td><td  rowspan="+j+">"
											+msg[i].SJWGSJ+"</td><td  rowspan="+j+">"+msg[i].YJWGSJ+"</td><td  rowspan="+j+">"
											+msg[i].QKSM+"</td><td>"+msg[i].XDWH+"</td><td>"
											+msg[i].XGCSYJ+"</td><td>"+msg[i].CSCYJ+"</td></tr>";
										}else{
											tbodystr=tbodystr+"<tr><td  >"+msg[i+k].XDNF+"</td><td  >"
											+msg[i+k].JHXDZJ+"</td><td  >"+ybf+"</td><td  >"
											+wbf+"</td><td  >"+msg[i+k].XDWH+"</td><td  >"
											+msg[i+k].XGCSYJ+"</td><td  >"+msg[i+k].CSCYJ+"</td></tr>";
										}
									}	
								i=i+j-1;
							}else{
								tbodystr=tbodystr+"<tr><td >"+msg[i].XH+"</td><td>"+msg[i].XMMC+"</td><td>"
								+msg[i].XZQHMC+"</td><td>"+msg[i].TSDQ+"</td><td>"
								+msg[i].XDNF+"</td><td>"+msg[i].QDZH+"</td><td>"
								+msg[i].ZDZH+"</td><td>"+msg[i].YHLC+"</td><td>"
								+msg[i].PFZTZ+"</td><td>"+msg[i].JHXDZJ+"</td><td>"
								+msg[i].BFZJ+"</td><td>"+msg[i].WBFZJ+"</td><td>"
								+msg[i].JSZT+"</td><td>"+msg[i].DC+"</td><td>"
								+msg[i].JC+"</td><td>"+msg[i].WGLC+"</td><td>"
								+msg[i].WKGLC+"</td><td>"+msg[i].SJKGSJ+"</td><td>"
								+msg[i].SFQXKG+"</td><td>"+msg[i].KGDL+"</td><td>"
								+msg[i].SJWGSJ+"</td><td>"+msg[i].YJWGSJ+"</td><td>"
								+msg[i].QKSM+"</td><td>"+msg[i].XDWH+"</td><td>"
								+msg[i].XGCSYJ+"</td><td>"+msg[i].CSCYJ+"</td></tr>";
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
			var data="flag=flag&xmbb.jhxdnf="+jhxdnf+"&xmbb.jszt="+jszt+"&xmbb.ljbf="+ljbf+"&xmbb.wbf="+wbf+"&xmbb.qxkg"+qxkg+"&xmbb.tsdq="+tsdq;
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

table {
	border-collapse:collapse;
}
table thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
table tbody tr td {
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
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;height: 80px;">
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
        						<input type="text" id="jhxdnf" >
        						<span>特殊地区：</span>
        						<input type="text" id="tsdq"  style="width:73px;">
        						&nbsp;&nbsp;
        						 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()"/>
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
        							<option value="=0">零</option>
        							<option value="!=0">非零</option>
        						</select>
        						<span>未拨付资金：</span>
        						<select id="wbf" style="width:62px;">
        							<option value="">全部</option>
        							<option value="=0">零</option>
        							<option value="!=0">非零</option>
        						</select>
        						&nbsp;&nbsp;
									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportPtgx()" style="vertical-align: -50%;" />
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
							<table width="3500px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">普通干线公路建设项目进展情况表</caption>
								<thead>
									<tr>
										<td style="width: 67px">序号</td>
										<td style="width: 160px">项目名称</td>
										<td style="width: 160px">所在地市</td>
										<td style="width: 150px">特殊区域</td>
										<td style="width: 160px">计划年度</td>
										<td style="width: 160px">起点桩号</td>
										<td style="width: 160px">讫点桩号</td>
										<td style="width: 140px">计划里程（里程）</td>
										<td style="width: 140px">概算总投资(万元)</td>
										<td style="width: 140px">计划下达资金(万元)</td>
										<td style="width: 140px">累计拨付资金（万元）</td>
										<td style="width: 140px">未拨付资金（万元）</td>
										<td style="width: 140px">建设状态</td>
										<td style="width: 140px"> 垫层（m³ </td>
										<td style="width: 140px">基层（m³）</td>
										<td style="width: 140px">完工里程（公里）</td>
										<td style="width: 140px">未开工里程(公里)</td>
										<td style="width: 140px">开工日期</td>
										<td style="width: 140px">全线开工</td>
										<td style="width: 140px">开工段落</td>
										<td style="width: 140px">完工日期</td>
										<td style="width: 140px"> 预计完工时间 </td>
										<td style="width: 140px"> 情况说明 </td>
										<td style="width: 140px"> 计划下达文号 </td>
										<td style="width: 140px"> 相关处室意见</td>
										<td style="width: 140px"> 财审处意见 </td>
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