
function trqkadd(){
	YMLib.UI.createWindow('trqk_add','添加信息','trqk_add.jsp','trqk_add',970,450);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addtrqk(){
	var data="trqk.gydw="+$("#gydw").combobox("getValue")+"&trqk.gydwmc="+$("#gydw").combobox("getText")
	+"&trqk.qxrs="+$("#qxrs").val()+"&trqk.trqxjf="+$("#trqxjf").val()
	+"&trqk.lq="+$("#lq").val()+"&trqk.sn="+$("#sn").val()+"&trqk.ss="+$("#ss").val()
	+"&trqk.bzd="+$("#bzd").val()+"&trqk.gyy="+$("#gyy").val()+"&trqk.lqlbl="+$("#lqlbl").val()
	+"&trqk.wjj="+$("#wjj").val()+"&trqk.zzj="+$("#zzj").val()+"&trqk.zxqc="+$("#zxqc").val()
	+"&trqk.cstb="+$("#cstb").val()+"&trqk.sbtbxj="+$("#sbtbxj").val()
	+"&trqk.tbdw="+$("#tbdw").combobox("getValue")+"&trqk.tbdwmc="+$("#tbdw").combobox("getText")
	+"&trqk.tjr="+$("#tjr").val()+"&trqk.shry="+$("#shr").val()+"&trqk.tbsj="+$("#tbsj").datebox("getValue");
	alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt/wjxt/insertTrqk.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#trqk_table").datagrid('reload');
				closes('trqk_add');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
//查所有
function showAll(){
		var gydw=$("#gydw").combobox("getValue");
		if(gydw=='36')
			gydw='';
		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val();
		var tiaojian=nf+"-"+yf;
		$('#trqk_table').datagrid({    
	    url:'/jxzhpt/wjxt/selectTrqkList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw:gydw,
	    	tiaojian:tiaojian
		},
		columns:[[
				    {field:'c',title:'操作',width:100,rowspan:2,align:'center',formatter:function(value,row,index){
				    		return "编辑     删除";
				    	}
				    },
					{field:'gydwmc',title:'单位',width:150,rowspan:2,align:'center'},
					{field:'qxrs',title:'抢修人数(工日)',width:110,rowspan:2,align:'center'},
					{title:'材料',colspan:6,align:'center'},
					{title:'设备(台班)',colspan:5,align:'center'},
					{field:'trqxjf',title:'投入抢修经费(万元)',width:140,rowspan:2,align:'center'},
					{field:'tbsj',title:'填报时间',width:100,rowspan:2,align:'center'},
					{field:'tbdwmc',title:'填报单位',width:150,rowspan:2,align:'center'},
					{field:'tjr',title:'统计人',width:100,rowspan:2,align:'center'},
					{field:'shry',title:'审核人',width:100,rowspan:2,align:'center'}
				],[
					{field:'lq',title:'沥青(吨)',width:100,align:'center'},
					{field:'sn',title:'水泥(吨)',width:100,align:'center'},
					{field:'ss',title:'沙石(立方)',width:100,align:'center'},
					{field:'bzd',title:'编织袋(个)',width:100,align:'center'},
					{field:'gyy',title:'工业盐(吨)',width:100,align:'center'},
					{field:'lqlbl',title:'沥青冷补料',width:100,align:'center'},
					{field:'wjj',title:'挖掘机 	',width:100,align:'center'},
					{field:'zzj',title:'装载机',width:100,align:'center'},
					{field:'zxqc',title:'自卸汽车',width:100,align:'center'},
					{field:'cstb',title:'抽水台班',width:100,align:'center'},
					{field:'sbtbxj',title:'设备台班小计',width:100,align:'center'}
				]]    
	}); 
}
