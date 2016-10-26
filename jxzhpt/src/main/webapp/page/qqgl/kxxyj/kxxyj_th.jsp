<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
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
<script type="text/javascript" src="../js/datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript" src="../js/wqsj.js"></script>
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
	
	function shbty(){
		if($("#shyj2").val()==''||$.trim($("#shyj2").val())==''){
			alert("请填入退回原因");
			return;
		}
		var rows=parent.$('#datagrid').datagrid('getSelections');
		
		var xmbm=rows[0].xmbm;
		var xmlx=xmbm.substr(10,1);
		var xmlx1='';
		if(xmlx==1)
			xmlx1='sjgz';
		if(xmlx==2)
			xmlx1='lmgz';
		if(xmlx==3)
			xmlx1='xj';
		if(xmlx==5)
			xmlx1='sh';
		for(var i=1;i<rows.length;i++){
			xmbm+=","+rows[i].xmbm;
		}
	  	
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/thkxxyjsb.do",
			 dataType : 'json',
			 data : 'lxsh.xmbm=' +xmbm+"&lxsh.thyy="+$("#shyj2").val()+"&lxsh.xmlx="+xmlx+"&lxsh.sbzt=0"+"&lxsh.sbthcd=9",
			 success : function(msg){
				 if(msg){
					 alert('退回成功！');
					 parent.$("#datagrid").datagrid('reload');
					 parent.showkxxTjxx(xmlx1);
					 parent.$('#lxxx').window('destroy');
				 }else{
					 YMLib.Tools.Show('退回失败！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
</script>
<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">退回原因：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left"  >
					<textarea rows="3"  id="shyj2" style="width: 98%"></textarea>
					
					</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="2" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="shbty" onclick="shbty()"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">退回</a> </td>
			</tr>
			</table>
</body>
</html>