<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>固化版本选择</title>
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
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
<script type="text/javascript">
$(function(){
	loadbnh('formdate');
	
// 	alert(parent.YMLib.Var.formname);
	
	
})

//查询版本号
function loadbnh(id) {

	$('#' + id).combobox({
		url : '/jxzhpt/xtgl/getbbh.do?yhm='+parent.YMLib.Var.formname,
		valueField : 'bmid',
		textField : 'name',
		panelHeight:'auto',
		multiple:false,
		editable:false
	});
// 	$('#' + id).combobox('setValue',str);
}

//关闭窗口
function closewin(){
	parent.$('#lxxx').window('destroy')
}
//添加
function ghbbcx(){
	if($("#formdate").combobox('getValue')==''){alert("请选择版本号");return;}
	
	var formdate=$("#formdate").combobox('getValue');
	//if(parent.YMLib.Var.formname=='xgjwcmxb')

	if(parent.YMLib.Var.formname=='xgjwchzb'){
		xgjwchzbghcx(formdate);}
	else if(parent.YMLib.Var.formname=='lmgzwcb'){
		lmgzwcbghcx(formdate);}
	else if(parent.YMLib.Var.formname=='zhhfwcb'){
		zhhfwcbghcx(formdate);}
	else if(parent.YMLib.Var.formname=='yhdzxwcb'){
		yhdzxwcbghcx(formdate);}
	else if(parent.YMLib.Var.formname=='sjgzjdhzb'){
		sjgzjdhzbcx(formdate);}
	else{xgjwcmxbghcx(formdate);}
}
function xgjwcmxbghcx(formdate){
	var sstr;
	if(parent.YMLib.Var.formname=='xgjwcmxb'){
		sstr='v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12,v_13,v_14,v_15,v_16,v_17,v_18,v_19,v_20,v_21,v_22,v_23,v_24,v_25,v_26,v_27,v_28,v_29,v_30,v_31,v_32,v_33,v_34,v_35,v_36,v_37,v_38,v_39,v_40,v_41,v_42,v_43,v_44,v_45,v_46,v_47,v_48,v_49,v_50,v_51,v_52,v_53,v_54,v_55,v_56,v_57,v_58,v_59,v_60,v_61,v_62,v_63,v_64,v_65,v_66,v_67,v_68,v_69,v_70,v_71,v_72,v_73,v_74,v_75,v_76,v_77,v_78,v_79,v_80,v_83,v_84';
	}
	if(parent.YMLib.Var.formname=='lwgzxmb'||parent.YMLib.Var.formname=='shxmb'){
		sstr='v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12,v_13,v_14,v_15,v_16,v_17,v_18,v_19,v_20,v_21,v_22,v_23,v_24,v_25,v_26,v_27,v_28,v_29,v_30,v_31,v_32,v_33,v_34,v_35,v_36,v_37,v_38,v_39,v_40,v_41,v_42,v_43,v_44,v_45,v_46,v_47,v_48';
	}

	var tbody = parent.$("#abgclist");
	tbody.empty();
	loadjzt();
	$.ajax({
		url:"/jxzhpt/gcybb/getghbbcx.do",
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate+"&excel_list.xzqhdm="+$.cookie('dist2'),
		type:"post",
		dataType:"JSON",
		success:function(msg){
			parent.str1="'1v_0','1v_1','1v_2','1v_3','1v_4','1v_5','1v_6','1v_7','1v_8','1v_9','1v_10','1v_11','1v_12','1v_13','1v_14','1v_15','1v_16','1v_17','1v_18','1v_19','1v_20','1v_21','1v_22','1v_23','1v_24','1v_25','1v_26','1v_27','1v_28','15v_29','1v_30','1v_31','1v_32','1v_33','21v_34','21v_35','21v_36','21v_37','21v_38','21v_39','21v_40','21v_41','21v_42','21v_43','22v_44','23v_45','241v_46','241v_47','241v_48','241v_49','241v_50','242v_51','242v_52','243v_53','3v_54','3v_55','3v_56','41v_57','41v_58','41v_59','41v_60','41v_61','41v_62','41v_63','41v_64','41v_65','41v_66','42v_67','431v_68','431v_69','431v_70','431v_71','431v_72','432v_73','432v_74','433v_75','44v_76','45v_77','46v_78','47v_79','5v_80'";
			parent.str2="v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12,v_13,v_14,v_15,v_16,v_17,v_18,v_19,v_20,v_21,v_22,v_23,v_24,v_25,v_26,v_27,v_28,v_29,v_30,v_31,v_32,v_33,v_34,v_35,v_36,v_37,v_38,v_39,v_40,v_41,v_42,v_43,v_44,v_45,v_46,v_47,v_48,v_49,v_50,v_51,v_52,v_53,v_54,v_55,v_56,v_57,v_58,v_59,v_60,v_61,v_62,v_63,v_64,v_65,v_66,v_67,v_68,v_69,v_70,v_71,v_72,v_73,v_74,v_75,v_76,v_77,v_78,v_79,v_80";
			parent.datalist=msg;
			disLoadjzt();
			var ss=sstr.split(',');
			if (msg != null) {
				for ( var i = 0; i < msg.length; i++) {
					var tr="<tr>";
					for ( var j = 0; j < ss.length; j++) {
						if(msg[i].v_0=='是'){
							if(ss[j]=='v_0'){
								tr+="<td>"+''+"</td>";
							}else{
								tr+="<td>"+msg[i][ss[j]]+"</td>";
							}
						}else{
							tr+="<td>"+msg[i][ss[j]]+"</td>";
						}
						
					}
					tr+="</tr>";
					tbody.append(tr);
				}
			}
			closewin();
		}
	});
}
function xgjwchzbghcx(formdate){
	var xmnf=parent.$("#jhxdnf").combobox("getValues");
	if(xmnf.join(",").substr(0,1)==',')
	xmnf=xmnf.join(",").substr(1,xmnf.join(",").length).split(',');
	xmnf.sort(function (x,y) {
        return y-x;
    });
	var biaotou = parent.$("#biaotou");
	var str1='';
	var str2='';
	var str3='';
	var min=xmnf[xmnf.length-1];
	var max=xmnf[0];
	var len=(xmnf.length+1)*1000+"px";
	parent.$("#kdtb").attr('width',len);
	var sv="v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12,v_13,v_14,v_15,v_16,v_17";
	var l=18;
	for(var i=xmnf.length-1;i>=0;i--){
		sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;
		str1=str1+'<td colspan="8">计划下达及完成情况</td>';
		str2=str2+'<td rowspan="1" colspan="2">'+xmnf[i]+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td><td rowspan="2">本年到位车购税（万元）</td><td rowspan="2">累计到位车购税（万元）</td>';
		str3=str3+'<td>项目数量</td><td>计划里程（公里）</td>';
	}
	sv+=",v_"+l;l++;
	var ss=sv.split(",");
	biaotstr='<tr><td rowspan="3">序号</td><td rowspan="3">设区市</td><td colspan="16">计划下达及完成情况</td>'
	+str1+'<td rowspan="3">备注</td></tr>'
	+'<td rowspan="1" colspan="2">'+min+'-'+max+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td><td rowspan="2">本年到位资金（万元）</td><td rowspan="2">累计到位资金（万元）</td><td rowspan="2">本年到位车购税（万元）</td><td rowspan="2">累计到位车购税（万元）</td><td rowspan="2">工程完成比例（规模）</td><td rowspan="2">'+max+'年目标任务里程（公里）</td><td rowspan="2">'+max+'年目标任务投资（万元）</td><td rowspan="2">'+max+'年目标任务已完成里程（公里）</td><td rowspan="2">目标任务完成比例（规模）</td><td rowspan="2">目标任务总投资完成比例</td>'
	+str2+'</tr>'
	+'<td>项目数量</td><td>计划里程（公里）</td>'
	+str3+'</tr>';
	biaotou.empty();
	biaotou.append(biaotstr);
	var tbody = parent.$("#wqgzlist");
	tbody.empty();
	
	loadjzt();
	$.ajax({
		url:"/jxzhpt/gcybb/getghbbcx.do",
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate+"&excel_list.xzqhdm="+$.cookie('dist2'),
		type:"post",
		dataType:"JSON",
		success:function(msg){
			parent.datalist=msg;
			disLoadjzt();
			if (msg != null) {
				for ( var x = 0; x < msg.length; x++) {
					var tr="";
					if(x==0){
						tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							if(ss[j]=='v_0'){
								tr+="<td colspan='2'>"+msg[x][ss[j]]+"</td>";
								j++;
							}else{
								tr+="<td>"+msg[x][ss[j]]+"</td>";
							}
						}
						tr+="</tr>";
					}else{
						var tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							tr+="<td>"+msg[x][ss[j]]+"</td>";
						}
						tr+="</tr>";
					}
					tbody.append(tr);
				}
			}
			closewin();
		}
	});
}


