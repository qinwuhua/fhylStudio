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
		czzt="上报状态";
	}
	loadUnit1("gydw",$.cookie("unit"));
	loadDist1("xzqhmc",$.cookie("dist"));
	//afxmnf("jhnf"); 
	loadBmbm2("sbzt", "上报状态");
	//loadBmbm2("jsdj", "技术等级2");
	//loadBmbm2("gldj", "行政等级");
	loadBmbm2("bzls", "补助历史");
	//tsdq("tsdq");
	
	var urlid=getUrlParame('id');
	if(urlid==null){
		xmnfdx("jhnf"); 
		//xzdjdx('gldj');
	}else{
		setxmnf("jhnf",urlid);
		//setxzdj('gldj',urlid);
	}
	//xmnfdx("jhnf"); 
	jsdjdx('jsdj');
	xzdjdx('gldj');
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
	var xmnf=$("#jhnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
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
	 url:'/jxzhpt/aqsmfh/selectSckaqsmfh.do',
	 queryParams : {
		 	'xmkaqsmfh.sbthbmcd':function(){
		 		if($.cookie("unit2")=='______36') return 7;
		 		else return $.cookie("unit2").length;
		 	},
		 	'xmkaqsmfh.gydw': gydwstr,
		 	'xmkaqsmfh.xzqh':xzqhstr,
		 	'xmkaqsmfh.lxmc' : $('#lxmc').val(),
		 	'xmkaqsmfh.jhnf':xmnf,
		 	'xmkaqsmfh.sbzt':$('#sbzt').combobox("getValue"),
		 	'xmkaqsmfh.jsdj':jsdj,
		 	'xmkaqsmfh.lxbm':$("#lxbm").val(),
		 	'xmkaqsmfh.throadcode':$("#throadcode").val(),
		 	'xmkaqsmfh.throadname':$('#throadname').val(),
		 	'xmkaqsmfh.bzls':$("#bzls").combobox("getValue"),
		 	'xmkaqsmfh.gldj':gldj,
		 	'xmkaqsmfh.tsdq':tsdq,
		 	'xmkaqsmfh.xmklx':$('#xmklx').combobox('getValue')
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
			
				if(row.sbthbmcd>7){
					if(row.sbzt2=='未上报'){
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckxmxx('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:edit('+index+') style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delone('+index+') style="text-decoration:none;color:#3399CC; ">删除</a>';			
					}else{
						if($.cookie("unit2").length==7){
							return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href=javascript:ckxmxx('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
// 	 						'<span style="color:grey;">编辑</span>'+
							'<a href=javascript:edit('+index+') style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
							'<span style="color:grey;">删除</span>';	
						}else{
							return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href=javascript:ckxmxx('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
	 						'<span style="color:grey;">编辑</span>'+
// 	'<a href=javascript:edit('+index+') style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
							'<span style="color:grey;">删除</span>';		
						}
							
					} 
				}else{
					if(row.tbdwdm=='36' || row.shzt!='已审核'){
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckxmxx('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:edit('+index+') style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delone('+index+') style="text-decoration:none;color:#3399CC; ">删除</a>';			 
					}else{
						return '<a href=javascript:locationXm1("'+row.lxbm+'","'+row.qdzh+'","'+row.zdzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckxmxx('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:edit('+index+') style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delone('+index+') style="text-decoration:none;color:#3399CC; ">删除</a>';
					}
				}
				
		}},  
		{field:'sbzt',title:czzt,width:180,align:'center',formatter:function(value,row,index){
			
			if(row.sbzt2=="未上报" && row.sbthbmcd==11){
				if(row.cszt=='未审核'){
					if(row.tsdq.indexOf('省直管试点县')!=-1){
						return '<a href=javascript:shangB1('+index+') style="text-decoration:none;color:#3399CC; ">未上报</a>  &nbsp;  '+'<a href=javascript:showshyj('+index+') style="text-decoration:none;color:#3399CC; ">省级审核未通过</a>  ';
					}
					return '<a href=javascript:shangB1('+index+') style="text-decoration:none;color:#3399CC; ">未上报</a>  &nbsp;  '+'<a href=javascript:showcsyj('+index+') style="text-decoration:none;color:#3399CC; ">市级初审未通过</a>  ';
				}else
				return '<a href=javascript:shangB1('+index+') style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
				}
			else if(row.sbzt2=="未上报" && row.sbthbmcd==9){
				if(row.shzt=='未审核'){
					return '<a href=javascript:chuS('+index+') style="text-decoration:none;color:#3399CC; ">未初审</a>  &nbsp;  '+'<a href=javascript:showshyj('+index+') style="text-decoration:none;color:#3399CC; ">省级审核未通过</a>  ';
				}else
				return '<a href=javascript:chuS('+index+') style="text-decoration:none;color:#3399CC; ">未初审</a>  ';
				}
			else if(row.sbzt2=="已上报"&&$.cookie("unit2").length==9&&row.sbthbmcd==7){
				return '<span style="color:grey;">已初审</span>';
				}
			else if(row.sbzt2=="已上报"&&$.cookie("unit2").length==11){
				return '<span style="color:grey;">已上报</span>';
				}
			else if($.cookie("unit2").length==7){
				/* if(row.shzt!='')
					return '<span style="color:grey;">  '+row.shzt+'   </span>';
					else
						return '<span style="color:grey;">  未审核  </span>';	 */
				return '<span style="color:grey;">  已上报  </span>';	
				
			}else
				return row.sbzt2;
			
			
		}},

		//{field:'bzls',title:'补助历史',width:60,align:'center'},
        {field:'gydw',title:'管养单位',width:160,align:'center'},
        {field:'xzqh',title:'行政区划',width:120,align:'center'},
        {field:'lxbm',title:'路线编码',width:120,align:'center'},
        {field:'lxmc',title:'路线名称',width:120,align:'center'},
        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
        {field:'czzlc',title:'处置总里程',width:140,align:'center'},
        {field:'xjgjnd',title:'改建/修建年度',width:140,align:'center'},
        {field:'jhnf',title:'项目年份',width:140,align:'center'},
        {field:'fapgdw',title:'方案评估单位',width:140,align:'center'},
        {field:'fascdw',title:'方案审查单位',width:140,align:'center'},
        {field:'faspsj',title:'方案审批时间',width:140,align:'center'},
        {field:'spwh',title:'审批文号',width:140,align:'center'},
        {field:'nsqbbz',title:'拟申请部（省）补助',width:140,align:'center'},
        {field:'cztzgs',title:'处置投资估算',width:140,align:'center'},
        {field:'jsxz',title:'建设性质(1、中修2、大修)',width:140,align:'center'}
    ]]
});  
loadtj();
}

