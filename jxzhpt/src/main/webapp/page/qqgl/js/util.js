

//获取养护大中修算费单价
function queryyhdzxsfdj(){
			$.post('/jxzhpt/qqgl/queryyhdzxsfdj.do',{},
					function(msg){   
					$("#lqhntmcdj").html(msg.lqhntmcdj);
					$("#gxlqhntmcdj").html(msg.gxlqhntmcdj);
					$("#snhntmcdj").html(msg.snhntmcdj);
					$("#lqlmjdrzsdj").html(msg.lqlmjdrzsdj);
					$("#lqlmcbrzsdj").html(msg.lqlmcbrzsdj);
					$("#swjcdj").html(msg.swjcdj);
					$("#lqlmpmlqjdlzsdj").html(msg.lqlmpmlqjdlzsdj);
					$("#lqlmrhlqjdlzsdj").html(msg.lqlmrhlqjdlzsdj);
					$("#lqlmcblzsdj").html(msg.lqlmcblzsdj);
					$("#xzrxjcdj").html(msg.xzrxjcdj);
					$("#swjclzsdj").html(msg.swjclzsdj);
					$("#xfcdj").html(msg.xfcdj);
					$("#wcsnmbdj").html(msg.wcsnmbdj);
					$("#wcswjcdj").html(msg.wcswjcdj);
					$("#snhntmchbdj").html(msg.snhntmchbdj);
					$("#bxyidj").html(msg.bxyidj);
					$("#bxerdj").html(msg.bxerdj);
					$("#snhntmcsshdj").html(msg.snhntmcsshdj);
				},'json');
		}
//初步设计详情   获取养护大中修算费单价  
function queryyhdzxsfdj_cbsj(){
	$.post('/jxzhpt/qqgl/queryyhdzxsfdj.do',{},
			function(msg){   
		$("#lqhntmcdj1").html(msg.lqhntmcdj);
		$("#gxlqhntmcdj1").html(msg.gxlqhntmcdj);
		$("#snhntmcdj1").html(msg.snhntmcdj);
		$("#lqlmjdrzsdj1").html(msg.lqlmjdrzsdj);
		$("#lqlmcbrzsdj1").html(msg.lqlmcbrzsdj);
		$("#swjcdj1").html(msg.swjcdj);
		$("#lqlmpmlqjdlzsdj1").html(msg.lqlmpmlqjdlzsdj);
		$("#lqlmrhlqjdlzsdj1").html(msg.lqlmrhlqjdlzsdj);
		$("#lqlmcblzsdj1").html(msg.lqlmcblzsdj);
		$("#xzrxjcdj1").html(msg.xzrxjcdj);
		$("#swjclzsdj1").html(msg.swjclzsdj);
		$("#xfcdj1").html(msg.xfcdj);
		$("#wcsnmbdj1").html(msg.wcsnmbdj);
		$("#wcswjcdj1").html(msg.wcswjcdj);
		$("#snhntmchbdj1").html(msg.snhntmchbdj);
		$("#bxyidj1").html(msg.bxyidj);
		$("#bxerdj1").html(msg.bxerdj);
		$("#snhntmcsshdj1").html(msg.snhntmcsshdj);
	},'json');
}
function queryylmlx(lxbm,qdzh,zdzh){
	if(lxbm.substr(0,1)=='Y' || lxbm.substr(0,1)=='C')
		lxbm=lxbm+xzqh;
	$.ajax({
		type:'post',
		async:false,
		url:'/jxzhpt/qqgl/queryylmlx.do',
        data:'lx.lxbm='+lxbm+'&lx.qdzh='+qdzh+'&lx.zdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$("#ylmlx").val(msg.ylmlx);
			//alert(msg.ylmlx);
		}
	});
}

function plansb(index){
	var xmlx="";
	var xmbm='';
	if(index==null){
		var rows=$('#grid').datagrid('getSelections');
		if(rows.length==0) {
			alert("请选择要上报的项目！");
			return;
		}
		for(var i=0;i<rows.length;i++){
			if(rows[i].sbzt=='1'){
				alert("有项目已上报，请检查后操作！");
				return ;
			}
		}
		var xmbm1=rows[0].xmbm;
		xmlx=xmbm1.substr(10,1);
		for ( var i = 1; i < rows.length; i++) {
			xmbm1+=","+rows[i].xmbm;
		}
		xmbm=xmbm1;
	}else{
		var da=$("#grid").datagrid('getRows')[index];
		if(da.sbzt=='1'){
			alert("有项目已上报，请检查后操作！");
			return ;
		}
		xmlx=da.xmbm.substr(10,1);
		xmbm=da.xmbm;
	}
	
	//var xmbm=$("#grid").datagrid('getRows')[index].xmbm;

	if(confirm('您确定上报吗？'))
	//var xmbm=$("#grid").datagrid('getRows')[index].xmbm;
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/plansb.do',
		data:"jhsh.xmbm="+xmbm+"&jhsh.xmlx="+xmlx,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("上报成功");
				$("#grid").datagrid('reload');
			}
				
		}
	});
	
}
function plansh(index){
	var xmlx="";
	var xmbm='';
	if(index==null){
		var rows=$('#grid').datagrid('getSelections');
		if(rows.length==0) {
			alert("请选择要审核项目！");
			return;
		}
		for(var i=0;i<rows.length;i++){
			if(rows[i].xdzt=='1'){
				alert("有项目已审核，请检查后操作！");
				return ;
			}
		}
		var xmbm1=rows[0].xmbm;
		xmlx=xmbm1.substr(10,1);
		for ( var i = 1; i < rows.length; i++) {
			xmbm1+=","+rows[i].xmbm;
		}
		xmbm=xmbm1;
	}else{
		var da=$("#grid").datagrid('getRows')[index];
		if(da.xdzt=='1'){
			alert("有项目已审核，请检查后操作！");
			return ;
		}
		xmlx=da.xmbm.substr(10,1);
		xmbm=da.xmbm;
	}
	
	//var xmbm=$("#grid").datagrid('getRows')[index].xmbm;

	if(confirm('您确定审核吗？'))
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/plansh.do',
		data:"jhsh.xmbm="+xmbm+"&jhsh.xmlx="+xmlx,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("审核成功");
				$("#grid").datagrid('reload');
			}
				
		}
	});
	
}

function tuihxjjh(){
	var xmlx="";
	var xmbm='';
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].xdzt=='1'){
			alert("有项目已审核，请检查后操作！");
			return ;
		}
	}
	var xmbm1=rows[0].xmbm;
	xmlx=xmbm1.substr(10,1);
	for ( var i = 1; i < rows.length; i++) {
		xmbm1+=","+rows[i].xmbm;
	}
	xmbm=xmbm1;
	YMLib.UI.createWindow('lxxx','退回项目','jhsh_th.jsp','lxxx',400,200);
	/*if(confirm('您确定退回吗？'))
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/tuihxjjh.do',
			data:"jhsh.xmbm="+xmbm+"&jhsh.xmlx="+xmlx,
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("审核成功");
					$("#grid").datagrid('reload');
				}
					
			}
		});*/
	
}

function thwshjh(){
	var xmlx="";
	var xmbm='';
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].xdzt=='0'){
			alert("有项目未审核，请检查后操作！");
			return ;
		}
	}
	var xmbm1=rows[0].xmbm;
	xmlx=xmbm1.substr(10,1);
	for ( var i = 1; i < rows.length; i++) {
		xmbm1+=","+rows[i].xmbm;
	}
	xmbm=xmbm1;
	if(confirm('您确定退回吗？'))
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/thwshjh.do',
			data:"jhsh.xmbm="+xmbm+"&jhsh.xmlx="+xmlx,
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("退回成功");
					$("#grid").datagrid('reload');
				}
					
			}
		});
}


