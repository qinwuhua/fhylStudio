/**
 * 管养单位下拉框
 * @param id
 */
function gydwComboxTree(id){
	loadUnit(id,$.cookie("unit"));
}
function getgydw(id){
	var result="";
	var gydws = $("#"+id).combotree("getValues");
	if(gydws.length==0){
		result=$.cookie("unit2");
	}else{
		result=gydws.join(',');
	}
	return result;
}
function getxzqhdm(id){
	var result="";
	var xzqhs = $("#"+id).combotree("getValues");
	if(xzqhs.length==0){
		result=$.cookie("dist2");
	}else{
		result=xzqhs.join(',');
	}
	return result;
}
function radioChecked(name,value){
	$.each($("input[name='"+name+"']"),function(index,item){
		if($(item).val()==value){
			$(item).attr('checked','true');
		}
	});
}
function onclickXx(xmlx,id){
	var url="/jxzhpt/page/jhgl/jhkxx/";
	if(xmlx=="路面改建")
		url+="gclmgj.jsp";
	else if(xmlx=="路面升级")
		url+="gclmsj.jsp";
	else if(xmlx=="水毁项目")
		url+="shxm.jsp";
	else if(xmlx=="养护大中修")
		url+="yhdzx.jsp";
	else if(xmlx=="安保工程")
		url+="abgc.jsp";
	else if(xmlx=="灾害防治")
		url+="zhfz.jsp";
	else if(xmlx=="危桥改造"){
		url+="wqgz.jsp";
	}
	parent.YMLib.Var.jhbm=id;
	parent.YMLib.Var.bz="xx";
	parent.YMLib.UI.createWindow('xmxx_xx',xmlx,url,'xmxx',1000,500);
}
function sbnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
	$('#'+id).combobox("setValue",first);
}
/**
 * 行政区划下拉框
 * @param id
 */
