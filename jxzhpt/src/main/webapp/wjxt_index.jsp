<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<title>江西省公路业务综合管理平台</title>
<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="./css/Top.css" />
<link rel="stylesheet" type="text/css" href="./css/index2.css" />
 <link rel="stylesheet" type="text/css" href="./css/style.css" />
<script type="text/javascript" src="./easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="./js/YMLib.js"></script>
<script type="text/javascript" src="page/wjsjxt/js/init.js"></script>
<script type="text/javascript" src="./js/util/jquery.cookie.js"></script>
</head>
<body id="index_layout" class="easyui-layout">
    <div data-options="region:'north',border:false" style="height: 100px;" >
		<div class="header">
			<div class="header_content">
			    <div style="position:absolute;top:15px;right:370px;color:#f2f8fe;font-family:arial;line-height:1.5em;">欢迎您：<span id="index_user"></span></div>
			    <div id="www_zzje_net2" style="position:absolute;top:15px;right:230px;color:#f2f8fe;font-family:arial;line-height:1.5em;"></div>
			    <div id="www_zzje_net1" style="position:absolute;top:15px;right:170px;color:#f2f8fe;font-family:arial;line-height:1.5em;"></div>
			    <div class="system"><a onclick="edit()" href="javascript:void(0)">修改密码</a><em>|</em><a id="" onclick="exit()" href="javascript:void(0)">退出系统</a></div>
				<ul class="nav">
					<li id="d1"><a id="Menu_1" href="javascript:void(0)">路况评定</a></li>
					<li id="d2"><a id="Menu_2" href="javascript:void(0)">交通量统计</a></li> 
					<li id="d3"><a id="Menu_3" href="javascript:void(0)">养护统计</a></li>
				</ul>
			</div>
		</div>
	</div>
    <div data-options="region:'center',border:'false'" style="margin: 0px; padding: 0px;overflow: hidden">
		<div id="c1" style="width:100%;height:100%;">
			<iframe id="c1f" name="c1f"  src="" frameborder='0' height='100%' width='100%'></iframe>
		</div>
		<div id="c2" style="width:100%;height:100%;display:none">
			<iframe id="c2f" name="c2f"  src="" frameborder='0' height='100%' width='100%'></iframe>
		</div>
		<div id="c3" style="width:100%;height:100%;display:none">
			<iframe id="c3f" name="c3f"src="" frameborder='0' height='100%' width='100%'></iframe>
		</div>
		
    </div>
    <div data-options="region:'south',border:false,split:false" style="height: 25px;line-height: 25px; background: url(image/footerbg.gif) 0 0 repeat-x; text-align: center;overflow: hidden;">
        <p>监制单位：江西省公路管理局&nbsp;&nbsp;&nbsp;&nbsp;技术支持：北京恒达时讯科技开发有限公司</p>
    </div>
</body>
</html>