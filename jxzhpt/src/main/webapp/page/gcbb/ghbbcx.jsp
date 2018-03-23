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