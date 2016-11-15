<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String ctxPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="../../../jeasyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../../jeasyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../../jeasyui/themes/style.css">
<link rel="stylesheet" type="text/css" href="../../../widget/autocomplete/jquery.autocomplete.css" >
<link rel="stylesheet" type="text/css" href="../../../css.css">
<!-- <script type='text/javascript' src='/gdncxm/dwr/interface/xmjbxxServer.js'></script>
<script type="text/javascript" src="/gdncxm/dwr/engine.js"></script>
<script type="text/javascript" src="/gdncxm/dwr/util.js"></script> -->

<script type="text/javascript" src="../../../jeasyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../../jeasyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../jeasyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../jeasyui/jscharts.js"></script>
<script type="text/javascript" src="../../../jeasyui/jscharts.plug.mb.js"></script>
<script type="text/javascript" src="../../../jeasyui/YMLib.js"></script>
<script type="text/javascript" src="../../../jeasyui/YMLibExtend.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.base64.js"></script>

<script type="text/javascript" src="../../../js/lhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="../../../js/lhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
<script type="text/javascript" src="../../../widget/autocomplete/jquery.autocomplete.min.js"></script>

<script type="text/javascript">

function openNdjhView(){
	YMLib.UI.window('yhgl_view_win','建设项目库查看','page/index/left/xmgl/yhgl/yhgl_view.jsp','icon-search',740,550);
}
function openNdjhXMHF(){
	var rows = $("#yhgl_table").datagrid('getSelections');
	alert(YMLib.Var.TypeID);
}

