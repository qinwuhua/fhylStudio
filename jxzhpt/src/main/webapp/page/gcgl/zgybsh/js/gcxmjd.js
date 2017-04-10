var obj=new Object();
var obj1=new Object();

function closes(str){
	 parent.$('#'+str).window('destroy');
}


function ShowybInfo(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','项目月报详情','/jxzhpt/page/gcgl/gljsjyhgl/gcjdybxx.jsp','wqxx',850,370);
	//window.open("gcgzsjybxx.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','项目月报编辑','/jxzhpt/page/gcgl/gljsjyhgl/gcjdybxg.jsp','wqxx',850,370);
}
//审核月报
function shenhyb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','项目月报审核','/jxzhpt/page/gcgl/zgybsh/gcjdyb_sh.jsp','wqxx',400,200);
}
function tuihyb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','项目月报审核','/jxzhpt/page/gcgl/zgybsh/gcjdyb_th.jsp','wqxx',400,200);
}

function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglxmjd.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'/jxzhpt/gcgl/deleteYb.do',
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

//修改
function xgyb(){
	var zfdk=0;var zfqt=0;var wcdk=0;var wcqt=0;
	if(parent.parent.obj1.XMBM.substr(10,1)=='4'){
		zfdk=$("#zfdkyh").numberbox('getValue');
		zfqt=$("#zfqtyh").numberbox('getValue');
		wcdk=$("#wcdkyh").numberbox('getValue');
		wcqt=$("#wcqtyh").numberbox('getValue');
	}else{
		zfdk=$("#zfdk").numberbox('getValue');
		zfqt=$("#zfqt").numberbox('getValue');
		wcdk=$("#wcdkyh").numberbox('getValue');
		wcqt=$("#wcqtyh").numberbox('getValue');
	}
	var data = "gcglxmjd.zfcgs="+$("#zfcgs").numberbox('getValue')
	+"&gcglxmjd.zfgz="+$("#zfgz").numberbox('getValue')
	+"&gcglxmjd.zfsz="+$("#zfsz").numberbox('getValue')
	+"&gcglxmjd.zfzq="+$("#zfzq").numberbox('getValue')
	+"&gcglxmjd.zfdk="+zfdk
	+"&gcglxmjd.zfjl="+$("#zfjl").numberbox('getValue')
	+"&gcglxmjd.zfqt="+zfqt
	+"&gcglxmjd.zfdfzc="+$("#zfdfzc").numberbox('getValue')
	+"&gcglxmjd.zfyhdk="+$("#zfyhdk").numberbox('getValue')
	+"&gcglxmjd.zfrys="+$("#zfrys").numberbox('getValue')
	+"&gcglxmjd.wccgs="+$("#wccgs").numberbox('getValue')
	+"&gcglxmjd.wcgz="+$("#wcgz").numberbox('getValue')
	+"&gcglxmjd.wcsz="+$("#wcsz").numberbox('getValue')
	+"&gcglxmjd.wczq="+$("#wczq").numberbox('getValue')
	+"&gcglxmjd.wcdk="+wcdk
	+"&gcglxmjd.wcjl="+$("#wcjl").numberbox('getValue')
	+"&gcglxmjd.wcqt="+wcqt
	+"&gcglxmjd.wcdfzc="+$("#wcdfzc").numberbox('getValue')
	+"&gcglxmjd.wcyhdk="+$("#wcyhdk").numberbox('getValue')
	+"&gcglxmjd.wcrys="+$("#wcrys").numberbox('getValue')
	+"&gcglxmjd.yilc="+$("#yilc").numberbox('getValue')+"&gcglxmjd.erlc="+$("#erlc").numberbox('getValue')+"&gcglxmjd.sanlc="+$("#sanlc").numberbox('getValue')+"&gcglxmjd.silc="+$("#silc").numberbox('getValue')
	+"&gcglxmjd.lq="+$("#lq").numberbox('getValue')+"&gcglxmjd.sn="+$("#sn").numberbox('getValue')
	+"&gcglxmjd.bndsslc="+$("#bndsslc").numberbox('getValue')
	+"&gcglxmjd.ssdctc="+$("#ssdctc").numberbox('getValue')
	+"&gcglxmjd.wwcgcl="+$("#wwcgcl").numberbox('getValue')
	+"&gcglxmjd.qksm="+$("#qksm").val()
	+"&gcglxmjd.tbsj="+$("#tbsj").html()+"&gcglxmjd.tbr="+$("#tbr").val()
	+"&gcglxmjd.ybyf="+$("#nf").combobox('getValue')+"-"+$("#yf").combobox('getValue')+"&gcglxmjd.xmbm="+parent.parent.obj1.XMBM+"&gcglxmjd.id="+parent.obj.id;
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcgl/updateYb.do',
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


function showgsdYBlist(){
	var xmbm=parent.obj1.XMBM;
	var yhjb=$.cookie("unit2");
	var sbzt='';
	if(yhjb.length<8&&yhjb.length>=2){
		sbzt='1';
	}
	$('#ybgrid').datagrid({    
	    url:'/jxzhpt/gcgl/selectYbByxmbm.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	'gcglxmjd.xmbm': xmbm,
	    	'gcglxmjd.sbzt':sbzt,
	    	'gcglxmjd.shzt':1
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:300,align:'center',rowspan:3,formatter:function(value,row,index){
	              		if(row.zgshzt==0)
          				return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'已上报    '+'<a href="#" onclick="shenhyb('+index+')" style="color:#3399CC;">未审核    </a>'+'<a href="#" onclick="tuihyb('+index+')" style="color:#3399CC;">退回下级    </a>'+'退回未审核    ';
          				else
          				return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'已上报    '+'已审核    '+'退回下级    '+'<a href="#" onclick="tuihwsh('+index+')" style="color:#3399CC;">退回未审核    </a>';
	              	}},
			        {field:'ybyf',title:'月报月份',width:100,align:'center',rowspan:3},
			        {title:'本月支付资金（万元）',colspan:9},
			        {title:'本月完成资金（万元）',colspan:9},
			        {title:'本月完成里程（公里）',colspan:6},
			        {field:'bndsslc',title:'本年度实施里程（公里）',width:130,align:'center',rowspan:3},
			        {field:'ssdctc',title:'砂石垫层通车（公里）',width:130,align:'center',rowspan:3},
			        {field:'wwcgcl',title:'未完成工程量（公里）',width:130,align:'center',rowspan:3},
			        {field:'qksm',title:'情况说明',width:120,align:'center',rowspan:3},
			        {field:'tbr',title:'填报人',width:120,align:'center',rowspan:3},
			        {field:'tbsj',title:'填报时间',width:100,align:'center',rowspan:3}
	             ],[
	                {field:'zfcgs',title:'车购税 ',width:79,align:'center',rowspan:2},
			        {field:'zfgz',title:'国债 ',width:79,align:'center',rowspan:2},
			        {field:'zfsz',title:'省债',width:79,align:'center',rowspan:2},
			        {field:'zfzq',title:'债券',width:79,align:'center',rowspan:2},
			        {field:'zfdk',title:'贷款',width:79,align:'center',rowspan:2},
			        {field:'zfjl',title:'奖励',width:79,align:'center',rowspan:2},
			        {field:'zfqt',title:'其他',width:79,align:'center',rowspan:2},
			        {field:'zfdfzc',title:'地方自筹',width:79,align:'center',rowspan:2},
			        {field:'zfyhdk',title:'银行贷款',width:79,align:'center',rowspan:2},
			        {field:'wccgs',title:'车购税 ',width:79,align:'center',rowspan:2},
			        {field:'wcgz',title:'国债 ',width:79,align:'center',rowspan:2},
			        {field:'wcsz',title:'省债',width:79,align:'center',rowspan:2},
			        {field:'wczq',title:'债券',width:79,align:'center',rowspan:2},
			        {field:'wcdk',title:'贷款',width:79,align:'center',rowspan:2},
			        {field:'wcjl',title:'奖励',width:79,align:'center',rowspan:2},
			        {field:'wcqt',title:'其他',width:79,align:'center',rowspan:2},
			        {field:'wcdfzc',title:'地方自筹',width:79,align:'center',rowspan:2},
			        {field:'wcyhdk',title:'银行贷款',width:79,align:'center',rowspan:2},
			        {title:'按技术等级',colspan:4},
			        {title:'按路面类型',colspan:2}
			    ],[
					{field:'yilc',title:'一级',width:79,align:'center',rowspan:1},
					{field:'erlc',title:'二级',width:79,align:'center',rowspan:1},
					{field:'sanlc',title:'三级',width:79,align:'center',rowspan:1},
					{field:'silc',title:'四级',width:79,align:'center',rowspan:1},
					{field:'lq',title:'沥青',width:79,align:'center',rowspan:1},
					{field:'sn',title:'水泥',width:79,align:'center',rowspan:1}
			       ]
			    
	    ]
	});
}