function xzqhComboxTree(id){
	loadDist(id,"360000");
}
function jhnf(id,url){
	$('#'+id).combobox({    
	    url:url,
	    valueField:'text',    
	    textField:'text'   
	}); 
}
function tsdq(id){
	$('#'+id).combobox({    
	    url:'../../../jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	}); 
}
function AddWqgz(){
	openDialog("wqgz_xx", "添加危桥改造计划库信息", "../add/wqgzAdd.jsp");
}
function AddAbgc(){
	openDialog("abgc_xx", "添加安保工程计划库信息", "../add/abgcAdd.jsp");
}
function Addzhfz(){
	openDialog("zhfz_xx", "添加灾害防治计划库信息", "../add/zhfzAdd.jsp");
}
//步骤(xx,sh)   点击详细时对应的ID   资金下达的ID
var bz,xxId,zjId;
/**
 * 弹出详细信息层
 * @param id ID
 * @param title 标题
 * @param href url路径
 */
function openDialog(id,title,href){
	bz=id.substring(id.indexOf('_')+1);
	rowDate = gridObj.datagrid("getSelected");
	xxId=rowDate.id;
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : 1000,
		height : 500,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true,
	}).dialog("setTitle",title).dialog("open");
}
function openAdd(id,title,href){
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : 1000,
		height : 500,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true
	}).dialog("setTitle",title).dialog("open");
}
var zjxddiv;
function openZjxd(id,title,href,width,height,zjid){
	zjId=zjid;
	bz=id;
	zjxddiv = $('<div></div>').dialog({
		iconCls : 'icon-edit',
		href:href,
		width : width,
		height : height,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true,
		onClose:function(){
			$(this).dialog('destroy',false);
		}
	}).dialog("setTitle",title).dialog("open");
}
function addZjxd(){
	var zjxd={'zjxd.xmid':xxId,'zjxd.xdnf':$('#zjxdnf').combobox("getValue"),'zjxd.xdzj':$('#xdzj').val(),
			'zjxd.btzzj':$('#btzzj').val(),'zjxd.sfzj':$('#sfzj').val(),'zjxd.tbdw':$('#tbdw').html(),
			'zjxd.tbtime':$('#tbsj').html(),'zjxd.stz':$('#stz').val(),'zjxd.jhxdwh':$('#jhxdwh').val()};
	$.ajax({
		type:'post',
		url:'../../../jhgl/addZjxd.do',
		dataType:'json',
		data:zjxd,
		success:function(data){
			alert("添加成功！");
			closezjxd();
			queryZjxdList('../../../jhgl/queryZjxdByXmId.do');
		}
	});
}
//excel模板导出
//审查库模板导出
function exportModule(filename){
	YMLib.UI.createWindow('exportChooseDw','按单位导出模板','/jxzhpt/page/chooseDw.jsp?filename='+filename,'exportChooseDw',400,300);
	//window.location.href="/jxzhpt/xtgl/getModule_sc.do?moduleName="+filename;
}
//导出excel
function exportExcel(flag){
	var param=JSON.stringify(queryParams);
	param=param.replace(/null/g,'').replace(/undefined/g,'');
	param=param.substring(1, param.length-1);
	if(flag=='abgc'){
		//param="jh.sbzt="+$("#ddlSHZT").val()+"&jh.spzt="+""+"&jh.jhnf="+$('#sbnf').combobox('getValue')+"&jh.jhkgsj="+""+"&jh.jhwgsj"+""+"&jh.pfztz"+""+"&lx.gydw="+$('#gydw').combotree('getText')+"&lx.gydwdm="+$('#gydw').combotree('getValue')+"&lx.xzqhmc="+$('#xzqh').combotree('getText')+"&lx.xzqhdm="+$('#xzqh').combotree('getValue')+"&lx.lxmc="+$("#txtRoad").val();
		window.location.href="/jxzhpt/jhgl/exportExcel_jh_abgc.do?flag="+flag+"&"+param;
	}
	if(flag=='wqgz'){
		//param="jh.sbnf="+$('#sbnf').val()+"&jh.sbzt="+$('#sbzt').val()+"&jh.spzt="+""+"&jh.gydw="+$('#gydw').combotree('getText')+"&xzqhdm="+$('#xzqh').combotree('getValue')+"&jh.lxmc="+$("#txtRoad").val()+"&jh.jsdj="+$('#jsdj').val()+"&jh.qlmc="+$('#qlmc').val();
		window.location.href="/jxzhpt/jhgl/exportExcel_jh_wqgz.do?flag="+flag+param;
	}
	if(flag=='zhfz'){
		//param="jh.sbnf="+$('#sbnf').val()+"&jh.sbzt="+$('#sbzt').val()+"&jh.spzt="+""+"&jh.gydw="+$('#gydw').combotree('getText')+"&xzqhdm="+$('#xzqh').combotree('getValue')+"&jh.lxmc="+$("#txtRoad").val()+"&jh.jsdj="+$('#jsdj').val()+"&jh.qlmc="+$('#qlmc').val();
		window.location.href="/jxzhpt/jhgl/exportExcel_jh_zhfz.do?flag="+flag+"&"+param;
	}
}
//excel审查库数据导入
function importData_jh(flag){
	var url="";
	if(flag=='wqgz_jh'){
		url="/jxzhpt/jhgl/importWqgz_jh.do";
	}
	if(flag=='abgc_jh'){
		url="/jxzhpt/jhgl/importAbgc_jh.do";
	}
	if(flag=='zhfz_jh'){
		url="/jxzhpt/jhgl/importZhfz_jh.do";
	}
	if(flag=='gcgj_jh'){
		url="/jxzhpt/jhgl/importGcgj_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='gcsj_jh'){
		url="/jxzhpt/jhgl/importGcsj_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='shuih_jh'){
		url="/jxzhpt/jhgl/importShuih_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='yhdzx_jh'){
		url="/jxzhpt/jhgl/importYhdzx_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='hsly_jh'){
		url="/jxzhpt/jhgl/importHsly_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='gcsj_zjxd'){
		url="/jxzhpt/jhgl/importGcsj_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="gcgj_zjxd"){
		url="/jxzhpt/jhgl/importGcgj_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="shuih_zjxd"){
		url="/jxzhpt/jhgl/importShuih_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="yhdzx_zjxd"){
		url="/jxzhpt/jhgl/importYhdzx_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="abgc_zjxd"){
		url="/jxzhpt/jhgl/importAbgc_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="wqgz_zjxd"){
		url="/jxzhpt/jhgl/importWqgz_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="zhfz_zjxd"){
		url="/jxzhpt/jhgl/importZhfz_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="hsly_zjxd"){
		alert(flag);
		url="/jxzhpt/jhgl/importHsly_zjxd.do?gydwdm="+$.cookie("unit");
	}
	//YMLib.UI.createWindow('wqxx1','车购税资金到位情况','/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+flag,'wqxx1',450,400);
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+flag,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function closezjxd(){
	$(zjxddiv).dialog('destroy',false);
}
function closeWindow(id){
	$('#'+id).dialog("close");
}
function queryZjxdSumByXmid(){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryZjxdSumByXmid.do',
		data:'zjxd.xmid='+xxId,
		dataType:'json',
		success:function(data){
			if(data!=null){
				$('#lblTzCount').html(data.xmid);
				$('#lblxfzjzj').html(data.xdzj);
			}
		}
	});
}
function queryZjxdList(url){
	var params={'zjxd.xmid':xxId};
	queryZjxdSumByXmid();
	$('#zjxdList').datagrid({
		url : url,
		queryParams : params,
		striped : true,
		pagination : true,
		rownumbers : true,
		pageNumber : 1,
		pageSize : 3,
		height : 140,
		fitColumns:true,
		columns : [[
		{field : 'cz',title : '操作',width : 120,align : 'center',
			formatter : function(value, row, index) {
				var p1="'zjxd',",p2="'资金下达',",p3="'../zjxd/zjxd_edit.jsp',",p4="'800',",
					p5="'250'",p6=",'"+row.id+"'";
				var result = '<a href="javascript:openZjxd('+p1+p2+p3+p4+p5+p6+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				result += '<a href="javascript:dropZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				if (row.sfzj == "0") {
					return "否";
				} else {
					return "是";
				}
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '下达总资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'jhxdwh',title : '计划下达文号',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}
		]]
	});
}
function dropZjxdById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/dropZjxdById.do',
		dataType:'json',
		data:'zjxd.id='+id,
		success:function(data){
			if(data.result=="true"){
				alert("删除成功！");
				queryZjxdSumByXmid();
				$('#zjxdList').datagrid("reload",{'zjxd.xmid':xxId});
			}else{
				alert("删除失败！");
			}
		}
	});
}
function editZjxd(){
	var zjxd={'zjxd.id':zjId,'zjxd.xdnf':$('#zjxdnf').combobox('getValue'),
			'zjxd.btzzj':$('#btzzj').val(),'zjxd.xdzj':$('#xdzj').val(),'zjxd.tbdw':$('#tbdw').html(),
			'zjxd.tbtime':$('#tbsj').html()};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editZjxdById.do',
		dataType:'json',
		data:zjxd,
		success:function(data){
			if(data.result=="true"){
				alert("修改成功！");
				closezjxd();
				$('#zjxdList').datagrid("reload",{'zjxd.xmid':xxId});
			}else{
				alert("修改失败！");
			}
		}
	});
}
function roleName(){
	if($.cookie("unit2").length==7 || $.cookie("unit2").length==2){
		return "省级";
	}else if($.cookie("unit2").length==9){
		return "市级";
	}else if($.cookie("unit2").length==11){
		return "县级";
	}
}
function filterGydwdm(gydwdm){
	var result=null;
	var sheng = new RegExp("^[0-9]{7}0000$");
	var shi1=new RegExp("^[0-9]{7}[0-9][1-9]00$");
	var shi2=new RegExp("^[0-9]{7}[1-9][0-9]00$");
	if(gydwdm=="36"){
		result="%36%";
	}else if(shi1.test(gydwdm) || shi2.test(gydwdm) ){
		result=gydwdm.substring(0, gydwdm.length-2)+"__";
	}
	else if(sheng.test(gydwdm)){
		result=gydwdm.substring(0, gydwdm.length-4)+"____";
	}else{
		result=gydwdm;
	}
	return result;
}
function filterXzqhdm(xzqhdm){
	var yi1 = new RegExp("^36[0-9][1-9]00$");
	var yi2= new RegExp("^36[1-9][0-9]00$");
	var result=null;
	if(xzqhdm=="360000"){
		result='36%';
	}else if(yi1.test(xzqhdm) || yi2.test(xzqhdm)){
		result=xzqhdm.substring(0, xzqhdm.length-2)+"__";
	}else{
		result=xzqhdm;
	}
	
	return result;
}
//列入计划
function showLrjh(jsp,w,h){
	var cd=$.cookie("unit2").length;
	if(cd>8) {
		alert("对不起，非省级单位无法列入！");
		return;
	}
	YMLib.UI.createWindow('lw_lr','路网项目列入计划',jsp,'lw_lr',w,h);
}
function xmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:""});
	for(var i=0;i<=10;i++){
		if(i==0) first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
	$('#'+id).combobox("setValue","");
}
function loadTsdq(id){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	}); 
}
