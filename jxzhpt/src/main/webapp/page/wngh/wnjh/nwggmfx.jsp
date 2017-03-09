<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>拟完工规模分析</title>
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
			
			loadBmbm3('nwgxzdj','拟完工行政等级','G');
			loadBmbm('tjfl','统计分类','按地市');
			ckylwjg();
			x=$(window).width()-20;
			y=$(window).height()-120;
		});
		var x=0;y=0;var xmbm="";
		
		function ckylwjg(){
			var title='';
			if($("#tjfl").combobox('getValue')=='按地市'){
				title='地市';
			}else{
				if($("#nwgxzdj").combobox('getValues').join(',')=='G'){
					title='国道编号';
				}else if($("#nwgxzdj").combobox('getValues').join(',')=='S'){
					title='省道编号';
				}else{
					title='国省道编号';
				}
			}
			
			if($("#nwgxzdj").combobox('getValues').join(',')==''){
				alert("请勾选行政等级");
				return;
			}
			$('#grid').datagrid({    
			    url:'/jxzhpt/qqgl/ckylwjg.do',
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-120,
			    width:$(window).width()-20,
			    queryParams: {
			    	'lxsh.nwgxzdj':$("#nwgxzdj").combobox('getValues').join(','),
					'lxsh.tjfl':$("#tjfl").combobox('getValue')
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
		}
		
		function xzxm(){
			YMLib.UI.createWindow('lxxx','选择项目','xuanzxm.jsp','lxxx',850,400);
		}
		
		function ckyxbh(){
			if(xmbm==''){
				alert("未生成新路网结构，无法查看变化");
				return;
			}
			YMLib.UI.createWindow('lxxx','新老结构变化情况','xljgbh.jsp','lxxx',850,400);
			
			
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
		<div id="p_top">五年项目库>&nbsp;<span id='bstext'></span>>&nbsp;公路建设项目>&nbsp;国省道改造</div>
	</div>
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-top: 10px;height: 40px;">
        			<fieldset id="searchField" style="width:99.3%; text-align: left; vertical-align: middle;height: 40px; padding-bottom:10px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="32">
        						<td>行政等级：</td>
        						<td ><select id="nwgxzdj" style="width:100px;"></select></td>
        						<td>统计分类：</td>
        						<td ><select id="tjfl" style="width:100px;"></select></td>
        						
        					
                              <td >
        						<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:ckylwjg()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查看原路网结构</a>
				              	<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:xzxm()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">选择项目</a>
				                <a id='mybuttion3' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:ckyxbh()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">新老结构变化情况</a>
            	
				              </td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<!-- <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		补助资金【<span id="cgs" style="color: red;">0</span>】万元,
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
            	</td>
        	</tr> -->
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
