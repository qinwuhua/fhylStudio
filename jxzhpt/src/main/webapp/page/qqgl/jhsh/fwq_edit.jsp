<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务区编辑</title>
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
	alert("asfdasd");
	$('#id').val(parent.YMLib.Var.xmid);
	$.ajax({
		type : 'get',
		url : '../../../qqgl/queryFwqById.do',
		data : 'jhsh.id='+parent.YMLib.Var.xmid,
		dataType : 'json',
		success : function(data) {
			$('#fwqFrom').form("load", data);
			$("#ztz").numberbox('setValue',data.ztz);
			alert($("#ztz").val());
			$("#cgs").numberbox('setValue',data.cgs);
			alert($("#cgs").val());
			$("#dfzc").numberbox('setValue',data.dfzc);
			alert($("#dfzc").val());
			$("#zydpx").numberbox('setValue',data.zydpx);
			alert($("#zydpx").val());
		}
	});
});
function updateFwq() {
	$('#fwqFrom').ajaxSubmit({
		dataType : 'json',
		success : function(msg) {
			if (msg.result) {
				alert("保存成功！");
				parent.$("#grid").datagrid('reload');
				closeWindow("jhxd");
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
					<form id="fwqFrom" action="../../../qqgl/updateFwq.do"
						method="post">
						<input id="id" name="id" type="hidden" />
						<table width="98%" border="0"
							style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
							cellspacing="0" cellpadding="0">
							<tr style="height: 30px; font-size: 10px;">
								<td
									style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">总投资</td>
								<td
									style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
									<input id="ztz" name="ztz" class="easyui-numberbox" type="text"
									value="0" style="width: 100px; height: 20px;" />万元
								</td>
								<td
									style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
									<b><font color="#009ACD"
										style="cursor: hand; font-size: 12px">车购税：</font></b>
								</td>
								<td
									style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
									<input id="cgs" name="cgs" class="easyui-" type="text"
									value="0" style="width: 100px; height: 20px;" />万元
								</td>
							</tr>
							<tr style="height: 30px; font-size: 10px;">
								<td
									style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
									<b><font color="#009ACD"
										style="cursor: hand; font-size: 12px">地方自筹：</font></b>
								</td>
								<td
									style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
									<input id="dfzc" name="dfzc" type="text"
									class="easyui-numberbox" value="0"
									style="width: 100px; height: 20px;" />万元
								</td>

								<td
									style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
									<b><font color="#009ACD" style="cursor: hand; font-size: 12px">重要度排序 ：</font></b>
								</td>
								<td
									style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
									<input id="zydpx" name="zydpx" type="text" style="width: 100px; height: 20px;" class="easyui-numberbox" value="0"/>
								</td>
							</tr>
						</table>
						<table width="98%" border="0"
							style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
							cellspacing="0" cellpadding="0">
							<tr style="height: 30px;">
								<td align="center">
								<td align="center"><img onclick="updateFwq()" alt="保存"
									onmouseover="this.src='../../../images/Button/baocun2.gif'"
									onmouseout="this.src='../../../images/Button/baocun1.gif'"
									src="../../../images/Button/baocun1.gif"> &nbsp; <input
									type="image" name="btnCancel" id="btnCancel"
									onmouseover="this.src='../../../images/Button/fanhui2.GIF'"
									alt="返回" onclick="closeWindow('jhxd')"
									onmouseout="this.src='../../../images/Button/fanhui1.GIF'"
									src="../../../images/Button/fanhui1.GIF"
									style="border-width: 0px;" /></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>