
function insertData(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '交通情况汇总表添加',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertJtlhzData.do"+'&flag='+flag,
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
function inserttgdData(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '交通情况汇总表(国道)',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertJtlhzgdData.do"+'&flag='+flag,
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
function inserttsdData(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '交通情况汇总表(省道)',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertJtlhzsdData.do"+'&flag='+flag,
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
