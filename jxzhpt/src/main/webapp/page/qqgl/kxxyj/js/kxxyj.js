function urlxmnf(id,flag){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	if(flag=='01011201010101'||flag=='0101120101010101'||flag=='0101120101010102'||flag=='0101120101010103'||
	   flag=='0101120101010104'||flag=='0101120101010105'||flag=='0101120101010106'||flag=='01011201010102'||
	   flag=='010112010102'||flag=='010112010105'||flag=='010112020101'||
	   flag=='01011202010101'||flag=='01011202010102'||flag=='01011202010103'||
	   flag=='010112030101'||flag=='01011203010101'||flag=='01011203010102'||flag=='01011203010103'||
	   flag=='010112030103'||flag=='010112040101'||flag=='01011301010101'||flag=='01011301010102'||
	   flag=='010113010102'||flag=='010113010105'||flag=='01011302010101'||flag=='01011302010102'||
	   flag=='010113020102'||flag=='010113020105'||flag=='01011303010101'||flag=='01011303010102'||
	   flag=='010113030102'||flag=='010113030105'||flag=='01011304010101'||
	   flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'||flag=='010112020102' 
	){
		$("#bstext").html('十二五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2015)
					first=2015;
				if(first<2010)
					first=2010;
			}
			years.push({text:(2010+5-i),value:(2010+5-i)});
		}
	}
	if(flag=='01011201020101'||flag=='0101120102010101'||flag=='0101120102010102'||
		flag=='0101120102010103'||flag=='0101120102010104'||flag=='0101120102010105'||
		flag=='0101120102010106'||flag=='01011201020102'||flag=='010112010202'||
		flag=='010112010205'||flag=='010112020201'||flag=='01011202020101'||
		flag=='01011202020102'||flag=='01011202020103'||flag=='010112030201'||
		flag=='01011203020101'||flag=='01011203020102'||flag=='01011203020103'||
		flag=='010112030203'||flag=='010112040201'||flag=='01011301020101'||
		flag=='01011301020102'||flag=='010113010202'||flag=='010113010206'||
		flag=='01011302020101'||flag=='01011302020102'||flag=='010113020202'||
		flag=='010113020206'||flag=='01011303020101'||flag=='01011303020102'||
		flag=='010113030202'||flag=='010113030206'||flag=='010113040105'||flag=='01011304020101'||
		flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'||flag=='010112020202'
	){
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
function showkxxTjxx(xmlx){
	var lsxmnf=$("#lsxmnf").combobox('getValues').join(",");
	if(lsxmnf=='')
	lsxmnf='';
	if(lsxmnf.substr(0,1)==',')
	lsxmnf=lsxmnf.substr(1,lsxmnf.length);
	var lsxmlx=$("#lsxmlx").combobox('getValues').join(",");
	if(lsxmlx=='')
	lsxmlx='';
	if(lsxmlx.substr(0,1)==',')
	lsxmlx=lsxmlx.substr(1,lsxmlx.length);
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	if(xmlx!='xj')
	var lsjl=$("#lsjl").combobox('getValue');
	else lsjl='';
	var xmlx1='';
	var sbzt='';var shzt='';
	if(xmlx=='gsdgz'){
		xmlx1=$("#xmlx").combobox("getValues").join(",");
		if(xmlx1.substr(0,1)==',')
			xmlx1=xmlx1.substr(1,xmlx1.length);
		if($.cookie('unit2').length==7){
			sbzt='1';
		}
		shzt=$("#sbzt").combobox('getValue');
	}else{
		sbzt=$("#sbzt").combobox('getValue');
		shzt=$("#shzt").combobox('getValue');
	}

	if($.cookie('unit2').length==7){
		sbzt='1';
	}
	
	var  data='lxsh.lsjl='+lsjl+
	'&lxsh.xmlx1='+xmlx1+
	'&lxsh.xzqh='+xzqhstr+
	//'&lxsh.gydw='+gydwstr+
	'&lxsh.sbzt1='+sbzt+
	'&lxsh.xmmc='+xmmc+
	'&lxsh.xmnf='+xmnf+
	'&lxsh.tsdq='+tsdq+
	'&lxsh.jsdj='+jsdj+
	'&lxsh.jsjsdj='+jsjsdj+
	'&lxsh.ghlxbm='+$("#ghlxbm").combotree('getText')+
	'&lxsh.ghlxmc='+$("#ghlxmc").val()+
	'&lxsh.gldj='+gldj+
	'&lxsh.shzt='+shzt+
	'&lxsh.ghlxbh='+$("#lxbm").combotree('getText')+
	'&lxsh.lxmc='+$("#lxmc").val()+
	'&lxsh.xmlx='+xmlx+
	'&lxsh.xmklx='+$("#xmklx").combobox('getValue')+'&lxsh.lsxmnf='+lsxmnf+'&lxsh.lsxmlx='+lsxmlx+
	'&lxsh.xmbm='+$("#xmbm").val();
	
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{jsdj:jsdj,jsjsdj:jsjsdj,gldj:gldj,tsdq:tsdq},function(){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/showkxxTjxx.do',
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
	});
}