function showshYBlist(){
	var xmbm=parent.obj1.XMBM;
	var yhjb=$.cookie("unit2");
	var sbzt='';
	if(yhjb.length<8&&yhjb.length>=2){
		sbzt='1';
	}
	$('#ybgrid').datagrid({    
	    url:'/jxzhpt/gcgl/selectYbByxmbm.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	'gcglxmjd.xmbm': xmbm,
	    	'gcglxmjd.sbzt':sbzt,
	    	'gcglxmjd.shzt':1
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:300,align:'center',rowspan:3,formatter:function(value,row,index){
	              		if(row.zgshzt==0)
          				return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'已上报    '+'<a href="#" onclick="shenhyb('+index+')" style="color:#3399CC;">未审核    </a>'+'<a href="#" onclick="tuihyb('+index+')" style="color:#3399CC;">退回下级    </a>'+'退回未审核    ';
          				else
          				return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'已上报    '+'已审核    '+'退回下级    '+'<a href="#" onclick="tuihwsh('+index+')" style="color:#3399CC;">退回未审核    </a>';
	              	}},
			        {field:'ybyf',title:'月报月份',width:100,align:'center',rowspan:3},
			        {title:'本月支付资金（万元）',colspan:7},
			        {title:'本月完成资金（万元）',colspan:7},
			        {title:'本月完成里程（公里）',colspan:6},
			        {field:'bndsslc',title:'本年度实施里程（公里）',width:130,align:'center',rowspan:3},
			        {field:'ssdctc',title:'砂石垫层通车（公里）',width:130,align:'center',rowspan:3},
			        {field:'wwcgcl',title:'未完成工程量（公里）',width:130,align:'center',rowspan:3},
			        {field:'qksm',title:'情况说明',width:120,align:'center',rowspan:3},
			        {field:'tbr',title:'填报人',width:120,align:'center',rowspan:3},
			        {field:'tbsj',title:'填报时间',width:100,align:'center',rowspan:3}
	             ],[
	                {field:'zfcgs',title:'车购税 ',width:79,align:'center',rowspan:2},
			        {field:'zfgz',title:'国债 ',width:79,align:'center',rowspan:2},
			        {field:'zfsz',title:'省债',width:79,align:'center',rowspan:2},
			        {field:'zfzq',title:'债券',width:79,align:'center',rowspan:2},
			        {field:'zfdk',title:'贷款',width:79,align:'center',rowspan:2},
			        {field:'zfjl',title:'奖励',width:79,align:'center',rowspan:2},
			        {field:'zfqt',title:'其他',width:79,align:'center',rowspan:2},
			        {field:'wccgs',title:'车购税 ',width:79,align:'center',rowspan:2},
			        {field:'wcgz',title:'国债 ',width:79,align:'center',rowspan:2},
			        {field:'wcsz',title:'省债',width:79,align:'center',rowspan:2},
			        {field:'wczq',title:'债券',width:79,align:'center',rowspan:2},
			        {field:'wcdk',title:'贷款',width:79,align:'center',rowspan:2},
			        {field:'wcjl',title:'奖励',width:79,align:'center',rowspan:2},
			        {field:'wcqt',title:'其他',width:79,align:'center',rowspan:2},
			        {title:'按技术等级',colspan:4},
			        {title:'按路面类型',colspan:2}
			    ],[
					{field:'yilc',title:'一级',width:79,align:'center',rowspan:1},
					{field:'erlc',title:'二级',width:79,align:'center',rowspan:1},
					{field:'sanlc',title:'三级',width:79,align:'center',rowspan:1},
					{field:'silc',title:'四级',width:79,align:'center',rowspan:1},
					{field:'lq',title:'沥青',width:79,align:'center',rowspan:1},
					{field:'sn',title:'水泥',width:79,align:'center',rowspan:1}
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


function sbyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglxmjd.id="+data1.id+"&gcglxmjd.xmbm="+parent.obj1.XMBM+"&gcglxmjd.sbzt=1"+"&gcglxmjd.shzt=0"+"&gcglxmjd.zgshzt=0"+"&gcglxmjd.shyj="+"&gcglxmjd.zgshyj="+"&gcglxmjd.thyy=";

	if(confirm("确认上报吗？")){
		$.ajax({
			type:'post',
			url:'/jxzhpt/gcgl/updateYbzt.do',
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
function tuihwsh(index){

	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglxmjd.id="+data1.id+"&gcglxmjd.xmbm="+parent.obj1.XMBM+"&gcglxmjd.sbzt=1"+"&gcglxmjd.shzt=1"+"&gcglxmjd.zgshzt=0"+"&gcglxmjd.shyj="+"&gcglxmjd.zgshyj="+"&gcglxmjd.thyy=";

	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'/jxzhpt/gcgl/updateYbzt.do',
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
