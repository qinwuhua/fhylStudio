$(function() {

	createMenu('LeftMenu',{
		id:'menu_010401',
		title:'角色分配管理',
		imgSrc:'../../images/jsgl.png',
		renderTo:'left_menu1',
		href:'./jsgl.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010402',
		title:'行政区划管理',
		imgSrc:'../../images/xzqhgl.png',
		renderTo:'left_menu1',
		href:'./xzqh.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010403',
		title:'部门信息管理',
		imgSrc:'../../images/bmgl.png',
		renderTo:'left_menu1',
		href:'./bmgl.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010404',
		title:'特殊地区',
		imgSrc:'../../images/tsdq.png',
		renderTo:'left_menu1',
		href:'./tsdq.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010405',
		title:'用户信息管理',
		imgSrc:'../../images/yhgl.png',
		renderTo:'left_menu1',
		href:'./yhgl.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010406',
		title:'编目编码管理',
		imgSrc:'../../images/bmbm.jpg',
		renderTo:'left_menu1',
		href:'./bmbm.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx2").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}