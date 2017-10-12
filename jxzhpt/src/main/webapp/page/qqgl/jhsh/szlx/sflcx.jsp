<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>示范路工程</title>
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
	loadDist1("xzqh",$.cookie("dist"));
	loadUnit1("gydw",$.cookie("unit"));
	if(getUrlParame('id')=='010113040205')
	xmnfs3w("scxdnf");
	else
	xmnfs2w("scxdnf");
	jhxdwhdx("jhxdwh",'sfl');
	querySflgc();
});
function querySflgc(){
	
	var xmnf='';
	if(getUrlParame('id').substr(0,10)=='0101130301')
		xmnf='2011,2012,2013,2014,2015';
	if(getUrlParame('id').substr(0,10)=='0101130302')
		xmnf='2011,2012,2013,2014,2015,2016,2017,2018,2019,2020';
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
	var scxdnf=$("#scxdnf").combobox("getValues").join(",");
	if(scxdnf.substr(0,1)==',')
		scxdnf=scxdnf.substr(1,scxdnf.length);
	var jhxdwh=$("#jhxdwh").combobox("getText");
	if(jhxdwh.substr(0,1)==',')
		jhxdwh=jhxdwh.substr(1,jhxdwh.length);
	var params={'jhsh.xzqhdm':xzqhstr,
				'jhsh.xmmc':$('#xmmc').val(),
				'jhsh.xmnf':xmnf,
				'jhsh.lxmc':$('#lxmc').val(),
				'jhsh.xmbm':$('#xmbm').val(),
				'jhsh.sbzt':null,
				'jhsh.shzt':null,
				'jhsh.xdzttj':null,
				'jhsh.xmlx1':'sflcx',
				'jhsh.ghlxbm':$('#ghlxbm').val(),
				'jhsh.ghlxmc':$('#ghlxmc').val(),
				'jhsh.ylxbm':$('#ylxbm').val(),
				'jhsh.ylxmc':$('#ylxmc').val(),
				'jhsh.jhxdwh':jhxdwh,
				'jhsh.scxdnf':scxdnf
				
				};
	ljparam=params;
	loadLj();
	
	
	$('#grid').datagrid({    
	    url:'/jxzhpt/qqgl/querySzxmList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-20,
	    queryParams: params,
	    columns:[[
    	{field:'CZ',title:'操作',width:100,align:'center',
			formatter: function(value,row,index){
				var result="";
				result='<a href="javascript:szxmXdInfo('+"'"+index+"','sfl'"+')" style="color:#3399CC;">详情&nbsp;&nbsp;</a>';
				return result;
				}
		},
		{field: 'XMMC', title: '项目名称', width: 120, align: 'center'},
        {field: 'XMLX', title: '项目类型', width: 60, align: 'center'},
        {field: 'XZQH', title: '行政区划', width: 60, align: 'center'},
        {field: 'XLXBM', title: '规划路线编码', width: 120, align: 'center'},
        {field: 'XLXMC', title: '规划路线名称', width: 120, align: 'center'},
        {field: 'GHQDZH', title: '规划起点桩号', width: 120, align: 'center'},
        {field: 'GHZDZH', title: '规划止点桩号', width: 120, align: 'center'},
        {field: 'YLXBM', title: '原路线编码', width: 120, align: 'center'},
        {field: 'YLXMC', title: '原路线名称', width: 120, align: 'center'},
        {field: 'YQDZH', title: '原起点桩号', width: 120, align: 'center'},
        {field: 'YZDZH', title: '原止点桩号', width: 120, align: 'center'},
        {field: 'JSDJ', title: '技术等级', width: 120, align: 'center'},
		{field:'ZLC',title:'里程(公里)',width:100,align:'center'},
        {field:'ZTZ',title:'总投资(万元)',width:100,align:'center'},
		{field:'TBZ',title:'省补助(万元)',width:60,align:'center'},
		{field:'TBZ_JAF',title:'建安费(万元)',width:70,align:'center'},
		{field:'TBZ_GCJLF',title:'工程监理费(万元)',width:80,align:'center'},
	    {field:'TBZ_QQGZF',title:'前期工作费(万元)',width:80,align:'center'},
	    {field: 'PFWH', title: '施工图批复文号', width: 120, align: 'center'},
	    {field: 'BZ', title: '备注', width: 120, align: 'center'}
	    ]]  
	}); 
}

var ljparam;
function loadLj(){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryJhshLjSzxm.do',
		data:ljparam,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				$('#xmsl').html(msg.XMSL);
				$('#ztz').html(msg.ZTZ);
				$('#zbz').html(msg.ZBZ);
				$('#xdztz').html(msg.XDZTZ);
				$('#xdstz').html(msg.XDSTZ);
				$('#xddfzc').html(msg.XDDFZC);
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
			计划管理>&nbsp;<span id="astext">计划查询</span>>&nbsp;示范路工程
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
						<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
        						<tr height="32">
								<td align="right">行政区划：</td>
								<td><select id="xzqh" style="width: 144px;"></select></td>
								<td align="right">项目名称：</td>
								<td><input name="xmmc" id="xmmc" style="width: 100px;"
									type="text" /></td>
								<td align="right">规划路线编码：</td>
								<td><input name="ghlxbm" id="ghlxbm" style="width: 100px;"
									type="text" /></td>
								<td align="right">原路线编码：</td>
								<td><input name="ylxbm" id="ylxbm" style="width: 100px;"
									type="text" /></td>
								
								
							</tr>
							<tr height="32">
								<td align="right">计划下达文号：</td>
								<td><select id="jhxdwh" class="easyui-combobox"
									style="width: 144px;">
								</select></td>
								<td align="right">首次下达年份：</td>
								<td><select id="scxdnf" style="width: 104px;"></select></td>
								
								<td align="right">规划路线名称：</td>
								<td><input name="ghlxmc" id="ghlxmc" style="width: 100px;"
									type="text" /></td>
								
								<td align="right">原路线名称：</td>
								<td><input name="ylxmc" id="ylxmc" style="width: 100px;"
									type="text" /></td>
								
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
				<div>
            		项目【<span id="xmsl" style="color: red;">0</span>】个,
            		总投资【<span id="ztz" style="color: red;">0</span>】万元,
            		补助合计【<span id="zbz" style="color: red;">0</span>】万元,
            		已下达【<span id="xdztz" style="color: red;">0</span>】万元,
            		其中：省补【<span id="xdstz" style="color: red;">0</span>】万元,
            		地方自筹【<span id="xddfzc" style="color: red;">0</span>】万元。
            		</div>

				<div>
					<table id="grid"></table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>