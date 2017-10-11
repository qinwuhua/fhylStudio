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

<script type="text/javascript">

$(function(){
	loadylx('lxbm');
	loadDist1("xzqh",$.cookie("dist"));
	loadUnit1("gydw",$.cookie("unit"));
	if(getUrlParame('id')=='010113010205')
	xmnfs3w("xmnf");
	else
	xmnfs2w("xmnf");
	
	querySflgc();
});
//编辑
function editSzxm(index,flag){
	YMLib.Var.obj=$('#grid').datagrid('getRows')[index];
	YMLib.Var.flag=flag;
	//示范路
	if(flag=='sfl'){
		openWindow('mywindow','添加路线','/jxzhpt/page/qqgl/jhsh/szlx/sfl_edit.jsp',680,270);
	}
}
//详情
function szxmInfo(index,flag){
	YMLib.Var.obj=$('#grid').datagrid('getRows')[index];
	YMLib.Var.flag=flag;
	//示范路
	if(flag=='sfl'){
		openWindow('mywindow','详情','/jxzhpt/page/qqgl/jhsh/szlx/sfl_Info.jsp',680,470);
	}
}
//上报
function sbSzxm(index,flag){
	var xmbm="";
	if(index=='无'){
		var rows=$('#grid').datagrid('getSelections');
		if(rows.length==0) {
			alert("请勾选记录！");
			return;
		}
		for(var i=0;i<rows.length;i++){
			if(rows[i].SBZT==1){
				alert("所选项目必须为未上报");return;
			}else{
				xmbm+=","+rows[i].XMBM;
			}
		}
		
		xmbm=xmbm.substr(1,xmbm.length);	
	}else{
		xmbm=$('#grid').datagrid('getRows')[index].XMBM;
	}
	xmbm="'"+xmbm.replace(/,/g, "','")+"'";
	if(confirm("您确认上报吗？"))
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/sbshSzxm.do',
		data:"xmbm="+xmbm+"&xmlxs="+flag+"&sbzt=1&shzt=0&thyy=",
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("上报成功");
				$("#grid").datagrid('reload');
				loadLj();
			}else{
				alert("上报失败");
			}
			
		}
	});
}
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
				'jhsh.xmlx1':'sflsb',
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
						result='<a href="javascript:szxmInfo('+"'"+index+"','sfl'"+')" style="color:#3399CC;">详情&nbsp;&nbsp;</a>';
						if(row.SBZT=='1')
							result+='编辑&nbsp;&nbsp;';	
						else
							result+='<a href="javascript:editSzxm('+"'"+index+"','sfl'"+')" style="color:#3399CC;">编辑&nbsp;&nbsp;</a>';
							return result;
						}
					},
					{field:'sbzt',title:'上报状态',width:60,align:'center',
						formatter: function(value,row,index){
							var result="";
							if(row.SBZT=='1')
								result='已上报';
							else
								result='<a href="javascript:sbSzxm('+"'"+index+"','sfl'"+')" style="color:#3399CC;">未上报</a>';
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
			        {field: 'XMLX', title: '项目类型', width: 60, align: 'center'},
			        {field: 'XZQH', title: '行政区划', width: 60, align: 'center'},
// 			        {field: 'GYDW', title: '管养单位', width: 120, align: 'center'},
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
				    {field: 'BZ', title: '备注', width: 120, align: 'center'},
				    {field: 'THYY', title: '退回原因', width: 120, align: 'center'}
				]];
	gridBind1(grid);
}

function loadLj(){
	ljparam
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
			计划管理>&nbsp;<span id="astext">计划申报</span>>&nbsp;示范路工程
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
									<img id="sb" name="dishi" alt="上报" onclick="sbSzxm('无','sfl')" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/shangbao_1.png'" src="${pageContext.request.contextPath}/images/Button/shangbao_1.png"/>
									
									
									
									 <!-- 								<img onclick="plscbtn()" alt="批量上传计划下达文件" src="/jxzhpt/images/plsc.png" style="vertical-align:middle;width: 90px;height: 23px;"> -->
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