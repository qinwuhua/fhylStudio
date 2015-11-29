function loadDist4(id,yhdw) {
	$('#' + id).combotree(
	{
		checkbox : true,
		url : '/jxzhpt/gcgl/selAllXzqh1.do?yhdw=' + yhdw,
		onBeforeExpand : function(node, param) {
			$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh1.do?yhdw="
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
		url : '/jxzhpt/gcgl/selAllUnit1.do?yhdw=' + yhdw,
		onSelect : function(node) {
			YMLib.Var.DistName = node.text;
		}
	});
//	if(yhdw=='_____36'||yhdw=='36')
//	$('#' + id).combotree('setValue', '11101360000');
//	else{
		$('#' + id).combotree('setValue', yhdw);
	//}
}
function loadDist5(id, dwbm,yhdw) {
	$('#' + id).combotree(
	{
		checkbox : true,
		url : '/jxzhpt/gcgl/selAllXzqh1.do?yhdw=' + yhdw,
		onSelect : function(node) {
			YMLib.Var.DistName = node.text;
		}
	});
	$('#' + id).combotree('setValue', dwbm);
}
function loadUnit5(id, dwbm,yhdw) {
	$('#' + id).combotree({
		checkbox : false,
		url : '/jxzhpt/gcgl/selAllUnit1.do?yhdw=' + yhdw,
		onSelect : function(node) {
			YMLib.Var.DistName = node.text
		}
	});
	$('#' + id).combotree('setValue', dwbm);
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
var rowid;
//年份
function afxmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	for(var i=2015;i<=2020;i++){
		if(i==2015)
			first=myDate.getFullYear()+1-i;
		years.push({text:(i),value:(i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
}

function xmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()+1-i;
		years.push({text:(myDate.getFullYear()+1-i),value:(myDate.getFullYear()+1-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
}
function xmnf1(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0) first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
	$('#'+id).combobox("setValue",first);
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

function tsdq(id){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	}); 
}
function addJck(jsp,w,h){
//	var unit=$.cookie("unit");
//	if(unit=='21101360000' || unit=='11101360000' || unit=='36') {
//		alert("对不起，省级单位不可导入数据！");
//		return;
//	}
	YMLib.UI.createWindow('jck_add','添加项目',jsp,'jck_add',w,h);
}
//基础库安保工程
function xgJckabgc(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目信息','abgc_xg.jsp','jck_xg',900,450);
}
function ckJckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','abgc_ck.jsp','jck_ck',900,450);
}

//基础库灾害防治
function xgJckzhfz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目信息','zhfz_xg.jsp','jck_xg',900,450);
}
function ckJckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','zhfz_ck.jsp','jck_ck',900,450);
}

//基础库危桥改造
function xgJckwqgz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('jck_xg','修改项目信息','wqgz_xg.jsp','jck_xg',900,450);
}
function ckJckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','wqgz_ck.jsp','jck_ck',900,450);
}

