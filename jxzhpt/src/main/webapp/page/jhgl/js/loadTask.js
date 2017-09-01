function openLsjlWindow(id,index,xmlx,title){
	YMLib.Var.Row = $('#'+id).datagrid("getSelected");
	YMLib.Var.XMLX=xmlx;
	YMLib.UI.createWindow('sjlsxx',title,"/jxzhpt/page/jhgl/jhkgl/sjlsxx.jsp",'sjlsxx',1000,300);
}
function openZjzjWindow(id,url){
	YMLib.Var.id=id;
	YMLib.Var.url=url;
	YMLib.Var.Row = $('#'+id).datagrid("getSelected");
	YMLib.UI.createWindow('zjzjadd','资金追加',"/jxzhpt/page/jhgl/zjxd/zjzj.jsp",'zjzjadd',500,300);
}
function closeWindow2(id){
	parent.$('#'+id).window("destroy");
}
function isNumber(txt){
	var reg = new RegExp("^[0-9]*$");
	if(!reg.test($(txt).val())){
		alert("此处请输入数字！");
		$(txt).focus();
	}
}
function loadJhzt(id){
	var ztxian=[{"value":'',"text":"全部"},{"value":'未上报',"text":"未上报"},{"value":'已上报',"text":"已上报"}
		,{"value":'未审核',"text":"未审核"},{"value":'已审核',"text":"已审核"}];
	var ztshi=[{"value":"","text":"全部"},{"value":'待上报',"text":"待上报"},{"value":'未上报',"text":"未上报"}
		,{"value":'已上报',"text":"已上报"},{"value":'已审核',"text":"已审核"}];
	var ztsheng=[{"value":"","text":"全部"},{"value":'未上报',"text":"未上报"},{"value":'未审核',"text":"未审核"}
		,{"value":'已审核',"text":"已审核"}];
	$('#'+id).combobox({    
		readonly:true,
		valueField:'value',
		textField:'text'
	});
	if(roleName()=="县级"){
		$('#'+id).combobox("loadData",ztxian);
	}
	if(roleName()=="市级"){
		$('#'+id).combobox("loadData",ztshi);
	}
	if(roleName()=="省级"){
		$('#'+id).combobox("loadData",ztsheng);
	}
}
/**
 * 管养单位下拉框
 * @param id
 */
function gydwComboxTree(id){
	loadUnit(id,$.cookie("unit"));
}
function getgydw(id){
	var result="";
	
	var gydw = $("#"+id).combotree("getValues");
	/*if(gydws.length==0 || gydws.length==1){
		result=$.cookie("unit2");
	}else{
		result=gydws.join(',');
	}*/
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			result='36';
		else result= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		result=gydw[0] ;
		}else{
			result= gydw.join(',');
		}
	
	return result;
}
/**
 * 获取行政区划选中的值
 * @param id 元素ID
 * @returns {String} 选中的行政区划
 */
function getxzqhdm(id){
	var result="";
	var xzqhdm = $("#"+id).combotree("getValues");
	/*if(xzqhs.length==0 || xzqhs.length==1){
		result=$.cookie("dist2");
	}else{
		result=xzqhs.join(',');
	}*/
	if(xzqhdm.length==0){
		result= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		result=xzqhdm[0] ;
		}else{
			result= xzqhdm.join(',');
		}
	
	
	return result;
}
function radioChecked(name,value){
	$.each($("input[name='"+name+"']"),function(index,item){
		if($(item).val()==value){
			$(item).attr('checked','true');
		}
	});
}
function onclickXx(xmlx,id){
	var url="/jxzhpt/page/jhgl/jhkxx/";
	if(xmlx=="路面改建")
		url+="gclmgj.jsp";
	else if(xmlx=="路面升级")
		url+="gclmsj.jsp";
	else if(xmlx=="灾毁重建")
		url+="shxm.jsp";
	else if(xmlx=="养护大中修")
		url+="yhdzx.jsp";
	else if(xmlx=="安保工程")
		url+="abgc.jsp";
	else if(xmlx=="灾害防治")
		url+="zhfz.jsp";
	else if(xmlx=="危桥改造"){
		url+="wqgz.jsp";
	}
	parent.YMLib.Var.jhbm=id;
	parent.YMLib.Var.bz="xx";
	parent.YMLib.UI.createWindow('xmxx_xx',xmlx,url,'xmxx',1000,500);
}
function sbnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i),value:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
}
/**
 * 行政区划下拉框
 * @param id
 */
