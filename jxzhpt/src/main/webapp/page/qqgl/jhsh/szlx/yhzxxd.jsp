<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护中心</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/json2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/datagrid-cellediting.js"></script>
	<script type="text/javascript">
		$(function(){
			//loadGhlx('ghlxbm');
			//loadylx('lxbm');
			$('#bztbsj').datebox('setValue', formatDate(new Date()));
			loadDist1("xzqh",$.cookie("dist"));
			if(getUrlParame('id')=='010113030206')
			xmnfs3w("scxdnf",'无');
			else
			xmnfs2w("scxdnf",'无');
			
			jhxdwhdx("jhxdwh",'yhzx');
			xdzt('xdzt');
			queryxmList();
			 showMxbAll();
			$('#tt').tabs({ 
			    border:false, 
			    onSelect:function(title,index){ 
			        cxym(index);
			    } 
			}); 
			loadFileUpload();
		});
		//var flagi=0;//用来区分是否是第一次加载，0为第一次加载
		function loadFileUpload(){
		
			$("#uploadJhxd").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '${pageContext.request.contextPath}/js/uploader/uploadify.swf',
				'script' : '${pageContext.request.contextPath}/qqgl/batchUploadJhxd.do',
				'cancelImg' : '${pageContext.request.contextPath}/js/uploader/cancel.png',
				'queueID' : 'fileQueue',
				'fileDataName' : 'uploadJhxd',
				'auto' : false,
				'multi' : false,
				'buttonImg': '${pageContext.request.contextPath}/js/uploader/bdll.png',
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

		function queryxmList(){
			var xmnf='';
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2011,2012,2013,2014,2015,2016,2017,2018,2019,2020';
			var xzqhdm=$("#xzqh").combotree("getValues");var xzqhstr="";
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var scxdnf=$("#scxdnf").combobox("getValues").join(",");
			if(scxdnf.substr(0,1)==',')
				scxdnf=scxdnf.substr(1,scxdnf.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var xdzt=$("#xdzt").combobox("getValues").join(",");
			if(xdzt.substr(0,1)==',')
				xdzt=xdzt.substr(1,xdzt.length);
			var params={'jhsh.xzqhdm':xzqhstr,
						'jhsh.xmmc':$('#xmmc').val(),
						'jhsh.xmnf':xmnf,
						'jhsh.lxmc':$('#lxmc').val(),
						'jhsh.xmbm':$('#xmbm').val(),
						'jhsh.sbzt':null,
						'jhsh.shzt':null,
						'jhsh.xdzttj':xdzt,
						'jhsh.xmlx1':'yhzxxd',
						'jhsh.ghlxbm':$('#ghlxbm').val(),
						'jhsh.ghlxmc':$('#ghlxmc').val(),
						'jhsh.ylxbm':$('#ylxbm').val(),
						'jhsh.ylxmc':$('#ylxmc').val(),
						'jhsh.jhxdwh':jhxdwh,
						'jhsh.scxdnf':scxdnf
						
						};
			ljparam=params;
			loadLj();
			
			
			$('#grid').datagrid({    
			    url:'/jxzhpt/qqgl/querySzxmList.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-210,
			    width:$(window).width(),
			    queryParams: params,
			    columns:[[
		    	{field:'CZ',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result="";
						result='<a href="javascript:szxmXdInfo('+"'"+index+"','yhzx'"+')" style="color:#3399CC;">详情&nbsp;&nbsp;</a>';
						return result;
						}
				},
				{field: 'XMMC', title: '项目名称', width: 120, align: 'center'},
		        {field: 'XZQH', title: '行政区划', width: 60, align: 'center'},
		        {field: 'XLXBM', title: '规划路线编码', width: 120, align: 'center'},
		        {field: 'XLXMC', title: '规划路线名称', width: 120, align: 'center'},
		        {field: 'XLXZH', title: '规划路线桩号', width: 120, align: 'center'},
		        {field: 'YLXBM', title: '原路线编码', width: 120, align: 'center'},
		        {field: 'YLXMC', title: '原路线名称', width: 120, align: 'center'},
		        {field: 'LLXZH', title: '原路线桩号', width: 120, align: 'center'},
		        {field: 'YDBMC', title: '原道班名称', width: 120, align: 'center'},
		        {field: 'JSXZ', title: '建设性质', width: 120, align: 'center'},
		        {field: 'XMNF', title: '建设年份', width: 120, align: 'center'},
		        {field:'ZTZ',title:'总投资(万元)',width:100,align:'center'},
				{field:'JBZJ',title:'奖补资金合计(万元)',width:60,align:'center'},
				{field:'DFZC',title:'地方自筹(万元)',width:100,align:'center'},
				{field: 'BZ', title: '备注', width: 120, align: 'center'}
			    ]]  
			}); 
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	 	
		var editIndex = undefined;
		function beginEditing (rowIndex,field,value) {
	
		    if (rowIndex != editIndex) {
		        if (endEditing()) {
		        	$('#jhbz').datagrid('beginEdit', rowIndex);
		        	
		            editIndex = rowIndex;
		            
		        } else {
		            $('#jhbz').datagrid('selectRow', editIndex);
		        }
		    }
		}
		function endEditing() {
		    if (editIndex == undefined) { return true; }
		    
		    if ($('#jhbz').datagrid('validateRow', editIndex)) {
		    	
		        $('#jhbz').datagrid('endEdit', editIndex);
		        //$('#jhbz').datagrid('selectRow', editIndex);
		        editIndex = undefined;
		        
		        return true;
		    } else {
		        return false;
		    }
		}
		 
	
		function createAll(){
			endEditing();
			var rows=$('#jhbz').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要生成统计表的计划");
				return;
			}
			alert(rows[0].bzpfztz);
		}
		function planxdwhAll(){
			endEditing();
			var rows=$('#jhbz').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要下达的计划");
				return;
			}
			  if($("#zjgl").is(':checked')){
				for(var i=0;i<rows.length;i++){
					if(rows[i].STZ!='0'){
						//alert(rows[i].bzcgs);
						alert("所选项目中省投资未下达完,不能使用资金归0下达");
						return;
					}
				}
			}    
			$('#jhxd').dialog("open");

		}
		function planxdAll(){
			if($("#zjgl").is(':checked')){//资金归0下达，即是不需要文件和文号下达
				$('#jhxd').dialog("close");
				var jhxdwh=$('#bzxdwh').val();
				var bztbsj=$('#bztbsj').datebox('getValue');
				if(bztbsj==''){
					alert("请填写计划下达时间。");
					return;
				}
				$('#bztbsj').datebox('setValue', formatDate(new Date()));
				$('#bzxdwh').val("");
				var rows=$('#jhbz').datagrid('getSelections');
				if(rows.length==0){
					alert("请勾选要下达的计划");
					return;
				}
				for(var i=0;i<rows.length;i++){
					rows[i].JHXDWH=jhxdwh;
					rows[i].BZTBSJ=bztbsj;
					//alert(rows[i].xmbm.substr(10,1));
					rows[i].XMLX='jhsh_yhzx';
				}
				var json_data = JSON.stringify(rows); 
				$.ajax({
					type:'post',
					url:'/jxzhpt/qqgl/planxdAllSzxm.do',
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
				if($("#bzxdwh").val()==''){
					alert("请填写计划下达文号。");
					return;
				}
				if($("#sjpfTable").html()==''){
					alert("请上传该文号对应的文件。");
					return;
				}
				$('#jhxd').dialog("close");
				//alert($('#bzxdwh').val()+"     "+$('#bztbsj').datebox('getValue'));
				var jhxdwh=$('#bzxdwh').val();
				var bztbsj=$('#bztbsj').datebox('getValue');
				if(jhxdwh==''||bztbsj==''){
					alert("请填写计划下达文号或计划下达时间。");
					return;
				}
				$('#bztbsj').datebox('setValue', formatDate(new Date()));
				$('#bzxdwh').val("");
				var rows=$('#jhbz').datagrid('getSelections');
				if(rows.length==0){
					alert("请勾选要下达的计划");
					return;
				}
				for(var i=0;i<rows.length;i++){
					rows[i].JHXDWH=jhxdwh;
					rows[i].BZTBSJ=bztbsj;
					//alert(rows[i].xmbm.substr(10,1));
					rows[i].XMLX='jhsh_yhzx';
				}
				var json_data = JSON.stringify(rows); 
				$.ajax({
					type:'post',
					url:'/jxzhpt/qqgl/planxdAllSzxm.do',
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
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2011,2012,2013,2014,2015,2016,2017,2018,2019,2020';
			var xzqhdm=$("#xzqh").combotree("getValues");var xzqhstr="";
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var scxdnf=$("#scxdnf").combobox("getValues").join(",");
			if(scxdnf.substr(0,1)==',')
				scxdnf=scxdnf.substr(1,scxdnf.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var xdzt=$("#xdzt").combobox("getValues").join(",");
			if(xdzt.substr(0,1)==',')
				xdzt=xdzt.substr(1,xdzt.length);
			var params={'jhsh.xzqhdm':xzqhstr,
						'jhsh.xmmc':$('#xmmc').val(),
						'jhsh.xmnf':xmnf,
						'jhsh.lxmc':$('#lxmc').val(),
						'jhsh.xmbm':$('#xmbm').val(),
						'jhsh.sbzt':null,
						'jhsh.shzt':null,
						'jhsh.xdzttj':xdzt,
						'jhsh.xmlx1':'yhzxxd',
						'jhsh.ghlxbm':$('#ghlxbm').val(),
						'jhsh.ghlxmc':$('#ghlxmc').val(),
						'jhsh.ylxbm':$('#ylxbm').val(),
						'jhsh.ylxmc':$('#ylxmc').val(),
						'jhsh.jhxdwh':jhxdwh,
						'jhsh.scxdnf':scxdnf
						
						};
			ljparam=params;
			$('#jhbz').datagrid({    
			    url:'/jxzhpt/qqgl/querySzxmxdbz.do',
			    striped:true,
			    pagination:false,
			    rownumbers:true,
			    checkOnSelect:true,
			    height:$(window).height()-240,
			    width:$(window).width(),
			    idField: 'XMBM', //主键
			    queryParams: params,
			    columns:[[
				{field:'ck',checkbox:true,width:20,align:'center'},
				{field:'XZQH',title:'行政区划',width:160,align:'center'},
				{field:'XMNF',title:'项目年份',width:100,align:'center'},
				{field:'XMMC',title:'项目名称',width:350,align:'center',editor:{type:'text',options:{required:false}}},
				{field:'BZXDNF',title:'下达年份',width:80,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'BZZTZ',title:'总投资',width:100,align:'center',editor:{type:'text',options:{required:false}}},
				{field:'BZSTZ',title:'省投资',width:100,align:'center',editor:{type:'text',options:{required:false}}},
				{field:'BZZDDZJL',title:'重点打造奖励',width:100,align:'center',editor:{type:'text',options:{required:false}}},
				{field:'BZDFZC',title:'地方自筹',width:100,align:'center',editor:{type:'text',options:{required:false}}}
			    ]],
			    onClickCell: function (rowIndex, field, value) {
			    	beginEditing(rowIndex,field,value);
			    }

			}); 
			
		}
		
		var ljparam;
		function loadLj(){
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/queryJhshLjSzxm.do',
				data:ljparam,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$('#xmsl').html(msg.XMSL);
						$('#ztz').html(msg.ZTZ);
						$('#zbz').html(msg.ZBZ);
						$('#xdztz').html(msg.XDZTZ);
						$('#xdstz').html(msg.XDSTZ);
						$('#xdjl').html(msg.XDJL);
						$('#xddfzc').html(msg.XDDFZC);
					}
					
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
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;<span id="astext">计划下达</span>>&nbsp;<span id="bstext"></span>>&nbsp;养护中心</div>
	</div>
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
        						<tr height="32">
								<td align="right">行政区划：</td>
								<td><select id="xzqh" style="width: 144px;"></select></td>
								<td align="right">项目名称：</td>
								<td><input name="xmmc" id="xmmc" style="width: 100px;"
									type="text" /></td>
								<td align="right">规划路线编码：</td>
								<td><input name="ghlxbm" id="ghlxbm" style="width: 100px;"
									type="text" /></td>
								<td align="right">原路线编码：</td>
								<td><input name="ylxbm" id="ylxbm" style="width: 100px;"
									type="text" /></td>
								
								
							</tr>
							<tr height="32">
								<td align="right">下达状态：</td>
								<td><select id="xdzt" class="easyui-combobox"
									style="width: 144px;">
								</select></td>
								<td align="right">首次下达年份：</td>
								<td><select id="scxdnf" style="width: 104px;"></select></td>
								
								<td align="right">规划路线名称：</td>
								<td><input name="ghlxmc" id="ghlxmc" style="width: 100px;"
									type="text" /></td>
								
								<td align="right">原路线名称：</td>
								<td><input name="ylxmc" id="ylxmc" style="width: 100px;"
									type="text" /></td>
								
							</tr>
        						
        						<tr>
        						<td align="right">计划下达文号：</td>
								<td><select id="jhxdwh" class="easyui-combobox"
									style="width: 144px;">
								</select></td>
								</tr>
        						
        						<tr>
        						<td colspan="10">
        							<img onclick="searchlist()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
<%-- 									<img onclick="exportZjxd()" id="btnShangbao" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
        						</td>
        					</tr>
        					<!-- <tr height="32">
        						
        						
        					</tr> -->
        				</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            		项目【<span id="xmsl" style="color: red;">0</span>】个,
            		总投资【<span id="ztz" style="color: red;">0</span>】万元,
            		补助合计【<span id="zbz" style="color: red;">0</span>】万元,
            		已下达【<span id="xdztz" style="color: red;">0</span>】万元,
            		其中：省补【<span id="xdstz" style="color: red;">0</span>】万元,
            		奖励【<span id="xdjl" style="color: red;">0</span>】万元,
            		地方自筹【<span id="xddfzc" style="color: red;">0</span>】万元。
            		</div>
            		<div id="tt" border="false" class="easyui-tabs" >
            		<script type="text/javascript">
                	$("#tt").attr('style','width:'+($(window).width()*0.99)+'px');
     				</script>
	            		<div title="项目列表" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
					    	<table id="grid"></table>
					    </div>
					    <div title="计划编制" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
					    	<a id='mybuttion3' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdwhAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">计划下达</a>
					    	
					    	
<!-- 					    	<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:createAll()" class="button button-tiny button-border button-rounded button-primary">生成汇总</a> -->
<!-- 							<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdwhAll()" class="button button-tiny button-border button-rounded button-primary">计划下达</a> -->
							<input id='zjgl' type="checkbox">资金归0
<!-- 					    	<input type="button" value="生成汇总" onclick="createAll()"><input type="button" value="计划下达"> -->
					    	<table id="jhbz">
					    	
					    	</table>
					    </div>
				    </div>
            		<!-- <div>
            			<table id="grid"></table>
            		</div> -->
            	</td>
        	</tr>
		</table>
		<div id="wj" class="easyui-dialog" title="计划下达文件" style="width:500px;height:200px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
					<table width="99.9%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 100%;" cellspacing="0" cellpadding="0">
		
				<tr style="height: 100%;font-size: 10px;">
					
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="wjTable"></tbody>
						</table>
						
					</td>
				</tr>
			</table>
		</div>
		<div id="jhxd" class="easyui-dialog" title="计划下达" style="width:500px;height:250px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
			<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
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
						下达文件</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
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
					<td colspan="2" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 45%;">
						<a id='mybuttion4' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion4')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion4')"  class="button button-tiny button-rounded button-raised button-primary">下达</a>
						
					</td>
				</tr>
			</table>
		</div>
</body>
</html>
