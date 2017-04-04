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
			
			ckyxzxm();
			
		});
		function ckyxzxm(){
			
			var xmbm=parent.xmbm;
			$('#datagrid').datagrid({    
				url:'/jxzhpt/qqgl/selectGsdyxzxm.do',
			    striped:true,
			    pagination:false,
			    rownumbers:true,
			    checkOnSelect:true,
			    height:$(window).height()-40,
			    width:$(window).width()-20,
			    queryParams: {
					'lxsh.xmbm':xmbm
				},
				columns:[[
					        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
					        
							{field : 'xzqh',title : '行政区划',width : 105,align : 'center'},
							{field : 'xmnf',title : '项目年份',width : 53,align : 'center'},
					        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
					        	if(row.sl>0)
					        	return '<font color="red">'+row.xmmc+'</font>';
					        	else return  row.xmmc;
					        }},
					        {field : 'zjhlc',title : '里程',width : 50,align : 'center'},
					        {field:'xjsdj',title:'现技术等级',width:69,align:'center'},
						    {field:'jsjsdj',title:'建设技术等级',width:79,align:'center'},
						    {field:'ghlxbm',title:'规划路线编码',width:79,align:'center',formatter: function(value,row,index){if(row.xmlx1=="新建工程"){return row.xjlxbm;}else{return value;}}},
						   
						    {field : 'ghlxbhs',title : '原路线编码',width : 60,align : 'center',formatter:function(value,row,index){
						    	if(row.ghlxbh=='')
						    	return row.xjlxbm;
						    	else
						    		return row.ghlxbh;
							}}
						   
						    
					    ]],
						view: detailview,
						detailFormatter:function(index,row){  
								return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
					    },
					    onExpandRow: function(index,row){
					    	parentindex=index;
					    	if(row.sl!=0){
					    		$('#table_lx'+row.id).datagrid({
						    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
						    		 queryParams: {
						    			 'lxsh.xmbm':row.id,
						    			 'lxsh.sffirst':'1'
						    			},
					    			columns:[[
							           
					    			       
					    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
					    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
					    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
									    {field:'ghlxbh',title:'原路线编码',width:100,align:'center'},
					    			     {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
					    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
					    			    {field:'jhlc',title:'里程',width:60,align:'center'}
					    			]]
						    	});
					    	}
					    	
					    },
					    onLoadSuccess:function(data){
					    	var rows=$('#datagrid').datagrid("getRows");
					    	for (var i=0;i<rows.length;i++){
					    		if(parent.xmbm!=null)
					    		if(parent.xmbm.indexOf(rows[i].xmbm)!=-1){
					    			$('#datagrid').datagrid('selectRow',i);
					    		}
					    	}
					    	
						}
					}); 
			
		}
	
		
		function ckxlwjg(){
			var gr=$("#datagrid").datagrid('getSelections');
			if(gr.length==0){
				alert("请勾选项目");
				return;
			}
			var xmbm="";
			for(var i=0;i<gr.length;i++){
				xmbm+=gr[i].xmbm+',';
			}
			xmbm=xmbm.substring(0,xmbm.length-1);
			
			parent.xmbm=xmbm;
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
			parent.$('#grid').datagrid({    
			    url:'/jxzhpt/qqgl/ckxlwjg.do',
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:parent.y,
			    width:parent.x,
			    queryParams: {
			    	'lxsh.nwgxzdj':parent.$("#nwgxzdj").combobox('getValues').join(','),
					'lxsh.tjfl':parent.$("#tjfl").combobox('getValue'),
					'lxsh.xmbm':xmbm
				},
			    columns:[[
			        {field:'v_0',title:title,width:120,align:'center'},
					{field:'v_1',title:'里程（公里）',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
					{field:'v_2',title:'一级公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
			        {field:'v_3',title:'二级公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
			        {field:'v_4',title:'三级公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
				    {field:'v_5',title:'四级公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
				    {field:'v_6',title:'等外公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
				    {field:'v_7',title:'二级以上占比',width:100,align:'center'},
				    {field:'v_8',title:'三级以上占比',width:100,align:'center'}
			    ]]
				 
			}); 
			
			parent.$('#lxxx').window('destroy');
			
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
        				
            			
            			<a id='mybuttion3' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:ckxlwjg()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">查看新路网结构</a>
            			<div style="padding-top: 7px;padding-left: 5px;padding-bottom:5px; font-size:12px;">
            			
							<table id="datagrid"></table>
	            			
        				</div>
        			</fieldset>
        			
        		</td>
        	</tr>
        	
        	
		</table>
</body>
</html>
