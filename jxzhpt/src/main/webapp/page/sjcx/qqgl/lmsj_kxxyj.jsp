<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/kxxyj/js/kxxyj.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('jsdj','技术等级');
			loadBmbm2('gldj','行政等级');
			tsdq("tsdq");
			xmnf("xmnf");
			showAllsjsh();
		});
		function showAllsjsh(){
			var gydw=$("#gydw").combotree("getValues");
			if(gydw.length==0){
				if($.cookie("unit2")=='_____36')
					gydwstr=36;
				else gydwstr= $.cookie("unit2");
			}else if(gydw.length==1){
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				gydwstr=gydw[0] ;
			}else{
				gydwstr= gydw.join(',');
			}
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
			
			var xmmc=$("#xmmc").val();
			var xmnf=$("#xmnf").combobox('getText');
			var lsjl=$("#lsjl").combobox('getValue');
			var tsdq=$("#tsdq").combobox('getText');
			if(tsdq=='全部'){
				tsdq="";
			}
			var jsdj=$("#jsdj").combobox('getValue');
			var gldj=$("#gldj").combobox('getValue');
			
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/qqgl/selectSjgzshList.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-160,
			    width:$(window).width()-30,
			    queryParams: {
			    	lsjl:lsjl,
			    	xzqh:xzqhstr,
			    	gydw:gydwstr,
			    	xmmc:xmmc,
					xmnf:xmnf,
					tsdq:tsdq,
					jsdj:jsdj,
					gldj:gldj
				},
			    columns:[[
			        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
			        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){	        	
			        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    ';
			        }},
			        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
						formatter: function(value,row,index){
							if(value=="是"){
								return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
							}else{
								return value;
							}
						}
					},
			        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
				    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
				    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
				    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
				    {field : 'ghlxbh',title : '路线编号',width : 180,align : 'center'},
				    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
				    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
				    {field:'qdmc',title:'起点名称',width:150,align:'center'},
				    {field:'zdmc',title:'止点名称',width:150,align:'center'},
				    {field : 'lc',title : '里程',width : 100,align : 'center'},
				    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
				    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
				    {field : 'tz',title : '投资',width : 100,align : 'center'},
				    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
				    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
				    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
			    ]],
				view: detailview,
				detailFormatter:function(index,row){   
			        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
			    },
			    onExpandRow: function(index,row){
			    	$('#table_lx'+index).datagrid({
			    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
			    		 queryParams: {
			    			 	jdbs:0,
			    		    	xmbm:row.xmbm
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
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">前期管理>&nbsp;工程可行性研究审核>&nbsp;升级改造工程项目</div>
	</div>
	<table width="99%" border="0"
		style="margin-top: 1px; margin-left: 1px;" cellspacing="0"
		cellpadding="0">
		<tr>
			<td align="left"
				style="padding-left: 10px; padding-top: 10px; height: 100px;">
				<fieldset id="searchField"
					style="width: 99%; text-align: left; vertical-align: middle; height: 100px; padding-bottom: 10px;">
					<legend
						style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
						<font style="color: #0866A0; font-weight: bold"></font>
					</legend>
					<div>
						<table style="margin: 7px; vertical-align: middle;"
							cellspacing="0" class="abgc_td">
							<tr height="32">
								<td>管养单位：</td>
								<td colspan="3" style="width: 220px;"><select id="gydw"
									style="width: 220px;"></select></td>
								<td>行政区划：</td>
								<td colspan="3" style="width: 220px;"><select id="xzqh"
									style="width: 220px;"></select></td>
								<td>项目名称：</td>
								<td><input type="text" id="xmmc" style="width: 95px;" /></td>
							</tr>
							<tr height="32">
								<td>项目年份：</td>
								<td><select id="xmnf" style="width: 70px;"></select></td>
								<!-- <td>审核状态：</td>
        						<td><select id="sbzt" style="width:80px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="0">未审核</option>
									<option value="1">已审核</option> 
								</select></td> -->
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width: 88px;"></select></td>
								<td>技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width: 65px;" class="easyui-combobox"></select></td>
								<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width: 68px;" class="easyui-combobox"></select></td>
								<td>是否有历史记录：</td>
								<td>
									<select id="lsjl" style="width: 80px;" class="easyui-combobox">
										<option selected="selected" value="">全部</option>
										<option value="是">是</option>
										<option value="否">否</option>
									</select>
								</td>
							</tr>
							<tr height="32">
								<td colspan="10"><img onclick="showAllsjsh()" alt="搜索"
									src="${pageContext.request.contextPath}/images/Button/Serch01.gif"
									onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
									onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'"
									style="vertical-align: middle;" /></td>
							</tr>
						</table>
					</div>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td style="padding-left: 10px; padding-top: 5px; font-size: 12px;">
				<div>
					<table id="datagrid"></table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
