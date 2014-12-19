/**
 * 管养单位下拉框
 * @param id
 */
function gydwComboxTree(id){
	$('#'+id).combotree({
		animate:true,
		url:"../js/gydw.json",
	});
}

/**
 * 行政区划下拉框
 * @param id
 */
function xzqhComboxTree(id){
	$('#'+id).combotree({
		animate:true,
		url:"../js/xzqh.json",
	});
}
/**
 * 初始化弹出层
 * @param id 弹出层ID
 */
function loadDialog(id){
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		width : 800,
		height : 500,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true
	});
}
/**
 * 弹出层
 * @param id 弹出层ID
 */
function openDialog(id,title){
	$('#'+id).dialog("setTitle",title);
	$('#'+id).dialog("open");
}