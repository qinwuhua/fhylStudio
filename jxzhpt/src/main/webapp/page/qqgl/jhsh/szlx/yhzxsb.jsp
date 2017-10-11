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

<script type="text/javascript">

$(function(){
	loadDist1("xzqh",$.cookie("dist"));
	if(getUrlParame('id')=='010113010206')
	xmnfs3w("xmnf");
	else
	xmnfs2w("xmnf");
	
	querySflgc();
});

var ljparam;
function querySflgc(){
	
	grid.id="grid";
	grid.url="/jxzhpt/qqgl/querySzxmList.do";
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
				'jhsh.sbzt':$("#sbzt").combo('getValue'),
				'jhsh.shzt':null,
				'jhsh.xdzttj':null,
				'jhsh.xmlx1':'yhzxsb',
				'jhsh.ghlxbm':$('#ghlxbm').val(),
				'jhsh.ghlxmc':$('#ghlxmc').val(),
				'jhsh.ylxbm':$('#ylxbm').val(),
				'jhsh.ylxmc':$('#ylxmc').val(),
				'jhsh.jhxdwh':''
				
				
				};
	grid.queryParams=params;
	ljparam=params;
	loadLj();
	grid.height=$(window).height()-175;
	grid.width=$('#searchField').width();
	grid.pageSize=10;
	grid.pageNumber=1;
	grid.columns=[[	{field:'ck',checkbox:true},
					{field:'CZ',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result="";
						result='<a href="javascript:szxmInfo('+"'"+index+"','yhzx'"+')" style="color:#3399CC;">详情&nbsp;&nbsp;</a>';
						if(row.SBZT=='1')
							result+='编辑&nbsp;&nbsp;';	
						else
							result+='<a href="javascript:editSzxm('+"'"+index+"','yhzx'"+')" style="color:#3399CC;">编辑&nbsp;&nbsp;</a>';
							return result;
						}
					},
					{field:'sbzt',title:'上报状态',width:60,align:'center',
						formatter: function(value,row,index){
							var result="";
							if(row.SBZT=='1')
								result='已上报';
							else
								result='<a href="javascript:sbSzxm('+"'"+index+"','yhzx'"+')" style="color:#3399CC;">未上报</a>';
							return result;
							}
						},
					{field:'shzt',title:'审核状态',width:60,align:'center',
						formatter: function(value,row,index){
							var result="";
							xmlx=1;
							if(row.SHZT=='1')
								result='已审核';	
							else 
								result='未审核';	
							return result;
						}
					},
					{field: 'XMMC', title: '项目名称', width: 120, align: 'center'},
			        {field: 'XZQH', title: '行政区划', width: 60, align: 'center'},
			        {field: 'XLXBM', title: '规划路线编码', width: 120, align: 'center'},
			        {field: 'XLXMC', title: '规划路线名称', width: 120, align: 'center'},
			        {field: 'GHLXZH', title: '规划路线桩号', width: 120, align: 'center'},
			        {field: 'YLXBM', title: '原路线编码', width: 120, align: 'center'},
			        {field: 'YLXMC', title: '原路线名称', width: 120, align: 'center'},
			        {field: 'YLXZH', title: '原路线桩号', width: 120, align: 'center'},
			        {field: 'YDBMC', title: '原道班名称', width: 120, align: 'center'},
			        {field: 'JSXZ', title: '建设性质', width: 120, align: 'center'},
			        {field: 'XMNF', title: '建设年份', width: 120, align: 'center'},
			        {field:'ZTZ',title:'总投资(万元)',width:100,align:'center'},
					{field:'JBZJ',title:'厅补助(万元)',width:60,align:'center'},
					{field:'DFZC',title:'地方自筹(万元)',width:100,align:'center'},
					{field: 'BZ', title: '备注', width: 120, align: 'center'},
				    {field: 'THYY', title: '退回原因', width: 120, align: 'center'}
				]];
	gridBind1(grid);
}

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
			计划管理>&nbsp;<span id="astext">计划申报</span>>&nbsp;养护中心
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
								<td align="right">上报状态：</td>
								<td><select id="sbzt" class="easyui-combobox"
									style="width: 144px;">
										<option value="" selected="selected">全部</option>
										<option value="0">未上报</option>
										<option value="1">已上报</option>
								</select></td>
								<td align="right">项目年份：</td>
								<td><select id="xmnf" style="width: 104px;"></select></td>
								
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
									style="vertical-align: middle; padding-left: 8px;" />
									<img id="sb" name="dishi" alt="上报" onclick="sbSzxm('无','yhzx')" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/shangbao_1.png'" src="${pageContext.request.contextPath}/images/Button/shangbao_1.png"/>
									
									
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
            		总投资【<span id="ztz" style="color: red;">0</span>】万元,
            		补助合计【<span id="zbz" style="color: red;">0</span>】万元。
            		</div>

				<div>
					<table id="grid"></table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>