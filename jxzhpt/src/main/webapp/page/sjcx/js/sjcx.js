var checkValues;
var gydw=parent.YMLib.Var.gydw;
function Wqgz(){
	YMLib.UI.createWindow('zd_wqgz','危桥项目字段选择列表','zdycx_wqgz.jsp','zd_wqgz','900','380');
}
function Wqgzsj(){
	YMLib.UI.createWindow('zd_wqgz','危桥项目字段选择列表','zdycx_wqgzsj.jsp','zd_wqgz','900','380');
}
function Abgc(){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表','zdycx_abgc.jsp','zd_xz','900','380');
}
function Zhfz(){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表','zdycx_zhfz.jsp','zd_xz','900','380');
}
function Gcgj(){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表','zdycx_gcgz.jsp','zd_xz','900','380');
}
function Gcsj(){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表','zdycx_gcsj.jsp','zd_xz','900','380');
}
function Yhdzx(){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表','zdycx_yhdzx.jsp','zd_xz','900','380');
}
function Sh(){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表','zdycx_sh.jsp','zd_xz','900','380');
}
function Bhsd(){
	YMLib.UI.createWindow('zd_bhsd','病害隧道字段选择列表','zdycx_bhsd.jsp','zd_bhsd','900','380');
}
function tsdq(id){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	}); 
}
//路网项目JS
//基础库安保工程
function ckJckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','abgc_jck_ck.jsp','jck_ck',900,450);
}
//基础库灾害防治
function ckJckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','zhfz_jck_ck.jsp','jck_ck',900,450);
}
//基础库危桥改造
function ckJckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','wqgz_jck_ck.jsp','jck_ck',900,450);
}
//审查库危桥改造
function ckSckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','wqgz_sck_ck.jsp','sck_ck',900,500);
}
//审查库安保工程
function ckSckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','abgc_sck_ck.jsp','sck_ck',900,500);
}
//审查库灾害防治
function ckSckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','zhfz_sck_ck.jsp','sck_ck',900,500);
}

//年份
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
//自定义导出excel 
function exportExcel_zdy(){
	var param="gydw="+YMLib.Var.gydw+
	"&xzqhdm="+YMLib.Var.xzqhdm+
	"&kgzt="+YMLib.Var.kgzt+
	"&lxmc="+YMLib.Var.lxmc+
	"&lxbm="+YMLib.Var.lxbm+
	"&xmlx="+YMLib.Var.xmlx+
	"&xmnf="+YMLib.Var.xmnf+
	"&jhnf="+YMLib.Var.jhnf+
	"&xmName="+YMLib.Var.xmName+
	"&colName="+YMLib.Var.sqlcol+
	"&tableName="+YMLib.Var.tablecol;
	//特殊地区 条件	
	window.location.href="/jxzhpt/zdycx/exportExcel_zdy.do?"+param;
}
function exportExcel_wqsjzdy(){
	if(YMLib.Var.sqlcol==null||YMLib.Var.sqlcol==''){
		alert("请勾选要导出的列");
		return ;
	}
	var param="gydw="+YMLib.Var.gydw+
	"&xzqhdm="+YMLib.Var.xzqhdm+
	"&kgzt="+YMLib.Var.kgzt+
	"&lxmc="+YMLib.Var.lxmc+
	"&lxbm="+YMLib.Var.lxbm+
	"&xmlx="+YMLib.Var.xmlx+
	"&xmnf="+YMLib.Var.xmnf+
	"&xmName="+YMLib.Var.xmName+
	"&colName="+YMLib.Var.sqlcol+
	"&tableName="+YMLib.Var.tablecol;
	//特殊地区 条件	
	window.location.href="/jxzhpt/zdycx/exportExcel_wqsjzdy.do?"+param;
}