function xzqhComboxTree(id){
	loadDist(id,"360000");
}
function jhnf(id,url){
	$('#'+id).combobox({    
	    url:url,
	    valueField:'text',    
	    textField:'text'   
	}); 
}
function tsdq(id){
	$('#'+id).combobox({    
	    url:'../../../jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	}); 
}
function AddWqgz(){
	openDialog("wqgz_xx", "添加危桥改造计划库信息", "../add/wqgzAdd.jsp");
}
function AddAbgc(){
	openDialog("abgc_xx", "添加安保工程计划库信息", "../add/abgcAdd.jsp");
}
function Addzhfz(){
	openDialog("zhfz_xx", "添加灾害防治计划库信息", "../add/zhfzAdd.jsp");
}
//步骤(xx,sh)   点击详细时对应的ID   资金下达的ID
var bz,xxId,zjId,sckid;
/**
 * 弹出详细信息层
 * @param id ID
 * @param title 标题
 * @param href url路径
 */
function openDialog(id,title,href){
	bz=id.substring(id.indexOf('_')+1);
	rowDate = gridObj.datagrid("getSelected");
	xxId=rowDate.id;
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : 1000,
		height : 500,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true,
	}).dialog("setTitle",title).dialog("open");
}
function openAdd(id,title,href){
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : 1000,
		height : 500,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true
	}).dialog("setTitle",title).dialog("open");
}
var zjxddiv;
function openZjxd(id,title,href,width,height,zjid){
	zjId=zjid;
	bz=id;
	zjxddiv = $('<div></div>').dialog({
		iconCls : 'icon-edit',
		href:href,
		width : width,
		height : height,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true,
		onClose:function(){
			$(this).dialog('destroy',false);
		}
	}).dialog("setTitle",title).dialog("open");
}
function addZjxd(){
	var zjxd={'zjxd.xmid':xxId,'zjxd.xdnf':$('#zjxdnf').combobox("getValue"),'zjxd.xdzj':$('#xdzj1').val(),'zjxd.ztz':$('#ztz').val(),
			'zjxd.btzzj':$('#btzzj').val(),'zjxd.sfzj':$('#sfzj').val(),'zjxd.tbdw':$('#tbdw').html(),
			'zjxd.tbtime':$('#tbsj').val(),'zjxd.stz':$('#stz1').val(),'zjxd.jhxdwh':$('#jhxdwh').val()};
	$.ajax({
		type:'post',
		url:'../../../jhgl/addZjxd.do',
		dataType:'json',
		data:zjxd,
		success:function(data){
			alert("添加成功！");
			closezjxd();
			queryZjxdList('../../../jhgl/queryZjxdByXmId.do');
		}
	});
}
//excel模板导出
//审查库模板导出
function exportModule(filename){
	YMLib.UI.createWindow('exportChooseDw','按单位导出模板','/jxzhpt/page/chooseDw.jsp?filename='+filename,'exportChooseDw',400,300);
	//window.location.href="/jxzhpt/xtgl/getModule_sc.do?moduleName="+filename;
}
//导出excel
function exportExcel(flag,mode){
//	var param=JSON.stringify(queryParams);
//	param=param.replace(/null/g,'').replace(/undefined/g,'');
//	param=param.substring(1, param.length-1);
	if(flag=='abgc'){
		var xmnf=$("#sbnf").combobox("getValues").join(",");
		if(xmnf.substr(0,1)==',')
			xmnf=xmnf.substr(1,xmnf.length);
		var jsdj=$("#ddlPDDJ").combobox("getValues").join(",");
		if(jsdj.substr(0,1)==',')
			jsdj=jsdj.substr(1,jsdj.length);
		var gldj=$("#ddlGldj").combobox("getValues").join(",");
		if(gldj.substr(0,1)==',')
			gldj=gldj.substr(1,gldj.length);
		var tsdq=$("#ddlTSDQ").combobox("getValues").join(",");
		if(tsdq.substr(0,1)==',')
			tsdq=tsdq.substr(1,tsdq.length);
		params="&lx.gydwbm="+getgydw("gydw")+"&lx.xzqhdm="+getxzqhdm('xzqh')+"&lx.lxmc="+$('#txtRoad').val()+
				"&jh.jhnf="+xmnf+"&lx.lxjsdj="+jsdj+"&lx.gldj="+gldj+
				"&lx.lxbm="+$('#lxbm').val()+"&lx.tsdq="+tsdq;
		//param="jh.sbzt="+$("#ddlSHZT").val()+"&jh.spzt="+""+"&jh.jhnf="+$('#sbnf').combobox('getValue')+"&jh.jhkgsj="+""+"&jh.jhwgsj"+""+"&jh.pfztz"+""+"&lx.gydw="+$('#gydw').combotree('getText')+"&lx.gydwdm="+$('#gydw').combotree('getValue')+"&lx.xzqhmc="+$('#xzqh').combotree('getText')+"&lx.xzqhdm="+$('#xzqh').combotree('getValue')+"&lx.lxmc="+$("#txtRoad").val();
		window.location.href="/jxzhpt/jhgl/exportExcel_jh_abgc.do?flag="+flag+"&"+params;
	}
	if(flag=='afgc'){
		var xmnf=$("#sbnf").combobox("getValues").join(",");
		if(xmnf.substr(0,1)==',')
			xmnf=xmnf.substr(1,xmnf.length);
		var jsdj=$("#ddlPDDJ").combobox("getValues").join(",");
		if(jsdj.substr(0,1)==',')
			jsdj=jsdj.substr(1,jsdj.length);
		var gldj=$("#ddlGldj").combobox("getValues").join(",");
		if(gldj.substr(0,1)==',')
			gldj=gldj.substr(1,gldj.length);
		var tsdq=$("#ddlTSDQ").combobox("getValues").join(",");
		if(tsdq.substr(0,1)==',')
			tsdq=tsdq.substr(1,tsdq.length);
		params="&lx.gydwbm="+getgydw("gydw")+"&jh.xmlx=af"+"&lx.xzqhdm="+getxzqhdm('xzqh')+"&lx.lxmc="+$('#txtRoad').val()+
				"&jh.jhnf="+xmnf+"&lx.lxjsdj="+jsdj+"&lx.gldj="+gldj+
				"&lx.lxbm="+$('#lxbm').val()+"&lx.tsdq="+tsdq;
		//param="jh.sbzt="+$("#ddlSHZT").val()+"&jh.spzt="+""+"&jh.jhnf="+$('#sbnf').combobox('getValue')+"&jh.jhkgsj="+""+"&jh.jhwgsj"+""+"&jh.pfztz"+""+"&lx.gydw="+$('#gydw').combotree('getText')+"&lx.gydwdm="+$('#gydw').combotree('getValue')+"&lx.xzqhmc="+$('#xzqh').combotree('getText')+"&lx.xzqhdm="+$('#xzqh').combotree('getValue')+"&lx.lxmc="+$("#txtRoad").val();
		window.location.href="/jxzhpt/jhgl/exportExcel_jh_abgc.do?flag="+flag+"&"+params;
	}
	if(flag=='wqgz'){
		var xmnf=$("#sbnf").combobox("getValues").join(",");
		if(xmnf.substr(0,1)==',')
			xmnf=xmnf.substr(1,xmnf.length);
		var jsdj=$("#jsdj").combobox("getValues").join(",");
		if(jsdj.substr(0,1)==',')
			jsdj=jsdj.substr(1,jsdj.length);
		var gldj=$("#gldj").combobox("getValues").join(",");
		if(gldj.substr(0,1)==',')
			gldj=gldj.substr(1,gldj.length);
		var akjfl=$("#akjfl").combobox("getValues").join(",");
		if(akjfl.substr(0,1)==',')
			akjfl=akjfl.substr(1,akjfl.length);
		var tsdq=$("#tsdq").combobox("getValues").join(",");
		if(tsdq.substr(0,1)==',')
			tsdq=tsdq.substr(1,tsdq.length);
		var jh={jhnf:xmnf,sbzt:"",spzt:"",sfylsjl:$('#sfylsjl').combobox("getValue")};
		var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxbm:"",lxmc:"",jsdj:jsdj,gldj:gldj,qlmc:"",qlbh:"",akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq.replace(/\+/g,"%2B")};
		if($('#txtRoad').val()!=""){
			lx.lxmc=$('#txtRoad').val();
		}
		if($('#txtBridge').val()!=''){
			lx.qlmc=$('#txtBridge').val();
		}
		if($('#txtqlbm').val()!=''){
			lx.qlbh=$('#txtqlbm').val();
		}
		if($('#lxbm').val()!=''){
			lx.lxbm=$('#lxbm').val();
		}
		if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
			var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
			var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
			var xian=true;
			if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
				xian=false;
			}
			if($('#ddlSHZT').combo("getValue")=="未上报"){
				if(xian){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}
			if($('#ddlSHZT').combo("getValue")=="已上报"){
				if(xian){
					jh.jh_sbthcd=2;
				}else{
					jh.jh_sbthcd=4;
				}
			}
			if($('#ddlSHZT').combo("getValue")=="未审核"){
				jh.jh_sbthcd=4;
			}
			if($('#ddlSHZT').combo("getValue")=="已审核"){
				jh.jh_sbthcd=6;
			}
		}
		var jh_sbthcd=jh.jh_sbthcd==undefined?"":jh.jh_sbthcd;
		var jhkgsj=jh.jhkgsj==undefined?"":jh.jhkgsj;
		var params="&jh.sbzt="+jh.sbzt+"&jh.spzt="+jh.spzt+"&jh.sbnf="+jh.jhnf+"&jh.jhkgsj="+jhkgsj
				+"&jh.sfylsjl="+jh.sfylsjl+"&jh.jh_sbthcd="+jh_sbthcd
				+"&lx.gydwbm="+lx.gydwbm+"&lx.xzqhdm="+lx.xzqhdm+"&lx.lxmc="+lx.lxmc
				+"&lx.qlmc="+lx.qlmc+"&lx.akjfl="+lx.akjfl+"&lx.jsxz="+lx.jsxz+"&lx.lxbm="+lx.lxbm+
				"&lx.jsdj="+lx.jsdj+"&lx.gldj="+lx.gldj+"&lx.tsdq="+lx.tsdq;
		window.location.href="/jxzhpt/jhgl/exportExcel_jh_wqgz.do?flag="+flag+params;
	}
	if(flag=='zhfz'){
		var jh={jhnf:"",sbzt:"",spzt:"",sfylsjl:$('#sfylsjl').combo("getValue")};
		var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:"",lxjsdj:"",lxbm:"",xmklx:$("#xmklx").combobox('getValue'),tsdq:""};
		if($('#txtRoad').val()!=""){
			lx.lxmc=$('#txtRoad').val();
		}
		if($('#sbnf').combobox('getText')!=""){
			jh.jhnf=$('#sbnf').combobox('getValues').join(',');
		}
		if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
			var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
			var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
			var xian=true;
			if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
				xian=false;
			}
			if($('#ddlSHZT').combo("getValue")=="未上报"){
				if(xian){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}
			if($('#ddlSHZT').combo("getValue")=="已上报"){
				if(xian){
					jh.jh_sbthcd=2;
				}else{
					jh.jh_sbthcd=4;
				}
			}
			if($('#ddlSHZT').combo("getValue")=="未审核"){
				jh.jh_sbthcd=4;
			}
			if($('#ddlSHZT').combo("getValue")=="已审核"){
				jh.jh_sbthcd=6;
			}
		}
		if($('#ddlPDDJ').combobox('getText')!="全部"){
			lx.lxjsdj=$('#ddlPDDJ').combobox('getValue');
		}
		if($('#ddlGldj').combobox('getText')!='全部'){
			lx.lxbm=$('#ddlGldj').combobox('getValues').join(',');
		}
		if($('#tsdq').combobox('getValue')!=''){
			lx.tsdq=$('#tsdq').combobox('getValue').replace(/\+/g,"%2B");
		}
		params="&lx.gydwbm="+getgydw("gydw")+"&lx.xzqhdm="+getxzqhdm('xzqh')+"&lx.lxmc="+lx.lxmc+
				"&jh.sbnf="+jh.jhnf+"&lx.lxjsdj="+lx.lxjsdj+
				"&lx.lxbm="+lx.lxbm+"&lx.tsdq="+lx.tsdq;
