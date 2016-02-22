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
		title:'安全生命防护工程',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu1',
		href:'./jckgl/aqsmfh.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020106',
		title:'病害隧道项目',
		imgSrc:'../../images/bhsd.png',
		renderTo:'left_menu1',
		href:'./jckgl/bhsd.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020120',
		title:'危桥改造项目查看',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu1',
		href:'./jckgl/wqgz__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020123',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu1',
		href:'./jckgl/wqgzsj__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020121',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu1',
		href:'./jckgl/abgc__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020122',
		title:'灾害防治项目查看',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu1',
		href:'./jckgl/zhfz__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020124',
		title:'病害隧道项目查看',
		imgSrc:'../../images/bhsd.png',
		renderTo:'left_menu1',
		href:'./jckgl/bhsd__ck.jsp'
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
		title:'安全生命防护工程',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu2',
		href:'./jcksh/aqsmfh.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020206',
		title:'病害隧道项目',
		imgSrc:'../../images/bhsd.png',
		renderTo:'left_menu2',
		href:'./jcksh/bhsd.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020220',
		title:'危桥改造项目查看',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu2',
		href:'./jcksh/wqgz__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020223',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu2',
		href:'./jcksh/wqgzsj__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020221',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu2',
		href:'./jcksh/abgc__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020222',
		title:'灾害防治项目查看',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu2',
		href:'./jcksh/zhfz__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020224',
		title:'病害隧道项目查看',
		imgSrc:'../../images/bhsd.png',
		renderTo:'left_menu2',
		href:'./jcksh/bhsd__ck.jsp'
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
		title:'安全生命防护工程',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu3',
		href:'./sckgl/aqsmfh.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020306',
		title:'病害隧道项目',
		imgSrc:'../../images/bhsd.png',
		renderTo:'left_menu3',
		href:'./sckgl/bhsd.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020320',
		title:'危桥改造项目查看',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu3',
		href:'./sckgl/wqgz__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020323',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu3',
		href:'./sckgl/wqgzsj__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020321',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu3',
		href:'./sckgl/abgc__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020322',
		title:'灾害防治项目查看',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu3',
		href:'./sckgl/zhfz__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020324',
		title:'病害隧道项目查看',
		imgSrc:'../../images/bhsd.png',
		renderTo:'left_menu3',
		href:'./sckgl/bhsd__ck.jsp'
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
		title:'安全生命防护工程',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu4',
		href:'./scksh/aqsmfh.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020406',
		title:'病害隧道项目',
		imgSrc:'../../images/bhsd.png',
		renderTo:'left_menu4',
		href:'./scksh/bhsd.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020420',
		title:'危桥改造项目查看',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu4',
		href:'./scksh/wqgz__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020423',
		title:'危桥改造项目查看(交通局)',
		imgSrc:'../../images/wqgz_jtj.png',
		renderTo:'left_menu4',
		href:'./scksh/wqgzsj__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020421',
		title:'安保工程项目查看',
		imgSrc:'../../images/ab.png',
		renderTo:'left_menu4',
		href:'./scksh/abgc__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020422',
		title:'灾害防治项目查看',
		imgSrc:'../../images/zh.png',
		renderTo:'left_menu4',
		href:'./scksh/zhfz__ck.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_0101020424',
		title:'病害隧道项目查看',
		imgSrc:'../../images/bhsd.png',
		renderTo:'left_menu4',
		href:'./scksh/bhsd__ck.jsp'
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
