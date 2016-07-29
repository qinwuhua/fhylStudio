

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
function loadGldj(id) {
	$('#' + id).combotree({
		url:'/jxzhpt/qqgl/loadGldj.do?xzqhdm='+$.cookie("dist2"),
		panelHeight:200,
		multiple:true
	});
}
function tsdq(id){
	$("#"+id).combobox({    
		url: '/jxzhpt/xmjzbb/settsdq1.do?xzqh='+$.cookie("dist"),
		valueField:'id',    
		textField:'text'   
	});
	$("#"+id).combobox('setValue','全部');
}
function tsdq1(id,value){
	$("#"+id).combotree({   
		checkbox : true,
		multiple:true,
		async:false,
	    url: '/jxzhpt/xmjzbb/settsdq.do?xzqh='+$.cookie("dist"),
	})
	if(value!=''){
		$("#"+id).combotree('setValue',value);
	}
}

function xmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
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


function xmnf2(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=20;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+10-i),value:(myDate.getFullYear()+10-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
	});
	$('#'+id).combobox("setValue",first);
}
///加法
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
function openLsjl(xmbm){
	YMLib.Var.xmbm=xmbm;
	YMLib.UI.createWindow('lsjlxx','历史记录','/jxzhpt/page/qqgl/jhsh/lsjl.jsp','lsjlxx',980,380);
}

