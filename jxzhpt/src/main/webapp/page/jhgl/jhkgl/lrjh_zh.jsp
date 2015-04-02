<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>灾害防治项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			sckshAbgc();
			$("#qx_window").click(function(){
				parent.$('#lw_lr').window('destroy');
			});	
			$("#insertJhk").click(function(){
				var rows=$('#grid').datagrid('getSelections');
				if(rows.length==0) {
					alert("请选择要列入计划项目！");
					return;
				}
				var sckid= rows[0].sckid;
				for(var i=0;i<rows.length;i++){
					if(rows[i].sck_shzt=='未审核'){
						alert("对不起，该项目未审核！");
						return;
					} 
				 	if(rows[i].lrjh=='已列入'){
						alert("该项目已列入计划，请勿重复操作！");
						return;
					}
				}
			 	for(var i=1;i<rows.length;i++){
					sckid+=","+rows[i].sckid ;
				}
				if(confirm('您确定将该项目列入计划？')){
						$.ajax({
							 type : "POST",
							 url : "/jxzhpt/xmsck/lrjhSckzhfz.do",
							 dataType : 'json',
							 data : 'delstr=' +sckid,
							 success : function(msg){
								 if(msg){
									 	parent.$("#grid").datagrid('reload');
										alert("列入计划成功！");
										parent.$('#lw_lr').window('destroy');
								 }else{
									 alert('列入计划失败！');
								 }
							 },
							 error : function(){
								 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
							 }
						});
				}
			});
		});
		function sckshAbgc(){
			$("#grid").datagrid({    
				 url:'/jxzhpt/xmsck/lrjhZhfz.do',
				 queryParams : {
					 'sck_sbthcd':function(){
						 if($.cookie("unit2")=='______36') return 7;
					 		else return $.cookie("unit2").length;
					 	},
					 	gydw: $.cookie("unit2"),
					 	'xzqhdm':function(){
					 		if("360000"==$.cookie("dist")){
					 			return "";
					 		}else return $.cookie("dist");
					 	},
					},
				    striped:true,
				    pagination:true,
				    rownumbers:true,
				    pageNumber:1,
				    pageSize:10,
				    height:$(window).height()-30,
					width:$(window).width(),
			    columns:[[    
					{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
					{field:'cz',title:'操作',width:100,align:'center',formatter:function(value,row,index){
							return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
					}}, 
					{field:'lrjh',title:'列入计划状态',width:100,align:'center'},
					{field:'bzls',title:'补助历史',width:60,align:'center'},
			        {field:'gydw',title:'管养单位',width:160,align:'center'},
			        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
			        {field:'lxbm',title:'路线编号',width:120,align:'center'},
			        {field:'lxmc',title:'路线名称',width:120,align:'center'},
			        {field:'scqdzh',title:'起点桩号',width:140,align:'center'},
			        {field:'sczdzh',title:'止点桩号',width:140,align:'center'},
			        {field:'sczlc',title:'起止里程',width:140,align:'center'},
			        {field:'sczlc',title:'总里程',width:140,align:'center'},
			        {field:'scyhlc',title:'隐患里程',width:140,align:'center'},
			        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
			        {field:'xmnf',title:'项目年份',width:140,align:'center'},
			        {field:'jsxz',title:'建设性质',width:140,align:'center'}
			    ]]    
			});  
	};
	function ckSckabgc(ck_id){
		parent.YMLib.rowid=ck_id;
		parent.YMLib.UI.createWindow('sck_ck','查看项目详情','zhfz_ck.jsp','sck_ck',900,500);
	}
	</script>
</head>
<body>
	<table id="grid" width="100%" ></table>
	<center><div id="jh" >
		<a href="javascript:void(0)" id="insertJhk"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">添加</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a>
	</div></center>
</body>
</html>
