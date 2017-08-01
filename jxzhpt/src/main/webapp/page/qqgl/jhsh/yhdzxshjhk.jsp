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
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<script type="text/javascript">
		$(function(){
			loadGhlx('ghlxbm');
			loadylx('lxbm');
			loadDist1("xzqh",$.cookie("dist"));
			tsdqdx("tsdq");
			xdzt('xdzt');
			zjly("zjly",'yh');
			loadBmbm3('jsdj','技术等级');
			loadGldj('gldj');
			jhxdwhdx("jhxdwh",'yh');
			//xmnf("xmnf");
			urlxmnf2("xmnf",getUrlParame('id'));
			yhxmlx('xmlx');
			YMLib.Var.jdbs=2;
			queryYhdzx();
			loadFileUpload();
		});
		function queryYhdzx(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			if(jhxdwh==null||jhxdwh=='')
				jhxdwh='%';
			var xdzt=$("#xdzt").combobox("getValues").join(",");
			if(xdzt.substr(0,1)==',')
				xdzt=xdzt.substr(1,xdzt.length);
			var zjly=$("#zjly").combobox("getValues").join(",");
			if(zjly.substr(0,1)==',')
				zjly=zjly.substr(1,zjly.length);
			grid.id="grid";
			grid.url="../../../qqgl/queryJhsh2.do";
			var params={'jhsh.xmlx':4,'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.xmmc':$('#xmmc').val(),
					'jhsh.xmnf':xmnf,'jhsh.sfsycgs':$('#sfsycgs').combobox("getValue"),'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.tsdq':tsdq,'jhsh.gyfl':$('#gyfl').val(),
					'jhsh.ghlxbh':$('#lxbm').combotree('getText').toUpperCase( ),'jhsh.lxmc':$('#lxmc').val(),'jhsh.xdzttj':xdzt,'jhsh.zjly':zjly,
					'jhsh.ghxlxbm':$('#ghlxbm').combotree('getText').toUpperCase( ),'jhsh.ghxlxmc':$('#ghlxmc').val(),
					'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.jhxdwh':jhxdwh,'jhsh.scxdnf':1};
			grid.queryParams=params;
			loadLj(params);
			grid.height=$(window).height()-220;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'ck',checkbox:true},
				{field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow1('+"'yhdzxxx'"+','+"'养护大中修项目'"+','+
						"'/jxzhpt/page/qqgl/jhsh/yhdzx_xx2.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">详细</a>'
						//+'&nbsp;<a href="javascript:qxxm('+row.xmbm+')" style="color:#3399CC;">取消</a>'
						;
						return result;
					}
				},
				
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
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'xzqh',title:'行政区划',width:60,align:'center'},
				{field:'xmmc',title:'项目名称',width:150,align:'center',
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
				{field:'jsdj',title:'技术等级',width:70,align:'center'},
				{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
				{field:'qdzh1',title:'原起点桩号',width:100,align:'center'},
				{field:'zdzh1',title:'原止点桩号',width:100,align:'center'},
				{field:'ztz',title:'总投资',width:100,align:'center'},
				{field:'rys',title:'燃油税',width:100,align:'center'},
				{field:'dk',title:'厅贷款',width:100,align:'center'},
				/* {field:'bcztz',title:'总投资',width:100,align:'center',formatter:function(value,row,index){
					return (parseFloat(row.sysbbzj)*100+parseFloat(row.dk)*100+parseFloat(row.rys)*100+parseFloat(row.yqdbcgs)*100)/100;
				}},
				{field:'bcstz',title:'省以上补助资金',width:100,align:'center',formatter:function(value,row,index){
					return (parseFloat(row.sysbbzj)*100+parseFloat(row.dk)*100+parseFloat(row.rys)*100)/100;
				}}, */
				{field:'yqdbcgs',title:'已确定部车购税',width:100,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:120,align:'center',
					formatter: function(value,row,index){
						if($.cookie('unit2').length==7)
							return '<a href="#" style="text-decoration:none;color:#3399CC;" onclick=getWj('+index+',"计划下达文件")>'+value+'</a>';
							else return value; 
						}
				},
				{field:'jhxdsj',title:'计划下达时间',width:100,align:'center'},
				//{field:'gq',title:'工期（月）',width:60,align:'center'},
// 				{field:'tz',title:'总投资',width:60,align:'center'},
				{field:'tsdq',title:'特殊地区',width:100,align:'center'},
				{field:'sjpfwh',title:'施工图批复文号',width:100,align:'center'},
				{field:'jhkgsj',title:'计划开工时间',width:70,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:70,align:'center'}/* , */
				/* {field:'mc',title:'面层结构',width:300,align:'center',
					formatter:function(value,row,index){
						return "路面类型："+row.mclmlx+";面层材料："+row.mclx+";面层数量："+row.mcsl+";面层金额："+row.mcje;
					}
				},
				{field:'jc',title:'基层结构',width:300,align:'center',
					formatter:function(value,row,index){
						return "基层材料："+row.jclx+";基层数量："+row.jcsl+";基层金额："+row.jcje;
					}
				},
				{field:'xfc',title:'下封层结构',width:200,align:'center',
					formatter:function(value,row,index){
						return "下封层数量："+row.xfcsl+";下封层金额："+row.xfcje;
					}
				},
				{field:'gf',title:'灌封',width:200,align:'center',
					formatter:function(value,row,index){
						return "灌封长度："+row.gfcd+";灌封金额："+row.gfje;
					}
				}, */
// 				{field:'llcl',title:'老路处理',width:100,align:'center'}
			]];
			bindLxGrid();
			gridBindyh(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$("#xmsl").html(msg.SL);
						 $("#tz").html(msg.TZ);
						 $("#cgs").html(msg.CGS);
						 $("#rys").html(msg.RYS);
						 $("#dk").html(msg.DK);
						 $("#sjl").html(msg.SJL);
						 $("#lc").html(msg.LC);
						 $("#dftz").html(msg.DFTZ);
					}else{
						$('#spanztz').html("0");
						$('#spansbz').html("0");
						$('#spanbcgs').html("0");
						$('#spanlc').html("0");
					}
					
				}
			});
		}
		function exportJhshxx(){
			/* var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var param='jhsh.xmlx=4&jhsh.xzqhdm='+getxzqhdm('xzqh')+
			'&jhsh.ghlxbh='+$("#lxbm").val()+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",")+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+
			'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.ghxlxbm='+$("#ghlxbm").val()+"&jhsh.ghxlxmc="+$("#ghlxmc").val()+'&jhsh.jhxdwh='+$("#jhxdwh").val()+
			'&jhsh.xmnf='+xmnf;
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzx.do?"+param; */
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			if(jhxdwh==null||jhxdwh=='')
				jhxdwh='%25';
			var xdzt=$("#xdzt").combobox("getValues").join(",");
			if(xdzt.substr(0,1)==',')
				xdzt=xdzt.substr(1,xdzt.length);
			var zjly=$("#zjly").combobox("getValues").join(",");
			if(zjly.substr(0,1)==',')
				zjly=zjly.substr(1,zjly.length);
			var param='jhsh.xmlx=4&jhsh.xzqhdm='+getxzqhdm('xzqh')+
			'&jhsh.ghlxbh='+$("#lxbm").combotree('getText')+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq.replace(/\+/g,"%2B")+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",")+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+
			'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.ghxlxbm='+$("#ghlxbm").combotree('getText')+"&jhsh.ghxlxmc="+$("#ghlxmc").val()+'&jhsh.jhxdwh='+jhxdwh+
			'&jhsh.xmnf='+xmnf+'&jhsh.xdzttj='+xdzt+'&jhsh.zjly='+zjly;
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzxExcel1.do?"+param;
		}
		function exportJhshxx1(){
			/* var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var param='jhsh.xmlx=4&jhsh.xzqhdm='+getxzqhdm('xzqh')+
			'&jhsh.ghlxbh='+$("#lxbm").val()+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",")+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+
			'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.ghxlxbm='+$("#ghlxbm").val()+"&jhsh.ghxlxmc="+$("#ghlxmc").val()+'&jhsh.jhxdwh='+$("#jhxdwh").val()+
			'&jhsh.xmnf='+xmnf;
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzx.do?"+param; */
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			if(jhxdwh==null||jhxdwh=='')
				jhxdwh='%25';
			var xdzt=$("#xdzt").combobox("getValues").join(",");
			if(xdzt.substr(0,1)==',')
				xdzt=xdzt.substr(1,xdzt.length);
			var zjly=$("#zjly").combobox("getValues").join(",");
			if(zjly.substr(0,1)==',')
				zjly=zjly.substr(1,zjly.length);
			var param='jhsh.xmlx=4&jhsh.xzqhdm='+getxzqhdm('xzqh')+
			'&jhsh.ghlxbh='+$("#lxbm").combotree('getText')+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq.replace(/\+/g,"%2B")+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",")+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+
			'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.ghxlxbm='+$("#ghlxbm").combotree('getText')+"&jhsh.ghxlxmc="+$("#ghlxmc").val()+'&jhsh.jhxdwh='+jhxdwh+
			'&jhsh.xmnf='+xmnf+'&jhsh.xdzttj='+xdzt+'&jhsh.zjly='+zjly+'&jhsh.scxdnf='+1;
			
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzxDetailExcel1.do?"+param;
		}
		function importJhsh(){
			importExcelqwh("/jxzhpt/qqgl/importExcelJhxdYhdzx.do","yhjhxd");
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
		<div id="p_top">计划管理>&nbsp;计划查询>&nbsp;<span id="bstext"></span>>&nbsp;养护大中修项目</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
       	<tr>
       		<td align="left" style="padding-left: 10px; padding-right: 10px; padding-top: 5px;">
       			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
       				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
       					<font style="color: #0866A0; font-weight: bold"></font>
       				</legend>
       				<div>
       				<table style="margin:5px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
						<tr height="29">
								<!-- <td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
								<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:100px;" /></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 104px;"></select></td>
        						<td align="right">技术等级：</td>
								<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:104px;"></select></td>
        						<td align="right">行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:104px;" class="easyui-combobox"></select></td> -->
        					<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
								<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:73px;" /></td>	
        						<td align="right">建设性质：</td>
								<td><select name="xmlx" id="xmlx" style="width:80px;" ></select></td>
								<td align="right">技术等级：</td>
								<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:118px;"></select></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 75px;"></select></td>
        					</tr>
        					<tr height="29">
        					
        						<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:150px;" /></td> 
        						<!-- <td align="right">特殊地区：</td>
								<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:150px;"></select></td>
								<td align="right">原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:100px;" /></td>
        						<td align="right">原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:100px;" /></td>
        						<td align="right">规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:100px;" /></td>
        						<td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:100px;" /></td> -->
        						 <td align="right">资金来源：</td>
        						<td><input name="zjly" type="text" id="zjly" style="width:75px;" /></td>
        					
        						<td align="right">行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:80px;" class="easyui-combobox"></select></td>
								<td align="right">原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:118px;" /></td>
        						<td align="right">原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:73px;" /></td>
        						
                            </tr>
                            <tr height="29">
                            
                            <td align="right">规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:150px;" /></td>
        						<td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:73px;" /></td>
        						 <td align="right">是否有补助历史：</td>
								<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:80px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
        						<!-- <td align="right">历史记录：</td>
								<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
								<td align="right">建设性质：</td>
								<td><select name="xmlx" id="xmlx" style="width:104px;" ></select></td>
								<td align="right">是否使用车购税：</td>
								<td><select name="sfsycgs" id="sfsycgs" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
								<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:104px;" /></td> -->
        						<td align="right">是否使用车购税：</td>
								<td><select name="sfsycgs" id="sfsycgs" class="easyui-combobox" style="width:118px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
								 <td align="right">特殊地区：</td>
								<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:75px;"></select></td>
                           
        						</tr>
       					<tr height="29">
       					 <td align="right">管养分类：</td>
        					<td><input name="gyfl" type="text" id="gyfl" style="width:150px;" /></td>
        					<td align="right">下达状态：</td>
        					<td><input name="xdzt" type="text" id="xdzt" style="width:75px;" /></td>
        					</tr><tr height="29">
       						<td colspan="8">
       							
        					
       							<img onclick="queryYhdzx()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
<!-- 								<img onclick="plscbtn()" alt="批量上传计划下达文件" src="../../../images/plsc.png" style="vertical-align:middle;width: 90px;height: 23px;"> -->
								<img onclick="exportJhshxx()" onmouseover="this.src='../../../images/Button/dchz2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dchz1.gif'" src="../../../images/Button/dchz1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img onclick="exportJhshxx1()" onmouseover="this.src='../../../images/Button/dcmx2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcmx1.gif'" src="../../../images/Button/dcmx1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<!-- <img onclick="importJhsh()" alt="删除" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
       						</td>
       					</tr>
        				</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px; font-size:12px;">
           		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		燃油税【<span id="rys" style="color: red;">0</span>】万元,
            		厅贷款【<span id="dk" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方自筹【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
           		<div><table id="grid"></table></div>
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
