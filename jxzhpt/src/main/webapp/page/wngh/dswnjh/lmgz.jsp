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
			gsdxmlx('xmlx');
			tsdqdx("tsdq");
			loadGhlx('ghxlxbm');
			loadylx('lxbm');
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('jsjsdj','技术等级');
			loadGldj('gldj');
			//var urlid=request('id');
			var urlid=getUrlParame('id');
			setxmnf("xmnf",urlid);
			setTimeout("showAlllmDs()",'1700');
			//showAlllm();
		});
		function showAlllmDs(){
			showgjtj('lmgz');
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
//			if(xmnf=='')
//				xmnf=new Date().getFullYear();
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var jsdj=$("#jsdj").combotree('getText');
			var gldj=$("#gldj").combobox('getValues').join(",");
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var lxbm=$("#lxbm").combotree('getText');
			var ghxlxbm=$("#ghxlxbm").combotree('getText');
			
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/qqgl/selectLmwnjh.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-200,
			    width:$(window).width()-20,
			    queryParams: {
			    	xzqh:xzqhstr,
					tsdq:tsdq,
					xmnf:xmnf,
					jsdj:jsdj,
					gldj:gldj,
					'lxsh.lsjl':$("#lsjl").combobox('getValue'),
					'lxsh.xmmc':$("#xmmc").val(),
					'lxsh.ghlxbh':lxbm,
					'lxsh.lxmc':$("#lxmc").val(),
					'lxsh.jsjsdj':$("#jsjsdj").combotree('getText'),
					'lxsh.ghxlxbm':ghxlxbm,
					'lxsh.ghxlxmc':$("#ghxlxmc").val(),
					'lxsh.xmlx1':xmlx,
					'lxsh.qqkzzt':$("#qqkzzt").combobox('getValue'),
					'lxsh.xmklx':$("#xmklx").combotree('getValue'),
					'lxsh.gydw':$.cookie("dist2"),
					'lxsh.xmjd':$("#xmjd").combobox('getValue')
				},
			    columns:[[
			        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
			        {field:'c',title:'操作',width:180,align:'center',formatter:function(value,row,index){
			        	if("库外" != row.xmklx){
			        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '
				        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dslmxiangxi('+index+')">详细</a>    '
			        		+'编辑  '+'删除  '+'添加路线 ';
			        	}else{
			        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '
				        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dslmxiangxi('+index+')">详细</a>    '
				        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editlm('+index+')">编辑</a>  '
				        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellm('+index+')">删除</a>  '
				        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">     添加路线</a>  ';
			        	}
			        }},
			        {field:'lsjl',title:'历史记录',width:60,align:'center',
						formatter: function(value,row,index){
							if(value=="是"){
								return '<a href="javascript:Lsjl('+"'"+row.id+"'"+')" style="color:#3399CC;">是</a>';
							}else{
								return value;
							}
						}
					},
					{field : 'qqkzzt',title : '前期开展',width : 60,align : 'center'},
					{field : 'xmjd',title : '项目进度',width : 130,align : 'center'},
					{field : 'xmklx',title : '项目库类型',width : 80,align : 'center'},
					{field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
					{field : 'xmnf',title : '项目年份',width : 60,align : 'center'},
			        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
			        	if(row.sl>0)
			        	return '<font color="red">'+row.xmmc+'</font>';
			        	else return  row.xmmc;
			        }},
			        {field : 'jhlc',title : '里程',width : 60,align : 'center'},
			        {field:'xjsdj',title:'现技术等级',width:70,align:'center'},
				    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
				    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
				    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
				    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
				    {field : 'ghlxbh',title : '原路线编码',width : 60,align : 'center'},
				    {field : 'minqdzh',title : '原起点桩号',width : 60,align : 'center'},
				    {field : 'maxzdzh',title : '原止点桩号',width : 60,align : 'center'},
				    {field:'qdmc',title:'起点名称',width:80,align:'center'},
				    {field:'zdmc',title:'止点名称',width:80,align:'center'},
				    {field : 'tz',title : '投资',width : 80,align : 'center'},
				    {field : 'bzys',title : '补助测算',width : 80,align : 'center'},
				    {field : 'tsdq',title : '特殊地区',width : 150,align : 'center'}
			    ]],
				view: detailview,
				detailFormatter:function(index,row){   
			        return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
			    },
			    onExpandRow: function(index,row){
			    	if(row.sl!=0){
			    		var parentindex=index;
			    		var parentrow=row;
				    	$('#table_lx'+row.id).datagrid({
				    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
				    		 queryParams: {
				    			 'lxsh.xmbm':row.xmbm,
				    			 'lxsh.sffirst':'1'
				    			},
			    			columns:[[
								{field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
						        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editlmlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
								},hidden:parentrow.xmklx!="库外"?true:false},
			    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
			    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
			    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
			    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
							    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
							    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
			    			    {field:'ghlxbh',title:'原路线编码',width:100,align:'center'},
			    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
			    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
			    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
			    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
			    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
			    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
			    			    {field:'zjhlc',title:'里程',width:60,align:'center'}
			    			]]
				    	});
			    	}
			    	
			    },
			    onLoadSuccess: function(){
		            var dg = $(this);
		            var rows=dg.datagrid("getRows");
			    	for (var i=0;i<rows.length;i++){
			    		if(rows[i].sl<=0){
			    			dg.datagrid('getExpander', i).hide();
			    		}
			    	}
			    	
				}   
			}); 
		}
		function dslmxiangxi(index){
			var data=$("#datagrid").datagrid('getRows')[index];
			obj=data;
			YMLib.UI.createWindow('lxxx','五年规划详细信息','/jxzhpt/page/wngh/wnjh/lmgz_xx.jsp','lxxx',900,360);
		}
		function Lsjl(xmbm){
			YMLib.Var.xmbm=xmbm;
			YMLib.UI.createWindow('lsjlwindow','历史记录','/jxzhpt/page/wngh/wnjh/lsjl.jsp','lsjlwindow',980,300);
		}
		function tjlmlx(index){
			var data=$("#datagrid").datagrid('getRows')[index];
			obj=data;
			YMLib.UI.createWindow('lxxx','添加路线','lmgzlx_add.jsp','lxxx',900,380);
		}
		function editlmlx(index1,index){
			var xmbm=$("#datagrid").datagrid('getRows')[index1].id;
			var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
			obj=data;
			YMLib.UI.createWindow('lxxx','编辑路线','/jxzhpt/page/wngh/wnjh/lmgzlx_xg.jsp','lxxx',900,380);
		}
		function editlm(index){
			var data=$("#datagrid").datagrid('getRows')[index];
			obj=data;
			YMLib.UI.createWindow('lxxx','编辑五年规划信息','lmgz_edit.jsp','lxxx',900,380);
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
						 url : "/jxzhpt/qqgl/delwnjhLmgz.do",
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
		function import_lmgz(flag){
			var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '五年规划信息导入',
				page : 'upload.jsp?url='+"/jxzhpt/qqgl/importlmgzwnjh.do"+'&flag='+flag,
				width : 570,
				height : 440,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
			weatherDlg.ShowDialog();
			return false;
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
		<div id="p_top">五年项目库>&nbsp;<span id='bstext'></span>>&nbsp;公路建设项目>&nbsp;国省道改造>&nbsp;路面改造工程项目</div>
	</div>
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-top: 5px;">
        			<fieldset id="searchField" style="width:99.3%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:5px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="28">
        						<td align="right">行政区划：</td>
        						<td ><select id="xzqh"style="width:119px;""></select></td>
        						<td align="right" >项目名称：</td>
        						<td><input id='xmmc' type="text" style="width:103px;" /></td>
        						<td align="right">建设性质：</td>
        						<td><select name="xmlx" id="xmlx" style="width:85px"  ></select></td>
        						<td align="right">建设技术等级：</td>
								<td><select name="jsjsdj" id="jsjsdj" style="width:105px"></select></td>
								<td align="right">现技术等级：</td>
								<td ><select name="jsdj" id="jsdj" style="width:78px" ></select></td>
								<td align="right">项目进度：</td>
								<td ><select name="xmjd" id="xmjd" style="width:100px" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'" >
									<option selected="selected" value="">全部</option>
									<option value="五年项目库">五年项目库</option>
									<option value="立项已上报">立项已上报</option>
									<option value="立项已审核">立项已审核</option>
									<option value="工可已上报">工可已上报</option>
									<option value="工可已审核">工可已审核</option>
									<option value="初设已上报">初设已上报</option>
									<option value="初设已审核">初设已审核</option>
									<option value="计划已上报">计划已上报</option>
									<option value="计划已下达">计划已下达</option>
								</select></td>
        					</tr>
        					<tr height="28">
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width:119px"></select></td>
								<td align="right">原行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:104px" ></select></td>       					
								<td align="right">原路线编码：</td>
        						<td><input id='lxbm' type="text" style="width:85px"/></td>
        						<td align="right">原路线名称：</td>
        						<td><input id='lxmc' type="text" style="width:104px"/></td>
        						<td align="right">规划路线编码：</td>
        						<td><input id='ghxlxbm' type="text" style="width:78px"/></td>
        					</tr>
        					<tr height="28">
        						
        						<td align="right">规划路线名称：</td>
        						<td><input id='ghxlxmc' type="text" style="width:118px" /></td>
        						<td align="right">历史记录：</td>
								<td  width="65px;"><select id="lsjl" style="width:104px"   class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select>
								</td>
        						<td align="right">特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:85px" >
								</select></td>
								<td align="right">前期开展状态：</td>
        						<td><select id="qqkzzt" style="width:105px" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="已开展">已开展</option>
									<option value="部分开展">部分开展</option>
									<option value="未开展">未开展</option>
								</select>
								</td>
        							<td align="right">项目库类型：</td>
								<td>
									<select id='xmklx' class="easyui-combobox"  style="width: 78px;">
										<option value="">请选择</option>
										<option value="部库">部库</option>
										<option value="省库">省库</option>
										<option value="库外">库外</option>
									</select>
								</td>
        					</tr>
        					<tr height="28">
	        				
                              <td colspan="10">
        						<img onclick="showAlllmDs()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
								<img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addWNJH('lmgz_add.jsp','900','400');" style="border-width:0px;vertical-align:middle;"/>
				                <img  name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" onclick="dcwnjhExcel('lmgz');" style="border-width:0px;cursor: hand;vertical-align:middle;" />
								<img name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="import_lmgz('lmgz')" style="border-width:0px;vertical-align:middle;" />
								<img  name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" onclick="dcMoBan('lmgz');" style="border-width:0px;cursor: hand;vertical-align:middle;" />
				                <img alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" onclick="delsjgz()" style="vertical-align:middle;">
				              </td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
			<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		补助资金【<span id="cgs" style="color: red;">0</span>】万元,
<!--             		省补资金【<span id="sbz" style="color: red;">0</span>】万元, -->
<!--             		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元, -->
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
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
	
	<!-- <div id="abgc_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
	<div id="abgc_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
