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
		title:'交通部固定资产投资建设计划(分地市)',
		imgSrc:'../../images/menubutton/jtbgdzc.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/gdzctzjs.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050102',
		title:'路网结构改造建设计划汇总表(分国省)',
		imgSrc:'../../images/menubutton/lwjggzjyjhb.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/jsjhhzb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050103',
		title:'路网结构改造工程进展情况',
		imgSrc:'../../images/menubutton/lwjggz.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/gcjz.jsp'
	});
/*	createMenux('LeftMenu',{
		id:'menu_0101050104',
		title:'市农村公路危桥改造工程项目建设表',
		imgSrc:'../../images/menubutton/sncglwq.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/wqgzjsb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050105',
		title:'市农村公路安保工程项目建设表',
		imgSrc:'../../images/menubutton/sncglab.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/abgcjsb.jsp'
	});*/
	createMenux('LeftMenu',{
		id:'menu_0101050106',
		title:'公路路网结构改造工程建设计划（危桥改造项目）',
		imgSrc:'../../images/menubutton/wqgztjybb.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/wqgzjh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050107',
		title:'公路路网结构改造工程建设计划（安保工程项目）',
		imgSrc:'../../images/menubutton/abgctjybb.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/abgcjh.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101050108',
		title:'农村公路危桥改造工程建议计划（第二批）',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu1',
		href:'./jhtjbb/wqgzjy.jsp'
	});
	
//	createMenux('LeftMenu',{
//		id:'menu_0101050104',
//		title:'公路建设下达计划',
//		imgSrc:'../../images/menubutton/gljsxdjh.png',
//		renderTo:'left_menu1',
//		href:'./jhtjbb/xdjh.jsp'
//	});
	
	
	createMenux('LeftMenu',{
		id:'menu_0101050201',
		title:'危桥改造统计月报表',
		imgSrc:'../../images/menubutton/wqgztjybb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/wqgz.jsp'
	});
/*	createMenux('LeftMenu',{
		id:'menu_0101050202',
		title:'安保工程统计月报表',
		imgSrc:'../../images/menubutton/abgctjybb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/abgc.jsp'
	});*/
	createMenux('LeftMenu',{
		id:'menu_0101050203',
		title:'灾害防治统计月报表',
		imgSrc:'../../images/menubutton/zhfztjybb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/zhfz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101050207',
		title:'改建进度报表',
		imgSrc:'../../images/menubutton/glgcgzjdqkwchzb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/glgzjd.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050205',
		title:'路面改造进度报表',
		imgSrc:'../../images/menubutton/gcgzlmgjjdbb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/gcgzgj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050206',
		title:'养护大中修工程进度报表',
		imgSrc:'../../images/menubutton/dzxgcjdbb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/yhdzx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050204',
		title:'灾毁重建进度报表',
		imgSrc:'../../images/menubutton/shcjjdbb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/sh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050208',
		title:'公路改造工程新上、续建工程项目完成情况明细表',
		imgSrc:'../../images/menubutton/gzxsxjgcqk.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/glgzxj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050209',
		title:'公路改造工程新上、续建工程项目完成情况汇总表',
		imgSrc:'../../images/menubutton/gzxsxjgcqk.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/glgzxjmxb.jsp'
	});
/*	createMenux('LeftMenu',{
		id:'menu_0101050210',
		title:'危桥改造项目(交通局)历年统计报表',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/wqgzsj.jsp'
	});*/
	createMenux('LeftMenu',{
		id:'menu_0101050211',
		title:'全省危桥改造项目汇总表',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/wqgzhzb.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050212',
		title:'全省安保改造项目汇总表',
		imgSrc:'../../images/menubutton/abgctjybb.png',
		renderTo:'left_menu2',
		href:'./gcxmybb/abgchzb.jsp'
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
	
	
	createMenux('LeftMenu',{
		id:'menu_0101050401',
		title:'危桥基础库报表',
		imgSrc:'../../images/menubutton/wqjckbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqbb/wqjc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050402',
		title:'危桥审查库报表',
		imgSrc:'../../images/menubutton/wqsckbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqbb/wqsc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050403',
		title:'危桥计划库报表',
		imgSrc:'../../images/menubutton/wqjhkbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqbb/wqjh.jsp'
	});

	createMenux('LeftMenu',{
		id:'menu_0101050404',
		title:'安保基础库报表',
		imgSrc:'../../images/menubutton/abjckbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/abbb/abjc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050405',
		title:'安保审查库报表',
		imgSrc:'../../images/menubutton/absckbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/abbb/absc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050406',
		title:'安保计划库报表',
		imgSrc:'../../images/menubutton/abjhkbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/abbb/abjh.jsp'
	});

	createMenux('LeftMenu',{
		id:'menu_0101050407',
		title:'灾害基础库报表',
		imgSrc:'../../images/menubutton/zhjckbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhbb/zhjc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050408',
		title:'灾害审查库报表',
		imgSrc:'../../images/menubutton/zhsckbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhbb/zhsc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050409',
		title:'灾害计划库报表',
		imgSrc:'../../images/menubutton/zhjhkbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhbb/zhjh.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050410',
		title:'危桥进度库开工信息模板',
		imgSrc:'../../images/menubutton/wqjdkkg.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqmb/wqkg.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050411',
		title:'危桥进度库进展信息模板',
		imgSrc:'../../images/menubutton/wqjdkjz.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqmb/wqjz.jsp'
	});
	/*createMenu2('LeftMenu',{
		id:'menu14',
		title:'危桥进度库完成信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqmb/wqwc.jsp'
	});*/
/*	createMenu2('LeftMenu',{
		id:'menu13',
		title:'危桥进度库跨年信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/wqmb/wqkn.jsp'
	});*/
	createMenux('LeftMenu',{
		id:'menu_0101050412',
		title:'安保进度库开工信息模板',
		imgSrc:'../../images/menubutton/abjdkkg.png',
		renderTo:'left_menu4',
		href:'./dbbb/abmb/abkg.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050413',
		title:'安保进度库进展信息模板',
		imgSrc:'../../images/menubutton/abjdkjz.png',
		renderTo:'left_menu4',
		href:'./dbbb/abmb/abjz.jsp'
	});
	/*createMenu2('LeftMenu',{
		id:'menu18',
		title:'安保进度库完成信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/abmb/abwc.jsp'
	});*/
	/*createMenu2('LeftMenu',{
		id:'menu17',
		title:'安保进度库跨年信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/abmb/abkn.jsp'
	});*/
	createMenux('LeftMenu',{
		id:'menu_0101050414',
		title:'灾害进度库开工信息模板',
		imgSrc:'../../images/menubutton/zhjdkkg.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhmb/zhkg.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050415',
		title:'灾害进度库进展信息模板',
		imgSrc:'../../images/menubutton/zhjdkjz.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhmb/zhjz.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101050416',
		title:'安全生命防护工程基础库报表',
		imgSrc:'../../images/menubutton/abjckbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/abbb/afjc.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101050417',
		title:'安全生命防护工程审查库报表',
		imgSrc:'../../images/menubutton/absckbb.png',
		renderTo:'left_menu4',
		href:'./dbbb/abbb/afsc.jsp'
	});
	/*createMenu2('LeftMenu',{
		id:'menu22',
		title:'灾害进度库完成信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhmb/zhwc.jsp'
	});*/
/*	createMenu2('LeftMenu',{
		id:'menu21',
		title:'灾害进度库跨年信息模板',
		imgSrc:'../../images/menubutton/left_kj.png',
		renderTo:'left_menu4',
		href:'./dbbb/zhmb/zhkn.jsp'
	});*/
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}
