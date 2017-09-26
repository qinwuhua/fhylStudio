<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修</title>
	<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="../../../js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<script type="text/javascript">
		$(function(){
			loadGhlx('ghlxbm');
			loadylx('lxbm');
			loadDist1("xzqh",$.cookie("dist"));
			tsdqdx("tsdq");
			loadBmbm3('jsdj','技术等级');
			loadGldj('gldj');
			//xmnf("xmnf");
			if(getUrlParame('id')=='01011305010102')
			loadBmbm3('xmnf','十二五项目年份',new Date().getFullYear()>2015?2015:new Date().getFullYear());
			if(getUrlParame('id')=='01011305020102')
			loadBmbm3('xmnf','十三五项目年份',new Date().getFullYear()>2020?2020:new Date().getFullYear());
			
			YMLib.Var.jdbs=2;
			queryShxm();
			loadFileUpload();
		});
		function queryShxm(){
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			grid.id="grid";
			grid.url="../../../qqgl/queryJhsh2_qx.do";
			var params={'jhsh.xmlx':5,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.xmmc':$('#xmmc').val(),
					'jhsh.xmnf':xmnf,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),
					'jhsh.gldj':$('#gldj').combobox("getValues").join(','),'jhsh.tsdq':tsdq,
					'jhsh.ghlxbh':$('#lxbm').combotree('getText'),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.ghxlxbm':$('#ghlxbm').combotree('getText'),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.zydpx':$('#zydpx').combobox('getValue'),'jhsh.sbzt':1,
					'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.shzt':$('#shzt').combobox("getValue"),
					'jhsh.xmbm':$("#xmbm").val()
					};
			grid.queryParams=params;
			loadLj(params);
			grid.height=$(window).height()-200;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'ck',checkbox:true},
				{field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow1('+"'shxmxx'"+','+"'灾毁重建项目'"+','+
						"'/jxzhpt/page/qqgl/jhbg/shxm_xx.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">详细</a>'+'&nbsp;<a href="javascript:hfxm('+row.xmbm+')" style="color:#3399CC;">恢复</a>';
						return result;
					}
				},
				{field:'shzt',title:'审核状态',width:60,align:'center',
					formatter: function(value,row,index){
						var result="";
						xmlx=1;
						if(row.xdzt=='0')
						result='<a href="javascript:plansh('+index+')" style="color:#3399CC;">未审核</a>';
						else
							result='已审核';
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
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'zlc',title:'里程',width:60,align:'center'},
				{field:'jsdj',title:'技术等级',width:80,align:'center'},
// 				{field:'xjsdj',title:'技术等级',width:100,align:'center'},
				{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
				{field:'qdzh1',title:'原起点桩号',width:100,align:'center'},
				{field:'zdzh1',title:'原止点桩号',width:100,align:'center'},
				{field:'pfztz',title:'批复总投资',width:100,align:'center'},
				{field:'bbzzj',title:'部补助资金',width:100,align:'center'},
				{field:'sbzzj',title:'省补助资金',width:100,align:'center'},
				{field:'tsdq',title:'特殊地区',width:100,align:'center'},
				{field:'sjpfwh',title:'设计批复文号',width:100,align:'center'},
				//{field:'gkpfwh',title:'工可批复文号',width:100,align:'center'},
				{field:'jhkgsj',title:'开工时间',width:70,align:'center'},
				{field:'jhwgsj',title:'完工时间',width:70,align:'center'},
				{field:'hszj',title:'回收资金',width:70,align:'center'},
				{field:'sgtsjwh',title:'施工图文件',width:120,align:'center',
					formatter: function(value,row,index){
						return '<a href="javascript:downwj('+"'"+value+"','施工图取消文件'"+')" style="color:#3399CC;">'+value+'</a>';
					}
					
				},
				{field:'jhwj',title:'计划文件',width:120,align:'center',
					formatter: function(value,row,index){
						return '<a href="javascript:downwj('+"'"+value+"','计划取消文件'"+')" style="color:#3399CC;">'+value+'</a>';
					}
				}
				/* , */
				/* {field:'xdwh',title:'计划下达文号',width:100,align:'center'},
				{field:'xdsj',title:'计划下达时间',width:100,align:'center'} */
			]];
			bindLxGrid();
			gridBind(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLj_qx.do',
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
						 $("#hszj").html(msg.HSZJ);
					}else{
						$("#xmsl").html("0");
						 $("#tz").html("0");
						 $("#cgs").html("0");
						 $("#sbz").html("0");
						 $("#sjl").html("0");
						 $("#lc").html("0");
						 $("#dftz").html("0");
						 $("#hszj").html("0");
					}
				}
			});
		}
		function exportJhshxx(){
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var params={'jhsh.xmlx':5,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.xmmc':$('#xmmc').val(),
					'jhsh.xmnf':xmnf,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),
					'jhsh.gldj':$('#gldj').combobox("getValues").join(','),'jhsh.tsdq':tsdq,
					'jhsh.ghlxbh':$('#lxbm').combotree('getText'),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.ghxlxbm':$('#ghlxbm').combotree('getText'),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.zydpx':$('#zydpx').val(),'jhsh.sbzt':1,
					'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.shzt':$('#shzt').combobox("getValue")
					};
			var param='jhsh.xmlx='+'5'+'&jhsh.xzqhdm='+getxzqhdm('xzqh')+'&jhsh.xmmc='+$("#xmmc").val()+
					'&jhsh.xmnf='+xmnf+'&jhsh.jsdj='+$("#jsdj").combobox("getValues").join(",")+
					'&jhsh.gldj='+$("#gldj").combobox("getValues").join(",")+'&jhsh.tsdq='+tsdq+
					'&jhsh.ghlxbh='+$("#lxbm").combotree('getText')+'&jhsh.lxmc='+$("#lxmc").val()+
					'&jhsh.ghxlxbm='+$("#ghlxbm").combotree('getText')+'&jhsh.ghxlxmc='+$("#ghlxmc").val()+'&jhsh.zydpx='+$("#zydpx").val()+'&jhsh.sbzt=1'+
					'&jhsh.lsjl='+$("#lsjl").combobox("getValue")+'&jhsh.shzt='+$("#shzt").combobox("getValue");
			window.location.href="/jxzhpt/qqgl/exportJhshSh.do?"+param;
		}
		function importJhsh(){
			importExcel("/jxzhpt/qqgl/importExcelJhxdSh.do","shjhxd");
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
		function hszj(){
			YMLib.UI.createWindow('lxxx','回收资金','sh_hs.jsp','lxxx',950,450);
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
		<div id="p_top">计划管理>&nbsp;计划变更>&nbsp;<span id="bstext"></span>>&nbsp;灾毁重建项目</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
       	<tr>
       		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
       			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
       				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
       					<font style="color: #0866A0; font-weight: bold"></font>
       				</legend>
       				<div>
       				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
						<tr height="32">
								<!-- <td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
								<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:100px;" /></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 104px;"></select></td>
        						<td align="right">技术等级：</td>
								<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:104px;"></select></td>
        						<td align="right">审核状态：</td>
								<td><select name="shzt" id="shzt" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="1">已审核</option>
									<option value="0">未审核</option>
								</select></td> -->
								<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:140px;"></select></td>
								<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:106px;" /></td>
        						<td align="right">技术等级：</td>
								<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:104px;"></select></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 108px;"></select></td>
        						<td align="right">重要度排序：</td>
        						<td><select name="zydpx" id="zydpx" class="easyui-combobox" style="width:100px;">
		                              	<option value="" selected>请选择</option>
										<option value="升序">升序</option>
										<option value="降序">降序</option>
									</select>
        						</td>
        						
        					</tr>
        					<tr height="32">
        						<!-- <td align="right">特殊地区：</td>
								<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:150px;"></select></td>
								<td align="right">原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:100px;" /></td>
        						<td align="right">原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:100px;" /></td>
        						<td align="right">规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:100px;" /></td>
        						<td align="right">历史记录：</td>
								<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td> -->
								<td align="right">原行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:140px;" class="easyui-combobox"></select></td>
								<td align="right">原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:108px;" /></td>
        						<td align="right">原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:100px;" /></td>
        						<td  align="right">规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:108px;" /></td>
        						<td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:100px;" /></td>
        						
                            </tr>
                            <tr height="32">
                            <td align="right">补助历史：</td>
								<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:140px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
								<td align="right">特殊地区：</td>
								<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:108px;"></select></td> 
								
        						<!-- <td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:100px;" /></td>
								<td align="right">原行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:104px;" class="easyui-combobox"></select></td>
								<td align="right">重要度排序：</td>
        						<td><input name="zydpx" type="text" class="easyui-numberbox" id="zydpx" style="width:100px;" /></td> -->
                          <!--   </tr>
       					<tr height="32"> -->
       					<td align="right">审核状态：</td>
								<td><select name="shzt" id="shzt" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="1">已审核</option>
									<option value="0">未审核</option>
								</select></td>
								<td align="right">项目编码：</td>
        						<td><input name="xmbm" type="text" id="xmbm" style="width:108px;" /></td>
								</tr>
								<tr height="32">
       						<td colspan="8">
<!--        							<img onclick="queryShxm()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/> -->
								<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryShxm()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
								<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:hszj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">回收资金</a>
									
								<!-- <img id="shenpi" alt="审批" onclick="plansh()" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'" src="../../../images/Button/sp1.jpg"/>
								<img name="sheng" id="thxj" src="../../../images/thxj1.jpg" onmouseover="this.src='../../../images/thxj2.jpg'" onmouseout="this.src='../../../images/thxj1.jpg'   " src=""  onclick="tuihxjjh('grid');" style="border-width:0px;vertical-align:middle;" />
								<img id="thwsh" alt="退回未审核" onclick="thwshjh()" style="vertical-align:middle;" src="../../../images/thwsh1.jpg" onmouseover="this.src='../../../images/thwsh2.jpg'" onmouseout="this.src='../../../images/thwsh1.jpg'"/>
				                
								<img onclick="plscbtn()" alt="批量上传计划下达文件" src="../../../images/plsc.png" style="vertical-align:middle;width: 90px;height: 23px;">
								<img onclick="exportJhshxx()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								 --><!-- <img onclick="importJhsh()" alt="删除" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
       						</td>
       					</tr>
       				</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
           			<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元,
            		回收资金【<span id="hszj" style="color: red;">0</span>】万元。
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
