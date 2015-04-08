<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造项目</title>
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
			loadUnit("gydw",$.cookie("unit"));
			loadDist("xzqhmc",$.cookie("dist"));
			xmnf("xmnf"); 
			loadBmbm2("jsdj", "技术等级");
			loadBmbm2("akjfl", "跨径分类");
			loadBmbm2("bzls", "补助历史");
			loadTsdq("tsdq");
			sckshWqgz();
			$("#qx_window").click(function(){
				parent.$('#lw_lr').window('destroy');
			});	
			$("#insertJhk").click(function(){
				lrjh();
			});
		});
		function sckshWqgz(){
			$("#grid").datagrid({    
				 url:'/jxzhpt/xmsck/lrjhWqgz.do',
				 queryParams : {
					 'sck_sbthcd':function(){
						 if($.cookie("unit2")=='______36') return 7;
					 		else return $.cookie("unit2").length;
					 	},
					 	'gydw': function(){
							 if($.cookie("unit2")=='______36') return "";
						 		else return $.cookie("unit2");
						 	},
					 	'xzqhdm':function(){
					 		if("360000"==$.cookie("dist")){
					 			return "";
					 		}else return $.cookie("dist");
					 	},
					 	'qlbh':$("#qlbh").val(),
					 	'qlmc':$("#qlmc").val(),
					 	'xmnf':$("#xmnf").combobox("getValue"),
					 	'jsdj':$("#jsdj").combobox("getValue"),
					 	'akjfl':$("#akjfl").combobox("getValue"),
					 	'bzls':$("#bzls").combobox("getValue"),
					},
				    striped:true,
				    pagination:true,
				    rownumbers:true,
				    pageNumber:1,
				    pageSize:10,
				    height:$(window).height()-150,
					width:$(window).width()-20,
			    columns:[[    
					{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
					{field:'cz',title:'操作',width:100,align:'center',formatter:function(value,row,index){
							return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
					}}, 
					{field:'bzls',title:'补助历史',width:60,align:'center'},
			        {field:'gydw',title:'管养单位',width:160,align:'center'},
			        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
			        {field:'qlbh',title:'桥梁编号',width:140,align:'center'},
			        {field:'qlmc',title:'桥梁名称',width:140,align:'center'},
			        {field:'qlzxzh',title:'桥梁中心桩号',width:140,align:'center'},
			        {field:'lxbm',title:'路线编号',width:120,align:'center'},
			        {field:'lxmc',title:'路线名称',width:120,align:'center'},
			        {field:'pddj',title:'桥梁评定等级',width:140,align:'center'},
			        {field:'xjgjnd',title:'改建/修建年度',width:140,align:'center'},
			        {field:'xmnf',title:'项目年份',width:140,align:'center'},
			        {field:'jsxz',title:'建设性质',width:140,align:'center'}
			    ]]    
			});  
	};
	function ckSckabgc(ck_id){
		parent.YMLib.rowid=ck_id;
		parent.YMLib.UI.createWindow('sck_ck','查看项目详情','wqgz_ck.jsp','sck_ck',900,500);
	}
	
	function lrjh(){
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
					 url : "/jxzhpt/xmsck/lrjhSckwqgz.do",
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
	}
	</script>
</head>
<body>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<p style="margin:8px 0px 4px 20px;">
								<span>管养单位：</span>
                              	<select id="gydw" style="width:218px">
                              	</select>
                             	<span>&nbsp;行政区划：</span>
                              	<select id="xzqhmc" style="width:218px">
                              	</select>
                               <span>&nbsp;桥梁编号：</span>
        						<input type="text" id="qlbh" style="width:72px;" />
                              	<span>&nbsp;桥梁名称：</span>
                              	<input id="qlmc" type="text" style="width:76px"/>
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="xmnf" style="width:70px">
                              	</select>
                              <span>&nbsp;特殊地区：</span>
                              	<select id="tsdq" style="width:70px"class="easyui-combobox">
                              	</select>
                              <span>&nbsp;技术等级：</span>
                              	<select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;按跨径分类：</span>
                              	<select id="akjfl" style="width:65px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;补助历史：</span>
                              	<select id="bzls" style="width:80px"class="easyui-combobox">
                              	</select>
                             </p>
                             <p style="margin:8px 0px 4px 20px;">
								<img onclick="sckshWqgz();" name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" style="border-width:0px;cursor: hand;" />
							 	<%-- <img onclick="lrjh();"alt="列入计划" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/lrjh_2.png'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/lrjh_1.png'" src="${pageContext.request.contextPath}/images/Button/lrjh_1.png" style="border-width:0px;cursor: hand; /> --%>
							  </p>
						</div>
				</fieldset>
			</td>
		</tr>
         <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            			<table id="grid" width="100%" height="320px"></table>
            	</td>
       		 </tr>
		</table>
	<center><div id="jh" >
		<a href="javascript:void(0)" id="insertJhk"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">添加</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a>
	</div></center>
</body>
</html>
