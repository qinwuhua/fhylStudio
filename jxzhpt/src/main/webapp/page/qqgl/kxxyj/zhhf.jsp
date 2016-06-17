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
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/kxxyj/js/kxxyj.js"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script> --%>
	<script type="text/javascript">
		$(function(){
			tsdqdx("tsdq");
			if($.cookie("unit2").length!=7)
			$("img[name='bxs']").attr('style','display:none');
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('jsdj','技术等级');
			loadGldj('gldj');
			urlxmnf("xmnf",getUrlParame('id'));
			setTimeout("showShgk()",'1700');
		});
		function showxx(index){
			var data=$("#datagrid").datagrid('getRows')[index];
			obj=data;
			YMLib.UI.createWindow('lxxx','可行性研究详细信息','sh_xx.jsp','lxxx',900,400);
		}
		function editsh(index){
			var data=$("#datagrid").datagrid('getRows')[index];
			obj=data;
			YMLib.UI.createWindow('lxxx','编辑可行性研究信息','sh_edit.jsp','lxxx',900,400);
		}
		function shenhsh(index){
			var data=$("#datagrid").datagrid('getRows')[index];
			obj=data;
			
			var params="lxsh.xmbm="+obj.xmbm;
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/qqgl/shshkxx.do",
				 dataType : 'json',
				 data : params,
				 success : function(msg){
					 if(msg){
						 alert('审核成功！');
						 $("#datagrid").datagrid('reload');
					 }else{
						 alert('审核失败');
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
		
		function showkxxShxx(){
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var xmmc=$("#xmmc").val();
			var xmnf=$("#xmnf").combobox('getValues').join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jsdj=$("#jsdj").combobox('getValues').join(",");
			var gldj=$("#gldj").combobox('getValues').join(",");
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var lxbm=$("#lxbm").val();
			var lxmc=$("#lxmc").val();
			var ghlxbm=$("#ghlxbm").val();
			var ghlxmc=$("#ghlxmc").val();
			var lsjl=$("#lsjl").combobox('getValue');
			var shzt=$("#shzt").combobox('getValue');
			var params={'lxsh.xzqh':xzqhstr,'lxsh.xmmc':xmmc,'lxsh.xmnf':xmnf,'lxsh.jsdj':jsdj,'lxsh.gldj':gldj,'lxsh.tsdq':tsdq,
					'lxsh.lxbm':lxbm,'lxsh.lxmc':lxmc,'lxsh.ghlxbm':ghlxbm,'lxsh.ghlxmc':ghlxmc,'lxsh.lsjl':lsjl,'lxsh.shzt':shzt};
			
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/showkxxShxx.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						 $("#xmsl").html(msg.sl);
						 $("#tz").html(msg.tz);
						 $("#cgs").html(msg.bzcs);
						 $("#stz").html(msg.stz);
						 $("#sjl").html(msg.sjl);
						 $("#lc").html(msg.lc);
						 $("#dftz").html(msg.dftz);
					}else{
						$('#xmsl').html('0');
						$('#tz').html('0');
						$('#lc').html('0');
					    $("#cgs").html('0');
					    $("#stz").html('0');
					    $("#sjl").html('0');
					    $("#dftz").html('0');
					}
					
				}
			});
		}
		
		
		
		function showShgk(){//查询水毁初步设计即灾毁恢复
			showkxxShxx();
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var xmmc=$("#xmmc").val();
			var xmnf=$("#xmnf").combobox('getValues').join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jsdj=$("#jsdj").combobox('getValues').join(",");
			var gldj=$("#gldj").combobox('getValues').join(",");
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var lxbm=$("#lxbm").val();
			var lxmc=$("#lxmc").val();
			var ghlxbm=$("#ghlxbm").val();
			var ghlxmc=$("#ghlxmc").val();
			var lsjl=$("#lsjl").combobox('getValue');
			var shzt=$("#shzt").combobox('getValue');
			var params={'lxsh.xzqh':xzqhstr,'lxsh.xmmc':xmmc,'lxsh.xmnf':xmnf,'lxsh.jsdj':jsdj,'lxsh.gldj':gldj,'lxsh.tsdq':tsdq,
					'lxsh.lxbm':lxbm,'lxsh.lxmc':lxmc,'lxsh.ghlxbm':ghlxbm,'lxsh.ghlxmc':ghlxmc,'lxsh.lsjl':lsjl,'lxsh.shzt':shzt};
			
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/qqgl/selectShkxList.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-160,
			    width:$(window).width()-30,
			    queryParams: params,
			    columns:[[
			        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
			        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
			        	if($.cookie("unit2").length!=7)
			        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="showxx('+index+')">详细</a>    '+'编辑 ';

			        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="showxx('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsh('+index+')">编辑</a>  ';
			        }},
			        
			        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
			        	if(row.shzt=='0'){
			        		if($.cookie("unit2").length!=7)
			        			return '未审核';
			        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenhsh('+index+')">未审核</a>';
			        	}else if(row.shzt=='1')
			        		return '已审核';
			        }},
			        {field:'lsjl',title:'历史记录',width:60,align:'center',
						formatter: function(value,row,index){
							if(value=="是"){
								return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
							}else{
								return value;
							}
						}
					},
					{field : 'gydw',title : '管养单位',width : 120,align : 'center'},
				    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
				    {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
						formatter: function(value,row,index){
			        		if(Number(row.xmsl)>1){
			        			return '<label style="color:red;">'+value+'</label>';
			        		}else{
			        			return value;
			        		}
			        	}
			        },
			        {field : 'lc',title : '里程',width : 60,align : 'center'},
				    {field:'jsdj',title:'技术等级',width:100,align:'center'},
				    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
				    {field : 'lxbh',title : '路线编号',width : 60,align : 'center'},
				    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
				    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
				    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'},
				    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
				    {field : 'wgny',title : '完工年月',width : 80,align : 'center'},
				    {field : 'tz',title : '投资',width : 80,align : 'center'},
				    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'},
				   /*  {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
		        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">添加路线</a>   ';
		        }} */
			    ]],
				view: detailview,
				detailFormatter:function(index,row){   
			        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
			    },
			    onExpandRow: function(index,row){
			    	$('#table_lx'+row.xmbm).datagrid({
			    		url:'/jxzhpt/qqgl/selectlxList.do',
			    		 queryParams: {
			    			 'lx.jdbs':1,
			    			 'lx.xmid':row.xmbm,
			    			 'lx.sffirst':'1'
			    			},
		    			columns:[[
							{field:'cz',title:'操作',width:150,align:'center',
								formatter: function(value,row,index){
									return '<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
								}
							},
		    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
		    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
		    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
		    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
		    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
		    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
		    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
		    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
		    			    {field:'lc',title:'里程',width:60,align:'center'}
		    			]]
			    	});
			    }   
			}); 
		}
		
		
		
		function shangB(){
			var rows=$('#datagrid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要审核项目！");
				return;
			}
			for(var i=0;i<rows.length;i++){
				if(rows[i].shzt=='1'){
					alert("对不起，有项目已审核！");
					return;
				}
			}
			if($.cookie("unit2").length!=7) {
				alert("您无审核项目权限！");
				return;
			}
			var id=rows[0].xmbm;
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].xmbm ;
			}
			if(confirm('您确定审核该项目？')){
				var data = "lxsh.xmbm="+id;
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/qqgl/shshkxx.do",
					 dataType : 'json',
					 data : data,
					 success : function(msg){
						 if(msg){
							 alert('审核成功！');
							 $("#datagrid").datagrid('reload');
						 }else{
							 alert('审核失败,请选择要上报项目！');
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
			}
		} 
		
		function tuiHui(){
			var rows=$('#datagrid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要退回项目！");
				return;
			}
			if($.cookie("unit2").length!=7){
				alert("您不是省级用户");
				return;
			}
			var id=rows[0].id;
			var xmbm=rows[0].xmbm;
			for(var i=1;i<rows.length;i++){
				xmbm+=","+rows[i].xmbm;
			}
			for(var i=0;i<rows.length;i++){
			if(rows[i].sbzt1=='1'){
				//
				var data = "lxsh.xmbm="+xmbm;
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/qqgl/sjgzsfcb.do",
					 dataType : 'json',
					 data : data,
					 success : function(msg){
						 if(msg){
							 if(confirm('您确定将该项目退回未审核状态？')){
										$.ajax({
											 type : "POST",
											 url : "/jxzhpt/qqgl/thSjgzkxx1.do",
											 dataType : 'json',
											 data : data,
											 success : function(msg){
												 if(msg){
													 alert('退回成功！');
													 $("#datagrid").datagrid('reload');
												 }else{
													 alert('退回失败！');
												 }
											 },
											 error : function(){
												 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
											 }
										});
								}
							 
						 }else{
							 alert('项目已经进行初步设计上报，无法退回！');
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
				
				//
				return;
			}
			if(rows[i].tbbmbm==$.cookie("unit")){
				alert("对不起，由您添加的项目无法退回！");
				return;
			}
			}	
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].id ;
			}
			var sbthcd=0;
			sbthcd=$.cookie("unit2").length+2;
			var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
			if(confirm('您确定退回该项目？')){
					$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/thSjgzkxx.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
							 if(msg){
								 alert('退回成功！');
								 $("#datagrid").datagrid('reload');
							 }else{
								 alert('退回失败！');
							 }
						 },
						 error : function(){
							 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
						 }
					});
			}
		}
	</script>
	<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">前期管理>&nbsp;工程可行性研究报告>&nbsp;<span id='bstext'></span>>&nbsp;灾毁恢复</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-top: 10px;height: 130px;">
        			<fieldset id="searchField" style="width:99%; text-align: left; vertical-align: middle;height: 130px;padding-bottom:10px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
        						<!-- <td>行政区划：</td>
        						<td style="width:180px;"><select id="xzqh" style="width:180px;"></select></td>
        						<td>项目名称：</td>
        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
        						<td>项目年份：</td>
        						<td><select id="xmnf" style="width:99px;">
								</select></td>
								<td>技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:99px;" class="easyui-combobox"></select></td> -->
								 <td>行政区划：</td>
        						<td style="width:180px;"><select id="xzqh" style="width:180px;"></select></td>
        						<td>项目名称：</td>
        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
        						<td>技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:99px;" class="easyui-combobox"></select></td>
								<td>项目年份：</td>
        						<td><select id="xmnf" style="width:99px;">
								</select></td>
        					</tr>
        					<tr height="32">
        					
								 <td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:180px;" class="easyui-combobox"></select></td>
								
        					<td>原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
        						<!-- <td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:180px;" class="easyui-combobox"></select></td>
        						
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:99px;" >
								</select></td>
        						
        						<td>原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
        						<td>原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:95px;" /></td> -->
        						<td>原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
        						 <td>规划路线编码：</td>
        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
        						
								
        					</tr>
        					 <tr height="32">
        					 <td>规划路线名称：</td>
        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
        						<td>是否有补助历史：</td>
        						<td><select id="lsjl" style="width:99px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
        					<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:99px;" >
								</select></td>
								<td>审核状态：</td>
        						<td><select id="shzt" style="width:99px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="0">未审核</option>
									<option value="1">已审核</option> 
								</select></td>
        					
        					<!--
        						<td>规划路线编码：</td>
        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
        						<td>规划路线名称：</td>
        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
        						<td>历史记录：</td>
        						<td><select id="lsjl" style="width:99px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
        						<td>审核状态：</td>
        						<td><select id="shzt" style="width:99px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="0">未审核</option>
									<option value="1">已审核</option> 
								</select></td>-->
        					</tr> 
        					<tr height="32">
        					
                              <td colspan="10">
        						<img onclick="showShgk()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        						<img onclick="dckxxModule('sh');" name="bxs" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" />
								<img onclick="importsjgzkxx('sh')" name="bxs"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="border-width:0px;vertical-align:middle;" />
<%-- 								<img alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportModule('Plan_Security')"/> --%>
<%-- 								<img alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" onclick="importData_jh('abgc_jh')" style="vertical-align:middle;"/> --%>
								<img onclick="shangB();" name="bxs" id="shenPi" src="../../../images/Button/sp1.jpg" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'   " src="" style="border-width:0px;vertical-align:middle;"" />
<!-- 								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuiHui();" style="border-width:0px;vertical-align:middle;" /> -->
<%-- 				                <img alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" onclick="dropOne()" style="vertical-align:middle;"> --%>
<%-- 				                <img onclick="exportExcel('abgc')" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
				             </td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
<!--         	<tr> -->
<!--         		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;"> -->
<!--         			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安保工程项目， -->
<!--         			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里， -->
<!--         			隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里， -->
<!--         			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元， -->
<!--         			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元， -->
<!--         			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。 -->
<!--         		</td> -->
<!--         	</tr> -->
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
            		<div>
            			<table id="datagrid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<!-- <div id="abgc_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
	<div id="abgc_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
