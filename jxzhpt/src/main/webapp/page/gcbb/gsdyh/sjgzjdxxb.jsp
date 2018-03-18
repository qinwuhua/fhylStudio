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
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1; 
		for(var x=y;x>=2010;x--){
			$("#ddlYear").append("<option value="+x+">"+x+"</option>");
		}
		$("#yf"+m).attr("selected","selected");
		//$("#biaotou").empty();
		
		var nf=$("#ddlYear").val();var yf=$("#ddlMonth").val();
		$(".nian").html(nf);
		$(".yue").html(yf);
		$(".nianyue1").html(nf+"年"+yf);
		$(".nianyue2").html(nf+".12");
		showTjb();
	});

	function showTjb(){
		var nf=$("#ddlYear").val();
		var bnwglc = nf+'年度完工里程（公里）';
		var bnwcztz = nf+'年度完成投资（万元）'
		var dfzcJson = [];
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
		    //url:'/jxzhpt/gcybb/getSjgzjdhzb.do',
		    url:'/jxzhpt/qqgl/getSjgzjdxxb.do',
		    striped:true,
		    pagination:false,
		    rownumbers:true,
		    checkOnSelect:true,
		    height:$(window).height()-160,
		    width:$(window).width()-20,
		    idField: 'id', //主键
		    queryParams: {
		    	xzqh:xzqhstr,
		    	'lxsh.jsxz':$("#jsxz").combobox('getValues').join(','),
		    	nf:nf,
		    	xzqh:xzqhstr
			},
		    frozenColumns:[[    
		    	{field:'lsxmbm',title:'项目编码',width:120,align:'center',rowspan:3},
				{field:'xzqhdm',title:'设区市',width:60,align:'center',rowspan:3},
		        {field:'xzqh',title:'县（市、区）',width:100,align:'center',rowspan:3},
		        {field:'tsdq',title:'特殊地区',width:100,align:'center',rowspan:3},
		        {field:'xmmc',title:'项目名称',width:180,align:'center',rowspan:3},
		        {field:'ghlxbm',title:'规划路线编码',width:80,align:'center',rowspan:3},
		        {field:'xmklx',title:'项目库类型',width:80,align:'center',rowspan:3},
		        {field:'xmbm',title:'项目库编码',width:80,align:'center',rowspan:3}   
		    ]], 	
		   columns:[[
		        {title:'现状等级（公里）',width:100,align:'center',rowspan:2,colspan:2},
		        {title:'建设规模（公里）',width:100,align:'center',rowspan:2,colspan:3},
		        {field:'ztz',title:'总投资（万元）',width:100,align:'center',rowspan:3},
		        {title:'补助资金（万元）',width:100,align:'center',rowspan:2,colspan:2},
		        {field:'dfzc',title:'地方自筹（万元）',width:100,align:'center',rowspan:3},
			    {field:'gkpfwh',title:'工可批复',width:100,align:'center',rowspan:3},
			    {field:'sjpfwh',title:'初设批复',width:100,align:'center',rowspan:3},
			    {field:'sgtpf',title:'施工图批复',width:100,align:'center',rowspan:3},
		        {title:'计划下达情况',width:100,align:'center',rowspan:2,colspan:2},
		        {title:'项目建设',width:100,align:'center',colspan:12},
			    {field:'bz',title:'备注',width:100,align:'center',rowspan:3}
	         ],[
			    {title:'2018年项目建设目标',width:100,align:'center',colspan:3},
			    {title:'项目建设状态',width:100,align:'center',colspan:3},
			    {title:'项目建设进度情况',width:100,align:'center',colspan:6}
	         ],[
				{field:'sanlc',title:'三级及以下',width:100,align:'center',rowspan:1},
				{field:'erlc',title:'二级及以上',width:100,align:'center',rowspan:1},
				{field:'jhyilc',title:'升一',width:100,align:'center',rowspan:1},
				{field:'jherlc',title:'升二',width:100,align:'center',rowspan:1},
				{field:'jhsanlc',title:'升三',width:100,align:'center',rowspan:1},
				{field:'cgs',title:'部级补助',width:100,align:'center',rowspan:1},
				{field:'sbzzj',title:'省级补助',width:100,align:'center',rowspan:1},
				{field:'scxdnf',title:'计划年份',width:100,align:'center',rowspan:1},
				{field:'xdwh',title:'计划文号',width:100,align:'center',rowspan:1},
				{field:'kglc',title:'开工里程（公里）',width:100,align:'center',rowspan:1},
				{field:'wglc',title:'完工里程（公里）',width:100,align:'center',rowspan:1},
				{field:'wctz',title:'完成投资（万元）',width:100,align:'center',rowspan:1},
				{field:'ywg',title:'已完工',width:100,align:'center',rowspan:1},
				{field:'zj',title:'在建',width:100,align:'center',rowspan:1},
				{field:'wkg',title:'未开工',width:100,align:'center',rowspan:1},
				{field:'jskgsj',title:'建设开工时间',width:100,align:'center',rowspan:1},
				{field:'jswgsj',title:'建设完工时间',width:100,align:'center',rowspan:1},
				{field:'zwglc',title:'累计已完工（公里）',width:120,align:'center',rowspan:1},
				{field:'bnwglc',title:bnwglc,width:120,align:'center',rowspan:1},
				{field:'wcztz',title:'累计完成总投资（万元）',width:120,align:'center',rowspan:1},
				{field:'bnwcztz',title:bnwcztz,width:120,align:'center',rowspan:1}
	         ]],
		   /*  toolbar: [
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
    	   alert(rows[i].id);
        	data="lxsh.id="+rows[i].id+
        	"&lxsh.sgtpf="+rows[i].sgtpf+
        	"&lxsh.ywg="+rows[i].ywg+
        	"&lxsh.zj="+rows[i].zj+
        	"&lxsh.wkg="+rows[i].wkg+
        	"&lxsh.jskgsj="+rows[i].jskgsj+
        	"&lxsh.jswgsj="+rows[i].jswgsj+
        	"&lxsh.zwglc="+rows[i].zwglc+
        	"&lxsh.bnwglc="+rows[i].bnwglc+
        	"&lxsh.wcztz="+rows[i].wcztz+
        	"&lxsh.bnwcztz="+rows[i].bnwcztz+
        	"&lxsh.lsxmid="+rows[i].lsxmid+"&lxsh.bz="+rows[i].bz;
    		$.ajax({
    			type:'post',
    			url:'/jxzhpt/qqgl/insertSjgzjdxxb.do',
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
		var nf=$("#ddlYear").val();
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");		
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var param='flag=1'+'&nf='+nf+"&xzqh="+xzqhstr+'&lxsh.jsxz='+encodeURI(encodeURI($("#jsxz").combobox('getValues').join(',')));
		var sql=$("#excelcgs").val();
		var nameValue=$("#exceldfzc").val();    
		 $.post('/jxzhpt/gcbb/exportbbsj_set.do',{xzqh:xzqhstr},function(){
				window.location.href="/jxzhpt/qqgl/getSjgzjdxxb.do?"+param;
			 });		
	}
	
	 function onSelect(r) {
	        if (r.text == '全部') {
	            $(this).combobox('clear').combobox('setValue', r.value)
	        }
	        else $(this).combobox('unselect', "改建,新建");
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
						<div id="p_top">五年项目库>&nbsp;十三五>&nbsp;全省汇总表>&nbsp;普通国省道升级改造前期工作及项目建设进度表</div>
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
        				    <input id="exceldfzc" name="exceldfzc" type="hidden"/>    
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
        						<tr height="32">
        						<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
        						<td align="right">建设性质：</td>
		 						<td><select class="easyui-combobox" name="jsxz" id="jsxz" style="width: 130px;"data-options="editable:false,panelHeight:'auto',multiple:true,onSelect:onSelect">
									<option value="改建,新建">全部</option>
									<option value="改建">改建</option>
									<option value="新建">新建</option>
								</select></td>												
                                <!-- <td align="right">计划下达年份：</td>
		        				<td><input id="jhnd" type="text"  style="width: 120px"></td> -->
        						<td align="right">月报年份：</td>
		 						<td><select name="ddlYear" id="ddlYear" style="width: 80px;">
								</select></td>
		 						<!-- <td align="right">月报月份：</td>
		 						<td><select name="ddlMonth" id="ddlMonth" style="width: 60px;">
									<option id="yf1" value="1">01</option>
									<option id="yf2" value="2">02</option>
									<option id="yf3" value="3">03</option>
									<option id="yf4" value="4">04</option>
									<option id="yf5" value="5">05</option>
									<option id="yf6" value="6">06</option>
									<option id="yf7" value="7">07</option>
									<option id="yf8" value="8">08</option>
									<option id="yf9" value="9">09</option>
									<option id="yf10" value="10">10</option>
									<option id="yf11" value="11">11</option>
									<option id="yf12" value="12">12</option>
								</select></td>	 -->							
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
        	    <div align="center" style="font-size:x-large;font-weight: bolder; margin-top:8px; margin-bottom:5px;">普通国省道升级改造前期工作及项目建设进度表</div>
        	    <div><table id="datagrid"></table> </div>
        	    </td>
        	</tr>        	
		</table>
	</div>
</body>
</html>
