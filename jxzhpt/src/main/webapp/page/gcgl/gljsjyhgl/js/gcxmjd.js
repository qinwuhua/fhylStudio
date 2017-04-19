

var obj=new Object();
var obj1=new Object();

//设置月报年份
function ybnf(id,value){
	var myDate = new Date();
	var years=[];
	for(var i=2011;i<=2020;i++){
		years.push({text:(i),value:(i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    editable:false,
	    onSelect:function(){
	    	getbyzjdw();
		}
	});
	if(value==null||value=='')
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
	else $('#'+id).combobox("setValue",value+'');
}
//设置月报月份
function ybyf(id,value){
	var myDate = new Date();
	var years=[];
	for(var i=1;i<=12;i++){
		if(i<=9)
		years.push({text:("0"+i),value:("0"+i)});
		else
			years.push({text:(""+i),value:(""+i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    editable:false,
	    onSelect:function(){
	    	getbyzjdw();
		}
	});
	if(value==null||value=='')
		$('#'+id).combobox("setValue",myDate.getMonth()+1);
		else $('#'+id).combobox("setValue",value+'');
}
//获取本月到位资金
function getbyzjdw(str){
	var xmbm="";var ybyf="";
	if(str=='xx'){
		xmbm=parent.obj1.XMBM;
		ybyf=parent.obj.ybyf;
	}else{
		xmbm=parent.parent.obj1.XMBM;
		ybyf=$("#nf").combobox('getValue')+'-'+$("#yf").combobox('getValue');
	}
	var data="gcglxmjd.xmbm="+xmbm+"&gcglxmjd.ybyf="+ybyf;
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcgl/getbyzjdw.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				$("#dwcgs").numberbox('setValue',msg.dwcgs);
				$("#dwgz").numberbox('setValue',msg.dwgz);
				$("#dwsz").numberbox('setValue',msg.dwsz);
				$("#dwzq").numberbox('setValue',msg.dwzq);
				$("#dwdk").numberbox('setValue',msg.dwdk);
				$("#dwjl").numberbox('setValue',msg.dwjl);
				$("#dwqt").numberbox('setValue',msg.dwqt);
				$("#dwdfzc").numberbox('setValue',msg.dwdfzc);
				$("#dwyhdk").numberbox('setValue',msg.dwyhdk);
				$("#dwrys").numberbox('setValue',msg.dwrys);
				$("#dwdkyh").numberbox('setValue',msg.dwdk);
				$("#dwqtyh").numberbox('setValue',msg.dwqt);
			}else{
				$("#dwcgs").numberbox('setValue',0);
				$("#dwgz").numberbox('setValue',0);
				$("#dwsz").numberbox('setValue',0);
				$("#dwzq").numberbox('setValue',0);
				$("#dwdk").numberbox('setValue',0);
				$("#dwjl").numberbox('setValue',0);
				$("#dwqt").numberbox('setValue',0);
				$("#dwdfzc").numberbox('setValue',0);
				$("#dwyhdk").numberbox('setValue',0);
				$("#dwrys").numberbox('setValue',0);
				$("#dwdkyh").numberbox('setValue',0);
				$("#dwqtyh").numberbox('setValue',0);
			}
		}
	});
	
	
}

function closes(str){
	 parent.$('#'+str).window('destroy');
}


