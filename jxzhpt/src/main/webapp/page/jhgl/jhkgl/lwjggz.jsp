<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
	var gridObj;//列表对象
	var oldIndex=-1;//之前选中的
	var selRow=new Array();//已选择的行号
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
	
	
	
	var gljjtj="";
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			var urlid=getUrlParame('id');
			if(urlid=='01011304010302'||urlid=='01011304010301'
				||urlid=='0101130401030203'||urlid=='0101130401030204'||urlid=='0101130402030203'
					||urlid=='0101130402030204'){
				gljjtj='';
				//xmnfdx("sbnf");
				setxmnf("sbnf",urlid);
				xzdjdx('gldj');
			}else{
				gljjtj=getgljjtj(urlid);
				if(urlid==null){
					xmnfdx("sbnf"); 
					xzdjdx('gldj');
				}else{
					setxmnf("sbnf",urlid);
					setxzdj('gldj',urlid);
				}
			}
			
			
			jsdjdx('jsdj');
			kjfldx('akjfl');
			tsdqdx('tsdq');
			
			if($.cookie("unit2").length==7 || $.cookie("unit2").length==2){
				$('#imglrjh').show();
			}
			if($("#xmlx").combobox('getValue')=='危桥改造')
				searchWqgz();
			if($("#xmlx").combobox('getValue')=='安防工程')
				searchAbgc();
			if($("#xmlx").combobox('getValue')=='灾害防治')
				searchZhfz();
			if($("#xmlx").combobox('getValue')=='隧道')
				searchBhsd();
		});
		function tjwqgz(){
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jsdj=$("#jsdj").combobox("getValues").join(",");
			if(jsdj.substr(0,1)==',')
				jsdj=jsdj.substr(1,jsdj.length);
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var akjfl=$("#akjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var jh={jhnf:xmnf,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:jsdj,gldj:gldj,lxbm:$('#lxbm').val(),qlmc:null,qlbh:null,akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				var xian=true;
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
					xian=false;
				}
				if($('#ddlSHZT').combo("getValue")=="未上报"){
					if(xian){
						jh.jh_sbthcd=0;
					}else{
						jh.jh_sbthcd=2;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}
			
			querySumWqgz(jh,lx);
		}
		function searchWqgz(){
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jsdj=$("#jsdj").combobox("getValues").join(",");
			if(jsdj.substr(0,1)==',')
				jsdj=jsdj.substr(1,jsdj.length);
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var akjfl=$("#akjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var jh={jhnf:xmnf,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:jsdj,gldj:gldj,lxbm:$('#lxbm').val(),qlmc:null,qlbh:null,akjfl:akjfl,jsxz:$("#jsxz").combobox('getValue'),tsdq:tsdq};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				var xian=true;
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
					xian=false;
				}
				if($('#ddlSHZT').combo("getValue")=="未上报"){
					if(xian){
						jh.jh_sbthcd=0;
					}else{
						jh.jh_sbthcd=2;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}
			
			wqxm(jh,lx);
			querySumWqgz(jh,lx);
		}
		
		//-------------------------
		function wqxm(jh,lx){
		var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
				'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
				"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
				"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,"lx.lxbm":lx.lxbm,"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq};
		var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
			    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
			    columns:[[
			        {field:'ck',checkbox:true},
			        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
			        	var result='<a href="javascript:locationQl('+"'"+row.jckwqgz.qlbh+"',"+"'"+row.jckwqgz.qlzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
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
			        	formatter:function(value, row, index){
			        		return row.jckwqgz.gydw;
			        	}
			        },
			        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			        	formatter:function(value, row, index){
			        		return row.jckwqgz.xzqhmc;
			        	}
			        },
			        {field:'lxbm',title:'路线编码',width:80,align:'center',
			        	formatter:function(value,row,index){
				        	return row.jckwqgz.lxbm;
			        	}
			        },
			        {field:'lxmc',title:'路线名称',width:80,align:'center',
			        	formatter:function(value,row,index){
				        	return row.jckwqgz.lxmc;
			        	}
			        },
			        {field:'qlbm',title:'桥梁编码',width:60,align:'center',
			        	formatter:function(value,row,index){
				        	return row.jckwqgz.qlbh;
			        	}
			       },
			        {field:'qlmc',title:'桥梁名称',width:60,align:'center',
			    	   formatter:function(value,row,index){
				        	return row.jckwqgz.qlmc;
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
		function querySumWqgz(jh,lx){
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
						'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
						"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
						"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,"lx.lxbm":lx.lxbm,"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq};
			$.ajax({
					type:'post',
					url:'../../../jhgl/querySumWqgz.do',
					data:params,
					dataType:'json',
					success:function(data){
						if(data.id>0){
							$('#lblCount').html(data.id);
							if(data.pfztz!=null && data.pfztz!="")
								$('#lblZTZ').html(data.pfztz);
							if(data.jhsybzje!=null && data.jhsybzje!="")
								$('#lblBTZ').html(data.jhsybzje);
							if(data.jhsydfzcje!=null && data.jhsydfzcje!="")
								$('#lblDFTZ').html(data.jhsydfzcje);
						}else{
							$('#lblCount').html("0");
							$('#lblZTZ').html("0");
							$('#lblBTZ').html("0");
							$('#lblDFTZ').html("0");
						}
					}
				});
			}
		//-------------------------
		
		
		
		
		function searchAbgc(){
			
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jsdj=$("#jsdj").combobox("getValues").join(",");
			if(jsdj.substr(0,1)==',')
				jsdj=jsdj.substr(1,jsdj.length);
			
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
		
			var jh={xmlx:'ab',jhnf:xmnf,sbzt:null,spzt:null,jh_sbthcd:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			if(!xian){
				jh.jh_sbthcd=2;
			}
			var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:jsdj,lxbm:null,gldj:gldj,tsdq:tsdq};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#lxbm').val()!=""){
				lx.lxbm=$('#lxbm').val();
			}
			
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				var xian=true;
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
					xian=false;
				}
				if($('#ddlSHZT').combo("getValue")=="未上报"){
					if(xian){
						jh.jh_sbthcd=0;
					}else{
						jh.jh_sbthcd=2;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}else{
				jh.jh_sbthcd=null;
				jh.sbzt=null;
				jh.spzt=null;
			}
			
			querySumAbgc(jh,lx);
			abgcxm(jh,lx);
		}
		//
		function querySumAbgc(jh,lx){
	
	var param={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwlx":lx.gydwlx,"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumAbgc.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				if(data.jckabgc.qzlc!=null && data.jckabgc.qzlc!="")
					$('#lblZLC').html(data.jckabgc.qzlc);
				if(data.jckabgc.yhlc!=null && data.jckabgc.yhlc!="")
					$('#lblYHLC').html(data.jckabgc.yhlc);
				if(data.pfztz!=null && data.pfztz!="")
					$('#lblZTZ').html(data.pfztz);
				if(data.jhsybbzje!=null && data.jhsybbzje!="")
					$('#lblBTZ').html(data.jhsybbzje);
				if(data.jhsydfzczj!=null && data.jhsydfzczj!="")
					$('#lblDFTZ').html(data.jhsydfzczj);
			}else{
				$('#lblCount').html("0");
				$('#lblZLC').html("0");
				$('#lblYHLC').html("0");
				$('#lblZTZ').html("0");
				$('#lblBTZ').html("0");
				$('#lblDFTZ').html("0");
			}
		}
	});
}
		function abgcxm(jh,lx){
			var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
					"lx.gydwlx":lx.gydwlx,"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
					"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
			
			queryParams='lx.gydwlx='+lx.gydwlx+'&jh.sbzt='+jh.sbzt+'&jh.spzt='+jh.spzt+'&jh.sbnf='+jh.sbnf+'&jh.jhkgsj='+jh.jhkgsj+
				'&jh.jhwgsj='+jh.jhwgsj+'&jh.pfztz='+jh.pfztz+
				'&lx.gydw='+lx.gydw+'&lx.gydwdm='+lx.gydwdm+'&lx.xzqhmc='+lx.xzqhmc+'&lx.xzqhdm='+lx.xzqhdm+'&lx.lxmc='+lx.lxmc;
			var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
			    pageNumber:1,pageSize:50,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
			    columns:[[
			        {field:'ck',checkbox:true},
			        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
			        	var result='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
			        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
			        	return result;
			        }},
			        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
			        	var result="";
						if(roleName()=="县级" && row.sbzt=="0" && row.jh_sbthcd==0){
							result="未上报";
						}else if((roleName()=="县级" && row.sbzt=="0" && row.jh_sbthcd==2)){
							result="已上报";
						}else if(roleName()=="市级" && row.sbzt=="0" && row.jh_sbthcd==0){
							result="待上报";
						}else if(roleName()=="市级" && row.sbzt=="0" && row.jh_sbthcd==2){
							result="未上报";
						}else if(roleName()=="市级" && row.sbzt=="1" && row.jh_sbthcd==4){
							result="已上报";
						}else if(roleName()=="省级" && row.jh_sbthcd<4){
							result="未上报";
						}else if(roleName()=="省级" && row.jh_sbthcd==4){
							result="未审核";
						}else if((row.jh_sbthcd==6)){
							result="已审核";
						}
						return result;
			        }},
			        
			        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
			        	if(row.sfylsjl=='无')
			        		return '无';
			        	else if(row.sfylsjl=='有')
			        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
			        }},
			        {field:'jhnf',title:'上报年份',width:80,align:'center'},
			        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
			        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
			        {field:'gydw',title:'管养单位',width:150,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.gydw;
						}
			        },
			        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.xzqhmc;
						}
			        },
			        {field:'lxbm',title:'路线编码',width:80,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.lxbm;
						}
			        },
			        {field:'lxmc',title:'路线名称',width:80,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.lxmc;
						}
			        },
			        {field:'qdzh',title:'起点桩号',width:60,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.qdzh;
						}
			        },
			        {field:'zdzh',title:'止点桩号',width:60,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.zdzh;
						}
			        },
			        {field:'yhlc',title:'隐患里程',width:60,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.jhyhlc;
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
				},
				onLoadSuccess:function(data){
					querySumAbgc(jh,lx);
				}
			};
			gridBind(grid);
		}
		
		
		function searchZhfz(){
			var jh={jhnf:null,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:null,lxbm:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				var xian=true;
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
					xian=false;
				}
				if($('#ddlSHZT').combo("getValue")=="未上报"){
					if(xian){
						jh.jh_sbthcd=0;
					}else{
						jh.jh_sbthcd=2;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}
			if($('#jsdj').combobox('getText')!="全部"){
				lx.lxjsdj=$('#jsdj').combobox('getValue');
			}
			if($('#gldj').combobox('getText')!='全部'){
				lx.lxbm=$('#gldj').combobox('getValue');
			}
			if($('#tsdq').combobox('getValue')!=''){
				lx.tsdq=$('#tsdq').combobox('getValue');
			}
			querySumZhfz(jh,lx);
			zhfzxm(jh,lx);
		}
		//
		function querySumZhfz(jh,lx){
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwlx":lx.gydwlx,"lx.lxbm":lx.lxbm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
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
		function zhfzxm(jh,lx){
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
					"lx.gydwlx":lx.gydwlx,"lx.lxbm":lx.lxbm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
			
			var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
				pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
			    columns:[[
			        {field:'ck',checkbox:true},
			        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
			        	var result="";
			        	result+='<a href="javascript:locationXm1('+"'"+row.jckzhfz.lxbm+"',"+"'"+row.jckzhfz.qdzh+"',"+"'"+row.jckzhfz.zhzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
			        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
			        	
			        	return result;
			        }},
			        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
			        	var result="";
						if(roleName()=="县级" && row.sbzt=="0" && row.jh_sbthcd==0){
							result="未上报";
						}else if((roleName()=="县级" && row.sbzt=="0" && row.jh_sbthcd==2)){
							result="已上报";
						}else if(roleName()=="市级" && row.sbzt=="0" && row.jh_sbthcd==0){
							result="待上报";
						}else if(roleName()=="市级" && row.sbzt=="0" && row.jh_sbthcd==2){
							result="未上报";
						}else if(roleName()=="市级" && row.sbzt=="1" && row.jh_sbthcd==4){
							result="已上报";
						}else if(roleName()=="省级" && row.jh_sbthcd<4){
							result="未上报";
						}else if(roleName()=="省级" && row.jh_sbthcd==4){
							result="未审核";
						}else if((row.jh_sbthcd==6)){
							result="已审核";
						}
						return result;
			        }},
			        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
		        		return '<a href="javascript:openZjzjWindow('+"'grid','editZhZj'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
			        }},
			        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
			        	if(row.sfylsjl=='无')
			        		return '无';
			        	else if(row.sfylsjl=='有')
			        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'zhfz'"+",'灾害防治历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
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
				},
				onLoadSuccess:function(data){
					querySumZhfz(jh,lx);
				}
			};
			gridBind(grid);
		}
		
		function searchBhsd(){
			
	 		var jh={jhnf:$('#sbnf').combobox('getValue'),sbzt:null,spzt:null,
					jh_sbthcd:$.cookie("unit2").length};
			var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:null,lxbm:null,sddm:null};
			
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sdmc').val()!=''){
				lx.sdmc='';
			}
			if($('#sddm').val()!=''){
				lx.sddm='';
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				if($('#ddlSHZT').combo("getValue")=="未上报"){
				   jh.sbzt='0';
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					jh.sbzt='1';
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.spzt='0';
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.spzt='1';
				}
			}else{
				jh.sbzt=null;
				jh.spzt=null;
			}
			
			if($('#gldj').combobox('getText')!="全部"){
				lx.jsdj=$('#gldj').combobox('getValue');
			}
			bhxm(jh,lx);
			querySumBhsd(jh,lx);
		}
		function bhxm(jh,lx){
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,
					'jh.jh_sbthcd':jh.jh_sbthcd,
					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
					"lx.gydwlx":lx.gydwlx,"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.sddm":lx.sddm,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,
					"lx.tbbmbm":$.cookie("unit2"),"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt};
			var grid={
			        id:'grid',
			        url:'/jxzhpt/jhgl/queryBhsdList.do',
					pagination:true,
					rownumbers:false,
				    pageNumber:1,
				    pageSize:10,
				    height:$(window).height()-180,
				    width:$('#searchField').width(),
				    queryParams:params,
				    columns:[[
				        {field:'ck',checkbox:true},
				        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				        	var result='<a href="javascript:locationXm('+"'"+row.sddm+"',"+"'"+row.sdzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
				        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				        	
				        	return result;
				        }},

				        {field:'sbnf',title:'计划年份',width:80,align:'center'},
				        {field:'gydw',title:'管养单位',width:150,align:'center',
				        	formatter:function(value, row, index){
				        		return row.gydw;
				        	}
				        },
				        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
				        	formatter:function(value, row, index){
				        		return row.xzqhmc;
				        	}
				        },
				        {field:'lxbm',title:'路线编码',width:80,align:'center',
				        	formatter:function(value,row,index){
					        	return row.lxbm;
				        	}
				        },
				        {field:'lxmc',title:'路线名称',width:80,align:'center',
				        	formatter:function(value,row,index){
					        	return row.lxmc;
				        	}
				        },
				        {field:'sddm',title:'隧道代码',width:60,align:'center',
				        	formatter:function(value,row,index){
					        	return row.sddm;
				        	}
				       },
				        {field:'qlmc',title:'隧道名称',width:60,align:'center',
				    	   formatter:function(value,row,index){
					        	return row.sdmc;
				        	}
				    	},
				        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
				        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'}
				    ]],
				    onClickRow:function(rowIndex,rowDate){
						if(oldIndex!=-1){
							gridObj.datagrid("unselectRow",oldIndex);
						}
						selRow.push(rowIndex);
						gridObj.datagrid("selectRow",rowIndex);
						oldIndex=rowIndex;
					},
					onLoadSuccess:function(data){
						querySumWqgz(jh,lx);
					}
			};
			gridBind(grid);
		}
		function querySumBhsd(jh,lx){
			var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,
					'jh.jh_sbthcd':jh.jh_sbthcd,
					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
					"lx.gydwlx":lx.gydwlx,"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.sddm":lx.sddm,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,"lx.tbbmbm":$.cookie("unit2"),
					"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt};
			$.ajax({
				type:'post',
				url:'/jxzhpt/jhgl/querySumBhsd.do',
				data:param,
				dataType:'json',
				success:function(data){
					if(data.id>0){
						$('#lblCount').html(data.id);
						if(data.pfztz!=null && data.pfztz!="")
							$('#lblZTZ').html(data.pfztz);
						if(data.jhsybzje!=null && data.jhsybzje!="")
							$('#lblBTZ').html(data.jhsybzje);
						if(data.jhsydfzcje!=null && data.jhsydfzcje!="")
							$('#lblDFTZ').html(data.jhsydfzcje);
					}else{
						$('#lblCount').html("0");
						$('#lblZLC').html("0");
						$('#lblZTZ').html("0");
						$('#lblBTZ').html("0");
						$('#lblDFTZ').html("0");
					}
				}
			});
		}
		
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		
		
		function searchxm(){
			if($("#xmlx").combobox('getValue')=='危桥改造'){
				searchWqgz();
			}
			if($("#xmlx").combobox('getValue')=='安防工程'){
				searchAbgc();
				
			}
			if($("#xmlx").combobox('getValue')=='灾害防治'){
				searchZhfz();
				
			}
			if($("#xmlx").combobox('getValue')=='隧道'){
				searchBhsd();
				
			}
		}
		function exportxm(){
			if($("#xmlx").combobox('getValue')=='危桥改造'){
				exportExcel('wqgz');
				
			}
			if($("#xmlx").combobox('getValue')=='安防工程'){
				exportExcel('abgc');
				
			}
			if($("#xmlx").combobox('getValue')=='灾害防治'){
				exportExcel('zhfz');
				
			}
			if($("#xmlx").combobox('getValue')=='隧道'){
				exportExcel('bhsd','gl');
				
			}
		}
		
		var obj;
		function openWindow(id){
			obj=id;
			YMLib.Var.jhbm=id;
			if($("#xmlx").combobox('getValue')=='危桥改造'){
				YMLib.UI.createWindow('wq_xx','危桥改造',"/jxzhpt/page/jhgl/jhkxx/wqgz.jsp",'wq_xx',1000,500);
			}
			if($("#xmlx").combobox('getValue')=='安防工程'){
				YMLib.UI.createWindow('abgc_xx','安保工程',"/jxzhpt/page/jhgl/jhkxx/abgc.jsp",'abgc_xx',1000,500);
				
			}
			if($("#xmlx").combobox('getValue')=='灾害防治'){
				YMLib.UI.createWindow('zhfz_xx','灾害防治',"/jxzhpt/page/jhgl/jhkxx/zhfz.jsp",'zhfz_xx',1000,500);

			}
			if($("#xmlx").combobox('getValue')=='隧道'){
				YMLib.UI.createWindow('wq_xx','病害隧道',"/jxzhpt/page/jhgl/jhkxx/bhsd.jsp",'wq_xx',1000,500);

			}
			
		}
	</script>
				<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;计划查询>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;危桥改造项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
						<tr height="32">
        						<td>管养单位：</td>
        						<td  colspan="3" style="width:220px;"><select id="gydw" style="width:220px;"></select></td>
        						<td>行政区划：</td>
        						<td  colspan="3" style="width:230px;"><select id="xzqh" style="width:230px;"></select></td>
        						<td>路线名称：</td>
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:90px;" /></td>
        						<td>桥梁名称：</td>
        						<td><input name="txtBridge" type="text" id="txtBridge" style="width:90px;" /></td>
        						<td>路线编码：</td>
        						<td><input name="txtRoad" type="text" id="lxbm" style="width:90px;" /></td>

        					</tr>
        					<tr height="32">
        						<td>上报年份：</td>
        						<td><select id="sbnf" style="width: 80px;"></select></td>
        						<td>计划状态：</td>
        						<td><select name="ddlSHZT" id="ddlSHZT" style="width:70px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select></td>
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:80px;" class="easyui-combobox">
										</select></td>
								<td>技术等级：</td>
								<td><select name="jsdj" id="jsdj" style="width:65px;" class="easyui-combobox">
								</select></td>
								<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:94px;" class="easyui-combobox">
								</select></td>
								<td>跨径分类：</td>
        						<td><select name="akjfl" id="akjfl" style="width:94px;" class="easyui-combobox">
								
								</select></td>
								<td>建设性质：</td>
        						<td><select id="jsxz" class="easyui-combobox" data-options="panelHeight:'100'" onchange="setbz()">
									<option value=""selected>全部</option>
									<option value="加固改造">加固改造</option>
									<option value="拆除重建">拆除重建</option>
<!-- 									<option value="大修">大修</option> -->
									</select></td>	
        					</tr>
								<tr height="32">
                              <td colspan="11">
								<span>是否有补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select>
								<span>桥梁编码：</span>
        						<input name="txtRoad" type="text" id="txtqlbm" style="width:80px;" />
        						<span>项目类型：</span>
        						<select class="easyui-combobox" id='xmlx'>
        							<option value="危桥改造" selected="selected">危桥改造</option>
        							<option value="安防工程">安防工程</option>
        							<option value="灾害防治">灾害防治</option>
        							<option value="隧道">隧道</option>
        						</select>
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchxm()" style="vertical-align:middle;"/>
				                <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportxm()"/>
							</td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个项目，
        			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid" ></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<div id="wqgz_xx" style="text-align: left;font-size: 12px;width:80%;"></div>
	<div id="wqgz_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