function showkxxtzTjxx(xmlx){
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	if(xmlx!='xj')
	var lsjl=$("#lsjl").combobox('getValue');
	else lsjl='';
var  data='lxsh.lsjl='+lsjl+'&lxsh.xzqh='+xzqhstr+'&lxsh.gydw='+gydwstr
+'&lxsh.xmmc='+xmmc+'&lxsh.xmnf='+xmnf+'&lxsh.tsdq='+tsdq+'&lxsh.jsdj='+jsdj
+'&lxsh.gldj='+gldj+'&lxsh.ghlxbh='+$("#lxbm").combotree('getText')+'&lxsh.lxmc='+$("#lxmc").val()+'&lxsh.xmlx='+xmlx+'&lxsh.tzxz='+$("#tzxz").combobox("getValue");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/showkxxtzTjxx.do',
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

function jsyzlc(){
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
		wulc=parseFloat($('#wllc').val());
	if($('#dwlc').val()!='')
		dwlc=parseFloat($('#dwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#lc').val(hj5);
}
function jsjszlc(){
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
		wulc=parseFloat($('#jhwllc').val());
	if($('#jhdwlc').val()!='')
		dwlc=parseFloat($('#jhdwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#jszlc').val(hj5);
}




var obj=new Object();
/**
 * 判断项目类型，返回文字
 * @param xmbm 项目编码
 * @result 返回项目类型
 */
function panduanxmlx(xmbm){
	var result="";
	var xmlx = xmbm.substring(10,11);
	if(xmlx=="1"){
		result="升级改造工程项目";
	}else if(xmlx=="2"){
		result="路面改造工程项目";
	}else if(xmlx=="3"){
		result="新建工程项目";
	}else if(xmlx=="4"){
		result="养护大中修项目";
	}else if(xmlx=="5"){
		result="灾毁恢复重建项目";
	}
	return result;
}
function xiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','sjgzsb_xx.jsp','lxxx',900,400);
}
function xiangxitz(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','sjgzsb_xx1.jsp','lxxx',900,400);
}
function edit(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑可行性研究信息','sjgzsb_edit.jsp','lxxx',900,400);
}

//工可对审批按钮进行行业审查和工可选择
function shenhxz(){
	var rows=$('#datagrid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要审核项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].scshzt=='1' && rows[i].sbzt1=='1'){
			alert("审核失败，有已审核项目！");
			return;
		}
	}
	   $.messager.defaults = { ok: "行业审查", cancel: "工可"};     
	   $.messager.confirm("操作提示", "请选择需要审核的类型！", function (data) {
		   if(data){
			   for(var i=0;i<rows.length;i++){
				   if(rows[i].scshzt=='1'){
					   alert("审核失败，有行业审查已审核的项目！");
					   return;
				   }
		   } 
			   shenhysc();
		   }else{
			   for(var i=0;i<rows.length;i++){
				  if(rows[i].sbzt1=='1') {  
				      alert("审核失败，有工可已审核项目！");
				      return;
			   }
			   if(rows[i].sbzts !='1'){
				     alert("审核失败，有未上报至工可的项目！");
                     return;
			   }

			   if(rows[i].scshzt != '1' && rows[i].sbzt1 !='1'){
				     alert("审核失败，有需要先审核行业审查的项目！");
				     return;
			   }		   
			   shangB();
			   } 
		   }
	   });
}


//行业审查审核状态
function shenhysc(index){
  var xmlx="";
  var xmbm='';
  var id='';
  if(index == null){
	var rows=$('#datagrid').datagrid('getSelections');
/*	if(rows.length==0) {
		alert("请选择要审核项目！");
		return;
	}*/
	for(var i=0;i<rows.length;i++){
		if(rows[i].scshzt=='1'){
			alert("对不起，项目已审核！");
			return;
		}
	}
	id=rows[0].id;
	xmbm=rows[0].xmbm;
	xmlx=xmbm.substr(10,1);
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
		xmbm+=","+rows[i].xmbm ;
	}  
 }else{
	var da=$("#datagrid").datagrid('getRows')[index];
	if(da.scshzt == '1'){
		alert("对不起，项目已审核！");
		return ;
	}
	xmlx=da.xmbm.substr(10,1);
	xmbm=da.xmbm;
	id=da.id;
  }
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id+"&lxsh.xmbm="+xmbm+"&lxsh.xmlx="+xmlx;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shgcxmhysc.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('审核失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}

function shangB(){
	alert("asdfad");
	var rows=$('#datagrid').datagrid('getSelections');
/* 			if(rows.length==0) {
		alert("请选择要审核项目！");
		return;
	} */
	for(var i=0;i<rows.length;i++){
		if(rows[i].sbzt1=='1'){
			alert("对不起，项目已审核！");
			return;
		}
	}
	if($.cookie("unit2").length!=7) {
		alert("您无审核项目权限！");
		return;
	}
	var id=rows[0].id;
	var xmbm=rows[0].xmbm;
	for(var i=1;i<rows.length;i++){
		id+=","+rows[i].id ;
		xmbm+=","+rows[i].xmbm ;
	}
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id+"&lxsh.xmbm="+xmbm;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shsjgzkxx.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('审核失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
} 

function shenh(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shsjgzkxx.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('审核失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
function shenh1(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shlmgzkxx.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('审核失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
function shenh2(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shxjkxx.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('审核失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
//
function xiangxi1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','lmgzsb_xx.jsp','lxxx',900,400);
}
function xiangxi1tz(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','lmgzsb_xx1.jsp','lxxx',900,400);
}
function edit1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑可行性研究信息','lmgzsb_edit.jsp','lxxx',900,400);
}
//
function xiangxi2(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','xjsb_xx.jsp','lxxx',900,400);
}
function xiangxi2tz(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','xjsb_xx1.jsp','lxxx',900,400);
}
function edit2(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑可行性研究信息','xjsb_edit.jsp','lxxx',900,400);
}
function removes(id){
	parent.$('#'+id).window('destroy');
}
function dingwei(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/selectlxbyxmid.do',
			data:"lxsh.xmbm="+data.xmbm+"&lxsh.jdbs=1",
			dataType:'json',
			success:function(msg){
				var lxbm="";
				var qdzh="";
				var zdzh="";
				for(var i=0;i<msg.length;i++){
					if(i==msg.length-1){
						lxbm=lxbm+msg[i].ghlxbm;
						qdzh=qdzh+msg[i].ghqdzh;
						zdzh=zdzh+msg[i].ghzdzh;
					}else{
						lxbm=lxbm+msg[i].ghlxbm+"-";
						qdzh=qdzh+msg[i].ghqdzh+"-";
						zdzh=zdzh+msg[i].ghzdzh+"-";
					}
				}
				locationXm1(lxbm,qdzh,zdzh);
			},
			error : function(){
			 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
		 }
	});	
}
function showsjgzAll(){
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
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  ';
	        }},
	        
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
//	        {field:'c1',title:'上报状态',width:100,align:'center',formatter:function(value,row,index){
//	        	if(row.sbzt1=='0')
//        		return '未上报';
//	        	else if(row.sbzt1=='1'||sbthcd==7)
//	        		return '已上报';
//	        	else return '未知';
//	        }},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'}

	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
					 	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
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
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}
//lmgz
function showlmgzAll(){
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
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	 //if(row.sbzt1=='1')
		        //		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    ';
		        return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
	        }},
//	        {field:'c1',title:'上报状态',width:100,align:'center',formatter:function(value,row,index){
//	        	if(row.sbzt1=='0')
//        		return '未上报';
//	        	else 
//	        		return '已上报';
//
//	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
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
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}
//xj
function showxjAll(){
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
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjkxList.do',
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
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	 //if(row.sbzt1=='1')
		        //		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    ';
		        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  ';
	        }},
