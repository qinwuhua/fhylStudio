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
	var xmbm;
	var xmlx;
	function tz(id,lx){
		xmbm=id;
		xmlx=lx;
		YMLib.UI.createWindow('wq_tz','项目变更',"xm_tz.jsp",'wq_tz',500,200);
	}
		$(function(){
			if($.cookie("unit2").length!=7)
				$("img[name='bxs']").attr('style','display:none');
			loadDist1("xzqh",$.cookie("dist"));
			tsdqdx("tsdq");
			loadBmbm3('yjsdj','技术等级');
			loadBmbm3('gjhjsdj','技术等级');
			loadGldj('gldj');
			//xmnf("xmnf");
			xmnfdx("xmnf");
			YMLib.Var.jdbs=2;
			if($.cookie("dist")!="360000"){
				$('#btnShangbao').hide();
				//$('#drExcel').hide();
			}
			queryShxm();
		});
		function queryShxm(){
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			grid.id="grid";
			grid.url="../../../qqgl/queryCbsj.do";
			//alert();
			var params={'cbsj.xmlx':5,
					'cbsj.xzqhdm':getxzqhdm('xzqh'),
					'cbsj.ghlxbh':$('#txtlxbm').val(),
					'cbsj.xmmc':$('#xmmc').val(),
					"cbsj.jdbs":2,
					'cbsj.xjsdj':$('#yjsdj').combo("getValues").join(","),
					//'cbsj.jsjsdj':$('#gjhjsdj').combo("getValues").join(","),
					'cbsj.sbzt':-1,
					'cbsj.shzt':$('#shzt').combo("getValue"),
					'cbsj.xmbm':$('#xmnf').combobox("getValues").join(','),
					'tsdq':tsdq,
					'ghlxbm':$("#ghlxbm").val(),
					'ghlxmc':$("#ghlxmc").val(),
					'lxmc':$("#txtlxmc").val(),
					'lsjl':$('#lsjl').combobox("getValue"),
					'ylxbh':$('#gldj').combobox("getValues").join(',')};
			loadLj(params);
			grid.queryParams=params;
			grid.height=$(window).height()-$('#searchField').height()-55;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'ck',checkbox:true},
				
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
				{field:'xmnf',title:'项目年份',width:60,align:'center',
					formatter: function(value,row,index){
		        		return row.xmbm.substr(0,4);
		        	}
				},
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
				{field:'jsjsdj',title:'技术等级',width:80,align:'center'},
				{field:'ghlxbh',title:'路线编码',width:60,align:'center'},
				{field:'qdzh',title:'起点桩号',width:70,align:'center'},
				{field:'zdzh',title:'止点桩号',width:70,align:'center'},
				{field:'sjpfwh',title:'设计批复文号',width:100,align:'center'},
				{field:'kgsj',title:'开工时间',width:70,align:'center'},
				{field:'wgsj',title:'完工时间',width:70,align:'center'},
				{field:'gq',title:'工期（月）',width:60,align:'center'},
				{field:'ntz',title:'总投资',width:60,align:'center'},
				{field:'tsdq',title:'特殊地区',width:120,align:'center'},
				{field:'jsxz',title:'建设性质',width:80,align:'center'},
				/* {field:'kgsj',title:'开工时间',width:100,align:'center'},
				{field:'wgsj',title:'完工时间',width:100,align:'center'}, */
				
				{field:'sjdw',title:'设计单位',width:100,align:'center'},
				
				{field:'pfsj',title:'批复时间',width:100,align:'center'}]];
			gridBind1(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryCbsjLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					 $("#xmsl").html(msg.SL);
					 $("#tz").html(msg.TZ);
					 $("#cgs").html(msg.BZYS);
					 $("#sbz").html(msg.SBZ);
					 $("#sjl").html(msg.SJL);
					 $("#lc").html(msg.LC);
					 $("#dftz").html(msg.DFTZ);
				}
			});
		}
		function sh(xmbm){
			$.ajax({
				type:'post',
				url:'../../../qqgl/shCbsjByXmbm.do',
				data:'xmlx='+5+'&xmbm='+xmbm+'&shzt='+1+'&jdbs='+YMLib.Var.jdbs,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("审核成功!");
						queryShxm();
					}
				}
			});
		}
		function batchSh(){
			if(selArray.length!=0){
				var xmbm="",sbzt="",shzt="";
				var sels =$('#grid').datagrid("getSelections");
				var submit=true;
				$.each(sels,function(index,item){
					if(item.shzt==1){
						submit=false;
					}
					if(index==sels.length-1){
						xmbm+=item.xmbm;
						//shzt+="1";
					}else{
						xmbm+=item.xmbm+",";
						//shzt+="1,";
					}
				});
				if(!submit){
					alert("只能审核未审核的计划！");
					return;
				}
				$.ajax({
					type:'post',
					url:'../../../qqgl/shCbsjByXmbm.do',
					data:'xmlx='+5+'&xmbm='+xmbm+'&shzt='+1+'&jdbs='+YMLib.Var.jdbs,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("审核成功!");
							queryShxm();
						}
					}
				});
			}else{
				alert("请选择要审核的信息！");
			}
		}
		function exportCbsj(){
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var lxmc = $("#txtlxmc").val();
			var ghlxmc=$("#ghlxmc").val();
			var ghlxbm=$("#ghlxbm").val();
			var param='xmlx=5&shzt='+$('#shzt').combo("getValue")+'&xzqhdm='+getxzqhdm('xzqh')+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&ghlxbh='+$('#txtlxbm').val()+'&xjsdj='+$('#yjsdj').combo("getValues").join(",")+
			'&tsdq='+tsdq+'&lsjl='+$('#lsjl').combobox("getValue")+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+
			'&ghlxmc='+ghlxmc+'&ghlxbm='+ghlxbm+'&lxmc='+lxmc;
			window.location.href="/jxzhpt/qqgl/exportExcelCbsj.do?"+param;
		}
		function importXmsq(){
			importExcel("/jxzhpt/qqgl/importExcelShCbsj.do","shcbsj");
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
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
		<div id="p_top">前期管理>&nbsp;工程初步设计>&nbsp;<span id="bstext"></span>>&nbsp;灾毁重建</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
								<tr height="32">
	        						<!-- <td>行政区划：</td>
	        						<td><select id="xzqh" style="width:160px;"></select></td>
	        						<td style="text-align: right;">原路线编码：</td>
	        						<td><input name="txtlxbm" type="text" id="txtlxbm" style="width:100px;" /></td>
	        						<td style="text-align: right;">原路线名称：</td>
	        						<td><input name="txtlxmc" type="text" id="txtlxmc" style="width:100px;" /></td>
									<td style="text-align: right;">原技术等级：</td>
									<td><select name="yjsdj" id="yjsdj" class="easyui-combobox" style="width:70px;"></select></td>
									<td style="text-align: right;">建设技术等级：</td>
									<td><select name="yjsdj" id="gjhjsdj" class="easyui-combobox" style="width:70px;"></select></td>
									<td style="text-align: right;">历史记录：</td>
									<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:69px;">
										<option value="" selected="selected">全部</option>
										<option value="是">是</option>
										<option value="否">否</option>
									</select></td> -->
									<td>行政区划：</td>
	        						<td><select id="xzqh" style="width:160px;"></select></td>
	        						<td style="text-align: right;">项目名称：</td>
	        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
	        						<td style="text-align: right;">原技术等级：</td>
									<td><select name="yjsdj" id="yjsdj" class="easyui-combobox" style="width:70px;"></select></td>
									<td style="text-align: right;">项目年份：</td>
	        						<td><select id="xmnf" style="width: 100px;"></select></td>
	        						<td style="text-align: right;">原行政等级：</td>
									<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
									</tr>
	        					<tr height="32">
	        					<td style="text-align: right;">原路线编码：</td>
	        						<td><input name="txtlxbm" type="text" id="txtlxbm" style="width:100px;" /></td>
	        					
	        						<!-- <td>特殊地区：</td>
									<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:160px;"></select></td>
									<td style="text-align: right;">项目年份：</td>
	        						<td><select id="xmnf" style="width: 100px;"></select></td>
									<td style="text-align: right;">项目名称：</td>
	        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
									<td style="text-align: right;">原行政等级：</td>
									<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
									<td align="right">审核状态：</td>
	        						<td><select id="shzt" style="width:70px;" class="easyui-combobox">
										<option selected="selected" value="-1">全部</option>
										<option value="0">未审核</option>
										<option value="1">已审核</option>
									</select></td> -->
									<td>原路线名称：</td>
	        						<td><input name="txtlxmc" type="text" id="txtlxmc" style="width:100px;" /></td>
									<td>规划路线编码：</td>
	        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
	        						<td>规划路线名称：</td>
	        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
	        						<td style="text-align: right;">补助历史：</td>
									<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:69px;">
										<option value="" selected="selected">全部</option>
										<option value="是">是</option>
										<option value="否">否</option>
									</select></td>
								</tr>
								<tr height="32">
								
									<td>特殊地区：</td>
									<td><select id="tsdq" style="width:100px;" class="easyui-combobox">
										
									</select></td> 
									<!-- <td>规划路线编码：</td>
	        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
	        						<td>规划路线名称：</td>
	        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td> -->
	        						<td>审核状态：</td>
	        						<td><select id="shzt" style="width:70px;" class="easyui-combobox">
										<option selected="selected" value="-1">全部</option>
										<option value="0">未审核</option>
										<option value="1">已审核</option>
									</select></td>
									<td colspan="10">
										<img onclick="queryShxm()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/>
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
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
</body>
</html>
