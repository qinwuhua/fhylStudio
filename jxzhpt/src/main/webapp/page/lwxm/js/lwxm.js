var rowid;
function addJck(jsp,w,h){
	YMLib.UI.createWindow('jck_add','添加项目',jsp,'jck_add',w,h);
}
//基础库安保工程
function xgJckabgc(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目','abgc_xg.jsp','jck_xg',900,500);
}
function ckJckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','abgc_ck.jsp','jck_ck',900,500);
}

//基础库灾害防治
function xgJckzhfz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目','zhfz_xg.jsp','jck_xg',900,500);
}
function ckJckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','zhfz_ck.jsp','jck_ck',900,500);
}

//基础库危桥改造
function xgJckwqgz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目','wqgz_xg.jsp','jck_xg',900,500);
}
function ckJckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','wqgz_ck.jsp','jck_ck',900,500);
}


function addSck(jsp,w,h){
	YMLib.UI.createWindow('sck_add','添加项目',jsp,'sck_add',w,h);
}
//审查库安保工程
function xgSckabgc(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('sck_xg','修改项目','abgc_xg.jsp','sck_xg',900,500);
}
function ckSckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','abgc_ck.jsp','sck_ck',900,500);
}
