$(function() {

	createMenu('LeftMenu',{
		id:'menu_0101020101',
		title:'危桥改造项目',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu1',
		href:'./jckgl/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020102',
		title:'安保工程项目',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu1',
		href:'./jckgl/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020103',
		title:'灾害防治项目',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu1',
		href:'./jckgl/zhfz.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101020201',
		title:'危桥改造项目',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu2',
		href:'./jcksh/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020202',
		title:'安保工程项目',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu2',
		href:'./jcksh/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020203',
		title:'灾害防治项目',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu2',
		href:'./jcksh/zhfz.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101020301',
		title:'危桥改造项目',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu3',
		href:'./sckgl/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020302',
		title:'安保工程项目',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu3',
		href:'./sckgl/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020303',
		title:'灾害防治项目',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu3',
		href:'./sckgl/zhfz.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101020401',
		title:'危桥改造项目',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu4',
		href:'./scksh/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020402',
		title:'安保工程项目',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu4',
		href:'./scksh/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020403',
		title:'灾害防治项目',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu4',
		href:'./scksh/zhfz.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}