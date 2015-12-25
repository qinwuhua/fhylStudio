<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金下达页面</title>
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../js/jquery-form.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			var master ={'gydwdm':$.cookie("unit")};
			$('#xmid').val(parent.YMLib.Var.xmid);
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryGydwmcById.do',
				dataType:'json',
				data:master,
				success:function(data){
					$('#tbdw').val(data.gydwmc);
				}
			});
			var myDate = new Date();
			var date=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
			$('#tbsj').html(date);
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryZjxdExistById.do',
				dataType:'json',
				data:'zjxd.xmid='+parent.YMLib.Var.xmid,
				success:function(data){
					if(data.count!="0")
						$('#sfzj').val("1");
				}
			});
			var years=[];
			for(var i=0;i<=10;i++){
				years.push({text:(myDate.getFullYear()+5-i)});
			}
			$('#xdnf').combobox({    
			    data:years,
			    valueField:'text',
			    textField:'text'
			});
		});
		function insertZjxd(){
			var tj=true;
			tj = validateText('xdzj','number',tj);
			tj = validateText('btzzj','number',tj);
			if(!tj){
				return;
			}
			$('#zjxdForm').ajaxSubmit({
				dataType:'json',
				success:function(msg){
					if(msg.result){
						alert("资金下达成功！");
						parent.$('#zjxdList').datagrid("reload");
						closeWindow("zjxd");
					}
				},
				error:function(msg){
					alert("修改失败！");
				}
			});
		}
		function isNumber(obj){
			var number=/^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)|(^[1-9][0-9]*.[0-9]*$)/;
			if(!number.test($(obj).val())){
				alert("请输入正确的数字！");
				$(obj).focus();
			}
			return number.test($(obj).val());
		}
	</script>
</head>
<body>
	<center>
		<table width="100%" height="60%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; margin-left: 13px;">
			<tr>
				<td>
					<form id="zjxdForm" action="../../../jhgl/addxZjxd.do">
					<table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
						<tr style="height: 35px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">
									总补助资金：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="xdzj" name="xdzj" onblur="isNumber(this)" type="text" value="0" style="width: 80px;" />&nbsp;万元
								<input id="xmid" name="xmid" type="hidden" style="width: 80px;" />
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">
									车购税资金：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="btzzj" name="btzzj" onblur="isNumber(this)" type="text" value="0" style="width: 80px;"/>&nbsp;万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">
									银行贷款：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="yhdk" name='yhdk'  onblur="isNumber(this)" type="text" value="0" style="width: 80px;"/>&nbsp;万元
							</td>
						</tr>
						<tr style="height: 35px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">
									国债：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="gz" name="gz" onblur="isNumber(this)" type="text" value="0" style="width: 80px;" />&nbsp;万元
								
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">
									省债：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="sz" name='sz' onblur="isNumber(this)" type="text" value="0" style="width: 80px;"/>&nbsp;万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
							
							</td>
						</tr>
						<tr style="height: 35px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">下达年份：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<select name="xdnf" id="xdnf" style="width: 80px;"></select>
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报时间：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="tbtime" name="tbtime" type="text" class="easyui-datebox" style="width: 100px;"/>
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报部门：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="tbdw" name="tbdw" type="text" style="width: 100px;"/>
							</td>
							<td style="display:none;border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<font color="#009ACD" style="cursor: hand; font-size: 12px">是否为追加资金：</font>
								<input id="sfzj" name="sfzj" value="0" type="hidden"/>
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
					</table>
					</form>
					<table width="100%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 30px;">
							<td align="center">
							<td align="center">
								<input type="image" name="btnAdd" id="btnAdd" onclick="insertZjxd()"
								onmouseover="this.src='../../../images/Button/baocun2.gif'" alt="保存"
								onmouseout="this.src='../../../images/Button/baocun1.gif'"
								src="../../../images/Button/baocun1.gif" style="border-width: 0px;" />
								&nbsp; 
								<input type="image" name="btnCancel" id="btnCancel" onmouseover="this.src='../../../images/Button/fanhui2.GIF'" alt="返回"
								onclick="closeWindow('zjxd')" onmouseout="this.src='../../../images/Button/fanhui1.GIF'"
								src="../../../images/Button/fanhui1.GIF" style="border-width: 0px;" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>