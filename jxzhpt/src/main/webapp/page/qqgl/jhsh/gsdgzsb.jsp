<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程路面改建路面升级项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<script type="text/javascript">
		$(function(){
			loadGhlx('ghlxbm');
			loadylx('lxbm');
			loadDist1("xzqh",$.cookie("dist"));
			tsdqdx("tsdq");
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('jsjsdj','技术等级');
			loadGldj('gldj');
			//xmnf("xmnf");
			urlxmnf("xmnf",getUrlParame('id'));
			gsdxmlx('xmlx');
			YMLib.Var.jdbs=2;
			queryLmsj();
			loadFileUpload();
		});
		function queryLmsj(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			grid.id="grid";
			grid.url="../../../qqgl/queryGsdgz.do";
			var params;
			if($.cookie('unit2').length==7)
			params={'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.xmmc':$('#xmmc').val(),
					'jhsh.xmnf':xmnf,'jhsh.jsjsdj':$('#jsjsdj').combobox("getValues").join(","),'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.tsdq':tsdq,
					'jhsh.ghlxbh':$('#lxbm').combotree('getText'),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.ghxlxbm':$('#ghlxbm').combotree('getText'),'jhsh.ghxlxmc':$('#ghlxmc').val(),
					'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.zydpx':$('#zydpx').combobox('getValue'),
					'jhsh.sbzt':$('#sbzt').combobox("getValue"),'jhsh.xmklx':$('#xmklx').combobox('getValue')
					};
			else
				params={'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.xmmc':$('#xmmc').val(),
					'jhsh.xmnf':xmnf,'jhsh.jsjsdj':$('#jsjsdj').combobox("getValues").join(","),'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.tsdq':tsdq,
					'jhsh.ghlxbh':$('#lxbm').combotree('getText'),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.ghxlxbm':$('#ghlxbm').combotree('getText'),'jhsh.ghxlxmc':$('#ghlxmc').val(),
					'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.zydpx':$('#zydpx').combobox('getValue'),
					'jhsh.sbzt':$('#sbzt').combobox("getValue"),'jhsh.xmklx':$('#xmklx').combobox('getValue')
					};
			grid.queryParams=params;
 			loadLj(params);
			grid.height=$(window).height()-220;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'ck',checkbox:true},
				{field:'cz',title:'操作',width:130,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						if(row.xmbm.substr(10,1)=='1')
							result+='&nbsp;<a href="javascript:openWindow1('+"'lmsjxx'"+','+"'国省道改造'"+','+
									"'/jxzhpt/page/qqgl/jhsh/lmsj_xx.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">详细</a>'
									//+'&nbsp;<a href="javascript:qxxm('+row.xmbm+')" style="color:#3399CC;">取消</a>'
									;
							if(row.xmbm.substr(10,1)=='2')
								result+='&nbsp;<a href="javascript:openWindow1('+"'lmsjxx'"+','+"'国省道改造'"+','+
									"'/jxzhpt/page/qqgl/jhsh/lmgz_xx.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">详细</a>'
									//+'&nbsp;<a href="javascript:qxxm('+row.xmbm+')" style="color:#3399CC;">取消</a>'
									;
							if(row.xmbm.substr(10,1)=='3')
								result+='&nbsp;<a href="javascript:openWindow1('+"'lmsjxx'"+','+"'国省道改造'"+','+
									"'/jxzhpt/page/qqgl/jhsh/xjgc_xx.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">详细</a>'
									//+'&nbsp;<a href="javascript:qxxm('+row.xmbm+')" style="color:#3399CC;">取消</a>'
									;
								if($.cookie('unit2').length!=7){
									if(row.xdzt=='1')
										result+='&nbsp;编辑';
									else
										result+='&nbsp;<a href="javascript:openWindow1('+"'jhxd'"+','+"'编辑'"+','+
										"'/jxzhpt/page/qqgl/jhsh/jhxd3.jsp'"+",900,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">编辑</a>';
									
								}else{
									result+='&nbsp;<a href="javascript:openWindow1('+"'jhxd'"+','+"'编辑'"+','+
									"'/jxzhpt/page/qqgl/jhsh/jhxd3.jsp'"+",900,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">编辑</a>';
								
								}	
										
							
							return result;
					}
				},
				{field:'sbzt',title:'上报状态',width:60,align:'center',
					formatter: function(value,row,index){
						var result="";
						xmlx=1;
						if(row.sbzt=='0')
						result='<a href="javascript:plansb('+index+')" style="color:#3399CC;">未上报</a>';
						else
							result='已上报';
						return result;
					}
				},
				/* {field:'bj',title:'编辑',width:60,align:'center',
					formatter: function(value,row,index){
						xmlx=1;
						var result='<a href="javascript:openWindow('+"'jhxd'"+','+"'编辑'"+','+
							"'/jxzhpt/page/qqgl/jhsh/jhxd3.jsp'"+',900,400)" style="color:#3399CC;">编辑</a>';
						return result;
					}
				}, */
				{field:'shzt',title:'审核状态',width:60,align:'center',
					formatter: function(value,row,index){
						var result="";
						xmlx=1;
						if(row.xdzt=='0')
							result='未审核';
						if(row.xdzt=='1')
							result='已审核';	
// 						var result='<a href="javascript:openWindow('+"'jhxd'"+','+"'计划审核'"+','+
// 							"'/jxzhpt/page/qqgl/jhsh/jhxd3.jsp'"+',900,400)" style="color:#3399CC;">计划审核</a>';
						return result;
					}
				},
				{field:'lsjl',title:'历史记录',width:60,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				/* 
				{field:'xdzt',title:'资金追加',width:60,align:'center',
					formatter: function(value,row,index){
						var result="";
						result='<a href="javascript:openZjzj('+"'"+index+"',"+"'"+row.xmbm.substr(10,1)+"'"+')" style="color:#3399CC;">资金追加</a>';
						return result;
					}
				}, */
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'xzqh',title:'行政区划',width:60,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center',
					formatter: function(value,row,index){
						if(Number(row.xmsl)>1){
		        			return '<label style="color:red;">'+value+'</label>';
		        		}else{
		        			return value;
		        		}
					}
				},
				{field:'zydpx',title:'重要度排序',width:100,align:'center'},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'zlc',title:'里程',width:100,align:'center'},
				{field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
				{field:'xjsdj',title:'技术等级',width:100,align:'center'},
				{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
				{field:'qdzh1',title:'原起点桩号',width:100,align:'center'},
				{field:'zdzh1',title:'原止点桩号',width:100,align:'center'},
				/* {field:'xdwh',title:'下达文号',width:100,align:'center'},
				{field:'xdsj',title:'下达时间',width:100,align:'center'}, */
				{field:'pfztz',title:'批复总投资',width:100,align:'center'},
				{field:'bbzzj',title:'部补助投资',width:100,align:'center'},
				{field:'sbzzj',title:'省补助资金',width:100,align:'center'},
				//{field:'gq',title:'工期（月）',width:100,align:'center'},
// 				{field:'tz',title:'总投资',width:100,align:'center'},
				{field:'tsdq',title:'特殊地区',width:100,align:'center'},
				{field:'sjpfwh',title:'设计批复文号',width:100,align:'center'},
				{field:'gkpfwh',title:'工可批复文号',width:100,align:'center'},
				{field:'kgsj',title:'开工时间',width:100,align:'center'},
				{field:'wgsj',title:'完工时间',width:100,align:'center'}]];
			bindLxGrid();
			gridBind(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLjgsdgz.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$("#xmsl").html(msg.SL);
						 $("#tz").html(msg.TZ);
						 $("#cgs").html(msg.CGS);
						 $("#sbz").html(msg.SBZ);
						 $("#sjl").html(msg.SJL);
						 $("#lc").html(msg.LC);
						 $("#dftz").html(msg.DFTZ);
					}else{
						$('#spanbbz').html("0");
						$('#spansbz').html("0");
						$('#spanlc').html("0");
					}
				}
			});
		}
		function exportJhshxx(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			  var param='jhsh.xmbm='+xmnf+'&jhsh.xmlx1='+xmlx
				+'&jhsh.xzqhdm='+getxzqhdm('xzqh')+'&jhsh.ghlxbh='+$('#lxbm').combotree('getText')
				+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+$('#tsdq').combobox("getValues").join(",")
				+'&jhsh.jsdj='+$('#jsdj').combobox("getValues").join(",")+'&lsjl='+$('#lsjl').combobox("getValue")
				+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.ghxlxbm='+$("#ghlxbm").combotree('getText')+'&jhsh.ghxlxmc='+$("#ghlxmc").val()+'&jhsh.jsjsdj='+$("#jsjsdj").combobox("getValues").join(",")
				+'&jhsh.xmnf='+xmnf; 
			
			window.location.href="/jxzhpt/qqgl/exportJhshxxgsd.do?"+param;
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		
		function loadFileUpload(){
			$("#uploadJhxd").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/batchUploadJhsh.do',
				'cancelImg' : '../../../js/uploader/cancel.png',
				'queueID' : 'fileQueue',
				'fileDataName' : 'uploadJhxd',
				'auto' : false,
				'multi' : false,
				'buttonImg': '../../../js/uploader/bdll.png',
				'simUploadLimit' : 3,
				'sizeLimit' : 100000000,
				'queueSizeLimit' : 5,
				'fileDesc' : '支持格式:xls',
				'fileExt' : '',
				'height' : 30,
				'width' : 92,
				'scriptData' : {
					'jhsh.xdwh':$('#plgkpfwh').val()
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					fileShow(parent.YMLib.Var.xmbm,"计划下达文件");
				},
				onError : function(event, queueID, fileObj) {
					alert("文件:" + fileObj.name + "上传失败");
				},
				onCancel : function(event, queueID, fileObj) {
				},
				onQueueFull : function(event, queueSizeLimit) {
					alert("最多支持上传文件数为：" + queueSizeLimit);
				}
			});
		}
		function plscbtn(){
			$('#plsc').dialog("open");
		}
		function upload(){
			if($('#plgkpfwh').val()!=""){
				$("#uploadJhxd").uploadifySettings('scriptData',{'jhsh.xdwh':$('#plgkpfwh').val()});
				$('#uploadJhxd').uploadifyUpload();
			}else{
				alert("必须填写计划下达文号！");
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
		<div id="p_top">计划管理>&nbsp;<span id="astext">计划申报</span>>&nbsp;<span id="bstext"></span>>&nbsp;国省道改造</div>
	</div>
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 5px;">
        			<fieldset id="searchField" style="width:99.8%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:5px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="28">
								<!-- <td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
								<td>项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:100px;" /></td>
								<td>项目年份：</td>
        						<td><select id="xmnf" style="width: 104px;"></select></td>
        						<td>建设技术等级：</td>
								<td><select name="jsjsdj" class="easyui-combobox" id="jsjsdj" style="width:104px;"></select></td> -->
								<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:140px;"></select></td>
								<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:80px;" /></td>
        						<td align="right">建设性质：</td>
								<td><select name="xmlx" id="xmlx" style="width:80px;" ></select></td>
								<td align="right">建设技术等级：</td>
								<td><select name="jsjsdj" class="easyui-combobox" id="jsjsdj" style="width:118px;"></select></td>
								<td align="right">现技术等级：</td>
								<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:75px;"></select></td>
								
        					</tr>
        					<tr height="28">
        					<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 140px;"></select></td>
        						<!-- <td align="right">原行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:150px;" class="easyui-combobox"></select></td>
        						<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:104px;"></select></td>
								<td>原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:100px;" /></td>
        						<td>原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:100px;" /></td> -->
        						<td align="right">重要度排序：</td>
        						<td><select name="zydpx" id="zydpx" class="easyui-combobox" style="width:80px;">
		                              	<option value="" selected>请选择</option>
										<option value="升序">升序</option>
										<option value="降序">降序</option>
									</select>
        						</td>
        						<td align="right">原行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:80px;" class="easyui-combobox"></select></td>
								<td align="right">原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:118px;" /></td>
        						<td align="right">原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:75px;" /></td>
								
                            </tr>
                            <tr height="28">
                            <td align="right">规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:140px;" /></td>
								<td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:80px;" /></td>
        						<!-- <td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:100px;" /></td>
        						<td>上报状态：</td>
								<td><select name="sbzt" id="sbzt" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="1">已上报</option>
									<option value="0">未上报</option>
								</select></td>
        						<td>历史记录：</td>
								<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
								<td>重要度排序：</td>
        						<td><input name="zydpx" type="text" class="easyui-numberbox" id="zydpx" style="width:100px;" /></td> -->
								<td align="right">补助历史：</td>
								<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:80px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
								<td align="right">特殊地区：</td>
								<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:118px;"></select></td>
								<td align="right">上报状态：</td>
								<td><select name="sbzt" id="sbzt" class="easyui-combobox" style="width:75px;">
									<option value="" selected="selected">全部</option>
									<option value="1">已上报</option>
									<option value="0">未上报</option>
								</select></td>
                            </tr>
                            <tr height="28">
                            <td align="right">项目库类型：</td>
								<td>
									<select id='xmklx' class="easyui-combobox" style="width: 140px;">
										<option value="">请选择</option>
										<option value="部库">部库</option>
										<option value="省库">省库</option>
									</select>
								</td>
                            	<!-- <td align="right">技术等级：</td>
								<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:104px;"></select></td>
                            	<td>建设性质：</td>
								<td><select name="xmlx" id="xmlx" style="width:104px;" ></select></td>
                            	<td>规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:100px;" /></td> -->
        						</tr>
        						<tr height="28">
                            	<td colspan="8">
                            		<img onclick="queryLmsj()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/>
									<img id="sb" name="dishi" alt="上报" onclick="plansb()" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='../../../images/Button/shangbao_1.png'" src="../../../images/Button/shangbao_1.png"/>
<!-- 									<img onclick="plscbtn()" alt="批量上传计划下达文件" src="../../../images/plsc.png" style="vertical-align:middle;width: 90px;height: 23px;"> -->
									<img onclick="exportJhshxx()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
<!-- 									<img onclick="importJhsh()" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
                            	</td>
                            </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<!-- <tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【 <span id="lblCount" style="font-weight: bold; color: #FF0000">0</span> 】个路面升级项目，总里程共
        			【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，项目里程共【&nbsp;<span id="lblXMLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，其中中央车购税【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，省投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr> -->
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方自筹【<span id="dftz" style="color: red;">0</span>】万元,
            		银行贷款【<span id="yhdk" style="color: red;">0</span>】万元。
            		</div>
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		<div id="plsc" class="easyui-dialog" title="批量上传计划下达文件" style="width:500px;height:150px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
			<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						批复文号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="plgkpfwh" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						批复文件</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td colspan="2">待上传：<div id="fileQueue" ></div></td>
							</tr>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadJhxd" id="uploadJhxd" /></td>
								<td>
									<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>
