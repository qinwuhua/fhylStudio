
function insertData(flag){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '安全管理月报表添加',
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
