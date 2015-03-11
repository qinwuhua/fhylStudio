<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="./js/zdxx.js"></script>

<style type="text/css">
TD {
font-size: 12px;
} 
a{
text-decoration:none;
}
</style>
</head>
<body>
<script type="text/javascript">
	$(function(){
		var data=parent.obj;
		$("#lxbm").text(data.lxbm);
		$("#lxmc").text(data.lxmc);
		$("#qdzh").text(data.qdzh);
		$("#zdzh").text(data.zdzh);
		$("#zdsj").text(data.zdsj);
		$("#zhlb").text(data.zhlb);
		$("#qtcs").text(data.qtcs);
		$("#yjhfsj").text(data.yjhfsj);
		$("#tjr").text(data.tjr);
		$("#shry").text(data.shry);
		$("#tbsj").text(data.tbsj);
		$("#sfhf").text(data.sfhf);
		$("#gydw").text(data.gydwmc);
		$("#tbdw").text(data.tbdwmc);
	});
</script>
	<form action="" id="zdxxform" method="post">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路交通阻断基本信息
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="gydw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="lxbm"></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称 ：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="lxmc"></span>
					</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qdzh"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="zdzh"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">阻断时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="zdsj"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">灾害类别：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="zhlb"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">抢通措施：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qtcs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">预计恢复时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="yjhfsj"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否恢复：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sfhf"></span>
					</td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况填报信息  
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">填报单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="tbdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">统计人：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="tjr"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审核人：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="shry"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">填报时间：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="tbsj"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel" onclick="closes('zdxx_xx')">取消</a></td>
			</tr>
			</table>
		</form>
</body>
</html>