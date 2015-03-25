$(function() {
	
	var qx=parent.$.cookie("qx3").split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
		if(qx[i]=='01010401'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '公路建设及养护管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010402'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '月报进度审核管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010403'){
			$('#aa').accordion('add', {
				id:"left_menu3",
				title: '车购税资金拨付情况',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
		}else if(qx[i]=='01010404'){
			$('#aa').accordion('add', {
				id:"left_menu4",
				title: '公路工程完工统计',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010405'){
			$('#aa').accordion('add', {
				id:"left_menu5",
				title: '安全应急管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
	}
	
	createMenux('LeftMenu',{
		id:'menu_0101040101',
		title:'危桥改造施工过程管理',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/wqgz/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040102',
		title:'安保工程施工过程管理',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/abgc/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040103',
		title:'灾害防治施工过程管理',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/zhfz/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040104',
		title:'养护大中修施工过程管理',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/yhdzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040105',
		title:'水毁施工过程管理',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/sh/sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040106',
		title:'工程改造路面改建施工过程管理',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/gcgzgj/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040107',
		title:'工程改造路面升级项目施工过程管理',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/gcgzsj/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040108',
		title:'红色旅游施工过程管理',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/hsly/hsly.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'农村公路建设项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu1',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村新建桥梁项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu1',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村改渡建桥项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu1',
//		href:'./lxxx.jsp'
//	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101040201',
		title:'危桥改造施工过程管理',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/wqgz/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040202',
		title:'安保工程施工过程管理',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/abgc/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040203',
		title:'灾害防治施工过程管理',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/zhfz/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040204',
		title:'养护大中修施工过程管理',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/yhdzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040205',
		title:'水毁施工过程管理',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/sh/sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040206',
		title:'工程改造路面改建施工过程管理',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/gcgzgj/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040207',
		title:'工程改造路面升级项目施工过程管理',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/gcgzsj/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040208',
		title:'红色旅游施工过程管理',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/hsly/hsly.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'农村公路建设项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu2',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村新建桥梁项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu2',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村改渡建桥项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu2',
//		href:'./lxxx.jsp'
//	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101040301',
		title:'危桥改造施工过程管理',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/wqgz/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040302',
		title:'安保工程施工过程管理',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/abgc/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040303',
		title:'灾害防治施工过程管理',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/zhfz/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040304',
		title:'养护大中修施工过程管理',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/yhdzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040305',
		title:'水毁施工过程管理',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/sh/sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040306',
		title:'工程改造路面改建施工过程管理',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/gcgzgj/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040307',
		title:'工程改造路面升级项目施工过程管理',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/gcgzsj/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040308',
		title:'红色旅游施工过程管理',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/hsly/hsly.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'农村公路建设项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu3',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村新建桥梁项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu3',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村改渡建桥项目施工过程管理',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu3',
//		href:'./lxxx.jsp'
//	});
//	
	
	createMenux('LeftMenu',{
		id:'menu_0101040401',
		title:'危桥改造工程完工统计',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/wqgz/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040402',
		title:'安保工程完工统计',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/abgc/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040403',
		title:'灾害防治工程完工统计',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/zhfz/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040404',
		title:'养护大中修工程完工统计',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/yhdzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040405',
		title:'水毁工程完工统计',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/sh/sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040406',
		title:'工程改造路面改建工程完工统计',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/gcgzgj/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040407',
		title:'工程改造路面升级工程完工统计',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/gcgzsj/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040408',
		title:'红色旅游工程完工统计',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/hsly/hsly.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'农村公路建设工程完工统计',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu4',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村新建桥梁工程完工统计',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu4',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村改渡建桥工程完工统计',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu4',
//		href:'./lxxx.jsp'
//	});
//	
	
	
	createMenux('LeftMenu',{
		id:'menu_0101040501',
		title:'安全管理月报表',
		imgSrc:'../../images/aqglyb_s.png',
		renderTo:'left_menu5',
		href:'./aqyjgl/aqgl/aqgl.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040502',
		title:'模板管理',
		imgSrc:'../../images/mbgl_s.png',
		renderTo:'left_menu5',
		href:'./aqyjgl/mbgl/mbgl.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040503',
		title:'信息通知',
		imgSrc:'../../images/xxtz_s.png',
		renderTo:'left_menu5',
		href:'./aqyjgl/xxtz/xxtz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040504',
		title:'信息通知数据查询',
		imgSrc:'../../images/xxtzsjcx_s.png',
		renderTo:'left_menu5',
		href:'./aqyjgl/xxcx/xxcx.jsp'
	});
	
	
	
//	createMenux('LeftMenu',{
//		id:'menu1',
//		title:'危桥改造项目',
//		imgSrc:'../../images/wq_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu2',
//		title:'安保工程项目',
//		imgSrc:'../../images/ab_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu3',
//		title:'灾害防治项目',
//		imgSrc:'../../images/zh_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu4',
//		title:'养护大中修项目',
//		imgSrc:'../../images/yh_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu5',
//		title:'水毁项目',
//		imgSrc:'../../images/sh_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu6',
//		title:'工程改造路面升级项目',
//		imgSrc:'../../images/sj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu7',
//		title:'工程改造路面改建项目',
//		imgSrc:'../../images/gj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu8',
//		title:'红色旅游公路项目',
//		imgSrc:'../../images/hs_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'战备公路项目',
//		imgSrc:'../../images/zb_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村改渡建桥项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村新建桥梁项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu12',
//		title:'农村改渡建桥项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
	menuQx();
	if(getParam("id").substr(0,8)!=""&&getParam("id").substr(0,8)=="01010402"){
		if(getParam("sj")=="0"){
			$('#aa').accordion("select","公路建设及养护管理");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"01"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		}else{
			$('#aa').accordion("select","月报进度审核管理");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"02"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		}
	}
});
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}
