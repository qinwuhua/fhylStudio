$(function() {
	var qx=parent.$.cookie("qx3").split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
		if(qx[i]=='01010501'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '计划统计报表',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010502'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '工程项目月报表',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010503'){
			$('#aa').accordion('add', {
				id:"left_menu3",
				title: '项目进展报表',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}else if(qx[i]=='01010504'){
			$('#aa').accordion('add', {
				id:"left_menu4",
				title: '对部报表',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
		
	}
	
	createMenux('LeftMenu',{
		id:'menu_0101050101',
		title:'交通部固定资产投资建设计划',
		imgSrc:'../../images/menubutton/jtbgdzc.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/jtbgdzc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050102',
		title:'路网结构改造建设计划汇总表',
		imgSrc:'../../images/menubutton/lwjggzjyjhb.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/lwgzjh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050103',
		title:'路网结构改造工程进展情况',
		imgSrc:'../../images/menubutton/lwjggzjcqk.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/lwgzjz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050104',
		title:'公路建设下达计划',
		imgSrc:'../../images/menubutton/gljsxdjh.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/gljsjh.jsp'
	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101050201',
		title:'危桥改造统计月报表',
		imgSrc:'../../images/menubutton/wqgztjybb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/wqgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050202',
		title:'安保工程统计月报表',
		imgSrc:'../../images/menubutton/abgctjybb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/abgc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050203',
		title:'灾害防治统计月报表',
		imgSrc:'../../images/menubutton/zhfztjybb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/zhfz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050204',
		title:'水毁重建进度报表',
		imgSrc:'../../images/menubutton/shcjjdbb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050205',
		title:'工程改造路面改建进度报表',
		imgSrc:'../../images/menubutton/gcgzlmgjjdbb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050206',
		title:'养护路面大中修工程进度报表',
		imgSrc:'../../images/menubutton/dzxgcjdbb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050207',
		title:'公路工程改造进度完成情况汇总表',
		imgSrc:'../../images/menubutton/glgcgzjdqkwchzb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/glgzjd.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050208',
		title:'公路改造工程新上、续建工程项目完成情况表',
		imgSrc:'../../images/menubutton/gzxsxjgcqk.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/glgzxj.jsp'
	});

	
	createMenux('LeftMenu',{
		id:'menu_0101050301',
		title:'普通干线公路建设项目进展情况表',
		imgSrc:'../../images/menubutton/ptgxjdqkb.png',
		renderTo:'left_menu3',
		href:'./xmjzbb/ptgx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050302',
		title:'养护大中修工程项目进展情况表',
		imgSrc:'../../images/menubutton/yhdzxgcjdqkb.png',
		renderTo:'left_menu3',
		href:'./xmjzbb/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050303',
		title:'路网结构改造工程项目进展情况表',
		imgSrc:'../../images/menubutton/lwjggzgcjzqkb.png',
		renderTo:'left_menu3',
		href:'./xmjzbb/lwgz.jsp'
	});
	
	
	createMenu2('LeftMenu',{
		id:'menu1',
		title:'危桥基础库报表',
		imgSrc:'../../images/menubutton/wq.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqbb/wqjc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu3',
		title:'危桥审查库报表',
		imgSrc:'../../images/menubutton/zh.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqbb/wqsc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu2',
		title:'危桥计划库报表',
		imgSrc:'../../images/menubutton/ab.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqbb/wqjh.jsp'
	});

	createMenu2('LeftMenu',{
		id:'menu4',
		title:'安保基础库报表',
		imgSrc:'../../images/menubutton/yh.png',
		renderTo:'left_menu4',
		href:'./dbbb/abbb/abjc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu7',
		title:'安保审查库报表',
		imgSrc:'../../images/menubutton/sj.png',
		renderTo:'left_menu4',
		href:'./dbbb/abbb/absc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu6',
		title:'安保计划库报表',
		imgSrc:'../../images/menubutton/gj.png',
		renderTo:'left_menu4',
		href:'./dbbb/abbb/abjh.jsp'
	});

	createMenu2('LeftMenu',{
		id:'menu8',
		title:'灾害基础库报表',
		imgSrc:'../../images/menubutton/hs.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhbb/zhjc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu10',
		title:'灾害审查库报表',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhbb/zhsc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu9',
		title:'灾害计划库报表',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhbb/zhjh.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu12',
		title:'危桥进度库开工信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqmb/wqkg.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu11',
		title:'危桥进度库进展信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqmb/wqjz.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu14',
		title:'危桥进度库完成信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqmb/wqwc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu13',
		title:'危桥进度库跨年信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqmb/wqkn.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu16',
		title:'安保进度库开工信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/abmb/abkg.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu15',
		title:'安保进度库进展信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/abmb/abjz.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu18',
		title:'安保进度库完成信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/abmb/abwc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu17',
		title:'安保进度库跨年信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/abmb/abkn.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu20',
		title:'灾害进度库开工信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhmb/zhkg.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu19',
		title:'灾害进度库进展信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhmb/zhjz.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu22',
		title:'灾害进度库完成信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhmb/zhwc.jsp'
	});
	createMenu2('LeftMenu',{
		id:'menu21',
		title:'灾害进度库跨年信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhmb/zhkn.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}