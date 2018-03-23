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
	loadBmbm('nian','年');
	loadBmbm('yue','月');
	loadBmbm('ri','日');
	
// 	alert(parent.YMLib.Var.formname);
	
	
})
//关闭窗口
function closewin(){
	parent.$('#lxxx').window('destroy')
}
//添加
function addghbb(){
	if($("#nian").combobox('getValue')==''){alert("请选择年份");return;}
	if($("#yue").combobox('getValue')==''){alert("请选择月份"); return;}
	if($("#ri").combobox('getValue')==''){alert("请选择日"); return;}
	var nian=$("#nian").combobox('getValue');
	var yue=$("#yue").combobox('getValue');
	var ri=$("#ri").combobox('getValue');
	var formdate=nian+"-"+yue+"-"+ri;
	if(confirm("确认固化版本，版本号："+formdate)){
		loadjzt();
		//alert(ss.join(","));
		$.ajax({
			url:"/jxzhpt/gcybb/addghbb.do",
			data:'excel_list.formname='+parent.YMLib.Var.formname+'&excel_list.formdate='+formdate,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				disLoadjzt();
				if(msg){
					alert("保存成功");
					closewin()
				}else{
					alert("保存失败");
				}
				
				
			}
		})
	}
	
}

</script>

<table style="width: 99%; margin-top: 15px;margin-left: 2px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:35%" align="right">版本号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span>
					<select id='nian' class='easyui-combobox' style="width: 60px;">
						
					</select>
					-
					<select id='yue' class='easyui-combobox' style="width: 40px;"></select>
					-
					<select id='ri' class='easyui-combobox' style="width: 40px;"></select>
					</td>
			
			
			</tr>
			
			<tr style="height: 35px;">
				<td colspan="2" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="addghbb()">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel" onclick="closewin()">取消</a></td>
			</tr>
			</table>
</body>
</html>