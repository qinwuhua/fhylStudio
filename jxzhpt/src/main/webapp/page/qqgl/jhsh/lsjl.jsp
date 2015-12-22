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
				url:'../../../qqgl/queryLsxx.do',
				queryParams: {xmbm: parent.YMLib.Var.xmbm},
				fitColumns:true,
				columns:[[
					{field:'id',title:'项目类型',width:100,align:'center',
						formatter:function(value,row,index){
							if(row.xmid.substring(10,11)=="1"){
								return "改建工程项目";
							}else if(row.xmid.substring(10,11)=="2"){
								return "路面改造工程项目";
							}else if(row.xmid.substring(10,11)=="3"){
								return '新建工程项目';
							}else if(row.xmid.substring(10,11)=="4"){
								return '养护大中修项目';
							}else if(row.xmid.substring(10,11)=="5"){
								return "灾毁重建";
							}
						}
					},
					{field:'xmmc',title:'项目名称',width:200,fixed:true,align:'center',
						formatter:function(value,row,index){
							var a='<a href="javascript:msgxx('+"'"+row.xmid+"'"+')" style="color:#0066CB;font-size:12px;">';
							a+=value+'</a>';
							return a;
						}
					},
					{field:'xmid',title:'计划年份',width:100,align:'center',
						formatter:function(value,row,index){
							return value.substring(0,4);
						}
					},
					{field:'lxbm',title:'现路线编码',width:100,align:'center'},
					{field:'jsjsdj',title:'现技术等级',width:100,align:'center'},
					{field:'qdzh',title:'现起点桩号',width:100,align:'center'},
					{field:'zdzh',title:'现止点桩号',width:150,fixed:true,align:'center'},
					{field:'ylxbm',title:'路线编码',width:100,align:'center'},
					{field:'xjsdj',title:'原技术等级',width:100,align:'center'},
					{field:'yqdzh',title:'原起点桩号',width:100,align:'center'},
					{field:'yzdzh',title:'原止点桩号',width:100,align:'center'}
				]]
			});
		});
		function msgxx(xmid){
			parent.YMLib.Var.xmbm=xmid;
			if(xmid.substring(10,11)=="1"){
				parent.YMLib.UI.createWindow('lmsjxx','改建工程项目','/jxzhpt/page/qqgl/zjxd/lmsj_xx.jsp','lmsjxx',980,400);
			}else if(xmid.substring(10,11)=="2"){
				parent.YMLib.UI.createWindow('lmgzxx','路面改造工程项目','/jxzhpt/page/qqgl/zjxd/lmgz_xx.jsp','lmgzxx',980,400);
			}else if(xmid.substring(10,11)=="3"){
				parent.YMLib.UI.createWindow('xjgcxx','新建工程项目','/jxzhpt/page/qqgl/zjxd/xjgc_xx.jsp','xjgcxx',980,400);
			}else if(xmid.substring(10,11)=="4"){
				parent.YMLib.UI.createWindow('yhdzxxx','养护大中修项目','/jxzhpt/page/qqgl/zjxd/yhdzx_xx.jsp','yhdzxxx',980,400);
			}else if(xmid.substring(10,11)=="5"){
				parent.YMLib.UI.createWindow('shxmxx','灾毁重建','/jxzhpt/page/qqgl/zjxd/shxm_xx.jsp','shxmxx',980,400);
			}
		}
	</script>
</head>
<body>
	<table id="grid" width="99%" border="0" style="margin-top:1px;margin-left:1px;" cellspacing="0" cellpadding="0"></table>
</body>
</html>
