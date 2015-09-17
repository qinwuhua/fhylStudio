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
	<script type="text/javascript">
		$(function(){
			loadTsdq("tsdq");
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm3('jsdj','技术等级');
			loadBmbm2('sqzt','申请状态省');
			xmnf("xmnf");
			YMLib.Var.jdbs=2;
			queryShxm();
			loadFileUpload();
		});
		function queryShxm(){
			grid.id="grid";
			grid.url="../../../qqgl/queryJhsh2.do";
			var params={'xmlx':5,'xzqhdm':getxzqhdm('xzqh'),'xmmc':$('#xmmc').val(),'ylxbh':$('#ylxbh').val(),
					'tsdq':$('#tsdq').combo("getText"),'jsdj':$('#jsdj').combobox("getValues").join(","),
					'xdzt':$('#xdzt').combobox("getValue"),'lsjl':$('#lsjl').combobox("getValue"),
					'xmbm':$('#xmnf').combobox("getValues").join(',')};
			grid.queryParams=params;
			loadLj(params);
			grid.height=$(window).height()-160;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'ck',checkbox:true},
				{field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'shxmxx'"+','+"'灾毁重建项目'"+','+
						"'/jxzhpt/page/qqgl/jhsh/shxm_xx1.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						return result;
					}
				},
				{field:'lsjl',title:'是否有历史记录',width:150,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				{field:'xdzt',title:'下达状态',width:100,align:'center',
					formatter:function(value,row,index){
						xmlx=5;
						var result='<a href="javascript:openJhxd1('+"'jhxd2.jsp',"+index+')" style="color:#3399CC;">计划下达</a>';
						return result;
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center'},
				{field:'xzqh',title:'行政区划',width:100,align:'center'},
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'ylxbh',title:'原路线编码',width:100,align:'center'},
				{field:'qdzh',title:'起点桩号',width:100,align:'center'},
				{field:'zdzh',title:'止点桩号',width:100,align:'center'},
				{field:'lc',title:'里程',width:100,align:'center'},
				{field:'jsdj',title:'技术等级',width:100,align:'center'},
				{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				{field:'gq',title:'工期',width:100,align:'center'},
				{field:'pfztz',title:'批复总投资',width:100,align:'center'},
				{field:'bbzzj',title:'部补助资金',width:100,align:'center'},
				{field:'sbzzj',title:'省补助资金',width:100,align:'center'},
				{field:'xdwh',title:'计划下达文号',width:100,align:'center'},
				{field:'xdsj',title:'计划下达时间',width:100,align:'center'}
			]];
			gridBind(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					$('#spanbbz').html(msg.BBZZJ);
					$('#spansbz').html(msg.SBZZJ);
					$('#spanlc').html(msg.LC);
				}
			});
		}
		function exportJhshxx(){
			var param='jhsh.xdzt='+$('#xdzt').combobox("getValue")+'&jhsh.xzqhdm='+getxzqhdm('xzqh')+
			'&jhsh.ghlxbh='+$('#ylxbh').val()+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+$('#tsdq').combo("getValue")+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",");
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
				'sizeLimit' : 20000000,
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
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;灾毁重建项目</div>
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
							<td>项目年份：</td>
        					<td><select id="xmnf" style="width: 70px;"></select></td>
       						<td>行政区划：</td>
       						<td><select id="xzqh" style="width:115px;"></select></td>
       						<td align="right">特殊地区：</td>
							<td><select name="tsdq" class="easyui-combobox" id="tsdq" style="width:150px;"></select></td>
							<td>技术等级：</td>
							<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select></td>
        					<td colspan="2">
								<img onclick="queryShxm()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
								<img onclick="plscbtn()" alt="批量上传计划下达文件" src="../../../images/plsc.png" style="vertical-align:middle;width: 90px;height: 23px;">
							</td>
       					</tr>
       					<tr height="32">
       						<td align="right">下达状态：</td>
							<td>
       							<select id="xdzt" class="easyui-combobox" style="width: 70px;">
	       							<option value="-1" selected="selected">全部</option>
	       							<option value="0">未下达</option>
	       							<option value="1">已下达</option>
       							</select>
       						</td>
       						<td>项目名称：</td>
       						<td><input name="xmmc" id="xmmc" style="width:110px;" type="text"/></td>
       						<td>原路线编号：</td>
       						<td><input name="ylxbh" id="ylxbh" style="width:150px;" type="text"/></td>
       						<td>补助历史：</td>
								<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:81px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
							<td colspan="2">
								<img onclick="exportJhshxx()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img onclick="importJhsh()" alt="删除" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
							</td>
       					</tr>
       				</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
           		<div>部补助资金累计：<span id="spanbbz" style="color: red;">0</span>;省补助资金累计：<span id="spansbz" style="color: red;">0</span>;里程累计：<span id="spanlc" style="color: red;">0</span></div>
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
