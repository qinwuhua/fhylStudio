<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>示范路工程计划下达</title>
<link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/css/style.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/css/buttons.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
<script type="text/javascript" src="/jxzhpt/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="/jxzhpt/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="/jxzhpt/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="/jxzhpt/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="/jxzhpt/page/qqgl/js/util.js"></script>
<script type="text/javascript" src="/jxzhpt/js/json2.js"></script>
<script type="text/javascript" src="/jxzhpt/js/datagrid-cellediting.js"></script>
<script type="text/javascript">
$(function(){
	querySflgcXdXmlb();
	querySflgcXdJhbz();
	loadylx('lxbm');
	loadDist1("xzqh",$.cookie("dist"));
	xmnf("xmnf");
});

//示范路工程项目列表查询
function querySflgcXdXmlb(){
	grid.id="xmlb";
	grid.url="../../../qqgl/querySflgcXdXmlb.do";

	//grid.queryParams=params;
	//loadLj(params);
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=10;
	grid.pageNumber=1;
	grid.columns=[[
					{field:'ck',checkbox:true},
					{field:'cz',title:'操作',width:130,align:'center',
						formatter: function(value,row,index){
							var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
							result+='&nbsp;<a href="javascript:openWindow1('+"'sflgcDetail'"+','+"'示范路工程'"+','+
							"'/jxzhpt/page/qqgl/jhsh/sflgc_detail.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">详细</a>'
//	 						+'&nbsp;<a href="javascript:qxxm('+row.xmbm+')" style="color:#3399CC;">取消</a>'
                            ;
							xmlx=4;
							//result+='&nbsp;<a href="javascript:openJhxd1('+"'jhxd1.jsp',"+index+')" style="color:#3399CC;">编辑</a>';
							
/* 							if($.cookie('unit2').length!=7){
								if(row.xdzt=='1')
									result+='&nbsp;编辑';
								else
									result+='&nbsp;<a href="javascript:openWindow1('+"'jhxd'"+','+"'编辑'"+','+
									"'/jxzhpt/page/qqgl/jhsh/sflgc1.jsp'"+",900,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">编辑</a>';
							}else{
								result+='&nbsp;<a href="javascript:openWindow1('+"'jhxd'"+','+"'编辑'"+','+
								"'/jxzhpt/page/qqgl/jhsh/sflgc1.jsp'"+",900,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">编辑</a>';
							}	 */
							return result;
						}
					},
					
					{field:'xdzt',title:'审核状态',width:60,align:'center',
						formatter: function(value,row,index){
							var result="";
							xmlx=1;
							if(row.xdzt=='0')
								result='未审核';
							if(row.xdzt=='1')
								result='已审核';	
//	 						var result='<a href="javascript:openWindow('+"'jhxd'"+','+"'计划审核'"+','+
//	 							"'/jxzhpt/page/qqgl/jhsh/jhxd3.jsp'"+',900,400)" style="color:#3399CC;">计划审核</a>';
							return result;
						}
					},
					{field:'lsjl',title:'历史记录',width:60,align:'center',
						formatter: function(value,row,index){
							if(value=="是"){
								return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
							}else{
								return value;
							}
						}
					},
			        {field: 'xmbm', title: '项目编码', width: 120, align: 'center'},
			        {field: 'xlxbm', title: '新路线编码', width: 60, align: 'center'},
			        {field: 'xzqh', title: '行政区化', width: 60, align: 'center'},
			        {field: 'pfwh', title: '批复文号', width: 60, align: 'center'},
			        {field: 'xqdzh', title: '新起点桩号', width: 120, align: 'center'},
			        {field: 'xzdzh', title: '新止点桩号', width: 120, align: 'center'},
			        
			        {field:'ztz',title:'总投资(万元)',width:100,align:'center'},
					{field:'tbz',title:'厅补助(万元)',width:60,align:'center'},
					{field:'tbz_jaf',title:'建安费(万元)',width:70,align:'center'},
					{field:'tbz_gcjlf',title:'工程监理费(万元)',width:80,align:'center'},
				    {field:'tbz_qqgzf',title:'前期工作费(万元)',width:80,align:'center'},
				    {field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				    {field:'zydpx',title:'重要度排序',width:100,align:'center'},
				    
			        {field: 'sjpfdw', title: '设计批复单位', width: 140, align: 'center'},
			        {field: 'sjpfsj', title: '设计批复时间', width: 140, align: 'center'},
			        {field: 'zyjsnr', title: '主要建设内容', width: 140, align: 'center'},
			        {field: 'gcsl', title: '工程数量', width: 140, align: 'center'}
				]];
	gridBind1(grid);
}

//示范路工程计划编制查询
function querySflgcXdJhbz(){
	$('#jhbz').datagrid({    
	    url:'/jxzhpt/qqgl/querySflgcXdJhbz.do',
	    striped:true,
	    pagination:false,
	    rownumbers:true,
	    checkOnSelect:true,
	    height:$(window).height()-300,
	    width:$(window).width()-20,
	    idField: 'xmbm', //主键
	    queryParams: "",
	    columns:[[
		{field:'ck',checkbox:true,width:20,align:'center'},
		/* {field:'xdzt',title:'资金下达',width:60,align:'center',
			formatter: function(value,row,index){
				var result='<a href="javascript:openWindow('+"'lmsjzjxd'"+','+"'国省道改造  — 资金下达'"+','+
					"'/jxzhpt/page/qqgl/zjxd/lmsj_zjxd.jsp'"+',900,400)" style="color:#3399CC;">资金下达</a>';
				return result;
			}
		}, */
		
		{field:'xzqh',title:'行政区划',width:60,align:'center'},
		{field:'xmnf',title:'项目年份',width:60,align:'center',
			formatter: function(value,row,index){
        		return row.xmbm.substr(0,4);
        	}
		},
        {field: 'xmbm', title: '项目编码', width: 120, align: 'center'},
        {field: 'xlxbm', title: '新路线编码', width: 60, align: 'center'},
        {field: 'xzqh', title: '行政区化', width: 60, align: 'center'},
        {field: 'pfwh', title: '批复文号', width: 60, align: 'center'},
        {field: 'xqdzh', title: '新起点桩号', width: 120, align: 'center'},
        {field: 'xzdzh', title: '新止点桩号', width: 120, align: 'center'},
        
		{field:'xdsj',title:'下达年份',width:70,align:'center',editor:{type:'numberbox',options:{required:false}}},
		{field:'ztz',title:'总投资(万元)',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
		{field:'stz',title:'厅补助(万元)',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
		{field:'dfzc',title:'地方自筹(万元)',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
	    
        {field: 'sjpfdw', title: '设计批复单位', width: 140, align: 'center'},
        {field: 'sjpfsj', title: '设计批复时间', width: 140, align: 'center'},
        {field: 'zyjsnr', title: '主要建设内容', width: 140, align: 'center'},
        {field: 'gcsl', title: '工程数量', width: 140, align: 'center'}
		
	    ]],
	    onClickCell: function (rowIndex, field, value) {
		alert(field);
	    	beginEditing(rowIndex,field,value);
	    	//$('#jhbz').datagrid('enableCellEditing').datagrid('gotoCell', {index: rowIndex,field: field});
	    }
	}); 
}

var editIndex = undefined
//示范路工程计划编制开始编辑
/**
 * rowIndex：编辑所在行
 * field：编辑所选择列名
 * value：编辑所选择列名对应的值
 */
function beginEditing (rowIndex,field,value) {
	 if (rowIndex != editIndex) {
		   if (endEditing()) {
		       $('#jhbz').datagrid('beginEdit', rowIndex);		        	
		           editIndex = rowIndex;	            
		        } else {
		            $('#jhbz').datagrid('selectRow', editIndex);
		        }
		  }
	}		
//示范路工程计划编制结束编辑
		function endEditing() {
		    if (editIndex == undefined) { return true; }		    
		    if ($('#jhbz').datagrid('validateRow', editIndex)) {	    	
		        $('#jhbz').datagrid('endEdit', editIndex);
		        //$('#jhbz').datagrid('selectRow', editIndex);
		        editIndex = undefined;   
		        return true;
		    } else {
		        return false;
		    }
		}
//计划编制生成汇总
function createAll(){
			endEditing();
			var rows=$('#jhbz').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要生成统计表的计划");
				return;
			}
			alert(rows[0].ztz);
		}
//计划编制计划下达
function planxdwhAll(){
	endEditing();
	var rows=$('#jhbz').datagrid('getSelections');
	if(rows.length==0){
		alert("请勾选要下达的计划");
		return;
	}
	//只有当地方自筹张资金归零才可以使资金归零勾选框生效
	if($("#zjgl").is(':checked')){
		for(var i=0;i<rows.length;i++){
			if(rows[i].dfzc!='0'){
				//alert(rows[i].bzcgs);
				alert("所选项目中地方自筹未下达完,不能使用资金归0下达");
				return;
			}
		}
	}  
	$('#jhxd').dialog("open");
}

/* function planxdAll(){
	if($("#zjgl").is(':checked')){//资金归0下达，即是不需要文件和文号下达
		$('#jhxd').dialog("close");
		var jhxdwh=$('#bzxdwh').val();
		var bztbsj=$('#bztbsj').datebox('getValue');
		if(bztbsj==''){
			alert("请填写计划下达时间。");
			return;
		}
		$('#bztbsj').datebox('setValue', formatDate(new Date()));
		$('#bzxdwh').val("");
		var rows=$('#jhbz').datagrid('getSelections');
		if(rows.length==0){
			alert("请勾选要下达的计划");
			return;
		}
		for(var i=0;i<rows.length;i++){
			rows[i].jhxdwh=jhxdwh;
			rows[i].bztbsj=bztbsj;
			//alert(rows[i].xmbm.substr(10,1));
			rows[i].xmlx=rows[i].xmbm.substr(10,1);
		}
		var json_data = JSON.stringify(rows); 
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/planxdAll.do',
			data:"jhxdwh="+jhxdwh+"&bztbsj="+bztbsj+"&json_data="+json_data,
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("下达成功");
					queryxmList();
					showMxbAll();
				}	
			}
		});
		
		
	}else{
		if($("#sjpfTable").html()==''){
			alert("请上传该文号对应的文件。");
			return;
		}
		$('#jhxd').dialog("close");
		//alert($('#bzxdwh').val()+"     "+$('#bztbsj').datebox('getValue'));
		var jhxdwh=$('#bzxdwh').val();
		var bztbsj=$('#bztbsj').datebox('getValue');
		if(jhxdwh==''||bztbsj==''){
			alert("请填写计划下达文号或计划下达时间。");
			return;
		}
		$('#bztbsj').datebox('setValue', formatDate(new Date()));
		$('#bzxdwh').val("");
		var rows=$('#jhbz').datagrid('getSelections');
		if(rows.length==0){
			alert("请勾选要下达的计划");
			return;
		}
		for(var i=0;i<rows.length;i++){
			rows[i].jhxdwh=jhxdwh;
			rows[i].bztbsj=bztbsj;
			//alert(rows[i].xmbm.substr(10,1));
			rows[i].xmlx=rows[i].xmbm.substr(10,1);
		}
		var json_data = JSON.stringify(rows); 
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/planxdAll.do',
			data:"jhxdwh="+jhxdwh+"&bztbsj="+bztbsj+"&json_data="+json_data,
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("下达成功");
					queryxmList();
					showMxbAll();
				}
					
			}
		});
	}
} */



</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
<div id="righttop">
		<div id="p_top">计划管理>&nbsp;<span id="astext">计划下达</span>>&nbsp;<span id="bstext"></span>>&nbsp;国省道改造</div>
	</div>
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
        					<tr height="32">
								<td align="right">行政区划：</td>
								<td><select id="xzqh" style="width: 134px;"></select></td>
								<td align="right">项目名称：</td>
								<td><input name="xmmc" id="xmmc" style="width: 100px;"
									type="text" /></td>
								<td align="right">项目年份：</td>
								<td><select id="xmnf" style="width: 100px;"></select></td>
								

							</tr>
							<tr height="32">
								
								<td align="right">路线名称：</td>
								<td><input type="text" id="lxmc" style="width: 130px;" /></td>
								<td align="right">项目编码：</td>
								<td><input type="text" id="ydbmc" style="width: 100px;" /></td>
								<td align="right">下达状态：</td>
								<td><select id="xdzt" class="easyui-combobox"
									style="width: 100px;">
										<option value="-1" selected="selected">全部</option>
										<option value="0">未下达</option>
										<option value="1">未完成</option>
										<option value="1">已完成</option>
								</select></td>
							</tr>
        						<tr>
        						<td colspan="10">
        							<img onclick="searchlist()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/>
									<img onclick="exportZjxd()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        						</td>
        					</tr>
        				</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方自筹【<span id="dftz" style="color: red;">0</span>】万元,
            		银行贷款【<span id="yhdk" style="color: red;">0</span>】万元。
            		</div>
            		<div id="tt" border="false" class="easyui-tabs" >
            		<script type="text/javascript">
                	$("#tt").attr('style','width:'+($(window).width()*0.99)+'px');
     				</script>
	            		<div title="项目列表" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
					    	<table id="xmlb"></table>
					    </div>
					    <div title="计划编制" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
					    	<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:createAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">生成汇总</a>
					    	<a id='mybuttion3' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdwhAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">计划下达</a>
					    	<input id='zjgl' type="checkbox">资金归0
					    	<table id="jhbz">
					    	</table>
					    </div>
				    </div>
            	</td>
        	</tr>
		</table>
		<div id="wj" class="easyui-dialog" title="计划下达文件" style="width:500px;height:200px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
					<table width="99.9%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 100%;" cellspacing="0" cellpadding="0">
		
				<tr style="height: 100%;font-size: 10px;">
					
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="wjTable"></tbody>
						</table>
						
					</td>
				</tr>
			</table>
		</div>
		<div id="jhxd" class="easyui-dialog" title="计划下达" style="width:500px;height:250px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
			<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达文号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="bzxdwh" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达时间</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="bztbsj" type="text"  class="easyui-datebox" />
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						下达文件</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td colspan="2">待上传：<div id="fileQueue" ></div></td>
							</tr>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('/jxzhpt/js/uploader/bdll.png');" name="uploadJhxd" id="uploadJhxd" /></td>
								<td>
									<img name="uploadFile" id="uploadFile" src="/jxzhpt/js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr style="height: 30px;font-size: 10px;">
					<td colspan="2" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 45%;">
						<a id='mybuttion4' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion4')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion4')"  class="button button-tiny button-rounded button-raised button-primary">下达</a>		
					</td>
				</tr>
			</table>
		</div>
</body>
</html>
