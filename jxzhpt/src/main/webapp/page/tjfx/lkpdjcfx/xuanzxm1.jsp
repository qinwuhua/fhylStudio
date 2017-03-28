<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>选择项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
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
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			gsdxmlx('xmlx');
// 			loadBmbm3("xmnf",'全部项目年份',new Date().getFullYear());
			xmnf("xmnf");
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('lsxmlx','项目类型3');
			
		});
		
		function showAllgsd(){
			$("#cxtj").attr('style','display:none');
			$("#xsdata").attr('style','');
			
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
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',') xmnf=xmnf.substr(1,xmnf.length);
			
			var jsdj=$("#jsdj").combotree('getText');
			var xmlx=$("#lsxmlx").combotree("getText");

			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/tjfx/selectXmsqxm.do',
			    striped:true,
			    pagination:false,
			    rownumbers:true,
			   checkOnSelect:true,
			    height:$(window).height()-40,
			    width:$(window).width()-20,
			    queryParams: {
			    	'xmsq.xzqh':xzqhstr,
					'xmsq.xmnf':xmnf,
					'xmsq.jsdj':jsdj,
					'xmsq.xmmc':$("#xmmc").val(),
					'xmsq.lsxmlx':xmlx,
				},
			    columns:[[
			        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
					{field : 'xzqh',title : '行政区划',width : 105,align : 'center'},
					{field : 'xmnf',title : '项目年份',width : 53,align : 'center'},
					{field:  'xmbm',title:'项目编码',width:79,align:'center'},
			        {field : 'xmmc',title : '项目名称',width : 210,align : 'center'},
			        {field : 'zlc',title : '里程',width : 50,align : 'center'},
			        {field:'jsdj',title:'现技术等级',width:69,align:'center'},
				    {field:'ghlxbh',title:'规划路线编码',width:79,align:'center'},
				    {field:'lsxmlx',title:'项目类型',width:79,align:'center'}
			    ]],
			}); 
		}
		
		function ckxlwjg(){
			var gr=$("#datagrid").datagrid('getSelections');
			
			if(gr.length==0){
				alert("请勾选项目");
				return;
			}
			
		    var xmbm="";
			for(var i=0;i<gr.length;i++){
				xmbm+=gr[i].xmbm+',';
			}
			xmbm=xmbm.substring(0,xmbm.length-1);
			
			parent.xmbm=xmbm;
			
			var title='';
			if(parent.$("#tjfl").val()=='1'){
				title={field:'xzqh',title:'行政区划',width:200,align:'center',fixed:true};
			}else{
				title={field:'lxbm',title:'路线编码',width:200,align:'center',fixed:true};
			}
			
// 			if(parent.$("#nwgxzdj").combobox('getValues').join(',')==''){
// 				alert("请勾选行政等级");
// 				return;
// 			}
			
			parent.$('#grid').datagrid({    
			    url:'/jxzhpt/tjfx/queryKxjcyc.do',
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:parent.y,
			    width:parent.x,
			    queryParams: {
// 			    	'xmsq.nwgxzdj':parent.$("#nwgxzdj").combobox('getValues').join(','),
					'tjfl':parent.$("#tjfl").val(),
					'xmsq.xmbm':xmbm
				},
			    columns:[[
                    title,
			        {field:'count',title:'项目数量',width:150,align:'center'},
                    {field:'ztz',title:'总投资(万元)',width:150,align:'center'},
                    {field:'zbz',title:'总补助(万元)',width:150,align:'center'},
                    {field:'lc',title:'总里程',width:150,align:'center'},
                    {field:'ydlv',title:'优良路率提升比例(%)',width:200,align:'center'},
                    {field:'zrsh',title:'自然损耗(%)',width:200,align:'center'}
			    ]]
				 
			}); 
			
			parent.$('#xmyc').window('destroy');
			
		}
	
		function fhsxtj(){
			$("#cxtj").attr('style','');
			$("#xsdata").attr('style','display:none');
		}
	</script>
	<style type="text/css">
	TD {font-size: 8px;}
	a{text-decoration:none;}
	
	</style>
</head>
<body >
	
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr id='cxtj'>
        		<td align="left" style="padding-left: 5px; padding-top: 10px;height: 330px;">
        			<fieldset id="searchField" style="width:99.3%; text-align: left; vertical-align: middle;height: 330px; padding-bottom:10px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="42" >
        						<td style="width: 100px;">行政区划：</td>
        						<td style="width: 176px;"><select id="xzqh" style="width:170px;"></select></td>
        						<td style="width: 100px;">项目类型：</td>
								<td style="width: 176px;">
									<select id='lsxmlx' name='lsxmlx' style="width: 170px;">
									</select>
								</td>
        						<td style="width: 100px;">项目名称：</td>
        						<td style="width: 146px;"><input id='xmmc' type="text" /></td>
        					</tr>
        					<tr height="42" >
        						<tr height="42">
        						<td>现技术等级：</td>
								<td  width="65px;"><select name="jsdj" id="jsdj" style="width:170px;" ></select></td>
								</select></td>
								<td>项目年份：</td>
        						<td><select id="xmnf" style="width:170px;">
        						</select>
								<td>原路线名称：</td>
        						<td><input id='lxmc' type="text" /></td>
        					</tr>
        					<tr height="42" >
        					
							</tr>
        					<tr height="42" align="center">
                              <td colspan="6">
                               <a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:showAllgsd()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
                              
				              </td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr id='xsdata' style="display: none;">
        		
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            	<a id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:fhsxtj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">返回筛选条件</a>
            	<a id='mybuttion3' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:ckxlwjg()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">查看项目预测</a>
            		<div style="padding-left: 5px;padding-top:5px; font-size:12px;">
            			<table id="datagrid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
