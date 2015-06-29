var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function reload(str){
	 parent.$('#'+str).window('reload');
}
function kaigong(index){
	if(confirm("确认开工吗？")){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','危桥改造开工','wqgzkg.jsp','wqxx',650,330);
	}
}
	function wangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','危桥改造完工','wqgzwg.jsp','wqxx',500,300);
		}	
	function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','危桥改造未完工','wqgzwwg.jsp','wqxx',400,220);
	}	

function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','危桥改造月报信息','wqgzyb.jsp','wqxx1',1059,450);
	//window.open("wqgzyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxxtj','危桥改造月报添加','wqgzybtj.jsp','wqxxtj',650,350);
	//window.open("wqgzybtj.jsp");
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报详情','wqgzybxx.jsp','wqxx',700,430);
	//window.open("wqgzybxx.jsp");
}
var ybxiangxi;
function Edityb(index){
	//alert(index);
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	ybxiangxi=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报编辑','wqgzybxg.jsp','wqxx',650,350);
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglwqgz.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteWqgzYb.do',
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
function tjwqgzyb(){
	if($("#tj_wc_btz").val()==''||$("#tj_wc_btz").val()==null){
		alert("请您填入本月完成部投资");
		return;
	}
	if($("#tj_wc_qttz").val()==''||$("#tj_wc_qttz").val()==null){
		alert("请您填入本月完成其他投资");
		return;
	}
	if($("#tj_zjdw_qttz").val()==''||$("#tj_zjdw_qttz").val()==null){
		alert("请您填入本月到位其他投资");
		return;
	}
	if($("#tj_bywcmc").val()==''||$("#tj_bywcmc").val()==null){
		alert("请您填入本月完成面层");
		return;
	}
	if($("#tj_wcqk").val()==''||$("#tj_wcqk").val()==null||$("#tj_wcqk").val().substr(0,1)=='>'){
		alert("请您填入本月完成情况");
		return;
	}
	if($("#tj_kgdl").val()==''||$("#tj_kgdl").val()==null){
		alert("请您填入截至开工段落");
		return;
	}
	if($("#tj_sbyf").val()==''||$("#tj_sbyf").val()==null){
		alert("请您等待上级拨付车购税再上报");
		return;
	}
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
	if(yhjb.length==9||yhjb.length==8||yhjb.length==2){
		yhtype='市级';
	}
	if(yhjb.length<8&&yhjb.length>2){
		yhtype='省级';
	}
	
	var data = "gcglwqgz.wc_btz="+$("#tj_wc_btz").val()+"&gcglwqgz.wc_stz="+$("#tj_wc_stz").val()+"&gcglwqgz.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglwqgz.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglwqgz.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglwqgz.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglwqgz.bywcmc="+$("#tj_bywcmc").val()+"&gcglwqgz.kgdl="+$("#tj_kgdl").val()+"&gcglwqgz.qksm="+$("#tj_qksm").val()+"&gcglwqgz.wcqk="+$("#tj_wcqk").val()
	+"&gcglwqgz.sbsj="+sbsj+"&gcglwqgz.sbyf="+$("#tj_sbyf").find("option:selected").text()+"&gcglwqgz.jhid="+parent.parent.obj1.jhid+"&yhtype="+yhtype;
	//alert(data +"----"+$("#tj_sbyf").val());
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxxtj');
			}else{
				alert('该月月报可能已存在，保存失败！');
			}
		}
	});	
}
function xgwqgzyb(){
	if($("#xg_wc_btz").val()==''||$("#xg_wc_btz").val()==null){
		alert("请您填入本月完成部投资");
		return;
	}
	if($("#xg_wc_qttz").val()==''||$("#xg_wc_qttz").val()==null){
		alert("请您填入本月完成其他投资");
		return;
	}
	if($("#xg_zjdw_qttz").val()==''||$("#xg_zjdw_qttz").val()==null){
		alert("请您填入本月到位其他投资");
		return;
	}
	if($("#xg_bywcmc").val()==''||$("#xg_bywcmc").val()==null){
		alert("请您填入本月完成面层");
		return;
	}
	if($("#xg_wcqk").val()==''||$("#xg_wcqk").val()==null){
		alert("请您填入本月完成情况");
		return;
	}
	if($("#xg_kgdl").val()==''||$("#xg_kgdl").val()==null){
		alert("请您填入截至开工段落");
		return;
	}
	if($("#xg_sbyf").val()==''||$("#xg_sbyf").val()==null){
		alert("请您等待上级拨付车购税再上报");
		return;
	}
	var data = "gcglwqgz.wc_btz="+$("#xg_wc_btz").val()+"&gcglwqgz.wc_stz="+$("#xg_wc_stz").val()+"&gcglwqgz.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglwqgz.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglwqgz.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglwqgz.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglwqgz.bywcmc="+$("#xg_bywcmc").val()+"&gcglwqgz.kgdl="+$("#xg_kgdl").val()+"&gcglwqgz.qksm="+$("#xg_qksm").val()+"&gcglwqgz.wcqk="+$("#xg_wcqk").val()
	+"&gcglwqgz.jhid="+parent.obj.jhid+"&gcglwqgz.id="+parent.obj.id+"&gcglwqgz.sbyf="+$("#xg_sbyf").find("option:selected").text();
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateWqgzYb.do',
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
	var data="gcglwqgz.xdsj="+$("#tj_xdsj").datebox('getValue')+"&gcglwqgz.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglwqgz.yjjgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglwqgz.sgdw="+$("#tj_sgdw").val()+"&gcglwqgz.jldw="+$("#tj_jldw").val()+"&gcglwqgz.jsdw="+$("#tj_jsdw").val()
	+"&gcglwqgz.htje="+$("#tj_htje").val()+"&gcglwqgz.gys="+$("#tj_gys").val()+"&gcglwqgz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzkg.do',
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
	var data="gcglwqgz.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglwqgz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzwg.do',
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
	var data="gcglwqgz.wjgyy="+$("#tj_wjgyy").val()+"&gcglwqgz.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzwwg.do',
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
//显示所有
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
	var jgzt='0';
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
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	var ybzt=$("#ybzt").val();
	var xmnf=$("#ddlYear").val();
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/gcgl/selectWqgzjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		return '<a href=javascript:locationQl("'+row.qlbh+'","'+row.qlzxzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '
	        		+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'已开工  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   ';
	        	}else
	        	return '<a href=javascript:locationQl("'+row.qlbh+'","'+row.qlzxzh+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '
	        	+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'未开工  ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}