function lmgzwcbghcx(formdate){
	var xmnf=parent.$("#jhxdnf").combobox("getValues");
	if(xmnf.join(",").substr(0,1)==',')
	xmnf=xmnf.join(",").substr(1,xmnf.join(",").length).split(',');
	xmnf.sort(function (x,y) {
        return y-x;
    });
	
	var biaotou = parent.$("#biaotou");
	var str1='';
	var str2='';
	var str3='';
	var min=xmnf[xmnf.length-1];
	var max=xmnf[0];
	var len=(xmnf.length+1)*1000+"px";
	parent.$("#kdtb").attr('width',len);
	var sv="v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12";
	var l=13;
	for(var i=xmnf.length-1;i>=0;i--){
		sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;
		str1=str1+'<td colspan="6">计划下达及完成情况</td>';
		str2=str2+'<td rowspan="1" colspan="2">'+xmnf[i]+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">工程完成比例</td>';
		str3=str3+'<td>项目数量</td><td>计划里程（公里）</td>';
	}
	sv+=",v_"+l;l++;
	var ss=sv.split(",");
	biaotstr='<tr><td rowspan="3">序号</td><td rowspan="3">设区市</td><td colspan="11">计划下达及完成情况</td>'
	+str1+'<td rowspan="3">备注</td></tr>'
	+'<td rowspan="1" colspan="2">'+min+'-'+max+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td><td rowspan="2">本年到位资金（万元）</td><td rowspan="2">累计到位资金（万元）</td><td rowspan="2">工程完成比例</td><td rowspan="2">'+max+'年目标任务里程（公里）</td><td rowspan="2">'+max+'年目标任务已完成里程（公里）</td>'
	+str2+'</tr>'
	+'<td>项目数量</td><td>计划里程（公里）</td>'
	+str3+'</tr>';
	biaotou.empty();
	biaotou.append(biaotstr);
	var tbody = parent.$("#wqgzlist");
	tbody.empty();
	loadjzt();
	$.ajax({
		url:"/jxzhpt/gcybb/getghbbcx.do",
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate+"&excel_list.xzqhdm="+$.cookie('dist2'),
		type:"post",
		dataType:"JSON",
		success:function(msg){
			parent.datalist=msg;
			disLoadjzt();
			if (msg != null) {
				for ( var x = 0; x < msg.length; x++) {
					var tr="";
					if(x==0){
						tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							if(ss[j]=='v_0'){
								tr+="<td colspan='2'>"+msg[x][ss[j]]+"</td>";
								j++;
							}else{
								tr+="<td>"+msg[x][ss[j]]+"</td>";
							}
						}
						tr+="</tr>";
					}else{
						var tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							tr+="<td>"+msg[x][ss[j]]+"</td>";
						}
						tr+="</tr>";
					}
					tbody.append(tr);
				}
			}
			closewin();
		}
	});
	
}

