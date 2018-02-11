<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>补助历史数据</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#grid').datagrid({
				//url:'../../../qqgl/querywnxx.do',
				url:'../../../qqgl/querywnxmxx.do',
				queryParams: {xmbm: parent.YMLib.Var.xmbm},
				height:$(window).height()-1,
				fitColumns:true,
				/* columns:[[
					{field:'id',title:'项目类型',width:100,align:'center',
						formatter:function(value,row,index){
							return row.jsxz;
						}
					},
					{field:'xmmc',title:'项目名称',width:200,fixed:true,align:'center',
						formatter:function(value,row,index){
							var a='<a href="javascript:msgxx('+"'"+row.xmid+"'"+",'"+row.jsxz+"'"+')" style="color:#0066CB;font-size:12px;">';
							a+=value+'</a>';
							return a;
						}
					},
					{field:'xmid',title:'计划年份',width:100,align:'center',
						formatter:function(value,row,index){
							return row.xmnf;
						}
					},
					{field:'lxbm',title:'规划路线编码',width:100,align:'center'},
					{field:'jsjsdj',title:'规划技术等级',width:100,align:'center'},
					{field:'qdzh',title:'规划起点桩号',width:100,align:'center'},
					{field:'zdzh',title:'规划止点桩号',width:150,fixed:true,align:'center'},
					{field:'ylxbm',title:'路线编码',width:100,align:'center'},
					{field:'xx',title:'原技术等级',width:100,align:'center',formatter:function(value,row,index){
						 return row .yjsdj;
					}},
					{field:'yqdzh',title:'原起点桩号',width:100,align:'center'},
					{field:'yzdzh',title:'原止点桩号',width:100,align:'center'}
				]] */
				columns:[[
							{field:'xmlx',title:'项目类型',width:100,align:'center'},
							{field:'xmmc',title:'项目名称',width:200,fixed:true,align:'center',
								formatter:function(value,row,index){
									var a='<a href="javascript:msgxx('+"'"+row.xmbm+"'"+",'"+row.xmlx+"'"+')" style="color:#0066CB;font-size:12px;">';
									a+=value+'</a>';
									return a;
								}
							},
							/* {field:'xmnf',title:'计划年份',width:100,align:'center'}, */
							{field:'xmjd',title:'项目进度',width:100,align:'center'},
							{field:'ghlxbm',title:'现路线编码',width:100,align:'center'},
							{field:'jsjsdj',title:'现技术等级',width:100,align:'center'},
							{field:'ghqdzh',title:'现起点桩号',width:100,align:'center'},
							{field:'ghzdzh',title:'现止点桩号',width:150,fixed:true,align:'center'},
							{field:'lxbm',title:'路线编码',width:100,align:'center'},
							{field:'xjsdj',title:'原技术等级',width:100,align:'center'},
							{field:'qdzh',title:'原起点桩号',width:100,align:'center'},
							{field:'zdzh',title:'原止点桩号',width:100,align:'center'}
						]]
			});
		});
		var obj=new Object();
		function msgxx(xmid,jsxz){
			parent.YMLib.Var.xmbm=xmid;
			if(jsxz=="改建"){
				parent.YMLib.UI.createWindow('lmsjxx','改建工程项目','/jxzhpt/page/qqgl/jhsh/gj_wnxx.jsp','lmsjxx',980,400);
			}else if(jsxz=="路面改造"){
				parent.YMLib.UI.createWindow('lmgzxx','路面改造工程项目','/jxzhpt/page/qqgl/jhsh/lm_wnxx.jsp','lmgzxx',980,400);
			}else if(jsxz=="新建"){
				parent.YMLib.UI.createWindow('xjgcxx','新建工程项目','/jxzhpt/page/qqgl/jhsh/xj_wnxx.jsp','xjgcxx',980,400);
			}
		}
	</script>
</head>
<body style="overflow: auto;">
	<table id="grid" height="99%" width="99%" border="0" style="margin-top:1px;margin-left:1px;overflow: auto;" cellspacing="0" cellpadding="0"></table>
</body>
</html>