var ybxx;
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
	//alert(yhjb.length+"----"+yhtype);
	$('#ybgrid').datagrid({    
	    url:'/jxzhpt/gcgl/selectWqgzYbByJhid.do',
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
	              	{field:'c',title:'操作',width:213,align:'center',rowspan:2,formatter:function(value,row,index){
	              		
	              		if(yhtype=='县级'){
	              			if(row.shzt=='未审核'&&row.sfsj==11)
    			        return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'未上报    '+'未审核    ';
	              			if(row.shzt=='未审核'&&row.sfsj!=11)
		    			    return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'已上报    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'已上报    '+'已审核    ';

	              		}
	              		if(yhtype=='市级'){
	              			if(row.shzt=='未审核'&&row.sfsj==9)
	    			        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'未上报    '+'未审核    ';
	              			if(row.shzt=='未审核'&&row.sfsj!=9)
	    	              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'已上报    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              				return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'已上报    '+'已审核    ';
	              		}
	              		if(yhtype=='省级'){
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
	              		}
	              	}},
			        {field:'sbyf',title:'上报月份',width:70,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:82,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:122,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:85,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:2},
			        {title:'本月资金到位（万元）',colspan:2},
			        {field:'qksm',title:'情况说明',width:90,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			      //  {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			      //  {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadWqgzFile.do"+'&flag='+'gljsjyhgl%2fwqgz%2fwqgzxx'+'&type='+str+'&jhid='+parent.obj1.jhid,
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
//	if($("#xz_"+str).text()!='暂无附件'){
//		parent.window.location.href="www.baidu.com";
//		//parent.window.location.href="../../../../gcgl/downWqgzFile.do?type="+str+"&jhid="+parent.obj1.jhid;
//	}
//	else return;
//}
function deleteFile(str){
	if($("#xz_"+str).text()=='暂无附件'){
		return;
	}
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.jhid+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteWqgzFile.do',
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
function jiazaifujian(data1){
	//alert(data1);
	var data=data1;

	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectWqgzjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text(msg.sgxkwj);
					$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=sgxkwj'+"&jhid="+parent.obj1.jhid);
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text(msg.jgtcwj);
					$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=jgtcwj'+"&jhid="+parent.obj1.jhid);
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text(msg.jgyswj);
					$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=jgyswj'+"&jhid="+parent.obj1.jhid);
				}
			}
	});	
}
function sbsjyb(index){
	var yhjb=$.cookie("unit2");
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data='';
	if(yhjb.length==11){
		data="gcglwqgz.id="+data1.id+"&gcglwqgz.sfsj=9"+"&gcglwqgz.yhtype=11"+"&gcglwqgz.jhid="+data1.jhid;
	}
	if(yhjb.length==9||yhjb.length==8){
		data="gcglwqgz.id="+data1.id+"&gcglwqgz.sfsj=7"+"&gcglwqgz.yhtype=9"+"&gcglwqgz.jhid="+data1.jhid;
	}
	if(confirm("确认上报吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbWqgzYb.do',
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
	var data="gcglwqgz.id="+data1.id+"&gcglwqgz.sfsj=11"+"&gcglwqgz.yhtype=9"+"&gcglwqgz.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbWqgzYb.do',
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