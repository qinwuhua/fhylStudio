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
	var data="flag="+"gcsj"+"&gcglgcgzgj.sfqxkg="+sfqxkg+"&gcglgcgzgj.id="+data1.XMBM;
	$.ajax({
		type:'post',
		url:'/jxzhpt//gcgl/updataSFQX.do',
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
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.Var.jhbm=data.id;
	//YMLib.UI.createWindow('gclmsj_xx','升级改造工程项目项目计划详情',"/jxzhpt/page/jhgl/jhkxx/gclmsj.jsp",'gclmsj_xx',1000,500);
	YMLib.UI.createWindow('wqxx','升级改造工程项目详情','gcgzsjxx.jsp','wqxx',940,450);
	//window.open("gcgzsjxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function kaigong(index){
	if(confirm("确认开工吗？")){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','升级改造工程项目开工','wqgzkg.jsp','wqxx',650,330);
	}
}
function ykaigong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','升级改造工程项目开工详情','wqgzkg1.jsp','wqxx',650,330);
}
	function wangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','升级改造工程项目完工','wqgzwg.jsp','wqxx',500,300);
		}	
	function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','升级改造工程项目未完工','wqgzwwg.jsp','wqxx',400,220);
	}	
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','升级改造工程项目月报信息','gcgzsjyb.jsp','wqxx1',950,467);
	//window.open("gcgzsjyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxx','升级改造工程项目月报添加','gcgzsjybtj.jsp','wqxx',950,340);
	//window.open("gcgzsjybtj.jsp");
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','升级改造工程项目月报详情','gcgzsjybxx.jsp','wqxx',950,340);
	//window.open("gcgzsjybxx.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','升级改造工程项目月报编辑','gcgzsjybxg.jsp','wqxx',900,340);
	//window.open("gcgzsjybxg.jsp");
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglgcgzsj.id="+data1.id+"&gcglgcgzsj.jhid="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'/jxzhpt//gcgl/deletegcgzsjYb.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					$("#ybgrid").datagrid('reload');
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}
//添加月报
function tjgcgzsjyb(){
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
	if($("#tj_qlwcqk_z").val()==''||$("#tj_qlwcqk_ym").val()==''||$("#tj_sdwcqk_z").val()==''||$("#tj_sdwcqk_ym").val()==''||$("#tj_hdwcqk_m").val()==''||$("#tj_ljtsfwcqk").val()==''||$("#tj_dcwcqk").val()==''||$("#tj_jcwcqk").val()==''||$("#tj_bywcmc").val()==''||$("#tj_lqlmwcqk").val()==''||$("#tj_snlmwcqk").val()==''||$("#tj_bywctze").val()==''||$("#tj_bywcgzl").val()==''||$("#tj_kgdl").val()==''){
		alert("页面信息未填写完整，请您检查漏填项");
		return;
	}
	if($("#tj_sbyf").find("option:selected").text()==''){
		alert("没有选择月份，若无月份可选，请先等待拨付车购税");
		return;
	}
	var data = "gcglgcgzsj.qlwcqk_z="+$("#tj_qlwcqk_z").val()+"&gcglgcgzsj.qlwcqk_ym="+$("#tj_qlwcqk_ym").val()+"&gcglgcgzsj.sdwcqk_z="+$("#tj_sdwcqk_z").val()+"&gcglgcgzsj.sdwcqk_ym="+$("#tj_sdwcqk_ym").val()+"&gcglgcgzsj.hdwcqk_m="+$("#tj_hdwcqk_m").val()
	+"&gcglgcgzsj.ljtsfwcqk="+$("#tj_ljtsfwcqk").val()+"&gcglgcgzsj.dcwcqk="+$("#tj_dcwcqk").val()+"&gcglgcgzsj.jcwcqk="+$("#tj_jcwcqk").val()+"&gcglgcgzsj.bywcmc="+$("#tj_bywcmc").val()+"&gcglgcgzsj.lqlmwcqk="+$("#tj_lqlmwcqk").val()+"&gcglgcgzsj.snlmwcqk="+$("#tj_snlmwcqk").val()
	+"&gcglgcgzsj.zycgs="+$("#tj_zycgs").val()+"&gcglgcgzsj.dfbz="+$("#tj_dfbz").val()+"&gcglgcgzsj.yhdk="+$("#tj_yhdk").val()+"&gcglgcgzsj.sttxdk="+$("#tj_sttxdk").val()+"&gcglgcgzsj.qtzj="+$("#tj_qtzj").val()
	+"&gcglgcgzsj.kgdl="+$("#tj_kgdl").val()+"&gcglgcgzsj.qksm="+$("#tj_qksm").val()+"&gcglgcgzsj.bywctze="+$("#tj_bywctze").val()+"&gcglgcgzsj.bywcgzl="+$("#tj_bywcgzl").val()+"&gcglgcgzsj.wcqk="+$("#wcqk").text()+"&gcglgcgzsj.ssdctc="+$("#ssdctc").val()+"&gcglgcgzsj.bndsslc="+$("#bndsslc").val()
	+"&gcglgcgzsj.wkglc="+$("#wkglc").val()
	+"&gcglgcgzsj.sbsj="+sbsj+"&gcglgcgzsj.sbyf="+$("#tj_sbyf").val()+"&gcglgcgzsj.jhid="+parent.parent.obj1.XMBM+"&yhtype="+yhtype;
	//alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt//gcgl/insertgcgzsjYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('该月月报可能已存在，保存失败！');
			}
		}
	});	
}
//修改
function xggcgzsjyb(){
	//alert("xx");
	if($("#xg_qlwcqk_z").val()==''||$("#xg_qlwcqk_ym").val()==''||$("#xg_sdwcqk_z").val()==''||$("#xg_sdwcqk_ym").val()==''||$("#xg_hdwcqk_m").val()==''||$("#xg_ljtsfwcqk").val()==''||$("#xg_dcwcqk").val()==''||$("#xg_jcwcqk").val()==''||$("#xg_bywcmc").val()==''||$("#xg_lqlmwcqk").val()==''||$("#xg_snlmwcqk").val()==''||$("#xg_bywctze").val()==''||$("#xg_bywcgzl").val()==''||$("#xg_kgdl").val()==''){
		alert("页面信息未填写完整，请您检查漏填项");
		return;
	}
	var data = "gcglgcgzsj.qlwcqk_z="+$("#xg_qlwcqk_z").val()+"&gcglgcgzsj.qlwcqk_ym="+$("#xg_qlwcqk_ym").val()+"&gcglgcgzsj.sdwcqk_z="+$("#xg_sdwcqk_z").val()+"&gcglgcgzsj.sdwcqk_ym="+$("#xg_sdwcqk_ym").val()+"&gcglgcgzsj.hdwcqk_m="+$("#xg_hdwcqk_m").val()
	+"&gcglgcgzsj.ljtsfwcqk="+$("#xg_ljtsfwcqk").val()+"&gcglgcgzsj.dcwcqk="+$("#xg_dcwcqk").val()+"&gcglgcgzsj.jcwcqk="+$("#xg_jcwcqk").val()+"&gcglgcgzsj.bywcmc="+$("#xg_bywcmc").val()+"&gcglgcgzsj.lqlmwcqk="+$("#xg_lqlmwcqk").val()+"&gcglgcgzsj.snlmwcqk="+$("#xg_snlmwcqk").val()
	+"&gcglgcgzsj.zycgs="+$("#tj_zycgs").val()+"&gcglgcgzsj.dfbz="+$("#tj_dfbz").val()+"&gcglgcgzsj.yhdk="+$("#tj_yhdk").val()+"&gcglgcgzsj.sttxdk="+$("#tj_sttxdk").val()+"&gcglgcgzsj.qtzj="+$("#tj_qtzj").val()
	+"&gcglgcgzsj.kgdl="+$("#xg_kgdl").val()+"&gcglgcgzsj.qksm="+$("#xg_qksm").val()+"&gcglgcgzsj.bywctze="+$("#xg_bywctze").val()+"&gcglgcgzsj.bywcgzl="+$("#xg_bywcgzl").val()
	+"&gcglgcgzsj.jhid="+parent.obj.jhid+"&gcglgcgzsj.id="+parent.obj.id+"&gcglgcgzsj.sbyf="+$("#xg_sbyf").val()+"&gcglgcgzsj.wcqk="+$("#wcqk").text()+"&gcglgcgzsj.ssdctc="+$("#ssdctc").val()+"&gcglgcgzsj.bndsslc="+$("#bndsslc").val()
	+"&gcglgcgzsj.wkglc="+$("#wkglc").val();
	//alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt//gcgl/updategcgzsjYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
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
	var data="gcglgcgzsj.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglgcgzsj.yjwgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglgcgzsj.sgdw="+$("#tj_sgdw").val()+"&gcglgcgzsj.jldw="+$("#tj_jldw").val()+"&gcglgcgzsj.jsdw="+$("#tj_jsdw").val()
	+"&gcglgcgzsj.htje="+$("#tj_htje").val()+"&gcglgcgzsj.gsztz="+$("#tj_gys").val()+"&gcglgcgzsj.jhid="+parent.obj1.XMBM;
	//alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt//gcgl/insertGcgzsjkg.do',
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
	var data="gcglgcgzsj.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglgcgzsj.jhid="+parent.obj1.XMBM;
	//alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt//gcgl/insertGcgzsjwg.do',
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
	var data="gcglgcgzsj.wjgyy="+$("#tj_wjgyy").val()+"&gcglgcgzsj.jhid="+parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt//gcgl/insertGcgzsjwwg.do',
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
	var xmnf=$("#ddlYear").val();
	var ybzt=$("#ybzt").val();
	$('#datagrid').datagrid({    
	    url:'/jxzhpt//gcgl/selectGcgzsjjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: xzqhstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf
		},
	    columns:[[
			{field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
			  	if(row.KGZT=='1'){
			  		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'已开工  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   ';
  	        	}else
  	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'未开工  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   ';
			  }},
			{field:'c1',title:'是否全线开工',width:80,align:'center',formatter:function(value,row,index){
				return row.SFQXKG+'    ';
			}},
			{field : 'XMMC',title : '项目名称',width : 180,align : 'center'},
			{field : 'XMBM',title : '项目编码',width : 120,align : 'center'},
			{field : 'XZQH',title : '行政区划',width : 180,align : 'center'},
			{field : 'QDZH',title : '起点桩号',width : 100,align : 'center'},
			{field : 'ZDZH',title : '止点桩号',width : 100,align : 'center'},
			{field:'KGSJ',title:'计划开工时间',width:150,align:'center'},
			{field:'WGSJ',title:'计划完工时间',width:150,align:'center'},
			{field:'GQ',title:'工期（月）',width:100,align:'center'},
			{field:'GKPFWH',title:'工可批复文号',width:100,align:'center'},
			{field:'SJPFWH',title:'设计批复文号',width:100,align:'center'}
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
	    url:'/jxzhpt//gcgl/selectgcgzsjYbByJhid.do',
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
	              		
	              		/*if(yhtype=='县级'){
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
	              		}*/
	              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
	              	}},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
			        {field:'dcwcqk',title:'本月完成垫层（m³）',width:130,align:'center',rowspan:2},
			        {field:'jcwcqk',title:'本月完成基层（m³）',width:130,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:130,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:5},
			        {field:'qksm',title:'情况说明',width:120,align:'center',rowspan:2}
	             ],
	             [
			        {field:'zycgs',title:'中央车购税 ',width:79,align:'center',rowspan:1},
			        {field:'dfbz',title:'地方补助 ',width:79,align:'center',rowspan:1},
			        {field:'yhdk',title:'银行贷款',width:79,align:'center',rowspan:1},
			        {field:'sttxdk',title:'省厅贴息',width:79,align:'center',rowspan:1},
			        {field:'qtzj',title:'其他资金',width:79,align:'center',rowspan:1}
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadGcgzsjFile.do"+'&flag='+'gljsjyhgl%2fgcgzsj%2fgcgzsjxx'+'&type='+str+'&jhid='+parent.obj1.id,
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
//		parent.window.location.href="/jxzhpt//gcgl/downGcgzsjFile.do?type="+str+"&jhid="+parent.obj1.id;
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
		url:'/jxzhpt//gcgl/deleteGcgzsjFile.do',
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
		url:'/jxzhpt//gcgl/selectGcgzsjjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
			if(msg.sgxkwj!=''){
				$("#xz_sgxkwj").text(msg.sgxkwj);
				$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgtcwj!=''){
				$("#xz_jgtcwj").text(msg.jgtcwj);
				$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgyswj!=''){
				$("#xz_jgyswj").text(msg.jgyswj);
				$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
			}
			}
	});	
}
function sbsjyb(index){
	var yhjb=$.cookie("unit2");
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data='';
	if(yhjb.length==11){
		data="gcglgcgzsj.id="+data1.id+"&gcglgcgzsj.sfsj=9"+"&gcglgcgzsj.yhtype=11"+"&gcglgcgzsj.jhid="+data1.jhid;
	}
	if(yhjb.length==9||yhjb.length==8){
		data="gcglgcgzsj.id="+data1.id+"&gcglgcgzsj.sfsj=7"+"&gcglgcgzsj.yhtype=9"+"&gcglgcgzsj.jhid="+data1.jhid;
	}
	if(confirm("确认上报吗？")){
		$.ajax({
			type:'post',
			url:'/jxzhpt//gcgl/sbGcgzsjYb.do',
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
	var data="gcglgcgzsj.id="+data1.id+"&gcglgcgzsj.sfsj=11"+"&gcglgcgzsj.yhtype=9"+"&gcglgcgzsj.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'/jxzhpt//gcgl/sbGcgzsjYb.do',
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