//	        {field:'c1',title:'上报状态',width:100,align:'center',formatter:function(value,row,index){
//	        	if(row.sbzt1=='0')
//        		return '未上报';
//	        	else if(row.sbzt1=='1'||sbthcd==7)
//	        		return '已上报';
//	        	else return '未知';
//	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'}	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
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
    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:60,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:60,align:'center'},
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
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}
//升级审核
function showAllsjsh(){
	var scsbzt='';
	showkxxTjxx('sjgz');
	var lsxmnf=$("#lsxmnf").combobox('getValues').join(",");
	if(lsxmnf=='')
	lsxmnf='';
	if(lsxmnf.substr(0,1)==',')
	lsxmnf=lsxmnf.substr(1,lsxmnf.length);
	var lsxmlx=$("#lsxmlx").combobox('getValues').join(",");
	if(lsxmlx=='')
	lsxmlx='';
	if(lsxmlx.substr(0,1)==',')
	lsxmlx=lsxmlx.substr(1,lsxmlx.length);
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	var sbzt=$("#sbzt").combobox('getValue');
	var shzt=$("#shzt").combobox('getValue');
	if($.cookie('unit2').length==7){
		sbzt='1';
		scsbzt='1';
	}
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-220,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			'lxsh.scsbzt':scsbzt,
			'lxsh.shzt':shzt,
			tsdq:tsdq,
			jsdj:jsdj,
			jsjsdj:jsjsdj,
			ghlxbm:$("#ghlxbm").combotree('getText'),
			ghlxmc:$("#ghlxmc").val(),
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").combotree('getText'),
			'lxsh.lxmc':$("#lxmc").val(),
			'lxsh.xmklx':$("#xmklx").combobox('getValue'),
			'lxsh.lsxmnf':lsxmnf,
			'lxsh.lsxmlx':lsxmlx,
			'lxsh.xmbm':$("#xmbm").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:180,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    ';
	        	//if($.cookie("unit2").length!=7)
	        		//return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑 ';
	        	var res ="";
	        	if($.cookie("unit2").length!=7){
	        		if(row.sbzt1=='1'){
	        			res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑  ';
	        			return res+' 添加路线   变更';
	        		}
        			else{
		        		res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑 </a>';
		        		return res+' <a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">添加路线</a>   <a href="javascript:tz('+"'"+row.xmbm+"','sjgz'"+')" style="text-decoration:none;color:#3399CC; ">变更</a>';
		        	}
	        	}
	        	else{
	        		res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑 </a>';
		        	return res+' <a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">添加路线</a>   <a href="javascript:tz('+"'"+row.xmbm+"','sjgz'"+')" style="text-decoration:none;color:#3399CC; ">变更</a>';
	        	}
	        	
	        }},
	        {field:'cs',title:sctitle,width:120,align:'center',formatter:function(value,row,index){
	        	//如果不是省级用户
	        	if($.cookie("unit2").length!=7){
	        		if(row.scsbzt == '1'){
	        			if(row.scshzt == '1') 
	        				return '已审核';
	        			else 
	        				return '已上报'
	        		}else{
    				if(row.scthyy!='' && row.scthyy!=null) 
    					    return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangbaohysc('+index+')">未上报</a>'+'    <a style="text-decoration:none;color:#3399CC;" href="#" onclick="hyscthyy('+index+')">退回原因</a>';
        				else 
        					return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangbaohysc('+index+')">未上报</a>';
	        	}
	          }else{
	        		if(row.scshzt=='0'){
		        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenhysc('+index+')">未审核</a>';
	        		}else if(row.scshzt=='1')
		        		return '已审核';
	          }
	        }},
	        {field:'c1',title:title,width:100,align:'center',formatter:function(value,row,index){
	        	if($.cookie("unit2").length!=7){
	        		if(row.sbzts=='1'){
	        			if(row.sbzt1=='1')
	        				return '已审核';
	        			else
	        			    return '已上报';
        			}else{
        				//对工可的退回可以看到退回原因
        				if(row.scshzt == '1'){
        					if(row.thyy!=''&&row.thyy!=null)
        						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangbaokxx('+index+')">未上报</a>'+'    <a style="text-decoration:none;color:#3399CC;" href="#" onclick="ckthyy('+index+')">退回原因</a>';
        				    else
	        			        return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangbaokxx('+index+')">未上报</a>';
        				}else{
        					if(row.thyy!=''&&row.thyy!=null)
        						return '未上报'+'    <a style="text-decoration:none;color:#3399CC;" href="#" onclick="ckthyy('+index+')">退回原因</a>';
        				    else
	        			        return '未上报';
        					}
        				}
	        	}else{
	        		if(row.sbzts=='0'){ return '未上报'; }
	        		
	        		if(row.scshzt == '1'){
		        		if(row.sbzt1=='0'){
			        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
		        		}
	        		}else{
		        		if(row.sbzt1=='0'){ return '未审核'; }  
	        		}
	        		if(row.sbzt1=='1'){ return '已审核'; }
        		}
	        	
	        }},
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
	        {field : 'jszlc1',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
		    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
		    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		    {field : 'lxbh',title : '原路线编码',width : 60,align : 'center'},
		    {field : 'minqdzh',title : '原起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '原止点桩号',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'},
		    {field : 'tzgs',title : '投资',width : 80,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'},
		    {field : 'bz',title : '备注',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							var result = '<a href="#" onclick="editSjlx('+"'"+parentindex+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
							if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
								result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
							}
							if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
								result+='&nbsp;删除';
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
    			]]
	    	});
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}

