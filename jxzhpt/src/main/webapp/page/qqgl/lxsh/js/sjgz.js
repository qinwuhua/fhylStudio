function urlxmnf(id,flag){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	if(flag=='01011201010101'||flag=='0101120101010101'||flag=='0101120101010102'||flag=='0101120101010103'||
	   flag=='0101120101010104'||flag=='0101120101010105'||flag=='0101120101010106'||flag=='01011201010102'||
	   flag=='010112010102'||flag=='010112010105'||flag=='010112020101'||
	   flag=='01011202010101'||flag=='01011202010102'||flag=='01011202010103'||
	   flag=='010112030101'||flag=='01011203010101'||flag=='01011203010102'||flag=='01011203010103'||
	   flag=='010112030103'||flag=='010112040100'||flag=='010112040101'||flag=='01011301010101'||flag=='01011301010102'||
	   flag=='010113010102'||flag=='010113010105'||flag=='01011302010101'||flag=='01011302010102'||
	   flag=='010113020102'||flag=='010113020105'||flag=='01011303010101'||flag=='01011303010102'||
	   flag=='010113030102'||flag=='010113030105'||flag=='01011304010101'||
	   flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'||flag=='01011401010101'||
	   flag=='01011401010102'||flag=='010114010102'||flag=='010114010105'||flag=='01011402010101'||
	   flag=='01011402010102'||flag=='010114020102'||flag=='010114020105'||flag=='01011403010101'||
	   flag=='01011403010102'||flag=='010114030102'||flag=='010114030105'||
	   flag=='010114040101'||flag=='010114040102'||flag=='010114040103'||flag=='010114040104'||
	   flag=='010114040105'||flag=='010114040106'||flag=='010114040107'||
	   flag=='01011501010101'||flag=='01011501010102'||flag=='010115010102'||flag=='010115010105'||
	   flag=='01011402030101'||flag=='01011402030102'||flag=='010114020302'||flag=='0101140203030101'||
	   flag=='0101140203030102'||flag=='0101140203030103'||flag=='0101140203030104'||flag=='010112010108' ||flag=='010112010109'    
	){
		/*if(flag=='01011302010101'||flag=='01011302010102'||flag=='010113020102'||flag=='010113020105'){
			$("#astext").html('计划上报');
		}
		if(flag=='01011303010101'||flag=='01011303010102'||flag=='010113030102'||flag=='010113030105'){
			$("#astext").html('计划审核');
		}*/
		/*if(flag=='01011304010101'||flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'){
			$("#astext").html('计划下达');
		}*/
		$("#bstext").html('十二五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2015)
					first=2015;
				if(first<2010)
					first=2010;
			}
			years.push({text:(2010+5-i),value:(2010+5-i)});
		}
	}
	if(flag=='01011201020101'||flag=='0101120102010101'||flag=='0101120102010102'||
		flag=='0101120102010103'||flag=='0101120102010104'||flag=='0101120102010105'||
		flag=='0101120102010106'||flag=='01011201020102'||flag=='010112010202'||
		flag=='010112010205'||flag=='010112020201'||flag=='01011202020101'||
		flag=='01011202020102'||flag=='01011202020103'||flag=='010112030201'||
		flag=='01011203020101'||flag=='01011203020102'||flag=='01011203020103'||
		flag=='010112030203'||flag=='010112040200'||flag=='010112040201'||flag=='01011301020101'||
		flag=='01011301020102'||flag=='010113010202'||flag=='010113010206'||
		flag=='01011302020101'||flag=='01011302020102'||flag=='010113020202'||
		flag=='010113020206'||flag=='01011303020101'||flag=='01011303020102'||
		flag=='010113030202'||flag=='010113030206'||flag=='010113040105'||flag=='01011304020101'||
		flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'||flag=='01011401020101'||
		flag=='01011401020102'||flag=='010114010202'||flag=='010114010206'||flag=='01011402020101'||
		flag=='01011402020102'||flag=='010114020202'||flag=='010114020206'||flag=='01011403020101'||
		flag=='01011403020102'||flag=='010114030202'||flag=='010114030206'||
		flag=='010114040201'||flag=='010114040202'||flag=='010114040203'||flag=='010114040204'||
		flag=='010114040205'||flag=='010114040206'||flag=='010114040207'||flag=='01011501020101'||
		flag=='01011501020102'||flag=='010115010202'||flag=='010115010206'||
		flag=='01011402040101'||flag=='01011402040102'||flag=='010114020402'||flag=='0101140204030101'||
		flag=='0101140204030102'||flag=='0101140204030103'||flag=='0101140204030104'||flag=='010112010208' ||flag=='010112010209' 
	){
		/*if(flag=='01011302020101'||flag=='01011302020102'||flag=='010113020202'||flag=='010113020206'){
			$("#astext").html('计划上报');
		}
		if(flag=='01011303020101'||flag=='01011303020102'||flag=='010113030202'||flag=='010113030206'){
			$("#astext").html('计划审核');
		}*/
		/*if(flag=='01011304020101'||flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'){
			$("#astext").html('计划下达');
		}*/
		$("#bstext").html('十三五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2020)
					first=2020;
				if(first<2016)
					first=2016;
			}
			years.push({text:(2015+5-i),value:(2015+5-i)});
		}
	}
	
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setValue",first+'');
	$('#id'+first).attr('checked', true);
}


var obj=new Object();
/**
 * 判断项目类型，返回文字
 * @param xmbm 项目编码
 * @result 返回项目类型
 */
