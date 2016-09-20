<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
var obj=new Object();
var czzt="";
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
	
	//alert($.cookie("unit"));
	
	if($.cookie("unit")=='11101360000')
		loadUnit1("gydw",'36');
	else
	    loadUnit1("gydw",$.cookie("unit"));
	loadDist1("xzqhmc",$.cookie("dist"));
	kjfldx('akjfl');
	xmnfdx("xmnf"); 
	//jsdjdx('jsdj');
	xzdjdx('gldj');
	tsdqdx('tsdq');
	loadBmbm2("bzls", "补助历史");
	//tsdq("tsdq");
	if(getParam("t")=='1') {
		$('#sbzt').combobox("setValue",'未上报');
	}
	jckglWqgz();
});

function tuihui(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	var id=rows[0].id;
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt!='已审核'){
			alert('请勾选已审核的项目！');
			return;
		}
	}
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
	}
	if(confirm('确定退回到未审核状态？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/wqgzsj/tuihuiWqgzsjById.do",
			 dataType : 'json',
			 data : 'jckwqgzsj.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('退回成功！');
					 jckglWqgz();
				 }else{
					 YMLib.Tools.Show('退回失败！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}

function delJckwqgz(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要删除项目！");
		return;
	}
	var id=rows[0].id;
	for(var i=0;i<rows.length;i++){
		if(rows[i].sbzt2=='已上报'){
			alert("该项目已上报，不能执行删除操作！");
			return false;
		}
	}
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
	}
	if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/wqgzsj/deleteWqgzsjById.do",
				 dataType : 'json',
				 data : 'jckwqgzsj.id=' +id,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 jckglWqgz();
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

function shangb(index){
	if($.cookie("unit2").length==7){
		var data=$("#grid").datagrid('getRows')[index];
		obj=data;
		YMLib.UI.createWindow('lxxx','省级审核','wqgzsj_sh.jsp','lxxx',500,300);
	}else{
		alert("你没有审核权限！");
	}
}

var ob=new Object();
function shenpi(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要审核的项目！");
		return;
	}
	var id=rows[0].id;
	var tsdq=rows[0].tsdq;
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt=="已审核"){
			alert("有项目已审核，请勿重复操作！");
			return ;
		}
	}
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
		tsdq+=","+rows[i].tsdq ;
	}
	ob.id=id;
	ob.tsdq=tsdq;
	YMLib.UI.createWindow('lxxx','省级审核','wqgzsj_sh1.jsp','lxxx',500,300);
}

