<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>养护中心</title>
<link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/css/style.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
<script type="text/javascript" src="/jxzhpt/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="/jxzhpt/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="/jxzhpt/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="/jxzhpt/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="/jxzhpt/page/qqgl/js/util.js"></script>
<script type="text/javascript" src="/jxzhpt/page/qqgl/lxsh/js/sjgz.js"></script>

<script type="text/javascript">

$(function(){
	loadylx('lxbm');
	loadDist1("xzqh",$.cookie("dist"));
	xmnfs2w("xmnf");
	
	querySflgc();
});
function querySflgc(){
	
	grid.id="grid";
	grid.url="/jxzhpt/qqgl/queryszxm.do";
	var xzqhdm=$("#xzqh").combotree("getValues");var xzqhstr="";
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var xmnf=$("#xmnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var params={'jhsh.xzqhdm':xzqhstr,
				'jhsh.xmmc':$('#xmmc').val(),
				'jhsh.xmnf':xmnf,
				'jhsh.lxmc':$('#lxmc').val(),
				'jhsh.xmbm':$('#xmbm').val(),
				'jhsh.sbzt':null,
				'jhsh.shzt':null,
				'jhsh.xdzt':null,
				'jhsh.xmlx1':'yhzxcx'
				};
	grid.queryParams=params;
	loadLj(params);
	grid.height=$(window).height()-150;
	grid.width=$('#searchField').width();
	grid.pageSize=10;
	grid.pageNumber=1;
	grid.columns=[[
				{field: 'SZDS', title: '所在地市', width: 120, align: 'center'},
				{field: 'XMMC', title: '项目名称', width: 120, align: 'center'},
				{field: 'JB', title: '级别', width: 60, align: 'center'},
		        {field: 'XZQHXJ', title: '行政区划', width: 60, align: 'center'},
		        {field: 'GYDW', title: '管养单位', width: 120, align: 'center'},
		        {field: 'GHLXBM', title: '规划路线编码', width: 120, align: 'center'},
		        {field: 'GHLXMC', title: '规划路线名称', width: 120, align: 'center'},
		        {field: 'YLXBM', title: '原路线编码', width: 120, align: 'center'},
		        {field: 'YLXMC', title: '原路线名称', width: 120, align: 'center'},
		        {field: 'YLXZH', title: '原路线桩号', width: 120, align: 'center'},
		        {field: 'YDBMC', title: '原道班名称', width: 120, align: 'center'},
		        {field:'ZTZ',title:'总投资(万元)',width:100,align:'center'},
				{field:'ZBZ',title:'奖补资金总金额(万元)',width:60,align:'center'},
				{field:'YXD',title:'已下达计划补助资金（万元）',width:100,align:'center'},
				{field:'BCXDHJ',title:'本次计划下达（万元）',width:100,align:'center'},
				{field:'BCSBZ',title:'本次省补助资金（万元）',width:100,align:'center'},
				{field:'BCJL',title:'本次重点打造奖励（万元）',width:100,align:'center'},
				{field:'DFZC',title:'地方自筹(万元)',width:100,align:'center'},
				{field: 'SGTWH', title: '施工图批复文号', width: 120, align: 'center'},
			    {field: 'JHXDWH', title: '计划下达文号', width: 120, align: 'center'},
			    {field: 'JHXDSJ', title: '计划下达时间', width: 120, align: 'center'},
			    {field: 'BZ', title: '备注', width: 120, align: 'center'}
				]];
	gridBind1(grid);
}

function loadLj(params){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryJhshLjsyfs2w.do',
		data:params,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				$('#xmsl').html(msg.XMSL);
				$('#ztz').html(msg.ZTZ);
				
			}
			
		}
	});
}

</script>

<style type="text/css">
TD {font-size: 12px;}
a {text-decoration: none;}
.abgc_td td {padding-right: 5px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">
			计划管理>&nbsp;<span id="astext">计划查询</span>>&nbsp;养护中心
		</div>
	</div>
	<table width="99.5%" border="0"
		style="margin-top: 1px; margin-left: 1px;" cellspacing="0"
		cellpadding="0">
		<tr>
			<td align="left"
				style="padding-left: 10px; padding-right: 10px; padding-top: 5px;">
				<fieldset id="searchField"
					style="width: 100%; text-align: left; vertical-align: middle;">
					<legend
						style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
						<font style="color: #0866A0; font-weight: bold"></font>
					</legend>
					<div>
						<table style="margin: 5px; vertical-align: middle;"
							cellspacing="0" class="abgc_td">
							<tr height="32">
								<td align="right">行政区划：</td>
								<td><select id="xzqh" style="width: 134px;"></select></td>
								<td align="right">项目名称：</td>
								<td><input name="xmmc" id="xmmc" style="width: 100px;"
									type="text" /></td>
								<td align="right">项目年份：</td>
								<td><select id="xmnf" style="width: 100px;"></select></td>
								
							</tr>
							
							<tr height="32">
								<td colspan="8"><img onclick="querySflgc()" alt="搜索"
									src="/jxzhpt/images/Button/Serch01.gif"
									onmouseover="this.src='/jxzhpt/images/Button/Serch02.gif'"
									onmouseout="this.src='/jxzhpt/images/Button/Serch01.gif'"
									style="vertical-align: middle; padding-left: 8px;" /> <!-- 								<img onclick="plscbtn()" alt="批量上传计划下达文件" src="/jxzhpt/images/plsc.png" style="vertical-align:middle;width: 90px;height: 23px;"> -->
									<!-- <img onclick="exportJhshxx()" id="btnShangbao"
									onmouseover="this.src='/jxzhpt/images/Button/dcecl2.gif'"
									alt="导出"
									onmouseout="this.src='/jxzhpt/images/Button/dcecl1.gif'"
									src="/jxzhpt/images/Button/dcecl1.gif"
									style="border-width: 0px; cursor: hand; vertical-align: middle;" /> -->
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 10px; padding-top: 3px; font-size: 12px;">
				<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		总投资【<span id="ztz" style="color: red;">0</span>】万元.
            		</div>

				<div>
					<table id="grid"></table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>