function AddInfo(){
	YMLib.UI.createWindow('wqxx','项目月报添加','gcjdybtj.jsp','wqxx',850,370);
	//window.open("gcgzsjybtj.jsp");
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
					shezhi();
					$("#ybgrid").datagrid('reload');
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}
//添加月报
function tjyb(){
	
	var yhjb=$.cookie("unit2");
	var zfdk=0;var zfqt=0;var wcdk=0;var wcqt=0;var sbzt='0';
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
	if(yhjb.length<8&&yhjb.length>=2){
		sbzt='1';
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
	+"&gcglxmjd.ybyf="+$("#nf").combobox('getText')+"-"+$("#yf").combobox('getText')+"&gcglxmjd.xmbm="+parent.parent.obj1.XMBM+"&gcglxmjd.sbzt="+sbzt;
	
	//alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcgl/insertYb.do',
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
	+"&gcglxmjd.ybyf="+$("#nf").combobox('getText')+"-"+$("#yf").combobox('getText')+"&gcglxmjd.xmbm="+parent.parent.obj1.XMBM+"&gcglxmjd.id="+parent.obj.id;
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
	    	'gcglxmjd.sbzt':sbzt
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:250,align:'center',rowspan:3,formatter:function(value,row,index){
	              		
	              		if(yhjb.length<8&&yhjb.length>=2){
	              			if(row.shzt==0){
	              				if(row.thyy!=null&&row.thyy!='')
	              				return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')" style="color:#3399CC;">删除</a>   '+'已上报    '+'未审核    '+'<a href="javascript:showStr('+"'"+row.thyy+"'"+')"  style="color:#3399CC;">退回原因</a>    ';
	              				else
		              			return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')" style="color:#3399CC;">删除</a>   '+'已上报    '+'未审核    '+'退回原因    ';
	              			}
	              			else
		              		return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'已审核    '+'退回原因    ';
	              			
	              		}else{
	              			if(row.sbzt==0){
	              				if(row.thyy!=null&&row.thyy!='')
		              			return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')" style="color:#3399CC;">删除</a>   '+'<a href="#" onclick="sbyb('+index+')" style="color:#3399CC;">未上报    </a>'+'未审核    '+'<a href="javascript:showStr('+"'"+row.thyy+"'"+')"  style="color:#3399CC;">退回原因</a>    ';
	              				else
			              		return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')" style="color:#3399CC;">删除</a>   '+'<a href="#" onclick="sbyb('+index+')" style="color:#3399CC;">未上报    </a>'+'未审核    '+'退回原因    ';
	              			}
	              			else{
	              				
	              				if(row.shzt==0)
	    	              			return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'未审核    '+'退回原因    ';
	              				else
	              					return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'已审核    '+'退回原因    ';
	              			}
	              		}
	              		
	              		
	              	}},
			        {field:'ybyf',title:'月报月份',width:100,align:'center',rowspan:3},
//			        {title:'本月支付资金（万元）',colspan:9},
			        {field:'wccgs',title:'本月完成资金（万元）',width:130,align:'center',rowspan:3},
			        {title:'本月完成里程（公里）',colspan:6},
//			        {field:'bndsslc',title:'本年度实施里程（公里）',width:130,align:'center',rowspan:3},
			        {field:'ssdctc',title:'完成垫层里程（公里）',width:130,align:'center',rowspan:3},
			        {field:'wwcgcl',title:'未完成工程量（公里）',width:130,align:'center',rowspan:3},
			        {field:'qksm',title:'情况说明',width:120,align:'center',rowspan:3},
			        {field:'tbr',title:'填报人',width:120,align:'center',rowspan:3},
			        {field:'tbsj',title:'填报时间',width:100,align:'center',rowspan:3}
	             ],[
//	                {field:'zfcgs',title:'车购税 ',width:79,align:'center',rowspan:2},
//			        {field:'zfgz',title:'国债 ',width:79,align:'center',rowspan:2},
//			        {field:'zfsz',title:'省债',width:79,align:'center',rowspan:2},
//			        {field:'zfzq',title:'债券',width:79,align:'center',rowspan:2},
//			        {field:'zfdk',title:'贷款',width:79,align:'center',rowspan:2},
//			        {field:'zfjl',title:'奖励',width:79,align:'center',rowspan:2},
//			        {field:'zfqt',title:'其他',width:79,align:'center',rowspan:2},
//			        {field:'zfdfzc',title:'地方自筹',width:79,align:'center',rowspan:2},
//			        {field:'zfyhdk',title:'银行贷款',width:79,align:'center',rowspan:2},
//			        {field:'wccgs',title:'车购税 ',width:79,align:'center',rowspan:2},
//			        {field:'wcgz',title:'国债 ',width:79,align:'center',rowspan:2},
//			        {field:'wcsz',title:'省债',width:79,align:'center',rowspan:2},
//			        {field:'wczq',title:'债券',width:79,align:'center',rowspan:2},
//			        {field:'wcdk',title:'贷款',width:79,align:'center',rowspan:2},
//			        {field:'wcjl',title:'奖励',width:79,align:'center',rowspan:2},
//			        {field:'wcqt',title:'其他',width:79,align:'center',rowspan:2},
//			        {field:'wcdfzc',title:'地方自筹',width:79,align:'center',rowspan:2},
//			        {field:'wcyhdk',title:'银行贷款',width:79,align:'center',rowspan:2},
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
	    	'gcglxmjd.sbzt':sbzt
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:250,align:'center',rowspan:3,formatter:function(value,row,index){
	              		
	              		if(yhjb.length<8&&yhjb.length>=2){
	              			if(row.shzt==0){
	              				if(row.thyy!=null&&row.thyy!='')
	              				return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')" style="color:#3399CC;">删除</a>   '+'已上报    '+'未审核    '+'<a href="javascript:showStr('+"'"+row.thyy+"'"+')"  style="color:#3399CC;">退回原因</a>    ';
	              				else
		              			return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')" style="color:#3399CC;">删除</a>   '+'已上报    '+'未审核    '+'退回原因    ';
	              			}
	              			else
		              		return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'已审核    '+'退回原因    ';
	              			
	              		}else{
	              			if(row.sbzt==0){
	              				if(row.thyy!=null&&row.thyy!='')
		              			return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')" style="color:#3399CC;">删除</a>   '+'<a href="#" onclick="sbyb('+index+')" style="color:#3399CC;">未上报    </a>'+'未审核    '+'<a href="javascript:showStr('+"'"+row.thyy+"'"+')"  style="color:#3399CC;">退回原因</a>    ';
	              				else
			              		return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'<a href="#" onclick="Edityb('+index+')" style="color:#3399CC;">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')" style="color:#3399CC;">删除</a>   '+'<a href="#" onclick="sbyb('+index+')" style="color:#3399CC;">未上报    </a>'+'未审核    '+'退回原因    ';
	              			}
	              			else{
	              				
	              				if(row.shzt==0)
	    	              			return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'未审核    '+'退回原因    ';
	              				else
	              					return '<a href="#" onclick="ShowybInfo('+index+')" style="color:#3399CC;">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'已审核    '+'退回原因    ';
	              			}
	              		}
	              		
	              		
	              	}},
			        {field:'ybyf',title:'月报月份',width:100,align:'center',rowspan:3},
