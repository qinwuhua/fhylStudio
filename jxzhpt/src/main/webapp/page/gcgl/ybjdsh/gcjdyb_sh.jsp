<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退回资金拨付</title>
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/js/autocomplete/jquery.autocomplete.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
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
	
	function shty(){
		if($("#cscyj").val()==''||$.trim($("#cscyj").val())==''){
			alert("请您填写审核意见");
			return;
		}
		var data1=parent.obj;
		var data="gcglxmjd.id="+data1.id+"&gcglxmjd.xmbm="+parent.parent.obj1.XMBM+"&gcglxmjd.sbzt=1"+"&gcglxmjd.shzt=1"+"&gcglxmjd.zgshzt=0"+"&gcglxmjd.shyj="+$("#cscyj").val()+"&gcglxmjd.zgshyj="+"&gcglxmjd.thyy=";

		if(confirm("确认审核吗？")){
			$.ajax({
			 type:'post',
			 url:'/jxzhpt/gcgl/updateYbzt.do',
			 dataType : 'json',
			 data:data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 parent.$("#ybgrid").datagrid('reload');
					 parent.$('#wqxx').window('destroy');
					 
				 }else{
					 YMLib.Tools.Show('审核失败！',3000);
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
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">财审处意见：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left"  >
					<textarea rows="3"  id="cscyj" style="width: 98%" >同意</textarea>
					
					</td>
			</tr>
			<tr style="height: 35px;">
				
			<td colspan="2" style="background-color: #ffffff; height: 35px;" align="center">
					<!-- <a href="javascript:void(0)" id="shbty" onclick="zjbf_shty()"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">审核</a>  -->
			<a id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:shty()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">审核</a>
				
			</td>
			</tr>
			</table>
</body>
</html>