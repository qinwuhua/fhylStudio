<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色分配管理</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
function openJsUpdate(_id){
	$("#jsgl_table").datagrid('unselectAll');
	YMLib.Var.ID = _id;
	YMLib.UI.createWindow('jsgl_update_win','编辑角色','./jsgl_update.jsp','xmgl_03',630,330);
}
function deleteJs(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteJsById.do",
				 dataType : 'json',
				 data : 'param.id=' +_id,
				 success : function(msg){
					 if(msg){
						 YMLib.Tools.Show('删除成功！',3000);
						 $("#jsgl_table").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('删除失败,请确认没有用户属于此角色',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
	});
}

$(function(){
	$("#jsgl_table").datagrid({
		border : true,
		fit : true,
		//fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectJsList.do',
		height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
		queryParams : {
			'param.name' : $('#jsgl_name').val(),
			'param.descr' : $("#jsgl_descr").val()
		},
		striped : true,
		singleSelect : false,
		columns:[[
		    {title:'分局',width:200,rowspan:3,align:'center'},
			{title:'实际评定养护里程Km',width:300,rowspan:3,align:'center'},
			{title:'本 月 路 况',width:600,colspan:6,align:'center'},
			{title:'其 中',width:400,colspan:4,align:'center'}
		],[
			{title:'优良路率 %',colspan:3,width:300,align:'center'},
			{title:'MQI',colspan:3,width:300,align:'center'},
			{title:'油 路',colspan:2,width:200,align:'center'},
			{title:'水 泥 路',colspan:2,width:200,align:'center'}
		],[
			{title:'上月优良路率%',width:100,align:'center'},
			{title:'本月优良路率%',width:100,align:'center'},
			{title:'优良路率比上月↑↓',width:100,align:'center'},
			{title:'上月MQI',width:100,align:'center'},
			{title:'本月MQI',width:100,align:'center'},
			{title:'MQI比上月↑↓',width:100,align:'center'},
			{title:'上月优良路率%',width:100,align:'center'},
			{title:'本月优良路率%',width:100,align:'center'},
			{title:'上月优良路率%',width:100,align:'center'},
			{title:'本月优良路率%',width:100,align:'center'}
		]]
	});
});
$(function(){
	$("#ddlYear").val();
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1; 
	for(var x=y;x>=2010;x--){
		$("#ddlYear").append("<option value="+x+">"+x+"</option>");
	}
	$("#yf"+m).attr("selected","selected");
});
</script>
<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;道班养护>&nbsp;公路管理月报分析表</div>
		</div>
		</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
						<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<p style="margin: 1% 0% 1% 2%;">
 						<span>年份：</span>
 						<select name="ddlYear" id="ddlYear" style="width: 60px;">
						</select>
 						<span>月份：</span>
 						<select name="ddlMonth" id="ddlMonth" style="width: 43px;">
							<option id="yf1" value="01">01</option>
							<option id="yf2" value="02">02</option>
							<option id="yf3" value="03">03</option>
							<option id="yf4" value="04">04</option>
							<option id="yf5" value="05">05</option>
							<option id="yf6" value="06">06</option>
							<option id="yf7" value="07">07</option>
							<option id="yf8" value="08">08</option>
							<option id="yf9" value="09">09</option>
							<option id="yf10" value="10">10</option>
							<option id="yf11" value="11">11</option>
							<option id="yf12" value="12">12</option> 
						</select>
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search">查　询</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-add">导出Excel</a>
 					 </p>
 			</fieldset>
      </td>
   </tr>
	       <tr>
	            <td width="100%" style="padding-top: 1%;padding-left:10px;">
	                 <div> 
	                    	<table id="jsgl_table"  ></table>
    				</div>
				</td>
			</tr>	
		</table>
	</div>
</body>
</html>