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
		    url:'/jxzhpt/gcybb/getGsdyhjdhzb.do',
		    striped:true,
		    pagination:false,
		    //fitColumns:true,
		    rownumbers:true,
		    checkOnSelect:true,
		    height:$(window).height()-160,
		    width:$(window).width()-20,
		    idField: 'id', //主键
		    queryParams: {
		    	xzqh:xzqhstr
		    	//'lxsh.jsxz':$("#jsxz").combobox('getValues').join(',')
			},
		   columns:[[
				{field:'ck',width:60,checkbox:true,rowspan:4,hidden:true},
		        {field:'v_0',title:'设区市',width:100,align:'center',rowspan:4,colspan:1},		        
		        {title:'2018年养护工作目标',align:'center',rowspan:1,colspan:20},
		        {title:'2018年养护工作进度情况',align:'center',rowspan:1,colspan:31}
	         ], [
			    {title:'养护大中修（含路面改造工程、灾毁恢复重建工程）',align:'center',rowspan:2,colspan:2},
		        {title:'路网结构改造工程',align:'center',colspan:6},
		        {title:'“畅安舒美”示范路',align:'center',rowspan:2,colspan:2},
		        {title:'服务设施',align:'center',colspan:8},
		        {title:'安全隐患整治',align:'center',rowspan:2,colspan:2},
		        {field:'v_21',title:' 本年完成总投资（万元）',align:'center',width:100,rowspan:3},
			    {title:'养护大中修（含路面改造工程、灾毁恢复重建工程）',align:'center',rowspan:2,colspan:3},			    
			    {title:'路网结构改造工程',align:'center',colspan:9},	    
		        {title:'“畅安舒美”示范路',align:'center',rowspan:2,colspan:3},
		        {title:'服务设施',align:'center',colspan:12},
		        {title:'安全隐患整治',align:'center',rowspan:2,colspan:3}
	         ], [
			    {title:'危桥改造',align:'center',colspan:2},
			    {title:'安全生命防护工程',align:'center',colspan:2},
			    {title:'灾害防治工程',align:'center',colspan:2},
			    {title:'综合养护中心',align:'center',colspan:2},
			    {title:'服务区',align:'center',colspan:2},
			    {title:'驿站、停车区',align:'center',colspan:2},
			    {title:'道班',align:'center',colspan:2},   
			    {title:'危桥改造',align:'center',colspan:3},
			    {title:'安全生命防护工程',align:'center',colspan:3},
			    {title:'灾害防治工程',align:'center',colspan:3},
			    {title:'综合养护中心',align:'center',colspan:3},
			    {title:'服务区',align:'center',colspan:3},
			    {title:'驿站、停车区',align:'center',colspan:3},
			    {title:'道班',align:'center',colspan:3}
	         ], [
		        //{field:'v_0',title:'设区市',width:200,width:100,align:'center',rowspan:3,colspan:1},		        
				{field:'v_1',title:'里程（公里）',width:150,align:'center'},
				{field:'v_2',title:'总投资（万元）',width:150,align:'center'},
				{field:'v_3',title:'座数（座）',width:100,align:'center'},
				{field:'v_4',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_5',title:'里程（公里）',width:100,align:'center'},
				{field:'v_6',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_7',title:'里程（公里）',width:100,align:'center'},
				{field:'v_8',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_9',title:'里程（公里）',width:100,align:'center'},
				{field:'v_10',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_11',title:'项目个数（个数）',width:100,align:'center'},
				{field:'v_12',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_13',title:'项目个数（个数）',width:100,align:'center'},
				{field:'v_14',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_15',title:'项目个数（个数）',width:100,align:'center'},
				{field:'v_16',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_17',title:'项目个数（个数）',width:100,align:'center'},
				{field:'v_18',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_19',title:'完成时间',width:100,align:'center'},
				{field:'v_20',title:'总投资（万元）',width:100,align:'center'},
		        //{field:'v_21',title:' 本年完成总投资（万元）',width:100,align:'center',rowspan:1,colspan:1,editor:{type: 'text',options:{required:false}}},
				{field:'v_22',title:'里程（公里）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_23',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_24',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},	
				{field:'v_25',title:'座数（座）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_26',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_27',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_28',title:'里程（公里）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_29',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_30',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_31',title:'里程（公里）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_32',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_33',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_34',title:'里程（公里）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_35',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_36',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_37',title:'项目个数（个数）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_38',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_39',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_40',title:'项目个数（个数）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_41',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_42',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_43',title:'项目个数（个数）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_44',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_45',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_46',title:'项目个数（个数）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_47',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_48',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_49',title:'完成时间',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_50',title:'总投资（万元）',width:100,align:'center',editor:{type: 'text',options:{required:false}}},
				{field:'v_51',title:'完成比例',width:100,align:'center',editor:{type: 'text',options:{required:false}}}
	         ]],
		    toolbar: [
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
             }, '-'],
             onLoadSuccess : function(data) {
            	datagrid.datagrid('resize'); 
            },
		    onClickCell: function (rowIndex, field, value) {
		    	beginEditing(rowIndex,field,value);
		    	datagrid.datagrid('showColumn', 'ck'); 
		    }

		}); 
		
	}
	
	var editIndex = undefined;
	function beginEditing (rowIndex,field,value) {
		  if (rowIndex != editIndex) {
		        if (endEditing()) {
		        	$('#datagrid').datagrid('beginEdit', rowIndex);
	                setEditing(rowIndex);
		            editIndex = rowIndex;
		        } else {
		            $('#datagrid').datagrid('selectRow', editIndex);
	                setEditing(rowIndex);
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
	
	function setEditing(rowIndex){
        var objGrid = $('#datagrid');  
        var v22Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_22'});
        var v25Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_25'});
        var v28Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_28'});
        var v31Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_31'});
        var v34Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_34'});
        var v37Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_37'});
        var v40Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_40'});
        var v43Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_43'});
        var v46Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_46'});
        var v50Editor = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_50'});


        v22Editor.target.bind("change", function(){    
            calculateV_22(rowIndex);
        }); 
        v25Editor.target.bind("change", function(){    
            calculateV_25(rowIndex);
        });
        v28Editor.target.bind("change", function(){    
            calculateV_28(rowIndex);
        }); 
        v31Editor.target.bind("change", function(){    
            calculateV_31(rowIndex);
        });
        v34Editor.target.bind("change", function(){    
            calculateV_34(rowIndex);
        });
        v37Editor.target.bind("change", function(){    
            calculateV_37(rowIndex);
        });
        v40Editor.target.bind("change", function(){    
            calculateV_40(rowIndex);
        });
        v43Editor.target.bind("change", function(){    
            calculateV_43(rowIndex);
        });
        v46Editor.target.bind("change", function(){    
            calculateV_46(rowIndex);
        });
        v50Editor.target.bind("change", function(){    
            calculateV_50(rowIndex);
        });
	}
	
	function calculateV_22(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v22Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_22'});
        var v24Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_24'});
		$(v24Edt.target).val(Math.round(($(v22Edt.target).val()/selectedRowData.v_1) * 100) + '%');
	}
	function calculateV_25(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v25Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_25'});
        var v27Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_27'});
		$(v27Edt.target).val(Math.round(($(v25Edt.target).val()/selectedRowData.v_3) * 100) + '%');
	}

	function calculateV_28(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v28Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_28'});
        var v30Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_30'});
		$(v30Edt.target).val(Math.round(($(v28Edt.target).val()/selectedRowData.v_5) * 100) + '%');
	}

	function calculateV_31(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v31Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_31'});
        var v33Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_33'});
		$(v33Edt.target).val(Math.round(($(v31Edt.target).val()/selectedRowData.v_7) * 100) + '%');
	}

	function calculateV_34(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v34Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_34'});
        var v36Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_36'});
		$(v36Edt.target).val(Math.round(($(v34Edt.target).val()/selectedRowData.v_9) * 100) + '%');
	}

	function calculateV_37(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v37Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_37'});
        var v39Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_39'});
		$(v39Edt.target).val(Math.round(($(v37Edt.target).val()/selectedRowData.v_11) * 100) + '%');
	}

	function calculateV_40(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v40Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_40'});
        var v42Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_42'});
		$(v42Edt.target).val(Math.round(($(v40Edt.target).val()/selectedRowData.v_13) * 100) + '%');
	}
	
	function calculateV_43(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v43Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_43'});
        var v45Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_45'});
		$(v45Edt.target).val(Math.round(($(v43Edt.target).val()/selectedRowData.v_15) * 100) + '%');
	}

	function calculateV_46(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v46Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_46'});
        var v48Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_48'});
		$(v48Edt.target).val(Math.round(($(v46Edt.target).val()/selectedRowData.v_17) * 100) + '%');
	}

	function calculateV_50(rowIndex){
		var objGrid = $('#datagrid'); 
		var selectedRowData = objGrid.datagrid('getSelected');
		var v50Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_50'});
        var v51Edt = objGrid.datagrid('getEditor',{index:rowIndex,field:'v_51'});
		$(v51Edt.target).val(Math.round(($(v50Edt.target).val()/selectedRowData.v_20) * 100) + '%');
	}
	
	function saveQqtjb(rows){
       for(var i=0;i<rows.length;i++){
        	data="excel_list.id="+rows[i].id+"&excel_list.v_0="+rows[i].v_0+"&excel_list.v_21="+rows[i].v_21+"&excel_list.v_22="+rows[i].v_22+"&excel_list.v_23="+rows[i].v_23+
        	"&excel_list.v_24="+rows[i].v_24+"&excel_list.v_25="+rows[i].v_25+"&excel_list.v_26="+rows[i].v_26+"&excel_list.v_27="+rows[i].v_27+
        	"&excel_list.v_28="+rows[i].v_28+"&excel_list.v_29="+rows[i].v_29+"&excel_list.v_30="+rows[i].v_30+
        	"&excel_list.v_31="+rows[i].v_31+"&excel_list.v_32="+rows[i].v_32+"&excel_list.v_33="+rows[i].v_33+
        	"&excel_list.v_34="+rows[i].v_34+"&excel_list.v_35="+rows[i].v_35+"&excel_list.v_36="+rows[i].v_36+
        	"&excel_list.v_37="+rows[i].v_37+"&excel_list.v_38="+rows[i].v_38+"&excel_list.v_39="+rows[i].v_39+
        	"&excel_list.v_40="+rows[i].v_40+"&excel_list.v_41="+rows[i].v_41+"&excel_list.v_42="+rows[i].v_42+
        	"&excel_list.v_43="+rows[i].v_43+"&excel_list.v_44="+rows[i].v_44+"&excel_list.v_45="+rows[i].v_45+
        	"&excel_list.v_46="+rows[i].v_46+"&excel_list.v_47="+rows[i].v_47+"&excel_list.v_48="+rows[i].v_48+
        	"&excel_list.v_49="+rows[i].v_49+"&excel_list.v_50="+rows[i].v_50+"&excel_list.v_51="+rows[i].v_51;
    		$.ajax({
    			type:'post',
    			url:'/jxzhpt/gcybb/insertGsdyhjdhzb.do',
    	        data:data,
    			dataType:'json',
    			success:function(msg){
    			}
    		});
        }
		alert("保存成功！");
	}
	
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
	    
		window.location.href="/jxzhpt/gcybb/getGsdyhjdhzb.do?"+param;
		
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
						<div id="p_top">五年项目库>&nbsp;十三五>&nbsp;全省汇总表>&nbsp;普通国省道建设项目前期工作推进表</div>
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
        	    <div align="center" style="font-size:x-large;font-weight: bolder; margin-top:8px; margin-bottom:5px;">国省道养护工作进度汇总表</div>
        	    <div><table id="datagrid"></table> </div>
        	    </td>
        	</tr>        	
		</table>
	</div>
</body>
</html>
