<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修详细</title>
	<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../js/jquery-form.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			loadBmbm2('jsdj','技术等级');
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryXmsqByXmbm.do',
				data:'xmlx='+4+'&xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(msg){
					loadDist("xzqh1",msg.xzqhdm);
					loadUnit("gydw1",msg.gydwdm);
					$('#submit').form("load",msg);
					$('#xmbm1').val(msg.xmbm);
					$('#xmbm1').attr("disabled","disabled");
					$('#xmlx').val(4);
				}
			});
		});
		function update(){
			$('#gydw').val($('#gydw1').combo("getText"));
			$('#gydwdm').val($('#gydw1').combo("getValue"));
			$('#xzqh').val($('#xzqh1').combo("getText"));
			$('#xzqhdm').val($('#xzqh1').combo("getValue"));
			var result=true;
			result = validateText('ylxbh',null,result);
			result = validateText('ghlxbh',null,result);
			result = validateText('lmkd','number',result);
			result = validateText('qdzh','number',result);
			result = validateText('zdzh','number',result);
			result = validateText('lc','number',result);
			result = validateText('xmmc',null,result);
			if(!result){
				return;
			}
			$('#submit').ajaxSubmit({
				dataType:'json',
				success:function(msg){
					if(msg.result){
						alert("计划修改成功！");
						closeWindow("yhdzxedit");
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
	<div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:100%;">
		<form id="submit" action="../../../qqgl/updateXmsq.do">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路线编号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ylxbh" name="ylxbh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
					<input id="xmlx" name="xmlx" value="4" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划路线编号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ghlxbh" name="ghlxbh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					路面宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lmkd" name="lmkd" type="text" style="width: 80px;"/>&nbsp;米&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					起点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="qdzh" name="qdzh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					止点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zdzh" name="zdzh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lc" name="lc" type="text" style="width: 80px;"/>&nbsp;km&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jsdj" name="jsdj" type="text" style="width: 124px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					行政区划</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xzqh1" name="xzqh1" type="text" style="width: 124px;"/>
					<input id="xzqh" name="xzqh" type="hidden"/>
					<input id="xzqhdm" name="xzqhdm" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					管养单位</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gydw1" name="gydw1" type="text" style="width: 120px;"/>
					<input id="gydw" name="gydw" type="hidden"/>
					<input id="gydwdm" name="gydwdm" type="hidden"/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					项目编码</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xmbm1" name="xmbm1" type="text" style="width: 120px;"/>
					<input id="xmbm" name="xmbm" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xmmc" name="xmmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					拟投资</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ntz" name="ntz" type="text" style="width: 80px;"/>&nbsp;万元
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划开工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhkgsj" name="jhkgsj" type="text" class="easyui-datebox" style="width: 124px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					计划完工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhwgsj" name="jhwgsj" type="text" class="easyui-datebox" style="width: 120px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工期</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gq" name="gq" type="text" style="width: 80px;"/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					工程分类</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gcfl" name="gcfl" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					特殊地区</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="tsdq" name="tsdq" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"></td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
            </tr>
            <tr style="height: 70px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设方案</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<textarea id="jsfa" name="jsfa" rows="" cols="" style="width: 650px;height: 60px;"></textarea>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="update()" alt="确定" src="../../../images/Button/qd1.gif" onmouseover="this.src='../../../images/Button/qd2.gif'" onmouseout="this.src='../../../images/Button/qd1.gif' " />
                </td>
            </tr>
		</table>
		</form>
	</div>
</body>
</html>