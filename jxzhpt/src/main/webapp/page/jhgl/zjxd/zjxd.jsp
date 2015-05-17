<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金下达页面</title>
</head>
<body>
<script type="text/javascript">
function check(str){
	var g = /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)|(^[1-9][0-9]*.[0-9]*$)/;
	if(str.value==''){
		return;
	}
    if( !g.test(str.value)){
    	alert("请输入正确的数字");
    	$(str).val('');
    	return;
    }
}
</script>
	<center>
		<table width="100%" height="60%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; margin-left: 13px;">
			<tr>
				<td><br />
					<table width="100%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 35px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">
									总投资资金：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input onblur="check(this)" id="xdzj" name="xdzj" type="text"  style="width: 80px;" />&nbsp;万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">
									车购税资金：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input onblur="check(this)" id="btzzj" name="btzzj" type="text"  style="width: 80px;"/>&nbsp;万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">
									省投资：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input onblur="check(this)" id="stz" name="btzzj" type="text"  style="width: 80px;"/>&nbsp;万元
							</td>
						</tr>
						<tr style="height: 35px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">下达年份：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<select name="ddlXDNF" id="zjxdnf" style="width: 80px;"></select>
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">计划下达文号：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="jhxdwh" name="btzzj" type="text"  style="width: 80px;" />&nbsp;
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报部门：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<span id="tbdw"></span>
							</td>
							<td style="display:none;border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<font color="#009ACD" style="cursor: hand; font-size: 12px">是否为追加资金：</font>
								<input id="sfzj" value="0" type="hidden"/>
							</td>
							<td style="display:none;border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<table id="rList" border="0">
									<tr>
										<td>
											<input id="rList_0" type="radio" name="rList" value="0" checked="checked" />
											<label for="rList_0">否</label></td>
										<td>
											<input id="rList_1" type="radio" name="rList" value="1" />
											<label for="rList_1">是</label></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr style="height: 35px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报时间：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<span id="tbsj"></span>
							</td>
						</tr>
					</table>
					<table width="100%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 30px;">
							<td align="center">
							<td align="center">
								<input type="image" name="btnAdd" id="btnAdd" onclick="addZjxd()"
								onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存"
								onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'"
								src="${pageContext.request.contextPath}/images/Button/baocun1.gif" style="border-width: 0px;" />
								&nbsp; 
								<input type="image" name="btnCancel" id="btnCancel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回"
								onclick="closezjxd()" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'"
								src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" style="border-width: 0px;" />
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
		<script type="text/javascript">
			var master ={'gydwdm':$.cookie("unit")};
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryGydwmcById.do',
				dataType:'json',
				data:master,
				success:function(data){
					$('#tbdw').html(data.gydwmc);
				}
			});
			var myDate = new Date();
			var date=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
			$('#tbsj').html(date);
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryZjxdExistById.do',
				dataType:'json',
				data:'zjxd.xmid='+xxId,
				success:function(data){
					if(data.count!="0")
						$('#sfzj').val("1");
				}
			});
			var years=[];
			for(var i=0;i<=10;i++){
				years.push({text:(myDate.getFullYear()-i)});
			}
			$('#zjxdnf').combobox({    
			    data:years,
			    valueField:'text',    
			    textField:'text'   
			});
		</script>
	</center>
</body>
</html>