//		alert(params);
		window.location.href="/jxzhpt/jhgl/exportExcel_jh_zhfz.do?flag="+flag+"&"+params;
	}
	if(flag=='bhsd'){
		alert('bhsd');
		var sbzt="";
		var spzt="";
		if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
			if($('#ddlSHZT').combo("getValue")=="未上报"){
			    sbzt='0';
			}
			if($('#ddlSHZT').combo("getValue")=="已上报"){
				sbzt='1';
			}
			if($('#ddlSHZT').combo("getValue")=="未审核"){
				spzt='0';
			}
			if($('#ddlSHZT').combo("getValue")=="已审核"){
				spzt='1';
			}
		}
		var jsdj=encodeURI(encodeURI($('#ddlPDDJ').combobox('getValue')));
		params="&lx.gydwbm="+$.cookie("unit2")+"&lx.xzqhdm="+getxzqhdm('xzqh')+"&lx.lxmc="+$('#txtRoad').val()+
				"&jh.sbnf="+$('#sbnf').combobox('getValue')+"&lx.jsdj="+jsdj+
				"&lx.sddm="+$('#sddm').val()+"&lx.sdmc="+$('#sdmc').val()+"&jh.jh_sbthcd="+$.cookie("unit2").length+
				"&lx.tbbmbm="+$.cookie("unit2")+"&jh.sbzt="+sbzt+"&jh.spzt="+spzt;
		window.location.href="/jxzhpt/jhgl/exportExcel_jh_bhsd.do?flag="+flag+params+"&mode="+mode;
	}
}
//excel审查库数据导入
function importData_jh(flag){
	var url="";
	if(flag=='wqgz_jh'){
		url="/jxzhpt/jhgl/importWqgz_jh.do";
	}
	if(flag=='abgc_jh'){
		url="/jxzhpt/jhgl/importAbgc_jh.do";
	}
	if(flag=='zhfz_jh'){
		url="/jxzhpt/jhgl/importZhfz_jh.do";
	}
	if(flag=='gcgj_jh'){
		url="/jxzhpt/jhgl/importGcgj_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='gcsj_jh'){
		url="/jxzhpt/jhgl/importGcsj_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='shuih_jh'){
		url="/jxzhpt/jhgl/importShuih_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='yhdzx_jh'){
		url="/jxzhpt/jhgl/importYhdzx_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='hsly_jh'){
		url="/jxzhpt/jhgl/importHsly_jh.do?gydwdm="+$.cookie("unit");
	}
	if(flag=='gcsj_zjxd'){
		url="/jxzhpt/jhgl/importGcsj_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="gcgj_zjxd"){
		url="/jxzhpt/jhgl/importGcgj_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="shuih_zjxd"){
		url="/jxzhpt/jhgl/importShuih_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="yhdzx_zjxd"){
		url="/jxzhpt/jhgl/importYhdzx_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="abgc_zjxd"){
		url="/jxzhpt/jhgl/importAbgc_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="wqgz_zjxd"){
		url="/jxzhpt/jhgl/importWqgz_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="zhfz_zjxd"){
		url="/jxzhpt/jhgl/importZhfz_zjxd.do?gydwdm="+$.cookie("unit");
	}
	if(flag=="hsly_zjxd"){
		alert(flag);
		url="/jxzhpt/jhgl/importHsly_zjxd.do?gydwdm="+$.cookie("unit");
	}
	//YMLib.UI.createWindow('wqxx1','资金到位情况','/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+flag,'wqxx1',450,400);
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
function closezjxd(){
	$(zjxddiv).dialog('destroy',false);
}
function closeWindow(id){
	$('#'+id).dialog("close");
}
function queryZjxdSumByXmid(){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryZjxdSumByXmid.do',
		data:'zjxd.xmid='+xxId,
		dataType:'json',
		success:function(data){
			if(data!=null){
				$('#lblTzCount').html(data.xmid);
				$('#lblxfzjzj').html(data.xdzj);
			}else{
				$('#lblTzCount').html('0');
				$('#lblxfzjzj').html('0');
			}
		}
	});
}
function queryZjxdList__ck(url){
	var params={'zjxd.xmid':xxId};
	queryZjxdSumByXmid();
	$('#zjxdList').datagrid({
		url : url,
		queryParams : params,
		striped : true,
		pagination : true,
		rownumbers : true,
		pageNumber : 1,
		pageSize : 3,
		height : 140,
		fitColumns:true,
		columns : [[
		
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				if (row.sfzj == "0") {
					return "否";
				} else {
					return "是";
				}
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'jhxdwh',title : '计划下达文号',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}
		]]
	});
}

