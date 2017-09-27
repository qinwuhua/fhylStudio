<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务区_计划申报</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../../../js/uploader/swfobject.js"></script>
<script type="text/javascript" src="../../../js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="../../../widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="../../../widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
<script type="text/javascript" src="/jxzhpt/page/qqgl/lxsh/js/sjgz.js"></script>
<script type="text/javascript">

$(function(){
	queryFwq();
});
function queryFwq(){
	grid.id="grid";
	grid.url="../../../qqgl/queryFwq.do";

	//grid.queryParams=params;
	//loadLj(params);
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=10;
	grid.pageNumber=1;
	grid.columns=[[
					{field:'ck',checkbox:true},
					{field:'cz',title:'操作',width:130,align:'center',
						formatter: function(value,row,index){
							var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
							result+='&nbsp;<a href="javascript:openWindowById('+"'jhxd'"+','+"'示范路工程'"+','+
							"'/jxzhpt/page/qqgl/jhsh/fwq_detail.jsp'"+",980,400,'"+row.id+"'"+')" style="color:#3399CC;">详细</a>'
//	 						+'&nbsp;<a href="javascript:qxxm('+row.xmbm+')" style="color:#3399CC;">取消</a>'
                            ;
							xmlx=4;
							//result+='&nbsp;<a href="javascript:openJhxd1('+"'jhxd1.jsp',"+index+')" style="color:#3399CC;">编辑</a>';
							
							if($.cookie('unit2').length!=7){
								if(row.xdzt=='1')
									result+='&nbsp;编辑';
								else
									result+='&nbsp;<a href="javascript:openWindow1('+"'jhxd'"+','+"'编辑'"+','+
									"'/jxzhpt/page/qqgl/jhsh/fwq_edit.jsp'"+",900,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">编辑</a>';
							}else{
								result+='&nbsp;<a href="javascript:openWindow1('+"'jhxd'"+','+"'编辑'"+','+
								"'/jxzhpt/page/qqgl/jhsh/fwq_edit.jsp'"+",900,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">编辑</a>';
							}	
							return result;
						}
					},
					{field:'sbzt',title:'上报状态',width:60,align:'center',
						formatter: function(value,row,index){
							var result="";
							xmlx=4;
							if(row.sbzt=='0')
							result='<a href="javascript:fwqSbById('+index+')" style="color:#3399CC;">未上报</a>';
							else
								result='已上报';
							return result;
						}
					},
					
					{field:'xdzt',title:'审核状态',width:60,align:'center',
						formatter: function(value,row,index){
							var result="";
							xmlx=1;
							if(row.xdzt=='0')
								result='未审核';
							if(row.xdzt=='1')
								result='已审核';	
//	 						var result='<a href="javascript:openWindow('+"'jhxd'"+','+"'计划审核'"+','+
//	 							"'/jxzhpt/page/qqgl/jhsh/jhxd3.jsp'"+',900,400)" style="color:#3399CC;">计划审核</a>';
							return result;
						}
					},
					{field:'lsjl',title:'历史记录',width:60,align:'center',
						formatter: function(value,row,index){
							if(value=="是"){
								return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
							}else{
								return value;
							}
						}
					},
		            {field:'xmbm',title:'项目编码',width:120,align:'center'},
		            {field:'xlxbm',title:'新路线编码',width:60,align:'center'},
		            {field:'pfwh',title:'批复文号',width:60,align:'center'},
		            {field:'xzh',title:'新桩号',width:120,align:'center'},
		            {field:'lzh',title:'老桩号',width:120,align:'center'},
		            
					{field:'ztz',title:'总投资(万元)',width:100,align:'center'},
				    {field:'cgs',title:'车购税(万元)',width:80,align:'center'},
				    {field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				    {field:'zydpx',title:'重要度排序',width:100,align:'center'},
		            
		            {field:'sjpfdw',title:'设计批复单位',width:140,align:'center'},
		            {field:'sjpfsj',title:'设计批复时间',width:140,align:'center'},
		            {field:'zyjsnr',title:'主要建设内容',width:140,align:'center'},
		            {field:'gcsl',title:'工程数量',width:140,align:'center'}
					
				]];
	gridBind1(grid);
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
			计划管理>&nbsp;<span id="astext">计划库</span>>&nbsp;<span id="bstext"></span>>&nbsp;计划服务区
		</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
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
								<td><select id="xmnf" style="width: 95px;"></select></td>
								<td align="right">建设性质：</td>
								<td><select name="jsxz" class="easyui-combobox" id="jsxz"
									style="width: 60px;"></select></td>

							</tr>
							<tr height="32">
								<td align="right">级别：</td>
								<td><select name="jb" class="easyui-combobox" id="jb"
									style="width: 134px;"></select></td>
								<td align="right">路线名称：</td>
								<td><input type="text" id="lxmc" style="width: 100px;" /></td>
								<td align="right">原道班名称：</td>
								<td><input type="text" id="ydbmc" style="width: 95px;" /></td>
								<td align="right">审核状态：</td>
								<td><select id="xdzt" class="easyui-combobox"
									style="width: 60px;">
										<option value="-1" selected="selected">全部</option>
										<option value="0">未审核</option>
										<option value="1">已审核</option>
								</select></td>
							</tr>
							<tr height="32">
								<td colspan="8">
								    <img onclick="queryFwq()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align: middle; padding-left: 8px;" /> 
								    <!--<img onclick="plscbtn()" alt="批量上传计划下达文件" src="../../../images/plsc.png" style="vertical-align:middle;width: 90px;height: 23px;"> -->
									<img onclick="exportJhshxx()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width: 0px; cursor: hand; vertical-align: middle;" />
									<!--<img onclick="importJhsh()" alt="删除" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
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
					总投资累计：<span id="spanztz" style="color: red;">0</span>万元; 省补助资金累计：<span
						id="spansbz" style="color: red;">0</span>万元;
				</div>
				<div>
					<table id="grid"></table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>