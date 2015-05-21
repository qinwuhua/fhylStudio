<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
	YMLib.UI.createWindow('jsgl_add_win','编辑角色','./jsgl_update.jsp','xmgl_03',630,330);
}
function deleteJs(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteJsById.do",
				 dataType : 'json',
				 data : 'param.roleid=' +_id,
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
		border:true,
		fit : true,
		fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectExistLxProgramList.do',
		queryParams : {
			"pb.roadcode":parent.YMLib.Var.bm,
			"pb.gydw":$.cookie("unit2"),
			"pb.xzqhmc":filterXzqhdm(parent.YMLib.Var.bm)
		},
		singleSelect : false,
		striped : true,
		pagination : true,
		rownumbers : true,
		pageNumber : 1,
		pageSize : 10,
		columns : [[
		{
			field : 'mx',
			title : '明细',
			width : 80,
			align : 'center',
			formatter : function(value,rec,index){
				return '<input onclick="onclickXx('+"'"+rec.unit+"',"+"'"+rec.id+"'"+')" style="width:60px;border:1px #8db2e3 solid;" type="button" value="查看明细"/>';
			}
		},{
			field : 'roadname',
			title : '项目名称',
			width : 100,
			align : 'center'
		},{
			field : 'unit',
			title : '项目类型',
			width : 100,
			align : 'center'
		},{
			field : 'roadstart',
			title : '起止点桩号',
			width : 100,
			align : 'center',
			formatter : function(value,rec,index){
				return rec.roadstart+'-'+rec.roadends;
			}
		},{
			field : 'gydw',
			title : '所属单位',
			width : 200,
			align : 'center'
		},{
			field : 'nf',
			title : '年份',
			width : 50,
			align : 'center'
		}
		]]
	});
});
function filterXzqhdm(xzqhdm){
	xzqhdm= xzqhdm.substr(xzqhdm.length-6);
	var yi1 = new RegExp("^36[0-9][1-9]00$");
	var yi2= new RegExp("^36[1-9][0-9]00$");
	var result=null;
	if(xzqhdm=="360000"){
		result='36%';
	}else if(yi1.test(xzqhdm) || yi2.test(xzqhdm)){
		result=xzqhdm.substring(0, xzqhdm.length-2)+"__";
	}else{
		result=xzqhdm;
	}
	return result;
}
function onclickXx(xmlx,id){
	var url="/jxzhpt/page/jhgl/jhkxx/";
	if(xmlx=="路面改建")
		url+="gclmgj.jsp";
	else if(xmlx=="路面升级")
		url+="gclmsj.jsp";
	else if(xmlx=="水毁项目")
		url+="shxm.jsp";
	else if(xmlx=="养护大中修")
		url+="yhdzx.jsp";
	else if(xmlx=="安保工程")
		url+="abgc.jsp";
	else if(xmlx=="灾害防治")
		url+="zhfz.jsp";
	parent.YMLib.Var.jhbm=id;
	parent.YMLib.Var.bz="xx";
	parent.YMLib.UI.createWindow('xmxx_xx','项目信息',url,'xmxx',1000,500);
}

</script>
<div style="width:100%;">
    <div style="height:500px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    	<table id="jsgl_table" style="height:100%;" ></table>
    </div>
</div>
</body>
</html>