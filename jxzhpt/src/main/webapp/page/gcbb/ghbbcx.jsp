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
	if(parent.YMLib.Var.formname=='xgjwcmxb')
	xgjwcmxbghcx(formdate);
	if(parent.YMLib.Var.formname=='xgjwchzb')
		xgjwchzbghcx(formdate);
	if(parent.YMLib.Var.formname=='lmgzwcb')
		lmgzwcbghcx(formdate);
	if(parent.YMLib.Var.formname=='zhhfwcb')
		zhhfwcbghcx(formdate);
	
}
function xgjwcmxbghcx(formdate){
	var tbody = parent.$("#abgclist");
	tbody.empty();
	loadjzt();
	$.ajax({
		url:"/jxzhpt/gcybb/getghbbcx.do",
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate,
		type:"post",
		dataType:"JSON",
		success:function(msg){
			parent.datalist=msg;
			disLoadjzt();
			var sstr='v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12,v_13,v_14,v_15,v_16,v_17,v_18,v_19,v_20,v_21,v_22,v_23,v_24,v_25,v_26,v_27,v_28,v_29,v_30,v_31,v_32,v_33,v_34,v_35,v_36,v_37,v_38,v_39,v_40,v_41,v_42,v_43,v_44,v_45,v_46,v_47,v_48,v_49,v_50,v_51,v_52,v_53,v_54,v_55,v_56,v_57,v_58,v_59,v_60,v_61,v_62,v_63,v_64,v_65,v_66,v_67,v_68,v_69,v_70,v_71,v_72,v_73,v_74,v_75,v_76,v_77,v_78,v_79,v_80,v_83,v_84';
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
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate,
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
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate,
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
		data:"excel_list.formname="+parent.YMLib.Var.formname+"&excel_list.formdate="+formdate,
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