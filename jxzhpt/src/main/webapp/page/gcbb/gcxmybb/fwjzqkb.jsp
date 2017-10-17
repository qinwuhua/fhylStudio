<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="/jxzhpt/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
	<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(/jxzhpt/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(/jxzhpt/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		function save(){
		alert("保存成功");
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
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:500px" >
                	
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="1180px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;"><span id='nian' style="font-size:x-large;font-weight: bolder;"></span>2017年普通国省干线公路服务设施建设目标任务进展情况统计表 </caption>
								
									<tr>
										<td colspan="4" style="width: 400px;">项目类型</td>
										<td colspan="3" style="width: 270px;">改造项目（个）</td>
										<td colspan="3" style="width: 270px;">新建服务区项目（个）</td>
										<td colspan="3" style="width: 90px;">新建停车区项目（个）</td>
									</tr>	
									
									<tr>
										<td style="width: 90px;" colspan=2 rowspan=3>总计</td>
										<td style="width: 90px;" colspan=2>完成项目数量（个）</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" rowspan=2>完成投资（万元）</td>
										<td style="width: 90px;">总投资</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;">车购税投资</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" colspan=1 rowspan=12>车购税补助项目</td>
										<td style="width: 90px;" rowspan=8>其中：2017年计划安排</td>
										<td style="width: 90px;" colspan=2>计划下达数量（个）</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" colspan=2>完成项目数量（个）</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" rowspan=3>计划下达资金（万元）</td>
										<td style="width: 90px;">总投资</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;">车购税投资</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;">地方自筹</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" rowspan=3>完成投资（万元）</td>
										<td style="width: 90px;">总投资</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;">车购税投资</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;">地方自筹</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" rowspan=4>2017年完成跨年度项目</td>
										<td style="width: 90px;" colspan="2">完成项目数量（个）</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" rowspan="3">完成投资（万元）</td>
										<td style="width: 90px;">总投资</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;">车购税投资</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;">地方自筹</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									
									<tr>
										<td style="width: 90px;" colspan=1 rowspan=4>省内自行安排</td>
										<td style="width: 90px;" colspan=1 rowspan=2>2017年计划安排项目</td>
										<td style="width: 90px;" colspan=2>完成项目数量（个）</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" colspan=2>完成投资（万元）</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" rowspan=2>2017年完成跨年度项目</td>
										<td style="width: 90px;" colspan=2>完成项目数量（个）</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									<tr>
										<td style="width: 90px;" colspan=2>完成投资（万元）</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
										<td style="width: 90px;">-</td>
									</tr>
									
									
									
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