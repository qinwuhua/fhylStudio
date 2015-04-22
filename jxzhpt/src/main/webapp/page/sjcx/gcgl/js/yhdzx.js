var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','养护大中修开工详情','yhdzxxx.jsp','wqxx',740,450);
	//window.open("yhdzxxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function kaigong(index){
	if(confirm("确认开工吗？")){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','养护大中修开工','wqgzkg.jsp','wqxx',650,330);
	}
}
	function wangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
			YMLib.UI.createWindow('wqxx','养护大中修完工','wqgzwg.jsp','wqxx',500,300);
		}	
	function wwangong(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		obj1=data;
		YMLib.UI.createWindow('wqxx','养护大中修未完工','wqgzwwg.jsp','wqxx',400,220);
	}	
	
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','养护大中修月报信息','yhdzxyb.jsp','wqxx1',1059,450);
}
function AddInfo(){
	YMLib.UI.createWindow('wqxx','养护大中修月报添加','yhdzxybtj.jsp','wqxx',680,360);
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','养护大中修月报详情','yhdzxybxx.jsp','wqxx',700,430);
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','养护大中修月报编辑','yhdzxybxg.jsp','wqxx',680,360);
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglyhdzx.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteYhdzxYb.do',
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
function tjyhdzxyb(){
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
	}
	if($("#tj_wc_btz").val()==''){
		alert("请填入本月完成部投资");
		return;
	}
	if($("#tj_bywcdc").val()==''){
		alert("请填入本月完成垫层");
		return;
	}
	if($("#tj_bywcjc").val()==''){
		alert("请填入本月完成基层");
		return;
	}
	if($("#tj_bywcmc").val()==''){
		alert("请填入本月完成面层");
		return;
	}
	if($("#tj_wcqk").val()==''){
		alert("请填入本月完成情况");
		return;
	}
	var data = "gcglyhdzx.wc_btz="+$("#tj_wc_btz").val()+"&gcglyhdzx.wc_stz="+$("#tj_wc_stz").val()+"&gcglyhdzx.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglyhdzx.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglyhdzx.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglyhdzx.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglyhdzx.bywcdc="+$("#tj_bywcdc").val()+"&gcglyhdzx.bywcjc="+$("#tj_bywcjc").val()+"&gcglyhdzx.bywcmc="+$("#tj_bywcmc").val()+"&gcglyhdzx.kgdl="+$("#tj_kgdl").val()
	+"&gcglyhdzx.qksm="+$("#tj_qksm").val()+"&gcglyhdzx.wcqk="+$("#tj_wcqk").val()
	+"&gcglyhdzx.sbsj="+sbsj+"&gcglyhdzx.sbyf="+$("#tj_sbyf").find("option:selected").text()+"&gcglyhdzx.jhid="+parent.parent.obj1.id+"&yhtype="+yhtype;
	
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertYhdzxYb.do',
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
function xgyhdzxyb(){
	if($("#xg_wc_btz").val()==''){
		alert("请填入本月完成部投资");
		return;
	}
	if($("#xg_bywcdc").val()==''){
		alert("请填入本月完成垫层");
		return;
	}
	if($("#xg_bywcjc").val()==''){
		alert("请填入本月完成基层");
		return;
	}
	if($("#xg_bywcmc").val()==''){
		alert("请填入本月完成面层");
		return;
	}
	if($("#xg_wcqk").val()==''){
		alert("请填入本月完成情况");
		return;
	}
	var data = "gcglyhdzx.wc_btz="+$("#xg_wc_btz").val()+"&gcglyhdzx.wc_stz="+$("#xg_wc_stz").val()+"&gcglyhdzx.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglyhdzx.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglyhdzx.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglyhdzx.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglyhdzx.bywcdc="+$("#xg_bywcdc").val()+"&gcglyhdzx.bywcjc="+$("#xg_bywcjc").val()+"&gcglyhdzx.bywcmc="+$("#xg_bywcmc").val()+"&gcglyhdzx.kgdl="+$("#xg_kgdl").val()
	+"&gcglyhdzx.qksm="+$("#xg_qksm").val()+"&gcglyhdzx.wcqk="+$("#xg_wcqk").val()
	+"&gcglyhdzx.jhid="+parent.obj.jhid+"&gcglyhdzx.id="+parent.obj.id+"&gcglyhdzx.sbyf="+$("#xg_sbyf").find("option:selected").text();
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
	var data="gcglyhdzx.jhxdsj="+$("#tj_xdsj").datebox('getValue')+"&gcglyhdzx.sjkgsj="+$("#tj_sjkgsj").datebox('getValue')+"&gcglyhdzx.yjwgsj="+$("#tj_yjjgsj").datebox('getValue')
	+"&gcglyhdzx.sgdw="+$("#tj_sgdw").val()+"&gcglyhdzx.jldw="+$("#tj_jldw").val()+"&gcglyhdzx.jsdw="+$("#tj_jsdw").val()
	+"&gcglyhdzx.htje="+$("#tj_htje").val()+"&gcglyhdzx.gys="+$("#tj_gys").val()+"&gcglyhdzx.jhid="+parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertYhdzxkg.do',
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
	var data="gcglyhdzx.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglyhdzx.jhid="+parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertYhdzxwg.do',
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
	var data="gcglyhdzx.wjgyy="+$("#tj_wjgyy").val()+"&gcglyhdzx.jhid="+parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertYhdzxwwg.do',
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
	var gydw1=$("#gydw").combotree("getValues");
	if(gydw1.length==0){
		gydw1str=$.cookie("unit2");
	}else{
		gydw1str=gydw1.join(',');
	}
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
	    url:'/jxzhpt/gcgl/selectYhdzxjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydw1str,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:ybzt,
	    	sfsj:sfsj,
	    	xmnf:xmnf
		},
	    columns:[[
              {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
  	        	if(row.kgzt=='1'){
  	        		return '<a href=javascript:locationXm("'+row.lxbm+'") style="text-decoration:none;color:#3399CC;">定位</a>    '
  	        		+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'已开工  '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="ybsb('+index+')">月报</a>   ';
  	        	}else
  	        	return '<a href=javascript:locationXm("'+row.lxbm+'") style="text-decoration:none;color:#3399CC;">定位</a>    '
  	        	+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'未开工  ';
  	        }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'hdhlc',title:'核对里程',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:80,align:'center'},
	        {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
	        {field:'classify',title:'工程分类',width:80,align:'center'},
	        {field:'totalinvest',title:'总投资',width:60,align:'center'},
	        {field:'totalsubsidyfund',title:'总补助资金',width:90,align:'center'}
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
	    url:'/jxzhpt/gcgl/selectYhdzxYbByJhid.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    queryParams: {
	    	jhid: jhid,
	    	yhtype:yhtype,
	    	sfsj:sfsj,
		},
	    columns:[
	             [
	              	{field:'c',title:'操作',width:250,align:'center',rowspan:2,formatter:function(value,row,index){
	              		
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
			       // {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			       // {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
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
				$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
			}
			}
	});	
}
function sbsjyb(index){
	var yhjb=$.cookie("unit2");
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data='';
	if(yhjb.length==11){
		data="gcglyhdzx.id="+data1.id+"&gcglyhdzx.sfsj=9"+"&gcglyhdzx.yhtype=11"+"&gcglyhdzx.jhid="+data1.jhid;
	}
	if(yhjb.length==9||yhjb.length==8||yhjb.length==2){
		data="gcglyhdzx.id="+data1.id+"&gcglyhdzx.sfsj=7"+"&gcglyhdzx.yhtype=9"+"&gcglyhdzx.jhid="+data1.jhid;
	}
	if(confirm("确认上报吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbYhdzxYb.do',
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
	var data="gcglyhdzx.id="+data1.id+"&gcglyhdzx.sfsj=11"+"&gcglyhdzx.yhtype=9"+"&gcglyhdzx.jhid="+data1.jhid;
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbYhdzxYb.do',
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
