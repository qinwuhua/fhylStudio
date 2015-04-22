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
			var gydw1=$("#gydw").combotree("getValues");
			if(gydw1.length==0||gydw1.length==1){
				if($.cookie("unit2")=='_____36')
					gydw1str='36';
				else
				gydw1str=$.cookie("unit2");
			}else{
				gydw1str=gydw1.join(",");
			}
			var xzqh1=$("#xzqh").combotree("getValues");
			if(xzqh1.length==0||xzqh1.length==1){
				xzqh1str=$.cookie("dist2");
			}else{
				xzqh1str=xzqh1.join(",");
			}
			var jhxdnf=$("#jhxdnf").combotree("getValues");
			var tsdq=$("#tsdq").combotree("getText");
			var jszt=$("#jszt").val();
			var ljbf=$("#ljbf").val();
			var wbf=$("#wbf").val();
			var xmmc=$("#xmmc").val();
			var data="xmbb.jhxdnf="+jhxdnf+"&xmbb.jszt="+jszt+"&xmbb.gydw="+gydw1str+"&xmbb.xzqh="+xzqh1str+"&xmbb.ljbf="+ljbf+"&xmbb.wbf="+wbf+"&xmbb.xmmc="+xmmc+"&xmbb.tsdq="+tsdq;
			//alert(data);
			$.ajax({
				url:"/jxzhpt/xmjzbb/getLwbb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					var tbody = $("#lwlist");
					tbody.empty();
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							if(msg[i].HB=='是'){
								tbody.append("<tr><td >"+msg[i].XH+"</td><td colspan='3'>"
										+msg[i].TSDQ+"</td><td>"
										+msg[i].JSXZ+"</td><td>"+msg[i].QDZH+"</td><td>"
										+msg[i].ZDZH+"</td><td>"+msg[i].YHLC+"</td><td>"
										+msg[i].XDNF+"</td><td>"+msg[i].XDZJ+"</td><td>"
										+msg[i].GYS+"</td><td>"+msg[i].BFZJ+"</td><td>"
										+msg[i].WBFZJ+"</td><td>"+msg[i].JSXZ+"</td><td>"
										+msg[i].WGLC+"</td><td>"+msg[i].KGRQ+"</td><td>"
										+msg[i].WGRQ+"</td><td>"+msg[i].YJRQ+"</td><td>"
										+msg[i].QKSM+"</td><td>"+msg[i].JHXDWH+"</td><td>"
										+msg[i].XGCSYJ+"</td><td>"+msg[i].CSCYJ+"</td></tr>"
										);
							}else{
									tbody.append("<tr><td >"+msg[i].XH+"</td><td>"+msg[i].XZQHMC+"</td><td>"
											+msg[i].TSDQ+"</td><td>"+msg[i].XMMC+"</td><td>"
											+msg[i].JSXZ+"</td><td>"+msg[i].QDZH+"</td><td>"
											+msg[i].ZDZH+"</td><td>"+msg[i].YHLC+"</td><td>"
											+msg[i].XDNF+"</td><td>"+msg[i].XDZJ+"</td><td>"
											+msg[i].GYS+"</td><td>"+msg[i].BFZJ+"</td><td>"
											+msg[i].WBFZJ+"</td><td>"+msg[i].JSXZ+"</td><td>"
											+msg[i].WGLC+"</td><td>"+msg[i].KGRQ+"</td><td>"
											+msg[i].WGRQ+"</td><td>"+msg[i].YJRQ+"</td><td>"
											+msg[i].QKSM+"</td><td>"+msg[i].JHXDWH+"</td><td>"
											+msg[i].XGCSYJ+"</td><td>"+msg[i].CSCYJ+"</td></tr>"
									);
							}
						}
					}
				}
			});
		}
		function exportLw(){
			var gydw=$("#gydw").combobox("getValue");
			var xzqh=$("#xzqh").combobox("getValue");
			var jhxdnf=$("#jhxdnf").combotree("getValues");
			var tsdq=$("#tsdq").combotree("getText");
			var jszt=$("#jszt").val();
			var ljbf=$("#ljbf").val();
			var wbf=$("#wbf").val();
			var xmmc=$("#xmmc").val();
			var data="xmbb.jhxdnf="+jhxdnf+"&xmbb.jszt="+jszt+"&xmbb.gydw="+gydw+"&xmbb.xzqh="+xzqh+"&xmbb.ljbf="+ljbf+"&xmbb.wbf="+wbf+"&xmbb.xmmc="+xmmc+"&xmbb.tsdq="+tsdq;
			window.location.href="/jxzhpt/xmjzbb/exportLw.do?"+data;
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
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop" style="height: 30px">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;项目进展报表>&nbsp;路网结构改造工程项目进展情况表</div>
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
        						<span>特殊地区：</span>
        						<input type="text" id="tsdq"  style="width:60px;">
        						<span>资金下达年份：</span>
        						<input type="text" id="jhxdnf" >
        						<span>项目名称：</span>
        						<input id="xmmc" type="text"  style="width:100px;">
        							&nbsp;&nbsp;
									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()"/>
<%-- 									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" /> --%>
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        					<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        					<span>建设状态：</span>
        						<select id="jszt" style="width:60px;">
        						<option value="">全部</option>
        						<option>未开工</option>
        						<option>在建</option>
        						<option>竣工</option>
        						</select> 						
        						<span>累计拨付资金：</span>
        						<select id="ljbf" style="width:132px;">
        							<option value="">全部</option>
        							<option value="=0">零</option>
        							<option value="!=0">非零</option>
        						</select>
        						<span>未拨付资金：</span>
        						<select id="wbf" style="width:92px;">
        							<option value="">全部</option>
        							<option value="=0">零</option>
        							<option value="!=0">非零</option>
        						</select>
								&nbsp;&nbsp;
        						
<%-- 									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" /> --%>
									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportLw()" style="vertical-align: -50%;" />
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
							<table width="3000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">路网结构改造工程项目资金拔付情况表</caption>
								<thead>
									<tr>
										<td rowspan="2">序号</td>
										<td rowspan="2">所在设区市</td>
										<td rowspan="2">特殊区域</td>
										<td rowspan="2">项目名称</td>
										<td rowspan="2">建设性质</td>
										<td colspan="3">项目段落</td>
										<td rowspan="2">计划下达年度</td>
										<td rowspan="2">计划下达资金（万元）</td>
										<td rowspan="2">概预算（万元）</td>
										<td rowspan="2">累计拨付资金（万元）</td>
										<td rowspan="2">未拨付资金（万元）</td>
										<td rowspan="2">建设状态</td>
										<td rowspan="2">完工桥长或隐患里程</td>
										<td rowspan="2">开工日期</td>
										<td rowspan="2">完工日期</td>
										<td rowspan="2">预计完工时间</td>
										<td rowspan="2"> 情况说明 </td>
										<td rowspan="2"> 计划下达文号 </td>
										<td rowspan="2"> 相关处室意见</td>
										<td rowspan="2"> 财审处意见 </td>
									</tr>
									<tr>
										<td>起点桩号<br>或中心桩号</td>
										<td> 迄点桩号 </td>
										<td>桥长或隐<br>患里程（延米）</td>
									</tr>
								</thead>
								<tbody id="lwlist">
								
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