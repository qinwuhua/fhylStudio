$(function() {
	createMenu('LeftMenu',{
		id:'menu_01020101',
		title:'政策文件',
		imgSrc:'../../images/zcwj.png',
		renderTo:'left_menu1',
		href:'./zcwj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01020102',
		title:'其它文件',
		imgSrc:'../../images/qtwj.png',
		renderTo:'left_menu1',
		href:'./qtwj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01020103',
		title:'计划文件',
		imgSrc:'../../images/qtwj.png',
		renderTo:'left_menu1',
		href:'./jhwj.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=getQxfromSession('qx3').split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}