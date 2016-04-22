function qxxm(str){
	var xmbm=str+"";
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/qxxm.do',
		data:"lxsh.xmbm="+str,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("项目已成功取消");
				if(xmbm.substr(10,1)=='1')
				queryLmsj();
				if(xmbm.substr(10,1)=='2')
				queryLmgz();
				if(xmbm.substr(10,1)=='3')
					queryXj();
				if(xmbm.substr(10,1)=='4')
					queryYhdzx();
				if(xmbm.substr(10,1)=='5')
					queryShxm();
			}
				
		}
	});
}
function qxxm1(str){
	var xmbm=str+"";
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/qxxmth.do',
		data:"lxsh.xmbm="+str,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("项目已成功退回");
				if(xmbm.substr(10,1)=='1')
					queryLmsj();
					if(xmbm.substr(10,1)=='2')
					queryLmgz();
					if(xmbm.substr(10,1)=='3')
						queryXj();
					if(xmbm.substr(10,1)=='4')
						queryYhdzx();
					if(xmbm.substr(10,1)=='5')
						queryShxm();
			}
				
		}
	});
}
function loadcbsjTjxx(data){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/loadcbsjTjxx.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				 $("#xmsl").html(msg.sl);
				 $("#tz").html(msg.tz);
				 $("#cgs").html(msg.bzcs);
				 $("#stz").html(msg.stz);
				 $("#sjl").html(msg.sjl);
				 $("#lc").html(msg.lc);
				 $("#dftz").html(msg.dftz);
			}else{
				$('#xmsl').html('0');
				$('#tz').html('0');
				$('#lc').html('0');
			    $("#cgs").html('0');
			    $("#stz").html('0');
			    $("#sjl").html('0');
			    $("#dftz").html('0');
			}
			
		}
	});
}
function loadcbsjbgTjxx(data){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/loadcbsjbgTjxx.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				$('#xmsl').html(msg.sl);
				$('#tz').html(msg.tz);
				$('#lc').html(msg.lc);
				$('#bzcs').html(msg.bzcs);
			}else{
				$('#xmsl').html('0');
				$('#tz').html('0');
				$('#lc').html('0');
				$('#bzcs').html('0');
			}
			
		}
	});
}

function checkSZ(str){
	var g = /(^-?\d+$)|(^(-?\d+)(\.\d+)?$)/;
	if(str.value==''){
		return;
	}
    if( !g.test(str.value)){
    	alert("请输入正确的数字");
    	$(str).val('');
    	return;
    }
}
//-------------------------------------------用户等级判断部分
/**
 * 判断用户行政登记(省、市、县)
 * @param unit2 cookie unit2中的值
 * @returns {String} 返回行政登记(省、市、县)
 */
function userPanduan(unit2){
	if(unit2.length==7){
		return "省";
	}else if(unit2.length==9){
		return "市";
	}else if(unit2.length==11){
		return "县";
	}
}
/**
 * 加载行政等级
 * @param id
 * @param name
 * @returns
 */
function loadGldj(id) {
	$('#' + id).combotree({
		url:'/jxzhpt/qqgl/loadGldj.do?xzqhdm='+$.cookie("dist2"),
		panelHeight:200,
		multiple:true
	});
}
//--------------------------------------------------路线操作--------------------------------------
/**
 * 项目年份
 * @param id 元素ID
 */
function xmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
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
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
	$('#id'+myDate.getFullYear()).attr('checked', true);
}
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
		result="水毁项目";
	}else if(xmlx=="6"){
		result="养护中心项目";
	}
	return result;
}
/**
 * 添加路线弹窗
 * @param xmbm 项目编码
 * @param jdbs 阶段标示
 */
function openLxAdd(id,xmbm,jdbs){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.jdbs=jdbs;
	YMLib.Var.id=id;
	openWindow(id,'添加路线','/jxzhpt/page/qqgl/jhsh/lx_add2.jsp',980,400);
}
function openLxAddyh(id,xmbm,jdbs){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.jdbs=jdbs;
	YMLib.Var.id=id;
	openWindow(id,'添加路线','/jxzhpt/page/qqgl/jhsh/lx_addyh.jsp',980,400);
}
/**
 * 初步设计添加路线弹窗
 * @param xmbm 项目编码
 * @param jdbs 阶段标示
 */
