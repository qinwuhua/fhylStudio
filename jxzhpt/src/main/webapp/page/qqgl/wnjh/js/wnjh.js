var obj=new Object();
function loadGldj(id) {
	$('#' + id).combotree({
		url:'/jxzhpt/qqgl/loadGldj.do?xzqhdm='+$.cookie("dist2"),
		panelHeight:200,
		multiple:true
	});
}
function setJsdj(id) {
	$('#' + id).combotree({
		url:'/jxzhpt/qqgl/setJsdj.do',
		panelHeight:200,
		multiple:true
	});
}
function sjxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','五年规划详细信息','sjgz_xx.jsp','lxxx',900,360);
}
function lmxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','五年规划详细信息','lmgz_xx.jsp','lxxx',900,360);
}
function xjxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','五年规划详细信息','xj_xx.jsp','lxxx',900,360);
}
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/selectwnlxbyxmid.do',
			data:"lxsh.xmbm="+data.id,
			dataType:'json',
			success:function(msg){
				var lxbm="";
				var qdzh="";
				var zdzh="";
				for(var i=0;i<msg.length;i++){
					if(i==msg.length-1){
						lxbm=lxbm+msg[i].lxbm;
						qdzh=qdzh+msg[i].qdzh;
						zdzh=zdzh+msg[i].zdzh;
					}else{
						lxbm=lxbm+msg[i].lxbm+"-";
						qdzh=qdzh+msg[i].qdzh+"-";
						zdzh=zdzh+msg[i].zdzh+"-";
					}
				}
				locationXm1(lxbm,qdzh,zdzh);
			},
			error : function(){
			 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
		 }
	});	
	
}
function loadDist3(id, dwbm,yhdw) {
	$('#' + id)
			.combotree(
					{
						checkbox : true,
						url : '/jxzhpt/gcgl/selAllXzqh1.do?yhdw=' + yhdw,
						onBeforeExpand : function(node, param) {
							$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="
									+ node.id;
						},
						onSelect : function(node) {
							YMLib.Var.DistName = node.text;
						}
					});
	$('#' + id).combotree('setValue', dwbm);
}
function loadUnit3(id, dwbm,yhdw) {
	$('#' + id).combotree({
		checkbox : false,
		url : '/jxzhpt/gcgl/selAllUnit1.do?yhdw=' + yhdw,
		onBeforeExpand : function(node, param) {
			$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllBm2.do?yhdw="
					+ node.id;
		},
		onSelect : function(node) {
			YMLib.Var.DistName = node.text
		}
	});
	$('#' + id).combotree('setValue', dwbm);
}
function removes(id){
	parent.$('#'+id).window('destroy');
}
function newGuid()
{
    var guid = "";
    for (var i = 1; i <= 32; i++){
      var n = Math.floor(Math.random()*16.0).toString(16);
      guid +=   n;
    }
    return guid;    
}
function queryJsdjAndLc(lxbm,qdzh,zdzh){
	$.ajax({
		type:'post',
		async:false,
		url:'/jxzhpt/qqgl/queryJsdjAndLcByStartAndEnd.do',
        data:'lx.lxbm='+lxbm+'&lx.qdzh='+qdzh+'&lx.zdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$('#yilc').val(msg.yilc);
			$('#erlc').val(msg.erlc);
			$('#sanlc').val(msg.sanlc);
			$('#silc').val(msg.silc);
			$('#dwlc').val(msg.dwlc);
			$('#wllc').val(msg.wllc);
			$('#xjsdj').val(msg.xjsdj);
			var spjsdj = $("input[id='jsjsdj']");
			if(spjsdj.length>0){
				$("#jsjsdj").val(msg.xjsdj);
			}
		}
	});
}
function checkdfzc(str){
	checkSZ(str);
	$("#dfzc").html('');
	var tz=0;var bzcs=0;
	if($("#tz").val()!='')
		tz=parseFloat($("#tz").val());
	if($("#bzcs").html()!='')
		bzcs=parseFloat($("#bzcs").html());
	if(bzcs>tz){
		alert("投资不能小于补助测算");
		return
	}
	var dfzc=accSub(tz,bzcs);
	$("#dfzc").html(dfzc);
}
function checkdfzc1(str){
	checkSZ(str);
	$("#dfzc").html('');
	var tz=0;var bzcs=0;
	if($("#tz").val()!='')
		tz=parseFloat($("#tz").val());
	if($("#bzcs").val()!='')
		bzcs=parseFloat($("#bzcs").val());
	if(bzcs>tz){
		alert("投资不能小于补助测算");
		return
	}
	var dfzc=accSub(tz,bzcs);
	$("#dfzc").html(dfzc);
}
function tsdq(id){
	$("#"+id).combobox({    
	    url: '/jxzhpt/xmjzbb/settsdq1.do?xzqh='+$.cookie("dist"),
	    valueField:'id',    
	    textField:'text'   
	})
	$("#"+id).combobox('setValue','全部');
}
function jslc(){
	var yilc=parseFloat($('#yilc').val());
	var erlc=parseFloat($('#erlc').val());
	var salc=parseFloat($('#sanlc').val());
	var silc=parseFloat($('#silc').val());
	var wulc=parseFloat($('#wllc').val());
	var dwlc=parseFloat($('#dwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(salc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#lc').html(hj5);
}
function cesuan(){
	var yilc=parseFloat($('#jhyilc').val());
	var erlc=parseFloat($('#jherlc').val());
	var salc=parseFloat($('#jhsanlc').val());
	var silc=parseFloat($('#jhsilc').val());
	var wulc=parseFloat($('#jhwllc').val());
	var dwlc=parseFloat($('#jhdwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(salc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#jhlc').html(hj5);
	var yi=0;
	if($('#jhyilc').val()!="" && $('#jhyilc').val()!="0")
		yi = getbzcs($("#lxbm").val().substr(0,1),"一级",$('#jhyilc').val(),'升级改造工程项目');
	var er=0;
	if($('#jherlc').val()!="" && $('#jherlc').val()!="0")
		er = getbzcs($("#lxbm").val().substr(0,1),"二级",$('#jherlc').val(),'升级改造工程项目');
	var san=0;
	if($('#jhsanlc').val()!="" && $('#jhsanlc').val()!="0")
		san = getbzcs($("#lxbm").val().substr(0,1),"三级",$('#jhsanlc').val(),'升级改造工程项目');
	var si=0;
	if($('#jhsilc').val()!="" && $('#jhsilc').val()!="0")
		si = getbzcs($("#lxbm").val().substr(0,1),"四级",$('#jhsilc').val(),'升级改造工程项目');
	var dw=0;
	if($('#jhdwlc').val()!="" && $('#jhdwlc').val()!="0")
		dw = getbzcs($("#lxbm").val().substr(0,1),"等外",$('#jhdwlc').val(),'升级改造工程项目');
	var wl=0;
	if($('#jhwllc').val()!="" && $('#jhwllc').val()!="0")
		wl = getbzcs($("#lxbm").val().substr(0,1),"无",$('#jhwllc').val(),'升级改造工程项目');
	var zcs=parseFloat(yi)+parseFloat(er)+parseFloat(san)+parseFloat(si)+parseFloat(dw)+parseFloat(wl);
	$('#bzcs').html(zcs);
	$('#dfzc').html(accSub(parseFloat($("#tz").val()),parseFloat($("#bzcs").html())));
}
function cesuan2(){
	var yilc=parseFloat($('#yilc').val());
	var erlc=parseFloat($('#erlc').val());
	var salc=parseFloat($('#sanlc').val());
	var silc=parseFloat($('#silc').val());
	var wulc=parseFloat($('#wllc').val());
	var dwlc=parseFloat($('#dwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(salc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#lc').html(hj5);
	var yi=0;
	if($('#yilc').val()!="" && $('#yilc').val()!="0" && $('#yilc').val()!="0.0")
		yi = getbzcs($("#lxbm").val().substr(0,1),"一级",$('#yilc').val(),'路面改造工程项目');
	var er=0;
	if($('#erlc').val()!="" && $('#erlc').val()!="0" && $('#erlc').val()!="0.0")
		er = getbzcs($("#lxbm").val().substr(0,1),"二级",$('#erlc').val(),'路面改造工程项目');
	var san=0;
	if($('#sanlc').val()!="" && $('#sanlc').val()!="0" && $('#sanlc').val()!="0.0")
		san = getbzcs($("#lxbm").val().substr(0,1),"三级",$('#sanlc').val(),'路面改造工程项目');
	var si=0;
	if($('#silc').val()!="" && $('#silc').val()!="0" && $('#silc').val()!="0.0")
		si = getbzcs($("#lxbm").val().substr(0,1),"四级",$('#silc').val(),'路面改造工程项目');
	var dw=0;
	if($('#dwlc').val()!="" && $('#dwlc').val()!="0" && $('#dwlc').val()!="0.0")
		dw = getbzcs($("#lxbm").val().substr(0,1),"等外",$('#dwlc').val(),'路面改造工程项目');
	var wl=0;
	if($('#wllc').val()!="" && $('#wllc').val()!="0" && $('#wllc').val()!="0.0")
		wl = getbzcs($("#lxbm").val().substr(0,1),"无",$('#wllc').val(),'路面改造工程项目');
	var zcs=parseFloat(yi)+parseFloat(er)+parseFloat(san)+parseFloat(si)+parseFloat(dw)+parseFloat(wl);
	$('#bzcs').html(zcs);
	$('#dfzc').html(accSub(parseFloat($("#tz").val()),parseFloat($("#bzcs").html())));
}
function getbzcs(gldj,jsdj,lc,xmlx){
	var data="lxsh.xmlx="+xmlx+"&lxsh.gldj="+gldj+"&lxsh.jsdj="+jsdj+"&lxsh.lc="+lc;
	//$("#bzcs").html('');
	var newcs=0;
	$.ajax({
		type:'post',
		async:false,
		url:'/jxzhpt/qqgl/selectbzcs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			//var zcs=parseFloat(oldcs)+parseFloat(msg.bzys);
			//$('#bzcs').html(zcs);
			newcs=msg.bzys;
		},
		error : function(){
		 YMLib.Tools.Show('未检索到补助标准错误！error code = 404',3000);
	 }
	});
	return newcs;
}
function selectTSDQ(lxbm,qdzh,zdzh){
	$("#tsdq").text("");
	var data="lxbm="+lxbm+"&qdzh="+qdzh+"&zdzh="+zdzh;
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmjck/selectTSDQ.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg.length>0){
				var tsdqstr="";
				for(var i=0;i<msg.length;i++){
					tsdqstr=tsdqstr+msg[i]+"、";
				}
				tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
				$("#tsdq").text(tsdqstr);
			}
		}
	});	
}

