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
			
			showAll();
		});
		
		function showAll(){
			
			var tbody = $("#ptgxlist");
					tbody.empty();
			$.ajax({
				url:"/jxzhpt/xmjzbb/getPtgxtz.do",
				data:'flag=""',
				type:"post",
				dataType:"JSON",
				success:function(msg){
					
					var tbodystr="";
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							if(msg[i].v_1=='合并'){
								tbodystr=tbodystr+ "<tr><td colspan='2'>"+msg[i].v_0+"</td><td>"
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
								+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td></tr>";
							}else{
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
								+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td></tr>";
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
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;项目进展报表>&nbsp;普通干线公路建设、养护工程项目资金汇总台账表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;height: 40px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						
        						         					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        					<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()"/>
        					
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
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-120)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="2500px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">普通干线公路建设、养护工程项目资金汇总台账表</caption>
								<thead>
									<tr align="center" >
										<td align="center" width="180px" rowspan="2">计划项目</td>
										<td align="center" width="150px" rowspan="2">计划年度</td>
										<td width="120px">项目数量</td>
										<td width="120px">计划里程</td>
										<td align="center" colspan="8">计划资金</td>
										<td align="center" colspan="8">已拨资金</td>
										<td align="center" colspan="8" >未拨资金</td>
										<td align="center" width="140px" rowspan="2">拨付比例</td>
										<td align="center" width="80px" rowspan="2">备注</td>
										</tr>
										<tr align="center">
										<td width="120px">（个/座）</td>
										<td width="120px">（公里）</td>
										<td width="160px" >1、车购税</td>
										<td width="70px" >2、国债</td>
										<td width="70px" >3、省債</td>
										<td width="70px" >4、债券</td>
										<td width="70px" >5、燃油税</td>
										<td width="70px" >6、厅贷款</td>
										<td width="70px" >7、奖励</td>
										<td width="70px" >8、其他</td>
										<td width="160px"  >1、车购税</td>
										<td width="80px" >2、国债</td>
										<td width="80px">3、省債</td>
										<td width="80px">4、债券</td>
										<td width="70px" >5、燃油税</td>
										<td width="70px" >6、厅贷款</td>
										<td width="70px" >7、奖励</td>
										<td width="70px" >8、其他</td>
										<td width="160px"  >1、车购税</td>
										<td width="80px" >2、国债</td>
										<td width="80px">3、省債</td>
										<td width="80px">4、债券</td>
										<td width="70px" >5、燃油税</td>
										<td width="70px" >6、厅贷款</td>
										<td width="70px" >7、奖励</td>
										<td width="70px" >8、其他</td>
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