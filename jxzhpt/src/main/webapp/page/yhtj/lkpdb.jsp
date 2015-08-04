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
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/yhtj.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
$(function(){
	$("#ddlYear").val();
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1; 
	for(var x=y;x>=2010;x--){
		$("#ddlYear").append("<option value="+x+">"+x+"</option>");
	}
	$("#yf"+m).attr("selected","selected");
	showAll();
});
function showAll(){
	var gydw=$.cookie("unit");
	var nf=$("#ddlYear").val();
	var yf=$("#ddlMonth").val();
	$("#jsgl_table").datagrid({
		border : true,
		fit:true,
		loadMsg : '正在加载请稍候...',
		url:'/jxzhpt/wjxt/selectPdbList.do',
		queryParams : {
			gydw:gydw,
	    	nian:nf,
	    	yue:yf
		},
		striped : true,
		singleSelect : false,
		columns:[[
				    {field:'V_0',title:'分局(道班名称)',width:200,rowspan:3,align:'center'},
					{field:'V_1',title:'养护里程(公里)',width:120,rowspan:3,align:'center'},
					{title:'路况等级(公里)',width:500,colspan:5,align:'center'},
					{field:'V_7',title:'MQI',width:100,rowspan:3,align:'center'},
					{field:'V_8',title:'优良路率(%)',width:100,rowspan:3,align:'center'},
					{title:'其　　　　中',width:1800,colspan:16,align:'center'},
					{title:'养路工人出勤情况',width:900,colspan:6,align:'center'}
				],[
				    {field:'V_2',title:'优',width:100,rowspan:2,align:'center'},
					{field:'V_3',title:'良',width:100,rowspan:2,align:'center'},
					{field:'V_4',title:'中',width:100,rowspan:2,align:'center'},
					{field:'V_5',title:'次',width:100,rowspan:2,align:'center'},
					{field:'V_6',title:'差',width:100,rowspan:2,align:'center'},
					{title:'油　路 (公里)',width:600,colspan:6,align:'center'},
					{field:'V_15',title:'MQI',width:150,rowspan:2,align:'center'},
					{field:'V_16',title:'优良路率(%)',width:150,rowspan:2,align:'center'},
					{title:'水　泥　路　(公里)',width:600,colspan:6,align:'center'},
					{field:'V_23',title:'MQI',width:150,rowspan:2,align:'center'},
					{field:'V_24',title:'优良路率(%)',width:150,rowspan:2,align:'center'},
					{title:'工人数 (人)',width:300,colspan:2,align:'center'},
					{title:'出    工    率',width:300,colspan:2,align:'center'},
					{title:'出    勤    率',width:300,colspan:2,align:'center'}
				],[
					{field:'V_9',title:'总里程',width:100,align:'center'},
					{field:'V_10',title:'优',width:100,align:'center'},
					{field:'V_11',title:'良',width:100,align:'center'},
					{field:'V_12',title:'中',width:100,align:'center'},
					{field:'V_13',title:'次',width:100,align:'center'},
					{field:'V_14',title:'差',width:100,align:'center'},
					{field:'V_17',title:'总里程',width:100,align:'center'},
					{field:'V_18',title:'优',width:100,align:'center'},
					{field:'V_19',title:'良',width:100,align:'center'},
					{field:'V_20',title:'中',width:100,align:'center'},
					{field:'V_21',title:'次',width:100,align:'center'},
					{field:'V_22',title:'差',width:100,align:'center'},
					{field:'V_25',title:'在册',width:150,align:'center'},
					{field:'V_26',title:'临时',width:150,align:'center'},
					{field:'V_27',title:'直接生产工日',width:150,align:'center'},
					{field:'V_28',title:'出工率(%)',width:150,align:'center'},
					{field:'V_29',title:'直接间接生产工日',width:150,align:'center'},
					{field:'V_30',title:'出勤率(%)',width:150,align:'center'}
				]]
	});
}
function export_pdb(){
	var gydw=$.cookie("unit");
	var nf=$("#ddlYear").val();
	var yf=$("#ddlMonth").val();
	var data="gydw="+gydw+"&nian="+nf+"&yue="+yf;
	window.location.href="/jxzhpt/wjxt/export_pdb.do?"+data;
}
function delete_pdb(){
	var nf=$("#ddlYear").val();
	var yf=$("#ddlMonth").val();
	var data="nian="+nf+"&yue="+yf;
	if(confirm("您确认删除"+nf+"年"+yf+"月的数据吗？")){
		$.ajax({
			type:"post",
			url:"/jxzhpt/wjxt/delete_pdb.do",
			dataType:'json',
			data:data,
			success:function(msg){
				if(msg){
					alert("删除成功！");
					$("#jsgl_table").datagrid('reload');
				}else{
					alert("该年月暂无数据，删除失败！");
				}
			}
		});
	}
}
function dcmb(){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName=gllkpdb";
}
</script>
<div style="width:100%;">
    <div  style="height:84px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;道班养护>&nbsp;公路路况评定表</div>
		</div>
		<div  style="padding-left: 10px; padding-right: 10px;">
			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
 				<legend style="padding: 3px 0 3px 0; font-weight: bold; color: Gray; font-size: 12px;">
 					
 				</legend>
 				<div>
 					<p style="margin: 5px;">
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
 						 <a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="showAll()">查　询</a>
						<a id="yhgl_btn_add" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="import_pdb('lkpdb')">导入Excel</a>
 						<a id="yhgl_btn_add" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-no" onclick="delete_pdb()">删除</a>
 						<a id="yhgl_btn_add" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="dcmb()">导出模板</a>
 						<a id="yhgl_btn_add" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="export_pdb()">导出Excel</a>
 					</p>
 				</div>
 			</fieldset>
        </div>
    </div>
   <div  id='gddiv' style="height:430px;margin:5px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    	<table id="jsgl_table" style="height:100%;" ></table>
    </div>
     <script type="text/javascript">
          $("#gddiv").attr('style','width:100%;height:'+($(window).height()-100)+'px');
    </script>
</div>
</body>
</html>