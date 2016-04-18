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
	<script type="text/javascript" src="../../../js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="../../../js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<script type="text/javascript">
		$(function(){
			//根据用户等级展示按钮
			if(userPanduan($.cookie("unit2"))=="省"){
				$.each($("[name='sheng']"),function(index,item){
					$(item).show();
				});
				$.each($("[name='dishi']"),function(index,item){
					$(item).hide();
				});
				$('#ztspan').html("审核状态");
				$('#项目计划库管理').html("项目立项审核");
			}else if(userPanduan($.cookie("unit2"))!="省"){
				$.each($("[name='sheng']"),function(index,item){
					$(item).hide();
				});
				$.each($("[name='dishi']"),function(index,item){
					$(item).show();
				});
				$('#ztspan').html("上报状态");
			}
			//xmnf("xmnf");
			urlxmnf("xmnf",getUrlParame('id'));
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm2('jb','级别');
			loadBmbm2('jsxz','建设性质2');
			YMLib.Var.jdbs=1;
			if(userPanduan($.cookie("unit2"))!="省"){
				loadBmbm2('sqzt','申请状态地市');
			}else{
				loadBmbm2('sqzt','申请状态省');
			}
			queryYhzx();
		});
		function queryYhzx(){
			grid.id="grid";
			grid.url="../../../qqgl/queryXmsq.do";
			var params={'xmlx':6,'gydwdm':getgydw('gydw'),'xzqhdm':getxzqhdm('xzqh'),
					'lxmc':$('#lxmc').val(),'jsxz':$('#jsxz').combobox("getValue"),
					'jb':$('#jb').combobox("getValue"),'xmmc':$('#xmmc').val(),
					'xmbm':$('#xmnf').combobox("getValues").join(','),
					"ydbmc":$('#ydbmc').val()};
			var sqzt = $('#sqzt').combobox("getValue");
			
			if(userPanduan($.cookie("unit2"))!="省"){
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}
			loadLj(params);
			grid.queryParams=params;
			grid.height=$(window).height()-160;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{rowspan:2,field:'ck',checkbox:true},
				{rowspan:2,field:'cz',title:'操作',width:150,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','1'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'yhzxxx'"+','+"'养护中心项目'"+','+
								"'/jxzhpt/page/qqgl/jhsh/yhzx_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
							result+='&nbsp;<a href="javascript:openWindow('+"'yhzxedit'"+','+"'养护中心项目'"+','+
							"'/jxzhpt/page/qqgl/jhsh/yhzx_edit.jsp'"+',980,400)" style="color:#3399CC;">编辑</a>';
						return result;
					}
				},
				{rowspan:2,field:'sqzt',title:'上报状态',width:100,align:'center',
					formatter:function(value,row,index){
						var result="";
						if(userPanduan($.cookie('unit2'))!="省"){
							if(Number(value)==Number($.cookie('unit2').length)){
								result="已上报";
							}else if(Number(value)>0 && Number(value)<Number($.cookie('unit2').length)){
								result="已审核";
							}else if(Number(value)==0 || Number(value)>Number($.cookie('unit2').length)){
								result='<a href="javascript:sb('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">未上报</a>';
							}
						}else if(userPanduan($.cookie('unit2'))=="省"){
							if(Number(value)==Number($.cookie('unit2').length)){
								result="已审核";
							}else if(Number(value)==9){
								result='<a href="javascript:sp('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">未审核</a>';
							}else{
								result="未上报";
							}
						}
						return result;
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
				url:'../../../qqgl/queryLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						if(msg.NTZ!=null)
						$('#spanntz').html(msg.NTZ);
						else
							$('#spanntz').html('0');
						$("#xmsl").html(msg.BZ);
					}else{
						$('#spanntz').html('0');
						$("#xmsl").html('0');
					}
				}
			});
		}
		function deleteYhzx(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt!=0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能删除未申请的信息！");
				return;
			}
		if(confirm('确定删除该项目？')){
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/deleteXmsq.do',
					data:'xmlx='+6+'&xmbm='+xmbm,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("删除成功!");
							queryYhzx();
						}
					}
				});
			}else{
				alert("请选择要删除的信息！");
			}
			}
		}
		
		function sb(xmbm){
			if(confirm('确定上报该项目？')){
			$.ajax({
				type:'post',
				url:'../../../qqgl/updateXmsqSbzt.do',
				data:'xmlx='+6+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("上报成功!");
						queryYhzx();
					}
				}
			});
			}
		}
		
		
		function batchSb(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt!=0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能上报未上报过的项目！");
				return;
			}
		if(confirm('确定上报该项目？')){
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/updateXmsqSbzt.do',
					data:'xmlx='+6+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("上报成功!");
							queryYhzx();
						}
					}
				});
			}else{
				alert("请选择要上报的信息！");
			}
		}
		}
		
		function sp(xmbm){
			if(confirm('确定审核该项目？')){
			$.ajax({
				type:'post',
				url:'../../../qqgl/updateYhzxSp.do',
				data:'xmlx='+6+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("审核成功!");
						queryYhzx();
					}
				}
			});
			}
		}
		function batchSp(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt==7 || item.sqzt==0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能审批未通过的项目！");
				return;
			}
		if(confirm('确定审批该项目？')){
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/updateYhzxSp.do',
					data:'xmlx='+6+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("审核成功!");
							queryYhzx();
						}
					}
				});
			}else{
				alert("请选择要上报的信息！");
			}
			}
		}
		
		function exportXmsq(){
			var sqzt = $('#sqzt').combobox("getValue");
			if(userPanduan($.cookie("unit2"))!="省"){
				sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				sqzt=sqzt=='' ? -1 : sqzt;
			}
			var param='xmlx=6&sqzt='+sqzt+'&xzqhdm='+getxzqhdm('xzqh')+'&gydwdm='+getgydw("gydw")+
			'&xmbm='+$('#xmnf').combobox("getValues").join(',')+'&jb='+$('#jb').combobox("getValue")+
			'&xmmc='+$('#xmmc').val()+'&jsxz='+$('#jsxz').combobox("getValue")+
			'&ydbmc='+$('#ydbmc').val();
			window.location.href="/jxzhpt/qqgl/exportExcelXmsq.do?"+param;
		}
		
		function openYhzx(){
			openWindow("yhzxadd","添加养护中心项目","yhzxAdd.jsp",980,400);
		}
		
		function loadGcfl(id,name){
			$.ajax({
				type:'post',
				url:'/jxzhpt/xtgl/getBmbmTreeByName2.do',
				data:'yhm='+ encodeURI(encodeURI(name)),
				dataType:'json',
				async:false,
				success:function(msg){
					$('#' + id).combobox({
						data:msg,
						valueField : 'bmid',
						textField : 'name',
						panelHeight:'auto',
						multiple:true
					});
				}
			});
		}
		
		$(window).resize(function () { 
			$('#grid').datagrid('resize');
		});
		
		function tuiHui(){
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要退回项目！");
				return;
			}
			if($.cookie("unit2").length!=7){
				alert("您不是省级用户");
				return;
			}
			for(var i=0;i<rows.length;i++){
			if(rows[i].sqzt=='7'){
				alert("已审核的项目无法退回！");
				return;
			}
			}
			var id=rows[0].id;
			var xmbm=rows[0].xmbm;
			for(var i=1;i<rows.length;i++){
				xmbm+=","+rows[i].xmbm;
			}
			if(confirm('确定退回该项目？')){
			for(var i=0;i<rows.length;i++){
			if(rows[i].sqzt=='9'){
				var data = "lxsh.xmbm="+xmbm+"&lxsh.bz=yhzx";
				//在可行性中是否已经操作过
				$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/thxmsqsh.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
						 if(msg){
							 alert('退回成功！');
							 $("#grid").datagrid('reload');
						 }else{
							 alert('退回失败,请选择要退回项目！');
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
				return;
			}
		}
			}
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">前期管理>&nbsp;<span id="spantitle">项目立项</span>>&nbsp;<span id='bstext'></span>>&nbsp;养护中心项目</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
       	<tr>
       		<td align="left" style="padding-left: 10px; padding-right: 10px;">
       			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
       				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
       					<font style="color: #0866A0; font-weight: bold"></font>
       				</legend>
       				<div>
       					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
       						<tr height="32">
       							<td>项目年份：</td>
       							<td><select id="xmnf" style="width: 70px;"></select></td>
       							<td>&nbsp;管养单位：</td>
       							<td><select id="gydw" style="width:170px;"></select></td>
       							<td>&nbsp;行政区划：</td>
       							<td><select id="xzqh" style="width:124px;"></select></td>
       							<td>&nbsp;建设性质：</td>
       							<td><select name="jsxz" class="easyui-combobox" id="jsxz" style="width:81px;"></select></td>
       							<td>&nbsp;级别：</td>
	       						<td><select name="jb" class="easyui-combobox" id="jb" style="width:100px;"></select></td>
       						</tr>
       						<tr height="32">
       							<td><span id="ztspan">上报状态</span>：</td>
       							<td><select id="sqzt" class="easyui-combobox" style="width: 70px;"></select></td>
       							<td>&nbsp;项目名称：</td>
       							<td><input name="xmmc" id="xmmc" style="width:120px;" type="text"/></td>
       							<td>路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
        						<td>原道班名称：</td>
        						<td><input type="text" id="ydbmc" style="width:95px;" /></td>
       						</tr>
       						<tr>
       							<td colspan="8">
       								<img onclick="queryYhzx()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
									<img id="sb" name="dishi" alt="上报" onclick="batchSb()" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='../../../images/Button/shangbao_1.png'" src="../../../images/Button/shangbao_1.png"/>
									<img id="tj" name="dishi" alt="添加" onclick="openYhzx()" style="disborder-width:0px;cursor: hand;vertical-align:middle;" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src=""/>
									<img id="sc" name="dishi" alt="删除" onclick="deleteYhzx()" style="vertical-align:middle;" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'">
									<img id="sp" name="sheng" alt="审批" onclick="batchSp()" style="display:none;border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/sp2.jpg'" alt="上报" onmouseout="this.src='../../../images/Button/sp1.jpg'" src="../../../images/Button/sp1.jpg"/>
					                <img id="th" name="sheng" alt="退回" onclick="tuiHui()" style="display:none;vertical-align:middle;" alt="退回" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'"/>
					                <img id="dcExcel" name="sheng" onclick="exportXmsq()" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
       							</td>
       						</tr>
       					</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
           		<div>
           			<div>项目数量【<span id="xmsl" style="color: red;">0</span>】投资额累计【<span id="spanntz" style="color: red;">0</span>万元】</div>
           			<table id="grid"></table>
           		</div>
           	</td>
       	</tr>
	</table>
</body>
</html>
