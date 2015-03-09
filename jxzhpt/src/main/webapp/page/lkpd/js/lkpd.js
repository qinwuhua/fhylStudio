
function insertData(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '路况评定明细表添加',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertLkpdData.do"+'&flag='+flag,
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
function inserttjbData(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '路况评定统计表添加',
		page : 'upload.jsp?url='+"/jxzhpt/wjxt/insertLkpdtjData.do"+'&flag='+flag,
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
