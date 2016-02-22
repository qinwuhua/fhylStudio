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
		}
    }
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01010605'){
			$('#aa').accordion('add', {
				id:"left_menu5",
				title: '前期管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
    }
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01010602'){
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
		id:'menu_0101060107',
		title:'病害隧道项目基础库',
		imgSrc:'../../images/bhsd_jck_s.png',
		renderTo:'left_menu1',
		href:'./lwxm/bhsd_jck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060108',
		title:'病害隧道项目审查库',
		imgSrc:'../../images/bhsd_sck_s.png',
		renderTo:'left_menu1',
		href:'./lwxm/bhsd_sck.jsp'
	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101060201',
		title:'危桥改造项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./jhkgl/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060210',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu2',
		href:'./jhkgl/wqgzsj.jsp'
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
		id:'menu_0101060211',
		title:'病害隧道项目',
		imgSrc:'../../images/bhsd_s.png',
		renderTo:'left_menu2',
		href:'./jhkgl/bhsd.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060205',
		title:'改建工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhcx/lmsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060204',
		title:'路面改造工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhcx/lmgz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101060206',
		title:'养护大中修项目',
		imgSrc:'../../images/yh_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhcx/yhdzx.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101060212',
		title:'养护中心项目',
		imgSrc:'../../images/yhzx_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhcx/yhzx.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101060207',
		title:'灾毁重建项目',
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
		id:'menu_0101060310',
		title:'病害隧道工程项目',
		imgSrc:'../../images/bhsd_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/bhsd.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060304',
		title:'改建工程项目',
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
		imgSrc:'../../images/xjgcxm.png',
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
		id:'menu_0101060311',
		title:'养护中心工程项目',
		imgSrc:'../../images/yhzx_s.png',
		renderTo:'left_menu3',
		href:'./gcgl/yhzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060307',
		title:'灾毁重建工程项目',
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
		title:'路网项目',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu4',
		href:'./zdycx/zdycx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060402',
		title:'改建、路面改造、新建',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu4',
		href:'./zdycx/zdycx1.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060403',
		title:'养护大中修、灾毁重建',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu4',
		href:'./zdycx/zdycx2.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060404',
		title:'危桥改造（交通局）',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu4',
		href:'./zdycx/zdycx4.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060405',
		title:'改建、路面改造、新建、养护大中修、灾毁重建',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu4',
		href:'./zdycx/zdycx5.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101060501',
		title:'改建工程立项审核',
		imgSrc:'../../images/sjgzlxsh.png',
		renderTo:'left_menu5',
		href:'./qqgl/lmsj_lxsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060502',
		title:'路面改造工程立项审核',
		imgSrc:'../../images/lmgzlxsh.png',
		renderTo:'left_menu5',
		href:'./qqgl/lmgz_lxsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060503',
		title:'新建工程立项审核',
		imgSrc:'../../images/xjlxsh.png',
		renderTo:'left_menu5',
		href:'./qqgl/xjxm_lxsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060504',
		title:'养护大中修工程立项审核',
		imgSrc:'../../images/yhlxsh.png',
		renderTo:'left_menu5',
		href:'./qqgl/yhdzx_lxsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060514',
		title:'养护中心工程立项审核',
		imgSrc:'../../images/yhzx_s.png',
		renderTo:'left_menu5',
		href:'./qqgl/yhzx_lxsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060505',
		title:'灾毁重建项目立项审核',
		imgSrc:'../../images/zhlxsh.png',
		renderTo:'left_menu5',
		href:'./qqgl/shxm_lxsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060506',
		title:'改建工程可行性研究',
		imgSrc:'../../images/sjgzkxxyj.png',
		renderTo:'left_menu5',
		href:'./qqgl/lmsj_kxxyj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060507',
		title:'路面改造工程可行性研究',
		imgSrc:'../../images/lmgzkxxyj.png',
		renderTo:'left_menu5',
		href:'./qqgl/lmgz_kxxyj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060508',
		title:'新建工程可行性研究',
		imgSrc:'../../images/xjkxxyj.png',
		renderTo:'left_menu5',
		href:'./qqgl/xjxm_kxxyj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060509',
		title:'改建工程初步设计',
		imgSrc:'../../images/sjgzcbsj.png',
		renderTo:'left_menu5',
		href:'./qqgl/lmsj_cbsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060510',
		title:'路面改造工程初步设计',
		imgSrc:'../../images/lmgzcbsj.png',
		renderTo:'left_menu5',
		href:'./qqgl/lmgz_cbsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060511',
		title:'新建工程初步设计',
		imgSrc:'../../images/xjcbsj.png',
		renderTo:'left_menu5',
		href:'./qqgl/xjxm_cbsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060512',
		title:'养护大中修工程初步设计',
		imgSrc:'../../images/yhcbsj.png',
		renderTo:'left_menu5',
		href:'./qqgl/yhdzx_cbsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101060513',
		title:'灾毁重建项目初步设计',
		imgSrc:'../../images/zhcbsj.png',
		renderTo:'left_menu5',
		href:'./qqgl/shxm_cbsj.jsp'
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