function qxxm(str){
	var xmbm=str+"";
	if(!confirm("确认取消项目吗？")){
		return;
	}
		
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/qxxm.do',
		data:"lxsh.xmbm="+str,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("项目已成功取消");
				if(xmbm.substr(10,1)=='1')
					queryLmsj();
				if(xmbm.substr(10,1)=='2')
					queryLmsj();
				if(xmbm.substr(10,1)=='3')
					queryLmsj();
				if(xmbm.substr(10,1)=='4')
					queryYhdzx();
				if(xmbm.substr(10,1)=='5')
					queryShxm();
			}
				
		}
	});
}
function hfxm(str){
	var xmbm=str+"";
	if(!confirm("确认恢复项目吗？")){
		return;
	}
		
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/hfxm.do',
		data:"lxsh.xmbm="+str,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("项目已成功恢复");
				if(xmbm.substr(10,1)=='1')
					queryLmsj();
				if(xmbm.substr(10,1)=='2')
					queryLmsj();
				if(xmbm.substr(10,1)=='3')
					queryLmsj();
				if(xmbm.substr(10,1)=='4')
					queryYhdzx();
				if(xmbm.substr(10,1)=='5')
					queryShxm();
			}
				
		}
	});
}

function qxxm1(str){
	var xmbm=str+"";
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/qxxmth.do',
		data:"lxsh.xmbm="+str,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("项目已成功退回");
				if(xmbm.substr(10,1)=='1')
						queryLmsj();
					if(xmbm.substr(10,1)=='2')
						queryLmgz();
					if(xmbm.substr(10,1)=='3')
						queryXj();
					if(xmbm.substr(10,1)=='4')
						queryYhdzx();
					if(xmbm.substr(10,1)=='5')
						queryShxm();
			}
				
		}
	});
}
function loadcbsjTjxx(data){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/loadcbsjTjxx.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				 $("#xmsl").html(msg.sl);
				 $("#tz").html(msg.tz);
				 $("#cgs").html(msg.bzcs);
				 $("#stz").html(msg.stz);
				 $("#sjl").html(msg.sjl);
				 $("#lc").html(msg.lc);
				 $("#dftz").html(msg.dftz);
			}else{
				$('#xmsl').html('0');
				$('#tz').html('0');
				$('#lc').html('0');
			    $("#cgs").html('0');
			    $("#stz").html('0');
			    $("#sjl").html('0');
			    $("#dftz").html('0');
			}
			
		}
	});
}
function loadcbsjbgTjxx(data){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/loadcbsjbgTjxx.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				$('#xmsl').html(msg.sl);
				$('#tz').html(msg.tz);
				$('#lc').html(msg.lc);
				$('#bzcs').html(msg.bzcs);
			}else{
				$('#xmsl').html('0');
				$('#tz').html('0');
				$('#lc').html('0');
				$('#bzcs').html('0');
			}
			
		}
	});
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
//-------------------------------------------用户等级判断部分
/**
 * 判断用户行政登记(省、市、县)
 * @param unit2 cookie unit2中的值
 * @returns {String} 返回行政登记(省、市、县)
 */
function userPanduan(unit2){
	if(unit2.length==7){
		return "省";
	}else if(unit2.length==9){
		return "市";
	}else if(unit2.length==11){
		return "县";
	}
}
/**
 * 加载行政等级
 * @param id
 * @param name
 * @returns
 */
function loadGldj(id) {
	$('#' + id).combotree({
		url:'/jxzhpt/qqgl/loadGldj.do?xzqhdm='+$.cookie("dist2"),
		panelHeight:200,editable: true,
		multiple:true
	});
}
//--------------------------------------------------路线操作--------------------------------------
/**
 * 项目年份
 * @param id 元素ID
 */
function xmnf(id){
	var myDate = new Date();
	var years=[];
	//var first;
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
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
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
	$('#id'+myDate.getFullYear()).attr('checked', true);
}
/**
 * 判断项目类型，返回文字
 * @param xmbm 项目编码
 * @result 返回项目类型
 */
function panduanxmlx(xmbm){
	var result="";
	var xmlx = xmbm.substring(10,11);
	if(xmlx=="1"){
		result="改建项目";
	}else if(xmlx=="2"){
		result="路面改造项目";
	}else if(xmlx=="3"){
		result="新建项目";
	}else if(xmlx=="4"){
		result="养护大中修项目";
	}else if(xmlx=="5"){
		result="灾毁恢复重建项目";
	}else if(xmlx=="6"){
		result="养护中心项目";
	}
	return result;
}
/**
 * 添加路线弹窗
 * @param xmbm 项目编码
 * @param jdbs 阶段标示
 */
var obj=new Object();
function openLxAdd(id,xmbm,jdbs){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.jdbs=jdbs;
	YMLib.Var.id=id;
	obj.id=id;
	obj.xmbm=xmbm;
	obj.jdbs=jdbs;
	if(id=='shxm'){
		openWindow(id,'添加路线','/jxzhpt/page/qqgl/jhsh/lx_add3.jsp',980,400);
	}else
	openWindow(id,'添加路线','/jxzhpt/page/qqgl/jhsh/lx_add2.jsp',980,400);
}
function openLxAddyh(id,xmbm,jdbs){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.jdbs=jdbs;
	YMLib.Var.id=id;
	openWindow(id,'添加路线','/jxzhpt/page/qqgl/jhsh/lx_addyh.jsp',980,400);
}
/**
 * 初步设计添加路线弹窗
 * @param xmbm 项目编码
 * @param jdbs 阶段标示
 */
function openLxAdd2(id,xmbm,jdbs){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.jdbs=jdbs;
	YMLib.Var.id=id;
	
	if(id=='lmsj')
	openWindow(id,'添加路线','/jxzhpt/page/qqgl/cbsj/lx_add.jsp',980,400);
	else if(id=='lmgz')
	openWindow('lxxx','添加路线','/jxzhpt/page/qqgl/cbsj/lx_add2.jsp',980,400);	
	else if(id=='xjgc')
		openWindow('lxxx','添加路线','/jxzhpt/page/qqgl/cbsj/lx_add3.jsp',980,400);	
		
}
/**
 * 删除路线
 * @param id
 */
function deleteLx(id,xmlx){
	var params={'lx.id':id};
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
		data:params,
		dataType:'json',
		success:function(msg){
			if(msg.result=="true"){
				alert("删除成功!");
				if(xmlx=="4"){
					queryYhdzx();
				}else if(xmlx=="5"){
					queryShxm();
				}
			}
		}
	});
}
//--------------------------------------------------公用方法---------------------------------------
/**
 * 导出模板
 * @param fileName 模板文件名称
 */
function exportTemplet(fileName){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+fileName;
}
/**
 * 导入Excel文件
 * @param url 提交的URL路径
 * @param flag
 */
function importExcel(url,flag){
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
}
function importExcelqwh(url,flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload1.jsp?url='+url+'&flag='+flag,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
}
///加法
function accAdd(arg1,arg2){  
    var r1,r2,m;  
    try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;}  
    try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;}  
    m=Math.pow(10,Math.max(r1,r2));
    return (arg1*m+arg2*m)/m;  
}
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
/**
 * 历史记录弹窗
 * @param xmbm 项目编码
 */
function openLsjl(xmbm){
	YMLib.Var.xmbm=xmbm;
	openWindow('lsjlwindow','历史记录','/jxzhpt/page/qqgl/jhsh/lsjl.jsp',980,300);
}
function openwnxmk(xmbm){
	YMLib.Var.xmbm=xmbm;
	openWindow('lsjlwindow','五年项目','/jxzhpt/page/qqgl/jhsh/wnxmk.jsp',980,300);
}

