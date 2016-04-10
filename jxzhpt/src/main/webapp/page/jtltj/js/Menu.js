$(function() {

	createMenu('LeftMenu',{
		id:'menu_01030201',
		title:'交通情况汇总表',
		imgSrc:'../../images/menubutton/jtqkhzb.png',
		renderTo:'left_menu1',
		href:'./hzb.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030202',
		title:'交通情况汇总表(国道)',
		imgSrc:'../../images/menubutton/jtqkhzbgd.png',
		renderTo:'left_menu1',
		href:'./hzbgd.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030203',
		title:'交通情况汇总表(省道)',
		imgSrc:'../../images/menubutton/jtqkhzbsd.png',
		renderTo:'left_menu1',
		href:'./hzbsd.jsp'
	});
	
	menuQx();
});
function menuQx(){
	var qx=getQxfromSession('qx3').split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}