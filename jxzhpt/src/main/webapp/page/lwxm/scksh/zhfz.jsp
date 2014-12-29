<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库审核灾害防治项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Menu.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
$(function(){
	sckshZhfz();
	$("#cc").combotree({
		checkbox: false,
	 	url: "../js/gydw.json",
	});
	$("#ss").combotree({
		checkbox: false,
	 	url: "../js/xzqh.json",
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
	<table align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr><td>
		<div id="righttop">
		<div id="p_top">路网项目>&nbsp;项目审查库审核>&nbsp;灾害防治项目</div>
		</div>
		</td></tr>
		<tr>
			<td align="left" style="padding-left:10px; padding-right:25px;">
				<fieldset style="width:1080px;text-align:left;vertical-align:middle;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<p style="margin:8px 0px 4px 20px;">
								<span>管养单位：</span>
                              	<select id="cc" style="width:218px">
                              	</select>
                             	<span>&nbsp;行政区划：</span>
                              	<select id="ss" style="width:218px">
                              	</select>
                               <span>&nbsp;路线名称：</span>
        						<input type="text" id="txtRoad" style="width:212px;" />
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="cc1" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="2014年">2014年</option>
									<option value="2013年">2013年</option>
									<option value="2012年">2012年</option>
									<option value="2011年">2011年</option>
                              	</select>
                              <span>&nbsp;项目状态： </span>
                              	<select id="ss1" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">待上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">已入库</option>
									<option value="已审核">已下达</option>
                              	</select>
                               <span>&nbsp;审核状态：</span>
                              	<select id="ss2" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
                              	</select>
                              <span>&nbsp;特殊地区：</span>
                              	<select id="ss4" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
                              	</select>
                              <span>&nbsp;技术等级：</span>
                              	<select id="ss5" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="1">一级公路</option>
									<option value="2">二级公路</option>
									<option value="3">三级公路</option>
									<option value="4">四级公路</option>
									<option value="5">等外公路</option>
                              	</select>
                              	<span>&nbsp;公路等级：</span>
                              	<select id="ss6" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="G">国道</option>
									<option value="S">省道</option>
									<option value="X">县道</option>
									<option value="Y">乡道</option>
									<option value="C">村道</option>
									<option value="Z">专道</option>
                              	</select>
                             </p>
                             <p style="margin:8px 0px 4px 20px;">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" style="border-width:0px;cursor: hand;" />
								<img name="shenPi" id="shenPi" src="../../../images/Button/sp1.jpg" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'   " src="" onclick="shenPi();" style="border-width:0px;" />
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
							</p>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="abgc1" style="font-weight: bold; color: #FF0000">3</span>&nbsp;】个灾害防治项目，
        					总里程共【&nbsp;<span id="abgc2" style="font-weight: bold; color: #FF0000">53.456</span>&nbsp;】公里，
        					隐患里程共【&nbsp;<span id="abgc3" style="font-weight: bold; color: #FF0000">15.100</span>&nbsp;】公里。</td>
        </tr>
         <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
       		 <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
