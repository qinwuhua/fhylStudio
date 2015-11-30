<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>

<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
$(function(){
	if($.cookie("unit2").length<11){
		$("#shangBao").attr('style','display: none');
	}
	if($.cookie("unit2").length==11){
		czzt="上报状态";
	}
	if($.cookie("unit2").length==9){
		czzt="初审状态";
	}
	if($.cookie("unit2").length==7){
		czzt="审核状态";
	}
	loadUnit1("gydw",$.cookie("unit"));
	loadDist1("xzqhmc",$.cookie("dist"));
	//afxmnf("xmnf"); 
	loadBmbm2("sbzt", "上报状态");
	loadBmbm2("jsdj", "技术等级");
	loadBmbm2("gldj", "公路等级");
	tsdq("tsdq");
	showAll();
	
});
function showAll(){
	var gydw=$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("unit2")=='_____36')
				gydwstr=36;
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		
	$("#grid").datagrid({    
		 url:'/jxzhpt/aqsmfh/selectXmkaqsmfhXMK.do',
		 queryParams : {
			 	'xmkaqsmfh.sbthcd':function(){
			 		if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'xmkaqsmfh.unitcode': gydwstr,
			 	'xmkaqsmfh.distcode':xzqhstr,
			 	'xmkaqsmfh.roadname' : $('#roadname').val(),
			 	'xmkaqsmfh.jhnf':'',
			 	'xmkaqsmfh.sbzt':$("#sbzt").combobox("getValue"),
			 	'xmkaqsmfh.jsdj':$("#jsdj").combobox("getValue"),
			 	'xmkaqsmfh.roadcode':$("#roadcode").val(),
			 	'xmkaqsmfh.gldj':$("#gldj").combobox("getValue"),
			 	'xmkaqsmfh.tsdq':$("#tsdq").combobox("getText").replace("全部",'')
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-180,
			width:$(window).width()-10,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					if(row.sbthcd>7){
						if(row.sbzt2=='未上报'){
							return '<a href=javascript:locationXm1("'+row.roadcode+'","'+row.roadstart+'","'+row.roadend+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href=javascript:ckXX('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
							'<a href=javascript:editXX('+index+') style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
							'<a href=javascript:delOne('+index+') style="text-decoration:none;color:#3399CC; ">删除</a>  ';
						}else{
							return '<a href=javascript:locationXm1("'+row.roadcode+'","'+row.roadstart+'","'+row.roadend+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href=javascript:ckXX('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
							'<span style="color:grey;">编辑</span>'+
							'<span style="color:grey;">删除</span>';			
						} 
					}else{
						if(row.tbdwdm=='36' && row.shzt!='已审核'){
							return '<a href=javascript:locationXm1("'+row.roadcode+'","'+row.roadstart+'","'+row.roadend+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href=javascript:ckXX('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
							'<a href=javascript:editXX('+index+') style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
							'<a href=javascript:delOne('+index+') style="text-decoration:none;color:#3399CC; ">删除</a>  ';
						}else{
							return '<a href=javascript:locationXm1("'+row.roadcode+'","'+row.roadstart+'","'+row.roadend+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href=javascript:ckXX('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  '+
							'<span style="color:grey;">编辑</span>'+
							'<span style="color:grey;">删除</span>';	
						}
					}
			}},    
			{field:'sbzt',title:czzt,width:180,align:'center',formatter:function(value,row,index){

				if(row.sbzt2=="未上报" && row.sbthbmcd==11){
					if(row.cszt=='未审核'){
						if(row.tsdq.indexOf('省直管试点县')!=-1){
							return '<a href=javascript:shangB1('+index+') style="text-decoration:none;color:#3399CC; ">未上报</a>  &nbsp;  '+'<a href=javascript:showshyj('+index+') style="text-decoration:none;color:#3399CC; ">省级审核未通过</a>  ';
						}
						return '<a href=javascript:shangB1('+index+') style="text-decoration:none;color:#3399CC; ">未上报</a>  &nbsp;  '+'<a href=javascript:showcsyj('+index+') style="text-decoration:none;color:#3399CC; ">市级初审未通过</a>  ';
					}else
					return '<a href=javascript:shangB1('+index+') style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}
				else if(row.sbzt2=="未上报" && row.sbthbmcd==9){
					if(row.shzt=='未审核'){
						return '<a href=javascript:chuS('+index+') style="text-decoration:none;color:#3399CC; ">未初审</a>  &nbsp;  '+'<a href=javascript:showshyj('+index+') style="text-decoration:none;color:#3399CC; ">省级审核未通过</a>  ';
					}else
					return '<a href=javascript:chuS('+index+') style="text-decoration:none;color:#3399CC; ">未初审</a>  ';
					}
				else if(row.sbzt2=="已上报"&&$.cookie("unit2").length==9&&row.sbthbmcd==7){
					return '<span style="color:grey;">已初审</span>';
					}
				else if(row.sbzt2=="已上报"&&$.cookie("unit2").length==11){
					return '<span style="color:grey;">已上报</span>';
					}
				else if($.cookie("unit2").length==7){
					if(row.zszt!='')
						return '<span style="color:grey;">  '+row.zszt+'   </span>';
						else
							return '<span style="color:grey;">  未审核  </span>';	
					
				}
			}},
				//{field:'shzt',title:'审核状态',width:80,align:'center'},
				{field:'roadcode',title:'公路编号',width:80,align:'center'},
		        {field:'roadname',title:'路线名称',width:160,align:'center'},
		        {field:'roadstart',title:'桩号起点',width:120,align:'center'},
		        {field:'roadend',title:'桩号终点',width:120,align:'center'},
		        {field:'jsdj',title:'技术等级',width:120,align:'center'},
		        {field:'gldj',title:'公路等级',width:140,align:'center'},
		        {field:'fangx',title:'方向',width:140,align:'center'},
		        {field:'pcsj',title:'排查时间',width:140,align:'center'},
		        {field:'ldfl',title:'路段分类',width:140,align:'center'},
		        {field:'unit',title:'管养单位',width:140,align:'center'},
		        {field:'dist',title:'行政区划',width:140,align:'center'},
		        {field:'tzgs',title:'处置投资估算',width:140,align:'center'},
		        {field:'jhnf',title:'计划实施安防工程年份',width:140,align:'center'}
		    ]]    
		});  
	loadtj();
	}
	
	function loadtj(){
		var gydw=$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("unit2")=='_____36')
				gydwstr=36;
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var sbthcd;
	 	if($.cookie("unit2")=='______36'){
	 			sbthcd=7;
	 		}else  sbthcd=$.cookie("unit2").length;
	 	var data='xmkaqsmfh.sbthcd='+sbthcd+'&xmkaqsmfh.unitcode='+ gydwstr+'&xmkaqsmfh.distcode='+xzqhstr+'&xmkaqsmfh.roadname=' + $('#roadname').val()+'&xmkaqsmfh.jhnf='+$("#xmnf").combobox("getValue")+
	 	'&xmkaqsmfh.sbzt='+$("#sbzt").combobox("getValue")+'&xmkaqsmfh.jsdj='+$("#jsdj").combobox("getValue")+'&xmkaqsmfh.roadcode='+$("#roadcode").val()+'&xmkaqsmfh.gldj='+$("#gldj").combobox("getValue")+'&xmkaqsmfh.tsdq='+$("#tsdq").combobox("getText").replace("全部",'');
	 	
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/aqsmfh/loadXmkaqsmfhXMKCount.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg!=null){
					 $("#abgc1").html(msg.sbthcd);
					 $("#abgc2").html(msg.zlc);
				 }
			 },
		});
	}
	
	//批量上报
	
	function shangB1(index){
	var id=$("#grid").datagrid('getRows')[index].id;
	var sbthcd;
	if($("#grid").datagrid('getRows')[index].tsdq.indexOf('省直管试点县')!=-1){
		sbthcd=7;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	if(confirm('您确定上报该项目？')){
		var data = "xmkaqsmfh.id="+id+"&xmkaqsmfh.sbthcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/aqsmfh/xgXmkAFSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！'); 
					 $("#grid").datagrid('reload');
					 loadtj();
				 }else{
					 alert('上报失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
	
	function shangB(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要上报项目！");
		return;
	}
	var sbthcd;
	
	if(rows[0].tsdq.indexOf('省直管试点县')!=-1){
		sbthcd=7;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	var id=rows[0].id;
	if($.cookie("unit2")=='______36'){
		alert("对不起，您无法上报！");
		return;
	}
	if($.cookie("unit2").length==7){
		alert("该项目已上报到省级单位，请勿重复操作！");
		return ;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].sbzt2=='已上报'){
			alert("有项目已上报，请勿重复操作！");
			return ;
		}
	}
	
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
		if(rows[i].tsdq.indexOf('省直管试点县')!=-1){
			sbthcd+=","+7;
		}else{
			sbthcd+=","+$.cookie("unit2").length-2;
		}
	}

	if(confirm('您确定上报该项目？')){
		var data = "xmkaqsmfh.id="+id+"&xmkaqsmfh.sbthcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/aqsmfh/xgXmkAFSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#grid").datagrid('reload');
				 }else{
					 alert('上报失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
} 
	var obj=new Object();
	function editXX(index){
		var data=$("#grid").datagrid('getRows')[index];
		obj=data;
		YMLib.UI.createWindow('lxxx','安全生命防护工程编辑','aqsmfh_xg.jsp','lxxx',900,450);
	}
	function ckXX(index){
		var data=$("#grid").datagrid('getRows')[index];
		obj=data;
		YMLib.UI.createWindow('lxxx','安全生命防护工程详情','aqsmfh_ck.jsp','lxxx',900,450);
	}
	function delOne(index){
		if($("#grid").datagrid('getRows')[index].tbbmbm!=$.cookie("unit")||$("#grid").datagrid('getRows')[index].sbzt2=='已上报'){
			alert("该项目不是您添加的或已上报，不能执行删除操作！");
			return false;
		}
		var id=$("#grid").datagrid('getRows')[index].id;
		if(confirm('确定删除所选数据？')){
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/aqsmfh/deleteAfxmkById.do",
					 dataType : 'json',
					 data : 'xmkaqsmfh.id=' +id,
					 success : function(msg){
						 if(msg){
							 alert('删除成功！');
							 showAll();
						 }else{
							 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
			}
	}
	
	function chuS(index){
		obj=$("#grid").datagrid('getRows')[index];
		YMLib.UI.createWindow('lxxx','项目初审','aqsmfh_sh.jsp','lxxx',500,250);
	}
</script>
<style type="text/css">
TD {
font-size: 12px;margin:0px;padding:0px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:6px;}
</style>
</head>
<body>
		<div id="righttop">
		<div id="p_top">路网项目>&nbsp;项目基础库管理>&nbsp;安全生命防护工程</div>
		</div>

	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr><td>
		
		</td></tr>
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #cde0f3;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
				<div>
						<table style=" margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="32">
							  <td>管养单位：</td>
							  <td colspan="3" style="width:220px;"><select  id="gydw" style="width:220px;" ></select></td>
							  <td>行政区划：</td>
							  <td colspan="3" style="width:220px"><select id="xzqhmc" style="width:220px"></select></td>
							  
							  <td>路线编码：</td>
							  <td><input type="text" id="roadcode"  style="width:100px;" /></td>
							  <td></td>
							  <td></td>
							</tr>
							<tr  height="32">
							  <!-- <td>项目年份：</td>
							  <td><select id="xmnf" style="width:70px"></select></td> -->
							  <td>上报状态：</td>
							  <td>
								  <select id="sbzt"  style="width:70px"class="easyui-combobox"></select>
								  <select id="xmtype" style="width:70px; display: none;"></select>
							  </td>
							  <td>特殊地区：</td>
							  <td><select id="tsdq" style="width:70px"class="easyui-combobox"></select></td>
							  <td>技术等级：</td>
							  <td><select id="jsdj" style="width:70px"class="easyui-combobox"></select></td>
							  <td>公路等级：</td>
							  <td><select id="gldj" style="width:70px" class="easyui-combobox"></select></td>
							  <td>路线名称：</td>
							  <td><input type="text" id="roadname"  style="width:100px;" /></td>
							</tr>
							<tr   height="32">
							  <td colspan="10">
							 	<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="showAll();" style="border-width:0px;cursor: hand;" />
								<img name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   "onclick="shangB()"  style="border-width:0px;" />
<!--                                 <img name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addJck('aqsmfh_add.jsp','900','450');" style="border-width:0px;" /> -->
                                <img name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="delJckwqgz();" style="border-width:0px;" />
                                <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" onclick="dcExcel()"/>
							  </td>
							 </tr>
							</table>
						</div>
					</fieldset>
					</td>
					</tr>
			<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="abgc1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安保工程项目.
<!--         					总里程共【&nbsp;<span id="abgc2" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里。</td> -->
       	 	</tr>
		</table>
		<div id="grid" width="100%" ></div>
</body>
</html>
