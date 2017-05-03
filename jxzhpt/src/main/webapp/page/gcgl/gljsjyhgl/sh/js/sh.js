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
	   flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'||flag=='01011401010101'||
	   flag=='01011401010102'||flag=='010114010102'||flag=='010114010105'||flag=='01011402010101'||
	   flag=='01011402010102'||flag=='010114020102'||flag=='010114020105'||flag=='01011403010101'||
	   flag=='01011403010102'||flag=='010114030102'||flag=='010114030105'||
	   flag=='010114040101'||flag=='010114040102'||flag=='010114040103'||flag=='010114040104'||
	   flag=='010114040105'||flag=='010114040106'||flag=='010114040107'||
	   flag=='01011501010101'||flag=='01011501010102'||flag=='010115010102'||flag=='010115010105'
	){
		if(flag=='01011302010101'||flag=='01011302010102'||flag=='010113020102'||flag=='010113020105'){
			$("#astext").html('计划上报');
		}
		if(flag=='01011303010101'||flag=='01011303010102'||flag=='010113030102'||flag=='010113030105'){
			$("#astext").html('计划审核');
		}
		/*if(flag=='01011304010101'||flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'){
			$("#astext").html('计划下达');
		}*/
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
		flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'||flag=='01011401020101'||
		flag=='01011401020102'||flag=='010114010202'||flag=='010114010206'||flag=='01011402020101'||
		flag=='01011402020102'||flag=='010114020202'||flag=='010114020206'||flag=='01011403020101'||
		flag=='01011403020102'||flag=='010114030202'||flag=='010114030206'||
		flag=='010114040201'||flag=='010114040202'||flag=='010114040203'||flag=='010114040204'||
		flag=='010114040205'||flag=='010114040206'||flag=='010114040207'||flag=='01011501020101'||
		flag=='01011501020102'||flag=='010115010202'||flag=='010115010206'
	){
		if(flag=='01011302020101'||flag=='01011302020102'||flag=='010113020202'||flag=='010113020206'){
			$("#astext").html('计划上报');
		}
		if(flag=='01011303020101'||flag=='01011303020102'||flag=='010113030202'||flag=='010113030206'){
			$("#astext").html('计划审核');
		}
		/*if(flag=='01011304020101'||flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'){
			$("#astext").html('计划下达');
		}*/
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


var obj=new Object();
var obj1=new Object();
function jgys(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','交工验收信息','jgys.jsp','wqxx',650,420);
	}
function sfqxkg(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var sfqxkg='是';
	if(data1.SFQXKG=='是')
		sfqxkg='否';
	if(data1.SFQXKG=='否')
		sfqxkg='是';
	var data="flag="+"sh"+"&gcglsh.sfqxkg="+sfqxkg+"&gcglsh.id="+data1.XMBM;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updataSFQX.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				$("#datagrid").datagrid('reload');
			}else{
				alert('失败！');
			}
		}
	});	
}
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/selectlxbyxmid.do',
		data:"lxsh.xmbm="+data.XMBM+"&lxsh.jdbs=2",
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
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.Var.jhbm=data.id;
//	YMLib.UI.createWindow('shuih_xx','灾毁重建项目',"/jxzhpt/page/jhgl/jhkxx/shxm.jsp",'shuih_xx',1000,500);
	YMLib.UI.createWindow('wqxx','灾毁重建工程项目详情','shxx.jsp','wqxx',940,450);
	//window.open("shxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function kaigong(index){
	if(confirm("确认开工吗？")){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','灾毁重建项目开工','wqgzkg.jsp','wqxx',700,330);
	}
}
function ykaigong(index){	
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','灾毁重建项目开工','wqgzkg1.jsp','wqxx',700,330);
}
	function wangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','灾毁重建项目完工','wqgzwg.jsp','wqxx',500,300);
		}	
	function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','灾毁重建项目未完工','wqgzwwg.jsp','wqxx',400,220);
	}	
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','项目月报信息','/jxzhpt/page/gcgl/gljsjyhgl/gcjdyb.jsp','wqxx1',950,467);
	//window.open("shyb.jsp");
}
function ybsb__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','灾毁重建项目月报上报','shyb__ck.jsp','wqxx1',950,467);
	//window.open("shyb.jsp");
}

