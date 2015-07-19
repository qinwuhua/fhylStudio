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
			$('#xjsdj').html(msg.xjsdj);
			var spjsdj = $("span[id='jsjsdj']");
			if(spjsdj.length>0){
				$("#jsjsdj").html(msg.xjsdj);
			}
		}
	});
}
function tsdq(id){
			$("#"+id).combobox({    
			    url: '/jxzhpt/xmjzbb/settsdq1.do?xzqh='+$.cookie("dist"),
			    valueField:'id',    
			    textField:'text'   
			})
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
		years.push({text:(myDate.getFullYear()-i),value:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
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
	    textField:'text'
	});
	$('#'+id).combobox("setValue",first);
}
//浮点数减法
function accSub(arg1,arg2){
	　　 var r1,r2,m,n;
	　　 try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
	　　 try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
	　　 m=Math.pow(10,Math.max(r1,r2));
	　　 //last modify by deeka
	　　 //动态控制精度长度
	　　 n=(r1>=r2)?r1:r2;
	　　 return ((arg1*m-arg2*m)/m).toFixed(n);
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
	var data="lxsh.xmlx="+str+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.sbzt="+sbzt+"&lxsh.lsjl="+lsjl+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj;
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
		window.location.href='/jxzhpt/qqgl/dcModule.do?'+data;
	 });
}
	
	function dckxxModule(str){
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
		var xmnf=$("#xmnf").combobox('getText');
		var tsdq=$("#tsdq").combobox('getText');
		if(tsdq=='全部'){
			tsdq="";
		}
		var jsdj=$("#jsdj").combobox('getValue');
		var gldj=$("#gldj").combobox('getValue');
		var lsjl="";
		if(str!='xj'){
			lsjl=$("#lsjl").combobox('getValue');
		}
		var data="lxsh.xmlx="+str+"&lxsh.xmmc="+xmmc+"&lxsh.xmnf="+xmnf+"&lxsh.lsjl="+lsjl+"&lxsh.tsdq="+tsdq+"&lxsh.jsdj="+jsdj+"&lxsh.gldj="+gldj;
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/qqgl/dckxxModule.do?'+data;
		 });
}
	
function dcMoBan(str){
	var lxstr="lxsh_"+str;
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+lxstr;
}