function showAllsjsh123(){
	
	showkxxTjxx('sjgz');
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	var sbzt=$("#sbzt").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			jsjsdj:jsjsdj,
			ghlxbm:$("#ghlxbm").combotree('getText'),
			ghlxmc:$("#ghlxmc").val(),
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").combotree('getText'),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
	        {field : 'jhlc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}


var xmbm;
var xmlx;
function tz(id,lx){
	if (!confirm("确认变更吗")) {
		return;
	}
	$.ajax({
		data:'lxsh.xmbm='+id+"&lxsh.tzxz=变更"+"&lxsh.xmlx="+lx+"&lxsh.jdbs="+1,
		type:'post',
		dataType:'json',
		url:'/jxzhpt/qqgl/tzxm.do',
		success:function(msg){
			if(msg){
				alert('变更成功');
				$("#datagrid").datagrid('reload');
			}
				
		}
	})
	
	
	xmbm=id;
	xmlx=lx;
	//YMLib.UI.createWindow('wq_tz','项目变更',"xm_tz.jsp",'wq_tz',500,200);
}

function editSjlx(xmid,index){
	//alert(xmid+""+index);
	var data=$("#table_lx"+xmid).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线信息','sjgzlx_add.jsp','lxxx',900,350);
}
//lm
function showAlllmsh(){
	showkxxTjxx('lmgz');
	var lsxmnf=$("#lsxmnf").combobox('getValues').join(",");
	if(lsxmnf=='')
	lsxmnf='';
	if(lsxmnf.substr(0,1)==',')
	lsxmnf=lsxmnf.substr(1,lsxmnf.length);
	var lsxmlx=$("#lsxmlx").combobox('getValues').join(",");
	if(lsxmlx=='')
	lsxmlx='';
	if(lsxmlx.substr(0,1)==',')
	lsxmlx=lsxmlx.substr(1,lsxmlx.length);

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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var sbzt=$("#sbzt").combobox('getValue');
	var shzt=$("#shzt").combobox('getValue');
	if($.cookie('unit2').length==7){
		sbzt='1';
	}
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-220,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			'lxsh.shzt':shzt,
			tsdq:tsdq,
			jsdj:jsdj,
			jsjsdj:jsjsdj,
			ghlxbm:$("#ghlxbm").combotree('getText'),
			ghlxmc:$("#ghlxmc").val(),
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").combotree('getText'),
			'lxsh.lxmc':$("#lxmc").val(),
			'lxsh.xmklx':$("#xmklx").combobox('getValue'),
			'lxsh.lsxmnf':lsxmnf,
			'lxsh.lsxmlx':lsxmlx,
			'lxsh.xmbm':$("#xmbm").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	var res ="";
	        	if($.cookie("unit2").length!=7){
	        		if(row.sbzt1=='1'){
	        			res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑  ';
	        			return res+' 添加路线   变更';
	        		}
        			else{
		        		res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
		        		return res+'   <a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>     <a href="javascript:tz('+"'"+row.xmbm+"','lmgz'"+')" style="text-decoration:none;color:#3399CC; ">变更</a> ';
		        	}
	        	}
	        	else{
	        		res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
		        	return res+'   <a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>     <a href="javascript:tz('+"'"+row.xmbm+"','lmgz'"+')" style="text-decoration:none;color:#3399CC; ">变更</a> ';
	        	}
	        	
	        	
	        	
	        	/*var re = '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
	        
        		return re+'   <a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>     <a href="javascript:tz('+"'"+row.xmbm+"','lmgz'"+')" style="text-decoration:none;color:#3399CC; ">变更</a> ';
*/
	        
	        }},
	        
	        {field:'c1',title:title,width:60,align:'center',formatter:function(value,row,index){
	        	if($.cookie("unit2").length!=7){
	        		if(row.sbzts=='1'){
	        			if(row.sbzt1=='1')
	        				return '已审核';
	        			else
	        			return '已上报';
        			}else{
        				if(row.thyy!=''&&row.thyy!=null)
            				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangbaokxx('+index+')">未上报</a>'+'    <a style="text-decoration:none;color:#3399CC;" href="#" onclick="ckthyy('+index+')">退回原因</a>';
            				else
    	        			return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangbaokxx('+index+')">未上报</a>';

        			}
	        	}else{
	        		if(row.sbzt1=='0'){
		        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh1('+index+')">未审核</a>';
	        		}else if(row.sbzt1=='1')
		        		return '已审核';
        		}
	        	
	        }},
	        
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
	        {field : 'jszlc1',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
		    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
		    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		    {field : 'lxbh',title : '原路线编码',width : 60,align : 'center'},
		    {field : 'minqdzh',title : '原起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '原止点桩号',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'},
		    {field : 'tzgs',title : '投资',width : 80,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'},
		    {field : 'bz',title : '备注',width : 100,align : 'center'}/*,
		    {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>   ';
	       
        }}*/
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							var result= '<a href="javascript:editGzlx('+"'"+parentindex+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						
							if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
				        		   result+='&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
				        	   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
				        		   result+= '&nbsp;删除';
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
    			]]
	    	});
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}

