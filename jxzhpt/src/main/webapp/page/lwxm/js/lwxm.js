var rowid;
function addJck(jsp,w,h){
	YMLib.UI.createWindow('jck_add','添加项目',jsp,'jck_add',w,h);
}
function xgJckabgc(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目','abgc_xg.jsp','jck_xg',900,500);
}
function ckJckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','abgc_ck.jsp','jck_ck',900,500);
}
function ckJcksh(jsp,w,h){
	YMLib.UI.createWindow('jck_ck','查看项目详情',jsp,'jck_ck',w,h);
}
function addSck(jsp,w,h){
	YMLib.UI.createWindow('sck_add','添加项目',jsp,'sck_add',w,h);
}
function xgSck(jsp,w,h){
	YMLib.UI.createWindow('sck_xg','修改项目',jsp,'sck_xg',w,h);
}
function ckSck(jsp,w,h){
	YMLib.UI.createWindow('sck_ck','查看项目详情',jsp,'sck_ck',w,h);
}