/**
 * 查询桩号地方名称
 * @param id 桩号元素ID
 */
function querymc(id){
	
	if(id=="qdzh"){
		cxqdmc($('#ghlxbm').val(),$('#ghqdzh').val());
	}else if(id=="zdzh"){
		cxzdmc($('#ghlxbm').val(),$('#ghzdzh').val());
	}else{
		cxqdmc($('#ghlxbm').val(),$('#ghqdzh').val());
		cxzdmc($('#ghlxbm').val(),$('#ghzdzh').val());
	}
	//alert();
	getghlxinfo($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
	//queryJsdjAndLc($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
	if(parseFloat($('#ghqdzh').val())<parseFloat($('#ghzdzh').val()))
	getylxlminfo($('#ghlxbm').val(),$('#ghqdzh').val(),$('#ghzdzh').val());
	else
	getylxlminfo($('#ghlxbm').val(),$('#ghzdzh').val(),$('#ghqdzh').val());
	$('#lc').val(Math.abs(accSub(parseFloat($('#zdzh').val()),parseFloat($('#qdzh').val()))));
	$('#lc').html(Math.abs(accSub(parseFloat($('#zdzh').val()),parseFloat($('#qdzh').val()))));
}
/**
 * 查询桩号地方名称
 * @param id 桩号元素ID
 * @param lxbm 路线编码元素ID
 */
function querymc2(id,lxbm){
	if(id=="qdzh"){
		cxqdmc($('#'+lxbm).val(),$('#qdzh').val());
	}else if(id=="zdzh"){
		cxzdmc($('#'+lxbm).val(),$('#zdzh').val());
	}
	queryJsdjAndLc($('#'+lxbm).val(),$('#qdzh').val(),$('#zdzh').val());
	$('#lc').val(accSub(parseFloat($('#zdzh').val()),parseFloat($('#qdzh').val())));
}
/**
 * 根据路线编码和起点桩号查询起点名称
 * @param lxbm 路线编码
 * @param qdzh  起点桩号
 */
function cxqdmc(lxbm,qdzh){
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
/**
 * 根据路线编码和止点桩号查询止点名称
 * @param lxbm 路线编码
 * @param zdzh 止点桩号
 */
function cxzdmc(lxbm,zdzh){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxzdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$('#zdmc').val(msg.zdmc);
		}
	});
}
/**
 * 查询起止点桩号间的技术等级和里程
 * @param lxbm
 * @param qdzh
 * @param zdzh
 * @returns
 */
function queryJsdjAndLc(lxbm,qdzh,zdzh){
	var xzqh="";
	if($("#xzqh1").val()==null){
		xzqh=$("#xzqh").combobox('getValues').join(',').substr(0,4);
	}else{
		xzqh=$("#xzqh1").combobox('getValues').join(',').substr(0,4);
	}
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryJsdjAndLcByStartAndEnd.do',
        data:'lx.lxbm='+lxbm+xzqh+'&lx.qdzh='+qdzh+'&lx.zdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$('#yilc').val(msg.yilc);
			$('#erlc').val(msg.erlc);
			$('#sanlc').val(msg.sanlc);
			$('#silc').val(msg.silc);
			$('#dwlc').val(msg.dwlc);
			$('#wllc').val(msg.wllc);
			if($('#jsdj')){
				$('#jsdj').val(msg.xjsdj);
			}
		}
	});
}
/**
 * 验证文本内容
 * @param id 元素ID
 * @param type 验证类型(数字)
 */
function validateText(id,type,result){
	if(!result){
		return result;
	}
	if($('#'+id).val()=='' || $('#'+id).val()==null){
		alert($('#'+id).parent().prev().html()+"不能为空！");
		return false;
	}
	if(type!=null){
		var reg=null;
		if(type=="number"){
			reg = new RegExp("^[0-9]*$");
			var double=new RegExp("^[0-9]*.[0-9]*$");
			if(!reg.test($('#'+id).val()) && !double.test($('#'+id).val())){
				alert($('#'+id).parent().prev().html()+"需要输入数字！");
				$('#'+id).focus();
				return false;
			}
		}
	}
	return result;
}
//
function validateInput(id,idtype,type,result){
	if(!result){
		return result;
	}
	if(type!=null){
		
	}else{
		if(idtype=='text'){
			if($('#'+id).val()=='' || $('#'+id).val()==null){
				alert($('#'+id).parent().prev().html()+"不能为空！");
				return false;
			}
		}
		if(idtype=='combo'){
			if($('#'+id).combo('getValues')=='' || $('#'+id).combo('getValues')==null){
				alert($('#'+id).parent().prev().html()+"不能为空！");
				return false;
			}
		}
		
	}
}

/**
 * 加载特殊地区下拉列表
 * @param id 元素ID
 */
function loadTsdq(id){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	});
}
/**
 * 加载特殊地区下拉列表
 * @param id 元素ID
 * @param multiple 是否多选
 */
function loadTsdq(id,multiple){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text',
	    multiple:multiple,
	    onSelect:function(){
	    	$('#tsdq').val($('#'+id).combobox("getText"));
	    }
	});
}
/**
 * 查询设计批复文件
 * @param xmbm
 */
function fileShow(xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#sjpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
				'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>  |  ' +
				"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				$("#sjpfTable").append(tr);
			}
		}
	});
}

/**
 * 查询设计批复文件
 * @param xmbm
 */
function fileShow_jhcx(xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#sjpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
				'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>' ;
				$("#sjpfTable").append(tr);
			}
		}
	});
}

/**
 * 查询设计批复文件
 * @param xmbm
 */
function fileShowByWh(xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryFileByWh.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#sjpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
				'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>  |  ' +
				"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				$("#sjpfTable").append(tr);
			}
		}
	});
}

/**
 * 查询设计批复文件
 * @param xmbm
 */
function ShowfileByWh(id,xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryFileByWh.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#"+id).empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
				'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>  |  ' +
				"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFilewj('"+data[i].id+"','"+id+"','"+xmbm+"','"+type+"')>删除</a></td></tr>";
				$("#"+id).append(tr);
			}
		}
	});
}
function deleteFilewj(id,id1,xmbm,type){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile2.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 ShowfileByWh(id1,xmbm,type);
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

function downwj(name,type){
	if(confirm("确认下载文件吗？"))
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/getWjbytype.do',
		data:'file.filewh='+name+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			for ( var i = 0; i < data.length; i++) {
				downFile(data[i].fileurl.replace(/\\/g,"%2F"),data[i].filename);
			}
		}
	});
}


function getWj(index,type){
	var xmbm=$("#grid").datagrid('getRows')[index].xmbm;
	$("#wjTable").empty();
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/getWjbyxmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'><font color='#48D1CC'>文号：</font>" + data[i].filewh +"&nbsp;&nbsp;</td><td style='background-color: #ffffff; height: 25px;' align='left'><font color='#48D1CC'>文件：</font>" + data[i].filename +"&nbsp;&nbsp;</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
				'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>   ' ;
				$("#wjTable").append(tr);
			}
		}
	});
	
	$('#wj').dialog("open");
}

/**
 * 查询设计批复文件
 * @param id 元素ID
 * @param xmbm 项目编码
 * @param type 文件类型
 */
function fileShow1(id,xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#"+id).empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
				'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>  |  ' +
				"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				$("#"+id).append(tr);
			}
		}
	});
}
/**
 * 下载文件
 * @param id 文件ID
 */
