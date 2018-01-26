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
		    url:'/jxzhpt/qqgl/queryTjbxx.do',
		    striped:true,
		    pagination:false,
		    rownumbers:true,
		    checkOnSelect:true,
		    height:$(window).height()-160,
		    width:$(window).width()-20,
		    idField: 'lsxmid', //主键
		    queryParams: {
		    	xzqh:xzqhstr,
		    	'lxsh.jsxz':$("#jsxz").combobox('getValue')
			},
			frozenColumns:[[
				{field:'ck',checkbox:true,rowspan:2,hidden:true},
				{field:'xzqhdm',title:'地市',width:60,align:'center',rowspan:2},
		        {field:'xzqh',title:'县、区',width:100,align:'center',rowspan:2},
		        {field:'ghlxbm',title:'规划路线编码',width:100,align:'center',rowspan:2},
		        {field:'xmmc',title:'项目名称',width:180,align:'center',rowspan:2},
		        {field:'xmbm',title:'项目库编码',width:120,align:'center',rowspan:2,editor:{type: 'text',options:{required:false}}},
			]],
		   columns:[[
		        {field:'tsdq',title:'项目所属的集中连片特困区域',width:100,align:'center',rowspan:2},
		        {field:'ghqdzh',title:'规划起点桩号',width:100,align:'center',rowspan:2},
		        {field:'ghzdzh',title:'规划止点桩号',width:100,align:'center',rowspan:2},
		        {field:'jsxz',title:'建设性质',width:100,align:'center',rowspan:2},
		        //{field:'xmbm',title:'项目编码',width:100,align:'center',rowspan:2},
		        {title:'现技术等级（公里）',colspan:6},
		        {title:'建设规模（公里）/（延米）',colspan:6},
		        {title:'建设年限',colspan:2},
		        {field:'scxdnf',title:'首次下达年份',width:100,align:'center',rowspan:2},
		        {field:'ztz',title:'总投资（万元）',width:100,align:'center',rowspan:2},
		        {field:'cgs',title:'中央车购税投资（万元）',width:100,align:'center',rowspan:2,
		        	formatter: function(value,row,index){
	        			var zj = zycgscs(row);
	     	 	        params.push({"lsxmid":row.lsxmid,"cgs":zj});
	     	 		    var json = JSON.stringify(params);  
	     	 		    $('#excelcgs').val(json);
		        		if(row.cgs==""){
							return '<font style="color:#2F4F4F;">'+zj+'</font>';
		        		}else{
		        			return value;
		        		}
					} 
		        },
		        {field:'hyscsb',title:'是否组织行业审查',width:100,align:'center',rowspan:2,
		        	formatter: function(value,row,index){
						if(value=="0"){return '否';}
						if(value=="1"){return '是';}
					}
		        },
		        {field:'gksb',title:'是否完成工可文本编制',width:100,align:'center',rowspan:2,
					formatter: function(value,row,index){
						if(value=="0"){return '否';}
						if(value=="1"){return '是';}
					}
		        },
		        {title:'工可行业审查意见',colspan:2},
		        {title:'工可批复',colspan:2},
		        {title:'初设批复',colspan:2},
		        {title:'规划',colspan:2},
		        {title:'用地',colspan:2},
		        {field:'lsxmbm',title:'项目编码',width:100,align:'center',rowspan:2}
	         ],
			[	
			    {field:'lc',title:'合计',width:80,align:'center',rowspan:1},
			    {field:'yilc',title:'一级公路',width:80,align:'center',rowspan:1},
			    {field:'erlc',title:'二级公路',width:80,align:'center',rowspan:1},
			    {field:'sanlc',title:'三级公路',width:80,align:'center',rowspan:1},
			    {field:'silc',title:'四级公路',width:80,align:'center',rowspan:1},
			    {field:'dwlc',title:'等外',width:80,align:'center',rowspan:1},
			    {field:'jszlc',title:'合计',width:80,align:'center',rowspan:1},
			    {field:'jhyilc',title:'一级公路',width:80,align:'center',rowspan:1},
			    {field:'jherlc',title:'二级公路',width:80,align:'center',rowspan:1},
			    {field:'jhsanlc',title:'三级公路',width:80,align:'center',rowspan:1},
			    {field:'ql_ym',title:'独立桥梁',width:80,align:'center',rowspan:1},
			    {field:'sd_ym',title:'独立隧道',width:80,align:'center',rowspan:1},
			    {field:'kgsj',title:'开工年',width:80,align:'center',rowspan:1},
			    {field:'wgsj',title:'完工年',width:80,align:'center',rowspan:1},
			    {field:'hyscyj',title:'文号',width:100,align:'center',rowspan:1},
			    {field:'tgsj',title:'批复时间',width:100,align:'center',rowspan:1},
			    {field:'gkpfwh',title:'文号',width:100,align:'center',rowspan:1},
			    {field:'pfsj',title:'批复时间',width:100,align:'center',rowspan:1},
			    {field:'sjpfwh',title:'文号',width:100,align:'center',rowspan:1},
			    {field:'sjpfsj',title:'批复时间',width:100,align:'center',rowspan:1},
			    {field:'ghwh',title:'文号',width:100,align:'center',rowspan:1,editor:{type: 'text',options:{required:false}}},
			    {field:'ghpfsj',title:'批复时间',width:100,align:'center',rowspan:1,editor:{type: 'datebox',options:{required:false}}},
			    {field:'ydwh',title:'文号',width:100,align:'center',rowspan:1,editor:{type: 'text',options:{required:false}}},
			    {field:'ydpfsj',title:'批复时间',width:100,align:'center',rowspan:1,editor:{type: 'datebox',options:{required:false}}}
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
        	data="lxsh.lsxmid="+rows[i].lsxmid+"&lxsh.xmbm="+rows[i].xmbm+"&lxsh.ghwh="+rows[i].ghwh+"&lxsh.ghpfsj="+rows[i].ghpfsj+
        	     "&lxsh.ydwh="+rows[i].ydwh+"&lxsh.ydpfsj="+rows[i].ydpfsj;
    		$.ajax({
    			type:'post',
    			url:'/jxzhpt/qqgl/insertWnqqtjb.do',
    	        data:data,
    			dataType:'json',
    			success:function(msg){
    			}
    		});
        }
		alert("保存成功！");
	}

	function zycgscs(row){
		
		var tsdqbz = contains(row.tsdq,"原中央苏区");
		var xzqhbz = contains(row.xzqhdm,"赣州市");
		
		 //路总金额
		var lxgd = accAdd(accMul(row.yjgd,1000),accMul(row.ejgd,500));
		var lxsd = accAdd(accAdd(accMul(row.yjsd,350),accMul(row.ejsd,350)),accMul(row.sjsd,150));
		if(true == tsdqbz && false == xzqhbz){
			lxsd = accMul(lxsd,1.1);
		} 
		if(true == xzqhbz){
			lxsd = accMul(lxsd,1.2);
		}
		var lx = accAdd(lxgd,lxsd);

        //独立桥梁总金额
        var qlgd = accAdd(accDiv(accMul(accMul(row.yjgdql,21),3000),10000),accDiv(accMul(accMul(row.ejgdql,21),3000),10000));
        var qlsd = accAdd(accAdd(accDiv(accMul(accMul(row.yjsdql,8),3000),10000),accDiv(accMul(accMul(row.ejsdql,8),3000),10000)),accDiv(accMul(accMul(row.sjsdql,8),3000),10000));
        var ql = accAdd(qlgd,qlsd);

        //独立隧道总金额        
        var sdgd = accAdd(accDiv( accMul(accMul(row.yjgdsd,21) ,3000 ),10000 ),accDiv(accMul(accMul(row.ejgdsd,21),3000),10000));
        var sdsd = accAdd(accAdd(accDiv(accMul(accMul(row.yjsdsd,8),3000),10000),accDiv(accMul(accMul(row.ejsdsd,8),3000),10000)),accDiv(accMul(accMul(row.sjsdsd,8),3000),10000));
        var sd = accAdd(sdgd,sdsd);

        //按路程标准补助桥梁
        var qlgdbz = accAdd(accMul(accDiv(row.yjgdql,1000),1000),accMul(accDiv(row.ejgdql,1000),500));
        var qlsdbz = accAdd(accAdd(accMul(accDiv(row.yjsdql,1000),350),accMul(accDiv(row.ejsdql,1000),350)),accMul(accDiv(row.sjsdql,1000),150));
        var qlbz = accAdd(qlgdbz,qlsdbz);

        //按路程标准补助隧道
        var sdgdbz = accAdd(accMul(accDiv(row.yjgdsd,1000),1000),accMul(accDiv(row.ejgdsd,1000),500));
        var sdsdbz = accAdd(accAdd(accMul(accDiv(row.yjsdsd,1000),350),accMul(accDiv(row.ejsdsd,1000),350)),accMul(accDiv(row.sjsdsd,1000),150));
        var sdbz = accAdd(sdgdbz,sdsdbz);
        
		return new Number(accSub(accAdd(lx,accAdd(ql,sd)),accAdd(qlbz,sdbz))).toFixed(0);
	}
	
	//模糊查询字段
	function contains(str1,str2){
		if(str1 == "" || str1 == undefined || str1 == null){
			return false;
		}else{
			var data = str1.split(",");
		        for(var i = 0;i < data.length;i++){	
		            if(data[i].match(str2+".*") != null){
		            	return true;
	 	            }
		        }
		        return false;
		}
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
		var param='lxsh.xzqh='+xzqhstr+'&lxsh.jsxz='+encodeURI(encodeURI($("#jsxz").combobox('getValue')));
		var sql=$("#excelcgs").val();
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{sql:sql},function(){
			window.location.href="/jxzhpt/qqgl/exportWnqqtjExcel.do?"+param;
		 });		
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
		 						<td><select class="easyui-combobox" name="jsxz" id="jsxz" style="width: 100px;"data-options="editable:false,panelHeight:'auto'">
									<option value="">全部</option>
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
        	    <div align="center" style="font-size:x-large;font-weight: bolder; margin-top:8px; margin-bottom:5px;">“十三五”普通国省道建设项目前期工作推进表</div>
        	    <div><table id="datagrid"></table> </div>
        	    </td>
        	</tr>        	
		</table>
	</div>
</body>
</html>