function shangB(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要上报项目！");
		return;
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
	}
	if(confirm('您确定上报该项目？')){
		var data = "jckwqgzsj.id="+id+"&jckwqgzsj.sbbm="+$.cookie("unit")+"&jckwqgzsj.sbthcd="+($.cookie("unit2").length-2);
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/wqgzsj/xgJckWqgzSbzt.do",
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
function shenghwtg(index){
	var data=$("#grid").datagrid('getRows')[index];
	obj=data;
	alert("未通过原因："+obj.shyj2);
}

var gydwstr;
var xzqhstr;
	function jckglWqgz(){
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
		
		var xmnf=$("#xmnf").combobox("getValues").join(",");
		if(xmnf.substr(0,1)==',')
			xmnf=xmnf.substr(1,xmnf.length);
		
		var gldj=$("#gldj").combobox("getValues").join(",");
		if(gldj.substr(0,1)==',')
			gldj=gldj.substr(1,gldj.length);
		var akjfl=$("#akjfl").combobox("getValues").join(",");
		if(akjfl.substr(0,1)==',')
			akjfl=akjfl.substr(1,akjfl.length);
		var tsdq=$("#tsdq").combobox("getValues").join(",");
		if(tsdq.substr(0,1)==',')
			tsdq=tsdq.substr(1,tsdq.length);
	$("#grid").datagrid({    
		 url:'/jxzhpt/wqgzsj/selectJckShwqgz.do',
		 queryParams : {
			 'sbthcd':function(){
				 if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'qlmc':$("#qlmc").val(),
			 	'xmnf':xmnf,
			 	'sbzt':$("#shzt").combobox("getValue"),
			 	'jsdj':$("#jsdj").combobox("getValue"),
			 	'akjfl':akjfl,
			 	'lxbm':$("#lxbm").val(),
			 	'qlbh':$("#qlbh").val(),
			 	'tsdq':tsdq,
			 	'jckwqgzsj.bzls':$("#bzls").combobox("getValue"),
			 	'jckwqgzsj.gldj':gldj,
			 	'sfylrbwqk':$("#sfylrbwqk").combobox("getValue")
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:50,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href=javascript:locationXm1("'+row.qlbh+'","'+row.akjfl+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckwqgz('+index+') style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sbthcd!=7){
					return '<a href=javascript:shenghwtg('+index+') style="text-decoration:none;color:#3399CC; ">审核未通过</a>  ';
				}else{
					if(row.shzt=="已审核"){
						return '<span style="color:grey;">已审核</span>';
					}else{
						return '<a href=javascript:shangb('+index+') style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
					//return '已审核  ';
					}
				}
				
			}},
			 	{field:'gydw',title:'管养（监管）单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
		        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
		        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
		        {field:'xqlbm',title:'新桥梁编号',width:120,align:'center'},
		        {field:'xqlmc',title:'新桥梁名称',width:120,align:'center'},
		        {field:'xzxzh',title:'新桥梁中心桩号',width:120,align:'center'},
		        {field:'lxbm',title:'路线编码',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'pddj',title:'评定等级',width:140,align:'center'},
		        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
		        {field:'xmnf',title:'入库时间',width:140,align:'center'}
	    ]]    
	});  
	var sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sbthcd=7;
 		}else  sbthcd=$.cookie("unit2").length;
	 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&qlmc="+$("#qlmc").val()+"&tsdq="+tsdq+
	 	"&xmnf="+xmnf+"&sbzt="+$('#shzt').combobox("getValue")+'&jckwqgzsj.bzls='+$("#bzls").combobox("getValue")+'&jckwqgzsj.gldj='+gldj+
	 	"&jsdj="+$("#jsdj").combobox("getValue")+"&akjfl="+akjfl+"&lxbm="+$("#lxbm").val()+
	 	"&qlbh="+$("#qlbh").val()+'&sfylrbwqk='+$("#sfylrbwqk").combobox("getValue");
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/wqgzsj/selectWqgzShCount.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 $("#wqgz1").html(msg);
			 },
		});
	}
	
	function ckwqgz(index){
		var data=$("#grid").datagrid('getRows')[index];
		obj=data;
		YMLib.UI.createWindow('lxxx','危桥详情','wqgzsj_ck.jsp','lxxx',900,450);
	}
	
	function dcExcel(){
		var sbthcd;
	 	if($.cookie("unit2")=='______36'){
	 		sbthcd=7;
	 	}else  sbthcd=$.cookie("unit2").length;
	 	var xmnf=$("#xmnf").combobox("getValues").join(",");
		if(xmnf.substr(0,1)==',')
			xmnf=xmnf.substr(1,xmnf.length);
		
		var gldj=$("#gldj").combobox("getValues").join(",");
		if(gldj.substr(0,1)==',')
			gldj=gldj.substr(1,gldj.length);
		var akjfl=$("#akjfl").combobox("getValues").join(",");
		if(akjfl.substr(0,1)==',')
			akjfl=akjfl.substr(1,akjfl.length);
		var tsdq=$("#tsdq").combobox("getValues").join(",");
		if(tsdq.substr(0,1)==',')
			tsdq=tsdq.substr(1,tsdq.length);
		var data=ata="sbthcd="+sbthcd+"&lxmc="+$('#lxmc').val()+"&qlmc="+$("#qlmc").val()+"&tsdq="+tsdq+
	 	"&xmnf="+xmnf+"&sbzt="+$('#shzt').combobox("getValue")+'&jckwqgzsj.bzls='+$("#bzls").combobox("getValue")+'&jckwqgzsj.gldj='+gldj+
	 	"&jsdj="+$("#jsdj").combobox("getValue")+"&akjfl="+akjfl+"&lxbm="+$("#lxbm").val()+
	 	"&qlbh="+$("#qlbh").val()+'&sfylrbwqk='+$("#sfylrbwqk").combobox("getValue");
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/wqgzsj/dcwqgzsjxmkshExcel.do?'+data;
		 });
	}
