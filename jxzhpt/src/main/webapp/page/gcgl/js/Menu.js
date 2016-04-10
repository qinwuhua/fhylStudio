$(function() {
	
	var qx=getQxfromSession('qx3').split(",");
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
			j++;
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
		title:'危桥改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/wqgz/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040110',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/wqgz/wqgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040102',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/abgc/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040114',
		title:'安防工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/abgc/afgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040103',
		title:'灾害防治工程项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/zhfz/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040111',
		title:'病害隧道项目',
		imgSrc:'../../images/bhsd_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/bhsd/bhsd.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040107',
		title:'改建工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/gcgzsj/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040106',
		title:'路面改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/gcgzgj/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040109',
		title:'新建工程项目',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/xjgc/xjgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040104',
		title:'养护大中修工程项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/yhdzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040115',
		title:'养护中心项目',
		imgSrc:'../../images/yhzx_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/yhzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040105',
		title:'灾毁重建工程项目',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/sh/sh.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040108',
		title:'红色旅游工程项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/hsly/hsly.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040120',
		title:'危桥改造工程项目查看',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/wqgz/wqgz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040128',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/wqgz/wqgzsj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040121',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/abgc/abgc__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040122',
		title:'灾害防治工程项目查看',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/zhfz/zhfz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040123',
		title:'改建工程项目查看',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/gcgzsj/gcgzsj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040124',
		title:'路面改造工程项目查看',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/gcgzgj/gcgzgj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040125',
		title:'新建工程项目查看',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/xjgc/xjgc__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040126',
		title:'养护大中修工程项目查看',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/yhdzx/yhdzx__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040127',
		title:'灾毁重建工程项目查看',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu1',
		href:'./gljsjyhgl/sh/sh__ck.jsp'
	});
	
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'农村公路建设工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu1',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村新建桥梁工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu1',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村改渡建桥工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu1',
//		href:'./lxxx.jsp'
//	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101040201',
		title:'危桥改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/wqgz/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040210',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/wqgz/wqgzsj.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040202',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/abgc/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040214',
		title:'安防工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/abgc/afgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040203',
		title:'灾害防治工程项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/zhfz/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040211',
		title:'病害隧道项目',
		imgSrc:'../../images/bhsd_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/bhsd/bhsd.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040207',
		title:'改建工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/gcgzsj/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040206',
		title:'路面改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/gcgzgj/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040209',
		title:'新建工程项目',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/xjgc/xjgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040204',
		title:'养护大中修工程项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/yhdzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040215',
		title:'养护中心项目',
		imgSrc:'../../images/yhzx_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/yhzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040205',
		title:'灾毁重建工程项目',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/sh/sh.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040208',
		title:'红色旅游工程项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/hsly/hsly.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040220',
		title:'危桥改造工程项目查看',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/wqgz/wqgz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040228',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/wqgz/wqgzsj__ck.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040221',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/abgc/abgc__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040222',
		title:'灾害防治工程项目查看',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/zhfz/zhfz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040223',
		title:'改建工程项目查看',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/gcgzsj/gcgzsj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040224',
		title:'路面改造工程项目查看',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/gcgzgj/gcgzgj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040225',
		title:'新建工程项目',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/xjgc/xjgc__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040226',
		title:'养护大中修工程项目查看',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/yhdzx/yhdzx__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040227',
		title:'灾毁重建工程项目查看',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu2',
		href:'./ybjdsh/sh/sh__ck.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'农村公路建设工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu2',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村新建桥梁工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu2',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村改渡建桥工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu2',