function openLxAdd2(id,xmbm,jdbs){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.jdbs=jdbs;
	YMLib.Var.id=id;
	openWindow(id,'添加路线','/jxzhpt/page/qqgl/cbsj/lx_add.jsp',980,400);
}
/**
 * 删除路线
 * @param id
 */
function deleteLx(id,xmlx){
	var params={'lx.id':id};
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
		data:params,
		dataType:'json',
		success:function(msg){
			if(msg.result=="true"){
				alert("删除成功!");
				if(xmlx=="4"){
					queryYhdzx();
				}else if(xmlx=="5"){
					queryShxm();
				}
			}
		}
	});
}
//--------------------------------------------------公用方法---------------------------------------
/**
 * 导出模板
 * @param fileName 模板文件名称
 */
function exportTemplet(fileName){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+fileName;
}
/**
 * 导入Excel文件
 * @param url 提交的URL路径
 * @param flag
 */
function importExcel(url,flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+flag,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
}
function importExcelqwh(url,flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload1.jsp?url='+url+'&flag='+flag,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
}
function accSub(arg1,arg2){
	 var r1,r2,m,n;
	 try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;}
	try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;}
	m=Math.pow(10,Math.max(r1,r2));
	//last modify by deeka
	//动态控制精度长度
	n=(r1>=r2)?r1:r2;
	return ((arg1*m-arg2*m)/m).toFixed(n);
	}
/**
 * 历史记录弹窗
 * @param xmbm 项目编码
 */
function openLsjl(xmbm){
	YMLib.Var.xmbm=xmbm;
	openWindow('lsjlwindow','历史记录','/jxzhpt/page/qqgl/jhsh/lsjl.jsp',980,300);
}
/**
 * 查询桩号地方名称
 * @param id 桩号元素ID
 */
function querymc(id){
	if(id=="qdzh"){
		cxqdmc($('#ylxbh').val(),$('#qdzh').val());
	}else if(id=="zdzh"){
		cxzdmc($('#ylxbh').val(),$('#zdzh').val());
	}
	queryJsdjAndLc($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
	$('#lc').val(accSub(parseFloat($('#zdzh').val()),parseFloat($('#qdzh').val())));
}
/**
 * 查询桩号地方名称
 * @param id 桩号元素ID
 * @param lxbm 路线编码元素ID
 */
function querymc2(id,lxbm){
	if(id=="qdzh"){
		cxqdmc($('#'+lxbm).val(),$('#qdzh').val());
	}else if(id=="zdzh"){
		cxzdmc($('#'+lxbm).val(),$('#zdzh').val());
	}
	queryJsdjAndLc($('#'+lxbm).val(),$('#qdzh').val(),$('#zdzh').val());
	$('#lc').val(accSub(parseFloat($('#zdzh').val()),parseFloat($('#qdzh').val())));
}
/**
 * 根据路线编码和起点桩号查询起点名称
 * @param lxbm 路线编码
 * @param qdzh  起点桩号
 */
function cxqdmc(lxbm,qdzh){
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
/**
 * 根据路线编码和止点桩号查询止点名称
 * @param lxbm 路线编码
 * @param zdzh 止点桩号
 */
function cxzdmc(lxbm,zdzh){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxzdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$('#zdmc').val(msg.zdmc);
		}
	});
}
/**
 * 查询起止点桩号间的技术等级和里程
 * @param lxbm
 * @param qdzh
 * @param zdzh
 * @returns
 */
function queryJsdjAndLc(lxbm,qdzh,zdzh){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryJsdjAndLcByStartAndEnd.do',
        data:'lx.lxbm='+lxbm+'&lx.qdzh='+qdzh+'&lx.zdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$('#yilc').val(msg.yilc);
			$('#erlc').val(msg.erlc);
			$('#sanlc').val(msg.sanlc);
			$('#silc').val(msg.silc);
			$('#dwlc').val(msg.dwlc);
			$('#wllc').val(msg.wllc);
			if($('#jsdj')){
				$('#jsdj').val(msg.xjsdj);
			}
		}
	});
}
/**
 * 验证文本内容
 * @param id 元素ID
 * @param type 验证类型(数字)
 */
