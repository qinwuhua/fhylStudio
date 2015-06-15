$(function() {
	var qx=parent.$.cookie("qx3").split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
		 if(qx[i]=='01010801'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '项目立项申请',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010802'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '项目立项审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010803'){
			$('#aa').accordion('add', {
				id:"left_menu3",
				title: '工程可行性研究填写',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010804'){
			$('#aa').accordion('add', {
				id:"left_menu4",
				title: '工程可行性研究审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010805'){
			$('#aa').accordion('add', {
				id:"left_menu5",
				title: '初步设计或施工图设计填写',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010806'){
			$('#aa').accordion('add', {
				id:"left_menu6",
				title: '初步设计或施工图设计审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
		
	}
	
	
	
	createMenux('LeftMenu',{
		id:'menu_0101080101',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'./lxsh/sjgzsb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080102',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'./lxsh/lmgzsb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080103',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'./lxsh/xjsb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080104',
		title:'养护大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'../qqgl/jhsh/yhdzxgl.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080105',
		title:'水毁项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu1',
		href:'../qqgl/jhsh/shxmgl.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101080201',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./lxsh/sjgzsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080202',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./lxsh/lmgzsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080203',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'./lxsh/xjsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080204',
		title:'养护大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhsh/yhdzxgl.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080205',
		title:'水毁项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu2',
		href:'../qqgl/jhsh/shxmgl.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101080301',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./kxxyj/sjgzsb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080302',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./kxxyj/lmgzsb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080303',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./kxxyj/xjsb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080304',
		title:'大中修工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu3',
		href:'./jhkgl/wqgz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101080401',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu4',
		href:'./kxxyj/sjgzsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080402',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu4',
		href:'./kxxyj/lmgzsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080403',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu4',
		href:'./kxxyj/xjsh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080404',
		title:'养护大中修项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu4',
		href:'./jhkgl/wqgz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101080501',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu5',
		href:'./cbsj/lmsj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080502',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu5',
		href:'./cbsj/lmgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080503',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu5',
		href:'./cbsj/xjgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080504',
		title:'养护大中修项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu5',
		href:'./cbsj/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080505',
		title:'水毁项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu5',
		href:'./cbsj/shxm.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101080601',
		title:'升级改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./cbsj/lmsj_sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080602',
		title:'路面改造工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./cbsj/lmgz_sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080603',
		title:'新建工程项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./cbsj/xjgc_sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080604',
		title:'养护大中修项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./cbsj/yhdzx_sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101080605',
		title:'水毁项目',
		imgSrc:'../../images/wq_s.png',
		renderTo:'left_menu6',
		href:'./cbsj/shxm_sh.jsp'
	});
//	createMenux('LeftMenu',{
//		id:'menu_0101030509',
//		title:'战备公路项目',
//		imgSrc:'../../images/zb_s.png',
//		renderTo:'left_menu5',
//		href:'../sjcx/jhkgl/zbgl.jsp'
//	});
	menuQx();
	if(getParam("id").substr(0,8)!=""&&getParam("id").substr(0,8)=="01010801"){
		if(getParam("sj")=="0"){
			$('#aa').accordion("select","项目立项申请");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"02"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		}else{
			$('#aa').accordion("select","项目立项审核");
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
