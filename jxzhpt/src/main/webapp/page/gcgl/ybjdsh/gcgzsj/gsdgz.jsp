<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/gcgzsj.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/SimpleCanleder.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SimpleCanleder.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			//loadBmbm2('ddlGldj','行政等级');
			loadBmbm2('ddlGldj','行政等级');
			loadBmbm3('xmzt','进展状态');
			tsdq('ddlTSDQ');
			gsdxmlx('xmlx');
			if(getParam("t")=='1'){
				$("#ybzt").val('未审核');
			}
			//gcglxmnf("ddlYear");
			var urlid=getUrlParame('id');
			urlxmnf("ddlYear",urlid);
			showGsd();
		});
		
		function showGsd(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var jgzt='';
			var kgzt='';
			var lxmc=$("#lxmc").val();
			var yhjb=$.cookie("unit2").replace(/_/g,"");
			var sfsj='';
			if(yhjb.length==11){
				yhtype='县级';
				sfsj=11;
			}
			if(yhjb.length==9||yhjb.length==8){
				yhtype='市级';
				sfsj=9;
			}
			if(yhjb.length<8&&yhjb.length>=2){
				yhtype='省级';
				sfsj=7;
			}
			var xmnf=$("#ddlYear").combobox('getValues').join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var ybzt=$("#ybzt").combobox('getValue');
			$('#datagrid').datagrid({    
			    url:'../../../../gcgl/selectgsdgzList.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-195,
			    width:$(window).width()-$(window).width()*0.019,
			    queryParams: {
			    	gydw: xzqhstr,
			    	kgzt: kgzt,
			    	jgzt: jgzt,
			    	lxmc:lxmc,
			    	ybzt:ybzt,
			    	sfsj:sfsj,
			    	xmnf:xmnf,
			    	'gcglgcgzsj.sbzt':'jz.shzt',
			    	'gcglgcgzsj.jsdj':$("#ddlPDDJ").combobox('getValue'),
			    	'gcglgcgzsj.lxbm':$("#lxbm").val(),
			    	'gcglgcgzsj.xmmc':$("#xmmc").val(),
			    	'gcglgcgzsj.lxmc':$("#lxmc").val(),
			    	'gcglgcgzsj.xmlx1':xmlx,
			    	'gcglgcgzsj.gldj':$("#ddlGldj").combobox('getValue'),
			    	'gcglgcgzsj.tsdq':$("#ddlTSDQ").combobox('getText'),
			    	'gcglgcgzsj.xmzt':$("#xmzt").combobox('getText')
				},
			    columns:[[
			        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
		 	        	 return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="wqxiangxi('+index+')">详细</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="ybsb('+index+')">月报审核</a>    ';
		 	        }},
		 	       {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
			        	if(row.SL!=1)
			        		return '<font color="red">'+row.XMMC+'</font>';
			        	else return  row.XMMC;	
			        }},
					{field : 'XMBM',title : '项目编码',width : 120,align : 'center'},
					{field : 'XZQH',title : '行政区划',width : 180,align : 'center'},
					{field : 'LXBM1',title : '路线编码',width : 120,align : 'center'},
					{field : 'QDZH1',title : '起点桩号',width : 100,align : 'center'},
					{field : 'ZDZH1',title : '止点桩号',width : 100,align : 'center'},
					{field : 'GHLXBM',title : '规划路线编码',width : 120,align : 'center'},
					{field : 'GHQDZH',title : '规划起点桩号',width : 100,align : 'center'},
					{field : 'GHZDZH',title : '规划止点桩号',width : 100,align : 'center'},
					{field:'KGSJ',title:'计划开工时间',width:150,align:'center'},
					{field:'WGSJ',title:'计划完工时间',width:150,align:'center'},
					{field:'GQ',title:'工期（月）',width:100,align:'center'},
			        {field:'XDZJ',title:'已下达计划(万元)',width:120,align:'center'},
			        {field:'BFZJ',title:'已拨付资金(万元)',width:120,align:'center'},
					{field:'GKPFWH',title:'工可批复文号',width:100,align:'center'},
					{field:'SJPFWH',title:'设计批复文号',width:100,align:'center'}
					]],
					view: detailview,
					detailFormatter:function(index,row){   
					return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
					},
					onExpandRow: function(index,row){
					$('#table_lx'+index).datagrid({
						url:'/jxzhpt/qqgl/selectSjgzlxList.do',
						 queryParams: {
							 	jdbs:2,
						    	xmbm:row.XMBM
							},
						columns:[[
						    {field:'gydw',title:'管养单位',width:150,align:'center'},    
						    {field:'xzqh',title:'行政区划',width:150,align:'center'},
						    {field:'lxmc',title:'路线名称',width:120,align:'center'},
						    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
						    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
						    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
						    {field:'qdmc',title:'起点名称',width:100,align:'center'},
						    {field:'zdmc',title:'止点名称',width:100,align:'center'},
						    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
						    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
						    {field:'lc',title:'里程',width:60,align:'center'}
						]]
					});
				}   
			}); 
		}
	</script>
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
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;<span id="astext">进度审核</span>>&nbsp;<span id="bstext"></span>>&nbsp;国省道改造</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
        						<td align="right">行政区划：</td>
        						<td colspan="3"><input id="xzqh" style="width: 208px;" ></td>
        						<td align="right">路线名称：</td>
        							<td><input type="text" id="lxmc" style="width: 120px" ></td>
        						<td align="right">项目年份：</td>
        						<td align="right"><select name="ddlYear" id="ddlYear" style="width: 70px;">
        						<option value="">全部</option>
        						</select></td>
        						
        						</tr>
								 <tr height="32">
								<td align="right">技术等级：</td>
								<td><select name="ddlPDDJ" id="ddlPDDJ" style="width:57px; vertical-align:middle;"></select></td>
								<td align="right">原行政等级：</td>
								<td><select name="ddlGldj" id="ddlGldj" style="width:72px; vertical-align:middle;"></select></td>
        						<td align="right">特殊地区：</td>
								<td><select name="ddlTSDQ" id="ddlTSDQ" style="width:120px; vertical-align:middle;">
								</select></td>
        						<td align="right">月报状态：</td>
        						<td><select id="ybzt" class='easyui-combobox' style="width: 60px;">
        							<option value="">全部</option>
        							<option value="已审核">已审核</option>
        							<option value="未审核">未审核</option>
        						</select></td>
								</tr>
							<tr height="32">
								<td align="right">路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:55px;" /></td>
        						<td align="right">项目名称：</td>
        						<td><input type="text" id="xmmc" style="width:70px;" /></td>
        						<td align="right">项目类型：</td>
        						<td><select name="xmlx" id="xmlx" style="width:122px;" ></select></td>
        						<td align="right">项目进度：</td>
        						<td><select name="xmzt" id="xmzt" style="width:60px;" ></select></td>
        						 
        						</tr>
        						<tr height="32">
        						<td colspan="10">
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showGsd()"/>        					</p>
        				</td></tr></table></div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td width="100%" style="padding-top: 1%;padding-left:10px;">
                    <div>
		<table id="datagrid" >
			</table>
			</div>
			</td>
			</tr>
		</table>
	</div>
</body>
</html>