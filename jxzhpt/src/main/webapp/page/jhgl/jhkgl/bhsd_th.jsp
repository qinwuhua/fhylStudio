<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wqgz</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/qqgl.js"></script>
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
	$("#save_button").click(function(){		
		if($("#thyj").val()=="" || $("#thyj").val()==null){
			alert("请填写退回意见！");
			$("#thyj").focus();
			return ;
		}		
		tuiHui();
		
	});
	$("#qx_window").click(function(){
		parent.$('#jhk_th').window('destroy');
	});		
});
function tuiHui(){
	var rows=parent.$('#grid').datagrid('getSelections');
	var id=rows[0].id;	
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
	}	
	if(confirm('您确定退回该项目？')){
			$.ajax({
				 type : "POST",
				 url : "../../../jhgl/xgJhkBhsdTH.do",
				 dataType : 'json',
				 data : 'jhIds=' +id+'&jh.jh_thyj='+$('#thyj').val(),
				 success : function(msg){
					 if(msg){
						 parent.$("#grid").datagrid('reload');
						 alert('退回成功！');
						 parent.searchWqgz();
						 parent.$('#jhk_th').window('destroy');
					 }else{
						 alert('退回失败,请选择要退回项目！');
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
	}
}

</script>

<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				<font color='red' size='2'>*&nbsp;</font>退回意见：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="thyj" id="thyj" style="width: 250px" /></td>				
			</tr>
			<tr style="height: 35px;">
				<td colspan="2" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">退回</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a>
				</td>
			</tr>
			</table>
</body>
</html>