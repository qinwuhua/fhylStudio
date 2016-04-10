$(function() {
	var qx=getQxfromSession('qx3').split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01011101'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '十三五',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu1").append('<ul id="tree01011101"></ul>');
			createMenunew('01011101');
			j++;
		}
    	if(qx[i]=='01011102'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '十四五',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu2").append('<ul id="tree01011102"></ul>');
			createMenunew('01011102');
			j++;
		}
    }
	
    
    var treeData = [{
        text : "公路建设项目",
        state : "closed",
        iconCls:'icon-none',
        children : [{
	                text : "国省道改造",
	                iconCls:'icon-none',
	                children : [{
	                    text : "改建工程项目",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }, {
	                    text : "路面改造工程项目",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }, {
	                    text : "新建工程项目",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }
                ]
            }, {
                text : "灾毁恢复重建项目",
                iconCls:'icon-none',
                attributes : {
                    url : ""
                }
            }, {
                text : "红色旅游公路",
//                state : "closed",
                iconCls:'icon-none',
                attributes : {
                    url : ""
                }
            }
        ]
    },{
        text : "养护大中修",
//        state : "closed",
        iconCls:'icon-none'
    },{
        text : "路网结构工程",
        state : "closed",
        iconCls:'icon-none',
        children : [{
	                text : "国省道",
	                iconCls:'icon-none',
	                children : [{
	                    text : "危桥改造",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }, {
	                    text : "公路安防工程",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }, {
	                    text : "灾害防治",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }, {
	                    text : "隧道",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }
	            ]
            }, {
                text : "农村公路",
                iconCls:'icon-none',
                children : [{
	                    text : "危桥改造",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }, {
	                    text : "公路安防工程",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }, {
	                    text : "灾害防治",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }, {
	                    text : "隧道",
	                    iconCls:'icon-none',
	                    attributes : {
	                        url : ""
	                    }
	                }
	            ]
            }
        ]
    },{
        text : "公路治超点",
//        state : "closed",
        iconCls:'icon-none'
    },{
        text : "示范路工程",
        state : "closed",
        iconCls:'icon-none',
        children : [{
	            text : "部级",
	            iconCls:'icon-none'
	        	},
	        	{
	            text : "省级",
	            iconCls:'icon-none'
	        	}
	        	,
	        	{
	            text : "市级",
	            iconCls:'icon-none'
	        	}
        	]
	},{
        text : "综合养护中心",
        state : "closed",
        iconCls:'icon-none',
        children : [{
	            text : "市级",
	            iconCls:'icon-none'
	        	}
	        	,
	        	{
	            text : "县级",
	            iconCls:'icon-none'
	        	}
        	]
	},{
        text : "服务区",
//        state : "closed",
        iconCls:'icon-none'
    },{
        text : "综合服务",
        state : "closed",
        iconCls:'icon-none',
        children : [{
	            text : "应急处置平台项目",
	            iconCls:'icon-none'
	        	}
	        	,
	        	{
	            text : "路网运行监测点",
	            iconCls:'icon-none'
	        	}
        	]
	},{
        text : "旅游公路",
//        state : "closed",
        iconCls:'icon-none'
    }
];
    
    
	/*createMenuqwh('LeftMenu',{
		id:'menu_0101090101',
		title:'改建工程项目',
		imgSrc:'../../images/sj_s.png',
		renderTo:'left_menu1',
		href:'./wnjh/sjgz.jsp'
	});*/
	
	 
	 
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

