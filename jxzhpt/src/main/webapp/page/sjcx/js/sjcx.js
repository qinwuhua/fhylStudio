var checkValues;
function cxzd(jsp,w,h){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表',jsp,'zd_xz',w,h);
}
//路网项目JS
function addJck(jsp,w,h){
	YMLib.UI.createWindow('jck_add','添加项目',jsp,'jck_add',w,h);
}
function xgJck(jsp,w,h){
	YMLib.UI.createWindow('jck_xg','修改项目',jsp,'jck_xg',w,h);
}
function ckJck(jsp,w,h){
	YMLib.UI.createWindow('jck_ck','查看项目详情',jsp,'jck_ck',w,h);
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

