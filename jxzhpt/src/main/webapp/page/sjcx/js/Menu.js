$(function() {

	
	var qx=$.cookie("QX");
	
	if(qx.indexOf(",0601,") != -1){
	createMenu('LeftMenu',{
		id:'left_menu7',
		title:'路线信息',
		imgSrc:'../../images/lxxx.png',
		renderTo:'left_menu2',
		href:'./lxxx.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'left_menu8',
		title:'桥梁信息',
		imgSrc:'../../images/qlxx.png',
		renderTo:'left_menu2',
		href:'./qlxx.jsp'
	});	
	createMenu('LeftMenu',{
		id:'left_menu12',
		title:'隧道信息',
		imgSrc:'../../images/sdxx.png',
		renderTo:'left_menu2',
		href:'./sdxx.jsp'
	});	
	createMenu('LeftMenu',{
		id:'left_menu13',
		title:'服务区信息',
		imgSrc:'../../images/fwq.png',
		renderTo:'left_menu2',
		href:'./fwqxx.jsp'
	});	
	createMenu('LeftMenu',{
		id:'left_menu6',
		title:'共享附件管理',
		imgSrc:'../../images/gxfj.png',
		renderTo:'left_menu2',
		href:'../attachement/gxfjlb.jsp'
	});
	}else{
		$('#aa').accordion('remove','基础数据维护');
	}
	
	if(qx.indexOf(",0602,") != -1){
		createMenu('LeftMenu', {
	        id: 'menu1',
	        title: '用户信息',
	        imgSrc: '../../images/yhxx.png',
	        renderTo: 'left_menu1',
	        href: './yhgl.jsp'
	    });
		
		createMenu('LeftMenu', {
	        id: 'menu2',
	        title: '单位信息',
	        imgSrc: '../../images/dwxx.png',
	        renderTo: 'left_menu1',
	        href: 'dwgl.jsp'
	    });
		}else{
			$('#aa').accordion('remove','用户信息维护');
		}
		
		
	if(qx.indexOf(",0603,") != -1){
		createMenu('LeftMenu', {
	        id: 'menu3',
	        title: '权限分配',
	        imgSrc: '../../images/qxfp.png',
	        renderTo: 'left_menu3',
	        href: 'jsgl.jsp'
	    });
	createMenu('LeftMenu',{
		id:'left_menu9',
		title:'编目编码管理',
		imgSrc:'../../images/bmbmgl.png',
		renderTo:'left_menu3',
		href:'./bmbmgl.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'left_menu10',
		title:'流程组维护',
		imgSrc:'../../images/lczgl.png',
		renderTo:'left_menu3',
		href:'./lczgl.jsp'
	});
	createMenu('LeftMenu', {
        id: 'menu4',
        title: '项目性质',
        imgSrc: '../../images/lbgl.png',
        renderTo: 'left_menu3',
        href: 'lbgl.jsp'
    });
	createMenu('LeftMenu', {
        id: 'menu4',
        title: '系统参数设置',
        imgSrc: '../../images/lbgl.png',
        renderTo: 'left_menu3',
        href: 'setsysparam.jsp'
    });
	}else{
		$('#aa').accordion('remove','系统信息维护');
	}
	
});