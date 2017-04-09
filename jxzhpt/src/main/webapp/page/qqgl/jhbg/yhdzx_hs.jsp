<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程路面改建路面升级项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
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
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/json2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/datagrid-cellediting.js"></script>
	<script type="text/javascript">
		$(function(){
			//$('#bztbsj').datebox('setValue', formatDate(new Date()));
			//loadDist1("xzqh",$.cookie("dist"));
			//tsdqdx("tsdq");
			//xdzt('xdzt');
			//zjly("zjly",'gsd');
			//loadBmbm3('jsdj','技术等级');
			//loadBmbm3('jsjsdj','技术等级');
			//jhxdwhdx("jhxdwh",'gsd');
			//xmnfnull("scxdnf");
			//urlxmnf("scxdnf",getUrlParame('id'));
			//loadGldj('gldj');
			//gsdxmlx('xmlx');
			YMLib.Var.jdbs=2;
			//queryxmList();
			 showMxbAll();
			
			loadFileUpload();
		});
		//var flagi=0;//用来区分是否是第一次加载，0为第一次加载
		function loadFileUpload(){
		
			$("#uploadJhxd").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/batchUploadJhwj.do',
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
					'jhsh.xdwh':$("#bzxdwh").val(),'jhsh.xmlx':'1'
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					ShowfileByWh('jhxdTable',$("#bzxdwh").val(),"计划取消文件");
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
			
			
			
			$("#uploadSgtxd").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/batchUploadJhwj.do',
				'cancelImg' : '../../../js/uploader/cancel.png',
				'queueID' : 'fileQueue1',
				'fileDataName' : 'uploadSgtxd',
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
					'jhsh.xdwh':$("#bzsjwh").val(),'jhsh.xmlx':'2'
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					ShowfileByWh('sjpfTable',$("#bzsjwh").val(),"施工图取消文件");
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
		function upload(){
			if($('#bzxdwh').val()!=""){
				$("#uploadJhxd").uploadifySettings('scriptData',{'jhsh.xdwh':$('#bzxdwh').val()});
				$('#uploadJhxd').uploadifyUpload();
			}else{
				alert("必须填写计划下达文号！");
			}
		}
		function upload1(){
			if($('#bzsjwh').val()!=""){
				$("#uploadSgtxd").uploadifySettings('scriptData',{'jhsh.xdwh':$('#bzsjwh').val()});
				$('#uploadSgtxd').uploadifyUpload();
			}else{
				alert("必须填写施工图变更文号！");
			}
		}
		var flag=false;
		function cxym(str){
			if(str==0 && flag==false){
				queryxmList();
				
			}
			if(str==0 && flag==true){
				$("#grid").datagrid('reload');
				flag=true;
			}
		}


		
		
		
		
		
		
		
		
		
		
		
	 	
		var editIndex = undefined;
		function beginEditing (rowIndex,field,value) {
	
		    if (rowIndex != editIndex) {
		        if (endEditing()) {
		        	$('#grid').datagrid('beginEdit', rowIndex);
		        	
		            editIndex = rowIndex;
		            
		        } else {
		            $('#grid').datagrid('selectRow', editIndex);
		        }
		    }
		}
		function endEditing() {
		    if (editIndex == undefined) { return true; }
		    
		    if ($('#grid').datagrid('validateRow', editIndex)) {
		    	
		        $('#grid').datagrid('endEdit', editIndex);
		        //$('#grid').datagrid('selectRow', editIndex);
		        editIndex = undefined;
		        
		        return true;
		    } else {
		        return false;
		    }
		}
		 
	
		function createAll(){
			endEditing();
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要生成统计表的计划");
				return;
			}
			alert(rows[0].bzpfztz);
		}
		function planxdwhAll(){
			
			
			endEditing();
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要下达的计划");
				return;
			}
			$('#jhxd').dialog("open");
			
			/* var jhxdwh='';
			var bztbsj=formatDate(new Date());
			
			for(var i=0;i<rows.length;i++){
				rows[i].jhxdwh=jhxdwh;
				rows[i].bztbsj=bztbsj;
				//alert(rows[i].xmbm.substr(10,1));
				rows[i].xmlx=rows[i].xmbm.substr(10,1);
			}
			var json_data = JSON.stringify(rows); 
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/planxdAll_qx.do',
				data:"jhxdwh="+jhxdwh+"&bztbsj="+bztbsj+"&json_data="+json_data,
				dataType:'json',
				success:function(msg){
					if(msg){
						alert("下达成功");
						//queryxmList();
						showMxbAll();
					}	
				}
			}); */
		}
		function planxdAll(){
			if($("#jhxdTable").html()==''){
				alert("请上传计划下达文件。");
				return;
			}
			if($("#sjpfTable").html()==''){
				alert("请上传施工图变更文件。");
				return;
			}
			
			//alert($('#bzxdwh').val()+"     "+$('#bztbsj').datebox('getValue'));
			var jhxdwh=$('#bzxdwh').val();
			var bztbsj=$('#bztbsj').datebox('getValue');
			var sgtsjwh=$('#bzsjwh').val();
			//alert();
			if(jhxdwh==''){
				alert("请填写计划下达文号。");
				return;
			}
			if(bztbsj==''){
				alert("请填写计划下达时间。");
				return;
			}
			if(sgtsjwh==''){
				alert("请填写施工图变更文号。");
				return;
			}
			$('#jhxd').dialog("close");
			$('#bztbsj').datebox('setValue', formatDate(new Date()));
			$('#bzxdwh').val("");$('#bzsjwh').val("");
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要下达的计划");
				return;
			}
			for(var i=0;i<rows.length;i++){
				rows[i].jhxdwh=jhxdwh;
				rows[i].bztbsj=bztbsj;
				rows[i].sgtsjwh=sgtsjwh;
				rows[i].sfqx='是';
				//alert(rows[i].xmbm.substr(10,1));
				rows[i].xmlx=rows[i].xmbm.substr(10,1);
			}
			var json_data = JSON.stringify(rows); 
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/planxdAll_qx.do',
				data:"jhxdwh="+jhxdwh+"&bztbsj="+bztbsj+"&sgtsjwh="+sgtsjwh+"&json_data="+json_data,
				dataType:'json',
				success:function(msg){
					if(msg){
						alert("下达成功");
						//queryxmList();
						showMxbAll();
					}
						
				}
			});
		}
		
		function showMxbAll(){
			
			var xmnf='';
				xmnf='2011,2012,2013,2014,2015';
			
			var params={'jhsh.xmlx':4,'jhsh.xmnf':xmnf};
			//loadLj(params);
			$('#grid').datagrid({    
				url:'/jxzhpt/qqgl/queryjhxdsh_qxbz.do',
			    striped:true,
			    pagination:false,
			    rownumbers:true,
			    checkOnSelect:true,
			    height:$(window).height()-50,
			    width:$(window).width()-20,
			    idField: 'xmbm', //主键
			    queryParams: params,
			    columns:[[
				{field:'ck',checkbox:true,width:20,align:'center'},
				
				{field:'xzqh',title:'行政区划',width:60,align:'center'},
				{field:'xmnf',title:'项目年份',width:60,align:'center',
					formatter: function(value,row,index){
		        		return row.xmbm.substr(0,4);
		        	}
				},
				{field:'xmmc',title:'项目名称',width:250,align:'center',editor:{type:'text',options:{required:false}}},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'bzxdnf',title:'下达年份',width:70,align:'center',editor:{type:'numberbox',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'bzpfztz',title:'总投资',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'bzrys',title:'燃油税',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'bzdk',title:'厅贷款',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'bzqt',title:'其他',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				//{field:'bztbsj',title:'填报时间',width:70,align:'center',editor:{type:'datebox',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'tbdw',title:'填报单位',width:100,align:'center',
					formatter: function(value,row,index){
		        		return $.cookie('truename');
		        	}}
			    ]],
			    onClickCell: function (rowIndex, field, value) {
// 			    	alert(field);
			    	beginEditing(rowIndex,field,value);
			    	//$('#jhbz').datagrid('enableCellEditing').datagrid('gotoCell', {index: rowIndex,field: field});
			    }

			}); 
			
		}
		
		
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		
		function searchlist(){
			queryxmList();
			 showMxbAll();
		}
	</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div style="padding-left:5px;padding-top: 1px;padding-bottom: 1px;">
