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
			
			//loadFileUpload();
		});
		//var flagi=0;//用来区分是否是第一次加载，0为第一次加载
		function loadFileUpload(){
		
			$("#uploadJhxd").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/batchUploadJhxd.do',
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
					'jhsh.xdwh':$("#bzxdwh").val()
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					fileShowByWh($("#bzxdwh").val(),"计划下达文件");
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
		        $('#grid').datagrid('selectRow', editIndex);
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
			var jhxdwh='';
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
			});
		}
		function planxdAll(){
			if($("#zjgl").is(':checked')){//资金归0下达，即是不需要文件和文号下达
				$('#grid').dialog("close");
				var jhxdwh='';
				var bztbsj=formatDate(new Date());
				
				var rows=$('#grid').datagrid('getSelections');
				if(rows.length==0){
					alert("请勾选要下达的计划");
					return;
				}
				for(var i=0;i<rows.length;i++){
					rows[i].jhxdwh=jhxdwh;
					rows[i].bztbsj=bztbsj;
					//alert(rows[i].xmbm.substr(10,1));
					rows[i].xmlx=rows[i].xmbm.substr(10,1);
				}
				var json_data = JSON.stringify(rows); 
				$.ajax({
					type:'post',
					url:'/jxzhpt/qqgl/planxdAll.do',
					data:"jhxdwh="+jhxdwh+"&bztbsj="+bztbsj+"&json_data="+json_data,
					dataType:'json',
					success:function(msg){
						if(msg){
							alert("下达成功");
							queryxmList();
							showMxbAll();
						}	
					}
				});
				
				
			}else{
				if($("#sjpfTable").html()==''){
					alert("请上传该文号对应的文件。");
					return;
				}
				$('#grid').dialog("close");
				//alert($('#bzxdwh').val()+"     "+$('#bztbsj').datebox('getValue'));
				var jhxdwh=$('#bzxdwh').val();
				var bztbsj=$('#bztbsj').datebox('getValue');
				if(jhxdwh==''||bztbsj==''){
					alert("请填写计划下达文号或计划下达时间。");
					return;
				}
				$('#bztbsj').datebox('setValue', formatDate(new Date()));
				$('#bzxdwh').val("");
				var rows=$('#grid').datagrid('getSelections');
				if(rows.length==0){
					alert("请勾选要下达的计划");
					return;
				}
				for(var i=0;i<rows.length;i++){
					rows[i].jhxdwh=jhxdwh;
					rows[i].bztbsj=bztbsj;
					//alert(rows[i].xmbm.substr(10,1));
					rows[i].xmlx=rows[i].xmbm.substr(10,1);
				}
				var json_data = JSON.stringify(rows); 
				$.ajax({
					type:'post',
					url:'/jxzhpt/qqgl/planxdAll.do',
					data:"jhxdwh="+jhxdwh+"&bztbsj="+bztbsj+"&json_data="+json_data,
					dataType:'json',
					success:function(msg){
						if(msg){
							alert("下达成功");
							queryxmList();
							showMxbAll();
						}
							
					}
				});
			}
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
				{field:'bzdk',title:'贷款',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
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
		

</body>
</html>
