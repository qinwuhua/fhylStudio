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
		TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
	</style>
	<script type="text/javascript">
		$(function(){
			setjhxdnf();
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2("xzdj","行政等级");
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=2010;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
				$("#ddlYear1").append("<option value="+x+">"+x+"</option>");
			}
			$("#yf"+m).attr("selected","selected");
			
		});
		function setjhxdnf(){
			$("#ddlYear1").combotree({    
				checkbox: true,
				async: false,
			    url: '/jxzhpt/xmjzbb/setjhxdnf1.do',    
			    required: false,
			    multiple:true,
			    onLoadSuccess:function(node, data){
			    	showAll();
			    }
			});
			
		}
		function showAll(){
			var nf=$("#ddlYear").val();
			var yf=$("#ddlMonth").val();
			var xmnf=$("#ddlYear1").combotree("getValues");
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
			var xzdj=$("#xzdj").combobox("getValue");
			var lxmc=$("#lxmc").val();
			var data="nf="+nf+"&yf="+yf+"&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+xzdj+"&lxmc="+lxmc+"&xmmc="+$("#xmmc").val()+"&xmnf="+xmnf;
			//alert(data);
			var tbody = $("#wqgzlist");
			tbody.empty();
			$.ajax({
				url:"/jxzhpt/gcybb/getWqgzybb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					
					$("#nian").text($("#ddlYear").val());
					$("#yue").text($("#ddlMonth").val());
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							if(msg[i].QLDM==' '){
								tbody.append("<tr><td colspan='2'>"+msg[i].QLMC+"</td><td>"
										+msg[i].QLZXZH+"</td><td>"+msg[i].LXBM+"</td><td>"
										+msg[i].LXMC+"</td><td>"+msg[i].JSDJ+"</td><td>"
										+msg[i].QLQC+"</td><td>"+msg[i].KJZC+"</td><td>"
										+msg[i].DKZDKJ+"</td><td>"+msg[i].QLQK+"</td><td>"
										+msg[i].SBJGXS+"</td><td>"+msg[i].DQ+"</td><td>"
										+msg[i].ZQ+"</td><td>"+msg[i].XJGJND+"</td><td>"
										+msg[i].SL+"</td><td>"+msg[i].WL+"</td><td>"
										+msg[i].BNHJ+"</td><td>"+msg[i].BNBTZ+"</td><td>"
										+msg[i].BNSTZ+"</td><td>"+msg[i].BYHJ+"</td><td>"
										+msg[i].BYBTZ+"</td><td>"+msg[i].BYSTZ+"</td><td>"
										+msg[i].YYHJ+"</td><td>"+msg[i].YYBTZ+"</td><td>"
										+msg[i].YYSTZ+"</td><td>"+msg[i].KGHJ+"</td><td>"
										+msg[i].KGBTZ+"</td><td>"+msg[i].KGSTZ+"</td><td>"
										+msg[i].YYJGQK+"</td><td>"+msg[i].YYGJQK+"</td><td>"
										+msg[i].YYCJQK+"</td><td>"+msg[i].ZJGQK+"</td><td>"
										+msg[i].ZGJQK+"</td><td>"+msg[i].ZCJQK+"</td><td>"
										+msg[i].JSXZ+"</td><td>"+msg[i].JHKGN+"</td><td>"
										+msg[i].JHWGN+"</td><td>"+msg[i].JSNR+"</td></tr>"
								);
							}else{
								tbody.append("<tr><td>"+msg[i].QLMC+"</td><td>"+msg[i].QLDM+"</td><td>"
										+msg[i].QLZXZH+"</td><td>"+msg[i].LXBM+"</td><td>"
										+msg[i].LXMC+"</td><td>"+msg[i].JSDJ+"</td><td>"
										+msg[i].QLQC+"</td><td>"+msg[i].KJZC+"</td><td>"
										+msg[i].DKZDKJ+"</td><td>"+msg[i].QLQK+"</td><td>"
										+msg[i].SBJGXS+"</td><td>"+msg[i].DQ+"</td><td>"
										+msg[i].ZQ+"</td><td>"+msg[i].XJGJND+"</td><td>"
										+msg[i].SL+"</td><td>"+msg[i].WL+"</td><td>"
										+msg[i].BNHJ+"</td><td>"+msg[i].BNBTZ+"</td><td>"
										+msg[i].BNSTZ+"</td><td>"+msg[i].BYHJ+"</td><td>"
										+msg[i].BYBTZ+"</td><td>"+msg[i].BYSTZ+"</td><td>"
										+msg[i].YYHJ+"</td><td>"+msg[i].YYBTZ+"</td><td>"
										+msg[i].YYSTZ+"</td><td>"+msg[i].KGHJ+"</td><td>"
										+msg[i].KGBTZ+"</td><td>"+msg[i].KGSTZ+"</td><td>"
										+msg[i].YYJGQK+"</td><td>"+msg[i].YYGJQK+"</td><td>"
										+msg[i].YYCJQK+"</td><td>"+msg[i].ZJGQK+"</td><td>"
										+msg[i].ZGJQK+"</td><td>"+msg[i].ZCJQK+"</td><td>"
										+msg[i].JSXZ+"</td><td>"+msg[i].JHKGN+"</td><td>"
										+msg[i].JHWGN+"</td><td>"+msg[i].JSNR+"</td></tr>"
								);
							}
						}
					}
				}
			});
		}
	function exportWqgzyb(){
		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val();
		var xmnf=$("#ddlYear1").combotree("getValues");
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
		var xzdj=$("#xzdj").combobox("getValue");
		var lxmc=$("#lxmc").val();
		var data="flag=flag&nf="+nf+"&yf="+yf+"&xzdj="+xzdj+"&lxmc="+lxmc+"&xmmc="+$("#xmmc").val()+"&xmnf="+xmnf;
		
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/gcybb/getWqgzybb.do?'+data;
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
	<div style="text-align: left; font-size: 12px; margin: 0px;" >
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;height:100%;" cellspacing="0" cellpadding="0" >
			<tr>
			<div id="righttop"  style="height: 30px">
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
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
        						<td>管养单位：</td>
        						<td><select id="gydw" style="width:150px;"></select></td>
        						<td>月报年份：</td>
 						<td><select name="ddlYear" id="ddlYear" style="width: 80px;">
						</select></td>
 						<td>月报月份：</td>
 						<td><select name="ddlMonth" id="ddlMonth" style="width: 50px;">
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
						</select></td>
        				<td>项目名称：</td>
        				<td><input id="xmmc" type="text"  style="width: 100px">	</td>	
        				
        					</tr>
        					<tr height="32">
        						<td>行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
        						<td>项目年份：</td>
        						<td><select  id="ddlYear1" style="width: 80px;"></select></td>
        						<td>原行政等级：</td>
        						<td><input type="text" id="xzdj" style="width:50px;"></td>
<!--         						<select id="xzdj" style="width:50px;"> -->
<!--         							<option value="">全部</option> -->
<!--         							<option value="G">国道</option> -->
<!--         							<option value="S">省道</option> -->
<!--         							<option value="X">县道</option> -->
<!--         							<option value="Y">乡道</option> -->
<!--         							<option value="C">村道</option> -->
<!--         							<option value="Z">专道</option> -->
<!--         						</select> -->
        						<td>路线名称：</td>
        						<td><input id="lxmc" type="text"  style="width: 100px"></td>
        						</tr>
        						<tr height="32">
        						<td colspan="10">
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()" />
									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align: -50%;" />
        				</td>	</tr></table>         					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-170)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="3800px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">江西省<span id="nian" style="font-size: x-large;"></span>年公路路网结构改造工程统计月报表（一）   危桥工程（<span id="yue" style="font-size: large;"></span>月） </caption>
								<thead>
									<tr>
										<td rowspan="3" style="width: 125px">桥梁名称</td>
										<td rowspan="3" style="width: 125px">桥梁代码</td>
										<td rowspan="3" style="width: 125px">桥梁中心桩号</td>
										<td colspan="3" >所属路线情况</td>
										<td colspan="8">老桥梁基本状况</td>
										<td colspan="2" rowspan="2">评定等级</td>
										<td colspan="3" rowspan="2">本年计划投资(万元)</td>
										<td colspan="3" rowspan="2">本月完成投资（万元）</td>
										<td colspan="3" rowspan="2">自元月至本月完成投资（万元）</td>
										<td colspan="3" rowspan="2">开工至本月完成投资（万元）</td>
										<td colspan="3">本年自元月至本月底形象进度完成情况</td>
										<td colspan="3">开工至本月底形象进度完成情况 </td> 
										<td rowspan="3" style="width: 125px">建设性质</td>
										<td colspan="2">建设年限</td>
										<td rowspan="3" style="width: 125px">主要建设内容</td>
									</tr>	
									<tr>
										<td rowspan="2" style="width: 125px">路线编码</td>
										<td rowspan="2" style="width: 125px">路线名称</td>
										<td rowspan="2" style="width: 125px">技术等级</td>
										<td rowspan="2" style="width: 125px">桥梁全长(米)</td>
										<td rowspan="2" style="width: 125px">跨径总长(米)</td>
										<td rowspan="2" style="width: 125px">单孔最大跨径 (米)</td>
										<td rowspan="2" style="width: 125px">桥梁全宽</td>
										<td rowspan="2" style="width: 125px">主桥上部构造结构形式</td>
										<td colspan="2">按跨径分类</td>
										<td rowspan="2" style="width: 125px">修建/改建年度</td>
										<td>危桥加固</td>
										<td>危桥改建</td>
										<td>危桥重建</td>
										<td>危桥加固</td>
										<td>危桥改建</td>
										<td>危桥重建</td>
										<td rowspan="2" style="width: 125px">计划开工年</td>
										<td rowspan="2" style="width: 125px">计划完工年</td>
									</tr>
									<tr>
										<td style="width: 80px">大桥</td>
										<td style="width: 80px">中桥</td>
										<td style="width: 80px">四类</td>
										<td style="width: 80px">五类</td>
										<td style="width: 80px">合计</td>
										<td style="width: 80px">部投资</td>
										<td style="width: 80px">省投资</td>
										<td style="width: 80px">合计</td>
										<td style="width: 80px">部投资</td>
										<td style="width: 80px">省投资</td>
										<td style="width: 80px">合计</td>
										<td style="width: 80px">部投资</td>
										<td style="width: 80px">省投资</td>
										<td style="width: 80px">合计</td>
										<td style="width: 80px">部投资</td>
										<td style="width: 80px">省投资</td>
										<td style="width: 125px">百分比（%）</td>
										<td style="width: 125px">百分比（%）</td>
										<td style="width: 125px">百分比（%）</td>
										<td style="width: 125px">百分比（%）</td>
										<td style="width: 125px">百分比（%）</td>
										<td style="width: 125px">百分比（%）</td>
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