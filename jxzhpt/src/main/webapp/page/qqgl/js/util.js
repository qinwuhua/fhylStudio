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
//-------------------------------------------公用方法

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
				alert("此处请输入数字！");
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
	    url:'../../../jhgl/queryTsdq.do',
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
	    url:'../../../jhgl/queryTsdq.do',
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
		url:'../../../qqgl/queryFileByXmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#sjpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				$("#sjpfTable").append(tr);
			}
		}
	});
}
/**
 * 下载文件
 * @param id 文件ID
 */
function downFile(id){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.id="+id;
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
function importJhsh(xmlx){
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
function queryZjxd(xmbm){
	grid.id="zjxdList";
	grid.url="../../../jhgl/queryZjxdByXmId.do";
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
		{field : 'xdzj',title : '下达总资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}]];
	gridBind1(grid);
}
function deleteZjxdById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/dropZjxdById.do',
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
	openWindow('jhxd','计划下达','/jxzhpt/page/qqgl/jhsh/'+url,920,300);
}
function openZjzj(index,xmlx){
	YMLib.Var.row=$('#grid').datagrid("getRows")[index];
	YMLib.Var.xmlx=xmlx;
	openWindow('zjzj','资金追加','/jxzhpt/page/qqgl/jhsh/zjzj.jsp',800,300);
}
function updateZjxdById(index,url){
	YMLib.Var.row=$('#zjxdList').datagrid("getRows")[index];
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下发','/jxzhpt/page/qqgl/zjxd/'+url,800,300);
}
function openZjxd(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下发','/jxzhpt/page/qqgl/zjxd/zjxd.jsp',800,300);
}
function openZjxd1(){
	YMLib.Var.xmid=parent.YMLib.Var.xmbm;
	openWindow('zjxd','资金下发','/jxzhpt/page/qqgl/zjxd/zjxd1.jsp',800,300);
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
		YMLib.Var.xmlx=xmlx;
	}
	YMLib.UI.createWindow1(id,title,url,id,width,height,function(){
		if(id=="lmsjedit"){
			queryLmsj();
		}else if(id=="lmgzedit"){
			queryLmgz();
		}else if(id=="xjgcedit"){
			queryXj();
		}else if(id=="yhdzxadd" || id=="yhdzxedit"){
			queryYhdzx();
		}else if(id=="shxmadd" || id=="shxmedit"){
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
	var gydws = $("#"+id).combotree("getValues");
	if(gydws.length==0 || gydws.length==1){
		result=$.cookie("unit2");
	}else{
		result=gydws.join(',');
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
	var xzqhs = $("#"+id).combotree("getValues");
	if(xzqhs.length==0 || xzqhs.length==1){
		result=$.cookie("dist2");
	}else{
		result=xzqhs.join(',');
	}
	return result;
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
		onUnselect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.pop(rowData.xmbm);
		},
		detailFormatter:function(index,row){
			return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';
		},
		onExpandRow:function(index,row){
			$('#table_lx'+index).datagrid({
				url:'/jxzhpt/qqgl/selectSjgzlxList.do',
				queryParams:{
					xmbm:row.xmbm
				},
    			columns:[[
					{field:'gydw',title:'管养单位',width:150,align:'center'},    
					{field:'xzqh',title:'行政区划',width:150,align:'center'},
					{field:'lxmc',title:'路线名称',width:120,align:'center'},
					{field:'ghlxbh',title:'路线编码',width:100,align:'center'},
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
//此对象为绑定列表对象
var grid={
		url:null,queryParams:null,height:null,width:null,fitColumns:false,
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
	    onUnselect:Rh.onUnselect,
	    onClickRow:Rh.onClickRow,
	    onLoadSuccess:Rh.onLoadSuccess,
	    view:grid.view,
	    detailFormatter:Rh.detailFormatter,
	    onExpandRow:Rh.onExpandRow
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