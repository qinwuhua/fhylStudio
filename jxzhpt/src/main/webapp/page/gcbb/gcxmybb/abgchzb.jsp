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
			loadUnit("gydw",$.cookie("unit"));
			loadDist("xzqh",$.cookie("dist"));
//			loadBmbm2("xmlx","项目类型2");
//			$("#xmlx").combobox("setValue",'升级改造');
			var myDate = new Date();
			var y = myDate.getFullYear();
			var arr = new Array(); 
			var i=0;
			arr[i]=y;
			$("#jhxdnf").combotree("setValues",arr);
			showAll();
		});
		function setjhxdnf(){
			$("#jhxdnf").combotree({    
				checkbox: true,
			    url: '/jxzhpt/xmjzbb/setjhxdnf1.do',    
			    required: false,
			    multiple:true
			});
			
		}
		function showAll(){
			var xmnf=$("#jhxdnf").combotree("getValues");
			//var xmlx=$("#xmlx").combobox("getValue");
			if(xmnf==''){
				alert("请选择年份");
				return;
			}
			var biaotou = $("#biaotou");
			var str1='';
			var str2='';
			var str3='';
			var min=xmnf[xmnf.length-1];
			var max=xmnf[0];
			var len=(xmnf.length+1)*700+"px";
			$("#kdtb").attr('width',len);
			for(var i=xmnf.length-1;i>=0;i--){
				str1=str1+'<td colspan="11">'+xmnf[i]+'年度</td>';
				str2=str2+'<td colspan="2">计划项目</td><td colspan="2">完工项目</td><td colspan="2">在建项目</td><td colspan="2">未开工项目</td><td rowspan="2">完成投资(万元)</td><td rowspan="2">本年完成投资(万元)</td><td rowspan="2">完成率(%)</td>';
				str3=str3+'<td>个数</td><td>公里</td><td>个数</td><td>公里</td><td>个数</td><td>公里</td><td>个数</td><td>公里</td>';
			}
			biaotstr='<tr><td rowspan="3">设区市交通局</td><td colspan="11">合计</td>'
			+str1+'</tr>'
			+'<td rowspan="1" colspan="2">计划项目</td><td colspan="2">完工项目</td><td colspan="2">在建项目</td><td colspan="2">未开工项目</td><td rowspan="2">完成投资(万元)</td><td rowspan="2">本年完成投资(万元)</td><td rowspan="2">完成率(%)</td>'
			+str2+'</tr>'
			+'<td>个数</td><td>公里</td><td>个数</td><td>公里</td><td>个数</td><td>公里</td><td>个数</td><td>公里</td>'
			+str3+'</tr>';
			biaotou.empty();
			biaotou.append(biaotstr);
			var tbody = $("#wqgzlist");
			tbody.empty();
			var data="gcglwqgz.xmnf="+xmnf;
			//alert(data);
			$.ajax({
				url:"/jxzhpt/gcybb/getAbgchzb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					var tbodystr="";
						for ( var i = 0; i < msg.length; i++) {
										var strs="";
										for(var j=xmnf.length-1;j>=0;j--){
											var s1="JHSL"+xmnf[j];
											var s2="JHYM"+xmnf[j];
											var s3="WCSL"+xmnf[j];
											var s4="WCYM"+xmnf[j];
											var s5="ZJSL"+xmnf[j];
											var s6="ZJYM"+xmnf[j];
											var s7="WKSL"+xmnf[j];
											var s8="WKYM"+xmnf[j];
											var s9="WC"+xmnf[j];
											var s10="BNWC"+xmnf[j];
											var s11="WCL"+xmnf[j];
											if(j==0)
												strs=strs+msg[i][s1].toFixed(2)+"</td><td>"+msg[i][s2].toFixed(2)+"</td><td>"
												+msg[i][s3]+"</td><td>"+msg[i][s4].toFixed(2)+"</td><td>"
												+msg[i][s5]+"</td><td>"+msg[i][s6].toFixed(2)+"</td><td>"
												+msg[i][s7]+"</td><td>"+msg[i][s8].toFixed(2)+"</td><td>"
												+msg[i][s9]+"</td><td>"+msg[i][s10].toFixed(2)+"</td><td>"
												+msg[i][s11]+"</td>";
											else
											strs=strs+msg[i][s1].toFixed(2)+"</td><td>"+msg[i][s2].toFixed(2)+"</td><td>"
											+msg[i][s3]+"</td><td>"+msg[i][s4].toFixed(2)+"</td><td>"
											+msg[i][s5]+"</td><td>"+msg[i][s6].toFixed(2)+"</td><td>"
											+msg[i][s7]+"</td><td>"+msg[i][s8].toFixed(2)+"</td><td>"
											+msg[i][s9]+"</td><td>"+msg[i][s10].toFixed(2)+"</td><td>"
											+msg[i][s11]+"</td><td>";
										}
										tbodystr=tbodystr+"<tr><td>"+msg[i].XZQHMC+"</td><td>"
										+msg[i].JHSL+"</td><td>"+msg[i].JHYM.toFixed(2)+"</td><td>"
										+msg[i].WCSL+"</td><td>"+msg[i].WCYM.toFixed(2)+"</td><td>"
										+msg[i].ZJSL+"</td><td>"+msg[i].ZJYM.toFixed(2)+"</td><td>"
										+msg[i].WKSL+"</td><td>"+msg[i].WKYM.toFixed(2)+"</td><td>"
										+msg[i].WC+"</td><td>"+msg[i].BNWC.toFixed(2)+"</td><td>"
										+msg[i].WCL+"</td><td>"+strs+"</tr>";
					}
						tbody.append(tbodystr);
				}
			});
		}
	function exportWqgzyb(){
		var xmnf=$("#jhxdnf").combotree("getValues");
		//var xmlx=$("#xmlx").combobox("getValue");
		if(xmnf==''){
			alert("请选择年份");
			return;
		}
		var data="flag=flag&gcglwqgz.xmnf="+xmnf;
		window.location.href="/jxzhpt/gcybb/getAbgchzb.do?"+data;
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
#kdtb {
	border-collapse:collapse;
}
#kdtb thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
#kdtb tbody tr td {
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
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;全省安保工程项目汇总表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%;height:40px; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>下达年份：</span>
        						<input type="text" id="jhxdnf"  style="width:80px;">
