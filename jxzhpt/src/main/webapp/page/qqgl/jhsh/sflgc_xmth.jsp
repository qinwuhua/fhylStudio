<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>示范路工程_项目退回</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#id').val(parent.YMLib.Var.xmid);
	});
	
	function sflgcXmth() {
	$('#sflgcFrom').ajaxSubmit({
		dataType : 'json',
		success : function(msg) {
			if (msg.result) {
				alert("保存成功！");
				parent.$("#grid").datagrid('reload');
				closeWindow("xmth");
			}
		},
		error : function(msg) {
			alert("保存失败！");
		}
	});
}
</script>
</head>
<body>
	<center>
		<table width="98%" height="60%" cellpadding="0" cellspacing="0"
			border="0" style="margin-top: 10px; margin-left: 13px;">
			<tr>
				<td>
					<form id="sflgcFrom" action="../../../qqgl/sflgcXmth.do"
						method="post">
						<input id="id" name="id" type="hidden" />
						<table width="98%" border="0"
							style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
							cellspacing="0" cellpadding="0">
							<tr style="height: 30px; font-size: 10px;">
								<td
									style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">退回原因：</td>
								<td
									style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
									<input id="thyy" name="thyy" type="text" style="width: 100px; height: 20px;" />
								</td>
							</tr>
						</table>
						<table width="98%" border="0"
							style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
							cellspacing="0" cellpadding="0">
							<tr style="height: 30px;">
								<td align="center">
								<td align="center">
								    <img onclick="sflgcXmth()" alt="保存"
									onmouseover="this.src='../../../images/Button/baocun2.gif'"
									onmouseout="this.src='../../../images/Button/baocun1.gif'"
									src="../../../images/Button/baocun1.gif"> &nbsp; 
								    <input type="image" name="btnCancel" id="btnCancel"
									onmouseover="this.src='../../../images/Button/fanhui2.GIF'"
									alt="返回" onclick="closeWindow('xmth')"
									onmouseout="this.src='../../../images/Button/fanhui1.GIF'"
									src="../../../images/Button/fanhui1.GIF"
									style="border-width: 0px;" />
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>