$(function() {
	var qx=parent.$.cookie("qx3").split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
		if(qx[i]=='01011001'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '十二五计划库',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
    }
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01011002'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '十三五计划库',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
    }
	
	createMenux('LeftMenu',{
		id:'menu_0101100101',
		title:'路网项目',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu1',
		href:'./12wjh/zdycx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101100102',
		title:'改建、路面改造、新建',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu1',
		href:'./12wjh/zdycx1.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101100103',
		title:'养护大中修、灾毁重建',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu1',
		href:'./12wjh/zdycx2.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101100104',
		title:'危桥改造（交通局）',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu1',
		href:'./12wjh/zdycx4.jsp'
	});
	
	createMenux('LeftMenu',{
		id:'menu_0101100201',
		title:'路网项目',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu2',
		href:'./13wjh/zdycx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101100202',
		title:'改建、路面改造、新建',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu2',
		href:'./13wjh/zdycx1.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101100203',
		title:'养护大中修、灾毁重建',
		imgSrc:'../../images/zdycx.png',
		renderTo:'left_menu2',
		href:'./13wjh/zdycx2.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101100204',
		title:'危桥改造（交通局）',
		imgSrc:'../../images/wqgz_jtj_s.png',
		renderTo:'left_menu2',
		href:'./13wjh/zdycx4.jsp'
	});
	menuQx();
});
function menuQx(){
	var qx=parent.$.cookie("qx4").split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}
