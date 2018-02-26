<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目</title>
	<link href="/jxzhpt/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/js/uploader/uploadify.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/buttons.css" />
	<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/jxzhpt/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="/jxzhpt/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
	<script type="text/javascript" src="/jxzhpt/page/wngh/wnjh/js/wnjh.js"></script>
	<script type="text/javascript">
	$(function(){
		loadDist1("xzqh",$.cookie("dist"));
		showTjb();
	});

	function showTjb(){
		var  params = [];
		var datagrid; //定义全局变量datagrid
		var xzqhdm=$("#xzqh").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
				
		datagrid=$('#datagrid').datagrid({    
		    url:'/jxzhpt/qqgl/getSjgzjdhzb.do',
		    striped:true,
		    pagination:false,
		    rownumbers:true,
		    checkOnSelect:true,
		    height:$(window).height()-160,
		    width:$(window).width()-20,
		    idField: 'id', //主键
		    queryParams: {
		    	xzqh:xzqhstr,
		    	'lxsh.jsxz':$("#jsxz").combobox('getValues').join(',')
			},
		   columns:[[
				{field:'ck',checkbox:true,rowspan:3,hidden:true},
		        {field:'v_0',title:'设区市',width:100,align:'center',rowspan:3},		        
		        {title:'2018年项目建设',align:'center',colspan:17}
	         ],[
			    {title:'2018年项目建设目标',align:'center',colspan:4},			    
			    {title:'目标任务内项目建设进度情况',align:'center',colspan:8},
			    {title:'目标任务外项目建设进度情况',align:'center',colspan:5}

	         ],[
				{field:'v_1',title:'开工里程（公里）',width:100,align:'center',rowspan:1},
				{field:'v_2',title:'开工项目个数',width:100,align:'center',rowspan:1},
				{field:'v_3',title:'完工里程（公里）',width:100,align:'center',rowspan:1},
				{field:'v_4',title:'完成投资（万元）',width:100,align:'center',rowspan:1},
				{field:'v_5',title:'已完工',width:100,align:'center',rowspan:1},
				{field:'v_6',title:'在建',width:100,align:'center',rowspan:1},
				{field:'v_7',title:'其中2018年新开工',width:120,align:'center',rowspan:1},
				{field:'v_8',title:'未开工',width:100,align:'center',rowspan:1},
				{field:'v_9',title:'自开工建设累计已完工（公里）',width:160,align:'center',rowspan:1},
				{field:'v_10',title:'其中2018年完工里程（公里）',width:120,align:'center',rowspan:1},
				{field:'v_11',title:'自开工建设累计完成总投资（万元）',width:140,align:'center',rowspan:1},
				{field:'v_12',title:'其中2018年完成投资（万元）',width:120,align:'center',rowspan:1},
				{field:'v_13',title:'2018年新开工个数',width:100,align:'center',rowspan:1},
				{field:'v_14',title:'自开工建设累计已完工（公里）',width:160,align:'center',rowspan:1},
				{field:'v_15',title:'其中2018年完工里程（公里）',width:120,align:'center',rowspan:1},
				{field:'v_16',title:'自开工建设累计完成总投资',width:120,align:'center',rowspan:1},
				{field:'v_17',title:'其中2018年完成投资',width:120,align:'center',rowspan:1}
	         ]],
             /*toolbar: [
		    	//{ text: '编辑', iconCls: 'icon-edit', handler: function () {}}, '-',
             { text: '保存', iconCls: 'icon-save', handler: function () {
                 datagrid.datagrid('hideColumn', 'ck');
            	 endEditing();
                 //保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
        		 var rows=datagrid.datagrid('getSelections');
                 if(rows.length==0){
        			alert("请勾选要保存的数据！");
        			return;
        		}else{
                    if(confirm("确定要保存当前数据？")){
                        saveQqtjb(rows);
                    }
        		}
             }
             }, '-',
             { text: '取消编辑', iconCls: 'icon-redo', handler: function () {
                 //取消当前编辑行把当前编辑行罢undefined回滚改变的数据,取消选择的行
                 if(confirm("确定要撤销所有的更改？")){
                     editRow = undefined;
                     datagrid.datagrid('hideColumn', 'ck');
                     datagrid.datagrid("rejectChanges");
                     datagrid.datagrid("unselectAll");
                 }
             }
             }, '-'], */
		    /* onClickCell: function (rowIndex, field, value) {
		    	beginEditing(rowIndex,field,value);
		    	datagrid.datagrid('showColumn', 'ck'); 
		    } */

		}); 
		
	}
	
	/* var editIndex = undefined;
	function beginEditing (rowIndex,field,value) {
		  if (rowIndex != editIndex) {
		        if (endEditing()) {
		        	$('#datagrid').datagrid('beginEdit', rowIndex);
		            editIndex = rowIndex;
		        } else {
		            $('#datagrid').datagrid('selectRow', editIndex);
		        }
		    }
	}
	function endEditing() {
	    if (editIndex == undefined) { return true; }	    
	    if ($('#datagrid').datagrid('validateRow', editIndex)) {
	        $('#datagrid').datagrid('endEdit', editIndex);
	        editIndex = undefined;	        
	        return true;
	    } else {
	        return false;
	    }
	}
	function saveQqtjb(rows){
       for(var i=0;i<rows.length;i++){
        	data="excel_list.id="+rows[i].id+"&excel_list.v_5="+rows[i].v_5+"&excel_list.v_6="+rows[i].v_6+"&excel_list.v_7="+rows[i].v_7+"&excel_list.v_8="+rows[i].v_8+
        	"&excel_list.v_9="+rows[i].v_9+"&excel_list.v_10="+rows[i].v_10+"&excel_list.v_11="+rows[i].v_11+"&excel_list.v_12="+rows[i].v_12+
        	"&excel_list.v_13="+rows[i].v_13+"&excel_list.v_14="+rows[i].v_14;
    		$.ajax({
    			type:'post',
    			url:'/jxzhpt/qqgl/insertSjgzjdhzb.do',
    	        data:data,
    			dataType:'json',
    			success:function(msg){
    			}
    		});
        }
		alert("保存成功！");
	} */
	
	function dcExcel(){
		var xzqhdm=$("#xzqh").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");		
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var param='flag=1';
		//var sql=$("#excelcgs").val();
	    
		window.location.href="/jxzhpt/qqgl/getSjgzjdhzb.do?"+param;
		
	}
	
	 function onSelect(r) {
	        if (r.text == '全部') {
	            $(this).combobox('clear').combobox('setValue', r.value)
	        }
	        else $(this).combobox('unselect', "改建,路面改造,新建");
	        }
	</script>
	<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}