function tsdq1(id,value){
	$("#"+id).combotree({   
		checkbox : true,
		multiple:true,
		async:false,
	    url: '/jxzhpt/xmjzbb/settsdq.do?xzqh='+$.cookie("dist"),
	});
	if(value!=''){
		$("#"+id).combotree('setValue',value);
	}
}

function xmnfs(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i),value:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
}
function xmnf1(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i),value:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
}

function xmnf2(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	});
	$('#'+id).combobox("setValue",first);
}
//加法
function accAdd(arg1,arg2){  
    var r1,r2,m;  
    try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;}  
    try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;}  
    m=Math.pow(10,Math.max(r1,r2));
    return (arg1*m+arg2*m)/m;  
}
//浮点数减法
function accSub(arg1,arg2){
	 var r1,r2,m,n;
	 try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;}
	try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;}
	m=Math.pow(10,Math.max(r1,r2));
	//last modify by deeka
	//动态控制精度长度
	n=(r1>=r2)?r1:r2;
	return ((arg1*m-arg2*m)/m).toFixed(n);
	}
//乘法
function accMul(arg1,arg2)  
{  
    var m=0,s1=arg1.toString(),s2=arg2.toString();  
    try{m+=s1.split(".")[1].length;}catch(e){
    }  
    try{m+=s2.split(".")[1].length;}catch(e){
    }  
    return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);  
}
//除法
function accDiv(arg1,arg2){  
    var t1=0,t2=0,r1,r2;  
    try{t1=arg1.toString().split(".")[1].length;}catch(e){}  
    try{t2=arg2.toString().split(".")[1].length;}catch(e){}  
    with(Math){  
        r1=Number(arg1.toString().replace(".",""));  
        r2=Number(arg2.toString().replace(".",""));  
        return (r1/r2)*pow(10,t2-t1);  
    }  
}
function loadDist3(id, dwbm,yhdw) {
	$('#' + id)
			.combotree(
					{
						checkbox : true,
						url : '/jxzhpt/gcgl/selAllXzqh1.do?yhdw=' + yhdw,
						onBeforeExpand : function(node, param) {
							$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="
									+ node.id;
						},
						onSelect : function(node) {
							YMLib.Var.DistName = node.text;
						}
					});
	$('#' + id).combotree('setValue', dwbm);
}
function loadUnit3(id, dwbm,yhdw) {
	$('#' + id).combotree({
		checkbox : false,
		url : '/jxzhpt/gcgl/selAllUnit1.do?yhdw=' + yhdw,
		onBeforeExpand : function(node, param) {
			$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllBm2.do?yhdw="
					+ node.id;
		},
		onSelect : function(node) {
			YMLib.Var.DistName = node.text
		}
	});
	$('#' + id).combotree('setValue', dwbm);
}
function checkSZ(str){
	
	var g = /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)|(^[1-9][0-9]*.[0-9]*$)/;
	if(str.value==''){
		return;
	}
    if( !g.test(str.value)){
    	alert("请输入正确的数字");
    	$(str).val('');
    	return;
    }
}
function openLsjl(xmbm){
	YMLib.Var.xmbm=xmbm;
	YMLib.UI.createWindow('lsjlxx','历史记录','/jxzhpt/page/qqgl/jhsh/lsjl.jsp','lsjlxx',980,380);
}

