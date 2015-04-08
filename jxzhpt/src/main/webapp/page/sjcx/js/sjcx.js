var checkValues;
var gydw=parent.YMLib.Var.gydw;
function cxzd(){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表','zdycx_zd.jsp','zd_xz','900','380');
}
function Wqgz(){
	YMLib.UI.createWindow('zd_wqgz','危桥项目字段选择列表','zdycx_wqgz.jsp','zd_wqgz','900','380');
}
function tsdq(id){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	}); 
}
//路网项目JS
//基础库安保工程
function ckJckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','abgc_jck_ck.jsp','jck_ck',900,450);
}
//基础库灾害防治
function ckJckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','zhfz_jck_ck.jsp','jck_ck',900,450);
}
//基础库危桥改造
function ckJckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('jck_ck','查看项目详情','wqgz_jck_ck.jsp','jck_ck',900,450);
}
//审查库危桥改造
function ckSckwqgz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','wqgz_sck_ck.jsp','sck_ck',900,500);
}
//审查库安保工程
function ckSckabgc(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','abgc_sck_ck.jsp','sck_ck',900,500);
}
//审查库灾害防治
function ckSckzhfz(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('sck_ck','查看项目详情','zhfz_sck_ck.jsp','sck_ck',900,500);
}

//年份
function xmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:""});
	for(var i=0;i<=10;i++){
		if(i==0) first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
	$('#'+id).combobox("setValue","");
}
/*//基础库管理
function zdy(){
	$("#grid").datagrid({    
		 url:"../js/lwxm1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	});  
}*/

