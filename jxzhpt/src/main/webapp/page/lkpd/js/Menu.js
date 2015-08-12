$(function() {
	
	createMenu('LeftMenu',{
		id:'menu_01030101',
		title:'公路技术状况评定明细表',
		imgSrc:'../../images/menubutton/gljszkpdmxb.png',
		renderTo:'left_menu1',
		href:'./mxb.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030103',
		title:'公路技术状况评定明细表(2014+)',
		imgSrc:'../../images/menubutton/gljszkpdmxb.png',
		renderTo:'left_menu1',
		href:'./mxb2014.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_01030102',
		title:'公路技术状况评定统计表',
		imgSrc:'../../images/menubutton/gljszkpdtjb.png',
		renderTo:'left_menu1',
		href:'./tjb.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx3").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}