</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:6px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">路网项目>&nbsp;项目基础库管理>&nbsp;危桥改造项目(交通局)</div>
		</div>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #cde0f3;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<table style=" margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
								<td>管养（监管）单位：</td>
                              	 <td colspan="3" style="width:220px;"><select id="gydw" style="width:220px">
                              	</select></td>

                              	<td>审核状态：</td>
                              	<td><select id="shzt" style="width:70px"class="easyui-combobox">
                              	<option value="">全部</option>
                              	<option value="未审核">未审核</option>
                              	<option value="已审核">已审核</option>
                              	<option value="审核同意">审核通过</option>
                              	<option value="审核不同意">审核不通过</option>
                              	</select></td>
                             <td>特殊地区：</td>
                              	<td><select id="tsdq" class="easyui-combobox" style="width:70px">
                              	</select></td>
                               <td align="right">路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:70px;" /></td>
        						<td>路线编码：</td>
                              	<td><input type="text" id="lxbm"style="width:70px"/></td>
                              
                       </tr>
                       <tr height="32">
							  <td>行政区划：
                              	 <td colspan="3" style="width:220px;"><select id="xzqhmc" style="width:220px">
                              	</select></td>
                               <td>项目年份：</td>
                              <td><select id="xmnf" style="width:70px">
                              	</select>
                              	</td>
                            <td>评定等级：</td>
                              <td><select id="jsdj" style="width:70px"class="easyui-combobox">
                              	<option value="" selected>全部</option>
								<option value="四类">四类</option>
								<option value="五类">五类</option>
                              </select></td>

                              	<td>大小桥分类：</td>
                              	<td><select id="akjfl" style="width:74px"class="easyui-combobox">
                              	</select></td>
                              <td>桥梁编号：</td>
                              <td>	<input type="text" id="qlbh"style="width:70px"/></td>
                             
                        </tr>
                             <tr height="32">
                             <td>桥梁名称：</td>
                              	<td><input type="text" id="qlmc"style="width:74px"/></td>
                               <td>是否部库：</td>
                              	<td><select id="sfylrbwqk" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 50px">
								<option value="" selected>全部</option>
								<option value="否">否</option>
								<option value="是">是</option>
								</select></td>
								<td>补助历史：</td>
                              	<td><select id="bzls" style="width:70px"class="easyui-combobox">
                              	</select></td>
                              	<td>行政等级：</td>
						   		 <td><select id="gldj" style="width:70px" class="easyui-combobox"></select></td>
						  
                              <td colspan="6">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="jckglWqgz();" style="border-width:0px;cursor: hand;" />
	 							<img name="shenPi" id="shenPi" src="../../../images/Button/sp1.jpg" onmouseover="this.src='../../../images/Button/sp2.jpg'" onmouseout="this.src='../../../images/Button/sp1.jpg'   " src="" onclick="shenpi();" style="border-width:0px;" />
								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuihui();" style="border-width:0px;" />
								<img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" onclick="dcExcel()"/>
                           </td>
                            </tr></table>
					</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="wqgz1" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个危桥改造项目。</td>
        </tr>
	</table>
<!-- 	<tbody id="grid"></tbody> -->
	<div id="grid" width="100%" ></div>
</body>
</html>
