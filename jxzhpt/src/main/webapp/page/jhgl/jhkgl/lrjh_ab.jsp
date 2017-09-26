<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目</title>
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
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqhmc",$.cookie("dist"));
			xmnf("xmnf");
			xmnf("lrjhnf");
			loadBmbm2("lxjsdj", "技术等级");
			loadBmbm2("bz", "行政等级");
			loadBmbm2("bzls", "补助历史");
			sckshAbgc();
			$("#qx_window").click(function(){
				parent.$('#lw_lr').window('destroy');
			});	
			$("#insertJhk").click(function(){
				lrjh();
			});
		});
		function sckshAbgc(){
			$("#grid").datagrid({    
				 url:'/jxzhpt/xmsck/lrjhAbgc.do',
				 queryParams : {
					 'sck_sbthcd':function(){
						 if($.cookie("unit2")=='______36') return 7;
					 		else return $.cookie("unit2").length;
					 	},
					 	'gydw': function(){
					 		var gydw=$("#gydw").combotree("getValues");
							if(gydw.length==0){
								if($.cookie("unit2")=='_____36')
									gydwstr=36;
								else gydwstr= $.cookie("unit2");
							}else if(gydw.length==1){
								if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
					 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
								gydwstr=gydw[0] ;
							}else{
								gydwstr= gydw.join(',');
							}
					 		return gydwstr;
						 	},
					 	'xzqhdm':function(){
					 		var xzqhdm=$("#xzqhmc").combotree("getValues");
							if(xzqhdm.length==0){
								xzqhstr= $.cookie("dist2");
							}else if(xzqhdm.length==1){
								if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
					 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
					 		xzqhstr=xzqhdm[0] ;
							}else{
								xzqhstr= xzqhdm.join(',');
							}
							return xzqhstr;
					 	},
					 	'lxmc' : $('#lxmc').val(),
					 	'xmnf':$("#xmnf").combobox("getValue"),
					 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
					 	'lxbm':$("#lxbm").val(),
					 	'bzls':$("#bzls").combobox("getValue"),
					 	'bz':$("#bz").combobox("getValue"),
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
			        {field:'lxbm',title:'路线编码',width:120,align:'center'},
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
		parent.YMLib.UI.createWindow('sck_ck','查看项目详情','abgc_ck.jsp','sck_ck',900,500);
	}
	function lrjh(){
		var rows=$('#grid').datagrid('getSelections');
		if(rows.length==0) {
			alert("请选择要列入计划项目！");
			return;
		}
		var sckid= rows[0].sckid;
		var jh_sbthcd="";
		var gydw=rows[0].tbbmbm;
		var shi1=new RegExp("^[0-9]{7}[0-9][1-9]00$"),shi2=new RegExp("^[0-9]{7}[1-9][0-9]00$");
		var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$"),xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
		if(shi1.test(gydw) || shi2.test(gydw)){
 			jh_sbthcd="2";
 		}else if(xian1.test(gydw) || xian2.test(gydw)){
 			jh_sbthcd="0";
 		}
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
	 		if(shi1.test(rows[i].tbbmbm) || shi2.test(rows[i].tbbmbm)){
	 			jh_sbthcd+=",2";
	 		}else if(xian1.test(rows[i].tbbmbm) || xian2.test(rows[i].tbbmbm)){
	 			jh_sbthcd+=",0";
	 		}
			sckid+=","+rows[i].sckid ;
		}
	 	if($('#lrjhnf').combobox("getValue")==""){
	 		alert("请选择列入计划年份！");
	 		return;
	 	}
		if(confirm('您确定将该项目列入计划？')){
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/xmsck/lrjhSckabgc.do",
					 dataType : 'json',
					 data : 'delstr=' +sckid+'&nf='+$('#lrjhnf').combobox("getValue")+'&sbthcd1='+jh_sbthcd,
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
                                <span>&nbsp;路线名称：</span>
        						<input type="text" id="lxmc" style="width:100px;" />
        						<span>&nbsp;路线编码：</span>
        						<input type="text" id="lxbm" style="width:100px;" />
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="xmnf" style="width:70px">
                              	</select>
                              <span>&nbsp;特殊地区：</span>
                              	<select id="tsdq"  style="width:70px"class="easyui-combobox">
                              	</select>
                              <span>&nbsp;技术等级：</span>
                              	<select id="lxjsdj" style="width:70px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;原行政等级：</span>
                              	<select id="bz" style="width:70px"class="easyui-combobox"></select>
                              	<span>&nbsp;补助历史：</span>
                              	<select id="bzls" style="width:104px"class="easyui-combobox"></select>
                              	<span>&nbsp;列入计划年份：</span>
                              	<select id="lrjhnf" style="width:80px"class="easyui-combobox"></select>
                             </p>
                             <p style="margin:8px 0px 4px 20px;">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'"onclick="sckshAbgc();" src="../../../images/Button/Serch01.gif" style="border-width:0px;cursor: hand;" />
								<img onclick="lrjh();"alt="列入计划" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/lrjh_2.png'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/lrjh_1.png'" src="${pageContext.request.contextPath}/images/Button/lrjh_1.png" style="border-width:0px;cursor: hand; />
							 </p>
						</div>
				</fieldset>
			</td>
		</tr>
         <tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid" width="100%" height="320px"></table>
            		 </div>
            	</td>
       		 </tr>
		</table>
	<center>
	<div id="jh" >
		<a href="javascript:void(0)" id="insertJhk"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">添加</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a>
	</div></center>
</body>
</html>