//审查库项目添加
function addSck(jsp,w,h){
//	var unit=$.cookie("unit");
//	if(unit=='21101360000' || unit=='11101360000' || unit=='36') {
//		alert("对不起，省级单位不可导入数据！");
//		return;
//	}
	YMLib.UI.createWindow('sck_add','添加项目',jsp,'sck_add',w,h);
}
//审查库危桥改造
function xgSckwqgz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('sck_xg','修改项目信息','wqgz_xg.jsp','sck_xg',900,500);
}
function ckSckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','wqgz_ck.jsp','sck_ck',900,500);
}
//审查库安保工程
function xgSckabgc(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('sck_xg','修改项目信息','abgc_xg.jsp','sck_xg',900,500);
}
function ckSckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','abgc_ck.jsp','sck_ck',900,500);
}
//审查库灾害防治
function xgSckzhfz(xg_id){
	rowid=xg_id;
	YMLib.UI.createWindow('sck_xg','修改项目信息','zhfz_xg.jsp','sck_xg',900,500);
}
function ckSckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','zhfz_ck.jsp','sck_ck',900,500);
}
//excel基础库数据导入
function importData(flag){
//	var unit=$.cookie("unit");
//	if(unit=='21101360000' || unit=='11101360000' || unit=='36') {
//		alert("对不起，省级单位不可导入数据！");
//		return;
//	}
	var url="";
	if(flag=='wqgz'){
		url="/jxzhpt/xmjck/importWqgz.do";
	}
	if(flag=='abgc'){
		url="/jxzhpt/xmjck/importAbgc.do";
	}
	if(flag=='zhfz'){
		url="/jxzhpt/xmjck/importZhfz.do";
	}
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+flag,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
//excel审查库数据导入
function importData_sc(flag){
//	var unit=$.cookie("unit");
//	if(unit=='21101360000' || unit=='11101360000' || unit=='36') {
//		alert("对不起，省级单位不可导入数据！");
//		return;
//	}
	var url="";
	if(flag=='wqgz_sc'){
		url="/jxzhpt/xmsck/importWqgz_sc.do";
	}
	if(flag=='abgc_sc'){
		url="/jxzhpt/xmsck/importAbgc_sc.do";
	}
	if(flag=='zhfz_sc'){
		url="/jxzhpt/xmsck/importZhfz_sc.do";
	}
	//YMLib.UI.createWindow('wqxx1','车购税资金到位情况','/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+flag,'wqxx1',450,400);
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+flag,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
//基础库模板导出
function exportModule(filename){
	window.location.href="/jxzhpt/xtgl/getModule.do?moduleName="+filename;
}
//审查库模板导出
var tbdw;
function exportModule_sc(filename){
		 if($.cookie("unit2")=='______36') tbdw= "";
	 		else tbdw= $.cookie("unit2");
//	YMLib.UI.createWindow('exportChooseDw','按单位导出模板','/jxzhpt/page/chooseDw.jsp?filename='+filename,'exportChooseDw',400,300);
	window.location.href="/jxzhpt/xtgl/getModule_sc.do?moduleName="+filename+"&tbdw="+tbdw;
}
//危桥改造导出excel 
function exportExcel_wqgz(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&sbzt='+$("#sbzt").combobox("getValue")+
 	'&jsdj='+$("#jsdj").combobox("getValue")+
 	'&akjfl='+$("#akjfl").combobox("getValue")+'&lxbm='+$("#lxbm").val()+
 	'&qlbh='+$("#qlbh").val()+
 	'&sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_wqgz.do?"+param;
}
//安保工程改造导出excel 
function exportExcel_abgc(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&sbzt='+$("#sbzt").combobox("getValue")+
 	'&lxjsdj='+$("#lxjsdj").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&bz='+$("#bz").combobox("getValue")+
 	'&sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_abgc.do?"+param;
}
//灾害防治改造导出excel 
function exportExcel_zhfz(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&sbzt='+$("#sbzt").combobox("getValue")+
 	'&lxjsdj='+$("#lxjsdj").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&bz='+$("#bz").combobox("getValue")+
 	'&sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_zhfz.do?"+param;
}
//危桥改造审核excel导出
function exportExcel_wqgz_sh(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&shzt='+$("#shzt").combobox("getValue")+
 	'&jsdj='+$("#jsdj").combobox("getValue")+
 	'&akjfl='+$("#akjfl").combobox("getValue")+'&lxbm='+$("#lxbm").val()+
 	'&qlbh='+$("#qlbh").val()+
 	'&sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_wqgz_sh.do?"+param;
}
//安保工程审核excel导出
function exportExcel_abgc_sh(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&shzt='+$("#shzt").combobox("getValue")+
 	'&lxjsdj='+$("#lxjsdj").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&bz='+$("#bz").combobox("getValue")+
 	'&sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_abgc_sh.do?"+param;
}
//灾害防治审核excel导出
function exportExcel_zhfz_sh(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&shzt='+$("#shzt").combobox("getValue")+
 	'&lxjsdj='+$("#lxjsdj").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&bz='+$("#bz").combobox("getValue")+
 	'&sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmjck/exportExcel_zhfz_sh.do?"+param;
}
//危桥改造审查库管理excel导出
function exportExcel_wqgz_scgl(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&sbzt='+$("#sbzt").combobox("getValue")+
 	'&jsdj='+$("#jsdj").combobox("getValue")+
 	'&akjfl='+$("#akjfl").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&qlbh='+$("#qlbh").val()+
 	'&bzls='+$("#bzls").combobox("getValue")+
 	'&sck_sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_wqgz_scgl.do?"+param;
}
//安保工程审查库管理excel导出
function exportExcel_abgc_scgl(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&sbzt='+$("#sbzt").combobox("getValue")+
 	'&lxjsdj='+$("#lxjsdj").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&bz='+$("#bz").combobox("getValue")+
 	'&bzls='+$("#bzls").combobox("getValue")+
 	'&sck_sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_abgc_scgl.do?"+param;
}
//灾害防治审查库管理excel导出
function exportExcel_zhfz_scgl(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&sbzt='+$("#sbzt").combobox("getValue")+
 	'&lxjsdj='+$("#lxjsdj").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&bz='+$("#bz").combobox("getValue")+
 	'&bzls='+$("#bzls").combobox("getValue")+
 	'&sck_sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_zhfz_scgl.do?"+param;
}
//危桥改造审查库管理excel导出
function exportExcel_wqgz_scsh(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&qlmc='+$("#qlmc").val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&shzt='+$("#shzt").combobox("getValue")+
 	'&jsdj='+$("#jsdj").combobox("getValue")+
 	'&akjfl='+$("#akjfl").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&qlbh='+$("#qlbh").val()+
 	'&bzls='+$("#bzls").combobox("getValue")+
 	'&sck_sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_wqgz_scsh.do?"+param;
}
//安保工程审查库管理excel导出
function exportExcel_abgc_scsh(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&shzt='+$("#shzt").combobox("getValue")+
 	'&lxjsdj='+$("#lxjsdj").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&bz='+$("#bz").combobox("getValue")+
 	'&bzls='+$("#bzls").combobox("getValue")+
 	'&sck_sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_abgc_scsh.do?"+param;
}
//灾害防治审查库管理excel导出
function exportExcel_zhfz_scsh(){
	var cd=$.cookie("unit2")=='______36'?7:$.cookie("unit2").length;
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
	var xzqhdm=$("#xzqhmc").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
	var param='gydw='+gydwstr+
 	'&xzqhdm='+xzqhstr+
 	'&lxmc='+$('#lxmc').val()+
 	'&xmnf='+$("#xmnf").combobox("getValue")+
 	'&shzt='+$("#shzt").combobox("getValue")+
 	'&lxjsdj='+$("#lxjsdj").combobox("getValue")+
 	'&lxbm='+$("#lxbm").val()+
 	'&bz='+$("#bz").combobox("getValue")+
 	'&bzls='+$("#bzls").combobox("getValue")+
 	'&sck_sbthcd='+cd;
	//特殊地区 条件	
	window.location.href="/jxzhpt/xmsck/exportExcel_zhfz_scsh.do?"+param;
}