function openYhUpdate(id,username,truename,sex,tel,phone,role,unit,unitid,unitcode){
	$("#yhgl_table").datagrid('unselectAll');
	YMLib.Var.ID = id;
	YMLib.Var.USERNAME = username;
	YMLib.Var.TRUENAME = truename;
	YMLib.Var.SEX = sex;
	YMLib.Var.TEL = tel;
	YMLib.Var.PHONE =phone ;
	YMLib.Var.ROLE =role ;
	YMLib.Var.TBDWDM = unitcode;
	YMLib.Var.TBDWMC = unitid;
	YMLib.Var.UNIT = unit;
	YMLib.UI.window('yhgl_update_win','编辑用户','/gdncxm/page/jhgl/xtgl/yhgl_update.jsp','xmgl_03',470,370);
}
function updatezt(id,zt){
	
	if(zt=="启用"){
		zt="禁用";
		}else{
		zt="启用";
	}

		$.ajax({
			 type : "POST",
			 url : "/gdncxm/yhgl/updatezt.do",
			 dataType : 'json',
			 data : {
					'yhm' : id,
					'yhzt' : zt
				},
			 success : function(msg){
				 if(msg){
					 YMLib.Tools.Show(zt+'成功！',3000);
					 $("#yhgl_table").datagrid('reload');
				 }else{
					 YMLib.Tools.Show('更改状态失败',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
}
function deleteYh(_id){
	
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			
			$.ajax({
				 type : "POST",
				 url : "/gdncxm/yhgl/deleteYh.do",
				 dataType : 'json',
				 data : 'yhm=' +_id,
				 success : function(msg){
					 if(msg){
						 YMLib.Tools.Show('删除成功！',3000);
						 $("#yhgl_table").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('删除失败',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
	});
}
function mimareset(_id){
	
	$.messager.confirm('确认', '是否确认重置此用户密码？', function(r){
		if (r){
			
			$.ajax({
				 type : "POST",
				 url : "/gdncxm/yhgl/mimareset.do",
				 dataType : 'json',
				 data : 'yhm=' +_id,
				 success : function(msg){
					 if(msg){
						 YMLib.Tools.Show('重置密码成功！',3000);
						 $("#yhgl_table").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('重置密码失败',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
	});
}
 
	$(document).ready(function(){
		//alert(YMLib.Role.UNITNAME);
		$('#yhgl_dw').val(parent.parent.YMLib.Role.UNITCODE);
		 
		//alert(YMLib.Role.UNITCODE);
		// $('#yhgl_dw').combotree('setText',parent.parent.YMLib.Role.UNITNAME);
		
		$("#yhgl_dw").combotree({
            checkbox: false,   
            url: '/gdncxm/yhgl/seldw.do?yhdw='+parent.parent.YMLib.Role.UNITCODE,   
            onBeforeExpand:function(node,param){
           	 $('#yhgl_dw').combotree("tree").tree('options').url = "/gdncxm/yhgl/seldw2.do?yhdw="+node.id ;
            } ,
		    onClick:function(node){             
            $('#yhgl_dw').val(node.id);
        	}
        });
		$("#yhgl_table").datagrid({
			border : false,
			fit : true,
			loadMsg : '正在加载请稍候...',
			url:'/gdncxm/yhgl/selectYhList.do',
			queryParams : {
				'yhm' : $('#yhgl_name').val(),
				'yhzt' : $("#yhgl_type").val(),
				'yhdw' : $("#yhgl_dw").val()
			},
			pageNumber : 1,
			pageSize : 10,
			pageList:[10,20,30],
			striped : true,
			showFooter : false,
			singleSelect : false,
			rownumbers : true,
			pagination : true,
			columns : [ [{
					field : 'id',
					title : 'id',
					hidden : true
				},
			  {
				field : 'name',
				title : '用户名',
				width : 150
			},{
				field : 'truename',
				title : '真实姓名',
				width : 100
			},{
				field : 'sex',
				title : '性别',
				width : 100
			},{
				field : 'tel',
				title : '电话',
				width : 100,
				formatter : function(value,rec){
					return value;
				}
			},{
				field : 'phone',
				title : '手机',
				width : 130
			},{
				field : 'unit',
				title : '所属单位',
				width : 130
			},{
				field : 'role',
				title : '角色',
				width : 130
			},{
				field : 'zt',
				title : '状态',
				width : 100,
				align : 'center',
				formatter : function(value,rec,index){
					return '<input type=button onclick=updatezt("'+rec.id+'","'+rec.zt+'") style="width:60px;border:1px #8db2e3 solid;" value='+rec.zt+' />';
				}
			},{
				field : 'bj',
				title : '编辑',
				width : 65,
				align : 'center',
				formatter : function(value,rec,index){
					return '<input onclick=openYhUpdate("'+rec.id+'","'+rec.name+'","'+rec.truename+'","'+rec.sex+'","'+rec.tel+'","'+rec.phone+'","'+rec.role+'","'+rec.unit+'","'+rec.unitid+'","'+rec.unitcode+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=编辑 />';
				}
			},{
				field : 'sc',
				title : '删除',
				width : 65,
				align : 'center',
				formatter : function(value,rec,index){
					return '<input onclick=deleteYh("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=删除>';
				}
			},{
				field : 'czmm',
				title : '重置密码',
				width : 65,
				align : 'center',
				formatter : function(value,rec,index){
					return '<input onclick=mimareset("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=重置密码>';
				}
			}]],


			onRowContextMenu : function(e,rowIndex,rowData){
				YMLib.Var.ID = rowData.id;
				YMLib.Var.TypeID = rowData.xmlxdm;
				$('#yhgl_menu').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
			}
		});
		
		//$("#yhgl_layout").layout();
		$("#yhgl_btn_search").click(function(){
			$("#yhgl_table").datagrid('options').queryParams = {
				'yhm' : $.trim($('#yhgl_name').val()),
				'yhzt' : $("#yhgl_type").val(),
				'yhdw' : $("#yhgl_dw").val()
			};
			$("#yhgl_table").datagrid('reload');
		});
		$("#yhgl_btn_add").click(function(){
			YMLib.UI.window('yhgl_add_win','添加用户','/gdncxm/page/jhgl/xtgl/yhgl_add.jsp','app_add',470,370);
		});
		
		$(":input[id!='yhgl_type']").focus(function(){
			$("#yhgl_name")[0].focus();
		})
		
	});

</script>
 
</head>
<body>

<!-- 页面layout布局 开始 -->
<div id="yhgl_layout" fit="true" border="false">
    <div region="north" style="height:88px;" border="false">
    <div class="curr_nav info"><label><img src="/gdncxm/images/sy.gif" alt="" style="float:left;margin-right:5px;" />当前位置：系统管理 | 用户管理</label></div>
		<div><label for="yhgl_name" style="display:block; height:22px; line-height:22px; float:left;margin-left:10px;">用户名：</label><input id="yhgl_name" type="text" style="float: left;border: 1px solid #8db2e3;"/><label for="yhgl_name" style="display:block; height:22px; line-height:22px; float:left;margin-left:4px;">审核状态：</label>
			<select id="yhgl_type" style="float:left;">
				<option value="">请选择……</option> 
				<option value="启用">启用</option>
				<option value="禁用">禁用</option>
			</select>
			<label for="yhgl_dw" style="display:block; height:22px; line-height:22px; float:left;margin-left:10px;">单位名称：</label>
			<input id="yhgl_dw"  type="text" readOnly="true" class="easyui-combotree" style="width:250px;" editor="{type:'combotree'}" >
		　<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search">查　询</a>
		 <a id="yhgl_btn_add" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="app_add">添　加</a>
		</div>
    </div>
    <div region="center" border="false" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;height:550px;" onselectstart="return false">
    	<table id="yhgl_table"></table>
    </div>
</div>
<!-- 页面layout布局 开始 -->
</body>
</html>