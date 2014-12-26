<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../css/dzdt.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript">
function loadDataunit(){
	$("#dataunit_tree").treegrid({
		border : false,
		rownumbers: false,
		animate:true,
		collapsible:true,
		fit:true,
		fitColumns : true,
		pagination : false,
		loadMsg : '正在加载请稍候...',
		url:'../../xmgl/loadDataunit.do',
		queryParams : {
			"tbdw":$.cookie("unit")
		},
		idField:'id',
		treeField:'name',
		showFooter:false,
		columns:[[
            {field:'name',width:200}
		]],
		onBeforeExpand:function(row){
			if(row.sjlx=="0"){
				var child=$("#dataunit_tree").treegrid("getChildren",row.id);
				if(child == ""){
					$('#dataunit_tree').treegrid('append',{
						parent: row.id,
						data: [{
							id: row.id+'lx',name: '路线',state:'closed',iconCls:'icon-none'
						  	},{
							id: row.id+'sfz',name: '收费站',state:'closed',iconCls:'icon-none'
							}
						]
					});
				}
			}else{
				$("#dataunit_tree").treegrid("getChildren",row.id);
			}
		},onDblClickRow:function(row){
			if(row.id.length>=14){
				if(row.sjlx==1) drawLine(row.id);
				else drawPoint(row.id);
			}
		},onClickRow:function(row){
			if(row.id.length>=14){
				if(row.sjlx==1) drawLine(row.id);
				else drawPoint(row.id);
			}
		}
	});
}

$(function(){
	loadDataunit();
});
</script>
</head>
<body class="easyui-layout" style="background:#fafafa;" scroll="no">
	<div region="west" iconCls="icon-table"  split="true" href="" style="width:250px;">
		<div  class="tab_content" style="overflow:hidden;"  id="tab01">
			<table id="dataunit_tree" cellspacing="0" cellpadding="0"></table>
		</div>
    	
    </div>
	
	<div region="east" iconCls="icon-table"  split="true" href="" style="width:420px;">
    	<div>您当前共有 10 条信息需要处理， 共有 0 条通知。</div>
    	<img src="../../images/ymtx.jpg" style="width:100%;"/>
    	
	</div>
	
    <div region="center" style="padding:0px;background:#eee;">
    	<div class="easyui-layout" fit="true">
			<!-- 地图区域开始 -->
		    <div region="center" style="padding:0px;" border="false">
				<div id="mainTab" border="false" class="easyui-tabs" fit="true">
					<img src="../../images/dt.jpg" style="height:100%;width:100%;"/>
					<!-- <div title="地图" style="overflow: hidden;" href="" iconCls="icon-house">
						
						<iframe id="map2" name="map2" style="width: 100%; height: 100%; display: block"  marginwidth="0" marginheight="0" frameborder="0" src=""></iframe>
					</div>  -->
				</div>
		    </div>
		    <!-- 地图区域结束 -->
		</div> 
    </div>  
</body>
</html>