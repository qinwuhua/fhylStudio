var obj=new Object();
var obj1=new Object();
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
	YMLib.UI.createWindow('wqxx','养护中心工程项目详情','yhdzxxx.jsp','wqxx',940,450);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','养护中心月报详情','yhdzxybxx.jsp','wqxx',800,430);
	//window.open("wqgzybxx.jsp");
}
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','养护中心月报列表','yhdzxyb.jsp','wqxx1',1059,480);
}
function ybsb__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','养护大中修月报列表','yhdzxyb__ck.jsp','wqxx1',1059,480);
	//window.open("wqgzyb.jsp");
}

function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','养护大中修月报编辑','yhdzxybxg.jsp','wqxx',680,360);
	//window.open("yhdzxybxg.jsp");
}
//修改
function xgyhdzxyb(){
	var data = "gcglyhdzx.wc_btz="+$("#xg_wc_btz").val()+"&gcglyhdzx.wc_stz="+$("#xg_wc_stz").val()+"&gcglyhdzx.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglyhdzx.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglyhdzx.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglyhdzx.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglyhdzx.bywcdc="+$("#xg_bywcdc").val()+"&gcglyhdzx.bywcjc="+$("#xg_bywcjc").val()+"&gcglyhdzx.bywcmc="+$("#xg_bywcmc").val()+"&gcglyhdzx.kgdl="+$("#xg_kgdl").val()
	+"&gcglyhdzx.qksm="+$("#xg_qksm").val()+"&gcglyhdzx.wcqk="+$("#xg_wcqk").val()
	+"&gcglyhdzx.jhid="+parent.obj.jhid+"&gcglyhdzx.id="+parent.obj.id;
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateYhdzxYb.do',
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
//审核
function ybsh(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','养护中心月报审核','yhdzxybsh.jsp','wqxx',450,200);
}
function shyhdzxyb(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var data = "&gcglyhdzx.xgcsyj="+$("#tj_xgcsyj").val()
	+"&gcglyhdzx.shtime="+sbsj+"&gcglyhdzx.shuser="+$.cookie("truename")
	+"&gcglyhdzx.jhid="+parent.obj.jhid+"&gcglyhdzx.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/shYhzxYb.do',
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

function showAll(){
	var xmnf=$("#ddlYear").val();
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
	var kgzt='';
	var lxmc=$("#lxmc").val();
	var yhjb=$.cookie("unit2").replace(/_/g,"");
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
	    url:'../../../../gcgl/selectYhzxjhList.do',
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
	    	'gcglyhdzx.xmmc':$("#xmmc").val(),
	    	'gcglyhdzx.lxmc':$("#lxmc").val()
		},
	    columns:[[
             {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
 	        	 return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="wqxiangxi('+index+')">详细</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="ybsb('+index+')">月报审核</a>    ';
 	        }},
	        {field:'XMBM',title:'项目编码',width:100,align:'center'},
  	        {field :'XMMC',title:'项目名称',width : 180,align:'center'},
			{field:'XZQH',title:'行政区划',width:100,align:'center'},
			{field:'YDBMC',title:'原道班名称',width:100,align:'center'},
			{field:'LXZH',title:'所在路线桩号',width:100,align:'center'},
			{field:'LXMC',title:'所在路线名称',width:100,align:'center'},
			{field:'JHKGSJ',title:'计划开工时间',width:100,align:'center'},
			{field:'JHWGSJ',title:'计划完工时间',width:100,align:'center'}
	    ]]
	}); 
}

function showAll__ck(){
	var xmnf=$("#ddlYear").val();
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
	var kgzt='';
	var lxmc=$("#lxmc").val();
	var yhjb=$.cookie("unit2").replace(/_/g,"");
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
	    url:'../../../../gcgl/selectYhdzxjhList.do',
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
	    	xmnf:xmnf
		},
	    columns:[[
             {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
 	        	 return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="wqxiangxi('+index+')">详细</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="ybsb__ck('+index+')">月报审核</a>    ';
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
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectYhzxYbByJhid1.do?jhid='+parent.obj1.XMBM,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
	              		if(row.shzt=='未审核'&&row.sfsj==7)
				        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="ybsh('+index+')">未审核</a>   '+'<a href="#" onclick="thsjyb('+index+')">退回</a>';
		              		if(row.shzt=='已审核')
		              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'已审核   '+'退回   ';
			        }},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:2},
			        {title:'本月资金到位（万元）',colspan:2},
			        {field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}

function showYBlist__ck(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectYhdzxYbByJhid1.do?jhid='+parent.obj1.XMBM,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
	              	
		              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
			        }},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
			        {field:'bywcdc',title:'本月完成垫层（m³）',width:120,align:'center',rowspan:2},
			        {field:'bywcjc',title:'本月完成基层（m³）',width:120,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
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
function thsjyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglyhdzx.id="+data1.id+"&gcglyhdzx.sfsj=9"+"&gcglyhdzx.yhtype=7"+"&gcglyhdzx.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbYhzxYb.do',
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadYhdzxFile.do"+'&flag='+'gljsjyhgl%2fyhdzx%2fyhdzxxx'+'&type='+str+'&jhid='+parent.obj1.id,
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
//		parent.window.location.href="../../../../gcgl/downYhdzxFile.do?type="+str+"&jhid="+parent.obj1.id;
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
		url:'../../../../gcgl/deleteYhdzxFile.do',
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
		url:'../../../../gcgl/selectYhdzxjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
			if(msg.sgxkwj!=''){
				$("#xz_sgxkwj").text(msg.sgxkwj);
				$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgtcwj!=''){
				$("#xz_jgtcwj").text(msg.jgtcwj);
				$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgyswj!=''){
				$("#xz_jgyswj").text(msg.jgyswj);
				$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
			}
			}
	});	
}