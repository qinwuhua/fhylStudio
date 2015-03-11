<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色分配管理</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/trqk.js"></script>
<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
 cursor: pointer;
}
a:active {
 text-decoration: none;
}
-->
</style>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">

$(function(){
	loadUnit("gydw",'36');
	$("#ddlYear").val();
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1; 
	for(var x=y;x>=2010;x--){
		$("#ddlYear").append("<option value="+x+">"+x+"</option>");
	}
	$("#yf"+m).attr("selected","selected");
	showAll();
});
</script>
<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;灾毁情况统计>&nbsp;公路水毁抢修人财物投入情况</div>
		</div>
		</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
						<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<p style="margin: 1% 0% 1% 2%;">
 						<span>管养单位：</span>
 						<select id="gydw" style="width:150px;">
 						</select>
 						<span>上报年份：</span>
        				<select name="ddlYear" id="ddlYear" style="width: 60px;">
						</select>
						<span>上报月份：</span>
						<select name="ddlMonth" id="ddlMonth">
							<option id="yf1" value="01">01</option>
							<option id="yf2" value="02">02</option>
							<option id="yf3" value="03">03</option>
							<option id="yf4" value="04">04</option>
							<option id="yf5" value="05">05</option>
							<option id="yf6" value="06">06</option>
							<option id="yf7" value="07">07</option>
							<option id="yf8" value="08">08</option>
							<option id="yf9" value="09">09</option>
							<option id="yf10" value="10">10</option>
							<option id="yf11" value="11">11</option>
							<option id="yf12" value="12">12</option> 
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="false" iconCls="icon-search" onclick="showAll()">查询</a>
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="false" iconCls="icon-add" onclick="trqkadd()">添加</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0)" class="easyui-linkbutton" plain="false" >导出Excel</a>
 					</p>
 			</fieldset>
      </td>
   </tr>
	       <tr>
	            <td width="100%" style="padding-top: 1%;padding-left:10px;">
	                 <div>
    					<table id="trqk_table" ></table>
   					</div>
				</td>
			</tr>	
		</table>
	</div>
</body>
</html>
