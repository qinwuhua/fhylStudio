$(function() {

	var qx=parent.$.cookie("qx3").split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
		if(qx[i]=='01010301'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '项目计划库管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010302'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '项目计划库上报',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010303'){
			$('#aa').accordion('add', {
				id:"left_menu3",
				title: '项目计划库审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010304'){
			$('#aa').accordion('add', {
				id:"left_menu4",
				title: '项目计划资金下达',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010305'){
			$('#aa').accordion('add', {
				id:"left_menu5",
				title: '计划查询',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010306'){
			$('#aa').accordion('add', {
				id:"left_menu6",
				title: '项目立项申请',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010307'){
			$('#aa').accordion('add', {
				id:"left_menu7",
				title: '项目立项审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010308'){
			$('#aa').accordion('add', {
				id:"left_menu8",
				title: '工程可行性研究申请',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010309'){
			$('#aa').accordion('add', {
				id:"left_menu9",
				title: '工程可行性研究审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010310'){
			$('#aa').accordion('add', {
				id:"left_menu10",
				title: '初步设计或施工图设计申请',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010311'){
			$('#aa').accordion('add', {
				id:"left_menu11",
				title: '初步设计或施工图设计审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
		
	}
	
	createMenux('LeftMenu',{
		id:'menu_0101030101',
		title:'危桥改造项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030112',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu1',
		href:'./jhkgl/wqgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030102',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu1',
		href:'./jhkgl/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030103',
		title:'灾害防治项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu1',
		href:'./jhkgl/zhfz.jsp'
	});
	
	/*
	createMenux('LeftMenu',{
		id:'menu_0101030105',
		title:'工程改造路面改建项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu1',
		href:'./jhkgl/gclmgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030106',
		title:'养护大中修项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu1',
		href:'../qqgl/jhsh/yhdzxgl.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030107',
		title:'灾毁重建',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu1',
		href:'../qqgl/jhsh/shxmgl.jsp'
	});*/
	createMenux('LeftMenu',{
		id:'menu_0101030108',
		title:'红色旅游公路项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu1',
		href:'./jhkgl/hslygl.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030110',
		title:'资金切分',
		imgSrc:'../../images/zjqf.png',
		renderTo:'left_menu1',
		href:'./jhkgl/zjqf.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030111',
		title:'补助历史查询',
		imgSrc:'../../images/bzlscx.png',
		renderTo:'left_menu1',
		href:'../qqgl/jhsh/lsjlSearch.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu_0101030109',
//		title:'战备公路项目',
//		imgSrc:'../../images/zb_s.png',
//		renderTo:'left_menu1',
//		href:'./jhkgl/zbgl.jsp'
//	});
	
	
	
	createMenux('LeftMenu',{
		id:'menu_0101030201',
		title:'危桥改造项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./jhksb/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030210',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu2',
		href:'./jhksb/wqgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030202',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu2',
		href:'./jhksb/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030203',
		title:'灾害防治项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu2',
		href:'./jhksb/zhfz.jsp'
	});
	
	/*createMenux('LeftMenu',{
		id:'menu_0101030204',
		title:'工程改造路面升级项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu2',
		href:'./jhksb/gclmsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030205',
		title:'工程改造路面改建项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu2',
		href:'./jhksb/gclmgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030206',
		title:'养护大中修项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhsh/yhdzxgl_sb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030207',
		title:'灾毁重建',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhsh/shxmgl_sb.jsp'
	});*/
	
	
	createMenux('LeftMenu',{
		id:'menu_0101030301',
		title:'危桥改造项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./jhksh/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030310',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu3',
		href:'./jhksh/wqgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030302',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu3',
		href:'./jhksh/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030303',
		title:'灾害防治项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu3',
		href:'./jhksh/zhfz.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu_0101030304',
//		title:'工程改造路面升级项目',
//		imgSrc:'../../images/sj_s.png',
//		renderTo:'left_menu3',
//		href:'../qqgl/jhsh/lmsj.jsp'
//	});
	createMenux('LeftMenu',{
		id:'menu_0101030304',
		title:'升级改造工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu3',
		href:'../qqgl/jhsh/lmsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030305',
		title:'路面改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu3',
		href:'../qqgl/jhsh/lmgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030309',
		title:'新建工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu3',
		href:'../qqgl/jhsh/xjgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030306',
		title:'养护大中修项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu3',
		href:'../qqgl/jhsh/yhdzxsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030307',
		title:'灾毁重建',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu3',
		href:'../qqgl/jhsh/shxmsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030308',
		title:'公路建设下达计划',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu3',
		href:'./jhksh/xdjh.jsp'
	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101030401',
		title:'危桥改造项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu4',
		href:'./jhkzjxd/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030411',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu4',
		href:'./jhkzjxd/wqgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030402',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu4',
		href:'./jhkzjxd/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030403',
		title:'灾害防治项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu4',
		href:'./jhkzjxd/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030404',
		title:'升级改造工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu4',
		href:'../qqgl/zjxd/lmsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030405',
		title:'路面改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu4',
		href:'../qqgl/zjxd/lmgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030410',
		title:'新建工程项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu4',
		href:'../qqgl/zjxd/xjgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030406',
		title:'养护大中修项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu4',
		href:'../qqgl/zjxd/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030407',
		title:'灾毁重建',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu4',
		href:'../qqgl/zjxd/shxm.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030408',
		title:'红色旅游公路项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu4',
		href:'./jhkzjxd/hslygl.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu_0101030409',
//		title:'战备公路项目',
//		imgSrc:'../../images/zb_s.png',
//		renderTo:'left_menu4',
//		href:'./jhkzjxd/zbgl.jsp'
//	});
	createMenux('LeftMenu',{
		id:'menu_0101030501',
		title:'危桥改造项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu5',
		href:'../sjcx/jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030511',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu5',
		href:'../sjcx/jhkgl/wqgzsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030502',
		title:'安保工程项目',
		imgSrc:'../../images/ab_s.png',
		renderTo:'left_menu5',
		href:'../sjcx/jhkgl/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030503',
		title:'灾害防治项目',
		imgSrc:'../../images/zh_s.png',
		renderTo:'left_menu5',
		href:'../sjcx/jhkgl/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030505',
		title:'升级改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu5',
		href:'../qqgl/jhcx/lmsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030504',
		title:'路面改造工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu5',
		href:'../qqgl/jhcx/lmgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030510',
		title:'新建工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu5',
		href:'../qqgl/jhcx/xjgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030506',
		title:'养护大中修项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu5',
		href:'../qqgl/jhcx/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030507',
		title:'灾毁重建',
		imgSrc:'../../images/sh_s.png',
		renderTo:'left_menu5',
		href:'../qqgl/jhcx/shxm.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030508',
		title:'红色旅游公路项目',
		imgSrc:'../../images/hs_s.png',
		renderTo:'left_menu5',
		href:'../sjcx/jhkgl/hslygl.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101030601',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030602',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030603',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030604',
		title:'大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./jhkgl/wqgz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101030701',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu7',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030702',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu7',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030703',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu7',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030704',
		title:'大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu7',
		href:'./jhkgl/wqgz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101030801',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu8',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030802',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu8',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030803',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu8',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030804',
		title:'大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu8',
		href:'./jhkgl/wqgz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101030901',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu9',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030902',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu9',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030903',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu9',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101030904',
		title:'大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu9',
		href:'./jhkgl/wqgz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101031001',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu10',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101031002',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu10',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101031003',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu10',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101031004',
		title:'大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu10',
		href:'./jhkgl/wqgz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101031101',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu11',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101031102',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu11',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101031103',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu11',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101031104',
		title:'大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu11',
		href:'./jhkgl/wqgz.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu_0101030509',
//		title:'战备公路项目',
//		imgSrc:'../../images/zb_s.png',
//		renderTo:'left_menu5',
//		href:'../sjcx/jhkgl/zbgl.jsp'
//	});
	menuQx();
	if(getParam("id").substr(0,8)!=""&&getParam("id").substr(0,8)=="01010301"){
		if(getParam("sj")=="0"){
			$('#aa').accordion("select","项目计划库上报");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"02"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		}else{
			$('#aa').accordion("select","项目计划库审核");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"03"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		}
	}
}); 
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}