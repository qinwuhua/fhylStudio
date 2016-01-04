var obj=new Object();
var obj1=new Object();
var bz,xxId,sckid;
function jgys(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','交工验收信息','jgys.jsp','wqxx',650,420);
	}
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationXm(data.sddm,data.acdfl);
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
function reload(str){
	 parent.$('#'+str).window('reload');
}
function kaigong(index){
	if(confirm("确认开工吗？")){
		var data=$("#datagrid").datagrid('getRows')[index];
//		alert(data.jhid);
		obj1=data;
		YMLib.UI.createWindow('wqxx','病害隧道开工','bhsdkg.jsp','wqxx',650,330);
	}
}
function ykaigong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','病害隧道开工详情','bhsdkg1.jsp','wqxx',650,330);
}
function wangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','病害隧道完工','bhsdwg.jsp','wqxx',500,300);
		}	
function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','病害隧道未完工','bhsdwwg.jsp','wqxx',400,220);
	}	

function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','病害隧道月报信息','bhsdyb.jsp','wqxx1',1059,467);
}
function AddInfo(){
	var unit=$.cookie("unit2").length;
	if (unit==7) {
		alert("省级用户不能添加！");
		return false;
	}else{
	YMLib.UI.createWindow('wqxxtj','隧道病害月报添加','bhsdybtj.jsp','wqxxtj',900,340);
	}
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','病害隧道月报详情','bhsdybxx.jsp','wqxx',900,340);
}
var ybxiangxi;
function Edityb(index){
	//alert(index);
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	ybxiangxi=data;
	YMLib.UI.createWindow('wqxx','病害隧道月报编辑','bhsdybxg.jsp','wqxx',900,340);
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglbhsd.id="+data1.id+"&gcglbhsd.jhid="+data1.jhid;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteBhsdYb.do',
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
	
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = $("#tj_sbsj").datebox('getValue');
	var sbyf = y+"-"+m;
	var yhjb=$.cookie("unit2");
	var yhtype='';
	if(yhjb.length==11){
		yhtype='县级';
	}
	if(yhjb.length==9){
		yhtype='市级';
	}
	if(yhjb.length==7){
		yhtype='省级';
	}
	
	if($("#tj_wc_btz").val()==''||$("#tj_wc_btz").val()==null){
		alert("请您填入本月完成部投资");
		return;
	}
	if($("#tj_wc_stz").val()==''||$("#tj_wc_stz").val()==null){
		alert("请您填入本月完成省投资");
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
	if(sbsj==null||sbsj==''){
		alert("请填入上报时间！");
		return;
	}
	var data = "gcglbhsd.wc_btz="+$("#tj_wc_btz").val()+"&gcglbhsd.wc_stz="+$("#tj_wc_stz").val()+"&gcglbhsd.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglbhsd.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglbhsd.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglbhsd.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglbhsd.qksm="+$("#tj_qksm").val()+"&gcglbhsd.wcqk="+$("#tj_wcqk").text()
	+"&gcglbhsd.sbsj="+sbsj+"&gcglbhsd.sbyf="+$("#tj_sbyf").val()+"&gcglbhsd.jhid="+parent.parent.obj1.jhid+"&yhtype="+yhtype;
//	+"&gcglbhsd.dwzj_cgs="+$("#dwzj_cgs").val()+"&gcglbhsd.dwzj_rys="+$("#dwzj_rys").val()+"&gcglbhsd.dwzj_cz="+$("#dwzj_cz").val()+"&gcglbhsd.dwzj_gmsptzj="+$("#dwzj_gmsptzj").val()
//	+"&gcglbhsd.wczj_cgs="+$("#wczj_cgs").val()+"&gcglbhsd.wczj_rys="+$("#wczj_rys").val()+"&gcglbhsd.wczj_cz="+$("#wczj_cz").val()+"&gcglbhsd.wczj_gmsptzj="+$("#wczj_gmsptzj").val();
//	alert(data +"----");
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertBhsdYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxxtj');
			}else{
				alert('该日期'+sbsj+'的月报可能已存在，保存失败！');
			}
		}
	});	
}
function xgwqgzyb(){
	var sbsj = $("#xg_sbsj").datebox('getValue');
	if($("#xg_wc_btz").val()==''||$("#xg_wc_btz").val()==null){
		alert("请您填入本月完成部投资");
		return;
	}
	if($("#xg_wc_stz").val()==''||$("#xg_wc_stz").val()==null){
		alert("请您填入本月完成省投资");
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
	if(sbsj==null||sbsj==''){
		alert("请填入上报时间！");
		return;
	}
	var data = "gcglbhsd.wc_btz="+$("#xg_wc_btz").val()+"&gcglbhsd.wc_stz="+$("#xg_wc_stz").val()+"&gcglbhsd.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglbhsd.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglbhsd.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglbhsd.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglbhsd.qksm="+$("#xg_qksm").val()+"&gcglbhsd.wcqk="+$("#xg_wcqk").text()
	+"&gcglbhsd.jhid="+parent.obj.jhid+"&gcglbhsd.id="+parent.obj.id+"&gcglbhsd.sbyf="+$("#xg_sbyf").val()+"&gcglbhsd.sbsj="+sbsj;
//	+"&gcglbhsd.dwzj_cgs="+$("#xg_dwzj_cgs").val()+"&gcglbhsd.dwzj_rys="+$("#xg_dwzj_rys").val()+"&gcglbhsd.dwzj_cz="+$("#xg_dwzj_cz").val()+"&gcglbhsd.dwzj_gmsptzj="+$("#xg_dwzj_gmsptzj").val()
//	+"&gcglbhsd.wczj_cgs="+$("#xg_wczj_cgs").val()+"&gcglbhsd.wczj_rys="+$("#xg_wczj_rys").val()+"&gcglbhsd.wczj_cz="+$("#xg_wczj_cz").val()+"&gcglbhsd.wczj_gmsptzj="+$("#xg_wczj_gmsptzj").val();
//		alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateBhsdYb.do',
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
	var data="gcglbhsd.xdsj="+$("#tj_xdsj").datebox('getValue')+"&gcglbhsd.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglbhsd.yjjgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglbhsd.sgdw="+$("#tj_sgdw").val()+"&gcglbhsd.jldw="+$("#tj_jldw").val()+"&gcglbhsd.jsdw="+$("#tj_jsdw").val()+"&gcglbhsd.xdwh="+$("#tj_xdwh").val()
	+"&gcglbhsd.htje="+$("#tj_htje").val()+"&gcglbhsd.gys="+$("#tj_gys").val()+"&gcglbhsd.jhid="+parent.obj1.jhid;
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertBhsdkg.do',
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
	var data="gcglbhsd.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglbhsd.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertBhsdwg.do',
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
	var data="gcglbhsd.wjgyy="+$("#tj_wjgyy").val()+"&gcglbhsd.jhid="+parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertBhsdwwg.do',
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
	if(yhjb.length==9){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length==7){
		yhtype='省级';
		sfsj=7;
	}
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	var sdmc=$("#sdmc").val();
	var sddm=$("#sddm").val();
	var ybzt=$("#ybzt").val();
	var xmnf=$("#ddlYear").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectBhsdjhList.do',
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
	    	sdmc:sdmc,
	    	sddm:sddm,
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf,
	    	tbbmbm:$.cookie("unit2")
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	if(row.kgzt=='1'){
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ykaigong('+index+')">已开工</a>  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wangong('+index+')">完工</a>  ';
	        	}else
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="kaigong('+index+')">未开工</a>  '+'月报   '+'完工   ';
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
	if(yhjb.length==9){
		yhtype='市级';
		sfsj=9;
	}
	if(yhjb.length==7){
		yhtype='省级';
		sfsj=7;
	}
	//alert(yhjb.length+"----"+yhtype);
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectBhsdYbByJhid.do',
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
	              				if(row.yb_thyj==""||row.yb_thyj==null){
		    			        return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+
		    			        '<a href="#" onclick="Delyb('+index+')">删除</a>   '+'<a href="#" onclick="sbsjyb('+index+')">未上报    </a>'+'未审核    ';
	              				}else{
	              				return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+
	 		    			        '<a href="#" onclick="Delyb('+index+')">删除</a>   '+'<a href="#" onclick="sbsjyb('+index+')" title="退回意见：'+row.yb_thyj+'">未上报(退回)    </a>'+'未审核    ';
	              				}	
    			        if(row.shzt=='未审核'&&row.sfsj!=11)
		    			    return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑    '+'删除    '+'已上报    '+'已审核    ';

	              		}
	              		if(yhtype=='市级'){
	              			if(row.shzt=='未审核'&&row.sfsj==9)
	              				if(row.yb_thyj==""||row.yb_thyj==null){
	    			        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除    </a>'+
	    			        	'<a href="#" onclick="sbsjyb('+index+')">未上报    </a>'+'未审核    ';
	              				}else{
	              				return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除    </a>'+
		    			        	'<a href="#" onclick="sbsjyb('+index+')" title="退回意见：'+row.yb_thyj+'">未上报(退回)    </a>'+'未审核    ';
		              					
	              				}
	    			        if(row.shzt=='未审核'&&row.sfsj!=9)
	    	              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'删除   '+'已上报    '+'未审核    ';
	              			if(row.shzt=='已审核')
	              				return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑    '+'删除    '+'已上报    '+'已审核    ';
	              		}
	              		if(yhtype=='省级'){
	              			return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
	              		}
	              	}},
			        {field:'sbyf',title:'上报月份',width:70,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:82,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:90,align:'center',rowspan:2}
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadBhsdFile.do"+'&flag='+'gljsjyhgl%2fwqgz%2fwqgzxx'+'&type='+str+'&jhid='+parent.obj1.jhid,
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
		url:'../../../../gcgl/deleteBhsdFile.do',
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
function sbsjyb(index){
	var yhjb=$.cookie("unit2");
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data='';
	if(yhjb.length==11){
		data="gcglbhsd.id="+data1.id+"&gcglbhsd.sfsj=9"+"&gcglbhsd.yhtype=11"+"&gcglbhsd.jhid="+data1.jhid+
		"&gcglbhsd.yb_thyj="+"";
	}
	if(yhjb.length==9){
		data="gcglbhsd.id="+data1.id+"&gcglbhsd.sfsj=7"+"&gcglbhsd.yhtype=9"+"&gcglbhsd.jhid="+data1.jhid+
		"&gcglbhsd.yb_thyj="+"";
	}
	if(confirm("确认上报吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbBhsdYb.do',
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

function th_ybgl(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('gcgl_th','退回项目','bhsd_th.jsp','gcgl_th','500','200');
}

function thsjyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglbhsd.id="+data1.id+"&gcglbhsd.sfsj=6"+"&gcglbhsd.yhtype=4"+"&gcglbhsd.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbBhsdYb.do',
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