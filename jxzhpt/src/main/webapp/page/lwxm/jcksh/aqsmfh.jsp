<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库管理安全生命防护工程项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
$(function(){
	if($.cookie("unit2").length<11){
		$("#shangBao").attr('style','display: none');
	}
	if($.cookie("unit2").length==11){
		czzt="上报状态";
	}
	if($.cookie("unit2").length==9){
		czzt="初审状态";
	}
	if($.cookie("unit2").length==7){
		czzt="审核状态";
	}
	loadUnit1("gydw",$.cookie("unit"));
	loadDist1("xzqhmc",$.cookie("dist"));
	//xmnf("jhnf"); 
	//loadBmbm2("sbzt", "审核状态");
// 	loadBmbm2("jsdj", "技术等级2");
// 	loadBmbm2("gldj", "行政等级");
	loadBmbm2("bzls", "补助历史");
// 	tsdq("tsdq");
	jsdjdx('jsdj');
	//xzdjdx('gldj');
	var urlid=getUrlParame('id');
	setxzdj('gldj',urlid);
	tsdqdx('tsdq');
	showAll();
	
});
function showAll(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
var xzqhdm=$("#xzqhmc").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var jsdj=$("#jsdj").combobox("getValues").join(",");
	if(jsdj.substr(0,1)==',')
		jsdj=jsdj.substr(1,jsdj.length);
	var gldj=$("#gldj").combobox("getValues").join(",");
	if(gldj.substr(0,1)==',')
		gldj=gldj.substr(1,gldj.length);
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
$("#grid").datagrid({    
	 url:'/jxzhpt/aqsmfh/selectXmkaqsmfhsh.do',
	 queryParams : {
		 	'xmkaqsmfh.sbthcd':function(){
		 		if($.cookie("unit2")=='______36') return 7;
		 		else return $.cookie("unit2").length;
		 	},
		 	'xmkaqsmfh.unitcode': gydwstr,
		 	'xmkaqsmfh.distcode':xzqhstr,
		 	'xmkaqsmfh.lxmc' : $('#lxmc').val(),
		 	'xmkaqsmfh.jhnf':'',
		 	'xmkaqsmfh.sbzt':$('#sbzt').combobox("getValue"),
		 	'xmkaqsmfh.jsdj':jsdj,
		 	'xmkaqsmfh.lxbm':$("#lxbm").val(),
		 	'xmkaqsmfh.gldj':gldj,
		 	'xmkaqsmfh.bzls':$("#bzls").combobox("getValue"),
		 	'xmkaqsmfh.tsdq':tsdq
		},
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
		width:$(window).width()-18,
    columns:[[    
		{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
		{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){			
				return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
				'<a href=javascript:ckxmxx('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  ';			
		}},  
		{field:'sbzt',title:czzt,width:180,align:'center',formatter:function(value,row,index){
			if(row.sbthcd!=7){
				return '<a href=javascript:showshyj('+index+') style="text-decoration:none;color:#3399CC; ">审核未通过</a>  ';
			}else{
				if(row.zszt=="已审核"){
					return '<span style="color:grey;">已审核</span>';
				}else{
					return '<a href=javascript:shengh('+index+') style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}
			}
			
		}},

		//{field:'bzls',title:'补助历史',width:60,align:'center'},
        		{field:'roadcode',title:'公路编号',width:80,align:'center'},
		        {field:'roadname',title:'路线名称',width:160,align:'center'},
		        {field:'roadstart',title:'桩号起点',width:120,align:'center'},
		        {field:'roadend',title:'桩号终点',width:120,align:'center'},
		        {field:'jsdj',title:'技术等级',width:120,align:'center'},
		        {field:'gldj',title:'行政等级',width:140,align:'center'},
		        {field:'fangx',title:'方向',width:140,align:'center'},
		        {field:'pcsj',title:'排查时间',width:140,align:'center'},
		        {field:'ldfl',title:'路段分类',width:140,align:'center'},
		        {field:'unit',title:'管养单位',width:140,align:'center'},
		        {field:'dist',title:'行政区划',width:140,align:'center'},
		        {field:'tzgs',title:'处置投资估算',width:140,align:'center'},
		        {field:'jhnf',title:'计划实施安防工程年份',width:140,align:'center'}
    ]]
});  
loadtj();
}

function loadtj(){
	var jsdj=$("#jsdj").combobox("getValues").join(",");
	if(jsdj.substr(0,1)==',')
		jsdj=jsdj.substr(1,jsdj.length);
	var gldj=$("#gldj").combobox("getValues").join(",");
	if(gldj.substr(0,1)==',')
		gldj=gldj.substr(1,gldj.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
	
var xzqhdm=$("#xzqhmc").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var sbthcd;
	if($.cookie("unit2")=='______36'){
		sbthcd=7;
		}else  sbthcd=$.cookie("unit2").length;
	var data="xmkaqsmfh.sbthcd="+sbthcd+"&xmkaqsmfh.unitcode="+gydwstr+"&xmkaqsmfh.distcode="+xzqhstr+"&xmkaqsmfh.lxmc="+$('#lxmc').val()+
	"&xmkaqsmfh.jhnf="+"&xmkaqsmfh.sbzt="+$("#sbzt").combobox("getValue")+
	'&xmkaqsmfh.bzls='+$("#bzls").combobox("getValue")+"&xmkaqsmfh.jsdj="+jsdj+"&xmkaqsmfh.lxbm="+$("#lxbm").val()+"&xmkaqsmfh.tsdq="+tsdq+
	"&xmkaqsmfh.gldj="+gldj;
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/aqsmfh/loadXmkaqsmfhshCount.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#abgc1").html(msg.sbthcd);
			 if(msg.yhlc!=null && msg.yhlc!=""){
				 $("#abgc2").html(msg.yhlc);
			 }else $("#abgc2").html("0");
			 if(msg.czzlc!=null && msg.czzlc!=""){
				 $("#abgc3").html(msg.czzlc);
			 }else $("#abgc3").html("0");
		 },
	});
}
function shengh(index){
	obj=$("#grid").datagrid('getRows')[index];
	YMLib.UI.createWindow('lxxx','项目审核','aqsmfh_sh.jsp','lxxx',500,250);
}
var obj=new Object();
var id;
function ckxmxx(index){
	obj=$("#grid").datagrid('getRows')[index];
	YMLib.UI.createWindow('lxxx','项目信息','../sckgl/aqsmfh_ck.jsp','lxxx',900,450);
}