function dclxshModule(str){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
	var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var sbthcd='';
	var yhjb=$.cookie("unit2");
	if(yhjb.length==11){
		sbthcd=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		sbthcd=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		sbthcd=7;
	}
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValue');
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl="";
	if(str!='xj'){
		lsjl=$("#lsjl").combobox('getValue');
	}
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	var data="lxsh.xmlx="+str+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.sbzt="+sbzt+"&lxsh.lsjl="+lsjl+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj+"&lxsh.sbthcd="+sbthcd;
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
		window.location.href='/jxzhpt/qqgl/dcModule.do?'+data;
	 });
}
	
	
function dcMoBan(str){
	var lxstr="wnjh_"+str;
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+lxstr;
}
function import_sjgz(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '五年规划信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importsjgzwnjh.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function import_lmgz(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '五年规划信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importlmgzwnjh.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function import_xj(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '五年规划信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importxjwnjh.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
//------------------------------------------------------------------------------------------------------------------------------------
function showAllgj(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
	var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var xmnf=$("#xmnf").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combotree('getText');
	var gldj=$("#gldj").combobox('getValues').join(",");
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectGjwnjh.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
			xmnf:xmnf,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
 	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="sjxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsj('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsj('+index+')">删除</a>  ';
	        }},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]]
		/*,
		view: detailview,
		detailFormatter:function(index,row){  
				return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	if(row.sl!=0){
	    		$('#table_lx'+row.xmbm).datagrid({
		    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
		    		 queryParams: {
		    			 'lx.xmid':row.id,
		    			 'lx.sffirst':'1'
		    			},
	    			columns:[[
			           {field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
			        	   var result ='<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
			        	   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
			        		   result+='&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
			        	   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
			        		   result+= '&nbsp;删除';
			        	   return result;
			           }},
	    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
	    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
	    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
	    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
	    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
	    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
	    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
	    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
	    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
	    			    {field:'lc',title:'里程',width:60,align:'center'},
	    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
	    			]]
		    	});
	    	}
	    	
	    }   */
	}); 
}
function showAlllm(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
	var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combotree('getText');
	var gldj=$("#gldj").combobox('getValues').join(",");
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmwnjh.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
			tsdq:tsdq,
			xmnf:xmnf,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="lmxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editlm('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellm('+index+')">删除</a>  ';
	        }},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]]
		/*,
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	if(row.sl!=0){
	    		var parentindex=index;
		    	$('#table_lx'+row.xmbm).datagrid({
		    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
		    		 queryParams: {
		    			 'lx.jdbs':0,
		    			 'lx.xmid':row.xmbm,
		    			 'lx.sffirst':'1'
		    			},
	    			columns:[[
						{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
							var result ='<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
							if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
								result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
							}
							if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
								result+='&nbsp;删除';
							return result;
						}},
	    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
	    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
	    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
	    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
	    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
	    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
	    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
	    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
	    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
	    			    {field:'lc',title:'里程',width:60,align:'center'},
	    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
	    			]]
		    	});
	    	}
	    	
	    }   */
	}); 
}
function showAllxj(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
	var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combotree('getText');
	var gldj=$("#gldj").combobox('getValues').join(",");
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjwnjh.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
			xmnf:xmnf,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xjxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editxj('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxj('+index+')">删除</a>  ';
	        }},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]]/*,
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxjlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   */
	}); 
}


function dcwnjhExcel(str){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
	var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	var data="lxsh.xmlx="+str+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj;
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
		window.location.href='/jxzhpt/qqgl/dcwnjhExcel.do?'+data;
	 });
}
//添加改建
function addWNJH(url,width,length){
	YMLib.UI.createWindow('lxxx','添加五年计划信息',url,'lxxx',width,length);
}
function delsj(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.id;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delwnjhSjgz.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
function dellm(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.id;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delwnjhLmgz.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
function delxj(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.id;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delwnjhXj.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
function editsj(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑五年规划信息','sjgz_edit.jsp','lxxx',900,380);
}
function editlm(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑五年规划信息','lmgz_edit.jsp','lxxx',900,380);
}
function editxj(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑五年规划信息','xj_edit.jsp','lxxx',900,380);
}