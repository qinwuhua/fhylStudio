$(function() {
	createMenu('LeftMenu',{
		id:'menu1',
		title:'行政区划统计',
		imgSrc:'../../images/xzqhtj.png',
		renderTo:'left_menu1',
		href:'./jcktj/xzqhtj.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu2',
		title:'年份项目统计',
		imgSrc:'../../images/xzqhtj.png',
		renderTo:'left_menu2',
		href:'./jhktj/xzqhtj.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu2',
		title:'行政区划统计趋势分析',
		imgSrc:'../../images/qsfx.png',
		renderTo:'left_menu2',
		href:'./jhktj/xzqhtjqsfx.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu2',
		title:'项目类型统计趋势分析',
		imgSrc:'../../images/lxtjqs.png',
		renderTo:'left_menu2',
		href:'./jhktj/xmlxtjqsfx.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu3',
		title:'行政区划统计',
		imgSrc:'../../images/xzqhtj.png',
		renderTo:'left_menu3',
		href:'./gcktj/xzqhtj.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu3',
		title:'项目类型统计',
		imgSrc:'../../images/xmlxtj.png',
		renderTo:'left_menu3',
		href:'./gcktj/xmlxtj.jsp'
	});
});