function validateText(id,type,result){
	if(!result){
		return result;
	}
	if($('#'+id).val()=='' || $('#'+id).val()==null){
		alert($('#'+id).parent().prev().html()+"不能为空！");
		return false;
	}
	if(type!=null){
		var reg=null;
		if(type=="number"){
			reg = new RegExp("^[0-9]*$");
			var double=new RegExp("^[0-9]*.[0-9]*$");
			if(!reg.test($('#'+id).val()) && !double.test($('#'+id).val())){
				alert($('#'+id).parent().prev().html()+"需要输入数字！");
				$('#'+id).focus();
				return false;
			}
		}
	}
	return result;
}
/**
 * 加载特殊地区下拉列表
 * @param id 元素ID
 */
function loadTsdq(id){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text'
	});
}
/**
 * 加载特殊地区下拉列表
 * @param id 元素ID
 * @param multiple 是否多选
 */
function loadTsdq(id,multiple){
	$('#'+id).combobox({    
	    url:'/jxzhpt/jhgl/queryTsdq.do',
	    valueField:'id',
	    textField:'text',
	    multiple:multiple,
	    onSelect:function(){
	    	$('#tsdq').val($('#'+id).combobox("getText"));
	    }
	});
}
/**
 * 查询设计批复文件
 * @param xmbm
 */
function fileShow(xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#sjpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
				'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>  |  ' +
				"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				$("#sjpfTable").append(tr);
			}
		}
	});
}
/**
 * 查询设计批复文件
 * @param id 元素ID
 * @param xmbm 项目编码
 * @param type 文件类型
 */
function fileShow1(id,xmbm,type){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#"+id).empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
				'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>  |  ' +
				"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				$("#"+id).append(tr);
			}
		}
	});
}
/**
 * 下载文件
 * @param id 文件ID
 */
function downFile(fileurl,filename){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
}
/**
 * 删除文件
 * @param id 文件ID
 */