function AddInfo(){
	YMLib.UI.createWindow('wqxx','灾毁重建项目月报添加','shybtj.jsp','wqxx',780,340);
	//window.open("shybtj.jsp");
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','灾毁重建项目月报详情','shybxx.jsp','wqxx',900,340);
	//window.open("shybxx.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','灾毁重建项目月报编辑','shybxg.jsp','wqxx',780,340);
	//window.open("shybxg.jsp");
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglsh.id="+data1.id+"&gcglsh.jhid="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteshYb.do',
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
//月报添加
var jhid=10;
function tjshyb(){
	//alert("xx");
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var sbyf = y+"-"+m;
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
	if($("#tj_sbyf").datebox('getValue')==''){
		alert("请选择上报月份");
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
	if($("#tj_bywcdc").val()==''){
		alert("请填入本月完成垫层");
		return;
	}
	if($("#tj_bywcjc").val()==''){
		alert("请填入本月完成基层");
		return;
	}
	if($("#tj_bywcmc").val()==''){
		alert("请填入本月完成面层");
		return;
	}
	var zwczj=parent.$("#zwczj").html(); 
	var btz=$("#tj_wc_btz").val();
	var wcs=$("#wc_sz").val();
	var wcy=$("#wc_yhdk").val();
	var wcg=$("#wc_gz").val();
	var qttz=$("#tj_wc_qttz").val();
	var zbfzj=parent.$("#zbfzj").html(); 
	var zbf=parseFloat(zbfzj);
	var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(qttz)+parseFloat(wcs)+parseFloat(wcy)+parseFloat(wcg);
	var zbtz=parseFloat(parent.$("#zwcbtz").html());
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
	var data = "gcglsh.wc_btz="+$("#tj_wc_btz").val()+"&gcglsh.wc_stz="+"&gcglsh.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglsh.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglsh.zjdw_stz="+"&gcglsh.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglsh.dwyhdk="+$("#zjdw_yhdk").val()+"&gcglsh.dwgz="+$("#zjdw_gz").val()+"&gcglsh.dwsz="+$("#zjdw_sz").val()
	+"&gcglsh.yhdk="+$("#wc_yhdk").val()+"&gcglsh.gz="+$("#wc_gz").val()+"&gcglsh.sz="+$("#wc_sz").val()
	+"&gcglsh.bywcdc="+$("#tj_bywcdc").val()+"&gcglsh.bywcjc="+$("#tj_bywcjc").val()+"&gcglsh.bywcmc="+$("#tj_bywcmc").val()+"&gcglsh.kgdl="+$("#tj_kgdl").val()
	+"&gcglsh.qksm="+$("#tj_qksm").val()+"&gcglsh.wcqk="+$("#tj_wcqk").text()+"&gcglsh.ssdctc="+$("#ssdctc").val()+"&gcglsh.bndsslc="+$("#bndsslc").val()+"&gcglsh.wkglc="+$("#wkglc").val()
	+"&gcglsh.yiji="+$("#yiji").val()+"&gcglsh.erji="+$("#erji").val()+"&gcglsh.sanji="+$("#sanji").val()+"&gcglsh.siji="+$("#siji").val()
	+"&gcglsh.snlmwcqk="+$("#snlmwcqk").val()+"&gcglsh.lqlmwcqk="+$("#lqlmwcqk").val()+"&gcglsh.tbman="+$("#tbman").val()
	+"&gcglsh.sbsj="+sbsj+"&gcglsh.sbyf="+$("#tj_sbyf").datebox('getValue')+"&gcglsh.jhid="+parent.parent.obj1.XMBM+"&yhtype="+yhtype;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertshYb.do',
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
//修改
function xgshyb(){
	//alert("xx");
	if($("#xg_sbyf").datebox('getValue')==''){
		alert("请选择上报月份");
		return;
	}
	if($("#xg_wc_btz").val()==''){
		alert("请填入本月完成部投资");
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
	if($("#xg_bywcdc").val()==''){
		alert("请填入本月完成垫层");
		return;
	}
	if($("#xg_bywcjc").val()==''){
		alert("请填入本月完成基层");
		return;
	}
	if($("#xg_bywcmc").val()==''){
		alert("请填入本月完成面层");
		return;
	}
	var zwczj=parent.$("#zwczj").html(); 
	var btz=$("#xg_wc_btz").val();
	var qttz=$("#xg_wc_qttz").val();
	var zbfzj=parent.$("#zbfzj").html(); 
	var zbf=parseFloat(zbfzj);
	var zwc=parseFloat(zwczj)+parseFloat(btz)+parseFloat(qttz)-parseFloat(parent.obj.wc_btz)-parseFloat(parent.obj.wc_qttz);
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
	var data = "gcglsh.wc_btz="+$("#xg_wc_btz").val()+"&gcglsh.wc_stz="+"&gcglsh.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglsh.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglsh.zjdw_stz="+"&gcglsh.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglsh.dwyhdk="+$("#zjdw_yhdk").val()+"&gcglsh.dwgz="+$("#zjdw_gz").val()+"&gcglsh.dwsz="+$("#zjdw_sz").val()
	+"&gcglsh.yhdk="+$("#wc_yhdk").val()+"&gcglsh.gz="+$("#wc_gz").val()+"&gcglsh.sz="+$("#wc_sz").val()
	+"&gcglsh.bywcdc="+$("#xg_bywcdc").val()+"&gcglsh.bywcjc="+$("#xg_bywcjc").val()+"&gcglsh.bywcmc="+$("#xg_bywcmc").val()+"&gcglsh.kgdl="+$("#xg_kgdl").val()
	+"&gcglsh.qksm="+$("#xg_qksm").val()+"&gcglsh.wcqk="+$("#xg_wcqk").text()+"&gcglsh.ssdctc="+$("#ssdctc").val()+"&gcglsh.bndsslc="+$("#bndsslc").val()+"&gcglsh.wkglc="+$("#wkglc").val()
	+"&gcglgcgzgj.yiji="+$("#yiji").val()+"&gcglgcgzgj.erji="+$("#erji").val()+"&gcglgcgzgj.sanji="+$("#sanji").val()+"&gcglgcgzgj.siji="+$("#siji").val()
	+"&gcglgcgzgj.snlmwcqk="+$("#snlmwcqk").val()+"&gcglgcgzgj.lqlmwcqk="+$("#lqlmwcqk").val()+"&gcglgcgzgj.tbman="+$("#tbman").val()
	+"&gcglsh.jhid="+parent.obj.jhid+"&gcglsh.id="+parent.obj.id+"&gcglsh.sbyf="+$("#xg_sbyf").datebox('getValue');
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateshYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
//开工
function tjwqgzkg(){
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
	var data="gcglsh.xdsj="+$("#tj_xdsj").html()+"&gcglsh.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglsh.yjwgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglsh.sgdw="+$("#tj_sgdw").val()+"&gcglsh.jldw="+$("#tj_jldw").val()+"&gcglsh.jsdw="+$("#tj_jsdw").val()+"&gcglsh.sfgk="+$("#sfgk").val()
	+"&gcglsh.htje="+$("#tj_htje").val()+"&gcglsh.gsztz="+$("#tj_gys").val()+"&gcglsh.jhid="+parent.obj1.XMBM;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertShkg.do',
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
	var data="gcglsh.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglsh.jhid="+parent.obj1.XMBM;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertShwg.do',
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
	var data="gcglsh.wjgyy="+$("#tj_wjgyy").val()+"&gcglsh.jhid="+parent.obj1.XMBM;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertShwwg.do',
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
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var ybzt=$("#ybzt").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectShjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: xzqhstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf,
	    	'gcglsh.sbzt':'jz.sbzt',
	    	'gcglsh.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglsh.lxbm':$("#lxbm").val(),
	    	'gcglsh.xmmc':$("#xmmc").val(),
	    	'gcglsh.lxmc':$("#lxmc").val(),
	    	'gcglsh.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglsh.tsdq':$("#ddlTSDQ").combobox('getText')
		},
	    columns:[[
			{field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
  	        	if(row.KGZT=='1'){
  	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+index+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wangong('+index+')">完工</a>  ';
  	        	}else
  	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="kaigong('+index+')">未开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   '+'完工   ';
  	        }},
  	      {field:'c1',title:'是否全线开工',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="sfqxkg('+index+')">'+row.SFQXKG+'</a>    ';
	        }},
	        {field:'XMBM',title:'项目编码',width:100,align:'center'},
	        {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
  	        	if(row.SL!=1)
  	        		return '<font color="red">'+row.XMMC+'</font>';
  	        	else return  row.XMMC;	
  	        }},
			{field:'XZQH',title:'行政区划',width:100,align:'center'},
//			{field:'GYDW',title:'管养单位',width:100,align:'center'},
			{field : 'LXBM1',title : '路线编码',width : 120,align : 'center'},
			{field : 'QDZH1',title : '起点桩号',width : 100,align : 'center'},
			{field : 'ZDZH1',title : '止点桩号',width : 100,align : 'center'},
			{field : 'GHLXBM',title : '规划路线编码',width : 120,align : 'center'},
			{field : 'GHQDZH',title : '规划起点桩号',width : 100,align : 'center'},
			{field : 'GHZDZH',title : '规划止点桩号',width : 100,align : 'center'},
			{field:'LC',title:'里程',width:100,align:'center'},
//			{field:'JSDJ',title:'技术等级',width:100,align:'center'},
			{field:'JHKGSJ',title:'计划开工时间',width:100,align:'center'},
			{field:'JHWGSJ',title:'计划完工时间',width:100,align:'center'},
	        {field:'XDZJ',title:'已下达计划(万元)',width:120,align:'center'},
	        {field:'BFZJ',title:'已拨付资金(万元)',width:120,align:'center'}
//			{field:'GQ',title:'工期（月）',width:100,align:'center'},
//			{field:'NTZ',title:'总投资',width:100,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
	    			 	jdbs:2,
	    		    	xmbm:row.XMBM
	    			},
    			columns:[[
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
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
function showAll__ck(){
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
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var ybzt=$("#ybzt").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectShjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: xzqhstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf,
	    	'gcglsh.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglsh.lxbm':$("#lxbm").val(),
	    	'gcglsh.xmmc':$("#xmmc").val(),
	    	'gcglsh.lxmc':$("#lxmc").val(),
	    	'gcglsh.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglsh.tsdq':$("#ddlTSDQ").combobox('getText')
		},
	    columns:[[
			{field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
  	        	
  	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb__ck('+index+')">月报</a>   ';
  	        }},
  	      {field:'c1',title:'是否全线开工',width:80,align:'center',formatter:function(value,row,index){
	        	return row.SFQXKG+'';
	        }},
	        {field:'XMBM',title:'项目编码',width:100,align:'center'},
	        {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
  	        	if(row.SL!=1)
  	        		return '<font color="red">'+row.XMMC+'</font>';
  	        	else return  row.XMMC;	
  	        }},
			{field:'XZQH',title:'行政区划',width:100,align:'center'},
//			{field:'GYDW',title:'管养单位',width:100,align:'center'},
			{field:'YLXBH',title:'路线编码',width:100,align:'center'},
			{field:'QDZH',title:'起点桩号',width:100,align:'center'},
			{field:'ZDZH',title:'止点桩号',width:100,align:'center'},
			{field:'LC',title:'里程',width:100,align:'center'},
//			{field:'JSDJ',title:'技术等级',width:100,align:'center'},
			{field:'JHKGSJ',title:'计划开工时间',width:100,align:'center'},
			{field:'JHWGSJ',title:'计划完工时间',width:100,align:'center'},
//			{field:'GQ',title:'工期（月）',width:100,align:'center'},
//			{field:'NTZ',title:'总投资',width:100,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
	    			 	jdbs:2,
	    		    	xmbm:row.XMBM
	    			},
    			columns:[[
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
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}

function showYBlist(){
	var jhid=parent.obj1.XMBM;
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
	    url:'../../../../gcgl/selectshYbByJhid.do',
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
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
	              		}
	              	}},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
			        {field:'bywcdc',title:'本月完成垫层（m³）',width:120,align:'center',rowspan:2},
			        {field:'bywcjc',title:'本月完成基层（m³）',width:120,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:5},
			        {title:'本月资金到位（万元）',colspan:5},
			        {field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
	             ],
	             [
		        		{field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
						{field:'yhdk',title:'银行贷款',width:79,align:'center',rowspan:1},
						{field:'gz',title:'国债',width:79,align:'center',rowspan:1},
						{field:'sz',title:'省债',width:79,align:'center',rowspan:1},
						{field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
						{field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
						{field:'dwyhdk',title:'银行贷款',width:79,align:'center',rowspan:1},
						{field:'dwgz',title:'国债',width:79,align:'center',rowspan:1},
						{field:'dwsz',title:'省债',width:79,align:'center',rowspan:1},
						{field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}

function showYBlist__ck(){
	var jhid=parent.obj1.XMBM;
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
	    url:'../../../../gcgl/selectshYbByJhid.do',
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
			        {field:'bywcdc',title:'本月完成垫层（m³）',width:120,align:'center',rowspan:2},
			        {field:'bywcjc',title:'本月完成基层（m³）',width:120,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:5},
			        {title:'本月资金到位（万元）',colspan:5},
			        {field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
					{field:'yhdk',title:'银行贷款',width:79,align:'center',rowspan:1},
					{field:'gz',title:'国债',width:79,align:'center',rowspan:1},
					{field:'sz',title:'省债',width:79,align:'center',rowspan:1},
					{field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
					{field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
					{field:'dwyhdk',title:'银行贷款',width:79,align:'center',rowspan:1},
					{field:'dwgz',title:'国债',width:79,align:'center',rowspan:1},
					{field:'dwsz',title:'省债',width:79,align:'center',rowspan:1},
					{field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}
//
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadShFile.do"+'&flag='+'gljsjyhgl%2fsh%2fshxx'+'&type='+str+'&jhid='+parent.obj1.id,
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

//function downFile(str){
//	if($("#xz_"+str).text()=='下载附件'){
//		parent.window.location.href="../../../../gcgl/downShFile.do?type="+str+"&jhid="+parent.obj1.id;
//	}
//	else return;
//}
function deleteFile(str){
	if($("#xz_"+str).text()=='暂无附件'){
		return;
	}
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.id+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteShFile.do',
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
		url:'../../../../gcgl/selectShjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
			if(msg.sgxkwj!=''){
				$("#xz_sgxkwj").text(msg.sgxkwj);
				$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downShFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgtcwj!=''){
				$("#xz_jgtcwj").text(msg.jgtcwj);
				$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downShFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgyswj!=''){
				$("#xz_jgyswj").text(msg.jgyswj);
				$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downShFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
			}
			}
	});	
}
function sbsjyb(index){
	var yhjb=$.cookie("unit2");
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data='';
	if(yhjb.length==11){
		data="gcglsh.id="+data1.id+"&gcglsh.sfsj=9"+"&gcglsh.yhtype=11"+"&gcglsh.jhid="+data1.jhid;
	}
	if(yhjb.length==9||yhjb.length==8){
		data="gcglsh.id="+data1.id+"&gcglsh.sfsj=7"+"&gcglsh.yhtype=9"+"&gcglsh.jhid="+data1.jhid;
	}
	if(confirm("确认上报吗？")){
		var mydate=new Date();
		var nf1=data1.sbyf.substr(0,4);
		var yf1=data1.sbyf.substr(5,data1.sbyf.length);
		cxsfcgsjd(data1.id,mydate.getFullYear(),mydate.getMonth()+1,mydate.getDate(),'gcgl_sh',nf1,yf1);
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbShYb.do',
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
	var data="gcglsh.id="+data1.id+"&gcglsh.sfsj=11"+"&gcglsh.yhtype=9"+"&gcglsh.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbShYb.do',
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