function panduanxmlx(xmbm){
	var result="";
	var xmlx = xmbm.substring(10,11);
	if(xmlx=="1"){
		result="升级改造工程项目";
	}else if(xmlx=="2"){
		result="路面改造工程项目";
	}else if(xmlx=="3"){
		result="新建工程项目";
	}else if(xmlx=="4"){
		result="养护大中修项目";
	}else if(xmlx=="5"){
		result="灾毁恢复重建项目";
	}
	return result;
}
function addLXSH(url,width,length){
	YMLib.UI.createWindow('lxxx','添加立项信息',url,'lxxx',width,length);
}
function xiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','立项详细信息','sjgzsb_xx.jsp','lxxx',900,360);
}
function edit(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑立项信息','sjgzsb_edit.jsp','lxxx',900,490);
}
function del(index){
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.xmbm;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delSjgz.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
function shangb(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	var sbthcd=0;
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	
	if(confirm('您确定上报该项目？')){
		var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/sbsjgzSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('上报失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
function shangb1(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	var sbthcd=0;
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	
	if(confirm('您确定上报该项目？')){
		var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/sblmgzSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('上报失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
function shangb2(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	var sbthcd=0;
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}else{
		sbthcd=$.cookie("unit2").length-2;
	}
	
	if(confirm('您确定上报该项目？')){
		var data = "lxsh.id="+id+"&lxsh.sbthcd="+sbthcd;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/sbxjSbzt.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('上报成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('上报失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
function shenh(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var datas='xmsq.ylxbh='+data1.ghlxbh+'&xmsq.qdzh='+data1.qdzh+'&xmsq.zdzh='+data1.zdzh+'&xmsq.xmbm='+data1.xmbm;
	//alert(datas);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/sfinsert1.do',
        data:datas,
		dataType:'json',
		success:function(msg){
			if(msg.result=="true"){
				
				//insert();
				var id=data1.id;
				if(confirm('您确定审核该项目？')){
					var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
					$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/shsjgzSbzt.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
							 if(msg){
								 alert('审核成功！');
								 $("#datagrid").datagrid('reload');
							 }else{
								 alert('审核失败,请选择要上报项目！');
							 }
						 },
						 error : function(){
							 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
						 }
					});
				}
				//
			}else if(msg.result=="have"){
				var xsxx='';
				
				//alert();
				for(var i=0;i<msg.lx.length;i++){
					var xmlx='';
					if(msg.lx[i].xmid.substr(10,1)==1){
						xmlx='改建';
					}
					if(msg.lx[i].xmid.substr(10,1)==2){
						xmlx='路面改造';
					}
					if(msg.lx[i].xmid.substr(10,1)==3){
						xmlx='新建';
					}
					if(msg.lx[i].xmid.substr(10,1)==4){
						xmlx=msg.lx[i].xjsdj;
					}
					if(msg.lx[i].xmid.substr(10,1)==5){
						xmlx='灾毁重建';
					}
					var lc=0;
					
					if(parseFloat(msg.lx[i].qdzh)!=parseFloat(obj.zdzh)&&parseFloat(msg.lx[i].zdzh)!=parseFloat(obj.qdzh))
					lc= (parseFloat(msg.lx[i].qdzh)*1000-parseFloat(obj.qdzh)*1000)+(parseFloat(msg.lx[i].zdzh)*1000-parseFloat(obj.zdzh)*1000);
					
					//Math.abs(lc/1000);
					xsxx+="   项目年份："+msg.lx[i].xmid.substr(0,4)+"   项目名称："+msg.lx[i].xmmc+"   建设类型："+xmlx+"     重复里程："+Math.abs(lc/1000)+"\r";
					
				}
				if(msg.lx.length>0){
					$("#lsjl").val("是");
					alert("存在补助历史\r"+xsxx);
					if(confirm('是否保存？')){
						//insert();
						var id=data1.id;
						if(confirm('您确定审核该项目？')){
							var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
							$.ajax({
								 type : "POST",
								 url : "/jxzhpt/qqgl/shsjgzSbzt.do",
								 dataType : 'json',
								 data : data,
								 success : function(msg){
									 if(msg){
										 alert('审核成功！');
										 $("#datagrid").datagrid('reload');
									 }else{
										 alert('审核失败,请选择要上报项目！');
									 }
								 },
								 error : function(){
									 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
								 }
							});
						}
						//
					}
				}else{
					$("#lsjl").val("否");
					//insert();
					var id=data1.id;
					if(confirm('您确定审核该项目？')){
						var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
						$.ajax({
							 type : "POST",
							 url : "/jxzhpt/qqgl/shsjgzSbzt.do",
							 dataType : 'json',
							 data : data,
							 success : function(msg){
								 if(msg){
									 alert('审核成功！');
									 $("#datagrid").datagrid('reload');
								 }else{
									 alert('审核失败,请选择要上报项目！');
								 }
							 },
							 error : function(){
								 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
							 }
						});
					}
					//
				}
				
			}
		}
	});
	
}
function shenh1(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	
	var datas='xmsq.ylxbh='+data1.ghlxbh+'&xmsq.qdzh='+data1.qdzh+'&xmsq.zdzh='+data1.zdzh+'&xmsq.xmbm='+data1.xmbm;
	//alert(datas);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/sfinsert1.do',
        data:datas,
		dataType:'json',
		success:function(msg){
			if(msg.result=="true"){
				
				//insert();
				var id=data1.id;
				if(confirm('您确定审核该项目？')){
					var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
					$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/shlmgzSbzt.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
							 if(msg){
								 alert('审核成功！');
								 $("#datagrid").datagrid('reload');
							 }else{
								 alert('审核失败,请选择要上报项目！');
							 }
						 },
						 error : function(){
							 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
						 }
					});
				}
				//
			}else if(msg.result=="have"){
				var xsxx='';
				
				//alert();
				for(var i=0;i<msg.lx.length;i++){
					var xmlx='';
					if(msg.lx[i].xmid.substr(10,1)==1){
						xmlx='改建';
					}
					if(msg.lx[i].xmid.substr(10,1)==2){
						xmlx='路面改造';
					}
					if(msg.lx[i].xmid.substr(10,1)==3){
						xmlx='新建';
					}
					if(msg.lx[i].xmid.substr(10,1)==4){
						xmlx=msg.lx[i].xjsdj;
					}
					if(msg.lx[i].xmid.substr(10,1)==5){
						xmlx='灾毁重建';
					}
					var lc=0;
					
					if(parseFloat(msg.lx[i].qdzh)!=parseFloat(obj.zdzh)&&parseFloat(msg.lx[i].zdzh)!=parseFloat(obj.qdzh))
					lc= (parseFloat(msg.lx[i].qdzh)*1000-parseFloat(obj.qdzh)*1000)+(parseFloat(msg.lx[i].zdzh)*1000-parseFloat(obj.zdzh)*1000);
					
					//Math.abs(lc/1000);
					xsxx+="   项目年份："+msg.lx[i].xmid.substr(0,4)+"   项目名称："+msg.lx[i].xmmc+"   建设类型："+xmlx+"     重复里程："+Math.abs(lc/1000)+"\r";
					
				}
				if(msg.lx.length>0){
					$("#lsjl").val("是");
					alert("存在补助历史\r"+xsxx);
					if(confirm('是否保存？')){
						//insert();
						var id=data1.id;
						if(confirm('您确定审核该项目？')){
							var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
							$.ajax({
								 type : "POST",
								 url : "/jxzhpt/qqgl/shlmgzSbzt.do",
								 dataType : 'json',
								 data : data,
								 success : function(msg){
									 if(msg){
										 alert('审核成功！');
										 $("#datagrid").datagrid('reload');
									 }else{
										 alert('审核失败,请选择要上报项目！');
									 }
								 },
								 error : function(){
									 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
								 }
							});
						}
						//
					}
				}else{
					$("#lsjl").val("否");
					//insert();
					var id=data1.id;
					if(confirm('您确定审核该项目？')){
						var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
						$.ajax({
							 type : "POST",
							 url : "/jxzhpt/qqgl/shlmgzSbzt.do",
							 dataType : 'json',
							 data : data,
							 success : function(msg){
								 if(msg){
									 alert('审核成功！');
									 $("#datagrid").datagrid('reload');
								 }else{
									 alert('审核失败,请选择要上报项目！');
								 }
							 },
							 error : function(){
								 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
							 }
						});
					}
					//
				}
				
			}
		}
	});
	
}
function shenh2(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	
	var datas='xmsq.ylxbh='+data1.ghlxbh+'&xmsq.qdzh='+data1.qdzh+'&xmsq.zdzh='+data1.zdzh+'&xmsq.xmbm='+data1.xmbm;
	//alert(datas);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/sfinsert1.do',
        data:datas,
		dataType:'json',
		success:function(msg){
			if(msg.result=="true"){
				
				//insert();
				var id=data1.id;
				if(confirm('您确定审核该项目？')){
					var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
					$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/shxjSbzt.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
							 if(msg){
								 alert('审核成功！');
								 $("#datagrid").datagrid('reload');
							 }else{
								 alert('审核失败,请选择要上报项目！');
							 }
						 },
						 error : function(){
							 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
						 }
					});
				}
				//
			}else if(msg.result=="have"){
				var xsxx='';
				
				//alert();
				for(var i=0;i<msg.lx.length;i++){
					var xmlx='';
					if(msg.lx[i].xmid.substr(10,1)==1){
						xmlx='改建';
					}
					if(msg.lx[i].xmid.substr(10,1)==2){
						xmlx='路面改造';
					}
					if(msg.lx[i].xmid.substr(10,1)==3){
						xmlx='新建';
					}
					if(msg.lx[i].xmid.substr(10,1)==4){
						xmlx=msg.lx[i].xjsdj;
					}
					if(msg.lx[i].xmid.substr(10,1)==5){
						xmlx='灾毁重建';
					}
					var lc=0;
					
					if(parseFloat(msg.lx[i].qdzh)!=parseFloat(obj.zdzh)&&parseFloat(msg.lx[i].zdzh)!=parseFloat(obj.qdzh))
					lc= (parseFloat(msg.lx[i].qdzh)*1000-parseFloat(obj.qdzh)*1000)+(parseFloat(msg.lx[i].zdzh)*1000-parseFloat(obj.zdzh)*1000);
					
					//Math.abs(lc/1000);
					xsxx+="   项目年份："+msg.lx[i].xmid.substr(0,4)+"   项目名称："+msg.lx[i].xmmc+"   建设类型："+xmlx+"     重复里程："+Math.abs(lc/1000)+"\r";
					
				}
				if(msg.lx.length>0){
					$("#lsjl").val("是");
					alert("存在补助历史\r"+xsxx);
					if(confirm('是否保存？')){
						//insert();
						var id=data1.id;
						if(confirm('您确定审核该项目？')){
							var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
							$.ajax({
								 type : "POST",
								 url : "/jxzhpt/qqgl/shxjSbzt.do",
								 dataType : 'json',
								 data : data,
								 success : function(msg){
									 if(msg){
										 alert('审核成功！');
										 $("#datagrid").datagrid('reload');
									 }else{
										 alert('审核失败,请选择要上报项目！');
									 }
								 },
								 error : function(){
									 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
								 }
							});
						}
						//
					}
				}else{
					$("#lsjl").val("否");
					//insert();
					var id=data1.id;
					if(confirm('您确定审核该项目？')){
						var data = "lxsh.id="+id+"&lxsh.xmbm="+data1.xmbm;
						$.ajax({
							 type : "POST",
							 url : "/jxzhpt/qqgl/shxjSbzt.do",
							 dataType : 'json',
							 data : data,
							 success : function(msg){
								 if(msg){
									 alert('审核成功！');
									 $("#datagrid").datagrid('reload');
								 }else{
									 alert('审核失败,请选择要上报项目！');
								 }
							 },
							 error : function(){
								 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
							 }
						});
					}
					//
				}
				
			}
		}
	});
	
}
//
function xiangxi1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','立项详细信息','lmgzsb_xx.jsp','lxxx',900,360);
}
function edit1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑立项信息','lmgzsb_edit.jsp','lxxx',900,490);
}
function del1(index){
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.xmbm;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delLmgz.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
//
function xiangxi2(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','立项详细信息','xjsb_xx.jsp','lxxx',900,360);
}
function edit2(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑立项信息','xjsb_edit.jsp','lxxx',900,490);
}
function del2(index){
	if($.cookie("unit2").length==7 ){
		alert("省级用户请移到审核模块进行操作");
		return;
	}
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="lxsh.xmbm="+data1.xmbm;
	if(confirm('您确定删除该项目？')){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/qqgl/delXj.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 if(msg){
				 alert('删除成功！');
				 $("#datagrid").datagrid('reload');
			 }else{
				 alert('删除失败！');
			 }
		 },
	 error : function(){
		 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
	 }
	});
  }
}
//
function removes(id){
	parent.$('#'+id).window('destroy');
}
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/selectlxbyxmid.do',
			data:"lxsh.xmbm="+data.xmbm+"&lxsh.jdbs=0",
			dataType:'json',
			success:function(msg){
				var lxbm="";
				var qdzh="";
				var zdzh="";
				for(var i=0;i<msg.length;i++){
					if(i==msg.length-1){
						lxbm=lxbm+msg[i].lxbm;
						qdzh=qdzh+msg[i].qdzh;
						zdzh=zdzh+msg[i].zdzh;
					}else{
						lxbm=lxbm+msg[i].lxbm+"-";
						qdzh=qdzh+msg[i].qdzh+"-";
						zdzh=zdzh+msg[i].zdzh+"-";
					}
				}
				locationXm1(lxbm,qdzh,zdzh);
			},
			error : function(){
			 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
		 }
	});	
	
}
function xmbm(id,xzqh,nf,xmlx){
	var data='xmsq.xmlx='+xmlx+'&xmsq.xzqhdm='+$.cookie('dist')+'&xmsq.xmnf='+nf;
	$("#"+id).html('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryNextXmbm.do',
		data:data,
		dataType:'json',
		success:function(msg){
			$("#xmbm").html(nf+$.cookie('dist')+msg.xmbm);
		},
		error : function(){
		 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
	 }
	});	
}
var shzt1;
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	if(tsdq=='全部'){
		tsdq="";
	}*/
	
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmsj.do',
		data:{lsjl:lsjl,
			xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			ghlxbh:$("#lxbm").val(),
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:190,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	var re= '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del('+index+')">删除</a>  ';
	        	if(row.sbzt1=='0')
	        		return re+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">添加路线</a>   ';
        		else if(row.sbzt1=='1')
	        		return re+'添加路线';
        		
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
	       /* {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">添加路线</a>   ';
		       // else if(row.sbzt1=='1')
	        	//	return '添加路线';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
		    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
		    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:120,align:'center'},
		    {field:'zdmc',title:'止点名称',width:120,align:'center'},
		    {field : 'jszlc',title : '里程',width : 90,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'},
		    {field : 'thyy',title : '退回原因',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
		          /* {field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
		        	   var result ='<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
		        	   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
		        		   result+='&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
		        	   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
		        		   result+= '&nbsp;删除';
		        	   return result;
		           }},*/
		          {field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
		        	   var result ='<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
		        	   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
		        		   result+='&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')">删除</a>   ';
		        	   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
		        		   result+= '&nbsp;删除';
		        	   return result;
		           }},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}/*,
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}*/
    			]]
	    	});
	    }   
	}); 
}


