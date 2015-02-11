var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','灾害防治开工详情','zhfzxx.jsp','wqxx',740,450);
	//window.open("zhfzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}

function kaigong(index){
	if(confirm("确认开工吗？")){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','灾害防治开工','wqgzkg.jsp','wqxx',650,330);
	}
}
	function wangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','灾害防治完工','wqgzwg.jsp','wqxx',500,300);
		}	
	function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','灾害防治未完工','wqgzwwg.jsp','wqxx',400,220);
	}	


function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','灾害防治月报信息','zhfzyb.jsp','wqxx1',1059,450);
	//window.open("zhfzyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxx','灾害防治月报添加','zhfzybtj.jsp','wqxx',600,340);
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','灾害防治月报详情','zhfzybxx.jsp','wqxx',700,430);
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','灾害防治月报编辑','zhfzybxg.jsp','wqxx',600,340);
	//window.open("zhfzybxg.jsp");
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglzhfz.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteZhfzYb.do',
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
var jhid=10;
//添加月报
function tjzhfzyb(){
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
	var data = "gcglzhfz.wc_btz="+$("#tj_wc_btz").val()+"&gcglzhfz.wc_stz="+$("#tj_wc_stz").val()+"&gcglzhfz.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglzhfz.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglzhfz.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglzhfz.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglzhfz.bywcgl="+$("#tj_bywcgl").val()+"&gcglzhfz.kgdl="+$("#tj_kgdl").val()+"&gcglzhfz.qksm="+$("#tj_qksm").val()
	+"&gcglzhfz.sbsj="+sbsj+"&gcglzhfz.sbyf="+$("#tj_sbyf").val()+"&gcglzhfz.jhid="+parent.parent.obj1.jhid+"&yhtype="+yhtype;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertZhfzYb.do',
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
function xgzhfzyb(){
	var data = "gcglzhfz.wc_btz="+$("#xg_wc_btz").val()+"&gcglzhfz.wc_stz="+$("#xg_wc_stz").val()+"&gcglzhfz.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglzhfz.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglzhfz.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglzhfz.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglzhfz.bywcgl="+$("#xg_bywcgl").val()+"&gcglzhfz.kgdl="+$("#xg_kgdl").val()+"&gcglzhfz.qksm="+$("#xg_qksm").val()
	+"&gcglzhfz.jhid="+parent.obj.jhid+"&gcglzhfz.id="+parent.obj.id+"&gcglzhfz.sbyf="+$("#xg_sbyf").val();
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateZhfzYb.do',
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
//
//开工
function tjwqgzkg(){
	var data="gcglzhfz.xdsj="+$("#tj_xdsj").datebox('getValue')+"&gcglzhfz.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglzhfz.yjjgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglzhfz.sgdw="+$("#tj_sgdw").val()+"&gcglzhfz.jldw="+$("#tj_jldw").val()+"&gcglzhfz.jsdw="+$("#tj_jsdw").val()
	+"&gcglzhfz.htje="+$("#tj_htje").val()+"&gcglzhfz.gys="+$("#tj_gys").val()+"&gcglzhfz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertZhfzkg.do',
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
	var data="gcglzhfz.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglzhfz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertZhfzwg.do',
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
	var data="gcglzhfz.wjgyy="+$("#tj_wjgyy").val()+"&gcglzhfz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertZhfzwwg.do',
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
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/gcgl/selectZhfzjhList.do',
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
	    	lxmc:lxmc
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		return '定位    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'已开工  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wangong('+index+')">完工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wwangong('+index+')">未完工</a>  ';
	        	}else
	        	return '定位    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="kaigong('+index+')">未开工</a>  '+'月报   '+'完工   '+'未完工   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:100,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'lxjsdj',title:'路线技术等级',width:100,align:'center'}
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
	    url:'../../../../gcgl/selectZhfzYbByJhid.do',
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
			        {field:'bywcgl',title:'本月完成（公里）',width:100,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:2},
			        {title:'本月资金到位（万元）',colspan:2},
			        {field:'qksm',title:'情况说明',width:100,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			       // {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			      //  {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadZhfzFile.do"+'&flag='+'gljsjyhgl%2fzhfz%2fzhfzxx'+'&type='+str+'&jhid='+parent.obj1.jhid,
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

function downFile(str){
	if($("#xz_"+str).text()=='下载附件'){
		parent.window.location.href="../../../../gcgl/downZhfzFile.do?type="+str+"&jhid="+parent.obj1.jhid;
	}
	else return;
}
function deleteFile(str){
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.jhid+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteZhfzFile.do',
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
		url:'../../../../gcgl/selectZhfzjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text("下载附件");
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text("下载附件");
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text("下载附件");
				}
			}
	});	
}
function sbsjyb(index){
	var yhjb=$.cookie("unit2");
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data='';
	if(yhjb.length==11){
		data="gcglzhfz.id="+data1.id+"&gcglzhfz.sfsj=9";
	}
	if(yhjb.length==9||yhjb.length==8){
		data="gcglzhfz.id="+data1.id+"&gcglzhfz.sfsj=7";
	}
	if(confirm("确认上报吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbZhfzYb.do',
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
	var data="gcglzhfz.id="+data1.id+"&gcglzhfz.sfsj=11";
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbZhfzYb.do',
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
