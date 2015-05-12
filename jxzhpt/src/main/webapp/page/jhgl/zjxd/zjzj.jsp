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
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">上报年份：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zjnf" type="text" width="150" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加总投资：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtztz" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加部补助资金：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="zjje" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加省补助资金：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtStz" type="text" width="150" value="0"/>万元
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
			if(!je.test($('#txtztz').val()) && !fje.test($('#txtztz').val())){
				alert("请正确填写追加总资金");
				return;
			}
			if(!je.test($('#zjje').val()) && !fje.test($('#zjje').val())){
				alert("请正确填写部补助金额");
				return;
			}
			if(!je.test($('#txtStz').val()) && !fje.test($('#txtStz').val())){
				alert("请正确填写追加省资金");
				return;
			}
			var row =parent.YMLib.Var.Row;
			var jh,ztz=0,stz=0,dftz=0;
			if(parent.YMLib.Var.url=="editZj" || parent.YMLib.Var.url=="editAbZj"){
				if(parent.YMLib.Var.url=="editAbZj"){
					ztz=Number(row.pfztz)+Number($('#txtztz').val());
				}else{
					ztz=Number(row.pftz)+Number($('#txtztz').val());
				}
				stz=Number(row.jhsybbzje)+Number($('#zjje').val());
				dftz=Number(row.jhsydfzczj)+Number($('#txtStz').val());
				if(Number(ztz) >=Number(stz)+Number(dftz)){
					jh={'jh.id':row.id,'jh.jhsybbzje':row.jhsybbzje,'jh.jhsydfzczj':row.jhsydfzczj,
						'zjzj.planId':row.id,'zjzj.nf':$('#zjnf').val(),'zjzj.bbzje':$('#zjje').val(),
						'zjzj.ztz':$('#txtztz').val(),'zjzj.stz':$('#txtStz').val()};
					if(parent.YMLib.Var.url=="editAbZj"){
						jh['jh.pfztz']=row.pfztz;
					}else{
						jh['jh.pftz']=row.pftz;
					}
				}else{
					alert("追加后得部补助金额和省补助金额不能高于总投资！");
					return;
				}
			}else if(parent.YMLib.Var.url=="editGjZj" || parent.YMLib.Var.url=="editShZj" || parent.YMLib.Var.url=="editWqZj" || parent.YMLib.Var.url=="editZhZj"){
				ztz=Number(row.pfztz)+Number($('#txtztz').val());
				stz=Number(row.jhsybzje)+Number($('#zjje').val());
				dftz=Number(row.jhsydfzcje)+Number($('#txtStz').val());
				if( Number(ztz) >= Number(stz)+Number(dftz)){
					jh={'jh.id':row.id,'jh.pfztz':row.pfztz,'jh.jhsybzje':row.jhsybzje,
							'jh.jhsydfzcje':row.jhsydfzcje,
						'zjzj.planId':row.id,'zjzj.nf':$('#zjnf').val(),'zjzj.bbzje':$('#zjje').val(),
						'zjzj.ztz':$('#txtztz').val(),'zjzj.stz':$('#txtStz').val()};
				}else{
					alert("追加后得部补助金额和省补助金额不能高于总投资！");
					return;
				}
			}
			$.ajax({
				type:'post',
				url:'../../../jhgl/'+parent.YMLib.Var.url+'.do',
				dataType:'json',
				data:jh,
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