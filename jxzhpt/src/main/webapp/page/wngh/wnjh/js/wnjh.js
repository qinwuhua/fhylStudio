
function cxqdmc(lxbm,qdzh){
	$('#qdmc').val('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxqdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#qdmc').val(msg.qdmc);
		}
	});
}
function cxzdmc(lxbm,qdzh){
	$('#zdmc').val('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxzdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#zdmc').val(msg.zdmc);
		}
	});
}

var obj=new Object();
function Lsjl(xmbm){
	YMLib.Var.xmbm=xmbm;
	YMLib.UI.createWindow('lsjlwindow','历史记录','lsjl.jsp','lsjlwindow',980,300);
	//openWindow('lsjlwindow','历史记录','/jxzhpt/page/wngh/wnjh/lsjl.jsp',980,300);
}
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
function setxmnf(id,flag){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	if(flag=='010111010101'||flag=='01011101010101'||flag=='01011101010102'||flag=='01011101010103'){
		$("#bstext").html('十三五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2020)
					first=2020;
				if(first<2016)
					first=2016;
			}
			years.push({text:(2015+5-i),value:(2015+5-i)});
		}
	}
	if(flag=='010111020101'||flag=='01011102010101'||flag=='01011102010102'||flag=='01011102010103'){
		$("#bstext").html('十四五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2025)
					first=2025;
				if(first<2021)
					first=2021;
			}
			years.push({text:(2020+5-i),value:(2020+5-i)});
		}
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setValue",first+'');
	$('#id'+first).attr('checked', true);
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
function loadDist4(id,yhdw) {
	$('#' + id).combotree(
	{
		checkbox : true,
		url : '/jxzhpt/gcgl/selAllXzqh11.do?yhdw=' + yhdw,
		onBeforeExpand : function(node, param) {
			$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh22.do?yhdw="
					+ node.id;
		},
		onSelect : function(node) {
			YMLib.Var.DistName = node.text;
		}
	});
	$('#' + id).combotree('setValue', '360000');
}
function loadUnit4(id,yhdw) {
	$('#' + id).combotree({
		checkbox : false,
		url : '/jxzhpt/gcgl/selAllUnit11.do?yhdw=' + yhdw,
		onSelect : function(node) {
			YMLib.Var.DistName = node.text;
		}
	});
	$('#' + id).combotree('setValue', '21101360000');
}
function loadDist5(id, dwbm,yhdw) {
	$('#' + id).combotree(
	{
		checkbox : true,
		url : '/jxzhpt/gcgl/selAllXzqh11.do?yhdw=' + yhdw,
		onSelect : function(node) {
			YMLib.Var.DistName = node.text;
		}
	});
	$('#' + id).combotree('setValue', dwbm);
}
function loadUnit5(id, dwbm,yhdw) {
	$('#' + id).combotree({
		checkbox : false,
		url : '/jxzhpt/gcgl/selAllUnit11.do?yhdw=' + yhdw,
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
	if(lxbm.substr(0,1)=='Y' || lxbm.substr(0,1)=='C')
		lxbm=lxbm+xzqh;
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
	var tz=0;var bzcs=0;var yhdk=0;var gz=0;var sz=0;
	if($("#tz").val()!='')
		tz=parseFloat($("#tz").val());
	if($("#bzcs").val()!='')
		bzcs=parseFloat($("#bzcs").val());
	if($("#yhdk").val()!='')
		yhdk=parseFloat($("#yhdk").val());
	if($("#gz").val()!='')
		gz=parseFloat($("#gz").val());
	if($("#sz").val()!='')
		sz=parseFloat($("#sz").val());
	if(bzcs>tz){
		alert("投资不能小于补助测算");
		return
	}
	var zh=accSub(tz,bzcs);
	var dfzc=accSub(zh,yhdk);
	var dfzc1=accSub(dfzc,gz);
	var dfzc2=accSub(dfzc1,sz);
	$("#dfzc").html(dfzc2);
}
function checkdfzc1(str){
	checkSZ(str);
	$("#dfzc").html('');
	var tz=0;var bzcs=0;var yhdk=0;var gz=0;var sz=0;
	if($("#tz").val()!='')
		tz=parseFloat($("#tz").val());
	if($("#bzcs").val()!='')
		bzcs=parseFloat($("#bzcs").val());
	if($("#yhdk").val()!='')
		yhdk=parseFloat($("#yhdk").val());
	if($("#gz").val()!='')
		gz=parseFloat($("#gz").val());
	if($("#sz").val()!='')
		sz=parseFloat($("#sz").val());
	if(bzcs>tz){
		alert("投资不能小于补助测算");
		return
	}
	var zh=accSub(tz,bzcs);
	var dfzc=accSub(zh,yhdk);
	var dfzc1=accSub(dfzc,gz);
	var dfzc2=accSub(dfzc1,sz);
	$("#dfzc").html(dfzc2);
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
	var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
	if($('#yilc').val()!='')
		yilc=parseFloat($('#yilc').val());
	if($('#erlc').val()!='')
		erlc=parseFloat($('#erlc').val());
	if($('#sanlc').val()!='')
		sanlc=parseFloat($('#sanlc').val());
	if($('#silc').val()!='')
		silc=parseFloat($('#silc').val());
	if($('#wllc').val()!='')
		wllc=parseFloat($('#wllc').val());
	if($('#dwlc').val()!='')
		dwlc=parseFloat($('#dwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#lc').html(hj5);
}
function cesuan(){
	var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
	if($('#jhyilc').val()!='')
		yilc=parseFloat($('#jhyilc').val());
	if($('#jherlc').val()!='')
		erlc=parseFloat($('#jherlc').val());
	if($('#jhsanlc').val()!='')
		sanlc=parseFloat($('#jhsanlc').val());
	if($('#jhsilc').val()!='')
		silc=parseFloat($('#jhsilc').val());
	if($('#jhwllc').val()!='')
		wllc=parseFloat($('#jhwllc').val());
	if($('#jhdwlc').val()!='')
		dwlc=parseFloat($('#jhdwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#jhlc').html(hj5);
}
function cesuan2(){
	var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
	if($('#yilc').val()!='')
		yilc=parseFloat($('#yilc').val());
	if($('#erlc').val()!='')
		erlc=parseFloat($('#erlc').val());
	if($('#sanlc').val()!='')
		sanlc=parseFloat($('#sanlc').val());
	if($('#silc').val()!='')
		silc=parseFloat($('#silc').val());
	if($('#wllc').val()!='')
		wllc=parseFloat($('#wllc').val());
	if($('#dwlc').val()!='')
		dwlc=parseFloat($('#dwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#lc').html(hj5);
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
	for(var i=2015;i<=2020;i++){
		years.push({text:(i),value:(i)});
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
	var g = /(^-?\d+$)|(^(-?\d+)(\.\d+)?$)/;
	if(str.value==''){
		return;
	}
    if( !g.test(str.value)){
    	alert("请输入正确的数字");
    	$(str).val('');
    	return;
    }
}
	
function dcMoBan(str){
	var lxstr="wngh_"+str;
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
function showgjtj(xmlx){
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
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combotree('getText');
	var gldj=$("#gldj").combobox('getValues').join(",");
	var data="xzqh="+xzqhstr+"&gydw="+gydwstr
	+"&xmnf="+xmnf+"&tsdq="+tsdq+"&jsdj="+jsdj+"&gldj="+gldj+'&lxsh.xmmc='+$("#xmmc").val()+'&lxsh.ghlxbh='+$("#lxbm").val()+'&lxsh.lxmc='+$("#lxmc").val()+"&xmlx="+xmlx+'&lxsh.lsjl='+$("#lsjl").combobox('getValue');
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/showgjtj.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#xmsl").html(msg.sl);
			 $("#tz").html(msg.tz);
			 $("#bzcs").html(msg.bzys);
			 $("#lc").html(msg.lc);
		 }
		 });
}
function showAllgj(){
	showgjtj('sjgz');
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
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
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
	    height:$(window).height()-190,
	    width:$(window).width()-20,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
			xmnf:xmnf,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			'lxsh.lsjl':$("#lsjl").combobox('getValue'),
			'lxsh.xmmc':$("#xmmc").val(),
			'lxsh.ghlxbh':$("#lxbm").val(),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
 	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="sjxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsj('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsj('+index+')">删除</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">  添加路线</a>  ';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:Lsjl('+"'"+row.id+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
	        	if(row.sl>0)
	        	return '<font color="red">'+row.xmmc+'</font>';
	        	else return  row.xmmc;
	        }},
	        {field : 'xmnf',title : '项目年份',width : 80,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'zjhlc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){  
				return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	if(row.sl!=0){
	    		$('#table_lx'+row.id).datagrid({
		    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
		    		 queryParams: {
		    			 'lxsh.xmbm':row.id,
		    			 'lxsh.sffirst':'1'
		    			},
	    			columns:[[
			           {field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
			        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsjlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
			           }},
	    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
	    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
	    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
	    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
	    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
	    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
	    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
	    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
	    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
	    			    {field:'jhlc',title:'里程',width:60,align:'center'}
	    			]]
		    	});
	    	}
	    	
	    }   
	}); 
}
function showAlllm(){
	showgjtj('lmgz');
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
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
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
	    height:$(window).height()-190,
	    width:$(window).width()-20,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
			tsdq:tsdq,
			xmnf:xmnf,
			jsdj:jsdj,
			gldj:gldj,
			'lxsh.lsjl':$("#lsjl").combobox('getValue'),
			'lxsh.xmmc':$("#xmmc").val(),
			'lxsh.ghlxbh':$("#lxbm").val(),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="lmxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editlm('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellm('+index+')">删除</a>  '
	        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">     添加路线</a>  ';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:Lsjl('+"'"+row.id+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
	        	if(row.sl>0)
	        	return '<font color="red">'+row.xmmc+'</font>';
	        	else return  row.xmmc;
	        }},
	        {field : 'xmnf',title : '项目年份',width : 80,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 120,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhlc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	if(row.sl!=0){
	    		var parentindex=index;
		    	$('#table_lx'+row.id).datagrid({
		    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
		    		 queryParams: {
		    			 'lxsh.xmbm':row.xmbm,
		    			 'lxsh.sffirst':'1'
		    			},
	    			columns:[[
						{field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
				        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editlmlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
						}},
	    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
	    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
	    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
	    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
	    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
	    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
	    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
	    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
	    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
	    			    {field:'lc',title:'里程',width:60,align:'center'}
	    			]]
		    	});
	    	}
	    	
	    }   
	}); 
}
function showAllxj(){
	showgjtj('xj');
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
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
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
	    height:$(window).height()-190,
	    width:$(window).width()-20,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
			xmnf:xmnf,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			'lxsh.lsjl':$("#lsjl").combobox('getValue'),
			'lxsh.xmmc':$("#xmmc").val(),
			'lxsh.ghlxbh':$("#lxbm").val(),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xjxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editxj('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxj('+index+')">删除</a>  '
	        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">     添加路线</a>  ';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:Lsjl('+"'"+row.id+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
	        	if(row.sl>0)
	        	return '<font color="red">'+row.xmmc+'</font>';
	        	else return  row.xmmc;
	        }},
	        {field : 'xmnf',title : '项目年份',width : 80,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhlc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	if(row.sl!=0){
	    		$('#table_lx'+row.id).datagrid({
		    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
		    		 queryParams: {
		    			 'lxsh.xmbm':row.xmbm,
		    			 'lxsh.sffirst':'1'
		    			},
	    			columns:[[
						{field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
				        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editxjlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
						}},
	    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
	    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
	    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
	    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
	    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
	    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
	    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
	    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
	    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
	    			    {field:'lc',title:'里程',width:60,align:'center'}
	    			]]
		    	});
	    	}
	    }   
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combotree('getText');
	var gldj=$("#gldj").combobox('getValues').join(",");
	var xmlx1='';
	if(xmlx=='gsdgz'){
		xmlx1=$("#xmlx").combobox("getValues").join(",");
		if(xmlx1.substr(0,1)==',')
			xmlx1=xmlx1.substr(1,xmlx1.length);
	}
	
	var data="lxsh.xmlx="+str+"&lxsh.xmlx1="+xmlx1+"&lxsh.xmnf="+xmnf+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj+'&lxsh.xmmc='+$("#xmmc").val()+'&lxsh.ghlxbh='+$("#lxbm").val()+'&lxsh.lxmc='+$("#lxmc").val()+'&lxsh.lsjl='+$("#lsjl").combobox('getValue');
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
				 showgjtj('sjgz');
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
				 showgjtj('lmgz');
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
				 showgjtj('xj');
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

function tjsjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','添加路线','sjgzlx_add.jsp','lxxx',900,380);
}
function tjlmlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','添加路线','lmgzlx_add.jsp','lxxx',900,380);
}
function tjxjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','添加路线','xjlx_add.jsp','lxxx',900,380);
}
function delsjlx(index1,index){
	var xmbm=$("#datagrid").datagrid('getRows')[index1].id;
	var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteWnlx.do',
        data:'lxsh.id='+data.id+"&lxsh.xmlx=sjgz",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				$("#table_lx"+xmbm).datagrid("reload");
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}
function editsjlx(index1,index){
	var xmbm=$("#datagrid").datagrid('getRows')[index1].id;
	var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线','sjgzlx_xg.jsp','lxxx',900,380);
}
function editlmlx(index1,index){
	var xmbm=$("#datagrid").datagrid('getRows')[index1].id;
	var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线','lmgzlx_xg.jsp','lxxx',900,380);
}
function editxjlx(index1,index){
	var xmbm=$("#datagrid").datagrid('getRows')[index1].id;
	var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线','xjlx_xg.jsp','lxxx',900,380);
}
//--------------------------------------------------------------------


function showAllgj__ck(){
	showgjtj('sjgz');
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
	if(xmnf=='')
		xmnf=new Date().getFullYear();
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
			gldj:gldj,
			'lxsh.lsjl':$("#lsjl").combobox('getValue'),
			'lxsh.xmmc':$("#xmmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
//	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
// 	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="sjxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsj('+index+')">编辑</a>  '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsj('+index+')">删除</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">     添加路线</a>  ';
//	        }},
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:Lsjl('+"'"+row.id+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
	        	if(row.sl>0)
	        	return '<font color="red">'+row.xmmc+'</font>';
	        	else return  row.xmmc;
	        }},
	        {field : 'xmnf',title : '项目年份',width : 80,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhlc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){  
				return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	if(row.sl!=0){
	    		$('#table_lx'+row.id).datagrid({
		    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
		    		 queryParams: {
		    			 'lxsh.xmbm':row.id,
		    			 'lxsh.sffirst':'1'
		    			},
	    			columns:[[
//			           {field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
//			        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsjlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
//			           }},
	    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
	    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
	    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
	    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
	    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
	    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
	    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
	    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
	    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
	    			    {field:'jhlc',title:'里程',width:60,align:'center'}
	    			]]
		    	});
	    	}
	    	
	    }   
	}); 
}
function showAlllm__ck(){
	showgjtj('lmgz');
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
	if(xmnf=='')
		xmnf=new Date().getFullYear();
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
			gldj:gldj,
			'lxsh.lsjl':$("#lsjl").combobox('getValue'),
			'lxsh.xmmc':$("#xmmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
//	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
//	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="lmxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editlm('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellm('+index+')">删除</a>  '
//	        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">     添加路线</a>  ';
//	        }},
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:Lsjl('+"'"+row.id+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
	        	if(row.sl>0)
	        	return '<font color="red">'+row.xmmc+'</font>';
	        	else return  row.xmmc;
	        }},
	        {field : 'xmnf',title : '项目年份',width : 80,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 120,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	if(row.sl!=0){
	    		var parentindex=index;
		    	$('#table_lx'+row.id).datagrid({
		    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
		    		 queryParams: {
		    			 'lxsh.xmbm':row.xmbm,
		    			 'lxsh.sffirst':'1'
		    			},
	    			columns:[[
//						{field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
//				        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editlmlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
//						}},
	    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
	    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
	    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
	    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
	    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
	    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
	    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
	    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
	    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
	    			    {field:'lc',title:'里程',width:60,align:'center'}
	    			]]
		    	});
	    	}
	    	
	    }   
	}); 
}
function showAllxj__ck(){
	showgjtj('xj');
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
	if(xmnf=='')
		xmnf=new Date().getFullYear();
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
			gldj:gldj,
			'lxsh.lsjl':$("#lsjl").combobox('getValue'),
			'lxsh.xmmc':$("#xmmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
//	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
//	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xjxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editxj('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxj('+index+')">删除</a>  '
//	        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">     添加路线</a>  ';
//	        }},
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:Lsjl('+"'"+row.id+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
	        	if(row.sl>0)
	        	return '<font color="red">'+row.xmmc+'</font>';
	        	else return  row.xmmc;
	        }},
	        {field : 'xmnf',title : '项目年份',width : 80,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'xjlc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	if(row.sl!=0){
	    		$('#table_lx'+row.id).datagrid({
		    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
		    		 queryParams: {
		    			 'lxsh.xmbm':row.xmbm,
		    			 'lxsh.sffirst':'1'
		    			},
	    			columns:[[
//						{field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
//				        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editxjlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
//						}},
	    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
	    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
	    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
	    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
	    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
	    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
	    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
	    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
	    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
	    			    {field:'lc',title:'里程',width:60,align:'center'}
	    			]]
		    	});
	    	}
	    }   
	}); 
}