</style>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr> 
			    <td>
					<div id="righttop">
						<div id="p_top">五年项目库>&nbsp;十三五>&nbsp;全省汇总表>&nbsp;普通国省道升级改造项目建设进度汇总表</div>
					</div>
				</td>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.9%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				    <input id="excelcgs" name="excelcgs" type="hidden"/>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
        						<tr height="32">
        						<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
        						<td align="right">建设性质：</td>
		 						<td><select class="easyui-combobox" name="jsxz" id="jsxz" style="width: 130px;"data-options="editable:false,panelHeight:'auto',multiple:true,onSelect:onSelect">
									<option value="改建,路面改造,新建">全部</option>
									<option value="改建">改建</option>
									<option value="路面改造">路面改造</option>
									<option value="新建">新建</option>
								</select></td>												
							</tr>
							
        					<tr height="32">
        						<td colspan="10">
        						<img onclick="showTjb()" alt="查询" src="/jxzhpt/images/Button/Serch01.gif" onmouseover="this.src='/jxzhpt/images/Button/Serch02.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;"/>
								<img alt="导出Ecel" src="/jxzhpt/images/Button/dcecl1.gif" onmouseover="this.src='/jxzhpt/images/Button/dcecl2.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/dcecl1.gif' " onclick="dcExcel()" style="vertical-align: -50%;" />
        				        </td>	
        				    </tr>
        				  </table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        	    <td>
        	    <div align="center" style="font-size:x-large;font-weight: bolder; margin-top:8px; margin-bottom:5px;">普通国省道升级改造项目建设进度汇总表</div>
        	    <div><table id="datagrid"></table> </div>
        	    </td>
        	</tr>        	
		</table>
	</div>
</body>
</html>