//			        {title:'本月支付资金（万元）',colspan:7},
			        {field:'wccgs',title:'本月完成资金（万元）',width:130,align:'center',rowspan:3},
			        {title:'本月完成里程（公里）',colspan:6},
//			        {field:'bndsslc',title:'本年度实施里程（公里）',width:130,align:'center',rowspan:3},
			        {field:'ssdctc',title:'完成垫层里程（公里）',width:130,align:'center',rowspan:3},
			        {field:'wwcgcl',title:'未完成工程量（公里）',width:130,align:'center',rowspan:3},
			        {field:'qksm',title:'情况说明',width:120,align:'center',rowspan:3},
			        {field:'tbr',title:'填报人',width:120,align:'center',rowspan:3},
			        {field:'tbsj',title:'填报时间',width:100,align:'center',rowspan:3}
	             ],[
//	                {field:'zfcgs',title:'车购税 ',width:79,align:'center',rowspan:2},
//			        {field:'zfgz',title:'国债 ',width:79,align:'center',rowspan:2},
//			        {field:'zfsz',title:'省债',width:79,align:'center',rowspan:2},
//			        {field:'zfzq',title:'债券',width:79,align:'center',rowspan:2},
//			        {field:'zfdk',title:'贷款',width:79,align:'center',rowspan:2},
//			        {field:'zfjl',title:'奖励',width:79,align:'center',rowspan:2},
//			        {field:'zfqt',title:'其他',width:79,align:'center',rowspan:2},
//			        {field:'wccgs',title:'车购税 ',width:79,align:'center',rowspan:2},
//			        {field:'wcgz',title:'国债 ',width:79,align:'center',rowspan:2},
//			        {field:'wcsz',title:'省债',width:79,align:'center',rowspan:2},
//			        {field:'wczq',title:'债券',width:79,align:'center',rowspan:2},
//			        {field:'wcdk',title:'贷款',width:79,align:'center',rowspan:2},
//			        {field:'wcjl',title:'奖励',width:79,align:'center',rowspan:2},
//			        {field:'wcqt',title:'其他',width:79,align:'center',rowspan:2},
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
