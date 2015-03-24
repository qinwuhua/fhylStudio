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
			loadUnit("gydw",$.cookie("unit"));
			loadDist("xzqh",$.cookie("dist"));
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=2010;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
			}
			$("#yf"+m).attr("selected","selected");
			showAll();
		});
		function showAll(){
			var nf=$("#ddlYear").val();
			var yf=$("#ddlMonth").val();
			var gydw=$("#gydw").combobox("getValue");
			var xzqh=$("#xzqh").combobox("getValue");
			var xzdj=$("#xzdj").val();
			var lxmc=$("#lxmc").val();
			var data="nf="+nf+"&yf="+yf+"&gydw="+gydw+"&xzqh="+xzqh+"&xzdj="+xzdj+"&lxmc="+lxmc;
			//alert(data);
			$.ajax({
				url:"/jxzhpt/gcybb/getWqgzybb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					var tbody = $("#wqgzlist");
					tbody.empty();
					$("#nian").text($("#ddlYear").val());
					$("#yue").text($("#ddlMonth").val());
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							if(msg[i].v_1==''){
								tbody.append("<tr><td colspan='2'>"+msg[i].v_0+"</td><td>"
										+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
										+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"
										+msg[i].v_16+"</td><td>"+msg[i].v_17+"</td><td>"
										+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"
										+msg[i].v_20+"</td><td>"+msg[i].v_21+"</td><td>"
										+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
										+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"
										+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"
										+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"
										+msg[i].v_30+"</td><td>"+msg[i].v_31+"</td><td>"
										+msg[i].v_32+"</td><td>"+msg[i].v_33+"</td><td>"
										+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"
										+msg[i].v_36+"</td><td>"+msg[i].v_37+"</td></tr>"
								);
							}else{
								tbody.append("<tr><td>"+msg[i].v_0+"</td><td>"+msg[i].v_1+"</td><td>"
										+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
										+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"
										+msg[i].v_16+"</td><td>"+msg[i].v_17+"</td><td>"
										+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"
										+msg[i].v_20+"</td><td>"+msg[i].v_21+"</td><td>"
										+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
										+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"
										+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"
										+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"
										+msg[i].v_30+"</td><td>"+msg[i].v_31+"</td><td>"
										+msg[i].v_32+"</td><td>"+msg[i].v_33+"</td><td>"
										+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"
										+msg[i].v_36+"</td><td>"+msg[i].v_37+"</td></tr>"
								);
							}
						}
					}
				}
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
	font-weight:bold;
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
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;危桥改造统计月报表</div>
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
        						<span>年&nbsp;&nbsp;&nbsp;&nbsp;份：</span>
 						<select name="ddlYear" id="ddlYear" style="width: 80px;">
						</select>
 						<span>月&nbsp;&nbsp;&nbsp;&nbsp;份：</span>
 						<select name="ddlMonth" id="ddlMonth" style="width: 43px;">
							<option id="yf1" value="1">01</option>
							<option id="yf2" value="2">02</option>
							<option id="yf3" value="3">03</option>
							<option id="yf4" value="4">04</option>
							<option id="yf5" value="5">05</option>
							<option id="yf6" value="6">06</option>
							<option id="yf7" value="7">07</option>
							<option id="yf8" value="8">08</option>
							<option id="yf9" value="9">09</option>
							<option id="yf10" value="10">10</option>
							<option id="yf11" value="11">11</option>
							<option id="yf12" value="12">12</option> 
						</select>
        						
<!--         							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<%-- 									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" /> --%>
<%-- 									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'" --%>
<%--                                         onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" /> --%>
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>行政等级：</span>
        						<select id="xzdj" style="width:80px;">
        							<option value="">全部</option>
        							<option value="G">国道</option>
        							<option value="S">省道</option>
        							<option value="X">县道</option>
        							<option value="Y">乡道</option>
        							<option value="C">村道</option>
        							<option value="Z">专道</option>
        						</select>
        						<span>路线名称：</span>
        						<input id="lxmc" type="text"  style="width: 100px">
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()" />
									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" />
        					</p>         					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div style="width:100%;height:400px;" >
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table width="3000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">江西省<span id="nian" style="font-size: large;"></span>年公路路网结构改造工程统计月报表（一）   危桥工程（<span id="yue" style="font-size: large;"></span>月） </caption>
								<thead>
									<tr>
										<td rowspan="3">桥梁名称</td>
										<td rowspan="3">桥梁代码</td>
										<td rowspan="3">桥梁中心桩号</td>
										<td colspan="3">所属路线情况</td>
										<td colspan="8">老桥梁基本状况</td>
										<td colspan="2" rowspan="2">评定等级</td>
										<td colspan="3" rowspan="2">本年计划投资(万元)</td>
										<td colspan="3" rowspan="2">本月完成投资（万元）</td>
										<td colspan="3" rowspan="2">自元月至本月完成投资（万元）</td>
										<td colspan="3" rowspan="2">开工至本月完成投资（万元）</td>
										<td colspan="3">本年自元月至本月底形象进度完成情况</td>
										<td colspan="3">开工至本月底形象进度完成情况 </td> 
										<td rowspan="3">建设性质</td>
										<td colspan="2">建设年限</td>
										<td rowspan="3">主要建设内容</td>
									</tr>	
									<tr>
										<td rowspan="2">路线编码</td>
										<td rowspan="2">路线名称</td>
										<td rowspan="2">技术等级</td>
										<td rowspan="2">桥梁全长(米)</td>
										<td rowspan="2">跨径总长(米)</td>
										<td rowspan="2">单跨最大跨径 (米)</td>
										<td rowspan="2">桥梁全宽</td>
										<td rowspan="2">主桥上部构造结构形式</td>
										<td colspan="2">按跨径分类</td>
										<td rowspan="2">修建/改建年度</td>
										<td>危桥加固</td>
										<td>危桥改建</td>
										<td>危桥重建</td>
										<td>危桥加固</td>
										<td>危桥改建</td>
										<td>危桥重建</td>
										<td rowspan="2">计划开工年</td>
										<td rowspan="2">计划完工年</td>
									</tr>
									<tr>
										<td>大桥</td>
										<td>中桥</td>
										<td>四类</td>
										<td>五类</td>
										<td>合计</td>
										<td>部投资</td>
										<td>省投资</td>
										<td>合计</td>
										<td>部投资</td>
										<td>省投资</td>
										<td>合计</td>
										<td>部投资</td>
										<td>省投资</td>
										<td>合计</td>
										<td>部投资</td>
										<td>省投资</td>
										<td>百分比（%）</td>
										<td>百分比（%）</td>
										<td>百分比（%）</td>
										<td>百分比（%）</td>
										<td>百分比（%）</td>
										<td>百分比（%）</td>
									</tr>
								</thead>
								<tbody id="wqgzlist">
								
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