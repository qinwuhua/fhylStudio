<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程路面改建路面升级项目</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>

	
	<script type="text/javascript">
		
		/* var tip;
	    function f_tip() {
	        if (!tip) {
	            tip = $.ligerDialog.tip({ title: '提示信息', content: '内容第一次！' });
	        }
	        else {
	            var visabled = tip.get('visible');
	            if (!visabled) tip.show();
	            tip.set('content', '内容第2次及以后');
	        }
	    }  */
	   $(function(){
		   loadGhlx('ghlxbm');
		   loadylx('ylxbm');
	    });
	    
	    function loadGhlx(id) {
	    	$("#"+id).combotree({
	    		url: '/jxzhpt/qqgl/loadGhlx.do?xzqhdm='+$.cookie("dist2"),
	    		//onLoadError: showError,
	    		onClick: function (node) {
	    			var user = {"refresh": "1"};
	    			if (node.id != 0)  user.so_id = node.attributes.so_id;
	    			$("#table").datagrid("clearSelections").datagrid("load", user);
	    			$("#parentName").val(user.so_id);
	    		},
	    		panelHeight:'250',editable: true,multiple:true,
	    		onLoadSuccess: function (node, data) {
	    			$(this).tree('collapseAll');   //关闭树节点
	    			var root = $(this).tree("getRoot");      //展开根节点
	    			if (root != null) {
	    				//$(this).tree("expand", root.target);
	    				var childrens = $(this).tree("getChildren", root.target);
	    				for (var i = 0; i < childrens.length; i++) {
	    					if (childrens[i].attributes.so_id == '0') {
	    						$(this).tree("expand", childrens[i].target);
	    					}
	    				}
	    				var item = $("#"+id).tree("find", openid);    //展开并定位到指定节点
	    				if (item != null) {
	    					$(this).tree("expandTo", item.target);
	    					$(this).tree("select", item.target);
	    				}
	    				var user = {"refresh": "1"};
	    				user.so_id = openid;
	    				$("#table").datagrid("clearSelections").datagrid("load", user);
	    			}
	    		}
	    	});
	    	
	    	$(".combo-text").bind("input propertychange", function() {
		        $("#"+id).combotree('tree').tree("search",$(this).val());
		        if($(this).val()=="" || null==$(this).val()){
		            $("#"+id).combotree('tree').tree("expandAll");
		        }
		    	});
	    } 
	    
	    function loadylx(id) {
	    	$("#"+id).combotree({
	    		url: '/jxzhpt/qqgl/loadYlx.do?xzqhdm='+$.cookie("dist2"),
	    		//onLoadError: showError,
	    		onClick: function (node) {
	    			var user = {"refresh": "1"};
	    			if (node.id != 0)  user.so_id = node.attributes.so_id;
	    			$("#table").datagrid("clearSelections").datagrid("load", user);
	    			$("#parentName").val(user.so_id);
	    		},
	    		panelHeight:'250',editable: true,multiple:true,
	    		onLoadSuccess: function (node, data) {
	    			$(this).tree('collapseAll');   //关闭树节点
	    			var root = $(this).tree("getRoot");      //展开根节点
	    			if (root != null) {
	    				//$(this).tree("expand", root.target);
	    				var childrens = $(this).tree("getChildren", root.target);
	    				for (var i = 0; i < childrens.length; i++) {
	    					if (childrens[i].attributes.so_id == '0') {
	    						$(this).tree("expand", childrens[i].target);
	    					}
	    				}
	    				var item = $("#"+id).tree("find", openid);    //展开并定位到指定节点
	    				if (item != null) {
	    					$(this).tree("expandTo", item.target);
	    					$(this).tree("select", item.target);
	    				}
	    				var user = {"refresh": "1"};
	    				user.so_id = openid;
	    				$("#table").datagrid("clearSelections").datagrid("load", user);
	    			}
	    		}
	    	});
	    	
	    	$(".combo-text").bind("input propertychange", function() {
		        $("#"+id).combotree('tree').tree("search",$(this).val());
		        if($(this).val()=="" || null==$(this).val()){
		            $("#"+id).combotree('tree').tree("expandAll");
		        }
		    	});
	    } 
	    
	    
	    function ckxx(){
	    	alert($("#ghlxbm").combotree('getText'));
	    }
	</script>
	<!-- <style type="text/css">
   		.message{ position:absolute;  border:1px solid #DEDEDE;}
		/* 2.配置样式	 */
	</style> -->
</head>
<body>
	<table style="margin-left: 50px;margin-top: 30px;">
		
		<tr>
			<td>
				<input type="text" class='easyui-combotree combo-text' id="ghlxbm" data-options="panelHeight:'auto'">
				<input type="text" class='easyui-combotree combo-text' id="ylxbm" data-options="panelHeight:'auto'">
				<input type="button" onclick="ckxx()" value="打印">
			</td>
			
		</tr>
		
	</table>
</body>
</html>