//		href:'./lxxx.jsp'
//	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101040301',
		title:'危桥改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/wqgz/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040310',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/wqgz/wqgzsj.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040302',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/abgc/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040314',
		title:'安防工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/abgc/afgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040303',
		title:'灾害防治工程项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/zhfz/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040311',
		title:'病害隧道工程项目',
		imgSrc:'../../images/bhsd_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/bhsd/bhsd.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040307',
		title:'改建工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/gcgzsj/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040306',
		title:'路面改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/gcgzgj/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040309',
		title:'新建工程项目',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/xjgc/xjgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040304',
		title:'养护大中修工程项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/yhdzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040315',
		title:'养护中心项目',
		imgSrc:'../../images/yhzx_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/yhzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040305',
		title:'灾毁重建工程项目',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/sh/sh.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040308',
		title:'红色旅游工程项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/hsly/hsly.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040320',
		title:'危桥改造工程项目查看',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/wqgz/wqgz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040328',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/wqgz/wqgzsj__ck.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040321',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/abgc/abgc__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040322',
		title:'灾害防治工程项目查看',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/zhfz/zhfz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040323',
		title:'改建工程项目查看',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/gcgzsj/gcgzsj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040324',
		title:'路面改造工程项目查看',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/gcgzgj/gcgzgj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040325',
		title:'新建工程项目查看',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/xjgc/xjgc__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040326',
		title:'养护大中修工程项目查看',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/yhdzx/yhdzx__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040327',
		title:'灾毁重建工程项目查看',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu3',
		href:'./cgszjdw/sh/sh__ck.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'农村公路建设工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu3',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村新建桥梁工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu3',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村改渡建桥工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu3',
//		href:'./lxxx.jsp'
//	});
//	
	
	createMenux('LeftMenu',{
		id:'menu_0101040401',
		title:'危桥改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/wqgz/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040410',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/wqgz/wqgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040402',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/abgc/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040414',
		title:'安防工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/abgc/afgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040403',
		title:'灾害防治工程项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/zhfz/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040411',
		title:'病害隧道项目',
		imgSrc:'../../images/bhsd_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/bhsd/bhsd.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040407',
		title:'改建工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/gcgzsj/gcgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040406',
		title:'路面改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/gcgzgj/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040409',
		title:'新建工程项目',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/xjgc/xjgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040404',
		title:'养护大中修工程项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/yhdzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040415',
		title:'养护中心项目',
		imgSrc:'../../images/yhzx_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/yhzx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040405',
		title:'灾毁重建工程项目',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/sh/sh.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040408',
		title:'红色旅游工程项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/hsly/hsly.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101040420',
		title:'危桥改造工程项目查看',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/wqgz/wqgz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040428',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/wqgz/wqgzsj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040421',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/abgc/abgc__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040422',
		title:'灾害防治工程项目查看',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/zhfz/zhfz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040423',
		title:'改建工程项目查看',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/gcgzsj/gcgzsj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040424',
		title:'路面改造工程项目查看',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/gcgzgj/gcgzgj__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040425',
		title:'新建工程项目查看',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/xjgc/xjgc__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040426',
		title:'养护大中修工程项目查看',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/yhdzx/yhdzx__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101040427',
		title:'灾毁重建工程项目查看',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu4',
		href:'./glgcwgtj/sh/sh__ck.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'农村公路建设工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu4',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村新建桥梁工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu4',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村改渡建桥工程项目',
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
//		title:'危桥改造工程项目',
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
//		title:'灾害防治工程项目',
//		imgSrc:'../../images/zh_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu4',
//		title:'养护大中修工程项目',
//		imgSrc:'../../images/yh_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu5',
//		title:'灾毁重建工程项目',
//		imgSrc:'../../images/sh_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu6',
//		title:'改建工程项目',
//		imgSrc:'../../images/sj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu7',
//		title:'路面改造工程项目',
//		imgSrc:'../../images/gj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu8',
//		title:'红色旅游公路工程项目',
//		imgSrc:'../../images/hs_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu9',
//		title:'战备公路工程项目',
//		imgSrc:'../../images/zb_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu10',
//		title:'农村改渡建桥工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu11',
//		title:'农村新建桥梁工程项目',
//		imgSrc:'../../images/left_kj_s.png',
//		renderTo:'left_menu6',
//		href:'./lxxx.jsp'
//	});
//	createMenux('LeftMenu',{
//		id:'menu12',
//		title:'农村改渡建桥工程项目',
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

