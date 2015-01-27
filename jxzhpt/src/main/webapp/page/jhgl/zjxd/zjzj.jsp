<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资金追加</title>
</head>
<body>
	<div>
		<table width="100%" border="0"
			style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
			cellspacing="0" cellpadding="0">
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">上报年份：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zjnf" type="text" width="150" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">部补助资金：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="zjje" type="text" width="150" />万元
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<img id="imgAdd" onclick="zizj()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/tianj2.gif'"
					alt="添加" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/tianj1.gif'"
					src="${pageContext.request.contextPath}/images/Button/tianj1.gif"
					style="border-width: 0px; cursor: hand;" />
					
					<img src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF"
					alt="返回" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'"
					onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'"
					style="border: 0">
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		function zizj(){
			var nf=new RegExp("^[1-9][0-9]{3}$");
			var je=new RegExp("^[0-9]*$");
			if($('#zjnf').val()=="" || !nf.test($('#zjnf').val())){
				alert("请正确填写上报年份！");
			}else if($('#zjje').val()=="" || !je.test($('#zjje').val())){
				alert("请正确填写补助金额");
			}else{
				var zjzj={"zjzj.planId":zjId,"zjzj.nf":$('#zjnf').val(),"zjzj.bbzje":$('#zjje').val()};
				$.ajax({
					type:'post',
					url:'../../../jhgl/insertZjzj.do',
					dataType:'json',
					data:zjzj,
					success:function(data){
						if(data.result=="true"){
							alert("资金追加成功！");
							$('#'+bz).dialog("close");
						}
					}
				});
			}
			
		}
	</script>
</body>
</html>