var obj=new Object();
function addLXSH(url,width,length){
	YMLib.UI.createWindow('lxxx','添加立项信息',url,'lxxx',width,length);
}
function xiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','立项详细信息','sjgzsb_xx.jsp','lxxx',900,400);
}
function edit(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑立项信息','sjgzsb_edit.jsp','lxxx',900,400);
}
function del(index){
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
//
function xiangxi1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','立项详细信息','lmgzsb_xx.jsp','lxxx',900,400);
}
function edit1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑立项信息','lmgzsb_edit.jsp','lxxx',900,400);
}
function del1(index){
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
function remove(id){
	parent.$('#'+id).window('destroy');
}
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationXm(data.lxbm,"");
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
	            if(row.sbzt1=='1'||sbthcd==7)
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0'&&sbthcd!=7)
        		return '未上报';
	        	else if(row.sbzt1=='1'||sbthcd==7)
	        		return '已上报';
	        	else return '未知';
	        }},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
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
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}

function xmnf1(id){
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
	    	xmbm(id,$.cookie("dist"),rec.value);
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
        		return '未审核';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        	else return '未知';
	        }},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
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
    			    {field:'lc',title:'里程',width:60,align:'center'}
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
	            if(row.sbzt1=='1'||sbthcd==7)
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del1('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0'&&sbthcd!=7)
        		return '未上报';
	        	else if(row.sbzt1=='1'||sbthcd==7)
	        		return '已上报';
	        	else return '未知';
	        }},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
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
    			    {field:'lc',title:'里程',width:60,align:'center'}
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
        		return '未审核';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        	else return '未知';
	        }},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
	    		 queryParams: {
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
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}