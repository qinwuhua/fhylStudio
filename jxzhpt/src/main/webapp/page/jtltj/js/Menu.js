$(function() {

	createMenu('LeftMenu',{
		id:'menu1',
		title:'交通情况汇总表',
		imgSrc:'../../images/jsgl.png',
		renderTo:'left_menu1',
		href:'./hzb.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu2',
		title:'交通情况汇总表(国道)',
		imgSrc:'../../images/xzqhgl.png',
		renderTo:'left_menu1',
		href:'./hzbgd.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu1',
		title:'交通情况汇总表(省道)',
		imgSrc:'../../images/jsgl.png',
		renderTo:'left_menu1',
		href:'./hzbsd.jsp'
	});
	
	
});