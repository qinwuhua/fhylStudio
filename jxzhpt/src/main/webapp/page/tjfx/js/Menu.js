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
		id:'menu_0101070204',
		title:'补助历史查询',
		imgSrc:'../../images/bzlscx.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhsh/lsjlSearch.jsp'
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
		imgSrc:'../../images/jhgcl.png',
		renderTo:'left_menu3',
		href:'./gcktj/gcltj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070304',
		title:'完成比例统计',
		imgSrc:'../../images/wcbltj.png',
		renderTo:'left_menu3',
		href:'./gcktj/wcbl.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070305',
		title:'与上年完成投资额比',
		imgSrc:'../../images/ysnwctzb.png',
		renderTo:'left_menu3',
		href:'./gcktj/snwctzebl.jsp'
	});
	
	
	createMenu('LeftMenu',{
		id:'menu_0101070401',
		title:'路况评定明细',
		imgSrc:'../../images/xzqhtj.png',
		renderTo:'left_menu4',
		href:'./lkpdjcfx/lkpdmx.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070402',
		title:'路况技术状况评定分析',
		imgSrc:'../../images/xmlxtj.png',
		renderTo:'left_menu4',
		href:'./lkpdjcfx/jszkpdfx.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070403',
		title:'公路技术状况比较分析',
		imgSrc:'../../images/jhgcl.png',
		renderTo:'left_menu4',
		href:'./lkpdjcfx/jszkbjfx.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101070404',
		title:'路况评定结果与养护大中修项目分析',
		imgSrc:'../../images/wcbltj.png',
		renderTo:'left_menu4',
		href:'./lkpdjcfx/pdjgfx.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=selQxByUser2(parent.$.cookie("roleid"));//parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}


function selQxByUser2(roleid){
	var qx4= new Array();
	$.ajax({
		type : "POST",
		url : "../../xtgl/selQxByUser2.do",
		dataType : 'json',
		data :"param.roleid="+roleid,
		async: false ,
		success : function(msg){
			if(msg){
				for(var i=0;i<msg.length;i++){
					//第4层
					if(msg[i].id.length==10) qx4. push(msg[i].id);
				}
	     	 }
		 }
	});
	return qx4;
}