<!--         						<span>项目类型：</span>
        						<select id="xmlx" style="width:80px;">
        						</select>	 -->
        						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       							<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()" />
								 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align: -50%;" />
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">

        						
        					</p>         					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-110)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id="kdtb" width="2000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">全省安保工程项目汇总表</caption>
								<thead id="biaotou">
									<tr>
										<td rowspan="2" style="width: 100px;">设区市交通局</td>
										<td rowspan="2" style="width: 125px;">合计</td>
										<td colspan="5">2011年度</td>
										<td colspan="5">2012年度</td>
										<td colspan="5">2013年度</td>
										<td colspan="5">2014年度</td>
										</tr>
									<tr>
										<td>计划(公里)</td>
										<td>完成情况(公里)</td>
										<td>完成投资(万元)</td>
										<td>本年完成投资(万元)</td>
										<td>完成率(%)</td>
										<td>计划(公里)</td>
										<td>完成情况(公里)</td>
										<td>完成投资(万元)</td>
										<td>本年完成投资(万元)</td>
										<td>完成率(%)</td>
										<td>计划(公里)</td>
										<td>完成情况(公里)</td>
										<td>完成投资(万元)</td>
										<td>本年完成投资(万元)</td>
										<td>完成率(%)</td>
										<td>计划(公里)</td>
										<td>完成情况(公里)</td>
										<td>完成投资(万元)</td>
										<td>本年完成投资(万元)</td>
										<td>完成率(%)</td>
										<td>计划(公里)</td>
										<td>完成情况(公里)</td>
										<td>完成投资(万元)</td>
										<td>本年完成投资(万元)</td>
										<td>完成率(%)</td>
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