function showAll123(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	if(tsdq=='全部'){
		tsdq="";
	}*/
	
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmsj.do',
		data:{lsjl:lsjl,
			xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			ghlxbh:$("#lxbm").val(),
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	       /* {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},*/
	        /*{field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
		    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
		    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		    {field : 'ghlxbh',title : '原路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '原起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '原止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:120,align:'center'},
		    {field:'zdmc',title:'止点名称',width:120,align:'center'},
		    {field : 'jszlc',title : '里程',width : 90,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
		          /* {field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
		        	   var result ='<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
		        	   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
		        		   result+='&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
		        	   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
		        		   result+= '&nbsp;删除';
		        	   return result;
		           }},*/
		        /*  {field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
		        	   var result ='<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
		        	   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
		        		   result+='&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
		        	   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
		        		   result+= '&nbsp;删除';
		        	   return result;
		           }},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}/*,
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}*/
    			]]
	    	});
	    }   
	}); 
}




function xmnf1(id,xmlx){
	var myDate = new Date();
	var years=[];
	var first='';
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    onSelect:function(rec){
	    	xmbm('xmbm',$.cookie("dist"),rec.value,xmlx);
	    }
	});
	$('#'+id).combobox("setValue",first);
}

function jsjszlc(){
	var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
	if($('#jhyilc').val()!='')
		yilc=parseFloat($('#jhyilc').val());
	if($('#jherlc').val()!='')
		erlc=parseFloat($('#jherlc').val());
	if($('#jhsanlc').val()!='')
		sanlc=parseFloat($('#jhsanlc').val());
	if($('#jhsilc').val()!='')
		silc=parseFloat($('#jhsilc').val());
	if($('#jhwllc').val()!='')
		wulc=parseFloat($('#jhwllc').val());
	if($('#jhdwlc').val()!='')
		dwlc=parseFloat($('#jhdwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#jszlc').val(hj5);
}
function jsyzlc(){
	var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
	if($('#yilc').val()!='')
		yilc=parseFloat($('#yilc').val());
	if($('#erlc').val()!='')
		erlc=parseFloat($('#erlc').val());
	if($('#sanlc').val()!='')
		sanlc=parseFloat($('#sanlc').val());
	if($('#silc').val()!='')
		silc=parseFloat($('#silc').val());
	if($('#wllc').val()!='')
		wulc=parseFloat($('#wllc').val());
	if($('#dwlc').val()!='')
		dwlc=parseFloat($('#dwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#lc').html(hj5);
	$('#lc').val(hj5);
}
function cesuan(){
	jsjszlc();
/*	var yi=0;
	if($('#jhyilc').val()!="" && $('#jhyilc').val()!="0")
		yi = getbzcs($("#lxbm").val().substr(0,1),"一级",$('#jhyilc').val(),'升级改造工程项目');
	var er=0;
	if($('#jherlc').val()!="" && $('#jherlc').val()!="0")
		er = getbzcs($("#lxbm").val().substr(0,1),"二级",$('#jherlc').val(),'升级改造工程项目');
	var san=0;
	if($('#jhsanlc').val()!="" && $('#jhsanlc').val()!="0")
		san = getbzcs($("#lxbm").val().substr(0,1),"三级",$('#jhsanlc').val(),'升级改造工程项目');
	var si=0;
	if($('#jhsilc').val()!="" && $('#jhsilc').val()!="0")
		si = getbzcs($("#lxbm").val().substr(0,1),"四级",$('#jhsilc').val(),'升级改造工程项目');
	var dw=0;
	if($('#jhdwlc').val()!="" && $('#jhdwlc').val()!="0")
		dw = getbzcs($("#lxbm").val().substr(0,1),"等外",$('#jhdwlc').val(),'升级改造工程项目');
	var wl=0;
	if($('#jhwllc').val()!="" && $('#jhwllc').val()!="0")
		wl = getbzcs($("#lxbm").val().substr(0,1),"无",$('#jhwllc').val(),'升级改造工程项目');
	var zcs=parseFloat(yi)+parseFloat(er)+parseFloat(san)+parseFloat(si)+parseFloat(dw)+parseFloat(wl);
	$('#bzcs').html(zcs);*/
	$('#dfzc').html(accSub(parseFloat($("#tz").val()),parseFloat($("#bzcs").val())));
}
function cesuan2(){
	/*var yi=0;
	if($('#yilc').val()!="" && $('#yilc').val()!="0" && $('#yilc').val()!="0.0")
		yi = getbzcs($("#lxbm").val().substr(0,1),"一级",$('#yilc').val(),'升级改造工程项目');
	var er=0;
	if($('#erlc').val()!="" && $('#erlc').val()!="0" && $('#erlc').val()!="0.0")
		er = getbzcs($("#lxbm").val().substr(0,1),"二级",$('#erlc').val(),'升级改造工程项目');
	var san=0;
	if($('#sanlc').val()!="" && $('#sanlc').val()!="0" && $('#sanlc').val()!="0.0")
		san = getbzcs($("#lxbm").val().substr(0,1),"三级",$('#sanlc').val(),'升级改造工程项目');
	var si=0;
	if($('#silc').val()!="" && $('#silc').val()!="0" && $('#silc').val()!="0.0")
		si = getbzcs($("#lxbm").val().substr(0,1),"四级",$('#silc').val(),'升级改造工程项目');
	var dw=0;
	if($('#dwlc').val()!="" && $('#dwlc').val()!="0" && $('#dwlc').val()!="0.0")
		dw = getbzcs($("#lxbm").val().substr(0,1),"等外",$('#dwlc').val(),'升级改造工程项目');
	var wl=0;
	if($('#wllc').val()!="" && $('#wllc').val()!="0" && $('#wllc').val()!="0.0")
		wl = getbzcs($("#lxbm").val().substr(0,1),"无",$('#wllc').val(),'升级改造工程项目');
	var zcs=parseFloat(yi)+parseFloat(er)+parseFloat(san)+parseFloat(si)+parseFloat(dw)+parseFloat(wl);
	$('#bzcs').html(zcs);*/
	$('#dfzc').html(accSub(parseFloat($("#tz").val()),parseFloat($("#bzcs").val())));
}
function getbzcs(gldj,jsdj,lc,xmlx){
	var data="lxsh.xmlx="+xmlx+"&lxsh.gldj="+gldj+"&lxsh.jsdj="+jsdj+"&lxsh.lc="+lc;
	//$("#bzcs").html('');
	var newcs=0;
	$.ajax({
		type:'post',
		async:false,
		url:'/jxzhpt/qqgl/selectbzcs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			//var zcs=parseFloat(oldcs)+parseFloat(msg.bzys);
			//$('#bzcs').html(zcs);
			newcs=msg.bzys;
		},
		error : function(){
		 YMLib.Tools.Show('未检索到补助标准错误！error code = 404',3000);
	 }
	});
	return newcs;
}
//升级审核
function showAllsjsh(){
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	if(tsdq=='全部'){
		tsdq="";
	}*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmsj.do',
		data:{lsjl:lsjl,
			xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			'lxsh.sbzt':'1',
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({
	    url:'/jxzhpt/qqgl/selectSjgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			'lxsh.sbzt':'1',
			//tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			ghlxbh:$("#lxbm").val(),
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 130,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 80,align : 'center'},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 100,align : 'center'},
		    {field : 'jszlc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
		    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
		    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
		    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
		    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		    {field : 'ghlxbh',title : '原路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '原起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '原止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhkgn',title : '计划开工年',width : 70,align : 'center'},
		    {field : 'jhwgn',title : '计划完工年',width : 70,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 70,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 70,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	//var parentindex=index;
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		queryParams: {
	    			'lx.jdbs':0,
	    			'lx.xmid':row.xmbm,
	    			'lx.sffirst':'1'
	    		},
    			columns:[[
    			    {field:'cz',title:'操作',width:150,align:'center',
    			    	formatter: function(value,row,index){
    			    		return '<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>'+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')">删除</a>   ';
    			    	}
    			    },
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
				    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
				    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	});
}
function showAllsjsh123(){
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	if(tsdq=='全部'){
		tsdq="";
	}*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmsj.do',
		data:{lsjl:lsjl,
			xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			 $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({
	    url:'/jxzhpt/qqgl/selectSjgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			ghlxbh:$("#lxbm").val(),
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        /*{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 130,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 80,align : 'center'},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 100,align : 'center'},
		    {field : 'jszlc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
		    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
		    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
		    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
		    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		    {field : 'ghlxbh',title : '原路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '原起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '原止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhkgn',title : '计划开工年',width : 70,align : 'center'},
		    {field : 'jhwgn',title : '计划完工年',width : 70,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 70,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 70,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		queryParams: {
	    			'lx.jdbs':0,
	    			'lx.xmid':row.xmbm,
	    			'lx.sffirst':'1'
	    		},
    			columns:[[
//    			    {field:'cz',title:'操作',width:150,align:'center',
//    			    	formatter: function(value,row,index){
//    			    		return '<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
//    			    	}
//    			    },
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
				    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
				    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	});
}

function editSjlx(xmid,index){
	var data=$("#table_lx"+xmid).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线信息','sjgzlx_add.jsp','lxxx',900,350);
}
//lmsj
function showAlllmgz(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmgz.do',
		data:{lsjl:lsjl,
			xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj,ghlxbh:$("#lxbm").val(),lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:180,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	var re = '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del1('+index+')">删除</a>  ';
	        
	        	if(row.sbzt1=='0')
        		return re+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>   ';
	        	else if(row.sbzt1=='1')
        		return re+'添加路线';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb1('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
/*	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
//	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>   ';
//		        else if(row.sbzt1=='1')
//	        		return '添加路线';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
		    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
		    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		    {field : 'ghlxbh',title : '原路线编号',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '原起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '原止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:120,align:'center'},
		    {field:'zdmc',title:'止点名称',width:120,align:'center'},
		    {field : 'jszlc',title : '里程',width : 90,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'},
		    {field : 'thyy',title : '退回原因',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						var result ='<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
							result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')">删除</a>   ';
						}
						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							result+='&nbsp;删除';
						return result;
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}
//    			    ,
//    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}

function showAlllmgz123(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmgz.do',
		data:{lsjl:lsjl,
			xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj,ghlxbh:$("#lxbm").val(),lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	       /* {field:'c',title:'操作',width:180,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del1('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb1('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},*/
	        /*{field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:120,align:'center'},
		    {field:'zdmc',title:'止点名称',width:120,align:'center'},
		    {field : 'lc',title : '里程',width : 90,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	//var parentindex=index;
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
//					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
//						var result ='<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
//						/*if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
//							result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
//						}
//						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
//							result+='&nbsp;删除';*/
//						return result;
//					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}


function showAlllmsh(){
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmgz.do',
		data:{lsjl:lsjl,
			xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			'lxsh.sbzt':'1',
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			'lxsh.sbzt':'1',
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj,ghlxbh:$("#lxbm").val(),lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh1('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 130,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 80,align : 'center'},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 100,align : 'center'},
		    {field : 'jszlc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
		    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
		    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
		    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
		    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		    {field : 'ghlxbh',title : '原路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '原起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '原止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhkgn',title : '计划开工年',width : 70,align : 'center'},
		    {field : 'jhwgn',title : '计划完工年',width : 70,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 70,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 70,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    		},
    			columns:[[
					{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							return '<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>'+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')">删除</a>   ';
						}
					},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
				    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
				    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
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

function showAlllmsh123(){
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmgz.do',
		data:{lsjl:lsjl,
			xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj,ghlxbh:$("#lxbm").val(),lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        /*{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh1('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 130,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 80,align : 'center'},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
		    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
		    {field : 'ghlxbh',title : '原路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '原起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '原止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhkgn',title : '计划开工年',width : 70,align : 'center'},
		    {field : 'jhwgn',title : '计划完工年',width : 70,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 70,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 70,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    		},
    			columns:[[
//					{field:'cz',title:'操作',width:150,align:'center',
//						formatter: function(value,row,index){
//							return '<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
//						}
//					},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
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


function editGzlx(xmid,index){
	var data=$("#table_lx"+xmid).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线信息','lmgzlx_add.jsp','lxxx',900,350);
}
//XJ
function showAllxj(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjXj.do',
		data:{xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj,ghlxbh:$("#lxbm").val(),lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:190,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	var re= '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del2('+index+')">删除</a>  ';
	        
	        	if(row.sbzt1=='0')
	        		return re+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return re+'添加路线';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb2('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
	      /*  {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.sl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'jszlc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'},
		    {field : 'thyy',title : '退回原因',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					/*{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxjlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},*/
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						var result ='<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
							result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')">删除</a>   ';
						}
						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							result+='&nbsp;删除';
						return result;
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
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

function showAllxj123(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjXj.do',
		data:{xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			'lxsh.sbzt':'1',
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			'lxsh.sbzt':'1',
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj,ghlxbh:$("#lxbm").val(),lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
//	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
//	            //if(row.sbzt1=='1')
//	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    '+'删除 ';
//	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del2('+index+')">删除</a>  ';
//	        }},
//	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
//	        	if(row.sbzt1=='0')
//        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb2('+index+')">未上报</a>  ';
//	        	else if(row.sbzt1=='1')
//	        		return '已上报';
//	        }},
	        /*{field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					/*{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxjlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},*/
//					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
//						var result ='<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
//						/*if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
//							result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
//						}
//						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
//							result+='&nbsp;删除';*/
//						return result;
//					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
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


function showAllxjsh(){
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjXj.do',
		data:{xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj,ghlxbh:$("#lxbm").val(),lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh2('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 130,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 80,align : 'center'},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.sl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 100,align : 'center'},
		    {field : 'jszlc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
		    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhkgn',title : '计划开工年',width : 70,align : 'center'},
		    {field : 'jhwgn',title : '计划完工年',width : 70,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 70,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 70,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						var result ='<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>'+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')">删除</a>   ';
						/*if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
							result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
						}
						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							result+='&nbsp;删除';*/
						return result;
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}

function showAllxjsh123(){
	/*var gydw=$("#gydw").combotree("getValues");
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
	}*/
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	/*//var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);*/
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjXj.do',
		data:{xzqh:xzqhstr,
			//gydw:gydwstr,
			xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			ghlxbh:$("#lxbm").val(),
			lxmc:$("#lxmc").val(),
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj},
		dataType:'json',
		success:function(msg){
			$("#xmsl").html(msg.XMSL);
			 $("#tz").html(msg.TZ);
			  $("#cgs").html(msg.BZCS);
			 $("#sbz").html(msg.SBZ);
			 $("#sjl").html(msg.SJL);
			 $("#lc").html(msg.LC);
			 $("#dftz").html(msg.DFTZ);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	//gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			//tsdq:tsdq,
			jsdj:jsdj,
			ghlxbm:$("#ghlxbm").val(),
			ghlxmc:$("#ghlxmc").val(),
			jsjsdj:jsjsdj,
			gldj:gldj,ghlxbh:$("#lxbm").val(),lxmc:$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
//	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
//	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
//	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+
//	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  ';
//	        }},
//	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
//	        	if(row.shzt=='0')
//        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh2('+index+')">未审核</a>';
//	        	else if(row.shzt=='1')
//	        		return '已审核';
//	        }},
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
			{field : 'gydw',title : '管养单位',width : 130,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 80,align : 'center'},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 60,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
		    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    {field : 'jhkgn',title : '计划开工年',width : 70,align : 'center'},
		    {field : 'jhwgn',title : '计划完工年',width : 70,align : 'center'},
		    {field : 'tz',title : '投资',width : 80,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 70,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 70,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
//					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
//						var result ='<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
//						/*if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
//							result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
//						}
//						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
//							result+='&nbsp;删除';*/
//						return result;
//					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}


function selectTSDQ(lxbm,qdzh,zdzh){
	$("#tsdq").text("");
	var data="lxbm="+lxbm+"&qdzh="+qdzh+"&zdzh="+zdzh;
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmjck/selectTSDQ.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg.length>0){
				var tsdqstr="";
				for(var i=0;i<msg.length;i++){
					tsdqstr=tsdqstr+msg[i]+"、";
				}
				tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
				$("#tsdq").text(tsdqstr);
			}
		}
	});	
}
function tjsjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','sjgzlx_add2.jsp','lxxx',900,400);
}
function tjlmlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','lmgzlx_add2.jsp','lxxx',900,400);
}
function tjxjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','xjlx_add.jsp','lxxx',900,400);
}
function delsjlx(xmid,index){
	if(confirm('您确定删除吗？')){
	var data=$("#table_lx"+xmid).datagrid('getRows')[index];
	//alert();
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLxss.do',
        data:'lxsh.xmbm='+data.xmid+'&lxsh.id='+data.id+"&lxsh.xmlx=sjgz"+"&lxsh.jdbs=0",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showAll();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
	}
}

function dellmlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=lmgz",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showAlllmgz();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}
function delxjlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=xj",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showAllxj();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}

function cxqdmc(lxbm,qdzh){
	$('#qdmc').val('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxqdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#qdmc').val(msg.qdmc);
		}
	});
}
function cxzdmc(lxbm,qdzh){
	$('#zdmc').val('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxzdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#zdmc').val(msg.zdmc);
		}
	});
}

function checkdfzc(str){
	checkSZ(str);
	$("#dfzc").html('');
	var tz=0;var bzcs=0;
	if($("#tz").val()!='')
		tz=parseFloat($("#tz").val());
	if($("#bzcs").val()!='')
		bzcs=parseFloat($("#bzcs").val());
	if(bzcs>tz){
		alert("投资不能小于补助测算");
		return
	}
	var dfzc=accSub(tz,bzcs);
	$("#dfzc").html(dfzc);
}
function checkdfzc1(str){
	checkSZ(str);
	$("#dfzc").html('');
	var tz=0;var bzcs=0;
	if($("#tz").val()!='')
		tz=parseFloat($("#tz").val());
	if($("#bzcs").val()!='')
		bzcs=parseFloat($("#bzcs").val());
	if(bzcs>tz){
		alert("投资不能小于补助测算");
		return
	}
	var dfzc=accSub(tz,bzcs);
	$("#dfzc").html(dfzc);
}

function import_sjgz(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '立项审核信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importsjgzlxsh.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}

function import_lmgz(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '立项审核信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importlmgzlxsh.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}

function import_xj(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '立项审核信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importxjlxsh.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
//------------------------------------------
function showAlllmgz__ck(){
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
	var sbthcd='';
	var yhjb=$.cookie("unit2");
	if(yhjb.length==11){
		sbthcd=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		sbthcd=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		sbthcd=7;
	}
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);n(",");
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combotree('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshLjLmgz.do',
		data:{lsjl:lsjl,xzqh:xzqhstr,gydw:gydwstr,xmmc:xmmc,xmnf:xmnf,sbzt:sbzt,
			tsdq:tsdq,jsdj:jsdj,gldj:gldj,sbthcd:sbthcd},
		dataType:'json',
		success:function(msg){
			$('#xmsl').html(msg.XMSL);
			$('#tz').html(msg.TZ);
			$('#lc').html(msg.LC);
			$('#bzcs').html(msg.BZCS);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        /*{field:'c',title:'操作',width:180,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del1('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb1('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+',"sq")">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:120,align:'center'},
		    {field:'zdmc',title:'止点名称',width:120,align:'center'},
		    {field : 'lc',title : '里程',width : 90,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					/*{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						var result ='<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
							result+= '&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
						}
						if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							result+='&nbsp;删除';
						return result;
					}},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
function showAll__ck(){
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
	var sbthcd='';
	var yhjb=$.cookie("unit2");
	if(yhjb.length==11){
		sbthcd=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		sbthcd=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		sbthcd=7;
	}
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combotree('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshLjLmsj.do',
		data:{lsjl:lsjl,xzqh:xzqhstr,gydw:gydwstr,xmmc:xmmc,xmnf:xmnf,sbzt:sbzt,
			tsdq:tsdq,jsdj:jsdj,gldj:gldj,sbthcd:sbthcd},
		dataType:'json',
		success:function(msg){
			$('#xmsl').html(msg.XMSL);
			$('#tz').html(msg.TZ);
			$('#lc').html(msg.LC);
			$('#bzcs').html(msg.BZCS);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        /*{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+',"sq")">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:100,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
	        	formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 100,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 80,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 80,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 80,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:120,align:'center'},
		    {field:'zdmc',title:'止点名称',width:120,align:'center'},
		    {field : 'lc',title : '里程',width : 90,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
		           /*{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
		        	   var result ='<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
		        	   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
		        		   result+='&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
		        	   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
		        		   result+= '&nbsp;删除';
		        	   return result;
		           }},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
function showAllxj__ck(){
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
	var sbthcd='';
	var yhjb=$.cookie("unit2");
	if(yhjb.length==11){
		sbthcd=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		sbthcd=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		sbthcd=7;
	}
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshLjXj.do',
		data:{xzqh:xzqhstr,gydw:gydwstr,xmmc:xmmc,xmnf:xmnf,sbzt:sbzt,
			tsdq:tsdq,jsdj:jsdj,gldj:gldj,sbthcd:sbthcd},
		dataType:'json',
		success:function(msg){
			$('#xmsl').html(msg.XMSL);
			$('#tz').html(msg.TZ);
			$('#lc').html(msg.LC);
			$('#bzcs').html(msg.BZCS);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	       /* {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    '+'删除 ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="del2('+index+')">删除</a>  ';
	        }},
	        {field:'c1',title:'上报状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shangb2('+index+')">未上报</a>  ';
	        	else if(row.sbzt1=='1')
	        		return '已上报';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+',"sq")">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	var parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					/*{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxjlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}

function showAlllmsh__ck(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmgz.do',
		data:{lsjl:lsjl,xzqh:xzqhstr,gydw:gydwstr,xmmc:xmmc,xmnf:xmnf,sbzt:sbzt,
			tsdq:tsdq,jsdj:jsdj,gldj:gldj},
		dataType:'json',
		success:function(msg){
			$('#xmsl').html(msg.XMSL);
			$('#tz').html(msg.TZ);
			$('#lc').html(msg.LC);
			$('#bzcs').html(msg.BZCS);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        /*{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh1('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    		},
    			columns:[[
					/*{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							return '<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						}
					},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
function showAllsjsh__ck(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjLmsj.do',
		data:{lsjl:lsjl,xzqh:xzqhstr,gydw:gydwstr,xmmc:xmmc,xmnf:xmnf,sbzt:sbzt,
			tsdq:tsdq,jsdj:jsdj,gldj:gldj},
		dataType:'json',
		success:function(msg){
			$('#xmsl').html(msg.XMSL);
			$('#tz').html(msg.TZ);
			$('#lc').html(msg.LC);
			$('#bzcs').html(msg.BZCS);
		}
	});
	$('#datagrid').datagrid({
	    url:'/jxzhpt/qqgl/selectSjgzshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	       /* {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		queryParams: {
	    			'lx.jdbs':0,
	    			'lx.xmid':row.xmbm,
	    			'lx.sffirst':'1'
	    		},
    			columns:[[
    			    /*{field:'cz',title:'操作',width:150,align:'center',
    			    	formatter: function(value,row,index){
    			    		return '<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
    			    	}
    			    },*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	});
}
function showAllxjsh__ck(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	if(xmnf=='')
		xmnf=new Date().getFullYear();
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var sbzt=$("#sbzt").combobox('getValue');
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryLxshShLjXj.do',
		data:{xzqh:xzqhstr,gydw:gydwstr,xmmc:xmmc,xmnf:xmnf,sbzt:sbzt,
			tsdq:tsdq,jsdj:jsdj,gldj:gldj},
		dataType:'json',
		success:function(msg){
			$('#xmsl').html(msg.XMSL);
			$('#tz').html(msg.TZ);
			$('#lc').html(msg.LC);
			$('#bzcs').html(msg.BZCS);
		}
	});
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjshList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-180,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        /*{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){	        	
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+
	        	'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh2('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'历史记录',width:60,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 180,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 180,align : 'center'},
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'ghlxbh',title : '路线编号',width : 180,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field:'qdmc',title:'起点名称',width:150,align:'center'},
		    {field:'zdmc',title:'止点名称',width:150,align:'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'tz',title : '投资',width : 100,align : 'center'},
		    {field : 'bzys',title : '补助测算',width : 100,align : 'center'},
		    {field : 'dfzc',title : '地方自筹',width : 100,align : 'center'},
		    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':0,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
    			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
    			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
    			    {field:'ghlxbh',title:'原路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'原起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'原止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}




function jslc(){
	var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
	if($('#yilc').val()!='')
		yilc=parseFloat($('#yilc').val());
	if($('#erlc').val()!='')
		erlc=parseFloat($('#erlc').val());
	if($('#sanlc').val()!='')
		sanlc=parseFloat($('#sanlc').val());
	if($('#silc').val()!='')
		silc=parseFloat($('#silc').val());
	if($('#wllc').val()!='')
		wllc=parseFloat($('#wllc').val());
	if($('#dwlc').val()!='')
		dwlc=parseFloat($('#dwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#lc').html(hj5);
}


function thwshlxshgsd(){
	var rows=$('#datagrid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt!='1'){
			alert('请您勿勾选未审核的项目');
			return;
		}
	}
	
	var xmbm1=rows[0].xmbm;
	xmlx=xmbm1.substr(10,1);
	
	for ( var i = 1; i < rows.length; i++) {
		xmbm1+=","+rows[i].xmbm;
	}
	xmbm=xmbm1;
	//alert(xmlx);
	sbthcd=$.cookie("unit2").length+2;
	if(confirm('您确定退回吗？')){
		var data = "lxsh.xmbm="+xmbm+"&lxsh.sbthcd="+sbthcd+"&lxsh.xmlx="+xmlx;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/thwshlxsh.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('退回成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('退回失败,请检查项目阶段！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	
	}
}
