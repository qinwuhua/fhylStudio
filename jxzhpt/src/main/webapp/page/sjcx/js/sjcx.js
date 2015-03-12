var checkValues;
var gydw=parent.YMLib.Var.gydw;
/*function cxzd(jsp,w,h){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表',jsp,'zd_xz',w,h);
}*/

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
//基础库管理
function zdy(){
	$("#grid").datagrid({    
		 url:"../js/lwxm1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	});  
}

