$(function() {

	createMenu('LeftMenu',{
		id:'menu1',
		title:'公路技术状况评定明细表',
		imgSrc:'../../images/jsgl.png',
		renderTo:'left_menu1',
		href:'./mxb.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu2',
		title:'公路技术状况评定统计表',
		imgSrc:'../../images/xzqhgl.png',
		renderTo:'left_menu1',
		href:'./tjb.jsp'
	});

});