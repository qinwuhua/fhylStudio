<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目字段选择列表</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/sjcx.js"></script>
<script type="text/javascript">
	$(function(){
		$("#save_button").click(function(){
			parent.$.messager.alert('提示','查询成功！','info'); 
			parent.$('#zd_xz').window('destroy');
		});
		$("#qx_window").click(function(){
			parent.$('#zd_xz').window('destroy');
		});	
	
		// 全选
/*         $("#qx").bind("click", function () {
            $("[name = checkbox]:checkbox").attr("checked", true);
        }); */

        // 全不选
        $("#bx").bind("click", function () {
            $("[name = checkbox]:checkbox").attr("checked", false);
        });

        // 反选
        $("#fx").bind("click", function () {
            $("[name = checkbox]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器1
        $("#qx1").bind("click", function () {
        	$(".part1").attr("checked", true);
        });
        $("#bx1").bind("click", function () {
            $(".part1").attr("checked", false);
        });
        $("#fx1").bind("click", function () {
            $(".part1").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器2
        $("#qx2").bind("click", function () {
        	$(".part2").attr("checked", true);
        });
        $("#bx2").bind("click", function () {
            $(".part2").attr("checked", false);
        });
        $("#fx2").bind("click", function () {
            $(".part2").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器3
        $("#qx3").bind("click", function () {
        	$(".part3").attr("checked", true);
        });
        $("#bx3").bind("click", function () {
            $(".part3").attr("checked", false);
        });
        $("#fx3").bind("click", function () {
            $(".part3").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
	});
</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
<center>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="2" cellspacing="1">
			<tr  style="height: 30px;">
				<td colspan="2" style="background-color: #ffffff;width:25%" align="center">项目基本信息</td>
				<td colspan="2" style="background-color: #ffffff;width:35%" align="center">年度计划</td>
				<td colspan="3"  style="background-color: #ffffff;" align="center">施工进展</td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="2" style="background-color: #ffffff;width:25%" align="center">
					<input  type="radio" value="qx" name="radio1" id="qx1"/>全选
					<input  type="radio" value="fx" name="radio1" id="fx1"/>反选
					<input  type="radio" value="bx" name="radio1" id="bx1"/>不选</td>
				<td colspan="2" style="background-color: #ffffff;width:35%" align="center">
					<input  type="radio" value="qx" name="radio2" id="qx2"/>全选
					<input  type="radio" value="fx" name="radio2" id="fx2"/>反选
					<input  type="radio" value="bx" name="radio2" id="bx2"/>不选</td>
				<td colspan="3" style="background-color: #ffffff;width:35%" align="center">
					<input  type="radio" value="qx" name="radio3" id="qx3"/>全选
					<input  type="radio" value="fx" name="radio3" id="fx3"/>反选
					<input  type="radio" value="bx" name="radio3" id="bx3"/>不选</td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="lxmc" name="checkbox" class="part1"/>路线名称</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="lxbm" name="checkbox" class="part1"/>路线编码</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="fapgdw" name="checkbox" class="part2"/>方案评估单位</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="fascdw" name="checkbox" class="part2"/>方案审查单位</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="bywctzb" name="checkbox" class="part3"/>本月完成投资部</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="bywctzs" name="checkbox" class="part3"/>本月完成投资省</td>
				<td style="background-color: #ffffff;" align="left">
					<input  type="checkbox" value="bywctzqt" name="checkbox" class="part3"/>本月完成投资其他</td>	
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="gydw" name="checkbox" class="part1"/>管养单位</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="xzqhmc" name="checkbox" class="part1"/>行政区划</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="faspsj" name="checkbox" class="part2"/>方案审批时间</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="spwh" name="checkbox" class="part2"/>审批文号</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="zjbt" name="checkbox" class="part3"/>本月资金到位部投</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="zjst" name="checkbox" class="part3"/>本月资金到位省投资</td>
				<td style="background-color: #ffffff;" align="left">
					<input  type="checkbox" value="zjqt" name="checkbox" class="part3"/>本月资金到位其他投资</td>	
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="qdzh" name="checkbox" class="part1"/>起点桩号</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="zdzh" name="checkbox" class="part1"/>止点桩号</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="tzgs" name="checkbox" class="part2"/>投资估算</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="jsxz" name="checkbox" class="part2"/>建设性质</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="bywggl" name="checkbox" class="part3"/>本月完工公里</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="shzt" name="checkbox" class="part3"/>审核状态</td>
				<td style="background-color: #ffffff;" align="left">
					<input  type="checkbox" value="shr" name="checkbox" class="part3"/>审核人</td>	
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="zlc" name="checkbox" class="part1"/>总里程</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="yhlc" name="checkbox" class="part1"/>隐患里程</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="jsnr" name="checkbox" class="part2"/>建设内容</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="jsjsbz" name="checkbox" class="part2"/>建设技术标准</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="shsj" name="checkbox" class="part3"/>审核时间</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="kgdl" name="checkbox" class="part3"/>开工段落</td>
				<td style="background-color: #ffffff;" align="left">
					<input  type="checkbox" value="qksm" name="checkbox" class="part3"/>情况说明</td>	
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="lxjsdj" name="checkbox" class="part1"/>路线技术等级</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="tsdq" name="checkbox" class="part1"/>特殊地区</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="sftqss" name="checkbox" class="part2"/>是否提前实施</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="sbnf" name="checkbox" class="part2"/>上报年份</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="zjje" name="checkbox" class="part3"/>追加金额</td>
				<td style="background-color: #ffffff;width:12%" align="left">
					<input  type="checkbox" value="csyj" name="checkbox" class="part3"/>相关处室意见</td>
				<td style="background-color: #ffffff;" align="left">
					<input  type="checkbox" value="cscyj" name="checkbox" class="part3"/>财审处意见</td>	
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="xmnf" name="checkbox" class="part1"/>项目年份</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="xmzt" name="checkbox" class="part1"/>项目状态</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="jhkgsj" name="checkbox" class="part2"/>计划开工时间</td>
				<td style="background-color: #ffffff;width:10%" align="left">
					<input  type="checkbox" value="jhwgsj" name="checkbox" class="part2"/>计划完工时间</td>
				<td colspan="3"style="background-color: #ffffff;width:10%" align="left"></td>	
			</tr>
			<tr>
				<td colspan="7" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确认</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
			</center>
</body>
</html>