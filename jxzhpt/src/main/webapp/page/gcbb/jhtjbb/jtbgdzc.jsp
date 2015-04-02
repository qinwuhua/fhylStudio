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
<style>
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
</style>
<script type="text/javascript">
$(function(){
	loadUnit("gydw",$.cookie("unit"));
	loadDist("xzqh",$.cookie("dist"));
	xmnf('xmnf');
	jhtjBb();
});
function jhtjBb(){
	$.ajax({
		type:'post',
		url:'/jxzhpt/dbbb/jhtjBb.do',
		data:'',
		async:false,
		dataType:'json',
		success:function(data){
			$("#tjbb").empty();
			var tbody="";
			for(var i=0;i<data.wqGlj.length;i++){
				tbody+= "";
			}
			$("#tjbb").append(tbody);
			}
		});
}
</script>
</head>
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;计划统计报表>&nbsp;交通部固定资产投资建设计划</div>
			</div>
			
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:100%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
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
        						<select id="xmnf" style="width:80px;">
        						</select>
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'"
                                        onmouseout="this.src='../../../images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" />
									 <img alt="导出Excel" src="../../../images/Button/dcecl1.gif" onmouseover="this.src='../../../images/Button/dcecl2.gif'"
                                        onmouseout="this.src='../../../images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" />
        					</p>
        					
        				</div>
        			</fieldset>
        		</td>
        	</tr>
			<tr>
                <td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div style="width:100%;height:126px">
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow-y:hidden;">
							<table width="2000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">2014年交通固定资产投资建设计划(路网结构改造)</caption>
								<thead>
									<tr>
										<td rowspan="3">项目所在地区</td>
										<td colspan="6">危桥</td>
										<td colspan="6">安保</td>
										<td colspan="6">灾害</td>
										<td colspan="3">总计</td>
									</tr>	
									<tr>
										<td colspan="2">公路局</td>
										<td colspan="2">交通局</td>
										<td colspan="2">小计</td>
										<td colspan="2">公路局</td>
										<td colspan="2">交通局</td>
										<td colspan="2">小计</td>
										<td colspan="2">公路局</td>
										<td colspan="2">交通局</td>
										<td colspan="2">小计</td>
										<td>公路局</td>
										<td>交通局</td>
										<td>小计</td>
									</tr>
									<tr>
										<td>座</td>
										<td>补助资金(万元)</td>
										<td>座</td>
										<td>补助资金(万元)</td>
										<td>座</td>
										<td>补助资金(万元)</td>
										<td>处治里程(km)</td>
										<td>补助资金(万元)</td>
										<td>处治里程(km)</td>
										<td>补助资金(万元)</td>
										<td>处治里程(km)</td>
										<td>补助资金(万元)</td>
										<td>处治里程(km)</td>
										<td>补助资金(万元)</td>
										<td>处治里程(km)</td>
										<td>补助资金(万元)</td>
										<td>处治里程(km)</td>
										<td>补助资金(万元)</td>
										<td>补助资金(万元)</td>
										<td>补助资金(万元)</td>
										<td>补助资金(万元)</td>
									</tr>
								</thead>
								<tbody id="tjbb">
								
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