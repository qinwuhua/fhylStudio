<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bhsd</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript">
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function tzxz(){
	
	if($("#tz_type").combo('getValue')=='请选择'){
		alert("请选择调整类别");
		return;
	}
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/bhsdTz.do",
		 dataType : 'json',
		 data : 'jh.id='+parent.rowid+"&jh.tz_type="+$("#tz_type").combo('getValue'),
		 success : function(msg){
			 if(msg){
				 alert("调整成功");
				 parent.$("#grid").datagrid('reload');
				 parent.$('#plan_ck').window('destroy');
			 }else{
				 alert("调整失败");
			 }
		 }
	})
}
</script>
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
		<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:30%" align="right">请选择调整类别：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="tz_type" class="easyui-combobox" data-options="panelHeight:'80'"  style="width: 152px">
						<option value="请选择" selected>请选择</option>
						<option value="0" >取消</option>
						<option value="1">规模变更</option>
						<option value="2">建设性质变更</option>
					</select>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" onclick="tzxz()"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">确定</a> <a
					href="javascript:void(0)" onclick="closes('plan_ck')"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a>
				</td>
			</tr>
		</table>
	</body>
</html>