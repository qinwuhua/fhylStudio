$(function() {
	var qx=parent.$.cookie("qx3").split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
		if(qx[i]=='01010201'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '项目基础库管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010202'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '项目基础库审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010203'){
			$('#aa').accordion('add', {
				id:"left_menu3",
				title: '项目审查库管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010204'){
			$('#aa').accordion('add', {
				id:"left_menu4",
				title: '项目审查库审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
	}
    
	createMenu('LeftMenu',{
		id:'menu_0101020101',
		title:'危桥改造项目',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu1',
		href:'./jckgl/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020104',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu1',
		href:'./jckgl/wqgzsj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020102',
		title:'安保工程项目',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu1',
		href:'./jckgl/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020103',
		title:'灾害防治项目',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu1',
		href:'./jckgl/zhfz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020105',
		title:'危桥改造项目查看',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu1',
		href:'./jckgl/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020108',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu1',
		href:'./jckgl/wqgzsj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020106',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu1',
		href:'./jckgl/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020107',
		title:'灾害防治项目查看',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu1',
		href:'./jckgl/zhfz.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101020201',
		title:'危桥改造项目',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu2',
		href:'./jcksh/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020204',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu2',
		href:'./jcksh/wqgzsj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020202',
		title:'安保工程项目',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu2',
		href:'./jcksh/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020203',
		title:'灾害防治项目',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu2',
		href:'./jcksh/zhfz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020205',
		title:'危桥改造项目查看',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu2',
		href:'./jcksh/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020208',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu2',
		href:'./jcksh/wqgzsj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020206',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu2',
		href:'./jcksh/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020207',
		title:'灾害防治项目查看',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu2',
		href:'./jcksh/zhfz.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_0101020301',
		title:'危桥改造项目',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu3',
		href:'./sckgl/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020304',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu3',
		href:'./sckgl/wqgzsj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020302',
		title:'安保工程项目',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu3',
		href:'./sckgl/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020303',
		title:'灾害防治项目',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu3',
		href:'./sckgl/zhfz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020305',
		title:'危桥改造项目查看',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu3',
		href:'./sckgl/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020308',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu3',
		href:'./sckgl/wqgzsj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020306',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu3',
		href:'./sckgl/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020307',
		title:'灾害防治项目查看',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu3',
		href:'./sckgl/zhfz.jsp'
	});
	
	
	createMenu('LeftMenu',{
		id:'menu_0101020401',
		title:'危桥改造项目',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu4',
		href:'./scksh/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020404',
		title:'危桥改造项目(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu4',
		href:'./scksh/wqgzsj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020402',
		title:'安保工程项目',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu4',
		href:'./scksh/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020403',
		title:'灾害防治项目',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu4',
		href:'./scksh/zhfz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020405',
		title:'危桥改造项目查看',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu4',
		href:'./scksh/wqgz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020408',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu4',
		href:'./scksh/wqgzsj.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020406',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu4',
		href:'./scksh/abgc.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020407',
		title:'灾害防治项目查看',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu4',
		href:'./scksh/zhfz.jsp'
	});
	menuQx();
	if(getParam("id").substr(0,8)!=""&&getParam("id").substr(0,8)=="01010201"){
		if(getParam("sj")=="0"){
			$('#aa').accordion("select","项目基础库管理");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"01"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		}else{
			$('#aa').accordion("select","项目基础库审核");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"02"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		}
	}
	if(getParam("id").substr(0,8)!=""&&getParam("id").substr(0,8)=="01010203"){
		if(getParam("sj")=="0"){
			$('#aa').accordion("select","项目审查库管理");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"03"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		}else{
			$('#aa').accordion("select","项目审查库审核");
			$("#rightContent").attr("src", $("#menu_"+getParam("id").substr(0,6)+"04"+getParam("id").substr(getParam("id").length-2,getParam("id").length)).find("a").attr("href")+"?t=1");
		};
	}
});
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}