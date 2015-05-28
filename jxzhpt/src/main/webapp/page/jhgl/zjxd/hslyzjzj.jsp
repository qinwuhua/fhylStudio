<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金追加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
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
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zjnf" type="text" width="150" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">中央投资车购税：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtzycgs" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">地方自筹/省级投资：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtdfzc" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">国内贷款：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtgndk" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">利用外资：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtlywz" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">总投资：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtjyjhztz" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 40px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">主要建设内容：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<textarea  id="txtzyjsnr" type="text" style="width:250px;height: 30px;" value="0"></textarea>
				</td>
			</tr>
			<tr style="height: 40px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">新增生产力：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<textarea id="txtxzscl" type="text" style="width:250px;height: 30px;" value="0"></textarea>
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
			var fje=new RegExp("^-[0-9]*$");
			if($('#zjnf').val()=="" || !nf.test($('#zjnf').val())){
				alert("请正确填写上报年份！");
				return;
			}
			if(!je.test($('#txtzycgs').val()) && !fje.test($('#txtzycgs').val())){
				alert("请正确填写中央投资车购税");
				return;
			}
			if(!je.test($('#txtdfzc').val()) && !fje.test($('#txtdfzc').val())){
				alert("请正确填写地方自筹资金");
				return;
			}
			if(!je.test($('#txtgndk').val()) && !fje.test($('#txtgndk').val())){
				alert("请正确填写国内贷款资金");
				return;
			}
			if(!je.test($('#txtlywz').val()) && !fje.test($('#txtlywz').val())){
				alert("请正确填写利用外资资金");
				return;
			}
			if(!je.test($('#txtjyjhztz').val()) && !fje.test($('#txtjyjhztz').val())){
				alert("请正确填写总投资资金");
				return;
			}
			var row =parent.YMLib.Var.Row;
			var hsly={};
			hsly={'hsly.id':row.id,'hsly.ztz':row.ztz,'hsly.zytz':row.zytz,'hsly.dfta':row.dfta,
					'hsly.gndk':row.gndk,'hsly.lywz':row.lywz,
					'zjzj.planid':row.id,'zjzj.ztz':$('#txtjyjhztz').val(),'zjzj.xzscnl':$('#txtxzscl').val(),
					'zjzj.zyjsnr':$('#txtzyjsnr').val(),'zjzj.lywz':$('#txtlywz').val(),'zjzj.gndk':$('#txtgndk').val(),
					'zjzj.dfzc':$('#txtdfzc').val(),'zjzj.zytzcgs':$('#txtzycgs').val(),'zjzj.jhnf':$('#zjnf').val()};
			$.ajax({
				type:'post',
				url:'../../../jhgl/editHslyzj.do',
				dataType:'json',
				data:hsly,
				success:function(data){
					if(data.result=="true"){
						alert("资金追加成功！");
						parent.$('#'+parent.YMLib.Var.id).datagrid('reload');
						closeWindow2("zjzjadd");
					}
				},
				error:function(e){
					alert("系统错误！");
				}
			});
		}
	</script>
</body>
</html>