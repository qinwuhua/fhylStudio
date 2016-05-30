<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>补助标准</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
<style>
#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(../../images/jianjiao.png) 8px 0 no-repeat;}
#righttop{height:33px;background:url(../../images/righttopbg.gif) 0 0 repeat-x;}
.bgg{ background-color:#a7d1f9; width:70%;border-color:#a7d1f9;}
.bgg td{ background-color:#FFF; text-align:center; height:25px; line-height:25px;}
</style>
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
$(function(){
	var years=[];
	for(var i=0;i<10;i++){
		years.push({text:(2015+5-i),value:(2015+5-i)});
	}
	$('#nd').combobox({
	    data:years,
	    checkbox : true,
	    multiple : true,
	    valueField:'value',
	    textField:'text'
	});
	//$('#nd').combobox("setValue",first);
	
	loadTable();
});
var obj=new Object();
var array=new  Array();
function loadTable(){
	$("#wqbztable").html("");
	$.ajax({
		type:'post',
		url:'/jxzhpt/xtgl/selectXmsx.do',
		dataType:'json',
		data:"",
		success:function(data){
			data.sfwn=='是' ? $("#sfwn").attr("checked", true):$("#sfwn").attr("checked", false);
			data.sfserw=='是' ? $("#sfserw").attr("checked", true):$("#sfserw").attr("checked", false);
			data.sfgj=='是' ? $("#sfgj").attr("checked", true):$("#sfgj").attr("checked", false);
			data.sflm=='是' ? $("#sflm").attr("checked", true):$("#sflm").attr("checked", false);
			data.sfxj=='是' ? $("#sfxj").attr("checked", true):$("#sfxj").attr("checked", false);
			data.sfzh=='是' ? $("#sfzh").attr("checked", true):$("#sfzh").attr("checked", false);
			data.sfdx=='是' ? $("#sfdx").attr("checked", true):$("#sfdx").attr("checked", false);
			data.sfzx=='是' ? $("#sfzx").attr("checked", true):$("#sfzx").attr("checked", false);
			data.sfyfx=='是' ? $("#sfyfx").attr("checked", true):$("#sfyfx").attr("checked", false);
			$("#ynd").html(data.nd);
			//$("#nd").combobox('setValues',data.nd);
			
		}
	});
}
function edit(index){
	obj=array[index];
	YMLib.UI.createWindow('lxxx','危桥补助标准编辑','wqbzbz_xg.jsp','lxxx',400,300);
}
function save(){
	if($("#nd").combobox('getValues')==''||$("#nd").combobox('getValues')==null){
		alert("请选择年份");
		return;
	}
		
	var str="";
	$("#sfwn").is(':checked') ? str+="param.sfwn=是" : str+="param.sfwn=否";
	$("#sfserw").is(':checked') ? str+="&param.sfserw=是" : str+="&param.sfserw=否";
	$("#sfgj").is(':checked') ? str+="&param.sfgj=是" : str+="&param.sfgj=否";
	$("#sflm").is(':checked') ? str+="&param.sflm=是" : str+="&param.sflm=否";
	$("#sfxj").is(':checked') ? str+="&param.sfxj=是" : str+="&param.sfxj=否";
	$("#sfzh").is(':checked') ? str+="&param.sfzh=是" : str+="&param.sfzh=否";
	$("#sfdx").is(':checked') ? str+="&param.sfdx=是" : str+="&param.sfdx=否";
	$("#sfzx").is(':checked') ? str+="&param.sfzx=是" : str+="&param.sfzx=否";
	$("#sfyfx").is(':checked') ? str+="&param.sfyfx=是" : str+="&param.sfyfx=否";
	str+="&param.nd="+$("#nd").combobox('getValues').join(',');

	$.ajax({
		data:str,
		type:'post',
		datatype:'json',
		url:'/jxzhpt/xtgl/insertxmsx.do',
		success:function(msg){
			if(msg){
				loadTable();
			}
		}
	});
}
</script>
<div style="width:100%;">
    <div  style="height:34px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;项目筛选</div>
		</div>
    </div>
    <div style="height:450px;margin-top:10px;margin-left:10px;overflow: auto;" >
    	<table width="100%" class="bgg" border="0" cellpadding="0" cellspacing="1">
    		<tr style="font-weight:700;font-size:16px;"><td width="30%">项目范围</td><td width="10%">项目年份</td><td width="60%">建设类型</td></tr>
    		
    		<tr style="font-weight:200;font-size:16px;">
    		<td>
				<input id='sfwn' type="checkbox" value="是" style="vertical-align: middle;"/>  五年项目库<br>
				<input id='sfserw' type="checkbox" value="是" style="vertical-align: middle;"/>  十二五项目
			</td>
    		<td> 
    			<span id='ynd'></span><br>
    			
    		 	<input type="text" id='nd' class='easyui-combobox'/>
    		
    		</td>
    		<td> 
	    		<input id='sfgj' type="checkbox" value="是" style="vertical-align: middle;"/>  改建&nbsp;
				<input id='sflm' type="checkbox" value="是" style="vertical-align: middle;"/>  路面改造&nbsp;
				<input id='sfxj' type="checkbox" value="是" style="vertical-align: middle;"/>  新建&nbsp;
				<input id='sfzh' type="checkbox" value="是" style="vertical-align: middle;"/>  灾毁恢复&nbsp;
				<input id='sfdx' type="checkbox" value="是" style="vertical-align: middle;"/>  大修&nbsp;
				<input id='sfzx' type="checkbox" value="是" style="vertical-align: middle;"/>  中修&nbsp;
				<input id='sfyfx' type="checkbox" value="是" style="vertical-align: middle;"/>  预防性养护<br>
    		</td>
    		</tr>
    		<tr>
    			<td colspan="3">
    			 <a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:save()" class="button button-raised button-tiny  button-primary">保存</a>
							
    			</td>
    		</tr>
    		
    		<!-- <tbody id="wqbztable">
    		
    		
    		</tbody> -->
    	</table>
    	<!-- <div style="width:80%;margin-top:10px;text-align:center;">
    		<a id="tjwqbz" iconCls="icon-add" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="false"  onclick="YMLib.UI.createWindow('lxxx','危桥补助标准添加','wqbzbz_add.jsp','lxxx',400,300);">添    加</a>
    		<a id="dwgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="false" >保　存</a>
    	</div> -->
    </div>
</div>
</body>
</html>