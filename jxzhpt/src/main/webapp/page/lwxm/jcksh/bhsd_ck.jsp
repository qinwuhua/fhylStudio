<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理病害隧道项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript">
	$(function(){
		selbhsdById();
		$("#qx_window").click(function(){
			parent.$('#jck_ck').window('destroy');
		});	
	});
	function selbhsdById(){
		$.ajax({
			type : 'post',
			url : '/jxzhpt/xmjck/selectBhsdById.do',
			data :"id="+parent.rowid,
			dataType:'json',
			success : function(msg) {
			$("#sddm").html(msg.sddm);
			$("#sdmc").html(msg.sdmc);
			$("#sdzxzh").html(msg.sdzxzh);
			$("#gydw").html(msg.gydw);
			$("#xzqhdm").html(msg.xzqhdm);
			$("#xzqhmc").html(msg.xzqhmc);
			$("#lxbm").html(msg.lxbm);
			$("#lxmc").html(msg.lxmc);
			$("#sdcd").html(msg.sdcd);
			$("#sdkd").html(msg.sdkd);
			$("#sdgd").html(msg.sdgd);
			$("#jsdj").html(msg.jsdj);
			$("#pddj").html(msg.pddj);
			$("#pdtime").html(msg.pdtime);
			$("#jsjd").html(msg.jsjd);
			$("#jswd").html(msg.jswd);
			$("#xjgjnd").html(msg.xjgjnd);
			$("#acdfl").html(msg.acdfl);
			$("#xmnf").html(msg.xmnf);
			$("#bhbw").html(msg.bhbw);
			$("#bhnr").html(msg.bhnr);
			$("#bz").html(msg.bz);
			$("#xmmc").html(msg.xmmc);
			$("#jsxz").html(msg.jsxz);
			$("#nsddm").html(msg.nsddm);
			$("#nlxbm").html(msg.nlxbm);
			$("#nlxmc").html(msg.nlxmc);
			$("#nsdzxzh").html(msg.nsdzxzh);
			}
		});
	}		
</script>
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
<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					病害隧道项目基本信息
				</td>
			</tr>
			<tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>隧道代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					 <span id="sddm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					 <span id="xmmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
                    <span id="jsxz"></span>
			    </td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
                    <span id="xjgjnd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sdmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdzxzh"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhdm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhmc"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxbm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
                    <span id="xmnf"></span>
                </td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdcd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道净宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="sdkd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道宽度(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdgd"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				    <span id="jsdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pddj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定日期</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pdtime"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="acdfl"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">进遂经度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsjd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">进遂纬度</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jswd"></span>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="nlxbm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="nlxmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新隧道代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="nsddm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新隧道中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="nsdzxzh"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害部位：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bhbw"></span>
			    </td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bhnr"></span>
			    </td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff;"
					align="center"> <a href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确定</a></td>
			</tr>
			</table>
</body>
</html>