function downFile(fileurl,filename){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
}
/**
 * 删除文件
 * @param id 文件ID
 */
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
					 fileShow(parent.YMLib.Var.xmbm);
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
/**
 * 导入计划审核信息
 * @param xmlx 项目类型
 * @returns {Boolean} 结果？
 */
function importJhsh(xmlx){
	if(xmlx==null){
		var xmlx1=$("#xmlx").combobox("getValues").join(",");
		if(xmlx1.substr(0,1)==',')
			xmlx1=xmlx1.substr(1,xmlx1.length);
		if(xmlx1=='改建工程'){
			xmlx=1;
		}
		else if(xmlx1=='路面改造工程'){
			xmlx=2;
		}
		else if(xmlx1=='新建工程'){
			xmlx=3;
		}else{
			alert('请在项目类型复选框中选择一种项目类型(只一种)');
			return;
		}
			
	}
	var url="/jxzhpt/qqgl/importExcelJhxd.do?xmlx="+xmlx;
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+xmlx,
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
/**
 * 导入资金下达信息
 * @param xmlx
 * @returns {Boolean}
 */
function importJhshZjzj(xmlx){
	var url="/jxzhpt/jhgl/importJhshZjzj.do?gydwdm="+$.cookie("unit");
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+xmlx,
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
/**
 * 查询资金下达列表
 * @param xmbm
 */
function queryZjxd(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'操作',width:100,align:'center',
			formatter : function(value, row, index) {
				var result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				if(xmbm.substring(10,11)==4){
					result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit1.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				}
				result += '<a href="javascript:deleteZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				return row.sfzj == "0" ? "否" : "是";
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}
function queryZjxdyh(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'操作',width:100,align:'center',
			formatter : function(value, row, index) {
				var result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				if(xmbm.substring(10,11)==4){
					result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit1.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				}
				result += '<a href="javascript:deleteZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				return row.sfzj == "0" ? "否" : "是";
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stc',title : '省统筹',width : 150,align : 'center'}, 
		{field : 'dk',title : '厅贷款',width : 150,align : 'center'}, 
		{field : 'ztz',title : '总投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}


function queryYhzxZjxd(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'操作',width:100,align:'center',
			formatter : function(value, row, index) {
				var result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_editYhzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
//				if(xmbm.substring(10,11)==4){
//					result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit1.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
//				}
				result += '<a href="javascript:deleteZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'btzzj',title : '重点打造奖励',width : 150,align : 'center'},
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}

function queryYhzxZjxdxx(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金（万元）',width : 150,align : 'center'},
		{field : 'stz',title : '省投资（万元）',width : 150,align : 'center'}, 
		{field : 'btzzj',title : '重点打造奖励（万元）',width : 150,align : 'center'},
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}

function queryxZjxd(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'操作',width:100,align:'center',
			formatter : function(value, row, index) {
				var result = '<a href="javascript:updateZjxdById('+"'"+index+"','xzjxd_edit.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				if(xmbm.substring(10,11)==4){
					result = '<a href="javascript:updateZjxdById('+"'"+index+"','xzjxd_edit1.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				}
				result += '<a href="javascript:deleteZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'yhdk',title : '银行贷款',width : 150,align : 'center'}, 
		{field : 'gz',title : '国债',width : 150,align : 'center'}, 
		{field : 'gzzq',title : '国债债券',width : 150,align : 'center'}, 
		{field : 'sz',title : '省债',width : 150,align : 'center'}, 
		{field : 'szzq',title : '省债债券',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}
function queryxZjxd1(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'yhdk',title : '银行贷款',width : 150,align : 'center'}, 
		{field : 'gz',title : '国债',width : 150,align : 'center'}, 
		{field : 'gzzq',title : '国债债券',width : 150,align : 'center'}, 
		{field : 'sz',title : '省债',width : 150,align : 'center'}, 
		{field : 'szzq',title : '省债债券',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}
//养护大中修
function queryZjxdyhdzx(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'删除',width:60,align:'center',
			formatter: function(value,row,index){
				var result='<a href="javascript:delzjxd('+"'"+row.id+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'zbz',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'rys',title : '燃油税',width : 150,align : 'center'}, 
		{field : 'dk',title : '厅贷款',width : 150,align : 'center'}, 
		{field : 'jhxdwh',title : '计划下达文号',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '下达时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}
function delzjxd(id,xmbm){
	//alert(xmbm);
	if(confirm('您确定删除吗？')){
		deleteZjxdById(id);
		
		/*if(xmbm.substring(10,11)=="4"){
			queryZjxdyhdzx(xmbm);
		}
		else if(xmbm.substring(10,11)=="5"){
			queryZjxdgsdzh(xmbm);
		}
		else{
			queryZjxdgsd(xmbm);
		}*/
	}
		
		//alert(id);
}

//国省道
function queryZjxdgsd(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		/*{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				return row.sfzj == "0" ? "否" : "是";
			}
		},*/
		{field:'cz',title:'删除',width:60,align:'center',
			formatter: function(value,row,index){
				var result='<a href="javascript:delzjxd('+"'"+row.id+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'zbz',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'gz',title : '国债',width : 150,align : 'center'}, 
		{field : 'sz',title : '省债',width : 150,align : 'center'}, 
		{field : 'zq',title : '债券',width : 150,align : 'center'}, 
		{field : 'dk',title : '厅贷款',width : 150,align : 'center'}, 
		{field : 'jl',title : '奖励',width : 150,align : 'center'}, 
		{field : 'qt',title : '其他',width : 150,align : 'center'}, 
		{field : 'dfzc',title : '地方自筹',width : 150,align : 'center'}, 
		{field : 'yhdk',title : '银行贷款',width : 150,align : 'center'}, 
		{field : 'zyjsnr',title : '主要建设内容',width : 150,align : 'center'}, 
		{field : 'xzscnl',title : '新增能力',width : 150,align : 'center'}, 
		{field : 'jhxdwh',title : '计划下达文号',width : 150,align : 'center'},
		{field : 'tbtime',title : '下达时间',width : 150,align : 'center'}
		//, 
		//{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}
		]];
	gridBind1(grid);
}
//、灾毁
function queryZjxdgsdzh(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		/*{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				return row.sfzj == "0" ? "否" : "是";
			}
		},*/
		{field:'cz',title:'删除',width:60,align:'center',
			formatter: function(value,row,index){
				var result='<a href="javascript:delzjxd('+"'"+row.id+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'zbz',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'gz',title : '国债',width : 150,align : 'center'}, 
		{field : 'sz',title : '省债',width : 150,align : 'center'}, 
		{field : 'zq',title : '债券',width : 150,align : 'center'}, 
		{field : 'dk',title : '厅贷款',width : 150,align : 'center'}, 
		{field : 'jl',title : '奖励',width : 150,align : 'center'}, 
		{field : 'qt',title : '其他',width : 150,align : 'center'}, 
		
		{field : 'jhxdwh',title : '下达文号',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '下达时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}

function queryZjxd1(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		/*{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				return row.sfzj == "0" ? "否" : "是";
			}
		},*/
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'jhxdwh',title : '下达文号',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '下达时间',width : 150,align : 'center'}
		]];
	gridBind1(grid);
}
/**
 * 删除资金下达
 * @param id
 */
function deleteZjxdById(id){
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/dropZjxdById.do',
		dataType:'json',
		data:'zjxd.id='+id,
		success:function(data){
			if(data.result=="true"){
				alert("删除成功！");
				$('#zjxdList').datagrid("reload");
			}else{
				alert("删除失败！");
			}
		}
	});
}
/**
 * 用于养护大中修合水毁的计划下达
 */
function openJhxd1(url,index){
	YMLib.Var.xmbm=$('#grid').datagrid("getRows")[index].xmbm;
	YMLib.Var.row=$('#grid').datagrid("getRows")[index];
	YMLib.Var.xmlx=xmlx;
	openWindow('jhxd','编辑','/jxzhpt/page/qqgl/jhsh/'+url,920,370);
}
function openZjzj(index,xmlx){
	YMLib.Var.xmbm=$('#grid').datagrid("getRows")[index].xmbm;
	YMLib.Var.row=$('#grid').datagrid("getRows")[index];
	YMLib.Var.xmlx=xmlx;
	openWindow('zjzj','资金追加','/jxzhpt/page/qqgl/jhsh/zjzj.jsp',800,300);
}
function updateZjxdById(index,url){
	YMLib.Var.xmbm=$('#grid').datagrid("getRows")[index].xmbm;
	YMLib.Var.row=$('#zjxdList').datagrid("getRows")[index];
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/'+url,800,300);
}
function openZjxd(){
	YMLib.Var.xmbm=$('#grid').datagrid("getRows")[index].xmbm;
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/zjxd.jsp',800,300);
}
function openZjxd1(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/zjxd1.jsp',800,300);
}
function openZjxdYhzx(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/zjxd_addYhzx.jsp',800,300);
}
function openxZjxd(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/xzjxd.jsp',800,300);
}
function openxZjxd1(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/xzjxd1.jsp',800,300);
}
/**
 * 弹出窗口
 * @param id 窗口ID
 * @param title 窗口标题
 * @param url 窗口页面的路径
 * @param width 窗口的宽度
 * @param height 窗口的高度
 */
function openWindow1(id,title,url,width,height,xmbm){
	//alert(xmbm);
	YMLib.Var.xmbm=xmbm;
	YMLib.UI.createWindow1(id,title,url,id,width,height);
}
function openWindow(id,title,url,width,height){
	//alert(xmbm);
	if(YMLib.Var.xmbm==null||YMLib.Var.xmbm=='')
	YMLib.Var.xmbm=xmbm;
	
	if(id=="jhxd" || id=="zjzj"){
		//alert(xmbm.substr(10,1)+"    "+xmlx);
		//if(xmlx==null)
			YMLib.Var.xmlx=xmbm.substr(10,1);
		//else
		   // YMLib.Var.xmlx=xmlx;
		
	}
	YMLib.UI.createWindow1(id,title,url,id,width,height,function(){
		if(id=="lmsjedit" || id=="lmsj"){
			queryLmsj();
		}else if(id=="gsdgzbz" || id=="gsdgzbz"){
			queryxmList();
		}else if(id=="lmgzedit" || id=="lmgz"){
			queryLmgz();
		}else if(id=="xjgcedit" || id=="xjgc"){
			queryXj();
		}else if(id=="yhdzxadd" || id=="yhdzxedit" || id=="yhdzx"){
			queryYhdzx();
		}else if(id=="shxmadd" || id=="shxmedit" || id=="shxm"){
			queryShxm();
		}
		if((id=="jhxd" || id=="zjzj") && xmlx==1){
			queryLmsj();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==2){
			queryLmgz();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==3){
			queryXj();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==4){
			queryYhdzx();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==5){
			queryShxm();
		}
	});
}
/**
 * 关闭弹出窗口
 * @param id
 */
function closeWindow(id){
	parent.$('#'+id).window("destroy");
}
/**
 * 获取管养单位选中值
 * @param id 元素ID
 * @returns {String} 所选中的值
 */
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
function updateLxWin(index,xmbm,id){
	var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.Var.id='lxxx';
	if(xmbm.substring(10,11)=="1"){
		YMLib.UI.createWindow('lxxx','编辑路线信息','sjgzlx_edit.jsp','lxxx',900,350);
	}else if(xmbm.substring(10,11)=="2"){
		YMLib.UI.createWindow('lxxx','编辑路线信息','lmgzlx_edit.jsp','lxxx',900,350);
	}
	else if(xmbm.substring(10,11)=="4"){
		YMLib.UI.createWindow('lxxx','编辑路线信息','lx_update.jsp','lxxx',900,350);
	}
	else if(xmbm.substring(10,11)=="5")
		YMLib.UI.createWindow('lxxx','编辑路线信息','lx_update1.jsp','lxxx',900,350);
}
function loadLxWin(index,xmbm,id){
	var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.UI.createWindow(id,'编辑路线信息','lx_xx.jsp',id,900,350);
}
//--------------------------------------------------------easyui部分
var gridObj;//datagrid 对象
var Rh={
		onLoadSuccess:function(data){
		},
		onClickRow:function(rowIndex, rowData){
		},
		onSelect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.push(rowData.xmbm);
		},
		onSelectAll:function(rows){
			if(selArray.length<rows.length){
				selArray.splice(0,selArray.length);
				$.each(rows,function(index,item){
					selArray.push(item.xmbm);
				});
			}else if(selArray.length==rows.length){
				selArray.splice(0,selArray.length);
			}
		},
		onUnselect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.pop(rowData.xmbm);
		},
		detailFormatter:function(index,row){
			return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';
		},
		onExpandRow:function(index,row){
			$('#table_lx'+row.xmbm).datagrid({
				url:'/jxzhpt/qqgl/selectlxList.do',
				queryParams:{
					'lx.xmid':row.xmbm,
					'lx.jdbs':YMLib.Var.jdbs,
					'lx.sffirst':'1'
				},
    			columns:[[
    			    {field:'cz',title:'操作',width:150,align:'center',
    			    	formatter:function(value,row,index){
    			    		var result='<a href="javascript:updateLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">编辑</a>';
    			    		result +='&nbsp;<a href="javascript:deleteLx('+"'"+row.id+"',"+"'"+row.xmid.substring(10,11)+"'"+')" style="color:#3399CC;">删除</a>';
    			    		return result;
    			    	}
    			    },
					{field:'gydw',title:'管养单位',width:150,align:'center'},    
					{field:'xzqh',title:'行政区划',width:150,align:'center'},
					{field:'lxmc',title:'路线名称',width:120,align:'center'},
				    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
				    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
				    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
					{field:'lxbm',title:'原路线编码',width:100,align:'center'},
					{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
					{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
					{field:'qdmc',title:'起点名称',width:100,align:'center'},
					{field:'zdmc',title:'止点名称',width:100,align:'center'},
					{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
					{field:'xjsdj',title:'现技术等级',width:80,align:'center'},
					{field:'lc',title:'里程',width:60,align:'center'}
    			]],
    			onLoadSuccess:function(){
    				$('#'+grid.id).datagrid('fixDetailRowHeight',index);
    	        }
	    	});
		}
	};

var Qwh={
		onLoadSuccess:function(data){
		},
		onClickRow:function(rowIndex, rowData){
		},
		onSelect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.push(rowData.xmbm);
		},
		onSelectAll:function(rows){
			if(selArray.length<rows.length){
				selArray.splice(0,selArray.length);
				$.each(rows,function(index,item){
					selArray.push(item.xmbm);
				});
			}else if(selArray.length==rows.length){
				selArray.splice(0,selArray.length);
			}
		},
		onUnselect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.pop(rowData.xmbm);
		},
		detailFormatter:function(index,row){
			return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';
		},
		onExpandRow:function(index,row){
			$('#table_lx'+row.xmbm).datagrid({
				url:'/jxzhpt/qqgl/selectlxList.do',
				queryParams:{
					'lx.xmid':row.xmbm,
					'lx.jdbs':YMLib.Var.jdbs,
					'lx.sffirst':'1'
				},
    			columns:[[
    			    {field:'cz',title:'操作',width:150,align:'center',
    			    	formatter:function(value,row,index){
    			    		var result='<a href="javascript:updateLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">编辑</a>';
    			    		result +='&nbsp;<a href="javascript:deleteLx('+"'"+row.id+"',"+"'"+row.xmid.substring(10,11)+"'"+')" style="color:#3399CC;">删除</a>';
    			    		return result;
    			    	}
    			    },
					{field:'gydw',title:'管养单位',width:150,align:'center'},    
					{field:'xzqh',title:'行政区划',width:150,align:'center'},
					{field:'lxmc',title:'路线名称',width:120,align:'center'},
					{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
				    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
				    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
					{field:'lxbm',title:'原路线编码',width:100,align:'center'},
					{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
					{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
					{field:'qdmc',title:'起点名称',width:100,align:'center'},
					{field:'zdmc',title:'止点名称',width:100,align:'center'},
//					{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
					{field:'xjsdj',title:'技术等级',width:80,align:'center'},
					{field:'lc',title:'里程',width:60,align:'center'},
					{field:'jsfa',title:'建设方案',width:80,align:'center'}
    			]],
    			onLoadSuccess:function(){
    				$('#'+grid.id).datagrid('fixDetailRowHeight',index);
    	        }
	    	});
		}
	};

var Rh11={
		onLoadSuccess:function(data){
		},
		onClickRow:function(rowIndex, rowData){
		},
		onSelect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.push(rowData.xmbm);
		},
		onSelectAll:function(rows){
			if(selArray.length<rows.length){
				selArray.splice(0,selArray.length);
				$.each(rows,function(index,item){
					selArray.push(item.xmbm);
				});
			}else if(selArray.length==rows.length){
				selArray.splice(0,selArray.length);
			}
		},
		onUnselect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.pop(rowData.xmbm);
		},
		detailFormatter:function(index,row){
			return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';
		},
		onExpandRow:function(index,row){
			$('#table_lx'+row.xmbm).datagrid({
				url:'/jxzhpt/qqgl/selectlxList.do',
				queryParams:{
					'lx.xmid':row.xmbm,
					'lx.jdbs':YMLib.Var.jdbs,
					'lx.sffirst':'1'
				},
    			columns:[[
    			   /* {field:'cz',title:'操作',width:150,align:'center',
    			    	formatter:function(value,row,index){
    			    		var result='<a href="javascript:updateLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">编辑</a>';
    			    		result +='&nbsp;<a href="javascript:deleteLx('+"'"+row.id+"',"+"'"+row.xmid.substring(10,11)+"'"+')" style="color:#3399CC;">删除</a>';
    			    		return result;
    			    	}
    			    },*/
					{field:'gydw',title:'管养单位',width:150,align:'center'},    
					{field:'xzqh',title:'行政区划',width:150,align:'center'},
					{field:'lxmc',title:'路线名称',width:120,align:'center'},
					{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
				    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
				    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
					{field:'lxbm',title:'原路线编码',width:100,align:'center'},
					{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
					{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
					{field:'qdmc',title:'起点名称',width:100,align:'center'},
					{field:'zdmc',title:'止点名称',width:100,align:'center'},
					{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
					{field:'xjsdj',title:'现技术等级',width:80,align:'center'},
					{field:'lc',title:'里程',width:60,align:'center'}
    			]],
    			onLoadSuccess:function(){
    				$('#'+grid.id).datagrid('fixDetailRowHeight',index);
    	        }
	    	});
		}
	};
function bindLxGrid(){
	Rh.onExpandRow=function(index,row){
		$('#table_lx'+row.xmbm).datagrid({
			url:'/jxzhpt/qqgl/selectlxList.do',
			queryParams:{
				'lx.xmid':row.xmbm,
				'lx.jdbs':YMLib.Var.jdbs,
				'lx.sffirst':'1'
			},
			columns:[[
			    {field:'cz',title:'操作',width:150,align:'center',
			    	formatter:function(value,row,index){
			    		var result='<a href="javascript:loadLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">详细</a>';
			    		return result;
			    	}
			    },
				{field:'gydw',title:'管养单位',width:150,align:'center'},    
				{field:'xzqh',title:'行政区划',width:150,align:'center'},
				{field:'lxmc',title:'路线名称',width:120,align:'center'},
				{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
				{field:'lxbm',title:'原路线编码',width:100,align:'center'},
				{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
				{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
				{field:'qdmc',title:'起点名称',width:100,align:'center'},
				{field:'zdmc',title:'止点名称',width:100,align:'center'},
				{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
				{field:'xjsdj',title:'现技术等级',width:80,align:'center'},
				{field:'lc',title:'里程',width:60,align:'center'}
			]],
			onLoadSuccess:function(){
				$('#'+grid.id).datagrid('fixDetailRowHeight',index);
	        }
    	});
	}
}
//此对象为绑定列表对象
var grid={
		id:null,url:null,queryParams:null,height:null,width:null,fitColumns:false,
		columns:null,striped:true,pagination:true,
		rownumbers:true,pageNumber:1,pageSize:10,
		view:detailview,detailFormatter:null,onExpandRow:null};
var xmbm;//最新选择的项目编码
var xmlx;//项目类型，用在计划下达弹窗，在设置计划审核信息时，区分项目类型
var selArray=new Array();//选中的项目编码集合
/**
 * 绑定easy-ui的datagrid表格
 * @param grid datagrid配置对象
 */
function gridBind(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Rh.onSelect,
	    onSelectAll:Rh.onSelectAll,
	    onUnselect:Rh.onUnselect,
	    onClickRow:Rh.onClickRow,
	    onLoadSuccess:Rh.onLoadSuccess,
	    view:grid.view,
	    detailFormatter:Rh.detailFormatter,
	    onExpandRow:Rh.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.98});
}


function gridBind11(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Rh11.onSelect,
	    onSelectAll:Rh11.onSelectAll,
	    onUnselect:Rh11.onUnselect,
	    onClickRow:Rh11.onClickRow,
	    onLoadSuccess:Rh11.onLoadSuccess,
	    view:grid.view,
	    detailFormatter:Rh11.detailFormatter,
	    onExpandRow:Rh11.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.98});
}

function gridBind1(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    fitColumns:grid.fitColumns,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Rh.onSelect,
	    onUnselect:Rh.onUnselect,
	    onClickRow:Rh.onClickRow,
	    onLoadSuccess:Rh.onLoadSuccess
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.98});
}
function gridBindyh(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Qwh.onSelect,
	    onSelectAll:Qwh.onSelectAll,
	    onUnselect:Qwh.onUnselect,
	    onClickRow:Qwh.onClickRow,
	    onLoadSuccess:Qwh.onLoadSuccess,
	    view:grid.view,
	    detailFormatter:Qwh.detailFormatter,
	    onExpandRow:Qwh.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.98});
}
function jslckdgbbzzj(){
	$.messager.show({  
        title: "提示",  
        msg: "正在计算补助资金，请等待。。。！",  
        showType: 'slide',  
        timeout: 7000  
    });  
	setTimeout('jslckdgbbzzj1()',7000);
}
//计算里程宽度改变补助资金
function jslckdgbbzzj1(){
	//alert();
	var flag='';
	flag='lqhntmc';
	jsbzzj(flag);
	flag='gxlqhntmc';
	jsbzzj(flag);
	flag='snhntmc';
	jsbzzj(flag);
	flag='lqlmjdrzs';
	jsbzzj(flag);
	flag='lqlmcbrzs';
	jsbzzj(flag);
	flag='swjc';
	jsbzzj(flag);
	flag='lqlmpmlqjdlzs';
	jsbzzj(flag);
	flag='lqlmrhlqjdlzs';
	jsbzzj(flag);
	flag='lqlmcblzs';
	jsbzzj(flag);
	flag='xzrxjc';
	jsbzzj(flag);
	flag='swjclzs';
	jsbzzj(flag);
	if($("#xfcse").attr("checked")=="checked"){
		flag='xfc';
		jsbzzj(flag);
	}
	flag='wcsnmb';
	jsbzzj(flag);
	flag='wcswjc';
	jsbzzj(flag);
	if($("#snhntmchbse").attr("checked")=="checked"||($("#snhntmchbmj").val()!=null && $("#snhntmchbmj").val()!='')){
		flag='snhntmchb';
		jsbzzj(flag);
	}
	if($("#bxse").attr("checked")=="checked"){
		flag='bx';
		jsbzzj(flag);
	}
	if($("#snhntmcsshse").attr("checked")=="checked"){
		flag='snhntmcssh';
		jsbzzj(flag);
	}
}



//计算yhdzx费用
function jsbzzj(flag){
	var yi=$("#yilc").val();
	var er=$("#erlc").val();
	var san=$("#sanlc").val();
	var si=$("#silc").val();
	var dw=$("#dwlc").val();
	var wl=$("#wllc").val();
	if(yi==''||yi==null)
	yi=0;
	if(er==''||er==null)
	er=0;
	if(san==''||san==null)
	san=0;
	if(si==''||si==null)
	si=0;
	if(dw==''||dw==null)
	dw=0;
	if(wl==''||wl==null)
	wl=0;
	var zlc=accAdd(accAdd((accAdd(parseFloat(yi),parseFloat(er))),(accAdd(parseFloat(san),parseFloat(si)))),(accAdd(parseFloat(dw),parseFloat(wl))));  
	var elc=accSub(zlc,parseFloat(yi));
	var zj1=0;
	var zj2=0;
	var zj3=0;
	var zj4=0;
	var zj5=0;
	var zj6=0;
	var zj7=0;
	var zj8=0;
	var zj9=0;
	var zj10=0;
	var zj11=0;
	var zj12=0;
	var zj13=0;
	var zj14=0;
	var zj15=0;
	var zj16=0;
	var zj17=0;
	var zj18=0;
	if(flag=='lqhntmc'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#lqhntmchd").numberbox('getValue')!=null && $("#lqhntmchd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#lqhntmchd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#lqhntmcdj").html())),1000000);
			$("#lqhntmc").val(bz);
		}else{
			$("#lqhntmc").val('');
		}
	}
	if(flag=='gxlqhntmc'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#gxlqhntmchd").numberbox('getValue')!=null && $("#gxlqhntmchd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#gxlqhntmchd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#gxlqhntmcdj").html())),1000000);
			$("#gxlqhntmc").val(bz);
		}else{
			$("#gxlqhntmc").val('');
		}
	}
	if(flag=='snhntmc'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#snhntmchd").numberbox('getValue')!=null && $("#snhntmchd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#snhntmchd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#snhntmcdj").html())),1000000);
			$("#snhntmc").val(bz);
		}else{
			$("#snhntmc").val('');
		}
	}
	if(flag=='lqlmjdrzs'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#lqlmjdrzshd").numberbox('getValue')!=null && $("#lqlmjdrzshd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#lqlmjdrzshd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#lqlmjdrzsdj").html())),1000000);
			$("#lqlmjdrzs").val(bz);
		}else{
			$("#lqlmjdrzs").val('');
		}
	}
	if(flag=='lqlmcbrzs'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#lqlmcbrzshd").numberbox('getValue')!=null && $("#lqlmcbrzshd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#lqlmcbrzshd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#lqlmcbrzsdj").html())),1000000);
			$("#lqlmcbrzs").val(bz);
		}else{
			$("#lqlmcbrzs").val('');
		}
	}
	if(flag=='swjc'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#swjchd").numberbox('getValue')!=null && $("#swjchd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#swjchd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#swjcdj").html())),1000000);
			$("#swjc").val(bz);
		}else{
			$("#swjc").val('');
		}
	}
	if(flag=='lqlmpmlqjdlzs'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#lqlmpmlqjdlzshd").numberbox('getValue')!=null && $("#lqlmpmlqjdlzshd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#lqlmpmlqjdlzshd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#lqlmpmlqjdlzsdj").html())),1000000);
			$("#lqlmpmlqjdlzs").val(bz);
		}else{
			$("#lqlmpmlqjdlzs").val('');
		}
	}
	if(flag=='lqlmrhlqjdlzs'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#lqlmrhlqjdlzshd").numberbox('getValue')!=null && $("#lqlmrhlqjdlzshd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#lqlmrhlqjdlzshd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#lqlmrhlqjdlzsdj").html())),1000000);
			$("#lqlmrhlqjdlzs").val(bz);
		}else{
			$("#lqlmrhlqjdlzs").val('');
		}
	}
	if(flag=='lqlmcblzs'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#lqlmcblzshd").numberbox('getValue')!=null && $("#lqlmcblzshd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#lqlmcblzshd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#lqlmcblzsdj").html())),1000000);
			$("#lqlmcblzs").val(bz);
		}else{
			$("#lqlmcblzs").val('');
		}
	}
	if(flag=='xzrxjc'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#xzrxjchd").numberbox('getValue')!=null && $("#xzrxjchd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#xzrxjchd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#xzrxjcdj").html())),1000000);
			$("#xzrxjc").val(bz);
		}else{
			$("#xzrxjc").val('');
		}
	}
	if(flag=='swjclzs'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#swjclzshd").numberbox('getValue')!=null && $("#swjclzshd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#swjclzshd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#swjclzsdj").html())),1000000);
			$("#swjclzs").val(bz);
		}else{
			$("#swjclzs").val('');
		}
	}
	if(flag=='xfc'){
		
		if($("#lmkd").val()!=null && $("#lmkd").val()!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			if($("#xfcse").attr("checked")=="checked"){
				var bz=accDiv(accMul(mj,parseFloat($("#xfcdj").html())),10000);
				$("#xfc").val(bz);
				$("#xfchd").val("是");
			}else{
				$("#xfc").val('');
				$("#xfchd").val("否");
				}
		}else{
			$("#xfc").val('');
		}
	}
	if(flag=='wcsnmb'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#wcsnmbhd").numberbox('getValue')!=null && $("#wcsnmbhd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#wcsnmbhd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#wcsnmbdj").html())),1000000);
			$("#wcsnmb").val(bz);
		}else{
			$("#wcsnmb").val('');
		}
	}
	if(flag=='wcswjc'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!='' && $("#wcswjchd").numberbox('getValue')!=null && $("#wcswjchd").numberbox('getValue')!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			var tj=accMul(parseFloat($("#wcswjchd").val()),mj);
			var bz=accDiv(accMul(tj,parseFloat($("#wcswjcdj").html())),1000000);
			$("#wcswjc").val(bz);
		}else{
			$("#wcswjc").val('');
		}
	}
	if(flag=='snhntmchb'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!=''){
			var mj;
			if($("#snhntmchbmj").val()!=null && $("#snhntmchbmj").val()!='' && $("#snhntmchbmj").val()!='0')
				mj=parseFloat($("#snhntmchbmj").val());
			else
			mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			if($("#snhntmchbse").attr("checked")=="checked"||($("#snhntmchbmj").val()!=null && $("#snhntmchbmj").val()!='' && $("#snhntmchbmj").val()!='0')){
				var bz=accDiv(accMul(mj,parseFloat($("#snhntmchbdj").html())),10000);
				$("#snhntmchb").val(bz);
				$("#snhntmchbhd").val("是");
			}else{
				$("#snhntmchb").val('');
				$("#snhntmchbhd").val("否");
				}
		}else{
			$("#snhntmchb").val('');
		}
	}
	if(flag=='bx'){
		if(zlc!=null && zlc!=''){
			
			if($("#bxse").attr("checked")=="checked"){
				var bz1=accDiv(accMul(elc,parseFloat($("#bxerdj").html())),10000);
				var bz2=accDiv(accMul(yi,parseFloat($("#bxyidj").html())),10000);
				var bz=accAdd(bz1,bz2);
				$("#bxhd").val("是");
				$("#bx").val(bz);
			}else{
				$("#bxhd").val("否");
				$("#bx").val('');
				}
		}else{
			$("#bx").val('');
		}
	}
	if(flag=='snhntmcssh'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!=''){
			var mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			if($("#snhntmcsshse").attr("checked")=="checked"){
				var bz=accDiv(accMul(mj,parseFloat($("#snhntmcsshdj").html())),10000);
				$("#snhntmcsshhd").val("是");
				$("#snhntmcssh").val(bz);
			}else{
				$("#snhntmcsshhd").val("否");
				$("#snhntmcssh").val('');
				}
		}else{
			$("#snhntmcssh").val('');
		}
	}
	if(flag=='fcbc30'||flag=='bc6'||flag=='bc25'||flag=='bc30'||flag=='bmc25'||flag=='wfc'||flag=='xjfc'||flag=='wbc'){
		if($("#lmkd").val()!=null && $("#lmkd").val()!=''){
			var mj;
			mj=accMul(parseFloat($("#lmkd").val()),parseFloat(zlc)*1000);
			if($("#"+flag+"se").attr("checked")=="checked"){
				var bz=accDiv(accMul(mj,parseFloat($("#"+flag+"dj").html())),10000);
				$("#"+flag).val(bz);
				$("#"+flag+"hd").val("是");
			}else{
				$("#"+flag).val('');
				$("#"+flag+"hd").val("否");
				}
		}else{
			$("#"+flag).val('');
		}
	}
	
	
	
	
	if($("#lqhntmc").val()!='')
	zj1=$("#lqhntmc").val();
	if($("#gxlqhntmc").val()!='')
	zj2=$("#gxlqhntmc").val();
	if($("#snhntmc").val()!='')
	zj3=$("#snhntmc").val();
	if($("#lqlmjdrzs").val()!='')
	zj4=$("#lqlmjdrzs").val();
	if($("#lqlmcbrzs").val()!='')
	zj5=$("#lqlmcbrzs").val();
	if($("#swjc").val()!='')
	zj6=$("#swjc").val();
	if($("#lqlmpmlqjdlzs").val()!='')
	zj7=$("#lqlmpmlqjdlzs").val();
	if($("#lqlmrhlqjdlzs").val()!='')
	zj8=$("#lqlmrhlqjdlzs").val();
	if($("#lqlmcblzs").val()!='')
	zj9=$("#lqlmcblzs").val();
	if($("#xzrxjc").val()!='')
	zj10=$("#xzrxjc").val();
	if($("#swjclzs").val()!='')
	zj11=$("#swjclzs").val();
	if($("#xfc").val()!='')
	zj12=$("#xfc").val();
	if($("#wcsnmb").val()!='')
	zj13=$("#wcsnmb").val();
	if($("#wcswjc").val()!='')
	zj14=$("#wcswjc").val();
	if($("#snhntmchb").val()!='')
	zj15=$("#snhntmchb").val();
	if($("#bx").val()!='')
	zj16=$("#bx").val();
	if($("#snhntmcssh").val()!='')
	zj17=$("#snhntmcssh").val();
	
	var tt='fcbc30,bc6,bc25,bc30,bmc25,wfc,xjfc,wbc';
	var tt1=tt.split(",");
	for(var i=0;i<tt1.length;i++){
		if($("#"+tt1[i]).val()!='')
			zj18=accAdd(zj18,$("#"+tt1[i]).val());
	}
	var zbz=accAdd(accAdd(accAdd(accAdd(accAdd(accAdd(zj1,zj2),accAdd(zj3,zj4)),accAdd(accAdd(zj5,zj6),accAdd(zj7,zj8))),accAdd(accAdd(accAdd(zj9,zj10),accAdd(zj11,zj12)),accAdd(accAdd(zj13,zj14),accAdd(zj15,zj16)))),zj17),zj18);
	$("#sbzj1").html(zbz.toFixed(0));
	$("#sbzj").val(zbz.toFixed(0));
	
}


