$(function() {
	var qx=parent.$.cookie("qx3").split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01010901'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '十三五规划',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			j++;
		}
    }
	
	createMenux('LeftMenu',{
		id:'menu_0101090101',
		title:'改建工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu1',
		href:'./wnjh/sjgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101090102',
		title:'路面改造工程项目',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu1',
		href:'./wnjh/lmgz.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101090103',
		title:'新建工程项目',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu1',
		href:'./wnjh/xj.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101090104',
		title:'补助历史查询',
		imgSrc:'../../images/bzlscx.png',
		renderTo:'left_menu1',
		href:'../qqgl/jhsh/lsjlSearch.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101090105',
		title:'项目规划库数据分析',
		imgSrc:'../../images/bzlscx.png',
		renderTo:'left_menu1',
		href:'./wnjh/xmghksjfx.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101090121',
		title:'路面改造工程项目查看',
		imgSrc:'../../images/gj_s.png',
		renderTo:'left_menu1',
		href:'./wnjh/lmgz__ck.jsp'
	});
	createMenux('LeftMenu',{
		id:'menu_0101090122',
		title:'新建工程项目查看',
		imgSrc:'../../images/xjgcxm.png',
		renderTo:'left_menu1',
		href:'./wnjh/xj__ck.jsp'
	});
	
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
