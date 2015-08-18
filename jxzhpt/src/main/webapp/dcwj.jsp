<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			/*$('#dg').datagrid({    
			    url:'qqgl/queryFile.do',
			    width:1000,
			    height:600,
			    rownumbers:true,
			    columns:[[    
			        {field:'filename',title:'文件名称',width:600},    
			        {field:'xmbm',title:'xmbm',width:100},    
			        {field:'xz',title:'下载',width:100,align:'right',
			        	formatter: function(value,row,index){
			        		return '<a href="javascript:down('+"'"+row.xmbm+"',"+"'"+row.filename+"'"+')">下载</a>';
						}
			        }
			    ]],
			    onLoadSuccess:function(data){
			    }
			});*/
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/readJhxdFile.do',
				dataType:'json',
				success:function(msg){
					alert(msg);
				}
			});
		});
		function down(xmbm,filename){
			window.location.href="/jxzhpt/qqgl/down.do?file.xmbm="+xmbm+"&file.filename="+filename.replace("+","加号").replace("+","加号");
		}
		function replaceAll(filename){
			var name = filename.replace(new RegExp("/+"),"加号");
			return name;
		}
	</script>
</head>
<body style="font-size: 12px;">
	<div>
		<table id="dg"></table>
	</div>
</body>
</html>