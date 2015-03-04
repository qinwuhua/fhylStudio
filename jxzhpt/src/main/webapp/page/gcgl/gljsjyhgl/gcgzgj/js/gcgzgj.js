var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','工程改造路面改建开工详情','gcgzgjxx.jsp','wqxx',740,450);
	//window.open("gcgzgjxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function kaigong(index){
	if(confirm("确认开工吗？")){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','工程改造路面改建开工','wqgzkg.jsp','wqxx',650,330);
	}
}
	function wangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','工程改造路面改建完工','wqgzwg.jsp','wqxx',500,300);
		}	
	function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','工程改造路面改建未完工','wqgzwwg.jsp','wqxx',400,220);
	}	
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','工程改造路面改建月报信息','gcgzgjyb.jsp','wqxx1',1059,450);
	//window.open("gcgzgjyb.jsp");
}
function AddInfo(index){
	YMLib.UI.createWindow('wqxx','工程改造路面改建月报添加','gcgzgjybtj.jsp','wqxx',680,360);
	//window.open("gcgzgjybtj.jsp");
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','工程改造路面改建月报详情','gcgzgjybxx.jsp','wqxx',700,450);
	//window.open("gcgzgjybxx.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','工程改造路面改建月报编辑','gcgzgjybxg.jsp','wqxx',680,360);
	//window.open("gcgzgjybxg.jsp");
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglgcgzgj.id="+data1.id;
	//alert(data);
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deletegcgzgjYb.do',
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
//月报添加
var jhid=10;
function tjgcgzgjyb(){
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
		alert("省级用户您好，您不用为添加月报负责");
		return;
	}
	var data = "gcglgcgzgj.wc_btz="+$("#tj_wc_btz").val()+"&gcglgcgzgj.wc_stz="+$("#tj_wc_stz").val()+"&gcglgcgzgj.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglgcgzgj.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglgcgzgj.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglgcgzgj.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglgcgzgj.bywcdc="+$("#tj_bywcdc").val()+"&gcglgcgzgj.bywcjc="+$("#tj_bywcjc").val()+"&gcglgcgzgj.bywcmc="+$("#tj_bywcmc").val()+"&gcglgcgzgj.kgdl="+$("#tj_kgdl").val()
	+"&gcglgcgzgj.qksm="+$("#tj_qksm").val()+"&gcglgcgzgj.wcqk="+$("#tj_wcqk").val()
	+"&gcglgcgzgj.sbsj="+sbsj+"&gcglgcgzgj.sbyf="+$("#tj_sbyf").find("option:selected").text()+"&gcglgcgzgj.jhid="+parent.parent.obj1.id+"&yhtype="+yhtype;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertgcgzgjYb.do',
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
function xggcgzgjyb(){
	//alert("xx");
	var data = "gcglgcgzgj.wc_btz="+$("#xg_wc_btz").val()+"&gcglgcgzgj.wc_stz="+$("#xg_wc_stz").val()+"&gcglgcgzgj.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglgcgzgj.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglgcgzgj.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglgcgzgj.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglgcgzgj.bywcdc="+$("#xg_bywcdc").val()+"&gcglgcgzgj.bywcjc="+$("#xg_bywcjc").val()+"&gcglgcgzgj.bywcmc="+$("#xg_bywcmc").val()+"&gcglgcgzgj.kgdl="+$("#xg_kgdl").val()
	+"&gcglgcgzgj.qksm="+$("#xg_qksm").val()+"&gcglgcgzgj.wcqk="+$("#xg_wcqk").val()
	+"&gcglgcgzgj.jhid="+parent.obj.jhid+"&gcglgcgzgj.id="+parent.obj.id+"&gcglgcgzgj.sbyf="+$("#xg_sbyf").find("option:selected").text();
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updategcgzgjYb.do',
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
	var data="gcglgcgzgj.xdsj="+$("#tj_xdsj").datebox('getValue')+"&gcglgcgzgj.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglgcgzgj.yjwgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglgcgzgj.sgdw="+$("#tj_sgdw").val()+"&gcglgcgzgj.jldw="+$("#tj_jldw").val()+"&gcglgcgzgj.jsdw="+$("#tj_jsdw").val()
	+"&gcglgcgzgj.htje="+$("#tj_htje").val()+"&gcglgcgzgj.gsztz="+$("#tj_gys").val()+"&gcglgcgzgj.jhid="+parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertGcgzgjkg.do',
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
	var data="gcglgcgzgj.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglgcgzgj.jhid="+parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertGcgzgjwg.do',
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
	var data="gcglgcgzgj.wjgyy="+$("#tj_wjgyy").val()+"&gcglgcgzgj.jhid="+parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertGcgzgjwwg.do',
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
	var gydw=$("#gydw").combobox("getValue");
	if(gydw=='36')
		gydw='';
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
	    url:'../../../../gcgl/selectGcgzgjjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydw,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:ybzt,
	    	sfsj:sfsj
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
  	        	if(row.kgzt=='1'){
  	        		return '定位    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'已开工  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wangong('+index+')">完工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wwangong('+index+')">未完工</a>  ';
  	        	}else
  	        	return '定位    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="kaigong('+index+')">未开工</a>  '+'月报   '+'完工   '+'未完工   ';
  	        }},
	        {field:'c1',title:'是否全线开工',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="Showybxx()">否</a>    ';
	        }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:80,align:'center'},
	        {field:'ylmlx',title:'原路面类型',width:100,align:'center'}
	    ]]    
	}); 
}

function showYBlist(){
	var jhid=parent.obj1.id;
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
	    url:'../../../../gcgl/selectgcgzgjYbByJhid.do',
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
					{title:'本月完成投资（万元）',colspan:2},
					{title:'本月资金到位（万元）',colspan:2},
					{field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
					],
					[
					{field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
					//{field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
					{field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
					{field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
				//	{field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadGcgzgjFile.do"+'&flag='+'gljsjyhgl%2fgcgzgj%2fgcgzgjxx'+'&type='+str+'&jhid='+parent.obj1.id,
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
//		parent.window.location.href="../../../../gcgl/downGcgzgjFile.do?type="+str+"&jhid="+parent.obj1.id;
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
		url:'../../../../gcgl/deleteGcgzgjFile.do',
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
		url:'../../../../gcgl/selectGcgzgjjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text(msg.sgxkwj);
					$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downGcgzgjFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text(msg.jgtcwj);
					$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downGcgzgjFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text(msg.jgyswj);
					$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downGcgzgjFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
				}
			}
	});	
}
function sbsjyb(index){
	var yhjb=$.cookie("unit2");
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data='';
	if(yhjb.length==11){
		data="gcglgcgzgj.id="+data1.id+"&gcglgcgzgj.sfsj=9"+"&gcglgcgzgj.yhtype=11"+"&gcglgcgzgj.jhid="+data1.jhid;
	}
	if(yhjb.length==9||yhjb.length==8){
		data="gcglgcgzgj.id="+data1.id+"&gcglgcgzgj.sfsj=7"+"&gcglgcgzgj.yhtype=9"+"&gcglgcgzgj.jhid="+data1.jhid;
	}
	if(confirm("确认上报吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbGcgzgjYb.do',
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
	var data="gcglgcgzgj.id="+data1.id+"&gcglgcgzgj.sfsj=11"+"&gcglgcgzgj.yhtype=9"+"&gcglgcgzgj.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbGcgzgjYb.do',
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