function zhhfwcbghcx(formdate){
	var xmnf=parent.$("#jhxdnf").combobox("getValues");
	if(xmnf.join(",").substr(0,1)==',')
	xmnf=xmnf.join(",").substr(1,xmnf.join(",").length).split(',');
	xmnf.sort(function (x,y) {
        return y-x;
    });
	var biaotou = parent.$("#biaotou");
	var str1='';
	var str2='';
	var str3='';
	var min=xmnf[xmnf.length-1];
	var max=xmnf[0];
	var len=(xmnf.length+1)*1000+"px";
	parent.$("#kdtb").attr('width',len);
	var sv="v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8";
	var l=9;
	for(var i=xmnf.length-1;i>=0;i--){
		sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;
		str1=str1+'<td colspan="7">计划下达及完成情况</td>';
		str2=str2+'<td rowspan="1" colspan="3">'+xmnf[i]+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">工程完成比例</td>';
		str3=str3+'<td>项目数量</td><td>计划里程（公里）</td><td>中央或省统筹资金（万元）含续建</td>';
	}
	sv+=",v_"+l;l++;
	var ss=sv.split(",");
	biaotstr='<tr><td rowspan="3">序号</td><td rowspan="3">设区市</td><td colspan="7">计划下达及完成情况</td>'
	+str1+'<td rowspan="3">备注</td></tr>'
	+'<td rowspan="1" colspan="3">'+min+'-'+max+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">工程完成比例</td>'
	+str2+'</tr>'
	+'<td>项目数量</td><td>计划里程（公里）</td><td>中央或省统筹资金（万元）含续建</td>'
	+str3+'</tr>';
	biaotou.empty();
	biaotou.append(biaotstr);
	var tbody = parent.$("#wqgzlist");
	tbody.empty();
	loadjzt();
	$.ajax({
		url:"/jxzhpt/gcybb/getghbbcx.do",
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate+"&excel_list.xzqhdm="+$.cookie('dist2'),
		type:"post",
		dataType:"JSON",
		success:function(msg){
			parent.datalist=msg;
			disLoadjzt();
			if (msg != null) {
				for ( var x = 0; x < msg.length; x++) {
					var tr="";
					if(x==0){
						tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							if(ss[j]=='v_0'){
								tr+="<td colspan='2'>"+msg[x][ss[j]]+"</td>";
								j++;
							}else{
								tr+="<td>"+msg[x][ss[j]]+"</td>";
							}
						}
						tr+="</tr>";
					}else{
						var tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							tr+="<td>"+msg[x][ss[j]]+"</td>";
						}
						tr+="</tr>";
					}
					tbody.append(tr);
				}
			}
			closewin();
		}
	});
	
}

