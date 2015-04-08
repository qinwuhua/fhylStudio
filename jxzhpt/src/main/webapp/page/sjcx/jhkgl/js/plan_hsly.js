var gridObj;//列表对象
var selRow=new Array();//已选择的行号
function querySumHsly(){
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumHsly.do',
		dataType:'json',
		success:function(data){
			if(data!=null){
				$('#lblCount').html(data.id);
				$('#lblGMHJ').html(data.jsgmhj);
				$('#lblYJGL').html(data.jsgmy);
				$('#lblEJGL').html(data.jsgme);
				$('#lblSJGL').html(data.jsgms);
				$('#lblSIJGL').html(data.jsgmf);
				$('#lblDLDQ').html(data.jsgmdldq);
				$('#lblDLDQ').html(data.jsgmdldq);
				$('#lblZTZ').html(data.ztz);
				$('#lblZYTZ').html(data.zytz);
			}
		}
	});
}
function exportHsly(filename){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+filename;
}
function sbnf(id){
	var myDate = new Date();
	var years=[];
	for(var i=0;i<=10;i++){
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
}
function hslyglxm(hsly){
	var params={'hsly.xzqhdm':hsly.xzqhdm,'hsly.jhnf':hsly.jhnf,'hsly.xmmc':hsly.xmmc};
	var grid={id:'grid',url:'../../../jhgl/queryHslyList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
	        	var result='<a href=javascript:locationXm("'+row.lxbm+'")  style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'hslygl_xx','红色旅游公路项目计划详情','../jhkxx/hslygl.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	return result;
	        }},
//	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
//	        	return '<a style="text-decoration:none;color:#3399CC;">资金追加</a>';
//	        }},
	        {field:'c4',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划年份';
	        }},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'ztz',title:'总投资',width:82,align:'center'},
	        {field:'kgn',title:'开工年',width:80,align:'center'},
	        {field:'wgn',title:'完工年',width:80,align:'center'},
	    ]],
	    onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}

function queryHslyXx(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryHslyById.do',
		data:"hsly.id="+id,
		dataType:'json',
		success:function(data){
			$('#lblXMMC').html(data.xmmc);
			$('#lblXZQHMC').html(data.xzqhmc);
			$('#lblJHNF').html(data.jhnf);
			$('#lblJSGMHJ').html(data.jsgmhj);
			$('#lblJSGMY').html(data.jsgmy);
			$('#lblJSGME').html(data.jsgme);
			$('#lblJSGMS').html(data.jsgms);
			$('#lblJSGMF').html(data.jsgmf);
			$('#lblJSGMDLDQ').html(data.jsgmdldq);
			$('#lblZTZxx').html(data.ztz);
			$('#lblZYTZxx').html(data.zytz);
			$('#lblDFZC').html(data.dfta);
			$('#lblGNDK').html(data.gndk);
			$('#lblLYWZ').html(data.lywz);
			$('#lblJSXZ').html(data.jsxz);
			$('#lblGKPFWH').html(data.gkpfwh);
			$('#lblSGTPFWH').html(data.sgtpfwh);
			$('#lblZYJSNR').html(data.zyjsnr);
			$('#lblXZSCNL').html(data.xzscl);
		}
	});
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryHslyZjzj.do',
		data:"hsly.id="+id,
		dataType:'json',
		success:function(data){
			if(data.rows!=null && data.rows!=''){
				$('#hslygl_xiangxi').append('<tr style="height: 25px;"><td colspan="6"style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">红色旅游公路资金信息</td></tr>');
				$.each(data.rows,function(index,item){
					$('#hslygl_xiangxi').append('<tr style="height: 30px;"><td colspan="6"style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: left; padding-left: 50px; color: red;">【'+item.jhnf+'】年资金追加</td></tr>');
					$('#hslygl_xiangxi').append('<tr style="height: 30px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">建议计划总投资</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+item.ztz+'</td><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">中央投资车购税</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+item.zytz+'</td><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">地方自筹/省级投资</td><td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+item.dfta+'</td></tr>');
					$('#hslygl_xiangxi').append('<tr style="height: 30px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">国内贷款</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+item.gndk+'</td><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">利用外资</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+item.lywz+'</td><td colspan="2" style="border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;">&nbsp;</td></tr>');
					$('#hslygl_xiangxi').append('<tr style="height: 50px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">主要建设内容</td><td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">16&nbsp;</td></tr>');
					$('#hslygl_xiangxi').append('<tr style="height: 50px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">新增生产力</td><td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px; margin-bottom: 5px;">16&nbsp;</td></tr>');
				});
			}
		}
	});
	$('#hslygl_xiangxi').append("<tr  align='center' style='height: 30px;text-align: center;'><td align='center'; colspan='6'><img alt='确定'  style='text-align: center;' src='/jxzhpt/images/Button/qd1.gif' onmouseover='this.src='/jxzhpt/images/Button/qd2.gif'' onmouseout='this.src='/jxzhpt/images/Button/qd1.gif'  onclick=$('#hslygl_xx').dialog('close') /></td></tr>");
}

/**
 * dataGrid绑定数据方法
 * @param grid 为dataGrid配置的JSON对象
 * id：table的id
 * url：数据路径
 * striped：斑马线效果
 * pagination：是否显示分页工具栏
 * rownumbers：是否显示行号
 * pageNumber：初始化页码
 * pageSize：初始化页面大小
 * height:初始化高度
 * columns：数据
 * queryParams:参数
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
	    onSelect:grid.onSelect,
	    onClickRow:grid.onClickRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}