function showAlllmsh123(){
	showkxxTjxx('lmgz');
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var sbzt=$("#sbzt").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			jsjsdj:jsjsdj,
			ghlxbm:$("#ghlxbm").combotree('getText'),
			ghlxmc:$("#ghlxmc").val(),
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").combotree('getText'),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
	        {field : 'JSZLC',title : '里程',width : 60,align : 'center',
	        	formatter: function(value,row,index){
	        		if(row.xmbm.substr(10,1)=='1'){
	        			return row.jszlc;
	        		}else{
	        			return row.lc;
	        		}
	        	}
		    },
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}




function editGzlx(xmid,index){
	//alert();
	var data=$("#table_lx"+xmid).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线信息','lmgzlx_add.jsp','lxxx',900,350);
}
//xj
function showAllxjsh(){
	showkxxTjxx('xj');
	var lsxmnf=$("#lsxmnf").combobox('getValues').join(",");
	if(lsxmnf=='')
	lsxmnf='';
	if(lsxmnf.substr(0,1)==',')
	lsxmnf=lsxmnf.substr(1,lsxmnf.length);
	var lsxmlx=$("#lsxmlx").combobox('getValues').join(",");
	if(lsxmlx=='')
	lsxmlx='';
	if(lsxmlx.substr(0,1)==',')
	lsxmlx=lsxmlx.substr(1,lsxmlx.length);

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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var sbzt=$("#sbzt").combobox('getValue');
	var shzt=$("#shzt").combobox('getValue');
	if($.cookie('unit2').length==7){
		sbzt='1';
	}
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-215,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			'lxsh.shzt':shzt,
			tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").combotree('getText'),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:$("#jsjsdj").combobox('getValues').join(","),
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").combotree('getText'),
			'lxsh.lxmc':$("#lxmc").val(),
			'lxsh.xmklx':$("#xmklx").combobox('getValue'),
			'lxsh.lsxmnf':lsxmnf,
			'lxsh.lsxmlx':lsxmlx,
			'lxsh.xmbm':$("#xmbm").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	var res="";
	        	if($.cookie("unit2").length!=7){
	        		if(row.sbzt1=='1'){
	        			res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑  ';
	        			return res+' 添加路线   变更';
	        		}
        			else{
        				res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>';
    	        		return res+'   <a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>     <a href="javascript:tz('+"'"+row.xmbm+"','xj'"+')" style="text-decoration:none;color:#3399CC; ">变更</a>';
    	        	}
	        	}
	        	else{
	        		res +='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>';
	        		return res+'   <a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>     <a href="javascript:tz('+"'"+row.xmbm+"','xj'"+')" style="text-decoration:none;color:#3399CC; ">变更</a>';
	        	}
	        	/*var re= '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>';
        		return re+'   <a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>     <a href="javascript:tz('+"'"+row.xmbm+"','xj'"+')" style="text-decoration:none;color:#3399CC; ">变更</a>';
*/
	        }},
	        
	        {field:'c1',title:title,width:60,align:'center',formatter:function(value,row,index){
	        	if($.cookie("unit2").length!=7){
	        		if(row.sbzts=='1'){
	        			if(row.sbzt1=='1')
	        				return '已审核';
	        			else
	        			return '已上报';
        			}else{
        				if(row.thyy!=''&&row.thyy!=null)
            				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangbaokxx('+index+')">未上报</a>'+'    <a style="text-decoration:none;color:#3399CC;" href="#" onclick="ckthyy('+index+')">退回原因</a>';
            				else
    	        			return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangbaokxx('+index+')">未上报</a>';

        			}
	        	}else{
	        		if(row.sbzt1=='0'){
		        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh2('+index+')">未审核</a>';
	        		}else if(row.sbzt1=='1')
		        		return '已审核';
        		}
	        	
	        }},
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
	        {field : 'jszlc1',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'xjlxbm',title : '规划路线编码',width : 60,align : 'center'},
		    {field : 'xjqdzh',title : '规划起点桩号',width : 100,align : 'center'},
		    {field : 'xjzdzh',title : '规划止点桩号',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'},
		    {field : 'tzgs',title : '投资',width : 80,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'},
		    {field : 'bz',title : '备注',width : 100,align : 'center'}/*,
		    {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>   ';

        }}*/
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}

function showAllxjsh123(){
	showkxxTjxx('xj');
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var sbzt=$("#sbzt").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjkxList.do',
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
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").combotree('getText'),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:$("#jsjsdj").combobox('getValues').join(","),
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").combotree('getText'),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 120,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
	        {field : 'JSZLC',title : '里程',width : 60,align : 'center',
	        	formatter: function(value,row,index){
	        		if(row.xmbm.substr(10,1)=='1'){
	        			return row.jszlc;
	        		}else{
	        			return row.lc;
	        		}
	        	}
		    },
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}

//
function fileShow(xmbm,type){
	$.ajax({
		type:'post',
//		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#gkpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
					'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>  |  ' +
					"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					$("#gkpfTable").append(tr);
				}
			}
		}
	});
}
function fileShowXx(xmbm,type){
	$.ajax({
		type:'post',
//		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#gkpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
					'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">&nbsp;下载&nbsp;</a>'+
					"</td></tr>";
					$("#gkpfTable").append(tr);
				}
			}
		}
	});
}
function fileShow1(xmbm,type){
	$.ajax({
		type:'post',
//		url:'../../../qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#gkpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  </td></tr>";
				$("#gkpfTable").append(tr);
				}
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
					 fileShow(parent.obj.xmbm,'工可批复文件');
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
//
function xmny(id){
	$('#'+id).datebox({    
	    required:false,
	    formatter:function(date){
	    	var y = date.getFullYear();
	    	var m = date.getMonth()+1;
	    	return y+'-'+m;
	    }
	});  
	
}
function xmsj(id){
	$('#'+id).datebox({    
	    required:false,
	    formatter:function(date){
	    	var y = date.getFullYear();
	    	var m = date.getMonth()+1;
	    	var d = date.getDate();
	    	return y+'-'+m+'-'+d;
	    }
	});  
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
function getbzcs(gldj,jsdj,lc,xmlx){
	var data="lxsh.xmlx="+xmlx+"&lxsh.gldj="+gldj+"&lxsh.jsdj="+jsdj+"&lxsh.lc="+lc;
	$("#bzcs").html('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/selectbzcs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			$("#bzcs").html(msg.bzys);
		},
		error : function(){
		 YMLib.Tools.Show('未检索到补助标准错误！error code = 404',3000);
	 }
	});	
}
function tjsjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','sjgzlx_add2.jsp','lxxx',900,400);
}
function tjlmlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','lmgzlx_add2.jsp','lxxx',900,400);
}
function tjxjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','xjlx_add.jsp','lxxx',900,400);
}
function delsjlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=sjgz"+"&lxsh.jdbs=1",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showsjgzAll();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}

function dellmlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lx.xmbm='+data.xmid+'&lx.id='+data.id+"&lx.xmlx=lmgz"+"&lx.jdbs=1",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showAllsjsh();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}
function delxjlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=xj"+"&lxsh.jdbs=1",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showxjAll();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}

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

function importsjgzkxx(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '工可信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importsjgzkxx.do"+'&flag='+flag+".jsp?id="+getUrlParame('id'),
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

function importlmgzkxx(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '工可信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importlmgzkxx.do"+'&flag='+flag,
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

function importxjkxx(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '工可信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importxjkxx.do"+'&flag='+flag,
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
//----------------------------------------------------------
function showAlllmsh__ck(){
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	     /*   {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh1('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					/*{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							return '<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						}
					},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
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
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}

function showAllsjsh__ck(){
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	var sbzt=$("#sbzt").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        /*{field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    ';
		        return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
	        	else if(row.sbzt1=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					/*{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							return '<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						}
					},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
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
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}

function showAllxjsh__ck(){
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
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjkxList.do',
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
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	      /*  {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh2('+index+')">未审核</a>';
	        	else if(row.sbzt1=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
		    {field : 'lxbh',title : '路线编码',width : 60,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 80,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
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
	    },
	    onLoadSuccess: function(){
            var dg = $(this);
            var rows=dg.datagrid("getRows");
	    	for (var i=0;i<rows.length;i++){
	    		if(rows[i].xmsl<=1){
	    			dg.datagrid('getExpander', i).hide();
	    		}
	    	}
	    	
		}    
	}); 
}
//工可对上报按钮进行选择
function shangbaoxz(){
	var rows=$('#datagrid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要上报项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if((rows[i].scsbzt =='1' && rows[i].sbzts == '1')||
			(rows[i].scshzt =='1' && rows[i].sbzt1 == '1')||
			(rows[i].scsbzt =='1' && rows[i].sbzt1 == '1')||
			(rows[i].scshzt =='1' && rows[i].sbzts == '1')){
			alert("上报失败，有不能上报的项目！");
			return;
		}
	}
	   $.messager.defaults = { ok: "行业审查", cancel: "工可"};
	   $.messager.confirm("操作提示", "请选择需要上报的类型！", function (data) {
		   if (data) {
				for(var i=0;i<rows.length;i++){
					if(rows[i].scsbzt =='1'){
						alert("上报失败，有行业审查已上报的项目！");
						return;
					}
				}
				//行业审查未上报 &&工可已上报 暂时可以执行此方法
				shangbaohysc();
		   }else{
				for(var i=0;i<rows.length;i++){
					if(rows[i].sbzts =='1'){
						alert("上报失败，有工可已上报的项目！");
						return;
					}
				}
				for(var i=0;i<rows.length;i++){
					if(rows[i].scsbzt !='1' && rows[i].sbzts !='1'){
						alert("上报失败，有需要先上报行业审查的项目！");
						return;
					}
				}
				shangbaokxx();
		   }
	   });	
}

//行业审查上报
function shangbaohysc(index){
	var xmlx="";
	var xmbm='';
	if(index==null){
		var rows=$('#datagrid').datagrid('getSelections');
/*		if(rows.length==0) {
			alert("请选择要上报项目！");
			return;
		}*/
		for(var i=0;i<rows.length;i++){
			if(rows[i].scsbzt=='1'){
				alert("该项目已上报，请检查后操作！");
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
		var da=$("#datagrid").datagrid('getRows')[index];
		if(da.scsbzt=='1'){
			alert("该项目已上报，请检查后操作！");
			return ;
		}
		xmlx=da.xmbm.substr(10,1);
		xmbm=da.xmbm;
	}
	sbthcd=$.cookie("unit2").length-2;
	if(confirm('您确定要上报行业审查吗？')){
		var data = "lxsh.xmbm="+xmbm+"&lxsh.sbthcd="+sbthcd+"&lxsh.xmlx="+xmlx;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/sbgcxmhysc.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#datagrid").datagrid('reload');
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
function rollbackxz(){
	var flag='';
	var rows=$('#datagrid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
	   if(rows[i].sbzt1=='1' && rows[1].scshzt == '1'){
			alert('请您勿勾选已审核的项目');
			return;
	   }	
	}
	   $.messager.defaults = { ok: "行业审查", cancel: "工可"};     
	   $.messager.confirm("操作提示", "请选择需要退回下级的类型！", function (data) {
		   if(data){
				for(var i=0;i<rows.length;i++){
					   if(rows[i].scshzt == '1'){
							alert('退回失败，有行业审查已审核项目！');
							return;
					   }
					   if(rows[i].scshzt != '1' && rows[i].sbzt1 != '1' && rows[i].sbzts == '1'){
						   alert("退回失败，工可未审核项目需先退回下级！");
						   return;
					   }
					}
				flag ='hysc';
		   }else{
			   for(var i=0;i<rows.length;i++){
				   if(rows[i].sbzt1=='1'){
						alert('退回失败，有工可已审核项目！');
						return;
				   }
				   if(rows[i].sbzts != '1'){
					   alert("退回失败，有工可未上报的项目！");
					   return;
				   }
			   }
			   flag='gk';
		   }
			rollback(flag);	 
	   });
}


function rollback(flag){
/*	var rows=$('#datagrid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].sbzt1=='1'){
			alert('请您勿勾选已审核的项目');
			return;
		}
	}*/
	if("hysc" == flag){
		YMLib.UI.createWindow('lxxx','退回项目','hysc_th.jsp','lxxx',400,200);	
	}
	if("gk" == flag){
		YMLib.UI.createWindow('lxxx','退回项目','kxxyj_th.jsp','lxxx',400,200);	
	}
}

function shangbaokxx(index){
	//alert(index);
	var xmlx="";
	var xmbm='';
	if(index==null){
		var rows=$('#datagrid').datagrid('getSelections');
		if(rows.length==0) {
			alert("请选择要上报项目！");
			return;
		}
		for(var i=0;i<rows.length;i++){
			if(rows[i].sbzts=='1'){
				alert("该项目已上报，请检查后操作！");
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
		var da=$("#datagrid").datagrid('getRows')[index];
		if(da.sbzts=='1'){
			alert("该项目已上报，请检查后操作！");
			return ;
		}
		xmlx=da.xmbm.substr(10,1);
		xmbm=da.xmbm;
	}
	//alert(xmlx+"   "+xmbm);
	sbthcd=$.cookie("unit2").length-2;
	if(confirm('您确定上报工可吗？')){
		var data = "lxsh.xmbm="+xmbm+"&lxsh.sbthcd="+sbthcd+"&lxsh.xmlx="+xmlx;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/sbgcxmkxx.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('上报失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
//	var sbthcd;
	//alert(data.xmbm.substr(10,1)+"     "+xmbm.substr(10,1));
}

function thwshxz(){
	$.messager.defaults = { ok: "确认", cancel: "取消"};     
	var rows=$('#datagrid').datagrid('getSelections');
	if(rows.length==0) {
        alert("请选择要退回未审核的项目！");  
		return;
	}
	//当工可审核状态或者行业审查状态不为1时未审核状态不能退回
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt !='1' && rows[i].scshzt != '1'){
			alert("请勿勾选未审核的项目！");  
			return;
		}
	}	
   $.messager.defaults = { ok: "行业审查", cancel: "工可"};     
   $.messager.confirm("操作提示", "请选择需要退回未审核的类型！", function (data) {
   if (data) {
	   //data为真就是行业未审查
		for(var i=0;i<rows.length;i++){
			if(rows[i].shzt == '1'){
				alert("退回失败，有工可已审核的项目！");
				return;
				if(rows[i].scshzt != '1'){
					alert("退回失败，有行业审查未审核的项目！");
					return;
				}
			}		
		}
	   thwshysc();
	   }else {
		   for(var i=0;i<rows.length;i++){
			  if(rows[i].shzt != '1'){
				alert("退回失败，有工可未审核的项目！");  
                return;
			  }
	   }
	   thwshkxx();
      }
    });
 }

function thwshysc(){
	var rows=$('#datagrid').datagrid('getSelections');
	var xmbm1=rows[0].xmbm;
	xmlx=xmbm1.substr(10,1);
	for ( var i = 1; i < rows.length; i++) {
		xmbm1+=","+rows[i].xmbm;
	}
	xmbm=xmbm1;
	sbthcd=$.cookie("unit2").length+2;
	if(confirm('您确定要退回未审核吗？')){
				var data = "lxsh.xmbm="+xmbm+"&lxsh.sbthcd="+sbthcd+"&lxsh.xmlx="+xmlx;
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/qqgl/thwshkxxyjhysc.do",
					 dataType : 'json',
					 data : data,
					 success : function(msg){
						 if(msg){
							 alert("行业审查退回未审核成功！");
							 $("#datagrid").datagrid('reload');
						 }else{
							 alert("行业审查退回未审核失败！");
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				}); 
	 }
}

function thwshkxx(){
	var rows=$('#datagrid').datagrid('getSelections');
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
		var data = "lxsh.xmbm="+xmbm+"&lxsh.sbthcd="+sbthcd+"&lxsh.xmlx="+xmlx;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/thwshkxxyj.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('退回成功！');
					 $("#datagrid").datagrid('reload');
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


function ckthyy(index){
    $.messager.alert("退回原因", $("#datagrid").datagrid('getRows')[index].thyy,"warning");
	/*alert($("#datagrid").datagrid('getRows')[index].thyy);*/
}
function hyscthyy(index){
    $.messager.alert("退回原因", $("#datagrid").datagrid('getRows')[index].scthyy,"warning");
	/*alert($("#datagrid").datagrid('getRows')[index].thyy);*/
}
