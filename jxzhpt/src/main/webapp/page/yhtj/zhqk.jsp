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
<script type="text/javascript" src="./js/zhqk.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
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
<script type="text/javascript">

$(function(){
	loadUnit("gydw1",'36');
	var date = new Date();
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate(); 
	var m1;
	var y1;
	if(m==1){
		m1=12;
		y1=y-1;
	}else{
		m1=m-1;
		y1=y;
	}
	if(m<=9){
		m='0'+m;
	}
	if(m1<=9){
		m1='0'+m1;
	}
	if(d<=9){
		d='0'+d;
	}
	$("#kssj").datebox({     
	});  
	$("#jssj").datebox({    
	});  
	$('#kssj').datebox('setValue', y1+"-"+m1+"-"+d);
	$('#jssj').datebox('setValue',  y+"-"+m+"-"+d);
	showAll();
});

</script>
<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;灾毁情况统计>&nbsp;灾害损失情况</div>
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
 						<select id="gydw1" style="width:150px;">
 						</select>
 						<span>上报时间：</span>
        				<input type="text" id="kssj"/>
						</select>
						<span>至：</span>
						<input type="text" id="jssj"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="showAll()">查询</a>
 						<a id="yhgl_btn_add" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="zhqkadd()">添加</a>
 					</p>
 			</fieldset>
      </td>
   </tr>
	       <tr>
	            <td width="100%" style="padding-top: 1%;padding-left:10px;">
	                 <div>
    					<table id="zhqk_table" ></table>
   					</div>
				</td>
			</tr>	
		</table>
	</div>
</body>
</html>
