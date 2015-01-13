/**
 * 管养单位下拉框
 * @param id
 */
function gydwComboxTree(id){
	$('#'+id).combotree({
		animate:true,
		url:"../../../jhgl/queryGydwByparent.do",
		onBeforeExpand:function(node){
			var children = $('#'+id).combotree("tree").tree("getChildren",node.target);
			if(children.length<=0){
				$.ajax({
					type:'post',
					url:'../../../jhgl/queryGydwByparent.do',
					data:'parentId='+node.id,
					dataType:'json',
					async:false,
					success:function(data){
						$('#'+id).combotree("tree").tree("append",{parent:node.target,data:data});
					}
				});
			}
		}
	});
}

/**
 * 行政区划下拉框
 * @param id
 */
function xzqhComboxTree(id){
	loadUnit(id,$.cookie("unit"));
//	$('#'+id).combotree({
//		animate:true,
//		url:"../../../jhgl/queryXzqhByParent.do",
//		onBeforeExpand:function(node){
//			var children = $('#'+id).combotree("tree").tree("getChildren",node.target);
//			if(children.length<=0){
//				$.ajax({
//					type:'post',
//					url:'../../../jhgl/queryXzqhByParent.do',
//					data:'parentId='+node.id,
//					dataType:'json',
//					async:false,
//					success:function(data){
//						$('#'+id).combotree("tree").tree("append",{parent:node.target,data:data});
//					}
//				});
//			}
//		}
//	});
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