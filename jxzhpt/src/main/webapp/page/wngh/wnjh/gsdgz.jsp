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
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/wngh/wnjh/js/wnjh.js"></script>
	<script type="text/javascript">
		$(function(){
			var urlid=request('id');
			setxmnf("xmnf",urlid);
			
			tsdqdx('tsdq');
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('jsdj','技术等级');
			gsdxmlx('xmlx');
			loadGldj('gldj');
			
			setTimeout("showAllgsd()",'1700');
// 			showAllgj();
		});
		
		function showgsdtj(xmlx){
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
			var xmnf=$("#xmnf").combobox('getValues').join(",");
			if(xmnf=='')
				xmnf=new Date().getFullYear();
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var jsdj=$("#jsdj").combotree('getText');
			var gldj=$("#gldj").combobox('getValues').join(",");
			var xmlx1=$("#xmlx").combobox("getValues").join(",");
			if(xmlx1.substr(0,1)==',')
				xmlx1=xmlx1.substr(1,xmlx1.length);
			var data="xzqh="+xzqhstr+"&gydw="+gydwstr
			+"&xmnf="+xmnf+"&tsdq="+tsdq+"&jsdj="+jsdj+"&gldj="+gldj+'&lxsh.xmmc='+$("#xmmc").val()+'&lxsh.ghlxbh='+$("#lxbm").val()+'&lxsh.lxmc='+$("#lxmc").val()+'&lxsh.xmlx1='+xmlx1+"&xmlx="+xmlx+'&lxsh.lsjl='+$("#lsjl").combobox('getValue');
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/qqgl/showgjtj.do",
				 dataType : 'json',
				 data : data,
				 success : function(msg){
					 $("#xmsl").html(msg.sl);
					 $("#tz").html(msg.tz);
					 $("#bzcs").html(msg.bzys);
					 $("#lc").html(msg.lc);
				 }
				 });
		}
		function showAllgsd(){
			showgsdtj('gsdgz');
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
			var xmnf=$("#xmnf").combobox('getValues').join(",");
			if(xmnf=='')
				xmnf=new Date().getFullYear();
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var jsdj=$("#jsdj").combotree('getText');
			var gldj=$("#gldj").combobox('getValues').join(",");
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/qqgl/selectGsdwnjh.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-190,
			    width:$(window).width()-20,
			    queryParams: {
			    	xzqh:xzqhstr,
			    	gydw:gydwstr,
					xmnf:xmnf,
					tsdq:tsdq,
					jsdj:jsdj,
					gldj:gldj,
					'lxsh.lsjl':$("#lsjl").combobox('getValue'),
					'lxsh.xmmc':$("#xmmc").val(),
					'lxsh.ghlxbh':$("#lxbm").val(),
					'lxsh.xmlx1':xmlx,
					'lxsh.lxmc':$("#lxmc").val()
				},
			    columns:[[
			        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
			        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
		 	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="sjxiangxi('+index+')">详细</a>    ';
			        }},
			        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
						formatter: function(value,row,index){
							if(value=="是"){
								return '<a href="javascript:Lsjl('+"'"+row.id+"'"+')" style="color:#3399CC;">是</a>';
							}else{
								return value;
							}
						}
					},
			        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
			        	if(row.sl>0)
			        	return '<font color="red">'+row.xmmc+'</font>';
			        	else return  row.xmmc;
			        }},
			        {field : 'xmnf',title : '项目年份',width : 80,align : 'center'},
				    {field : 'gydw',title : '管养单位',width : 120,align : 'center'},
				    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
				    {field : 'ghlxbh',title : '路线编码',width : 80,align : 'center'},
				    {field : 'lxmc',title : '路线名称',width : 100,align : 'center'},
				    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
				    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
				    {field:'qdmc',title:'起点名称',width:100,align:'center'},
				    {field:'zdmc',title:'止点名称',width:100,align:'center'},
				    {field : 'zjhlc',title : '里程',width : 100,align : 'center'},
				    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
				    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
				    {field : 'tz',title : '投资',width : 100,align : 'center'},
				    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
				    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
				    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
			    ]],
				view: detailview,
				detailFormatter:function(index,row){  
						return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
			    },
			    onExpandRow: function(index,row){
			    	parentindex=index;
			    	if(row.sl!=0){
			    		$('#table_lx'+row.id).datagrid({
				    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
				    		 queryParams: {
				    			 'lxsh.xmbm':row.id,
				    			 'lxsh.sffirst':'1'
				    			},
			    			columns:[[
					           {field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
					        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsjlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
					           }},
			    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
			    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
			    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
			    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
			    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
			    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
			    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
			    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
			    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
			    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
			    			    {field:'jhlc',title:'里程',width:60,align:'center'}
			    			]]
				    	});
			    	}
			    	
			    }   
			}); 
		}
		
		
		
		
		
		
		
		
		
		function delsjgz(){
			var rows=$('#datagrid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要删除项目！");
				return;
			}
			var id=rows[0].id;
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].id ;
			}
			var data="lxsh.xmbm="+id;
			if(confirm('您确定删除该项目？')){
					$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/delwnjhSjgz.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
							 if(msg){
								 alert('删除成功！');
								 $("#datagrid").datagrid('reload');
							 }else{
								 alert('删除失败！');
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
		<div id="p_top">五年项目库>&nbsp;<span id='bstext'></span>>&nbsp;公路建设项目>&nbsp;国省道改造</div>
	</div>
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-top: 10px;height: 100px;">
        			<fieldset id="searchField" style="width:99.3%; text-align: left; vertical-align: middle;height: 100px; padding-bottom:10px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
        						<td>管养单位：</td>
        						<td colspan="3" ><select id="gydw" style="width:230px;"></select></td>
        						<td>行政区划：</td>
        						<td colspan="3" ><select id="xzqh" style="width:230px;"></select></td>
        						<td>项目名称：</td>
        						<td><input id='xmmc' type="text" /></td>
        					</tr>
        					<tr height="32">
        						<td>项目年份：</td>
        						<td><select id="xmnf" style="width:65px;">
								</select></td>       					
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:80px;" >
								</select></td>
								<td>技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:65px;" ></select></td>
								<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:80px;" ></select></td>
        						<td>是否有历史记录：</td>
        						<td><select id="lsjl" style="width:127px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
        					</tr>
        					<tr height="32">
        						<td>路线编码：</td>
        						<td><input id='lxbm' type="text" /></td>
        						<td>路线名称：</td>
        						<td><input id='lxmc' type="text" /></td>
        						<td>项目类型：</td>
        						<td><select name="xmlx" id="xmlx" style="width:100px;" ></select></td>
                              <td colspan="10">
        						<img onclick="showAllgsd()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
				                <img  name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif"  onclick="dcwnjhExcel('gsdgz');" style="border-width:0px;cursor: hand;vertical-align:middle;" />
				              </td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目数量【<span id="xmsl" style="color: red;">0</span>】个,投资额累计【<span id="tz" style="color: red;">0</span>】万元,补助测算累计【<span id="bzcs" style="color: red;">0</span>】万元,里程累计【<span id="lc" style="color: red;">0</span>】公里</div>
            	</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="datagrid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
