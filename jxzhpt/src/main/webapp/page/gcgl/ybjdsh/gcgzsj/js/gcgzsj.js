var obj=new Object();
var obj1=new Object();
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationXm(data.GHLXBH,"");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.Var.jhbm=data.id;
	//YMLib.UI.createWindow('gclmsj_xx','升级改造项目计划详情',"/jxzhpt/page/jhgl/jhkxx/gclmsj.jsp",'gclmsj_xx',1000,500);
	YMLib.UI.createWindow('wqxx','升级改造工程项目详情','gcgzsjxx.jsp','wqxx',940,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','升级改造月报详情','gcgzsjybxx.jsp','wqxx',900,430);
	//window.open("wqgzybxx.jsp");
}
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','升级改造月报列表','gcgzsjyb.jsp','wqxx1',1059,480);
	//window.open("wqgzyb.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','升级改造月报编辑','gcgzsjybxg.jsp','wqxx',900,400);
	//window.open("gcgzsjybxg.jsp");
}
//修改
function xggcgzsjyb(){
	//alert("xx");
	var data = "gcglgcgzsj.qlwcqk_z="+$("#xg_qlwcqk_z").val()+"&gcglgcgzsj.qlwcqk_ym="+$("#xg_qlwcqk_ym").val()+"&gcglgcgzsj.sdwcqk_z="+$("#xg_sdwcqk_z").val()+"&gcglgcgzsj.sdwcqk_ym="+$("#xg_sdwcqk_ym").val()+"&gcglgcgzsj.hdwcqk_m="+$("#xg_hdwcqk_m").val()
	+"&gcglgcgzsj.ljtsfwcqk="+$("#xg_ljtsfwcqk").val()+"&gcglgcgzsj.dcwcqk="+$("#xg_dcwcqk").val()+"&gcglgcgzsj.jcwcqk="+$("#xg_jcwcqk").val()+"&gcglgcgzsj.bywcmc="+$("#xg_bywcmc").val()+"&gcglgcgzsj.lqlmwcqk="+$("#xg_lqlmwcqk").val()+"&gcglgcgzsj.snlmwcqk="+$("#xg_snlmwcqk").val()
	+"&gcglgcgzsj.zycgs="+$("#xg_zycgs").val()+"&gcglgcgzsj.dfbz="+$("#xg_dfbz").val()+"&gcglgcgzsj.yhdk="+$("#xg_yhdk").val()+"&gcglgcgzsj.sttxdk="+$("#xg_sttxdk").val()+"&gcglgcgzsj.qtzj="+$("#xg_qtzj").val()
	+"&gcglgcgzsj.kgdl="+$("#xg_kgdl").val()+"&gcglgcgzsj.qksm="+$("#xg_qksm").val()+"&gcglgcgzsj.bywctze="+$("#xg_bywctze").val()+"&gcglgcgzsj.bywcgzl="+$("#xg_bywcgzl").val()
	+"&gcglgcgzsj.jhid="+parent.obj.jhid+"&gcglgcgzsj.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updategcgzsjYb.do',
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
	YMLib.UI.createWindow('wqxx','升级改造月报审核','gcgzsjybsh.jsp','wqxx',450,200);
}
function shgcgzsjyb(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var data = "gcglgcgzsj.zjje="+$("#tj_zjje").val()+"&gcglgcgzsj.xgcsyj="+$("#tj_xgcsyj").val()+"&gcglgcgzsj.cscyj="+$("#tj_cscyj").val()
	+"&gcglgcgzsj.shtime="+sbsj+"&gcglgcgzsj.shuser="+$.cookie("truename")+"&gcglgcgzsj.jhid="+parent.obj.jhid+"&gcglgcgzsj.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/shgcgzsjyb.do',
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
	var xmnf=$("#ddlYear").val();
	var ybzt=$("#ybzt").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzsjjhList.do',
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
 	        	 return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="wqxiangxi('+index+')">详细</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="ybsb('+index+')">月报审核</a>    ';
 	        }},
 	       {field : 'XMMC',title : '项目名称',width : 180,align : 'center'},
			{field : 'XMBM',title : '项目编码',width : 120,align : 'center'},
			{field : 'XZQH',title : '行政区划',width : 180,align : 'center'},
			{field : 'QDZH',title : '起点桩号',width : 100,align : 'center'},
			{field : 'ZDZH',title : '止点桩号',width : 100,align : 'center'},
			{field:'KGSJ',title:'计划开工时间',width:150,align:'center'},
			{field:'WGSJ',title:'计划完工时间',width:150,align:'center'},
			{field:'GQ',title:'工期',width:100,align:'center'},
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
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectgcgzsjYbByJhid1.do?jhid='+parent.obj1.XMBM,
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
function thsjyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglgcgzsj.id="+data1.id+"&gcglgcgzsj.sfsj=9"+"&gcglgcgzsj.yhtype=7"+"&gcglgcgzsj.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbGcgzsjYb.do',
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
//		parent.window.location.href="../../../../gcgl/downGcgzsjFile.do?type="+str+"&jhid="+parent.obj1.id;
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
		url:'../../../../gcgl/deleteGcgzsjFile.do',
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
		url:'../../../../gcgl/selectGcgzsjjhFile.do',
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