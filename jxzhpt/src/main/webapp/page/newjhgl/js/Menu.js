$(function() {
	var qx=getQxfromSession('qx3').split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01011301'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '计划申报',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu1").append('<ul id="tree01011301"></ul>');
			createMenunew('01011301');
			j++;
		}
    	if(qx[i]=='01011302'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '计划预安排',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu2").append('<ul id="tree01011302"></ul>');
			createMenunew('01011302');
			j++;
		}
    	if(qx[i]=='01011303'){
			$('#aa').accordion('add', {
				id:"left_menu3",
				title: '计划下达',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu3").append('<ul id="tree01011303"></ul>');
			createMenunew('01011303');
			j++;
		}
    	if(qx[i]=='01011304'){
			$('#aa').accordion('add', {
				id:"left_menu4",
				title: '计划查询',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu4").append('<ul id="tree01011304"></ul>');
			createMenunew('01011304');
			j++;
		}
    	if(qx[i]=='01011305'){
			$('#aa').accordion('add', {
				id:"left_menu5",
				title: '计划变更',
				selected: j==1?true:false,
				iconCls:'icon-note'
			});
			$("#left_menu5").append('<ul id="tree01011305"></ul>');
			createMenunew('01011305');
			j++;
		}
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

