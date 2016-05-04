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
			var ljbf=$("#ljbf").val();
			var wbf=$("#wbf").val();
			var tsdq=$("#tsdq").combobox("getText");
			var data="xmbb.jhxdnf="+jhxdnf+"&xmbb.jszt="+jszt+"&xmbb.gydw="+gydwstr+"&xmbb.xzqh="+xzqhstr+"&xmbb.ljbf="+ljbf+"&xmbb.wbf="+wbf+"&xmbb.tsdq="+tsdq;
			//alert(data);
			var tbody = $("#yhlist");
					tbody.empty();
			$.ajax({
				url:"/jxzhpt/xmjzbb/getYhbb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							if(msg[i].hb=='是'){
								tbody.append("<tr><td colspan='4'>"+msg[i].v_0+"</td><td>"
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
										+msg[i].v_54+"</td></tr>"
										);
							}else{
								if(msg[i].hb=='是1'){
										tbody.append("<tr><td>"+msg[i].v_0+"</td><td  colspan='3'>"
												+msg[i].v_1+"</td><td>"
												
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
												+msg[i].v_54+"</td></tr>"
												);
								
								}else{
									tbody.append("<tr><td>"+msg[i].v_0+"</td><td>"
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
											+msg[i].v_54+"</td></tr>"
											);
								}
							}
						}
					}
				}
			});
		}
		function exportYh(){
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
			var ljbf=$("#ljbf").val();
			var wbf=$("#wbf").val();
			var tsdq=$("#tsdq").combobox("getValue");
			var data="flag=flag&xmbb.jhxdnf="+jhxdnf+"&xmbb.jszt="+jszt+"&xmbb.ljbf="+ljbf+"&xmbb.wbf="+wbf+"&xmbb.tsdq="+tsdq;
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
				window.location.href='/jxzhpt/xmjzbb/getYhbb.do?'+data;
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
			<div id="righttop" style="height: 30px;">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;项目进展报表>&nbsp;养护大中修工程项目进展情况表</div>
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
        						<span>资金下达年份：</span>
        						<input type="text" id="jhxdnf" style="width:137px;">
        						
        						<span>建设状态：</span>
        						<select id="jszt" style="width:50px;">
        						<option value="">全部</option>
        						<option>未开工</option>
        						<option>在建</option>
        						<option>竣工</option>
        						</select>
        						<span>特殊地区：</span>
        						<input type="text" id="tsdq"  style="width:60px;">
        						&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()"/>
<%-- 									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" /> --%>
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        					<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>累计拨付资金：</span>
        						<select id="ljbf" style="width:137px;">
        							<option value="">全部</option>
        							<option value=" and (bfzj is null or bfzj=0)">零</option>
        							<option value=" and bfzj!=0">非零</option>
        						</select>
        						<span>未拨付资金：</span>
        						<select id="wbf" style="width:164px;">
        							<option value="">全部</option>
        							<option value="and wbfzj=0">零</option>
        							<option value="and (wbfzj is null or wbfzj!=0)">非零</option>
        						</select>
        							&nbsp;&nbsp;&nbsp;&nbsp;
<%-- 									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" /> --%>
<%-- 									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportYh()" style="vertical-align: -50%;" /> --%>
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
							<table id='bbtable' width="4000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">省统筹养护大中修工程项目进展情况表 </caption>
								<thead>
									<tr>
										<td rowspan="2" style="width: 60px">序号</td>
										<td rowspan="2" style="width: 140px">项目编码</td>
										<td rowspan="2" style="width: 140px">所在地市</td>
										<td rowspan="2" style="width: 140px">县区</td>
										<td rowspan="2" style="width: 140px">特殊区域</td>
										<td rowspan="2" style="width: 140px">项目名称</td>
										<td rowspan="2" style="width: 140px">工程分类</td>
										<td rowspan="2" style="width: 140px">计划下达年度</td>
										<td colspan="2" >项目段落</td>
										<td rowspan="2" style="width: 140px">计划里程（公里）</td>
										<td rowspan="2" style="width: 140px">概预算（万元）</td>
										<td colspan="8" style="width: 140px">计划下达资金（万元）</td>
										<td colspan="8" style="width: 140px">本年拨付资金（万元）</td>
										<td colspan="8" style="width: 140px">累计拨付资金（万元）</td>
										<td colspan="8" style="width: 140px">未拨付资金（万元）</td>
										<td rowspan="2" style="width: 140px">建设状态</td>
										<td rowspan="2" style="width: 140px"> 垫层（m³ </td>
										<td rowspan="2" style="width: 140px">基层（m³）</td>
										<td rowspan="2" style="width: 140px">开工日期</td>
										<td rowspan="2" style="width: 140px">完工日期</td>
										<td rowspan="2" style="width: 140px">开工段落</td>
										<td rowspan="2" style="width: 140px">完工里程（公里）</td>
										<td rowspan="2" style="width: 140px"> 情况说明 </td>
										<td rowspan="2" style="width: 140px"> 计划下达文号 </td>
										<td rowspan="2" style="width: 140px"> 相关处室意见</td>
										<td rowspan="2" style="width: 140px"> 财审处意见 </td>
									</tr>
									<tr>
										<td style="width: 100px">起点桩号</td>
										<td style="width: 100px"> 迄点桩号 </td>
										<td style="width: 140px">1、车购税</td>
										<td style="width: 140px">2、国债</td>
										<td style="width: 140px">3、省債</td>
										<td style="width: 140px">4、债券</td>
										<td style="width: 140px">5、燃油税</td>
										<td style="width: 140px">6、贷款</td>
										<td style="width: 140px">7、奖励</td>
										<td style="width: 140px">8、其他</td>
										<td style="width: 140px">1、车购税</td>
										<td style="width: 140px">2、国债</td>
										<td style="width: 140px">3、省債</td>
										<td style="width: 140px">4、债券</td>
										<td style="width: 140px">5、燃油税</td>
										<td style="width: 140px">6、贷款</td>
										<td style="width: 140px">7、奖励</td>
										<td style="width: 140px">8、其他</td>
										<td style="width: 140px">1、车购税</td>
										<td style="width: 140px">2、国债</td>
										<td style="width: 140px">3、省債</td>
										<td style="width: 140px">4、债券</td>
										<td style="width: 140px">5、燃油税</td>
										<td style="width: 140px">6、贷款</td>
										<td style="width: 140px">7、奖励</td>
										<td style="width: 140px">8、其他</td>
										<td style="width: 140px">1、车购税</td>
										<td style="width: 140px">2、国债</td>
										<td style="width: 140px">3、省債</td>
										<td style="width: 140px">4、债券</td>
										<td style="width: 140px">5、燃油税</td>
										<td style="width: 140px">6、贷款</td>
										<td style="width: 140px">7、奖励</td>
										<td style="width: 140px">8、其他</td>
									</tr>
								</thead>
								<tbody id="yhlist">
								
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