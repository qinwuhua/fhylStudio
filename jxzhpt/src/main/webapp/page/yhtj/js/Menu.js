$(function() {

	createMenu('LeftMenu',{
		id:'menu_01030301',
		title:'公路养护小修保养月报表',
		imgSrc:'../../images/menubutton/glyhxxybb.png',
		renderTo:'left_menu1',
		href:'./ybb.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030302',
		title:'公路养护小修保养机械材料消耗表',
		imgSrc:'../../images/menubutton/glyhxxjxxhb.png',
		renderTo:'left_menu1',
		href:'./clxhb.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030303',
		title:'公路管理月报分析表',
		imgSrc:'../../images/menubutton/glglybfxb.png',
		renderTo:'left_menu1',
		href:'./ybfxb.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030304',
		title:'公路路况评定表',
		imgSrc:'../../images/menubutton/gllkpdb.png',
		renderTo:'left_menu1',
		href:'./lkpdb.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030305',
		title:'公路路线技术状况一览表',
		imgSrc:'../../images/menubutton/gllxjszkylb.png',
		renderTo:'left_menu1',
		href:'./ylb.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_01030306',
		title:'灾毁损失情况',
		imgSrc:'../../images/menubutton/zhssqk.png',
		renderTo:'left_menu2',
		href:'./zhqk.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030307',
		title:'公路水毁抢修人财物投入情况',
		imgSrc:'../../images/menubutton/glshqxcwqk.png',
		renderTo:'left_menu2',
		href:'./trqk.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030308',
		title:'公路交通阻断信息表',
		imgSrc:'../../images/menubutton/gljtzdxxb.png',
		renderTo:'left_menu2',
		href:'./jtzdxxb.jsp'
	});
	
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx3").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}