function shengh(index){
	obj=$("#grid").datagrid('getRows')[index];
	YMLib.UI.createWindow('lxxx','项目审核','aqsmfh_sh.jsp','lxxx',500,250);
}
function showshyj(index){
	$.messager.alert('不同意意见',$("#grid").datagrid('getRows')[index].zsyj,'warning');  
}
function showcsyj(index){
	$.messager.alert('不同意意见',$("#grid").datagrid('getRows')[index].csyj,'warning');  
}
</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:6px;}
</style>
</head>
<body>
<div id="righttop">
		<div id="p_top">路网项目>&nbsp;项目基础库审核>&nbsp;安全生命防护工程项目</div>
		</div>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #cde0f3;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<table style=" margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
								<td>管养单位：</td>
                              	<td colspan="3" style="width:220px;"><select id="gydw" style="width:220px">
                              	</select></td>
                             	<td>行政区划：</td>
                              	<td colspan="3" style="width:220px;"><select id="xzqhmc" style="width:220px">
                              	</select></td>
                              
        						<td>路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:100px;" /></td>
						</tr>
                        <tr height="32">
							  <!-- <td>项目年份：</td>
                              	<td><select id="jhnf" style="width:70px">
                              	</select> -->
                              <span style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;项目状态： </span>
                              	<select id="xmtype" style="width:70px;display: none;">
                              		<option selected="selected" value="">全部</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
                              	</select></td>
                               <td>审核状态：</td>
                              <td>	<select id="sbzt" style="width:70px"class="easyui-combobox">
                             	 <option value="">全部</option>
                              	<option value="未审核">未审核</option>
                              	<option value="已审核">已审核</option>
                              	<option value="审核同意">审核通过</option>
                              	<option value="审核不同意">审核不通过</option>
                              	</select></td>
                              <td>特殊地区：</td>
                              	<td><select id="tsdq"  style="width:70px"class="easyui-combobox">
                              	</select></td>
                              <td>技术等级：</td>
                              	<td><select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              	<td>行政等级：</td>
                              	<td><select id="gldj" style="width:104px"class="easyui-combobox">
                              	</select></td>
                              	 <td>路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:100px;" /></td>
                             </tr>
                            <tr height="32">
                            <td>补助历史：</td>
                              	<td><select id="bzls" style="width:74px"class="easyui-combobox">
                              	</select></td>
                              <td colspan="10">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="showAll();"style="border-width:0px;cursor: hand;" />
								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuihui();" style="border-width:0px;" />								
<%-- 								<img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" onclick="dcExcel()"/>		 --%>
							 </td>
                            </tr></table>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="abgc1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个项目.
<!--         					隐患里程共【&nbsp;<span id="abgc2" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里， -->
<!--         					处置里程共【&nbsp;<span id="abgc3" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里。</td> -->
        </tr>
         <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
