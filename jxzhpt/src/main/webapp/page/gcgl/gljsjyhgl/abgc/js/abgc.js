var obj=new Object();
var obj1=new Object();
function jgys(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','交工验收信息','jgys.jsp','wqxx',650,420);
	}
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationXm1(data.lxbm,data.qdzh,data.zdzh);
}
function wqxiangxi(index,xmlx){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	if(xmlx=='af'){
		YMLib.Var.jhbm=data.id;
		YMLib.UI.createWindow('abgc_xx','安防工程',"/jxzhpt/page/jhgl/jhkxx/afgc1.jsp",'abgc_xx',1000,500);
	}else{
		YMLib.Var.jhbm=data.id;
		YMLib.UI.createWindow('abgc_xx','安保工程项目计划详情',"/jxzhpt/page/jhgl/jhkxx/abgc1.jsp",'abgc_xx',1000,500);

	}
		//YMLib.UI.createWindow('wqxx','安保工程开工详情','abgcxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}

function kaigong(index,xmlx){
	if(xmlx=='af'){
		if(confirm("确认开工吗？")){
			var data=$("#datagrid").datagrid('getRows')[index];
			obj1=data;
			YMLib.UI.createWindow('wqxx','安防工程开工','afkg.jsp','wqxx',650,330);
		}
	}else{
		if(confirm("确认开工吗？")){
			var data=$("#datagrid").datagrid('getRows')[index];
			obj1=data;
			YMLib.UI.createWindow('wqxx','安保工程开工','wqgzkg.jsp','wqxx',650,330);
		}
	}
	
}
function ykaigong(index,xmlx){
	if(xmlx=='af'){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','安防工程开工详情','afkg1.jsp','wqxx',650,330);
	}else{
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','安保工程开工详情','wqgzkg1.jsp','wqxx',650,330);
	}
		
}
function wangong(index,xmlx){
	if(xmlx=='af'){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','工程完工','afwg.jsp','wqxx',500,300);
	}else{
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','工程完工','wqgzwg.jsp','wqxx',500,300);
	}	
}
		
	function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','工程未完工','wqgzwwg.jsp','wqxx',400,220);
	}	

