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
		result="水毁项目";
	}
	return result;
}
function addLXSH(url,width,length){
	YMLib.UI.createWindow('lxxx','添加立项信息',url,'lxxx',width,length);
}
function xiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','立项详细信息','sjgzsb_xx.jsp','lxxx',900,360);
}
function edit(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑立项信息','sjgzsb_edit.jsp','lxxx',900,380);
}
function del(index){
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.xmbm;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delSjgz.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
function shangb(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	var sbthcd=0;
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	
	if(confirm('您确定上报该项目？')){
		var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/sbsjgzSbzt.do",
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
function shangb1(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	var sbthcd=0;
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	
	if(confirm('您确定上报该项目？')){
		var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/sblmgzSbzt.do",
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
function shangb2(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	var sbthcd=0;
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	
	if(confirm('您确定上报该项目？')){
		var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/sbxjSbzt.do",
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
function shenh(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shsjgzSbzt.do",
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
		var data = "lxsh.id="+id;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shlmgzSbzt.do",
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
		var data = "lxsh.id="+id;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shxjSbzt.do",
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
	YMLib.UI.createWindow('lxxx','立项详细信息','lmgzsb_xx.jsp','lxxx',900,360);
}
function edit1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑立项信息','lmgzsb_edit.jsp','lxxx',900,380);
}
function del1(index){
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.xmbm;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delLmgz.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
//
function xiangxi2(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','立项详细信息','xjsb_xx.jsp','lxxx',900,360);
}
function edit2(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑立项信息','xjsb_edit.jsp','lxxx',900,380);
}
function del2(index){
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.xmbm;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delXj.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
//
function removes(id){
	parent.$('#'+id).window('destroy');
}
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/selectlxbyxmid.do',
			data:"lxsh.xmbm="+data.xmbm+"&lxsh.jdbs=0",
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
function xmbm(id,xzqh,nf,xmlx){
	
	var data="xmtype="+xmlx+"&xzqh="+xzqh+"&nf="+nf;
	$("#"+id).html('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/selectxmbm.do',
		data:data,
		dataType:'json',
		success:function(msg){
			$("#xmbm").html(msg.xmbm);
		},
		error : function(){
		 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
	 }
	});	
}
var shzt1;
function showAll(){
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
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzList.do',
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
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	            if(row.sbzt1=='1')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
	    			 	jdbs:0,
	    		    	xmbm:row.xmbm
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
    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
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
	    }   
	}); 
}

function xmnf1(id,xmlx){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i),value:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    onSelect:function(rec){
	    	xmbm(id,$.cookie("dist"),rec.value,xmlx);
	    }
	});
	$('#'+id).combobox("setValue",first);
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
//升级审核
function showAllsjsh(){
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
	var xmnf=$("#xmnf").combobox('getText');
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzshList.do',
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
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
	    			 	jdbs:0,
	    		    	xmbm:row.xmbm
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
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}

//lmsj
function showAlllmgz(){
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
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzList.do',
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
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	            if(row.sbzt1=='1')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del1('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb1('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
	    			 	jdbs:0,	
	    		    	xmbm:row.xmbm
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
    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
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
	    }   
	}); 
}
function showAlllmsh(){
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
	var xmnf=$("#xmnf").combobox('getText');
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzshList.do',
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
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh1('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
	    			 	jdbs:0,
	    		    	xmbm:row.xmbm
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
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
//XJ
function showAllxj(){
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
	var sbzt=$("#sbzt").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjList.do',
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
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	            if(row.sbzt1=='1')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del2('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb2('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
	    				jdbs:0,
	    		    	xmbm:row.xmbm
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxjlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},
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
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
function showAllxjsh(){
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
	var xmnf=$("#xmnf").combobox('getText');
	var sbzt=$("#sbzt").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjshList.do',
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
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh2('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '规划路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
	    				jdbs:0,
	    		    	xmbm:row.xmbm
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
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
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
function tjsjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','添加路线信息','sjgzlx_add.jsp','lxxx',900,300);
}
function tjlmlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','添加路线信息','lmgzlx_add.jsp','lxxx',900,300);
}
function tjxjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','添加路线信息','xjlx_add.jsp','lxxx',900,300);
}
function delsjlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=sjgz"+"&lxsh.jdbs=0",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showAll();
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
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=lmgz",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showAlllmgz();
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
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=xj",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showAllxj();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}

function cxqdmc(lxbm,qdzh){
	$('#qdmc').html('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxqdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#qdmc').html(msg.qdmc);
		}
	});
}
function cxzdmc(lxbm,qdzh){
	$('#zdmc').html('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxzdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#zdmc').html(msg.zdmc);
		}
	});
}

function checkdfzc(str){
	checkSZ(str);
	$("#dfzc").html('');
	var tz=0;var bzcs=0;
	if($("#tz").val()!='')
		tz=parseFloat($("#tz").val());
	if($("#bzcs").html()!='')
		bzcs=parseFloat($("#bzcs").html());
	if(bzcs>tz){
		alert("投资不能小于补助测算");
		return
	}
	var dfzc=accSub(tz,bzcs);
	$("#dfzc").html(dfzc);
}
function checkdfzc1(str){
	checkSZ(str);
	$("#dfzc").html('');
	var tz=0;var bzcs=0;
	if($("#tz").val()!='')
		tz=parseFloat($("#tz").val());
	if($("#bzcs").val()!='')
		bzcs=parseFloat($("#bzcs").val());
	if(bzcs>tz){
		alert("投资不能小于补助测算");
		return
	}
	var dfzc=accSub(tz,bzcs);
	$("#dfzc").html(dfzc);
}

function import_sjgz(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '立项审核信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importsjgzlxsh.do"+'&flag='+flag,
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

function import_lmgz(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '立项审核信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importlmgzlxsh.do"+'&flag='+flag,
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

function import_xj(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '立项审核信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importxjlxsh.do"+'&flag='+flag,
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