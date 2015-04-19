<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<style type="text/css">
<!--
#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(../../../images/jianjiao.png) 8px 0 no-repeat;}
#righttop{height:33px;background:url(../../../images/righttopbg.gif) 0 0 repeat-x;}
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
<script type="text/javascript">
$(function(){
	loadUnit("gydw",$.cookie("unit"));
	loadDist("xzqh",$.cookie("dist"));
	loadBmbm2("xmlx","项目类型1");
	xmnf('year');
	startSearch();
});
function startSearch(){
	var data="xmbb.xzqh="+$("#xzqh").combobox("getValue")+"&xmbb.gydw="+$("#gydw").combobox("getValue")+"&xmbb.sbnf="+$("#year").combobox("getValue")+"&xmbb.tiaojian="+$("#xmlx").combobox("getValue");

	$.ajax({
		type:'post',
		url:'/jxzhpt/dbbb/gljsxdList.do',
		dataType:"JSON",
		data:data,
		success:function(msg){
			var str="";
			$("#table_tbody").html("");
			if(msg.length!=0){
				for(var i=0;i<msg.length;i++){
							str+="<tr align='center'><td>"+msg[i].BZ+"</td>"+"<td>"+msg[i].XMMC+"</td>"+"<td>"+msg[i].XZDJ+"</td>"+"<td>"+msg[i].QDZH+"</td>"
							+"<td>"+msg[i].ZDZH+"</td>"+"<td>"+msg[i].LXBH+"</td>"+"<td>"+msg[i].JSDJ+"</td><td>"+msg[i].TSDQ+"</td><td>"+msg[i].SHI+"</td>"
							+"<td>"+msg[i].XIAN+"</td><td>"+msg[i].JSXZ+"</td><td>"+msg[i].HEJGL+"</td><td>"+msg[i].YIJGL+"</td><td>"+msg[i].ERJGL+"</td>"
							+"<td>"+msg[i].SANJGL+"</td><td>"+msg[i].SIJGL+"</td><td>"+msg[i].DQIAO+"</td><td>"+msg[i].SDAO+"</td><td>"+msg[i].LMKD+"</td>"
							+"<td>"+msg[i].JSFA+"</td><td>"+msg[i].ZTZ+"</td><td>"+msg[i].BTZ+"</td><td>"+msg[i].STZ+"</td><td>"+msg[i].SNHJ+"</td>"
							+"<td>"+msg[i].SNBTZ+"</td><td>"+msg[i].BNHJ+"</td><td>"+msg[i].BNBTZ+"</td><td>"+msg[i].GKPFWH+"</td><td>"+msg[i].SJPFWH+"</td><td>"
							+msg[i].JHXDWH+"</td></tr>";
				}
			}else{
				str+="<tr align='center'><td colspan='21'>暂无数据</td></tr>";
			}
			$("#table_tbody").html(str);
		}
	});
}
</script>
</head>
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;height: 100%" >
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr height="20px;">
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;计划统计报表>&nbsp;公路建设下达计划</div>
			</div>
        	</tr>
        	<tr style="height: 70px;">
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>单位名称：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>上报年份：</span>
        						<select id="year" style="width:80px;">
        						</select>
        						<span>项目类型：</span>
        						<select id="xmlx" style="width:80px;">
        						</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'"
                                        onmouseout="this.src='../../../images/Button/Serch01.gif' " onclick="startSearch()" style="border-width:0px;cursor: hand;vertical-align: -50%;" />
									 <img alt="导出Excel" src="../../../images/Button/dcecl1.gif" onmouseover="this.src='../../../images/Button/dcecl2.gif'"
                                        onmouseout="this.src='../../../images/Button/dcecl1.gif' " onclick="exportExcel_gljsxd()" style="vertical-align: -50%;" />
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
							<div data-options="region:'center',border:false" style="overflow: auto;">
							<table width="2800px"   class="table_body">
								<caption align="top" style="font-size:x-large;font-weight: bolder;">2015年公路建设下达计划（国省道改造项目） </caption>
								<thead>
									<tr>
										<td rowspan="2">备注</td>
										<td rowspan="2">项目名称</td>
										<td rowspan="2">行政等级</td>
										<td rowspan="2">起点桩号</td>
										<td rowspan="2">终点桩号</td>
										<td rowspan="2">路线编码</td>
										<td rowspan="2">现公路技术等级</td>
										<td colspan="3"></td>
										<td rowspan="2">建设性质</td>
										<td colspan="7">建 设 规 模（ 公 里 ） / （ 延 米 ）</td>
										<td rowspan="2">路面宽度</td>
										<td rowspan="2">技术方案</td>
										<td rowspan="2">总投资（万元）</td>
										<td rowspan="2">中央投资（万元）</td>
										<td rowspan="2">省级补助（万元）</td>
										<td colspan="2">上年累计完成投资（万元）</td>
										<td colspan="2">本年建设计划（万元）</td>
										<td colspan="2">前期工作情况</td>
										<td rowspan="2">计划下达文号</td>
									</tr>	
									<tr>
										<td>特殊地区 </td>
										<td>市</td>
										<td>县</td>
										<td>合计</td>
										<td>一级公路</td>
										<td>二级公路</td>
										<td>三级公路</td>
										<td>四级公路</td>
										<td>大桥</td>
										<td>隧道</td>
										<td>合计</td>
										<td>内：中央车购税</td>
										<td>合计</td>
										<td>车购税合计</td>
										<td>工可批复文号</td>
										<td>设计批复文号</td>
									</tr>
								</thead>
								<tbody id='table_tbody'>
								
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