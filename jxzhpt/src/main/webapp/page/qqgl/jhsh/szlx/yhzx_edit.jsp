<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金下达页面</title>
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

	
		$(function(){
			var obj=parent.YMLib.Var.obj;
			//$('#jhxdFrom').form("load",data);
			$('#xmbm').val(obj.XMBM);
			$('#xmlxs').val(parent.YMLib.Var.flag);
			$('#ztz').val(obj.ZTZ);
			$('#jbzj').val(obj.JBZJ);
			$('#dfzc').val(obj.DFZC);
			$('#zydpx').val(obj.ZYDPX);
			
		});
		//此方法计算总投资和厅补助为下面的资金加起来之和
		function jsztz(){
			var ztz=accAdd($('#dfzc').val()==""?0:$('#dfzc').val(),$('#jbzj').val()==""?0:$('#jbzj').val());
			$('#ztz').val(ztz);
		}
		
		
		
		function updataJhsh(){
			var result =true;
			result = validateText('ztz','number',result);
			
			if(!true){
				return;
			}
			$('#jhxdFrom').ajaxSubmit({
				dataType:'json',
				success:function(msg){
					if(msg.result){
						alert("保存成功！");
						parent.$("#grid").datagrid('reload');
						parent.loadLj();
						closeWindow("mywindow");
					}
				},
				error:function(msg){
					alert("保存失败！");
				}
			});
		}
		
	</script>
</head>
<body>
	<center>
		<table width="98%" height="60%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; margin-left: 13px;">
			<tr>
				<td>
					<form id="jhxdFrom" action="${pageContext.request.contextPath }/qqgl/updateJhshInfo.do" method="post">
					<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">总投资(万元)：</font></b>
								<input id="xmbm" name="xmbm" type="hidden"/>
								<input id="xmlxs" name="xmlxs" type="hidden"/>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="ztz" name="ztz"  type="number" value="0" style="width: 100px;height: 20px;"  readonly="readonly"/>万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">省补助(万元)：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="jbzj" name="jbzj"  type="number" value="0" style="width: 100px;height: 20px;" onchange="jsztz()"/>万元
							</td>
							
							
						</tr>
						
						<tr style="height: 30px;font-size: 10px;">
							
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">地方自筹(万元)：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="dfzc" name="dfzc"  type="number" value="0" style="width: 100px;height: 20px;" onchange="jsztz()"/>万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">重要度排序：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="zydpx" name="zydpx"  type="number" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							
							
							
						</tr>
					</table>
					<table width="98%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 30px;">
							<td align="center">
							<td align="center">
								<img onclick="updataJhsh()" alt="保存" onmouseover="this.src='${pageContext.request.contextPath }/images/Button/baocun2.gif'" onmouseout="this.src='${pageContext.request.contextPath }/images/Button/baocun1.gif'"
									src="${pageContext.request.contextPath }/images/Button/baocun1.gif">
								&nbsp; 
								<input type="image" name="btnCancel" id="btnCancel" onmouseover="this.src='${pageContext.request.contextPath }/images/Button/fanhui2.GIF'" alt="返回"
								onclick="closeWindow('mywindow')" onmouseout="this.src='${pageContext.request.contextPath }/images/Button/fanhui1.GIF'"
								src="${pageContext.request.contextPath }/images/Button/fanhui1.GIF" style="border-width: 0px;" />
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