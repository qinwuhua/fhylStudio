$(function() {
	createMenu('LeftMenu',{
		id:'menu_0101070101',
		title:'行政区划统计',
		imgSrc:'../../images/xzqhtj.png',
		renderTo:'left_menu1',
		href:'./jcktj/xzqhtj.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101070201',
		title:'年份项目统计',
		imgSrc:'../../images/xzqhtj.png',
		renderTo:'left_menu2',
		href:'./jhktj/nftj.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101070202',
		title:'行政区划统计趋势分析',
		imgSrc:'../../images/qsfx.png',
		renderTo:'left_menu2',
		href:'./jhktj/xzqhtjqsfx.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101070203',
		title:'项目类型统计趋势分析',
		imgSrc:'../../images/lxtjqs.png',
		renderTo:'left_menu2',
		href:'./jhktj/xmlxtjqsfx.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101070301',
		title:'行政区划统计',
		imgSrc:'../../images/xzqhtj.png',
		renderTo:'left_menu3',
		href:'./gcktj/xzqhtj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070302',
		title:'项目类型统计',
		imgSrc:'../../images/xmlxtj.png',
		renderTo:'left_menu3',
		href:'./gcktj/xmlxtj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070303',
		title:'计划工程量统计',
		imgSrc:'../../images/xmlxtj.png',
		renderTo:'left_menu3',
		href:'./gcktj/xmlxtj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070304',
		title:'完成比例统计',
		imgSrc:'../../images/xmlxtj.png',
		renderTo:'left_menu3',
		href:'./gcktj/wcbl.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070305',
		title:'与上年完成投资额比',
		imgSrc:'../../images/xmlxtj.png',
		renderTo:'left_menu3',
		href:'./gcktj/snwctzebl.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}