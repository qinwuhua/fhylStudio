/**
 * 管养单位下拉框
 * @param id
 */
function gydwComboxTree(id){
	loadUnit(id,$.cookie("unit"));
}
/**
 * 行政区划下拉框
 * @param id
 */
function xzqhComboxTree(id){
	
	loadDist(id,"360000");
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

//步骤   xx sh   点击详细时对应的ID
var bz,xxId;
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
		modal : true
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
function openZjxd(id,title,href,width,height){
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : width,
		height : height,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true
	}).dialog("setTitle",title).dialog("open");
}
function addZjxd(){
	var zjxd={xmid:xxId,xdnf:'',xdzj:'',sfzj:'',tbdw:'',tbdate:''};
	
	
}