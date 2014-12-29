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
//步骤   xx sh
var bz;
/**
 * 弹出详细信息层
 * @param id ID
 * @param title 标题
 * @param href url路径
 */
function openDialog(id,title,href){
	bz=id.substring(id.indexOf('_')+1);
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