function deleteFile(id){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 fileShow(parent.YMLib.Var.xmbm);
				 }else{
					 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
/**
 * 导入计划审核信息
 * @param xmlx 项目类型
 * @returns {Boolean} 结果？
 */
function importJhsh(xmlx){
	if(xmlx==null){
		var xmlx1=$("#xmlx").combobox("getValues").join(",");
		if(xmlx1.substr(0,1)==',')
			xmlx1=xmlx1.substr(1,xmlx1.length);
		if(xmlx1=='改建工程'){
			xmlx=1;
		}
		else if(xmlx1=='路面改造工程'){
			xmlx=2;
		}
		else if(xmlx1=='新建工程'){
			xmlx=3;
		}else{
			alert('请在项目类型复选框中选择一种项目类型(只一种)');
			return;
		}
			
	}
	var url="/jxzhpt/qqgl/importExcelJhxd.do?xmlx="+xmlx;
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+xmlx,
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
/**
 * 导入资金下达信息
 * @param xmlx
 * @returns {Boolean}
 */
function importJhshZjzj(xmlx){
	var url="/jxzhpt/jhgl/importJhshZjzj.do?gydwdm="+$.cookie("unit");
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '请选择EXCEL文档！',
		page : '/jxzhpt/js/uploader/upload.jsp?url='+url+'&flag='+xmlx,
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
/**
 * 查询资金下达列表
 * @param xmbm
 */
function queryZjxd(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'操作',width:100,align:'center',
			formatter : function(value, row, index) {
				var result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				if(xmbm.substring(10,11)==4){
					result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit1.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				}
				result += '<a href="javascript:deleteZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				return row.sfzj == "0" ? "否" : "是";
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}
function queryZjxdyh(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'操作',width:100,align:'center',
			formatter : function(value, row, index) {
				var result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				if(xmbm.substring(10,11)==4){
					result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit1.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				}
				result += '<a href="javascript:deleteZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				return row.sfzj == "0" ? "否" : "是";
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stc',title : '省统筹',width : 150,align : 'center'}, 
		{field : 'dk',title : '贷款',width : 150,align : 'center'}, 
		{field : 'ztz',title : '总投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}


function queryYhzxZjxd(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'操作',width:100,align:'center',
			formatter : function(value, row, index) {
				var result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_editYhzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
//				if(xmbm.substring(10,11)==4){
//					result = '<a href="javascript:updateZjxdById('+"'"+index+"','zjxd_edit1.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
//				}
				result += '<a href="javascript:deleteZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'btzzj',title : '重点打造奖励',width : 150,align : 'center'},
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}

function queryYhzxZjxdxx(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金（万元）',width : 150,align : 'center'},
		{field : 'stz',title : '省投资（万元）',width : 150,align : 'center'}, 
		{field : 'btzzj',title : '重点打造奖励（万元）',width : 150,align : 'center'},
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}

function queryxZjxd(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field:'cz',title:'操作',width:100,align:'center',
			formatter : function(value, row, index) {
				var result = '<a href="javascript:updateZjxdById('+"'"+index+"','xzjxd_edit.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				if(xmbm.substring(10,11)==4){
					result = '<a href="javascript:updateZjxdById('+"'"+index+"','xzjxd_edit1.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
				}
				result += '<a href="javascript:deleteZjxdById('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
				return result;
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'yhdk',title : '银行贷款',width : 150,align : 'center'}, 
		{field : 'gz',title : '国债',width : 150,align : 'center'}, 
		{field : 'gzzq',title : '国债债券',width : 150,align : 'center'}, 
		{field : 'sz',title : '省债',width : 150,align : 'center'}, 
		{field : 'szzq',title : '省债债券',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}
function queryxZjxd1(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'yhdk',title : '银行贷款',width : 150,align : 'center'}, 
		{field : 'gz',title : '国债',width : 150,align : 'center'}, 
		{field : 'gzzq',title : '国债债券',width : 150,align : 'center'}, 
		{field : 'sz',title : '省债',width : 150,align : 'center'}, 
		{field : 'szzq',title : '省债债券',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}

function queryZjxd1(xmbm){
	grid.id="zjxdList";
	grid.url="/jxzhpt/jhgl/queryZjxdByXmId.do";
	var params={'zjxd.xmid':xmbm};
	grid.queryParams=params;
	grid.height=$(window).height()-180;
	grid.width=$('#searchField').width();
	grid.pageSize=5;
	grid.pageNumber=1;
	grid.columns=[[
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				return row.sfzj == "0" ? "否" : "是";
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}
/**
 * 删除资金下达
 * @param id
 */
function deleteZjxdById(id){
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/dropZjxdById.do',
		dataType:'json',
		data:'zjxd.id='+id,
		success:function(data){
			if(data.result=="true"){
				alert("删除成功！");
				$('#zjxdList').datagrid("reload");
			}else{
				alert("删除失败！");
			}
		}
	});
}
/**
 * 用于养护大中修合水毁的计划下达
 */
function openJhxd1(url,index){
	YMLib.Var.row=$('#grid').datagrid("getRows")[index];
	YMLib.Var.xmlx=xmlx;
	openWindow('jhxd','计划审核','/jxzhpt/page/qqgl/jhsh/'+url,920,300);
}
function openZjzj(index,xmlx){
	YMLib.Var.row=$('#grid').datagrid("getRows")[index];
	YMLib.Var.xmlx=xmlx;
	openWindow('zjzj','资金追加','/jxzhpt/page/qqgl/jhsh/zjzj.jsp',800,300);
}
function updateZjxdById(index,url){
	YMLib.Var.row=$('#zjxdList').datagrid("getRows")[index];
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/'+url,800,300);
}
function openZjxd(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/zjxd.jsp',800,300);
}
function openZjxd1(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/zjxd1.jsp',800,300);
}
function openZjxdYhzx(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/zjxd_addYhzx.jsp',800,300);
}
function openxZjxd(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/xzjxd.jsp',800,300);
}
function openxZjxd1(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下达','/jxzhpt/page/qqgl/zjxd/xzjxd1.jsp',800,300);
}
/**
 * 弹出窗口
 * @param id 窗口ID
 * @param title 窗口标题
 * @param url 窗口页面的路径
 * @param width 窗口的宽度
 * @param height 窗口的高度
 */
function openWindow(id,title,url,width,height){
	YMLib.Var.xmbm=xmbm;
	if(id=="jhxd" || id=="zjzj"){
		//alert(xmbm.substr(10,1)+"    "+xmlx);
		//if(xmlx==null)
			YMLib.Var.xmlx=xmbm.substr(10,1);
		//else
		   // YMLib.Var.xmlx=xmlx;
		
	}
	YMLib.UI.createWindow1(id,title,url,id,width,height,function(){
		if(id=="lmsjedit" || id=="lmsj"){
			queryLmsj();
		}else if(id=="gsdgzbz" || id=="gsdgzbz"){
			queryxmList();
		}else if(id=="lmgzedit" || id=="lmgz"){
			queryLmgz();
		}else if(id=="xjgcedit" || id=="xjgc"){
			queryXj();
		}else if(id=="yhdzxadd" || id=="yhdzxedit" || id=="yhdzx"){
			queryYhdzx();
		}else if(id=="shxmadd" || id=="shxmedit" || id=="shxm"){
			queryShxm();
		}
		if((id=="jhxd" || id=="zjzj") && xmlx==1){
			queryLmsj();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==2){
			queryLmgz();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==3){
			queryXj();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==4){
			queryYhdzx();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==5){
			queryShxm();
		}
	});
}
/**
 * 关闭弹出窗口
 * @param id
 */
function closeWindow(id){
	parent.$('#'+id).window("destroy");
}
/**
 * 获取管养单位选中值
 * @param id 元素ID
 * @returns {String} 所选中的值
 */
function getgydw(id){
	var result="";
	
	var gydw = $("#"+id).combotree("getValues");
	/*if(gydws.length==0 || gydws.length==1){
		result=$.cookie("unit2");
	}else{
		result=gydws.join(',');
	}*/
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			result='36';
		else result= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		result=gydw[0] ;
		}else{
			result= gydw.join(',');
		}
	
	return result;
}
/**
 * 获取行政区划选中的值
 * @param id 元素ID
 * @returns {String} 选中的行政区划
 */
function getxzqhdm(id){
	var result="";
	var xzqhdm = $("#"+id).combotree("getValues");
	/*if(xzqhs.length==0 || xzqhs.length==1){
		result=$.cookie("dist2");
	}else{
		result=xzqhs.join(',');
	}*/
	if(xzqhdm.length==0){
		result= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		result=xzqhdm[0] ;
		}else{
			result= xzqhdm.join(',');
		}
	
	
	return result;
}
function updateLxWin(index,xmbm,id){
	var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.Var.id=id;
	if(xmbm.substring(10,11)=="1"){
		YMLib.UI.createWindow(id,'编辑路线信息','sjgzlx_edit.jsp',id,900,350);
	}else if(xmbm.substring(10,11)=="2"){
		YMLib.UI.createWindow(id,'编辑路线信息','lmgzlx_edit.jsp',id,900,350);
	}
	YMLib.UI.createWindow(id,'编辑路线信息','lx_add.jsp',id,900,350);
}
function loadLxWin(index,xmbm,id){
	var data=$("#table_lx"+xmbm).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.UI.createWindow(id,'编辑路线信息','lx_xx.jsp',id,900,350);
}
//--------------------------------------------------------easyui部分
var gridObj;//datagrid 对象
var Rh={
		onLoadSuccess:function(data){
		},
		onClickRow:function(rowIndex, rowData){
		},
		onSelect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.push(rowData.xmbm);
		},
		onSelectAll:function(rows){
			if(selArray.length<rows.length){
				selArray.splice(0,selArray.length);
				$.each(rows,function(index,item){
					selArray.push(item.xmbm);
				});
			}else if(selArray.length==rows.length){
				selArray.splice(0,selArray.length);
			}
		},
		onUnselect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.pop(rowData.xmbm);
		},
		detailFormatter:function(index,row){
			return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';
		},
		onExpandRow:function(index,row){
			$('#table_lx'+row.xmbm).datagrid({
				url:'/jxzhpt/qqgl/selectlxList.do',
				queryParams:{
					'lx.xmid':row.xmbm,
					'lx.jdbs':YMLib.Var.jdbs,
					'lx.sffirst':'1'
				},
    			columns:[[
    			    {field:'cz',title:'操作',width:150,align:'center',
    			    	formatter:function(value,row,index){
    			    		var result='<a href="javascript:updateLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">编辑</a>';
    			    		result +='&nbsp;<a href="javascript:deleteLx('+"'"+row.id+"',"+"'"+row.xmid.substring(10,11)+"'"+')" style="color:#3399CC;">删除</a>';
    			    		return result;
    			    	}
    			    },
					{field:'gydw',title:'管养单位',width:150,align:'center'},    
					{field:'xzqh',title:'行政区划',width:150,align:'center'},
					{field:'lxmc',title:'路线名称',width:120,align:'center'},
					{field:'lxbm',title:'路线编码',width:100,align:'center'},
					{field:'qdzh',title:'起点桩号',width:80,align:'center'},
					{field:'zdzh',title:'止点桩号',width:80,align:'center'},
					{field:'qdmc',title:'起点名称',width:100,align:'center'},
					{field:'zdmc',title:'止点名称',width:100,align:'center'},
					{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
					{field:'xjsdj',title:'现技术等级',width:80,align:'center'},
					{field:'lc',title:'里程',width:60,align:'center'}
    			]],
    			onLoadSuccess:function(){
    				$('#'+grid.id).datagrid('fixDetailRowHeight',index);
    	        }
	    	});
		}
	};

var Qwh={
		onLoadSuccess:function(data){
		},
		onClickRow:function(rowIndex, rowData){
		},
		onSelect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.push(rowData.xmbm);
		},
		onSelectAll:function(rows){
			if(selArray.length<rows.length){
				selArray.splice(0,selArray.length);
				$.each(rows,function(index,item){
					selArray.push(item.xmbm);
				});
			}else if(selArray.length==rows.length){
				selArray.splice(0,selArray.length);
			}
		},
		onUnselect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.pop(rowData.xmbm);
		},
		detailFormatter:function(index,row){
			return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';
		},
		onExpandRow:function(index,row){
			$('#table_lx'+row.xmbm).datagrid({
				url:'/jxzhpt/qqgl/selectlxList.do',
				queryParams:{
					'lx.xmid':row.xmbm,
					'lx.jdbs':YMLib.Var.jdbs,
					'lx.sffirst':'1'
				},
    			columns:[[
    			    {field:'cz',title:'操作',width:150,align:'center',
    			    	formatter:function(value,row,index){
    			    		var result='<a href="javascript:updateLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">编辑</a>';
    			    		result +='&nbsp;<a href="javascript:deleteLx('+"'"+row.id+"',"+"'"+row.xmid.substring(10,11)+"'"+')" style="color:#3399CC;">删除</a>';
    			    		return result;
    			    	}
    			    },
					{field:'gydw',title:'管养单位',width:150,align:'center'},    
					{field:'xzqh',title:'行政区划',width:150,align:'center'},
					{field:'lxmc',title:'路线名称',width:120,align:'center'},
					{field:'lxbm',title:'路线编码',width:100,align:'center'},
					{field:'qdzh',title:'起点桩号',width:80,align:'center'},
					{field:'zdzh',title:'止点桩号',width:80,align:'center'},
					{field:'qdmc',title:'起点名称',width:100,align:'center'},
					{field:'zdmc',title:'止点名称',width:100,align:'center'},
					{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
					{field:'xjsdj',title:'现技术等级',width:80,align:'center'},
					{field:'lc',title:'里程',width:60,align:'center'},
					{field:'jsfa',title:'建设方案',width:80,align:'center'}
    			]],
    			onLoadSuccess:function(){
    				$('#'+grid.id).datagrid('fixDetailRowHeight',index);
    	        }
	    	});
		}
	};

var Rh11={
		onLoadSuccess:function(data){
		},
		onClickRow:function(rowIndex, rowData){
		},
		onSelect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.push(rowData.xmbm);
		},
		onSelectAll:function(rows){
			if(selArray.length<rows.length){
				selArray.splice(0,selArray.length);
				$.each(rows,function(index,item){
					selArray.push(item.xmbm);
				});
			}else if(selArray.length==rows.length){
				selArray.splice(0,selArray.length);
			}
		},
		onUnselect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.pop(rowData.xmbm);
		},
		detailFormatter:function(index,row){
			return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';
		},
		onExpandRow:function(index,row){
			$('#table_lx'+row.xmbm).datagrid({
				url:'/jxzhpt/qqgl/selectlxList.do',
				queryParams:{
					'lx.xmid':row.xmbm,
					'lx.jdbs':YMLib.Var.jdbs,
					'lx.sffirst':'1'
				},
    			columns:[[
    			   /* {field:'cz',title:'操作',width:150,align:'center',
    			    	formatter:function(value,row,index){
    			    		var result='<a href="javascript:updateLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">编辑</a>';
    			    		result +='&nbsp;<a href="javascript:deleteLx('+"'"+row.id+"',"+"'"+row.xmid.substring(10,11)+"'"+')" style="color:#3399CC;">删除</a>';
    			    		return result;
    			    	}
    			    },*/
					{field:'gydw',title:'管养单位',width:150,align:'center'},    
					{field:'xzqh',title:'行政区划',width:150,align:'center'},
					{field:'lxmc',title:'路线名称',width:120,align:'center'},
					{field:'lxbm',title:'路线编码',width:100,align:'center'},
					{field:'qdzh',title:'起点桩号',width:80,align:'center'},
					{field:'zdzh',title:'止点桩号',width:80,align:'center'},
					{field:'qdmc',title:'起点名称',width:100,align:'center'},
					{field:'zdmc',title:'止点名称',width:100,align:'center'},
					{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
					{field:'xjsdj',title:'现技术等级',width:80,align:'center'},
					{field:'lc',title:'里程',width:60,align:'center'}
    			]],
    			onLoadSuccess:function(){
    				$('#'+grid.id).datagrid('fixDetailRowHeight',index);
    	        }
	    	});
		}
	};
function bindLxGrid(){
	Rh.onExpandRow=function(index,row){
		$('#table_lx'+row.xmbm).datagrid({
			url:'/jxzhpt/qqgl/selectlxList.do',
			queryParams:{
				'lx.xmid':row.xmbm,
				'lx.jdbs':YMLib.Var.jdbs,
				'lx.sffirst':'1'
			},
			columns:[[
			    {field:'cz',title:'操作',width:150,align:'center',
			    	formatter:function(value,row,index){
			    		var result='<a href="javascript:loadLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">详细</a>';
			    		return result;
			    	}
			    },
				{field:'gydw',title:'管养单位',width:150,align:'center'},    
				{field:'xzqh',title:'行政区划',width:150,align:'center'},
				{field:'lxmc',title:'路线名称',width:120,align:'center'},
				{field:'lxbm',title:'路线编码',width:100,align:'center'},
				{field:'qdzh',title:'起点桩号',width:80,align:'center'},
				{field:'zdzh',title:'止点桩号',width:80,align:'center'},
				{field:'qdmc',title:'起点名称',width:100,align:'center'},
				{field:'zdmc',title:'止点名称',width:100,align:'center'},
				{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
				{field:'xjsdj',title:'现技术等级',width:80,align:'center'},
				{field:'lc',title:'里程',width:60,align:'center'}
			]],
			onLoadSuccess:function(){
				$('#'+grid.id).datagrid('fixDetailRowHeight',index);
	        }
    	});
	}
}
//此对象为绑定列表对象
var grid={
		id:null,url:null,queryParams:null,height:null,width:null,fitColumns:false,
		columns:null,striped:true,pagination:true,
		rownumbers:true,pageNumber:1,pageSize:10,
		view:detailview,detailFormatter:null,onExpandRow:null};
var xmbm;//最新选择的项目编码
var xmlx;//项目类型，用在计划下达弹窗，在设置计划审核信息时，区分项目类型
var selArray=new Array();//选中的项目编码集合
/**
 * 绑定easy-ui的datagrid表格
 * @param grid datagrid配置对象
 */
function gridBind(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Rh.onSelect,
	    onSelectAll:Rh.onSelectAll,
	    onUnselect:Rh.onUnselect,
	    onClickRow:Rh.onClickRow,
	    onLoadSuccess:Rh.onLoadSuccess,
	    view:grid.view,
	    detailFormatter:Rh.detailFormatter,
	    onExpandRow:Rh.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}
function gridBind11(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Rh11.onSelect,
	    onSelectAll:Rh11.onSelectAll,
	    onUnselect:Rh11.onUnselect,
	    onClickRow:Rh11.onClickRow,
	    onLoadSuccess:Rh11.onLoadSuccess,
	    view:grid.view,
	    detailFormatter:Rh11.detailFormatter,
	    onExpandRow:Rh11.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}

function gridBind1(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    fitColumns:grid.fitColumns,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Rh.onSelect,
	    onUnselect:Rh.onUnselect,
	    onClickRow:Rh.onClickRow,
	    onLoadSuccess:Rh.onLoadSuccess
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}
function gridBindyh(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Qwh.onSelect,
	    onSelectAll:Qwh.onSelectAll,
	    onUnselect:Qwh.onUnselect,
	    onClickRow:Qwh.onClickRow,
	    onLoadSuccess:Qwh.onLoadSuccess,
	    view:grid.view,
	    detailFormatter:Qwh.detailFormatter,
	    onExpandRow:Qwh.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}