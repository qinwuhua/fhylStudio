$(function() {
	var qx=getQxfromSession('qx3').split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01011501'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '资金拨付',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu1").append('<ul id="tree01011501"></ul>');
			createMenunew('01011501');
			j++;
		}
    	/*if(qx[i]=='01011402'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '进度审核',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu2").append('<ul id="tree01011402"></ul>');
			createMenunew('01011402');
			j++;
		}
    	if(qx[i]=='01011403'){
			$('#aa').accordion('add', {
				id:"left_menu3",
				title: '完工统计',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu3").append('<ul id="tree01011403"></ul>');
			createMenunew('01011403');
			j++;
		}
    	if(qx[i]=='01011404'){
			$('#aa').accordion('add', {
				id:"left_menu4",
				title: '生成报表',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu4").append('<ul id="tree01011404"></ul>');
			createMenunew('01011404');
			j++;
		}
    	if(qx[i]=='01011405'){
			$('#aa').accordion('add', {
				id:"left_menu5",
				title: '安全应急管理',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu5").append('<ul id="tree01011405"></ul>');
			createMenunew('01011405');
			j++;
		}*/
    }
	
   
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

