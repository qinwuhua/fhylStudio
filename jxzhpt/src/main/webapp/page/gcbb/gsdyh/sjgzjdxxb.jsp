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
		/* var y = myDate.getFullYear();
		var m = myDate.getMonth()+1; 
		for(var x=y;x>=2010;x--){
			$("#ddlYear").append("<option value="+x+">"+x+"</option>");
		}
		$("#yf"+m).attr("selected","selected");
		//$("#biaotou").empty();
		
		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val(); */
		
		var strDate=myDate.getFullYear()+"-"+((myDate.getMonth() + 1) > 9 ? (myDate.getMonth() + 1) : "0" + (myDate.getMonth() + 1))+"-"+myDate.getDate();          
        $("#enddate").datebox("setValue",strDate);
		
		var nf=myDate.getFullYear();
		var yf=(myDate.getMonth() + 1) > 9 ? (myDate.getMonth() + 1) : "0" + (myDate.getMonth() + 1);
		
		$(".nian").html(nf);
		$(".yue").html(yf);
		$(".nianyue1").html(nf+"年"+yf);
		$(".nianyue2").html(nf+".12");
		showTjb();
	});

	function showTjb(){		
		var enddate = $("#enddate").datebox("getValue");
		var nf=enddate.substring(0, 4);
		var yf=enddate.substring(5, 7);
		
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
		    url:'/jxzhpt/gcybb/getSjgzjdxxb.do',
		    striped:true,
		    pagination:false,
		    //rownumbers:true,
		    checkOnSelect:true,
		    height:$(window).height()-160,
		    width:$(window).width()-20,
		    idField: 'id', //主键
		    queryParams: {
		    	xzqh:xzqhstr,
		    	'gcglabgc.jsxz':$("#jsxz").combobox('getValues').join(','),
		    	nf:nf,
		    	'gcglabgc.ybrq':enddate
			},
		    frozenColumns:[[
		    	{field:'v_0',title:'序号',width:30,align:'center',rowspan:3},
		    	{field:'v_1',title:'项目编码',width:120,align:'center',rowspan:3},
				{field:'v_2',title:'设区市',width:80,align:'center',rowspan:3},
		        {field:'v_3',title:'县（市、区）',width:100,align:'center',rowspan:3},
		        {field:'v_4',title:'特殊地区',width:100,align:'center',rowspan:3},
		        {field:'v_5',title:'项目名称',width:180,align:'center',rowspan:3},
		        {field:'v_6',title:'规划路线编码',width:80,align:'center',rowspan:3},
		        {field:'v_7',title:'项目库类型',width:80,align:'center',rowspan:3},
		        {field:'v_8',title:'项目库编码',width:80,align:'center',rowspan:3}   
		    ]], 	
		   columns:[[
		        {title:'现状等级（公里）',width:100,align:'center',rowspan:2,colspan:2},
		        {title:'建设规模（公里）',width:100,align:'center',rowspan:2,colspan:3},
		        {field:'v_14',title:'总投资（万元）',width:100,align:'center',rowspan:3},
		        {title:'补助资金（万元）',width:100,align:'center',rowspan:2,colspan:2},
		        {field:'v_17',title:'地方自筹（万元）',width:100,align:'center',rowspan:3},
			    {field:'v_18',title:'工可批复',width:100,align:'center',rowspan:3},
			    {field:'v_19',title:'初设批复',width:100,align:'center',rowspan:3},
			    {field:'v_20',title:'施工图批复',width:100,align:'center',rowspan:3},
		        {title:'计划下达情况',width:100,align:'center',rowspan:2,colspan:2},
		        {title:'项目建设',width:100,align:'center',colspan:12},
			    {field:'v_35',title:'备注',width:100,align:'center',rowspan:3}
	         ],[
			    {title:'2018年项目建设目标',width:100,align:'center',colspan:3},
			    {title:'项目建设状态',width:100,align:'center',colspan:3},
			    {title:'项目建设进度情况',width:100,align:'center',colspan:6}
	         ],[
				{field:'v_9',title:'三级及以下',width:100,align:'center',rowspan:1},
				{field:'v_10',title:'二级及以上',width:100,align:'center',rowspan:1},
				{field:'v_11',title:'升一',width:100,align:'center',rowspan:1},
				{field:'v_12',title:'升二',width:100,align:'center',rowspan:1},
				{field:'v_13',title:'升三',width:100,align:'center',rowspan:1},	
				{field:'v_15',title:'部级补助',width:100,align:'center',rowspan:1},
				{field:'v_16',title:'省级补助',width:100,align:'center',rowspan:1},	
				{field:'v_21',title:'计划年份',width:100,align:'center',rowspan:1},
				{field:'v_22',title:'计划文号',width:100,align:'center',rowspan:1},
				{field:'v_23',title:'开工里程（公里）',width:100,align:'center',rowspan:1},
				{field:'v_24',title:'完工里程（公里）',width:100,align:'center',rowspan:1},
				{field:'v_25',title:'完成投资（万元）',width:100,align:'center',rowspan:1},
				{field:'v_26',title:'已完工',width:100,align:'center',rowspan:1},
				{field:'v_27',title:'在建',width:100,align:'center',rowspan:1},
				{field:'v_28',title:'未开工',width:100,align:'center',rowspan:1},
				{field:'v_29',title:'建设开工时间',width:100,align:'center',rowspan:1},
				{field:'v_30',title:'建设完工时间',width:100,align:'center',rowspan:1},
				{field:'v_31',title:'累计已完工（公里）',width:120,align:'center',rowspan:1},
				{field:'v_32',title:nf+'年度完工里程（公里）',width:120,align:'center',rowspan:1},
				{field:'v_33',title:'累计完成总投资（万元）',width:120,align:'center',rowspan:1},
				{field:'v_34',title:nf+'年度完成投资（万元）',width:120,align:'center',rowspan:1}
	         ]],
		    onClickCell: function (rowIndex, field, value) {
		    	beginEditing(rowIndex,field,value);
		    	datagrid.datagrid('showColumn', 'ck'); 
		    }
		}); 
	}
	
	function dcExcel(){
		var enddate = $("#enddate").datebox("getValue");
		var nf=enddate.substring(0, 4);
		var yf=enddate.substring(5, 7);
		
		var xzqhdm=$("#xzqh").combotree("getValues");
		//var nf=$("#ddlYear").val();
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");		
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
			xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var param='flag=1'+'&nf='+nf+"&xzqh="+xzqhstr+'&gcglabgc.jsxz='+encodeURI(encodeURI($("#jsxz").combobox('getValues').join(',')))+"&gcglabgc.ybrq="+enddate;
		var sql=$("#excelcgs").val();
		var nameValue=$("#exceldfzc").val();    
		 $.post('/jxzhpt/gcbb/exportbbsj_set.do',{xzqh:xzqhstr},function(){
				window.location.href="/jxzhpt/gcybb/getSjgzjdxxb.do?"+param;
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
        						<!-- <td align="right">月报年份：</td>
		 						<td><select name="ddlYear" id="ddlYear" style="width: 80px;">
								</select></td> -->
								<td align="right">月报时间：</td>
								<td><input id="enddate" class="easyui-datebox" name="enddate" data-options="editable:false"></td>
							
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