<!--         					<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:endEditing()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">编辑完成</a> -->
        					<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdwhAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">下达</a>
						</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left:10px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
		<div id="jhxd" class="easyui-dialog" title="计划下达" style="width:500px;height:280px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
			<table width="98%" border="0" style="padding-left:5px; border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达文号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="bzxdwh" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达时间</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="bztbsj" type="text"  class="easyui-datebox" />
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达文件</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="jhxdTable"></tbody>
						</table>
						<table>
							<tr>
								<td colspan="2">待上传：<div id="fileQueue" ></div></td>
							</tr>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('/jxzhpt/js/uploader/bdll.png');" name="uploadJhxd" id="uploadJhxd" /></td>
								<td>
									<img name="uploadFile" id="uploadFile" src="/jxzhpt/js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						施工图变更文号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="bzsjwh" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						施工图变更文件</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td colspan="2">待上传：<div id="fileQueue1" ></div></td>
							</tr>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('/jxzhpt/js/uploader/bdll.png');" name="uploadSgtxd" id="uploadSgtxd" /></td>
								<td>
									<img name="uploadFile1" id="uploadFile1" src="/jxzhpt/js/uploader/upload.png" onclick="upload1()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td colspan="2" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 45%">
        				<a id='mybuttion3' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">下达</a>
<!-- 						<a style="margin-left: 48%" href="javascript:planxdAll()" class="button button-tiny button-border button-rounded button-primary">下达</a> -->
					</td>
				</tr>
			</table>
		</div>

</body>
</html>
