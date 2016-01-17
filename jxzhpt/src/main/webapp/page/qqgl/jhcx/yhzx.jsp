<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护中心</title>
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
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm2('sqzt','申请状态省');
			loadBmbm2('jb','级别');
			loadBmbm2('jsxz','建设性质2');
			xmnf("xmnf");
			queryYhzx();
			loadFileUpload();
		});
		function queryYhzx(){
			grid.id="grid";
			grid.url="../../../qqgl/queryJhsh2.do";
			var params={'xmlx':6,'xzqhdm':getxzqhdm('xzqh'),'lxmc':$('#lxmc').val(),'jsxz':$('#jsxz').combobox("getValue"),
					'jb':$('#jb').combobox("getValue"),'xmmc':$('#xmmc').val(),
					'xmbm':$('#xmnf').combobox("getValues").join(','),
					"ydbmc":$('#ydbmc').val(),'xdzt':$('#xdzt').combobox("getValue")};
			grid.queryParams=params;
			loadLj(params);
			grid.height=$(window).height()-180;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{rowspan:2,field:'xdzt',title:'下达状态',width:100,align:'center',
					formatter:function(value,row,index){
						if(value=='0'){return '未下达';}
						else if(value=='1'){return '已下达';}
						else return '';
					}
				},
				{rowspan:2,field:'xmbm',title:'项目编码',width:100,align:'center'},
				{rowspan:2,field:'xmmc',title:'项目名称',width:250,align:'center'},
				{rowspan:2,field:'xzqh',title:'行政区划',width:100,align:'center'},
				{rowspan:2,field:'gydw',title:'管养单位',width:100,align:'center'},
				{rowspan:2,field:'ydbmc',title:'原道班名称',width:100,align:'center'},
				{rowspan:2,field:'jb',title:'级别',width:100,align:'center',
					formatter: function(value,row,index){
						if(value=='1'){return '市级';}
						else if(value=='2'){return '县级';}
						else return '';
					}
	        	},
				{rowspan:2,field:'lxmc',title:'所在路线名称',width:100,align:'center'},
				{rowspan:2,field:'lxzh',title:'所在路线桩号',width:100,align:'center'},
				{rowspan:2,field:'jsxz',title:'建设性质',width:100,align:'center',
					formatter: function(value,row,index){
						if(value=='1'){return '新建';}
						else if(value=='2'){return '扩建';}
						else if(value=='3'){return '改建';}
						else return '';
					}
				},
				{rowspan:2,field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				{rowspan:2,field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				{colspan:3,title:'本次计划下达(万元)',width:120,align:'center'},
				{rowspan:2,field:'dfzc',title:'地方自筹(万元)',width:100,align:'center'},
				{rowspan:2,field:'ztz',title:'总投资(万元)',width:100,align:'center'}
				],
				[
                {field:'sbzzj',title:'省补助资金(万元)',width:100,align:'center'},
				{field:'zddzjl',title:'重点打造奖励(万元)',width:110,align:'center'},
				{field:'zbzzj',title:'总补助资金(万元)',width:100,align:'center'}
			]];
			gridBind1(grid);
		}
		
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$('#spanztz').html(msg.ZTZ);
						$('#spansbz').html(msg.SYSBB);
					}else{
						$('#spanztz').html("0");
						$('#spansbz').html("0");
					}
					
				}
			});
		}
		function exportJhshxx(){
			var param='jhsh.xmlx=4&jhsh.xdzt='+$('#xdzt').combobox("getValue")+'&jhsh.xzqhdm='+getxzqhdm('xzqh')+
			'&jhsh.ghlxbh='+$('#ylxbh').val()+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+$('#tsdq').combo("getValue")+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",")+'&ylxbh='+$('#gldj').combobox("getValues").join(',');
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzx.do?"+param;
		}
		function importJhsh(){
			importExcel("/jxzhpt/qqgl/importExcelJhxdYhdzx.do","yhjhxd");
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
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;养护中心项目</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
       	<tr>
       		<td align="left" style="padding-left: 10px; padding-right: 10px; padding-top: 10px;">
       			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
       				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
       					<font style="color: #0866A0; font-weight: bold"></font>
       				</legend>
       				<div>
       				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
						<tr height="32">
							<td>行政区划：</td>
       						<td><select id="xzqh" style="width:134px;"></select></td>
       						<td>项目名称：</td>
       						<td><input name="xmmc" id="xmmc" style="width:120px;" type="text"/></td>
							<td>项目年份：</td>
        					<td><select id="xmnf" style="width: 70px;"></select></td>
							<td>&nbsp;建设性质：</td>
       						<td><select name="jsxz" class="easyui-combobox" id="jsxz" style="width:81px;"></select></td>
       						<td>&nbsp;级别：</td>
	       					<td><select name="jb" class="easyui-combobox" id="jb" style="width:100px;"></select></td>
       					</tr>
       					<tr height="32">
       					    <td>路线名称：</td>
        					<td><input type="text" id="lxmc" style="width:95px;" /></td>
        					<td>原道班名称：</td>
        					<td><input type="text" id="ydbmc" style="width:95px;" /></td>
       						<td align="right">审核状态：</td>
								<td>
	       							<select id="xdzt" class="easyui-combobox" style="width: 70px;">
		       							<option value="-1" selected="selected">全部</option>
		       							<option value="0">未审核</option>
		       							<option value="1">已审核</option>
	       							</select>
	       						</td>
       					</tr>
       					<tr height="32">
       						<td colspan="8">
       							<img onclick="queryYhzx()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
<!-- 								<img onclick="plscbtn()" alt="批量上传计划下达文件" src="../../../images/plsc.png" style="vertical-align:middle;width: 90px;height: 23px;"> -->
<!-- 								<img onclick="exportJhshxx()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/> -->
<!-- 								<img onclick="importJhsh()" alt="删除" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
       						</td>
       					</tr>
        				</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
           		<div>总投资累计：<span id="spanztz" style="color: red;">0</span>;省补助资金累计：<span id="spansbz" style="color: red;">0</span>;
           		</div>
           		<div><table id="grid"></table></div>
           	</td>
       	</tr>
	</table>
<!-- 	<div id="plsc" class="easyui-dialog" title="批量上传计划下达文件" style="width:500px;height:150px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true"> -->
<!-- 			<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr style="height: 30px;font-size: 10px;"> -->
<!-- 					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"> -->
<!-- 						批复文号</td> -->
<!-- 					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"> -->
<!-- 						<input id="plgkpfwh" type="text"/> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr style="height: 30px;font-size: 10px;"> -->
<!-- 					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"> -->
<!-- 						批复文件</td> -->
<!-- 					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"> -->
<!-- 						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1"> -->
<!-- 							<tbody id="sjpfTable"></tbody> -->
<!-- 						</table> -->
<!-- 						<table> -->
<!-- 							<tr> -->
<!-- 								<td colspan="2">待上传：<div id="fileQueue" ></div></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadJhxd" id="uploadJhxd" /></td> -->
<!-- 								<td> -->
<!-- 									<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
</body>
</html>