function thwshlxsh(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(Number(rows[i].sqzt)!=Number($.cookie('unit2').length)){
			alert('请您勿勾选未审核的项目');
			return;
		}
	}
	
	var xmbm1=rows[0].xmbm;
	xmlx=xmbm1.substr(10,1);
	
	for ( var i = 1; i < rows.length; i++) {
		xmbm1+=","+rows[i].xmbm;
	}
	xmbm=xmbm1;
	
	sbthcd=$.cookie("unit2").length+2;
	if(confirm('您确定退回吗？')){
		var data = "lxsh.xmbm="+xmbm+"&lxsh.sbthcd="+sbthcd+"&lxsh.xmlx="+xmlx;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/thwshlxsh.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('退回成功！');
					 $("#grid").datagrid('reload');
				 }else{
					 alert('退回失败,请检查项目阶段！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	
	}
}

/* cbjs上报shm */
function shangbaoCbsj(index){
	//alert(index);
	var xmlx="";
	var xmbm='';
	if(index==null){
		var rows=$('#grid').datagrid('getSelections');
		if(rows.length==0) {
			alert("请选择要上报项目！");
			return;
		}
		for(var i=0;i<rows.length;i++){
			if(rows[i].sbzt=='1'){
				alert("有项目已上报，请检查后操作！");
				return ;
			}
		}
		var xmbm1=rows[0].xmbm;
		xmlx=xmbm1.substr(10,1);
		for ( var i = 1; i < rows.length; i++) {
			xmbm1+=","+rows[i].xmbm;
		}
		xmbm=xmbm1;
	}else{
		var da=$("#grid").datagrid('getRows')[index];
		if(da.sbzt=='1'){
			alert("有项目已上报，请检查后操作！");
			return ;
		}
		xmlx=da.xmbm.substr(10,1);
		xmbm=da.xmbm;
	}
	//alert(xmlx+"   "+xmbm);
	sbthcd=$.cookie("unit2").length-2;
	if(confirm('您确定上报吗？')){
		var data = "cbsj.xmbm="+xmbm+"&cbsj.sbthcd="+sbthcd+"&cbsj.xmlx="+xmlx;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shangbaoCbsj.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#grid").datagrid('reload');
				 }else{
					 alert('上报失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}

/* cbsj退回未审核shm */
function thwshcbsj(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt!='1'){
			alert('请您勿勾选未审核的项目');
			return;
		}
	}
	
	var xmbm1=rows[0].xmbm;
	xmlx=xmbm1.substr(10,1);
	
	for ( var i = 1; i < rows.length; i++) {
		xmbm1+=","+rows[i].xmbm;
	}
	xmbm=xmbm1;
	//alert(xmlx);
	sbthcd=$.cookie("unit2").length+2;
	if(confirm('您确定退回吗？')){
		var data = "cbsj.xmbm="+xmbm+"&cbsj.sbthcd="+sbthcd+"&cbsj.xmlx="+xmlx;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/thwshcbsj.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('退回成功！');
					 $("#grid").datagrid('reload');
				 }else{
					 alert('退回失败,请检查项目阶段！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	
	}
}

/*初步设计 退回shm*/
function cbjsrollback(){
	var rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt=='1'){
			alert('请您勿勾选已审核的项目');
			return;
		}
	}
	YMLib.UI.createWindow('lxxx','退回项目','cbsj_th.jsp','lxxx',400,200);	
}

