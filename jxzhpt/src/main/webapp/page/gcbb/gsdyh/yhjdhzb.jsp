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
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(/jxzhpt/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(/jxzhpt/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<style type="text/css">
		<!--
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:hover {text-decoration: none;}
		a:active {text-decoration: none;}
		#bbtable {border-collapse:collapse;}
		#bbtable thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid #cde0f3;padding:3px 7px 2px 7px;}
		#bbtable tbody tr td {text-align:center;font-size:1em;border:1px solid #cde0f3;padding:3px 7px 2px 7px;}
		-->
	</style>
	<script type="text/javascript">
	$(function(){
		var myDate = new Date();
		var strDate=myDate.getFullYear()+"-"+((myDate.getMonth() + 1) > 9 ? (myDate.getMonth() + 1) : "0" + (myDate.getMonth() + 1))+"-"+myDate.getDate();          
        $("#enddate").datebox("setValue",strDate);
	    var nf=myDate.getFullYear();
		var yf=(myDate.getMonth() + 1) > 9 ? (myDate.getMonth() + 1) : "0" + (myDate.getMonth() + 1);
		$(".nian").html(nf);
		$(".yue").html(yf);
		$(".nianyue1").html(nf+"年"+yf);
		$(".nianyue2").html(nf+".12");
		
		loadDist1("xzqh",$.cookie("dist"));
		showTjb();
	});

/* 	function showTjb(){
		var enddate = $("#enddate").datebox("getValue");
 		var nf=enddate.substring(0, 4);
		var yf=enddate.substring(5, 7);
		
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
				
		$('#datagrid').datagrid({    
		    url:'/jxzhpt/gcybb/getGsdyhjdhzb.do',
		    striped:true,
		    pagination:false,
		    rownumbers:true,
		    checkOnSelect:true,
		    height:$(window).height()-160,
		    width:$(window).width()-20,
		    idField: 'id', //主键
		    queryParams: {
		    	xzqh:xzqhstr,
		    	'gcglabgc.ybrq':enddate,
		    	nf:nf
			},
		   columns:[[
				{field:'ck',width:60,checkbox:true,rowspan:4,hidden:true},
		        {field:'v_0',title:'设区市',width:100,align:'center',rowspan:4,colspan:1},		        
		        {title:'2018年养护工作目标',align:'center',rowspan:1,colspan:20},
		        {title:nf+'年养护工作进度情况',align:'center',rowspan:1,colspan:31}
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
				{field:'v_22',title:'里程（公里）',width:100,align:'center'},
				{field:'v_23',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_24',title:'完成比例',width:100,align:'center'},	
				{field:'v_25',title:'座数（座）',width:100,align:'center'},
				{field:'v_26',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_27',title:'完成比例',width:100,align:'center'},
				{field:'v_28',title:'里程（公里）',width:100,align:'center'},
				{field:'v_29',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_30',title:'完成比例',width:100,align:'center'},
				{field:'v_31',title:'里程（公里）',width:100,align:'center'},
				{field:'v_32',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_33',title:'完成比例',width:100,align:'center'},
				{field:'v_34',title:'里程（公里）',width:100,align:'center'},
				{field:'v_35',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_36',title:'完成比例',width:100,align:'center'},
				{field:'v_37',title:'项目个数（个数）',width:100,align:'center'},
				{field:'v_38',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_39',title:'完成比例',width:100,align:'center'},
				{field:'v_40',title:'项目个数（个数）',width:100,align:'center'},
				{field:'v_41',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_42',title:'完成比例',width:100,align:'center'},
				{field:'v_43',title:'项目个数（个数）',width:100,align:'center'},
				{field:'v_44',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_45',title:'完成比例',width:100,align:'center'},
				{field:'v_46',title:'项目个数（个数）',width:100,align:'center'},
				{field:'v_47',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_48',title:'完成比例',width:100,align:'center'},
				{field:'v_49',title:'完成时间',width:100,align:'center'},
				{field:'v_50',title:'总投资（万元）',width:100,align:'center'},
				{field:'v_51',title:'完成比例',width:100,align:'center'}
	         ]]
		}); 
		
	} */
	function showTjb(){
		var enddate = $("#enddate").datebox("getValue");
 		var nf=enddate.substring(0, 4);
		var yf=enddate.substring(5, 7);
		
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
		
		var tbody = $("#abgclist");
		tbody.empty();

		loadjzt();
		
		var data="flag=0&nf="+nf+"&yf="+yf+"&xzqh="+xzqhstr
		+"&gcglabgc.ybrq="+enddate+"&excel_list.xzqhdm="+$.cookie('dist2'); 
		
		$.ajax({
			url:"/jxzhpt/gcybb/getGsdyhjdhzb.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalist=msg;
				disLoadjzt();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						var tr="<tr>";
						tr=tr+ "<td>"+msg[i].v_0+"</td><td>"
						+msg[i].v_1+"</td><td>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"+msg[i].v_4+"</td><td>"
						+msg[i].v_5+"</td><td>"+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"+msg[i].v_8+"</td><td>"
						+msg[i].v_9+"</td><td>"+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"+msg[i].v_12+"</td><td>"
						+msg[i].v_13+"</td><td>"+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"+msg[i].v_16+"</td><td>"
						+msg[i].v_17+"</td><td>"+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"+msg[i].v_20+"</td><td>"
						+msg[i].v_21+"</td><td>"+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"+msg[i].v_24+"</td><td>"
						+msg[i].v_25+"</td><td>"+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"+msg[i].v_28+"</td><td>"
						+msg[i].v_29+"</td><td>"+msg[i].v_30+"</td><td>"+msg[i].v_31+"</td><td>"+msg[i].v_32+"</td><td>"
						+msg[i].v_33+"</td><td>"+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"+msg[i].v_36+"</td><td>"
						+msg[i].v_37+"</td><td>"+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td><td>"+msg[i].v_40+"</td><td>"
						+msg[i].v_41+"</td><td>"+msg[i].v_42+"</td><td>"+msg[i].v_43+"</td><td>"+msg[i].v_44+"</td><td>"
						+msg[i].v_45+"</td><td>"+msg[i].v_46+"</td><td>"+msg[i].v_47+"</td><td>"+msg[i].v_48+"</td><td>"
						+msg[i].v_49+"</td><td>"+msg[i].v_50+"</td><td>"+msg[i].v_51+"</td><td>"+msg[i].v_52+"</td><td>"
						+msg[i].v_53+"</td><td>"+msg[i].v_54+"</td><td>"+msg[i].v_55+"</td><td>"+msg[i].v_56+"</td><td>"
						+msg[i].v_57+"</td>"
						tr+="</tr>";
						tbody.append(tr);  
					}	
				}
			}
		});
	}
	
	function dcExcel(){
		
		var enddate = $("#enddate").datebox("getValue");
		var nf=enddate.substring(0, 4);
		var yf=enddate.substring(5, 7);
		
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
		var param='flag=1'+'&nf='+nf+"&gcglabgc.ybrq="+enddate+'&xzqh='+xzqhstr;
	    
		window.location.href="/jxzhpt/gcybb/getGsdyhjdhzb.do?"+param;
		
	}
	function ghbb(){			
	    YMLib.Var.formname='yhjdhzb';
		YMLib.UI.createWindow('lxxx','将查询结果固化为版本','/jxzhpt/page/gcbb/ghbbxz.jsp','lxxx',460,360);
	}
	function ghbbcx(){
	    YMLib.Var.formname='yhjdhzb';
		YMLib.UI.createWindow('lxxx','固化版本查询','/jxzhpt/page/gcbb/ghbbcx.jsp','lxxx',460,360);
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
						<div id="p_top">五年项目库>&nbsp;十三五>&nbsp;全省汇总表>&nbsp;普通国省道养护工作进度汇总表</div>
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
							    <td align="right">月报时间：</td>
								<td><input id="enddate" class="easyui-datebox" name="enddate" data-options="editable:false"></td>
							</tr>
							
        					<tr height="32">
        						<td colspan="10">
        						<img onclick="showTjb()" alt="查询" src="/jxzhpt/images/Button/Serch01.gif" onmouseover="this.src='/jxzhpt/images/Button/Serch02.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;"/>
								<img alt="导出Ecel" src="/jxzhpt/images/Button/dcecl1.gif" onmouseover="this.src='/jxzhpt/images/Button/dcecl2.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/dcecl1.gif' " onclick="dcExcel()" style="vertical-align: -50%;" />
        				        <img id='ghbb' alt="固化版本" src="/jxzhpt/images/Button/ghbb1.png" onmouseover="this.src='/jxzhpt/images/Button/ghbb2.png'"
                                	onmouseout="this.src='/jxzhpt/images/Button/ghbb1.png' " onclick="ghbb()" style="vertical-align: -50%;" />
        						<img alt="固化版本查询" src="/jxzhpt/images/Button/ghbbcx1.gif" onmouseover="this.src='/jxzhpt/images/Button/ghbbcx2.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/ghbbcx1.gif' " onclick="ghbbcx()" style="vertical-align: -50%;" />
        				        </td>	
        				    </tr>
        				  </table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        	    <td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height: 380px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-140)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="3000px">
								<caption align="top" style="font-size:x-large;font-weight: bolder;">普通国省道养护工作进度汇总表</caption>
								<tbody id='biaotou'>								
									<tr>
										<td rowspan="4" style="width: 340px;">设区市</td>
										<td rowspan="1" colspan="20">2018年养护工作目标</td>
										<td rowspan="1" colspan="37"><span class='nian'></span>年养护工作进度情况</td>								
									</tr>
									<tr>
										<td rowspan="2" colspan="2">养护大中修（含路面改造工程、灾毁恢复重建工程）</td>		
										<td rowspan="1" colspan="6">路网结构改造工程</td>
										<td rowspan="2" colspan="2">“畅安舒美”示范路</td>
										<td rowspan="1" colspan="8">服务设施</td>
										<td rowspan="2" colspan="2">安全隐患整治</td>
										<td rowspan="3" style="width: 125px;">本年完成总投资（万元）</td>										
										<td rowspan="1" colspan="9">养护大中修（含路面改造工程、灾毁恢复重建工程）</td>												
										<td rowspan="1" colspan="9">路网结构改造工程</td>
										<td rowspan="2" colspan="3">“畅安舒美”示范路</td>		
										<td rowspan="1" colspan="12">服务设施</td>
										<td rowspan="2" colspan="3">安全隐患整治</td>
									</tr>	
									<tr>						
										<td rowspan="1" colspan="2">危桥改造</td>
										<td rowspan="1" colspan="2">安全生命防护工程</td>
										<td rowspan="1" colspan="2">灾害防治工程</td>
										<td rowspan="1" colspan="2">综合养护中心</td>				
										<td rowspan="1" colspan="2">服务区</td>
										<td rowspan="1" colspan="2">驿站、停车区</td>
										<td rowspan="1" colspan="2">道班</td>
										<td rowspan="1" colspan="3">合计</td>
										<td rowspan="1" colspan="2">养护大中修</td>
										<td rowspan="1" colspan="2">路面改造</td>
										<td rowspan="1" colspan="2">灾毁恢复重建</td>
										<td rowspan="1" colspan="3">危桥改造</td>
										<td rowspan="1" colspan="3">安全生命防护工程</td>
										<td rowspan="1" colspan="3">灾害防治工程</td>
										<td rowspan="1" colspan="3">综合养护中心</td>
										<td rowspan="1" colspan="3">服务区</td>
										<td rowspan="1" colspan="3">驿站、停车区</td>
										<td rowspan="1" colspan="3">道班</td>
									</tr>
									<tr>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">座数（座）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>		    
									    <td style="width: 340px;">里程（公里）</td>			    
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">项目个数（个数）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">项目个数（个数）</td>
									    <td style="width: 340px;">总投资（万元）</td>	    
									    <td style="width: 340px;">项目个数（个数）</td>	
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">项目个数（个数）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成时间</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">座数（座）</td>	    
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									    <td style="width: 340px;">里程（公里）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									    <td style="width: 340px;">项目个数（个数）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									    <td style="width: 340px;">项目个数（个数）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									    <td style="width: 340px;">项目个数（个数）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									    <td style="width: 340px;">项目个数（个数）</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>   
									    <td style="width: 340px;">完成时间</td>
									    <td style="width: 340px;">总投资（万元）</td>
									    <td style="width: 340px;">完成比例</td>
									</tr>									
								</tbody>
								<tbody id="abgclist"></tbody>
							</table>
							</div>
						</div>
					</div>
				</td>
        	</tr>        	
		</table>
	</div>
</body>
</html>
