$(function() {
	var qx=parent.$.cookie("qx3").split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
		if(qx[i]=='01010601'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '路网项目',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010602'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '计划管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010603'){
			$('#aa').accordion('add', {
				id:"left_menu3",
				title: '工程管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010604'){
			$('#aa').accordion('add', {
				id:"left_menu4",
				title: '自定义查询',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
	}
	
	createMenux('LeftMenu',{
		id:'menu_0101060101',
		title:'危桥改造项目基础库',
		imgSrc:'../../images/wq_jck_s.png',
		renderTo:'left_menu1',
		href:'./lwxm/wqgz_jck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060102',
		title:'危桥改造项目审查库',
		imgSrc:'../../images/wq_sck_s.png',
		renderTo:'left_menu1',
		href:'./lwxm/wqgz_sck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060103',
		title:'安保工程项目基础库',
		imgSrc:'../../images/ab_jck_s.png',
		renderTo:'left_menu1',
		href:'./lwxm/abgc_jck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060104',
		title:'安保工程项目审查库',
		imgSrc:'../../images/ab_sck_s.png',
		renderTo:'left_menu1',
		href:'./lwxm/abgc_sck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060105',
		title:'灾害防治项目基础库',
		imgSrc:'../../images/zh_jck_s.png',
		renderTo:'left_menu1',
		href:'./lwxm/zhfz_jck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060106',
		title:'灾害防治项目审查库',
		imgSrc:'../../images/zh_sck_s.png',
		renderTo:'left_menu1',
		href:'./lwxm/zhfz_sck.jsp'
	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101060201',
		title:'危桥改造项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060202',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu2',
		href:'./jhkgl/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060203',
		title:'灾害防治项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu2',
		href:'./jhkgl/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060204',
		title:'路面改造工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhcx/lmgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060205',
		title:'升级改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhcx/lmsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060206',
		title:'养护大中修项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhcx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060207',
		title:'水毁项目',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhcx/shxm.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060208',
		title:'红色旅游公路项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu2',
		href:'./jhkgl/hslygl.jsp'
	});
/*	createMenux('LeftMenu',{
		id:'menu_0101060209',
		title:'战备公路项目',
		imgSrc:'../../images/zb_s.png',
		renderTo:'left_menu2',
		href:'./jhkgl/zbgl.jsp'
	});*/
	
	
	createMenux('LeftMenu',{
		id:'menu_0101060301',
		title:'危桥改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060302',
		title:'安保工程工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060303',
		title:'灾害防治工程项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060304',
		title:'升级改造工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060305',
		title:'路面改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060309',
		title:'新建工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/xj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060306',
		title:'养护大中修工程项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060307',
		title:'水毁工程项目',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060308',
		title:'红色旅游工程项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/hsly.jsp'
	});
/*	createMenux('LeftMenu',{
		id:'menu_0101060309',
		title:'战备公路项目',
		imgSrc:'../../images/zb_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/zbgl.jsp'
	});*/
	
	
	createMenux('LeftMenu',{
		id:'menu_0101060401',
		title:'自定义查询',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu4',
		href:'./zdycx/zdycx.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}