function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','月报信息','abgcyb.jsp','wqxx1',1059,467);
	//window.open("wqgzyb.jsp");
}
function ybsb__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','安保工程月报信息','abgcyb__ck.jsp','wqxx1',1059,467);
	//window.open("wqgzyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxx','月报添加','abgcybtj.jsp','wqxx',650,420);
	//window.open("wqgzybtj.jsp");
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','月报详情','abgcybxx.jsp','wqxx',700,400);
	//window.open("wqgzybxx.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','月报编辑','abgcybxg.jsp','wqxx',650,400);
	//window.open("wqgzybxg.jsp");
}
function Delyb(index){
	var data12=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglabgc.id="+data12.id+"&gcglabgc.jhid="+data12.jhid;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteAbgcYb.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					shezhi();
					$("#ybgrid").datagrid('reload');
				}else{
					alert('删除失败！');
				}
			}
		});	
	}
}
//
var jhid=10;
function tjabgcyb(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	//var sbyf = y+"-"+m;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	if(yhjb.length==11){
		yhtype='县级';
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
	}
	if($("#tj_wc_btz").val()==''){
		alert("请填入本月完成部投资");
		return;
	}
	if($("#tj_wc_stz").val()==''){
		alert("请填入本月完成省投资");
		return;
	}
	if($("#tj_wc_qttz").val()==''){
		alert("请填入本月完成其他投资");
		return;
	}
	if($("#tj_zjdw_qttz").val()==''){
		alert("请填入本月到位其他投资");
		return;
	}
	if($("#tj_bywc_c").val()==''){
		alert("请填入本月完成处");
		return;
	}
	if($("#tj_bywc_gl").val()==''){
		alert("请填入本月完成公里");
		return;
	}
	var zwczj=parent.$("#zwczj").html(); 
	var btz=$("#tj_wc_btz").val();
	var stz=$("#tj_wc_stz").val();
	var qttz=$("#tj_wc_qttz").val();
	var zbfzj=parent.$("#zbfzj").html(); 
	var zbf=parseFloat(zbfzj);
	if(stz!='0'){
		alert("安保工程项目没有省投资");
		return;
	}
	var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(stz)+parseFloat(qttz);
	var zbtz=parseFloat(parent.$("#zwcbtz").html())+parseFloat(btz);
	if(parent.pfbtz<zbtz){
		if(confirm("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗")){
		}else
		//alert("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗");
		return;
	}
	if(parent.pfztz<zwc){
		if(confirm("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗")){
		}else
		//alert("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗");
		return;
	}

	var data = "gcglabgc.wc_btz="+$("#tj_wc_btz").val()+"&gcglabgc.wc_stz="+$("#tj_wc_stz").val()+"&gcglabgc.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglabgc.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglabgc.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglabgc.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglabgc.bywc_c="+0+"&gcglabgc.bywc_gl="+$("#tj_bywc_gl").val()+"&gcglabgc.kgdl="+0+"&gcglabgc.qksm="+$("#tj_qksm").val()+"&gcglabgc.wcqk="+$("#tj_wcqk").text()
	+"&gcglabgc.sbsj="+sbsj+"&gcglabgc.sbyf="+$("#tj_sbyf").datebox('getValue')+"&gcglabgc.jhid="+parent.parent.obj1.jhid+"&yhtype="+yhtype;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertAbgcYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('该月月报可能已存在，保存失败！');
			}
		}
	});	
}
//
function xgabgcyb(){
	if($("#xg_wc_btz").val()==''){
		alert("请填入本月完成部投资");
		return;
	}
	if($("#xg_wc_stz").val()==''){
		alert("请填入本月完成省投资");
		return;
	}
	if($("#xg_wc_qttz").val()==''){
		alert("请填入本月完成其他投资");
		return;
	}
	if($("#xg_zjdw_qttz").val()==''){
		alert("请填入本月到位其他投资");
		return;
	}
	if($("#xg_bywc_c").val()==''){
		alert("请填入本月完成处");
		return;
	}
	if($("#xg_bywc_gl").val()==''){
		alert("请填入本月完成公里");
		return;
	}
	var zwczj=parent.$("#zwczj").html(); 
	var btz=$("#xg_wc_btz").val();
	var stz=$("#xg_wc_stz").val();
	if(stz!='0'){
		alert("安保工程项目没有省投资");
		return;
	}
	var qttz=$("#xg_wc_qttz").val();
	var zbfzj=parent.$("#zbfzj").html(); 
	var zbf=parseFloat(zbfzj);
	var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(stz)+parseFloat(qttz)-parseFloat(parent.obj.wc_btz)-parseFloat(parent.obj.wc_stz)-parseFloat(parent.obj.wc_qttz);
	var zbtz=parseFloat(parent.$("#zwcbtz").html())-parseFloat(parent.obj.wc_btz)+parseFloat(btz);
	if(parent.pfbtz<zbtz){
		if(confirm("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗")){
		}else
		//alert("完成总部投资不能大于计划部投资"+parent.pfbtz+"万元，确认保存吗");
		return;
	}
	if(parent.pfztz<zwc){
		if(confirm("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗")){
		}else
		//alert("总完成资金不能大于总投资"+parent.pfztz+"万元，确认保存吗");
		return;
	}
	var data = "gcglabgc.wc_btz="+$("#xg_wc_btz").val()+"&gcglabgc.wc_stz="+$("#xg_wc_stz").val()+"&gcglabgc.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglabgc.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglabgc.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglabgc.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglabgc.bywc_c="+0+"&gcglabgc.bywc_gl="+$("#xg_bywc_gl").val()+"&gcglabgc.kgdl="+0+"&gcglabgc.qksm="+$("#xg_qksm").val()+"&gcglabgc.wcqk="+$("#xg_wcqk").text()
	+"&gcglabgc.id="+parent.obj.id+"&gcglabgc.jhid="+parent.obj.jhid+"&gcglabgc.sbyf="+$("#xg_sbyf").datebox('getValue');
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateAbgcYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('该月月报可能已存在，保存失败！');
			}
		}
	});	
}

