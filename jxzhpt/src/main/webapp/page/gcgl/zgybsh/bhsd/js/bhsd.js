var obj=new Object();
var obj1=new Object();
var bz,xxId,sckid;
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationXm(data.qlbh,data.akjfl);
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.Var.jhbm=data.id;
	YMLib.UI.createWindow('wq_xx','病害隧道',"/jxzhpt/page/jhgl/jhkxx/bhsd.jsp",'wq_xx',1000,500);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','病害隧道月报详情','bhsdybxx.jsp','wqxx',900,430);
}
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','病害隧道月报列表','bhsdyb.jsp','wqxx1',1059,480);
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报编辑','wqgzybxg.jsp','wqxx',650,350);
}

//审核
function ybsh(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报审核','wqgzybsh.jsp','wqxx',450,200);
}
function zgshbhsdyb(index){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var data = "gcglgcgzgj.zgshyj="+$("#zgshyj").val()
	+"&gcglgcgzgj.zgshtime="+sbsj+"&gcglgcgzgj.zgshuser="+$("#shuser").val()
	+"&gcglgcgzgj.jhid="+parent.obj.jhid+"&gcglgcgzgj.id="+parent.obj.id
	+"&gcglgcgzgj.table=gcgl_bhsd";
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/zgshYb.do',
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

function xgwqgzyb(){
	var data = "gcglbhsd.wc_btz="+$("#xg_wc_btz").val()+"&gcglbhsd.wc_stz="+$("#xg_wc_stz").val()+"&gcglbhsd.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglbhsd.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglbhsd.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglbhsd.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglbhsd.bywcmc="+$("#xg_bywcmc").val()+"&gcglbhsd.kgdl="+$("#xg_kgdl").val()+"&gcglbhsd.qksm="+$("#xg_qksm").val()+"&gcglbhsd.wcqk="+$("#xg_wcqk").val()
	+"&gcglbhsd.jhid="+parent.obj.jhid+"&gcglbhsd.id="+parent.obj.id;
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
//显示所有
var wqData;
function showAll(){
	var xmnf=$("#ddlYear").val();
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
	var kgzt='';
	var jgzt='0';
	var lxmc=$("#lxmc").val();
	var sdmc=$("#sdmc").val();
	var sddm=$("#sddm").val();
	var yhjb=$.cookie("unit2").replace(/_/g,"");
	var sfsj='';
	if(yhjb.length==11){
		yhtype='县级';
		sfsj=11;
	}
	if(yhjb.length==9){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length==7){
		yhtype='省级';
		sfsj=7;
	}
	var ybzt=$("#ybzt").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectBhsdjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.31,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	sdmc:sdmc,
	    	sddm:sddm,
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="wqxiangxi('+index+')">详细</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="ybsb('+index+')">月报审核</a>    ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'sddm',title:'隧道代码',width:120,align:'center'},
	        {field:'sdmc',title:'隧道名称',width:120,align:'center'},
	        {field:'sdzxzh',title:'隧道中心桩号',width:100,align:'center'},
	        {field:'sdcd',title:'隧道长度',width:80,align:'center'},
	        {field:'sdkd',title:'隧道宽度',width:80,align:'center'},
	        {field:'sdgd',title:'隧道高度',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}
function ybysh(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglwqgz.jhid="+data1.jhid+"&gcglwqgz.xmlx=gcgl_bhsd"+"&gcglwqgz.id="+data1.id;
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcgl/zgybyshbwsh.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				$("#ybgrid").datagrid('reload');
			}
		}
	});	
}
function showYBlist(){
	
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selBhsdZgYbByJhid.do?jhid='+parent.obj1.jhid,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
	              		if(row.shzt=='已审核'&&row.sfsj==7&&row.zgshzt==''&& $.cookie("unit2").length==7 || row.shzt=='已审核'&&row.sfsj==7&&row.zgshzt=='未审核'&& $.cookie("unit2").length==7)
			        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="ybsh('+index+')">未审核</a>   '+'<a href="#" onclick="thsjyb('+index+')">退回</a>';
	              		else if(row.zgshzt=='已审核')
	              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="ybysh('+index+')">已审核</a>'+'退回   ';
	              		else{
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+
	              			'<a style="text-decoration:none;color:black;" >未审核</a>   '+
	              			'<a style="text-decoration:none;color:black;" >退回</a>';}
	              	}},
			        {field:'sbyf',title:'上报月份',width:120,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:130,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:100,align:'center',rowspan:2}
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

function th_ybsh(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('gcgl_th','退回项目','bhsd_th.jsp','gcgl_th','500','200');
}

function thsjyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglgcgzgj.id="+data1.id+"&gcglgcgzgj.sfsj=4"
	+"&gcglgcgzgj.table=gcgl_bhsd"
	+"&gcglgcgzgj.yhtype=2"+"&gcglgcgzgj.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/zgthYb.do',
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
					$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=jgyswj'+"&jhid="+parent.obj1.jhid);
				}
			}
	});	
}