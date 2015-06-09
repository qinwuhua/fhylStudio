<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金追加</title>
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#pfztz').html(parent.YMLib.Var.row.pfztz);
			$('#bbzzj').html(parent.YMLib.Var.row.bbzzj);
			$('#sbzzj').html(parent.YMLib.Var.row.sbzzj);
		});
		function blur(obj){
			var number=/^[0-9]*$/;
			if(!number.test($(obj).val())){
				alert("请输入数字！");
				$(obj).focus();
			}else{
				$('#pfztz').html(Number(parent.YMLib.Var.row.pfztz)+Number($('#txtztz').val()));
				$('#bbzzj').html(Number(parent.YMLib.Var.row.bbzzj)+Number());
				$('#sbzzj').html(Number(parent.YMLib.Var.row.sbzzj)+Number());
			}
		}
	</script>
</head>
<body>
	<div>
		<table width="100%" border="0"
			style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
			cellspacing="0" cellpadding="0">
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 10%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">上报年份：</font>
				</td>
				<td colspan="2" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 20%; text-align: left; padding-left: 10px;">
					<input id="zjnf" type="text" width="150" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 10%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加总投资：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 10%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtztz" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 10%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加部补助资金：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 10%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="zjje" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 10%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加省补助资金：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 10%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtStz" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="2" style="border-right: 1px solid #C0C0C0;border-top: 1px none #C0C0C0;border-bottom: 1px solid #C0C0C0; width: 10%; text-align:center; padding-left: 10px; font-size: 12px;">
					追加后总投资：<font id="pfztz"></font>&nbsp;万元，部补助资金：<font id="bbzzj"></font>&nbsp;万元，省补助资金：<font id="sbzzj"></font>&nbsp;万元。
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<img id="imgAdd" onclick="zizj()" onmouseover="this.src='../../../images/Button/tianj2.gif'"
					alt="添加" onmouseout="this.src='../../../images/Button/tianj1.gif'"
					src="../../../images/Button/tianj1.gif"
					style="border-width: 0px; cursor: hand;" />
					<img src="../../../images/Button/fanhui1.GIF"
					alt="返回" onmouseover="this.src='../../../images/Button/fanhui2.GIF'"
					onmouseout="this.src='../../../images/Button/fanhui1.GIF'"
					style="border: 0">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>