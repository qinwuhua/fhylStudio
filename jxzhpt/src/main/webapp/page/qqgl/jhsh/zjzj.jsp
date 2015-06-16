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
	<script type="text/javascript" src="../../../js/jquery-form.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#pfztz').html(parent.YMLib.Var.row.pfztz);
			$('#bbzzj').html(parent.YMLib.Var.row.bbzzj);
			$('#sbzzj').html(parent.YMLib.Var.row.sbzzj);
			$('#xmbm').val(parent.YMLib.Var.row.xmbm);
			$('#xmlx').val(parent.YMLib.Var.xmlx);
			$('#txtpfztz').val(parent.YMLib.Var.row.pfztz);
			$('#txtbbzzj').val(parent.YMLib.Var.row.bbzzj);
			$('#txtsbzzj').val(parent.YMLib.Var.row.sbzzj);
			queryZjzj();
		});
		function queryZjzj(){
			grid.id="zjzjList";
			grid.url="../../../jhgl/queryZjzjByXmid.do";
			var params={'zjzj.planId':parent.YMLib.Var.row.xmbm};
			grid.queryParams=params;
			grid.height=150;
			grid.width=300;
			grid.fitColumns=true;
			grid.columns=[[
				{field:'nf',title : '追加年份',width : 100,align : 'center'}, 
				{field : 'ztz',title : '追加总资金',width : 150,align : 'center'},
				{field : 'bbzje',title : '追加部投资',width : 150,align : 'center'}, 
				{field : 'stz',title : '追加省投资',width : 150,align : 'center'}]];
			gridBind1(grid);
		}
		function jine(obj){
			var number=/^[0-9]*$/;
			if(!number.test($(obj).val())){
				alert("请输入数字！");
				$(obj).focus();
			}else{
				$('#pfztz').html(Number(parent.YMLib.Var.row.pfztz)+Number($('#txtztz').val()));
				$('#bbzzj').html(Number(parent.YMLib.Var.row.bbzzj)+Number($('#txtbbz').val()));
				$('#sbzzj').html(Number(parent.YMLib.Var.row.sbzzj)+Number($('#txtstz').val()));
				$('#txtpfztz').val(Number(parent.YMLib.Var.row.pfztz)+Number($('#txtztz').val()));
				$('#txtbbzzj').val(Number(parent.YMLib.Var.row.bbzzj)+Number($('#txtbbz').val()));
				$('#txtsbzzj').val(Number(parent.YMLib.Var.row.sbzzj)+Number($('#txtstz').val()));
			}
		}
		function nian(obj){
			var number=/^[0-9]{4}$/;
			if(!number.test($(obj).val())){
				alert("请输入四位数字的年份！");
				$(obj).focus();
				return;
			}
		}
		function submit(){
			if($('#zjnf').val()==''){
				alert("请输入年份！");
				return;
			}
			$('#updateForm').ajaxSubmit({
				dataType:'json',
				success:function(msg){
					if(msg.result){
						var zjzj={'zjzj.planId':parent.YMLib.Var.row.xmbm,'zjzj.nf':$('#zjnf').val(),
								'zjzj.bbzje':$('#txtbbz').val(),'zjzj.ztz':$('#txtztz').val(),
								'zjzj.stz':$('#txtstz').val()};
						$.ajax({
							type:'post',
							url:'../../../jhgl/insertZjzj.do',
							data:zjzj,
							dataType:'json',
							success:function(data){
							}
						});
						alert("资金追加成功！");
						closeWindow("zjzj");
					}
				},
				error:function(msg){
					alert("修改失败！");
				}
			});
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
					<input id="zjnf" onblur="nian(this)" type="text" width="150" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 10%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加总投资：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 10%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtztz" onblur="jine(this)" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 10%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加部补助资金：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 10%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtbbz" onblur="jine(this)" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 10%; padding-right: 5px;">
					<font color="#009ACD" style="cursor: hand; font-size: 12px">追加省补助资金：</font>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 10%; text-align: left; padding-left: 10px; font-size: 12px;">
					<input id="txtstz" onblur="jine(this)" type="text" width="150" value="0"/>万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="2" style="border-right: 1px solid #C0C0C0;border-top: 1px none #C0C0C0;border-bottom: 1px solid #C0C0C0; width: 10%; text-align:center; padding-left: 10px; font-size: 12px;">
					<form id="updateForm" action="../../../qqgl/updateJhshxx.do">
						追加后总投资：<font id="pfztz"></font>&nbsp;万元，部补助资金：<font id="bbzzj"></font>&nbsp;万元，省补助资金：<font id="sbzzj"></font>&nbsp;万元。
						<input id="xmbm" name="xmbm" type="hidden"/>
						<input id="xdzt" name="xdzt" value="1" type="hidden"/>
						<input id="xmlx" name="xmlx" type="hidden"/>
						<input id="txtpfztz" name="pfztz" type="hidden"/>
						<input id="txtbbzzj" name="bbzzj" type="hidden"/>
						<input id="txtsbzzj" name="sbzzj" type="hidden"/>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<img id="imgAdd" onclick="submit()" alt="添加" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src="../../../images/Button/tianj1.gif" style="border-width: 0px; cursor: hand;" />
					<img onclick="closeWindow('zjzj')" alt="返回" src="../../../images/Button/fanhui1.GIF" onmouseover="this.src='../../../images/Button/fanhui2.GIF'" onmouseout="this.src='../../../images/Button/fanhui1.GIF'" style="border: 0">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<table id="zjzjList" width="100%" height="90%" cellpadding="0" cellspacing="0" border="1" style="padding-top: 10px;"></table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>