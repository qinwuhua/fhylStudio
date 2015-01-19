var rowid;
function addJck(jsp,w,h){
	YMLib.UI.createWindow('jck_add','添加项目',jsp,'jck_add',w,h);
}
//基础库安保工程
function xgJckabgc(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目信息','abgc_xg.jsp','jck_xg',900,500);
}
function ckJckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','abgc_ck.jsp','jck_ck',900,500);
}

//基础库灾害防治
function xgJckzhfz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目信息','zhfz_xg.jsp','jck_xg',900,500);
}
function ckJckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','zhfz_ck.jsp','jck_ck',900,500);
}

//基础库危桥改造
function xgJckwqgz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目信息','wqgz_xg.jsp','jck_xg',900,500);
}
function ckJckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','wqgz_ck.jsp','jck_ck',900,500);
}


function addSck(jsp,w,h){
	YMLib.UI.createWindow('sck_add','添加项目',jsp,'sck_add',w,h);
}
//审查库危桥改造
function xgSckwqgz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('sck_xg','修改项目信息','wqgz_xg.jsp','sck_xg',900,500);
}
function ckSckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','wqgz_ck.jsp','sck_ck',900,500);
}
//审查库安保工程
function xgSckabgc(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('sck_xg','修改项目信息','abgc_xg.jsp','sck_xg',900,500);
}
function ckSckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','abgc_ck.jsp','sck_ck',900,500);
}
//审查库灾害防治
function xgSckzhfz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('sck_xg','修改项目信息','zhfz_xg.jsp','sck_xg',900,500);
}
function ckSckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','zhfz_ck.jsp','sck_ck',900,500);
}
//excel基础库数据导入
function importData(flag){
	var url="";
	if(flag=='wqgz'){
		url="/jxzhpt/xmjck/importWqgz.do";
	}
	if(flag=='abgc'){
		url="/jxzhpt/xmjck/importAbgc.do";
	}
	if(flag=='zhfz'){
		url="/jxzhpt/xmjck/importZhfz.do";
	}
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
//excel审查库数据导入
function importData_sc(flag){
	var url="";
	if(flag=='wqgz_sc'){
		url="/jxzhpt/xmsck/importWqgz_sc.do";
	}
	if(flag=='abgc_sc'){
		url="/jxzhpt/xmsck/importAbgc_sc.do";
	}
	if(flag=='zhfz_sc'){
		url="/jxzhpt/xmsck/importZhfz_sc.do";
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
//基础库模板导出
function exportModule(filename){
	window.location.href="/jxzhpt/xtgl/getModule.do?moduleName="+filename;
}
//审查库模板导出
function exportModule_sc(filename){
	window.location.href="/jxzhpt/xtgl/getModule_sc.do?moduleName="+filename;
}
//危桥改造导出excel 
function exportExcel_wqgz(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&jsdj='+$("#jsdj").val()+
 	'&akjfl='+$("#akjfl").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_wqgz.do?"+param;
}
//安保工程改造导出excel 
function exportExcel_abgc(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&lxjsdj='+$("#lxjsdj").val()+
 	'&lxbm='+$("#lxbm").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_abgc.do?"+param;
}
//灾害防治改造导出excel 
function exportExcel_zhfz(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&lxjsdj='+$("#lxjsdj").val()+
 	'&lxbm='+$("#lxbm").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_zhfz.do?"+param;
}
//危桥改造审核excel导出
function exportExcel_wqgz_sh(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&jsdj='+$("#jsdj").val()+
 	'&akjfl='+$("#akjfl").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_wqgz_sh.do?"+param;
}
//安保工程审核excel导出
function exportExcel_abgc_sh(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&lxjsdj='+$("#lxjsdj").val()+
 	'&lxbm='+$("#lxbm").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_abgc_sh.do?"+param;
}
//灾害防治审核excel导出
function exportExcel_zhfz_sh(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&lxjsdj='+$("#lxjsdj").val()+
 	'&lxbm='+$("#lxbm").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_zhfz_sh.do?"+param;
}
//危桥改造审查库管理excel导出
function exportExcel_wqgz_scgl(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&jsdj='+$("#jsdj").val()+
 	'&akjfl='+$("#akjfl").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_wqgz_scgl.do?"+param;
}
//安保工程审查库管理excel导出
function exportExcel_abgc_scgl(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&lxjsdj='+$("#lxjsdj").val()+
 	'&lxbm='+$("#lxbm").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_abgc_scgl.do?"+param;
}
//灾害防治审查库管理excel导出
function exportExcel_zhfz_scgl(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&lxjsdj='+$("#lxjsdj").val()+
 	'&lxbm='+$("#lxbm").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_zhfz_scgl.do?"+param;
}
//危桥改造审查库管理excel导出
function exportExcel_wqgz_scsh(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&jsdj='+$("#jsdj").val()+
 	'&akjfl='+$("#akjfl").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_wqgz_scsh.do?"+param;
}
//安保工程审查库管理excel导出
function exportExcel_abgc_scsh(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&lxjsdj='+$("#lxjsdj").val()+
 	'&lxbm='+$("#lxbm").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_abgc_scsh.do?"+param;
}
//灾害防治审查库管理excel导出
function exportExcel_zhfz_scsh(){
	var param='gydw='+$("#gydw").combotree('getText')+
 	'&xzqhmc='+$("#xzqhmc").combotree('getText')+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").val()+
 	'&xmtype='+$("#xmtype").val()+
 	'&shzt='+$("#shzt").val()+
 	'&lxjsdj='+$("#lxjsdj").val()+
 	'&lxbm='+$("#lxbm").val();
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_zhfz_scsh.do?"+param;
}