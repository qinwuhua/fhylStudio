<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新老结构变化</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/wngh/wnjh/js/wnjh.js"></script>
	<script type="text/javascript">
		$(function(){
			
			ckxlwjg();
			
		});
		function ckxlwjg(){
			
			var xmbm=parent.xmbm;
			
			var title='';
			if(parent.$("#tjfl").combobox('getValue')=='按地市'){
				title='地市';
			}else{
				if(parent.$("#nwgxzdj").combobox('getValues').join(',')=='G'){
					title='国道编号';
				}else if(parent.$("#nwgxzdj").combobox('getValues').join(',')=='S'){
					title='省道编号';
				}else{
					title='国省道编号';
				}
			}
			
			if(parent.$("#nwgxzdj").combobox('getValues').join(',')==''){
				alert("请勾选行政等级");
				return;
			}
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/qqgl/xljgbh.do',
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-40,
			    width:$(window).width()-26,
			    queryParams: {
			    	'lxsh.nwgxzdj':parent.$("#nwgxzdj").combobox('getValues').join(','),
					'lxsh.tjfl':parent.$("#tjfl").combobox('getValue'),
					'lxsh.xmbm':xmbm
				},
			    columns:[[
			        {field:'v_0',title:title,width:110,align:'center'},
					{field:'v_1',title:'总里程变化（公里）',width:115,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
					{field:'v_2',title:'一级变化（公里）',width:115,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="-"){if(value.substring(1,2)=="."){return '-0'+value.substring(1,value.length);}else{return '-'+value.substring(1,value.length);}}else{if(value.substring(0,1)=="."){return '0'+value;}else{return ''+value;}}}},
			        {field:'v_3',title:'二级变化（公里）',width:115,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="-"){if(value.substring(1,2)=="."){return '-0'+value.substring(1,value.length);}else{return '-'+value.substring(1,value.length);}}else{if(value.substring(0,1)=="."){return '0'+value;}else{return ''+value;}}}},
			        {field:'v_4',title:'三级变化（公里）',width:115,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="-"){if(value.substring(1,2)=="."){return '-0'+value.substring(1,value.length);}else{return '-'+value.substring(1,value.length);}}else{if(value.substring(0,1)=="."){return '0'+value;}else{return ''+value;}}}},
				    {field:'v_5',title:'四级变化（公里）',width:115,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="-"){if(value.substring(1,2)=="."){return '-0'+value.substring(1,value.length);}else{return '-'+value.substring(1,value.length);}}else{if(value.substring(0,1)=="."){return '0'+value;}else{return ''+value;}}}},
				    {field:'v_6',title:'等外变化（公里）',width:115,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="-"){if(value.substring(1,2)=="."){return '-0'+value.substring(1,value.length);}else{return '-'+value.substring(1,value.length);}}else{if(value.substring(0,1)=="."){return '0'+value;}else{return ''+value;}}}}
				   
			    ]]
				 
			}); 
			
		}
	
	</script>
	<style type="text/css">
	TD {font-size: 8px;}
	a{text-decoration:none;}
	
	</style>
</head>
<body >
	
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr id='cxtj'>
        		<td align="left" style="padding-left: 5px; padding-top: 10px;height: 330px;">
        			<fieldset id="searchField" style="width:99.3%; text-align: left; vertical-align: middle;height: 330px; padding-bottom:10px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				
            			
            			
            			<div style="padding-top: 7px;padding-left: 5px;padding-bottom:5px; font-size:12px;">
            			
							<table id="datagrid"></table>
	            			
        				</div>
        			</fieldset>
        			
        		</td>
        	</tr>
        	
        	
		</table>
</body>
</html>
