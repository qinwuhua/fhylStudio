/**
 * 加载特殊地区下拉列表
 * @param id 元素ID
 */
function loadTsdq(id){
	$('#'+id).combobox({    
	    url:'../../../jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	}); 
}
/**
 * 获取管养单位选中值
 * @param id 元素ID
 * @returns {String} 所选中的值
 */
function getgydw(id){
	var result="";
	var gydws = $("#"+id).combotree("getValues");
	if(gydws.length==0 || gydws.length==1){
		result=$.cookie("unit2");
	}else{
		result=gydws.join(',');
	}
	return result;
}
/**
 * 获取行政区划选中的值
 * @param id 元素ID
 * @returns {String} 选中的行政区划
 */
function getxzqhdm(id){
	var result="";
	var xzqhs = $("#"+id).combotree("getValues");
	if(xzqhs.length==0 || xzqhs.length==1){
		result=$.cookie("dist2");
	}else{
		result=xzqhs.join(',');
	}
	return result;
}
//此对象为绑定列表对象
var grid={
		url:null,queryParams:null,height:null,width:null,
		columns:null,onSelect:null,onClickRow:null,
		striped:true,pagination:true,
		rownumbers:true,pageNumber:pageNumber,
		pageSize:pageSize,onLoadSuccess:null,
		view:null,detailFormatter:null,onExpandRow:null};
var gridObj;
/**
 * 绑定easy-ui的datagrid表格
 * @param grid datagrid配置对象
 */
function gridBind(grid){
	alert(grid.pagination);
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:grid.onSelect,
	    onClickRow:grid.onClickRow,
	    onLoadSuccess:grid.onLoadSuccess
	    /*view:grid.view,
	    detailFormatter:grid.detailFormatter,
	    onExpandRow:grid.onExpandRow,*/
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}