function dclxshModule(str){
	var gydwstr="";
//	var gydw=$("#gydw").combotree("getValues");
//	if(gydw.length==0){
//		if($.cookie("unit2")=='_____36')
//			gydwstr=36;
//		else gydwstr= $.cookie("unit2");
//	}else if(gydw.length==1){
//		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
//		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
//		gydwstr=gydw[0] ;
//	}else{
//		gydwstr= gydw.join(',');
//	}
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
	var ghlxbh=$("#lxbm").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl="";
	if(str!='xj'){
		lsjl=$("#lsjl").combobox('getValue');
	}
//	var tsdq=$("#tsdq").combobox("getValues").join(",");
//	if(tsdq.substring(0,1)==',')
//		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lxmc=$("#lxmc").val();
	var xmlx1='';
	if(str=='gsdgz'){
		xmlx1=$("#xmlx").combobox("getValues").join(",");
		if(xmlx1.substring(0,1)==',')
			xmlx1=xmlx1.substring(1,xmlx1.length);
	}
	var ghlxmc=$("#ghlxmc").val();
	var ghlxbm=$("#ghlxbm").val();
	var tsdq="";
	var data="lxsh.xmlx="+str+"&lxsh.xmlx1="+xmlx1+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&sbzt="+sbzt+
			 "&lxsh.lsjl="+lsjl+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj+"&lxsh.sbthcd="+sbthcd+
			 "&lxsh.ghlxbh="+ghlxbh+"&lxsh.jsjsdj="+jsjsdj+"&lxsh.lxmc="+lxmc+"&lxsh.ghlxmc="+ghlxmc+"&lxsh.ghlxbm="+ghlxbm+"&lxsh.tsdq="+tsdq;
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
		window.location.href='/jxzhpt/qqgl/dcModule.do?'+data;
	 });
}
	
	function dckxxModule(str){
//		var gydw=$("#gydw").combotree("getValues");
//		if(gydw.length==0){
//			if($.cookie("unit2")=='_____36')
//				gydwstr=36;
//			else gydwstr= $.cookie("unit2");
//		}else if(gydw.length==1){
//			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
//			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
//			gydwstr=gydw[0] ;
//		}else{
//			gydwstr= gydw.join(',');
//		}
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
		var xmnf=$("#xmnf").combobox('getValues').join(",");
		var tsdq=$("#tsdq").combobox("getValues").join(",");
		if(tsdq.substr(0,1)==',')
			tsdq=tsdq.substr(1,tsdq.length);
		var jsdj=$("#jsdj").combobox('getValues').join(",");
		var gldj=$("#gldj").combobox('getValues').join(",");
		var lsjl="";
		if(str!='xj'){
			lsjl=$("#lsjl").combobox('getValue');
		}
		var xmlx1='';
		if(str=='gsdgz'){
			xmlx1=$("#xmlx").combobox("getValues").join(",");
			if(xmlx1.substr(0,1)==',')
				xmlx1=xmlx1.substr(1,xmlx1.length);
		}
		var lxmc=$("#lxmc").val();	
		var ghlxbm=$("#ghlxbm").val();
		var ghlxmc=$("#ghlxmc").val();
		var ghlxbh=$("#lxbm").val();
		if(str=="gsdgz"){
			var jsjsdj=$("#jsjsdj").combobox("getValues").join(",");
				if(jsjsdj.substr(0,1)==',')
					jsjsdj=jsjsdj.substr(1,jsjsdj.length);
		
			var data="lxsh.xmlx="+str+"&lxsh.xmlx1="+xmlx1+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.lsjl="+lsjl+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj+
				"&lxsh.jsjsdj="+jsjsdj+"&lxsh.lxmc="+lxmc+"&lxsh.ghlxbm="+ghlxbm+"&lxsh.ghlxmc="+ghlxmc+"&lxsh.ghlxbh="+ghlxbh;
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr="",xzqh:xzqhstr},function(){
				window.location.href='/jxzhpt/qqgl/dckxxModule.do?'+data;
			 });

		}
		if(str=="sjgz"){
			var jsjsdj=$("#jsjsdj").combobox("getValues").join(",");
			if(jsjsdj.substr(0,1)==',')
				jsjsdj=jsjsdj.substr(1,jsjsdj.length);
	
			var data="lxsh.xmlx="+str+"&lxsh.xmlx1="+xmlx1+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.lsjl="+lsjl+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj+
			"&lxsh.jsjsdj="+jsjsdj+"&lxsh.lxmc="+lxmc+"&lxsh.ghlxbm="+ghlxbm+"&lxsh.ghlxmc="+ghlxmc+"&lxsh.ghlxbh="+ghlxbh;
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr="",xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/qqgl/dckxxModule.do?'+data;
		 });

		}
		if(str=="lmgz"){
			var jsjsdj=$("#jsjsdj").combobox("getValues").join(",");
			if(jsjsdj.substr(0,1)==',')
				jsjsdj=jsjsdj.substr(1,jsjsdj.length);
	
			var data="lxsh.xmlx="+str+"&lxsh.xmlx1="+xmlx1+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.lsjl="+lsjl+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj+
			"&lxsh.jsjsdj="+jsjsdj+"&lxsh.lxmc="+lxmc+"&lxsh.ghlxbm="+ghlxbm+"&lxsh.ghlxmc="+ghlxmc+"&lxsh.ghlxbh="+ghlxbh;
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr="",xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/qqgl/dckxxModule.do?'+data;
		 });
		}
		if(str=="xj"){
			var jsjsdj=$("#jsjsdj").combobox("getValues").join(",");
			if(jsjsdj.substr(0,1)==',')
				jsjsdj=jsjsdj.substr(1,jsjsdj.length);
	
			var data="lxsh.xmlx="+str+"&lxsh.xmlx1="+xmlx1+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.lsjl="+lsjl+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj+
			"&lxsh.jsjsdj="+jsjsdj+"&lxsh.lxmc="+lxmc+"&lxsh.ghlxbm="+ghlxbm+"&lxsh.ghlxmc="+ghlxmc+"&lxsh.ghlxbh="+ghlxbh;
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr="",xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/qqgl/dckxxModule.do?'+data;
		 });
		}
		if(str=="sh"){
			var data="lxsh.xmlx="+str+"&lxsh.xmlx1="+xmlx1+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.lsjl="+lsjl+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj+
			"&lxsh.lxmc="+lxmc+"&lxsh.ghlxbm="+ghlxbm+"&lxsh.ghlxmc="+ghlxmc+"&lxsh.ghlxbh="+ghlxbh;
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr="",xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/qqgl/dckxxModule.do?'+data;
		 });
		}
}
	
function dcMoBan(str){
	var lxstr="lxsh_"+str;
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+lxstr;
}