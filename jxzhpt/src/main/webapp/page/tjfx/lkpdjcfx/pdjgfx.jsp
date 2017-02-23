<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>路况评定结果与养护大中修项目分析</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="../../../js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
<script type="text/javascript">
$(function(){
	$("#roadcode").combobox({
		url :"/jxzhpt/tjfx/getLxldCombo.do",
		valueField : "id",
		textField : "text",
		panelHeight:170
	});
	YMLib.Var.jdbs=1;
	if(userPanduan($.cookie("unit2"))!="省"){
		loadBmbm2('sqzt','申请状态地市');
	}else{
		loadBmbm2('sqzt','申请状态省');
	}
	xmnf("xmnf");
	queryYhdzx();
});

function queryYhdzx(){
	var xmnf=$("#xmnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',') xmnf=xmnf.substr(1,xmnf.length);
	
	grid.id="grid";
	grid.url="/jxzhpt/qqgl/queryXmsq.do";
	var params={'xmlx':4,
			    'lxbm':$('#roadcode').combobox("getValue"),
			    'xmbm':xmnf,
			    'qdzh':$("#qdzh").val(),
			    'zdzh':$("#zdzh").val(),
			    'xzqhdm':36,
			    'jdbs':YMLib.Var.jdbs,
			    'tsdq':''
	            };
	var sqzt = $('#sqzt').combobox("getValue");
	if(userPanduan($.cookie("unit2"))!="省"){
		params.sqzt=sqzt=='' ? -1 : sqzt;
	}else{
		params.sqzt=sqzt=='' ? -1 : sqzt;
	}
	
	grid.queryParams=params;
	grid.height=$(window).height()-100;
	grid.width=$(window).width()-10;
	grid.pageSize=10;
	grid.pageNumber=1;
	
	if($.cookie('unit2').length==7)
	grid.columns=[[
		{field:'ck',checkbox:true},
		{field:'sqzt',title:'审核状态',width:60,align:'center',
			formatter:function(value,row,index){
				var result="";
				if(userPanduan($.cookie('unit2'))!="省"){
					if(Number(value)==Number($.cookie('unit2').length)){
						result="已上报";
					}else if(Number(value)>0 && Number(value)<Number($.cookie('unit2').length)){
						result="已审核";
					}else if(Number(value)==0 || Number(value)>Number($.cookie('unit2').length)){
						result='未上报';
					}
				}else if(userPanduan($.cookie('unit2'))=="省"){
					if(Number(value)==Number($.cookie('unit2').length)){
						result='已审核';
					}else if(Number(value)==9){
						result='未审核';
					}else{
						result="未上报";
					}
				}
				return result;
			}
		},
		
		{field:'lsjl',title:'历史记录',width:60,align:'center',
			formatter: function(value,row,index){
				if(value=="是"){
					return '是';
				}else{
					return value;
				}
			}
		},
		{field:'wnxmk',title:'五年项目库',width:70,align:'center',
			formatter: function(value,row,index){
				if(value=="是"){
					return '是';
				}else{
					return value;
				}
			}
		},
		{field:'gydw',title:'管养单位',width:100,align:'center'},
		{field:'xzqh',title:'行政区划',width:60,align:'center'},
		{field:'xmmc',title:'项目名称',width:150,align:'center',
			formatter: function(value,row,index){
        		if(Number(row.xmsl)>1){
        			return '<label style="color:red;">'+value+'</label>';
        		}else{
        			return value;
        		}
        	}
		},
		{field:'xmbm',title:'项目编码',width:100,align:'center'},
		{field:'zlc',title:'里程',width:60,align:'center'},
		{field:'jsdj',title:'技术等级',width:100,align:'center'},
		{field:'ylxbh',title:'原路线编码',width:60,align:'center'},
		{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
		{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
		{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
	    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
	    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		{field:'ntz',title:'总投资',width:60,align:'center'},
		{field:'sbzj',title:'省补资金',width:60,align:'center'}
		]];
	else{
		grid.columns=[[
						{field:'ck',checkbox:true},
						{field:'sqzt',title:"审核状态",width:60,align:'center',
							formatter:function(value,row,index){
								var result="";
								if(userPanduan($.cookie('unit2'))!="省"){
									if(Number(value)==Number($.cookie('unit2').length)){
										result="已上报";
									}else if(Number(value)>0 && Number(value)<Number($.cookie('unit2').length)){
										result="已审核";
									}else if(Number(value)==0 || Number(value)>Number($.cookie('unit2').length)){
										result='未上报';
									}
								}else if(userPanduan($.cookie('unit2'))=="省"){
									if(Number(value)==Number($.cookie('unit2').length)){
										result='已审核';

									}else if(Number(value)==9){
										result='未审核';
									}else{
										result="未上报";
									}
								}
								return result;
							}
						},
						
						{field:'lsjl',title:'历史记录',width:60,align:'center',
							formatter: function(value,row,index){
								if(value=="是"){
									return '是';
								}else{
									return value;
								}
							}
						},
						{field:'wnxmk',title:'五年项目库',width:70,align:'center',
							formatter: function(value,row,index){
								if(value=="是"){
									return '是';
								}else{
									return value;
								}
							}
						},
						{field:'gydw',title:'管养单位',width:100,align:'center'},
						{field:'xzqh',title:'行政区划',width:60,align:'center'},
						{field:'xmmc',title:'项目名称',width:150,align:'center',
							formatter: function(value,row,index){
				        		if(Number(row.xmsl)>1){
				        			return '<label style="color:red;">'+value+'</label>';
				        		}else{
				        			return value;
				        		}
				        	}
						},
						{field:'xmbm',title:'项目编码',width:100,align:'center'},
						{field:'zlc',title:'里程',width:60,align:'center'},
						{field:'jsdj',title:'技术等级',width:100,align:'center'},
						{field:'ylxbh',title:'原路线编码',width:60,align:'center'},
						{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
						{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
						{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
					    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
					    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
						{field:'jhkgsj',title:'计划开工时间',width:80,align:'center'},
						{field:'jhwgsj',title:'计划完工时间',width:80,align:'center'},
						{field:'ntz',title:'总投资',width:60,align:'center'}
						]];
		
	}
	gridBindyh(grid);
}

</script>
<style type="text/css">
TD {
font-size: 12px;margin:0px;padding:0px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:6px;}
</style>
</head>
<body>
		<div id="righttop">
		<div id="p_top">统计分析>&nbsp;路况评定决策分析>&nbsp;路况评定结果与养护大中修项目分析</div>
		</div>

	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr><td>
		
		</td></tr>
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #cde0f3;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
				<div>
						<table style=" margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr  height="32">
							  <td>管辖路段：</td>
							  <td>
							  <select class="easyui-combobox" id="roadcode" panelHeight="auto" style="width: 220px;"></select>
							  <input id="qdzh" type="text" style="width: 50px;"/>--<input id="zdzh" type="text" style="width: 50px;"/>
							  </td>
							  <td><span id="ztspan">&nbsp;审核状态</span>：</td>
       						  <td><select id="sqzt" class="easyui-combobox" style="width: 70px;"></select></td>
							  <td>项目年份：</td>
        					  <td><select id="xmnf" style="width:80px;"></select></td>
							  <td colspan="10">
							 	<img onclick="queryYhdzx()" name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif"  style="border-width:0px;cursor: hand;" />
							 	<img onclick="queryYhdzx()" name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查看路况评定" onmouseout="this.src='../../../images/Button/Serch01.gif'"   style="border-width:0px;cursor: hand;" />
							  </td>
							</tr>
							</table>
						</div>
					</fieldset>
					</td>
					</tr>
		</table>
		<div id="grid" width="100%" ></div>
</body>
</html>
