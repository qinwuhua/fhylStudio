var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumZhfz(jh,lx){
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumZhfz.do',
		data:param,
		dataType:'json',
		success:function(data){
			$('#lblCount').html(data.id);
			if(data.id>0){
				$('#lblZLC').html(data.jckzhfz.qzlc);
				$('#lblYHLC').html(data.jckzhfz.yhlc);
				$('#lblZTZ').html(data.pfztz);
				$('#lblBTZ').html(data.jhsybzje);
				$('#lblDFTZ').html(data.jhsydfzcje);
			}else{
				$('#lblZLC').html("0");
				$('#lblYHLC').html("0");
				$('#lblZTZ').html("0");
				$('#lblBTZ').html("0");
				$('#lblDFTZ').html("0");
			}
		}
	});
}
function queryZjqf(nf){
	$.ajax({
		type:'post',
		async:false,
		url:'../../../jhgl/queryZjqfByZjqf.do',
		data:zjqf={'zjqf.gydwbm':$.cookie("unit"),'zjqf.nf':nf},
		dataType:'json',
		success:function(data){
			if(data!=null){
				$('#lblQfzj').html(data.zhfz);
			}else{
				$('#lblQfzj').html("0");
			}
		}
	});
}
function sbnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
	$('#'+id).combobox("setValue",first);
}
function openWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('zhfz_xx','灾害防治',"/jxzhpt/page/jhgl/jhkxx/zhfz.jsp",'zhfz_xx',1000,500);
}
function openEditWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('zhfz_edit','灾害防治',"/jxzhpt/page/jhgl/edit/zhfz.jsp",'zhfz_edit',1000,500);
}
function zhfzxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm('+"'"+row.jckzhfz.lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	return result;
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result="";
				if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd==2) || (roleName()=="省级" && row.jh_sbthcd<4)){
					result="未上报";
				}else if((roleName()=="县级" && row.jh_sbthcd==2) || (roleName()=="市级" && row.jh_sbthcd==4)){
					result="已上报";
				}else if((row.jh_sbthcd==4)){
					result="未审核";
				}else if((row.jh_sbthcd==6)){
					result="已审核";
				}else if((roleName()=="市级" && row.jh_sbthcd==0)){
					result="待上报";
				}
				return result;
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.qdzh;
				}
	       },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	    	   formatter : function(value, row, index) {
					return row.jckzhfz.zdzh;
				}
	    	},
	        {field:'jsgm',title:'建设规模',width:60,align:'center',
	    		formatter : function(value, row, index) {
					return row.jckzhfz.yhlc;
				}
	    	},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
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
function zhfzxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm('+"'"+row.jckzhfz.lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<4))
	        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	else
	        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
	        	return result;
	        }},
	        {field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<4)){
//					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
//					if(roleName()=="市级")
//						result+='    |    <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
	        		result="未上报";
				}else{
					result='<a style="text-decoration:none;color:black;">已上报</a>';
				}
	        	return result;
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.qdzh;
				}
	       },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	    	   formatter : function(value, row, index) {
					return row.jckzhfz.zdzh;
				}
	    	},
	        {field:'jsgm',title:'建设规模',width:60,align:'center',
	    		formatter : function(value, row, index) {
					return row.jckzhfz.yhlc;
				}
	    	},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
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

function queryZhfzById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryZhfzById.do',
		dataType:'json',
		data:'jh.id='+id,
		success:function(data){
			$.ajax({
				type : 'post',
				url : '../../../xmsck/selectSckzhfzById.do',
				data :"sckid="+data.sckid,
				dataType:'json',
				success:function(jcAndSc){
					if(jcAndSc!=null){
						//基础库
						$('#lxmc').html(jcAndSc.lxmc);
						$('#lxbm').html(jcAndSc.lxbm);
						$('#gydwxx').html(jcAndSc.gydw);
						$('#qdzh').html(jcAndSc.qdzh);
						$('#zdzh').html(jcAndSc.zdzh);
						$('#zlc').html(jcAndSc.zlc);
						$('#xzqhdm').html(jcAndSc.xzqhdm);
						$('#xzqhmc').html(jcAndSc.xzqhmc);
						$('#xjnd').html(jcAndSc.gjxjnd);
						$('#lxjsdjxx').html(jcAndSc.lxjsdj);
						$('#yhlc').html(jcAndSc.yhlc);
						$('#tsdq').html(jcAndSc.tsdq);
						$('#xmnf').html(jcAndSc.xmnf);
						$('#xmzt').html(jcAndSc.xmzt);
						$('#zhnr').html(jcAndSc.zhnr);
						$('#bz').html(jcAndSc.bz);
						//审查库
						$('#SCQDZH').html(jcAndSc.scqdzh);
						$('#SCZDZH').html(jcAndSc.sczdzh);
						$('#SCZLC').html(jcAndSc.sczlc);
						$('#SCYHLC').html(jcAndSc.scyhlc);
						$('#FAPGDW').html(jcAndSc.fapgdw);
						$('#FASCDW').html(jcAndSc.fascdw);
						$('#FASPSJ').html(jcAndSc.faspsj);
						$('#SPWH').html(jcAndSc.spwh);
						$('#TZGS').html(jcAndSc.tzgs);
						$('#JSXZ').html(jcAndSc.jsxz);
						$('#JSNR').html(jcAndSc.jsnr);
						$('#scbz').html(jcAndSc.scbz);
					}
				}
			});
			//计划信息
			$("#jhid").val(data.id);
			$('#jhnf').html(data.sbnf);
			$('#jhkgsj').html(data.jhkgsj);
			$('#jhwgsj').html(data.jhwgsj);
			$('#jhxdsj').html(data.xdsj);
			$('#jhxdwh').html(data.jhxdwh);
			$('#sjdw').html(data.sjdw);
			$('#sjpfdw').html(data.sjpfdw);
			$('#pfwh').html(data.pfwh);
			$('#pfsj').html(data.pfsj);
			$('#jhztz').html(data.pfztz);
			$('#bbz').html(data.jhsybzje);
			$('#dfzc').html(data.jhsydfzcje);
			$('#sfsqablbz').html(data.sfsqablbz);
			$('#ablbzwh').html(data.ablbzsqwh);
			$('#jhbz').html(data.bz);
			if(data.gkbgmc!=''){
				$('#xz_gkbg').html("<a href='#' onclick='downFile1()' style='text-decoration:none;color:#3399CC;'>"+data.gkbgmc+"</a>");
			}
			if(data.sjsgtmc!=''){
				$("#xz_sjsgt").html("<a href='#' onclick='downFile2()' style='text-decoration:none;color:#3399CC;'>"+data.sjsgtmc+"</a>");
			}
		}
	});
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
function editStatus(jh){
	var result;
	$.ajax({
		type:'post',
		url:'../../../jhgl/editZhfzStatus.do',
		dataType:'json',
		data:jh,
		async:false,
		success:function(data){
			if(data.result){
				result = true;
			}else{
				result = false;
			}
		},
		error:function(){
			result=false;
		}
	});
	return result;
}