//开工
function tjwqgzkg(xmlx){
	if($("#tj_sgdw").val()==''){
		alert("请您输入施工单位");
		return;
	}
	if($("#tj_jldw").val()==''){
		alert("请您输入监理单位");
		return;
	}
	if($("#tj_jsdw").val()==''){
		alert("请您输入建设单位");
		return;
	}
	if($("#tj_htje").val()==''){
		alert("请您输入合同金额");
		return;
	}
	if($("#tj_gys").val()==''){
		alert("请您输入概预算");
		return;
	}
	var data="gcglabgc.xdsj="+$("#tj_xdsj").datebox('getValue')+"&gcglabgc.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglabgc.yjwgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglabgc.sgdw="+$("#tj_sgdw").val()+"&gcglabgc.jldw="+$("#tj_jldw").val()+"&gcglabgc.jsdw="+$("#tj_jsdw").val()+"&gcglabgc.xdwh="+$("#tj_xdwh").val()
	+"&gcglabgc.htje="+$("#tj_htje").val()+"&gcglabgc.gys="+$("#tj_gys").val()+"&gcglabgc.jhid="+parent.obj1.jhid+"&gcglabgc.xmlx="+xmlx;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertAbgckg.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#datagrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
//完工
function tjwqgzwg(){
	if(!confirm("确认完工吗？")){
		return;
	}
	var data="gcglabgc.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglabgc.jhid="+parent.obj1.jhid+"&gcglabgc.xmlx=af";
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertAbgcwg.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#datagrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
//未完工
function tjwqgzwwg(){
	if($("#tj_wjgyy").val()==''){
		alert("请您填写未完工原因");
		return;
	}
	var data="gcglabgc.wjgyy="+$("#tj_wjgyy").val()+"&gcglabgc.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertAbgcwwg.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#datagrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
function showAll(){
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
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
	var jgzt='0';
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var yhjb=$.cookie("unit2");
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	var ybzt=$("#ybzt").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectAbgcjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:ybzt,
	    	xmnf:xmnf,
	    	sfsj:sfsj,
	    	xzqh:xzqhstr,
	    	'gcglabgc.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglabgc.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglabgc.tsdq':$("#ddlTSDQ").combobox('getText')
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		//return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+index+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wangong('+index+')">完工</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wwangong('+index+')">未完工</a>  ';
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+index+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wangong('+index+')">完工</a>  ';
	        	}else
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="kaigong('+index+')">未开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   '+'完工   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:100,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'xdzj',title:'已下达计划(万元)',width:120,align:'center'},
	        {field:'bfzj',title:'已拨付资金(万元)',width:120,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}
//af
function showafAll(){
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
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
	var jgzt='0';
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var yhjb=$.cookie("unit2");
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	var ybzt=$("#ybzt").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectAbgcjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:ybzt,
	    	xmnf:xmnf,
	    	sfsj:sfsj,
	    	xzqh:xzqhstr,
	    	'gcglabgc.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglabgc.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglabgc.xmlx':'af',
	    	'gcglabgc.tsdq':$("#ddlTSDQ").combobox('getText')
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	var af='af';
	        	if(row.kgzt=='1'){
	        		//return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+index+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wangong('+index+')">完工</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wwangong('+index+')">未完工</a>  ';
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+"'"+index+"',"+"'"+af+"'"+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+"'"+index+"',"+"'"+af+"'"+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+"'"+index+"',"+"'"+af+"'"+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wangong('+"'"+index+"',"+"'"+af+"'"+')">完工</a>  ';
	        	}else
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+"'"+index+"',"+"'"+af+"'"+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="kaigong('+"'"+index+"',"+"'"+af+"'"+')">未开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+"'"+index+"',"+"'"+af+"'"+')">月报</a>   '+'完工   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:100,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'xdzj',title:'已下达计划(万元)',width:120,align:'center'},
	        {field:'bfzj',title:'已拨付资金(万元)',width:120,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}

function showAll__ck(){
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
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

	var jgzt='0';
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var yhjb=$.cookie("unit2");
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	var ybzt=$("#ybzt").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectAbgcjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:ybzt,
	    	xmnf:xmnf,
	    	sfsj:sfsj
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		//return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+index+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wangong('+index+')">完工</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wwangong('+index+')">未完工</a>  ';
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb__ck('+index+')">月报</a>   ';
	        	}else
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb__ck('+index+')">月报</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:100,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}

function showYBlist(){
	var jhid=parent.obj1.jhid;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectAbgcYbByJhid.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	jhid: jhid,
	    	yhtype:yhtype,
	    	sfsj:sfsj
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:250,align:'center',rowspan:2,formatter:function(value,row,index){
	              		if(yhtype=='县级'){
	              			if(row.shzt=='未审核'&&row.sfsj==11)
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除</a>   '+'<a href="#" onclick="sbsjyb('+index+')">未上报    </a>'+'未审核    ';
	              			if(row.shzt=='未审核'&&row.sfsj!=11)
		    			    return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑    '+'删除    '+'已上报    '+'已审核    ';

	              		}
	              		if(yhtype=='市级'){
	              			if(row.shzt=='未审核'&&row.sfsj==9)
	    			        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除    </a>'+'<a href="#" onclick="sbsjyb('+index+')">未上报    </a>'+'<a href="#" onclick="thsjyb('+index+')">退回    </a>'+'未审核    ';
	              			if(row.shzt=='未审核'&&row.sfsj!=9)
	    	              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'退回    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              				return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑    '+'删除    '+'已上报    '+'退回    '+'已审核    ';
	              		}
	              		if(yhtype=='省级'){
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   ';
	              		}
	              	}},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
//			        {field:'bywc_c',title:'本月完成（处）',width:100,align:'center',rowspan:2},
			        {field:'bywc_gl',title:'本月完成（公里）',width:100,align:'center',rowspan:2},
//			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:100,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}

function showYBlist__ck(){
	var jhid=parent.obj1.jhid;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		yhtype='省级';
		sfsj=7;
	}
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectAbgcYbByJhid.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	jhid: jhid,
	    	yhtype:yhtype,
	    	sfsj:sfsj
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:250,align:'center',rowspan:2,formatter:function(value,row,index){	              		
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
	              	}},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
//			        {field:'bywc_c',title:'本月完成（处）',width:100,align:'center',rowspan:2},
			        {field:'bywc_gl',title:'本月完成（公里）',width:100,align:'center',rowspan:2},
//			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:100,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}

	function uploadFile(str){
		//alert(str);
		var title='';
		if(str=='sgxkwj')
			title='请选择施工许可文件';
		if(str=='jgtcwj')
			title='请选择交工通车文件';
		if(str=='jgyswj')
			title='请选择完工验收文件';
		var weatherDlg = new J.dialog( {
			id : 'id1',
			title : title,
			page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadAbgcFile.do"+'&flag='+'gljsjyhgl%2fabgc%2fabgcxx'+'&type='+str+'&jhid='+parent.obj1.jhid,
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

//	function downFile(str){
//		if($("#xz_"+str).text()=='下载附件'){
//			parent.window.location.href="../../../../gcgl/downAbgcFile.do?type="+str+"&jhid="+parent.obj1.jhid;
//		}
//		else return;
//	}
	function deleteFile(str){
		if($("#xz_"+str).text()=='暂无附件'){
			return;
		}
		if(confirm("确认删除吗？")){
		var data="jhid="+parent.obj1.jhid+"&type="+str;
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteAbgcFile.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					location.reload();
				}else{
					alert('删除失败！');
				}
			}
		});	
		}
	}
	function jiazai(ooo){
	//	alert(ooo);
		var data=ooo;

		$.ajax({
			type:'post',
			url:'../../../../gcgl/selectAbgcjhFile.do',
			data:data,
			dataType:'json',
			async:false,
			success:function(msg){
					if(msg.sgxkwj!=''){
						$("#xz_sgxkwj").text(msg.sgxkwj);
						$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
						$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downAbgcFile.do?type=sgxkwj'+"&jhid="+parent.obj1.jhid);
					}
					if(msg.jgtcwj!=''){
						$("#xz_jgtcwj").text(msg.jgtcwj);
						$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
						$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downAbgcFile.do?type=jgtcwj'+"&jhid="+parent.obj1.jhid);
					}
					if(msg.jgyswj!=''){
						$("#xz_jgyswj").text(msg.jgyswj);
						$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
						$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downAbgcFile.do?type=jgyswj'+"&jhid="+parent.obj1.jhid);
					}
				}
		});	
}
	function sbsjyb(index){
		var yhjb=$.cookie("unit2");
		var data1=$("#ybgrid").datagrid('getRows')[index];
		var data='';
		if(yhjb.length==11){
			data="gcglabgc.id="+data1.id+"&gcglabgc.sfsj=9"+"&gcglabgc.yhtype=11"+"&gcglabgc.jhid="+data1.jhid;
		}
		if(yhjb.length==9||yhjb.length==8||yhjb.length==2){
			data="gcglabgc.id="+data1.id+"&gcglabgc.sfsj=7"+"&gcglabgc.yhtype=9"+"&gcglabgc.jhid="+data1.jhid;
		}
		if(parent.obj1.tsdq!=null)
		if(parent.obj1.tsdq.indexOf('省直管试点县')!=-1){
			data="gcglabgc.id="+data1.id+"&gcglabgc.sfsj=7"+"&gcglabgc.yhtype=9"+"&gcglabgc.jhid="+data1.jhid;
		}
		if(confirm("确认上报吗？")){
			var mydate=new Date();
			var nf1=data1.sbyf.substr(0,4);
			var yf1=data1.sbyf.substr(5,data1.sbyf.length);
			cxsfcgsjd(data1.id,mydate.getFullYear(),mydate.getMonth()+1,mydate.getDate(),'gcgl_abgc',nf1,yf1);
			$.ajax({
				type:'post',
				url:'../../../../gcgl/sbAbgcYb.do',
				data:data,
				dataType:'json',
				success:function(msg){
					if(Boolean(msg)){
						alert('上报成功！');
						$("#ybgrid").datagrid('reload');
					}else{
						alert('上报失败！');
					}
				}
			});	
		}	
	}
	function thsjyb(index){
		var data1=$("#ybgrid").datagrid('getRows')[index];
		var data="gcglabgc.id="+data1.id+"&gcglabgc.sfsj=11"+"&gcglabgc.yhtype=9"+"&gcglabgc.jhid="+data1.jhid;
		if(confirm("确认退回吗？")){
			$.ajax({
				type:'post',
				url:'../../../../gcgl/sbAbgcYb.do',
				data:data,
				dataType:'json',
				success:function(msg){
					if(Boolean(msg)){
						alert('退回成功！');
						$("#ybgrid").datagrid('reload');
					}else{
						alert('退回失败！');
					}
				}
			});	
		}	
	}
	var pfztz=0;
	var pfbtz=0;
	var pfstz=0;
	var zwcbtz=0;
	function shezhi(){
		pfztz=parent.obj1.pfztz;
		pfbtz=parent.obj1.jhsybzje;
		$("#pfztz").text(pfztz);
		$("#pfbtz").text(pfbtz);
		var data="gcglwqgz.jhid="+parent.obj1.jhid+"&gcglwqgz.nf="+new Date().getFullYear()+"&gcglwqgz.id="+parent.obj1.id+"&gcglwqgz.tablename=gcgl_abgc";
		$.ajax({
			type:'post',
			url:'../../../../gcgl/selectWqgzbzzj.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(msg.zbfzj=='')
					$("#zbfzj").text('0');
				else
					$("#zbfzj").text(msg.zbfzj);
				if(msg.nbfzj=='')
					$("#nbfzj").text('0');
				else
					$("#nbfzj").text(msg.nbfzj);
				if(msg.nxdzj=='')
					$("#nxdzj").text('0');
				else
					$("#nxdzj").text(msg.nxdzj);
				if(msg.zxdzj=='')
					$("#jhxdzj").text('0');
				else
					$("#jhxdzj").text(msg.zxdzj);
				if(msg.zwczj=='')
					$("#zwczj").text('0');
				else
					$("#zwczj").text(msg.zwczj);
				if(msg.zwcbtz=='')
					$("#zwcbtz").text('0');
				else
					$("#zwcbtz").text(msg.zwcbtz);
			}
		});	
	}