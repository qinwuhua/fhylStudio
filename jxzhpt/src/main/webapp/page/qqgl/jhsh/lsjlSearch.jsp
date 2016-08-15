<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>补助历史数据</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			bbxmlx1('xmlx');
			loadDist1("xzqh",$.cookie("dist"));
		});
		function search(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			if(xmlx==''){
				xmlx='改建,路面改造,新建,养护大中修,灾毁重建,路网结构工程';
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
			var lxbm=$('#lxbm').val();
			var ghlxbm=$('#ghlxbm').val();
			if(lxbm=='') lxbm='%';
			if(lxbm=='%'&&ghlxbm=='') ghlxbm='%';
			
			$('#grid').datagrid({
				url:'../../../qqgl/queryLsxx2new.do',
				queryParams: {'lx.lxbm': lxbm,'lx.qdzh':$('#qdzh').val(),'lx.zdzh':$('#zdzh').val(),
					'lx.ghlxbm': ghlxbm,'lx.ghqdzh':$('#ghqdzh').val(),'lx.ghzdzh':$('#ghzdzh').val(),'lx.xmlx':xmlx,'lx.xzqh':xzqhstr},
				fitColumns:true,
				height:$(window).height()-120,
			    width:$(window).width()-20,
				columns:[[
					{field:'xjsdj',title:'项目类型',width:100,align:'center'},
					{field:'xmmc',title:'项目名称',width:200,fixed:true,align:'center',
						formatter:function(value,row,index){
							var a='<a href="javascript:msgxx('+"'"+row.xmid+"','"+row.xjsdj+"'"+')" style="color:#0066CB;font-size:12px;">';
							a+=value+'</a>';
							return a;
						}
					},
					{field:'xmid',title:'计划年份',width:100,align:'center',
						formatter:function(value,row,index){
							return value.substring(0,4);
						}
					},
					{field:'lxbm',title:'规划路线编码',width:110,align:'center'},
					{field:'jsjsdj',title:'规划技术等级',width:110,align:'center'},
					{field:'qdzh',title:'规划起点桩号',width:110,align:'center'},
					{field:'zdzh',title:'规划止点桩号',width:110,fixed:true,align:'center'},
					{field:'ylxbm',title:'原路线编码',width:100,align:'center'},
					{field:'xx',title:'原技术等级',width:100,align:'center',formatter:function(value,row,index){
						return row .yjsdj;
					}},
					{field:'yqdzh',title:'原起点桩号',width:100,align:'center'},
					{field:'yzdzh',title:'原止点桩号',width:100,align:'center'}
					]]
			});
		}
		var obj;
		function msgxx(xmid,jsdj){
		
			YMLib.Var.xmbm=xmid;
			if(jsdj=='安防工程'||jsdj=='危桥改造'||jsdj=='灾害防治'){
				obj=xmid.substr(4,xmid.length);
				if(jsdj=='危桥改造'){
					YMLib.UI.createWindow('lmsjxx','危桥改造项目','/jxzhpt/page/jhgl/jhkxx/wqgz.jsp','lmsjxx',980,400);
				}
				if(jsdj=='安防工程'){
					YMLib.Var.jhbm=xmid.substr(4,xmid.length);
					YMLib.UI.createWindow('abgc_xx','安防工程',"/jxzhpt/page/jhgl/jhkxx/abgc.jsp",'abgc_xx',1000,500);
				}
				if(jsdj=='灾害防治'){
					YMLib.Var.jhbm=xmid.substr(4,xmid.length);
					YMLib.UI.createWindow('zhfz_xx','灾害防治',"/jxzhpt/page/jhgl/jhkxx/zhfz.jsp",'zhfz_xx',1000,500);
				}
				
			}else{
				if(xmid.substring(10,11)=="1"){
					YMLib.UI.createWindow('lmsjxx','升级改造工程项目','/jxzhpt/page/qqgl/zjxd/lmsj_xx.jsp','lmsjxx',980,400);
				}else if(xmid.substring(10,11)=="2"){
					YMLib.UI.createWindow('lmgzxx','路面改造工程项目','/jxzhpt/page/qqgl/zjxd/lmgz_xx.jsp','lmgzxx',980,400);
				}else if(xmid.substring(10,11)=="3"){
					YMLib.UI.createWindow('xjgcxx','新建工程项目','/jxzhpt/page/qqgl/zjxd/xjgc_xx.jsp','xjgcxx',980,400);
				}else if(xmid.substring(10,11)=="4"){
					YMLib.UI.createWindow('yhdzxxx','养护大中修项目','/jxzhpt/page/qqgl/zjxd/yhdzx_xx.jsp','yhdzxxx',980,400);
				}else if(xmid.substring(10,11)=="5"){
					YMLib.UI.createWindow('shxmxx','水毁项目','/jxzhpt/page/qqgl/zjxd/shxm_xx.jsp','shxmxx',980,400);
				}
			}
			
			
		}
		
		function reset(){
			$("#lxbm").val("");
			$("#qdzh").val("");
			$("#zdzh").val("");
			$("#ghlxbm").val("");
			$("#ghqdzh").val("");
			$("#ghzdzh").val("");
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;补助历史查询</div>
	</div>
	<form action="">
	<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:99.7%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="32">
								<td style="text-align: right;">原路线编码：</td>
        						<td style="text-align: left;"><input id="lxbm" type="text" style="width: 100px;margin-right: 10px;"/></td>
								<td style="text-align: right;">原起点桩号：</td>
        						<td style="text-align: left;"><input id="qdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
								<td style="text-align: right;">原止点桩号：</td>
        						<td style="text-align: left;"><input id="zdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
        						<td style="text-align: right;">项目类型：</td>
        						<td style="text-align: left;"><input id="xmlx" type="text" style="width: 180px;margin-right: 10px;"/></td>
        					</tr>
        					<tr height="32">
								<td style="text-align: right;">规划路线编码：</td>
        						<td style="text-align: left;"><input id="ghlxbm" type="text" style="width: 100px;margin-right: 10px;"/></td>
								<td style="text-align: right;">规划起点桩号：</td>
        						<td style="text-align: left;"><input id="ghqdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
								<td style="text-align: right;">规划止点桩号：</td>
        						<td style="text-align: left;"><input id="ghzdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
        						<td style="text-align: right;">行政区划：</td>
        						<td style="text-align: left;"><input id="xzqh" type="text" style="width: 180px;margin-right: 10px;"/></td>
        					
        					</tr>
                            <tr height="32">
                            	<td colspan="6">
								<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:search()" class="button button-tiny button-raised button-primary">查询</a>
                            	<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:reset()" class="button button-tiny button-raised button-primary">重置</a>
                            	
                            	
<!--                             		<img onclick="search()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/> -->
									
								</td>
                            </tr>
        					</table>
        					
        				</div>
        			</fieldset>
        		</td>
        	</tr>
       
        	
		</table>
	</form>
	
	
	
	<%-- <div id="searchDiv" style="margin-left: 20px;margin-top: 5px;margin-bottom: 5px;">
		<table>
			<tr>
				<td >原路线编码：<input id="lxbm" type="text" style="width: 100px;margin-right: 10px;"/></td>
				<td >原起点桩号：<input id="qdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td >原止点桩号：<input id="zdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td>
				<img onclick="search()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
				</td>
			</tr>
			<tr>
				<td >规划路线编码：<input id="ghlxbm" type="text" style="width: 100px;margin-right: 10px;"/></td>
				<td >规划起点桩号：<input id="ghqdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td >规划止点桩号：<input id="ghzdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td><img onclick="search()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/></td>
			</tr>
		</table>
	</div> --%>
	<table id="grid" width="98%" border="0" class="easyui-datagrid" data-options="fitColumns:true" style="margin-top:1px;margin-left:1px;" cellspacing="0" cellpadding="0">
		 <thead>
        	<tr>
        		<th data-options="field:'xmlx',width:150,fixed:true,align:'center'">项目类型</th>
        		<th data-options="field:'scbz',width:150,fixed:true,align:'center'">项目名称</th>
        		<th data-options="field:'jhnf',width:150,fixed:true,align:'center'">计划年份</th>
				<th data-options="field:'lxbm',width:100,align:'center'">规划路线编码</th>
				<th data-options="field:'gjjsdj',width:100,align:'center'">规划技术等级</th>
				<th data-options="field:'xqdzh',width:100,align:'center'">规划起点桩号</th>
				<th data-options="field:'xzdzh',width:100,align:'center'">规划止点桩号</th>
				<th data-options="field:'ylxbm',width:100,align:'center'">原路线编码</th>
				<th data-options="field:'yjsjd',width:100,align:'center'">原技术等级</th>
				<th data-options="field:'yqdzh',width:100,align:'center'">原起点桩号</th>
				<th data-options="field:'yzdzh',width:100,align:'center'">原止点桩号</th>
        	</tr>
    	</thead> 
	</table>
</body>
</html>