function loadtj(){
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
	var sbthbmcd;
	if($.cookie("unit2")=='______36'){
		sbthbmcd=7;
		}else  sbthbmcd=$.cookie("unit2").length;
	var xmnf=$("#jhnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var jsdj=$("#jsdj").combobox("getValues").join(",");
	if(jsdj.substr(0,1)==',')
		jsdj=jsdj.substr(1,jsdj.length);
	var gldj=$("#gldj").combobox("getValues").join(",");
	if(gldj.substr(0,1)==',')
		gldj=gldj.substr(1,gldj.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var data="xmkaqsmfh.sbthbmcd="+sbthbmcd+"&xmkaqsmfh.gydw="+gydwstr+"&xmkaqsmfh.xzqh="+xzqhstr+"&xmkaqsmfh.lxmc="+$('#lxmc').val()+'&xmkaqsmfh.throadname=' + $('#throadname').val()+'&xmkaqsmfh.throadcode=' + $('#throadcode').val()+
	"&xmkaqsmfh.jhnf="+xmnf+"&xmkaqsmfh.sbzt="+$("#sbzt").combobox("getValue")+
	"&xmkaqsmfh.jsdj="+jsdj+"&xmkaqsmfh.lxbm="+$("#lxbm").val()+"&xmkaqsmfh.bzls="+$("#bzls").combobox("getValue")+
	'&xmkaqsmfh.xmklx='+$('#xmklx').combobox('getValue')+"&xmkaqsmfh.gldj="+gldj+"&xmkaqsmfh.tsdq="+tsdq;
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/aqsmfh/loadSckaqsmfhCount.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#abgc1").html(msg.sbthbmcd);
			 if(msg.yhlc!=null && msg.yhlc!=""){
				 $("#abgc2").html(parseFloat(msg.yhlc));
			 }else $("#abgc2").html("0");
			 if(msg.czzlc!=null && msg.czzlc!=""){
				 $("#abgc3").html(parseFloat(msg.czzlc));
			 }else $("#abgc3").html("0");
			 if(msg.cztzgs!=null && msg.cztzgs!=""){
				 $("#abgc4").html(parseFloat(msg.cztzgs));
			 }else $("#abgc4").html("0");
			 if(msg.nsqbbz!=null && msg.nsqbbz!=""){
				 $("#abgc5").html(parseFloat(msg.nsqbbz));
			 }else $("#abgc5").html("0");
			 
		 },
	});
}
var obj=new Object();
function edit(index){
	obj=$("#grid").datagrid('getRows')[index];
	YMLib.UI.createWindow('lxxx','项目编辑','aqsmfh_xg.jsp','lxxx',900,450);
}
var id;
function ckxmxx(index){
	obj=$("#grid").datagrid('getRows')[index];
	YMLib.UI.createWindow('lxxx','项目信息','aqsmfh_ck.jsp','lxxx',900,450);
}
function delone(index){
	if($.cookie("unit")=='36'){
		if($("#grid").datagrid('getRows')[index].tbdwdm!=$.cookie("unit")||$("#grid").datagrid('getRows')[index].shzt=='已审核'){
			alert("该项目不是您添加的或已上报，不能执行删除操作！");
			return;
		}
	}
 	else{
 		if($("#grid").datagrid('getRows')[index].tbdwdm!=$.cookie("unit")||$("#grid").datagrid('getRows')[index].sbzt2=='已上报'){
 			alert("该项目不是您添加的或已上报，不能执行删除操作！");
 			return;
 		}
	} 
	var xmbm=$("#grid").datagrid('getRows')[index].xmbm;
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/aqsmfh/deleteSckAf.do",
				 dataType : 'json',
				 data : 'xmkaqsmfh.xmbm=' +xmbm,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 $("#grid").datagrid('reload');	
						 loadtj();
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

function delAllSj(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要删除项目！");
		return;
	}
	var xmbm=rows[0].xmbm;
 	for(var i=0;i<rows.length;i++){
 		if($.cookie("unit")=='36'){
 			if(rows[i].tbdwdm!=$.cookie("unit")||rows[i].shzt=='已审核'){
 				alert("该项目不是您添加的或已上报，不能执行删除操作！");
 				return;
 			}
 		}
 	 	else{
 	 		if(rows[i].tbdwdm!=$.cookie("unit")||rows[i].sbzt2=='已上报'){
 	 			alert("该项目不是您添加的或已上报，不能执行删除操作！");
 	 			return;
 	 		}
 		} 
	} 
	for(var i=1;i<rows.length;i++){
		xmbm+=","+rows[i].xmbm ;
	}
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/aqsmfh/deleteSckAf.do",
				 dataType : 'json',
				 data : 'xmkaqsmfh.xmbm=' +xmbm,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 $("#grid").datagrid('reload');	
						 loadtj();
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

function shangB1(index){
	var id=$("#grid").datagrid('getRows')[index].id;
	var sbthcd;
	if($("#grid").datagrid('getRows')[index].tsdq.indexOf('省直管试点县')!=-1){
		sbthcd=7;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	if(confirm('您确定上报该项目？')){
		var data = "xmkaqsmfh.id="+id+"&xmkaqsmfh.sbthbmcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/aqsmfh/sckAfSb.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！'); 
					 $("#grid").datagrid('reload');
					 loadtj();
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
function shangB(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要上报项目！");
		return;
	}
	var id=rows[0].id;
	var sbthcd;
	if(rows[0].tsdq.indexOf('省直管试点县')!=-1){
		sbthcd=7;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].sbzt2=='已上报'){
			alert("有项目已上报，请勿重复操作！");
			return ;
		}
	}
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
		if(rows[i].tsdq.indexOf('省直管试点县')!=-1){
			sbthcd+=","+7;
		}else{
			sbthcd+=","+$.cookie("unit2").length-2;
		}
	}
	if(confirm('您确定上报该项目？')){
		var data = "xmkaqsmfh.id="+id+"&xmkaqsmfh.sbthbmcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/aqsmfh/sckAfSb.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！'); 
					 $("#grid").datagrid('reload');
					 loadtj();
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
function chuS(index){
	obj=$("#grid").datagrid('getRows')[index];
	YMLib.UI.createWindow('lxxx','项目初审','aqsmfh_sh.jsp','lxxx',500,250);
}
function showshyj(index){
	$.messager.alert('不同意意见',$("#grid").datagrid('getRows')[index].shyj,'warning');  
}
function showcsyj(index){
	$.messager.alert('不同意意见',$("#grid").datagrid('getRows')[index].csyj,'warning');  
}

var gydwstr;
var xzqhstr;
function dcExcel(){
	var sbthcd;
 	if($.cookie("unit2")=='______36'){
 		sbthcd=7;
 	}else  sbthcd=$.cookie("unit2").length;
 	var xmnf=$("#jhnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var jsdj=$("#jsdj").combobox("getValues").join(",");
	if(jsdj.substr(0,1)==',')
		jsdj=jsdj.substr(1,jsdj.length);
	var gldj=$("#gldj").combobox("getValues").join(",");
	if(gldj.substr(0,1)==',')
		gldj=gldj.substr(1,gldj.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var data=ata="xmkaqsmfh.sbthbmcd="+sbthcd+"&xmkaqsmfh.lxmc="+$('#lxmc').val()+
	"&xmkaqsmfh.jhnf="+xmnf+"&xmkaqsmfh.sbzt="+$("#sbzt").combobox("getValue")+
	"&xmkaqsmfh.jsdj="+jsdj+"&xmkaqsmfh.lxbm="+$("#lxbm").val()+"&xmkaqsmfh.bzls="+$("#bzls").combobox("getValue")+
	"&xmkaqsmfh.gldj="+gldj+"&xmkaqsmfh.tsdq="+tsdq;
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
		window.location.href='/jxzhpt/aqsmfh/dcaqsmfhsckExcel.do?'+data;
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
.abgc_td td{padding-right:6px;}
</style>
</head>
<body>
<div id="righttop">
		<div id="p_top">路网项目>&nbsp;项目审查库管理>&nbsp;安全生命防护工程项目</div>
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
                               <td>路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:100px;" /></td>
        						<td>路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:100px;" /></td>
						</tr>
                        <tr height="32">
							  <td>项目年份：</td>
                              	<td><select id="jhnf" style="width:70px">
                              	</select>
                              <span style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;项目状态： </span>
                              	<select id="xmtype" style="width:70px;display: none;">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">待上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">已入库</option>
									<option value="已审核">已下达</option>
                              	</select></td>
                               <td>上报状态：</td>
                              <td>	<select id="sbzt" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              <td>特殊地区：</td>
                              	<td><select id="tsdq"  style="width:70px"class="easyui-combobox">
                              	</select></td>
                              <td>技术等级：</td>
                              	<td><select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              	<td>调后路线名称：</td>
							  <td><input type="text" id="throadname"  style="width:100px;" /></td>
							 	<td>调后路线编码：</td>
							  <td><input type="text" id="throadcode"  style="width:100px;" /></td>
                             </tr>
                            <tr height="32">
                            	<td>行政等级：</td>
                              	<td><select id="gldj" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              	<td>补助历史：</td>
                              	<td><select id="bzls" style="width:70px"class="easyui-combobox">
                              	</select></td>
                            	<td>项目库类型：</td>
								<td " style="background-color: #ffffff; height: 20px;" align="left">
									<select class="easyui-combobox" id='xmklx'>
										<option value="" selected>请选择</option>
										<option value="部库">部库</option>
										<option value="省库">省库</option>
										
									</select>
								</td>
                              <td colspan="6">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="showAll();"style="border-width:0px;cursor: hand;" />
								<img name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;" />
                                <img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addSck('aqsmfh_add.jsp','900','500');" style="border-width:0px;" />
                                <img name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="delAllSj();" style="border-width:0px;" />
                                 <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" onclick="dcExcel()"/>
							 </td>
                            </tr></table>
						</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="abgc1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个项目，
        					隐患里程共【&nbsp;<span id="abgc2" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        					处置里程共【&nbsp;<span id="abgc3" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，总投资估算【&nbsp;<span id="abgc4" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，总拟申请部（省）补助【&nbsp;<span id="abgc5" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。</td>
        </tr>
         <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
</body>
</html>
