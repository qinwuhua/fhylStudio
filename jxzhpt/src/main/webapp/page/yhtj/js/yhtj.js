
function import_ybb(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '公路养护小修保养月报表',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertYBBData.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function import_xhb(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '公路养护小修保养机械材料消耗表',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertXHBData.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function import_fxb(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '公路管理月报分析表',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertFXBData.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function import_pdb(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '公路路况评定表',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertPDBData.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function import_ylb(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '公路路线技术状况一览表',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertYLBData.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}