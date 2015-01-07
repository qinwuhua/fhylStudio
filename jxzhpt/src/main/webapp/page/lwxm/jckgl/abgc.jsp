<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Menu.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
$(function(){
	jckglAbgc();
	$("#cc").combotree({
		checkbox: false,
	 	url: "../js/gydw.json",
	});
	$("#ss").combotree({
		checkbox: false,
	 	url: "../js/xzqh.json",
	});
});
	function jckglAbgc(){
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectAbgc.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:325,
			    width:1100,
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					if(row.shzt=="未审核"){
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckabgc() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}else{
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<span style="color:grey;">编辑</span>  '+
						'<span style="color:grey;">删除</span>';
					}
				}},    
				{field:'shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
					if(row.shzt=="未审核"){
					return '<a href=javascript:xgShzt("'+row.id+'") style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
					}else{
						return '<span style="color:grey;">已审核</span>';
					}
				}},
		        {field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'lxbm',title:'路线编号',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		        {field:'qzlc',title:'起止里程',width:140,align:'center'},
		        {field:'qzlc',title:'总里程',width:140,align:'center'},
		        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'}
		    ]]    
		});  
	}

function delJckabgc(){
	var rows=$('#grid').datagrid('getSelections');
	var id=rows[0].id;
	for(var i=1;i<rows.length;i++){
		id+="','"+rows[i].id ;
	}
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmjck/deleteAbgcById.do",
				 dataType : 'json',
				 data : 'delstr=' +id,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 $("#grid").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
}
function xgShzt(id){
	if(confirm('您是否上报该项目！')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/xmjck/xgJckAbgcShzt.do",
				 dataType : 'json',
				 data : 'id=' +id,
				 success : function(msg){
					 if(msg){
						 alert('上报成功！');
						 $("#grid").datagrid('reload');
					 }else{
						 alert('上报失败,请选择要上报项目！');
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
	}
}
</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
		

	<table align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr><td>
		<div id="righttop">
		<div id="p_top">路网项目>&nbsp;项目基础库管理>&nbsp;安保工程项目</div>
		</div>
		</td></tr>
		<tr>
			<td align="left" style="padding-left:10px; padding-right:25px;">
				<fieldset style="width:1080px;text-align:left;vertical-align:middle;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
				<div>
					<p style="margin:8px 0px 4px 20px;">
								<span>管养单位：</span>
                              	<select id="cc" style="width:218px">
                              	</select>
                             	<span>&nbsp;行政区划：</span>
                              	<select id="ss" style="width:218px">
                              	</select>
                               <span>&nbsp;路线名称：</span>
        						<input type="text" id="txtRoad" style="width:212px;" />
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="cc1" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="2014年">2014年</option>
									<option value="2013年">2013年</option>
									<option value="2012年">2012年</option>
									<option value="2011年">2011年</option>
                              	</select>
                              <span>&nbsp;项目状态： </span>
                              	<select id="ss1" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">待上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">已入库</option>
									<option value="已审核">已下达</option>
                              	</select>
                               <span>&nbsp;审核状态：</span>
                              	<select id="ss2" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
                              	</select>
                              <span>&nbsp;特殊地区：</span>
                              	<select id="ss4" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
                              	</select>
                              <span>&nbsp;技术等级：</span>
                              	<select id="ss5" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="1">一级公路</option>
									<option value="2">二级公路</option>
									<option value="3">三级公路</option>
									<option value="4">四级公路</option>
									<option value="5">等外公路</option>
                              	</select>
                              	<span>&nbsp;公路等级：</span>
                              	<select id="ss6" class="easyui-combobox" style="width:70px">
                              		<option selected="selected" value="">全部</option>
									<option value="G">国道</option>
									<option value="S">省道</option>
									<option value="X">县道</option>
									<option value="Y">乡道</option>
									<option value="C">村道</option>
									<option value="Z">专道</option>
                              	</select>
                             </p>
                             <p style="margin:8px 0px 4px 20px;">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" style="border-width:0px;cursor: hand;" />
								<img name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;" />
								<img  name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" style="border-width:0px;cursor: hand;" />
								<img name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="importExcel();" style="border-width:0px;" />
                                <img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addJck('abgc_add.jsp','900','400');" style="border-width:0px;" />
                                <img name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="javascript:delJckabgc();" style="border-width:0px;" />
                                <img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
						</p>
						</div>
					</fieldset>
					</td>
					</tr>
			<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="abgc1" style="font-weight: bold; color: #FF0000">3</span>&nbsp;】个安保工程项目，
        					总里程共【&nbsp;<span id="abgc2" style="font-weight: bold; color: #FF0000">53.456</span>&nbsp;】公里，
        					隐患里程共【&nbsp;<span id="abgc3" style="font-weight: bold; color: #FF0000">15.100</span>&nbsp;】公里。</td>
       	 	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