function queryZjxdList(url){
	var params={'zjxd.xmid':xxId};
//	alert(xxId);
	queryZjxdSumByXmid();
	$('#zjxdList').datagrid({
		url : url,
		queryParams : params,
		striped : true,
		pagination : true,
		rownumbers : true,
		pageNumber : 1,
		pageSize : 3,
		height : 140,
		fitColumns:true,
		columns : [[
		{field : 'cz',title : '操作',width : 120,align : 'center',
			formatter : function(value, row, index) {
				var p1="'zjxd',",p2="'资金下达',",p3="'../zjxd/zjxd_edit.jsp',",p4="'820',",
					p5="'250'",p6=",'"+row.id+"'";
				var result = '<a href="javascript:openZjxd('+p1+p2+p3+p4+p5+p6+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				result += '<a href="javascript:dropZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				if (row.sfzj == "0") {
					return "否";
				} else {
					return "是";
				}
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'jhxdwh',title : '计划下达文号',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}
		]]
	});
}
function dropZjxdById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/dropZjxdById.do',
		dataType:'json',
		data:'zjxd.id='+id,
		success:function(data){
			if(data.result=="true"){
				alert("删除成功！");
				//queryZjxdList('../../../jhgl/queryZjxdByXmId.do');
				$('#zjxdList').datagrid("reload",{'zjxd.xmid':xxId});
				queryZjxdSumByXmid();
				
			}else{
				alert("删除失败！");
			}
		}
	});
}
function editZjxd(){
	var zjxd={'zjxd.id':zjId,'zjxd.xdnf':$('#zjxdnf').combobox('getValue'),'zjxd.stz':$('#stz1').val(),'zjxd.ztz':$('#ztz').val(),
			'zjxd.btzzj':$('#btzzj').val(),'zjxd.xdzj':$('#xdzj1').val(),'zjxd.tbdw':$('#tbdw').html(),
			'zjxd.tbtime':$('#tbsj').val(),'zjxd.sfzj':$("input[name='rList']:checked").val(),'zjxd.jhxdwh':$('#jhxdwh').val()};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editZjxdById.do',
		dataType:'json',
		data:zjxd,
		success:function(data){
			if(data.result=="true"){
				alert("修改成功！");
				closezjxd();
				//$('#zjxdList').datagrid("reload",{'zjxd.xmid':xxId});
				queryZjxdList('../../../jhgl/queryZjxdByXmId.do');
			}else{
				alert("修改失败！");
			}
		}
	});
}
function roleName(){
	if($.cookie("unit2").length==7 || $.cookie("unit2").length==2){
		return "省级";
	}else if($.cookie("unit2").length==9){
		return "市级";
	}else if($.cookie("unit2").length==11){
		return "县级";
	}
}
function filterGydwdm(gydwdm){
	var result=null;
	var sheng = new RegExp("^[0-9]{7}0000$");
	var shi1=new RegExp("^[0-9]{7}[0-9][1-9]00$");
	var shi2=new RegExp("^[0-9]{7}[1-9][0-9]00$");
	if(gydwdm=="36"){
		result="%36%";
	}else if(shi1.test(gydwdm) || shi2.test(gydwdm) ){
		result=gydwdm.substring(0, gydwdm.length-2)+"__";
	}
	else if(sheng.test(gydwdm)){
		result=gydwdm.substring(0, gydwdm.length-4)+"____";
	}else{
		result=gydwdm;
	}
	return result;
}
function filterXzqhdm(xzqhdm){
	var yi1 = new RegExp("^36[0-9][1-9]00$");
	var yi2= new RegExp("^36[1-9][0-9]00$");
	var result=null;
	if(xzqhdm=="360000"){
		result='36%';
	}else if(yi1.test(xzqhdm) || yi2.test(xzqhdm)){
		result=xzqhdm.substring(0, xzqhdm.length-2)+"__";
	}else{
		result=xzqhdm;
	}
	
	return result;
}
//列入计划
function showLrjh(jsp,w,h){
	var cd=$.cookie("unit2").length;
	if(cd>8) {
		alert("对不起，非省级单位无法列入！");
		return;
	}
	YMLib.UI.createWindow('lw_lr','路网项目列入计划',jsp,'lw_lr',w,h);
}
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
	    textField:'text',
	    multiple:true
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
}
function loadTsdq(id){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	}); 
}
function getunit2(gydwdm){
	var result=0;
	var sheng = new RegExp("^[0-9]{7}0000$");
	var shi1=new RegExp("^[0-9]{7}[0-9][1-9]00$");
	var shi2=new RegExp("^[0-9]{7}[1-9][0-9]00$");
	if(shi1.test(gydwdm) || shi2.test(gydwdm)){
		result=9;
	}else if(sheng.test(gydwdm)){
		result=7;
	}else{
		result=11;
	}
	return result;
}
////////////文件上传、下载、删除
function fileShow(){
	//加载文件
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xxId,
		success:function(data){
	/* 		var data=datas.rows; */
		/* 	alert(data); */
			$("#gkbgTable").empty();
			$("#sjsgtTable").empty();
			var gkbg="";
			var sjsgt="";
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype=="工可报告"){
					gkbg += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				}if(data[i].filetype=="设计施工图"){
					sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a> |  <a href='javascript:void(0)' style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				}
			}
			
			$("#gkbgTable").append(gkbg);
			$("#sjsgtTable").append(sjsgt);
		}
	});
}
function downFile(id){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.id="+id;
}
function deleteFile(id){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 fileShow();
				 }else{
					 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}

function plannf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i),value:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
	});
	$('#'+id).combobox("setValue",'');
}