function yhdzxwcbghcx(formdate){
	var ssstr="v_0";
	for(var i=1;i<110;i++){
		ssstr+=",v_"+i;
	}
	var ss=ssstr.split(",");
	var tbody = parent.$("#abgclist");
	tbody.empty();

	loadjzt();
	$.ajax({
		url:"/jxzhpt/gcybb/getghbbcx.do",
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate+"&excel_list.xzqhdm="+$.cookie('dist2'),
		type:"post",
		dataType:"JSON",
		success:function(msg){
			parent.datalist=msg;
			disLoadjzt();
			if (msg != null) {
				for ( var i = 0; i < msg.length; i++) {
					var tr="<tr>";
					for ( var j = 0; j < ss.length; j++) {
						tr+="<td>"+msg[i][ss[j]]+"</td>";
					}
					
					tr+="</tr>";
					tbody.append(tr);
				}
				}
			}
	});
}
function sjgzjdhzbcx(formdate){
// 	alert("asfdas");
	var tbody = parent.$("#datagrid");
	var enddate =parent.$("#enddate").datebox("getValue");
	var nf=enddate.substring(0, 4);
    alert(nf);
    alert(parent.YMLib.Var.formname);
    alert(parent.$("#datagrid"));
    loadjzt();
    tbody.datagrid({    
	    url:'/jxzhpt/gcybb/getghbbcx.do',
	    striped:true,
	    pagination:false,
	    rownumbers:true,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-20,
	    idField: 'id', //主键
	    queryParams: {
	    	"excel_list.formname":parent.YMLib.Var.formname,
	    	"&excel_list.formdate":formdate,
	    	"&excel_list.xzqhdm":$.cookie('dist2')
		},
	   columns:[[
	        {field:'v_0',title:'设区市',width:100,align:'center',rowspan:3},		        
	        {title:nf+'年项目建设',align:'center',colspan:17}
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
			{field:'v_7',title:'其中'+nf+'年新开工',width:120,align:'center',rowspan:1},
			{field:'v_8',title:'未开工',width:100,align:'center',rowspan:1},
			{field:'v_9',title:'自开工建设累计已完工（公里）',width:160,align:'center',rowspan:1},
			{field:'v_10',title:'其中'+nf+'年完工里程（公里）',width:120,align:'center',rowspan:1},
			{field:'v_11',title:'自开工建设累计完成总投资（万元）',width:140,align:'center',rowspan:1},
			{field:'v_12',title:'其中'+nf+'年完成投资（万元）',width:120,align:'center',rowspan:1},
			{field:'v_13',title:nf+'年新开工个数',width:100,align:'center',rowspan:1},
			{field:'v_14',title:'自开工建设累计已完工（公里）',width:160,align:'center',rowspan:1},
			{field:'v_15',title:'其中'+nf+'年完工里程（公里）',width:120,align:'center',rowspan:1},
			{field:'v_16',title:'自开工建设累计完成总投资',width:120,align:'center',rowspan:1},
			{field:'v_17',title:'其中'+nf+'年完成投资',width:120,align:'center',rowspan:1}
         ]],
	}); 
    disLoadjzt();
    alert(parent.$("#datagrid").datagrid('getColumnFields'));

}

</script>

<table style="width: 99%; margin-top: 15px;margin-left: 2px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:35%" align="right">版本号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span>
					<select id='formdate' class='easyui-combobox' style="width: 160px;">
						
					</select>
					</td>
			
			
			</tr>
			
			<tr style="height: 35px;">
				<td colspan="2" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="ghbbcx()">查询</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel" onclick="closewin()">取消</a></td>
			</tr>
			</table>
</body>
</html>
