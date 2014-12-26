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
<script type="text/javascript" src="./easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="./js/YMLib.js"></script>
<script type="text/javascript" src="./js/util/jquery.cookie.js"></script>
<script type="text/javascript">
var c1 = true;
var c2 = true;
var c3 = true;
var c4 = true;
var c5 = true;
var c6 = true;
var c7 = true;
$(function(){
	$("#Menu_1").addClass('now');
	$("#c1f").attr("src", "./page/lkpd/Menu.jsp");
	
	$("#Menu_1,#Menu_2,#Menu_3").click(function(e){
		$("#Menu_1,#Menu_2,#Menu_3").removeClass('now');
		$("#" + this.id).addClass('now');
	});
    
    $("#Menu_1").click(function () {
        $("#c2,#c3").hide();
        $("#c1").show();
        if (c1){
            $("#c1f").attr("src", "page/lkpd/Menu.jsp");
        }
    });

    $("#Menu_2").click(function () {
        $("#c1,#c3").hide();
        $("#c2").show();
        if (c2) {
            $("#c2f").attr("src", "page/jtltj/Menu.jsp");
        }
    });
    //计划管理
    $("#Menu_3").click(function () {
        $("#c1,#c2").hide();
        $("#c3").show();
        if (c3) {
            $("#c3f").attr("src", "page/yhtj/Menu.jsp");
        }
    });
});

function edit(){
	YMLib.UI.createWindow('updatePassword', '*  修改密码', 'page/xtgl/updatePassword.jsp','updatePassword', 460,320);
}
</script>
</head>
<body id="index_layout" class="easyui-layout">
    <div data-options="region:'north',border:false" style="height: 98px;" >
		<div class="header">
			<div class="header_content3">
			    <div style="position:absolute;top:15px;right:250px;color:#f2f8fe;font-family:arial;line-height:1.5em;">欢迎您：<span id="index_user">admin</span></div>
			    <div class="system"><a onclick="edit()" href="javascript:void(0)">修改密码</a><em>|</em>
			    	<a href="./index.jsp" target="_self">返回首页</a><em>|</em>
			    	<a href="./login.jsp" target="_self">退出系统</a></div>
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
    <div data-options="region:'south',border:false,split:false" style="height: 25px;color:#FFF;line-height: 25px; background: url(image/footerbg.gif) 0 0 repeat-x; text-align: center;overflow: hidden;">
        <p>版权所有：江西省公路管理局 &nbsp;&nbsp;&nbsp;&nbsp; 技术支持：北京恒达时讯科技开发有限责任公司</p>
    </div>
</body>
</html>