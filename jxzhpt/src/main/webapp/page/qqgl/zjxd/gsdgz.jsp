<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程路面改建路面升级项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/json2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/datagrid-cellediting.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#bztbsj').datebox('setValue', formatDate(new Date()));
			loadDist1("xzqh",$.cookie("dist"));
			tsdqdx("tsdq");
			xdzt('xdzt');
			zjly("zjly",'gsd');
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('jsjsdj','技术等级');
			jhxdwhdx("jhxdwh",'gsd');
			//xmnfnull("scxdnf");
			urlxmnf("scxdnf",getUrlParame('id'));
			loadGldj('gldj');
			gsdxmlx('xmlx');
			YMLib.Var.jdbs=2;
			queryxmList();
			 showMxbAll();
			$('#tt').tabs({ 
			    border:false, 
			    onSelect:function(title,index){ 
			        cxym(index);
			    } 
			}); 
			loadFileUpload();
		});
		//var flagi=0;//用来区分是否是第一次加载，0为第一次加载
		function loadFileUpload(){
		
			$("#uploadJhxd").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/batchUploadJhxd.do',
				'cancelImg' : '../../../js/uploader/cancel.png',
				'queueID' : 'fileQueue',
				'fileDataName' : 'uploadJhxd',
				'auto' : false,
				'multi' : false,
				'buttonImg': '../../../js/uploader/bdll.png',
				'simUploadLimit' : 3,
				'sizeLimit' : 20000000,
				'queueSizeLimit' : 5,
				'fileDesc' : '支持格式:xls',
				'fileExt' : '',
				'height' : 30,
				'width' : 92,
				'scriptData' : {
					'jhsh.xdwh':$("#bzxdwh").val()
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					fileShowByWh($("#bzxdwh").val(),"计划下达文件");
				},
				onError : function(event, queueID, fileObj) {
					alert("文件:" + fileObj.name + "上传失败");
				},
				onCancel : function(event, queueID, fileObj) {
				},
				onQueueFull : function(event, queueSizeLimit) {
					alert("最多支持上传文件数为：" + queueSizeLimit);
				}
			});
		}
		function upload(){
			if($('#bzxdwh').val()!=""){
				$("#uploadJhxd").uploadifySettings('scriptData',{'jhsh.xdwh':$('#bzxdwh').val()});
				$('#uploadJhxd').uploadifyUpload();
			}else{
				alert("必须填写计划下达文号！");
			}
		}
		var flag=false;
		function cxym(str){
			if(str==0 && flag==false){
				queryxmList();
				
			}
			if(str==0 && flag==true){
				$("#grid").datagrid('reload');
				flag=true;
			}
		}

		function queryxmList(){
			var xmnf='';
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2011,2012,2013,2014,2015,2016,2017,2018,2019,2020';
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xdzt=$("#xdzt").combobox("getValues").join(",");
			if(xdzt.substr(0,1)==',')
				xdzt=xdzt.substr(1,xdzt.length);
			var zjly=$("#zjly").combobox("getValues").join(",");
			if(zjly.substr(0,1)==',')
				zjly=zjly.substr(1,zjly.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var params={'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#lxbm').val(),'jhsh.xdzttj':xdzt,'jhsh.zjly':zjly,'jhsh.ghxlxbm':$('#ghlxbm').val(),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.xmmc':$('#xmmc').val(),'jhsh.tsdq':tsdq,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),'jhsh.jsjsdj':$('#jsjsdj').combobox("getValues").join(","),'jhsh.jhxdwh':jhxdwh,
					'jhsh.xdzt':1,'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmnf':xmnf,'jhsh.scxdnf':$('#scxdnf').combobox("getValues").join(','),
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.gyfl':$('#gyfl').val()};
			loadLj(params);
			$('#grid').datagrid({    
			    url:'/jxzhpt/qqgl/queryGsdgzxd.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-280,
			    width:$(window).width()-20,
			    queryParams: params,
			    columns:[[
			        {field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						if(row.xmbm.substr(10,1)=='1')
							result+='&nbsp;<a href="javascript:openWindows('+"'lmsjxx'"+','+"'国省道改造'"+','+"'"+row.xmbm+"'"+','+
							"'/jxzhpt/page/qqgl/zjxd/lmsj_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
							
						if(row.xmbm.substr(10,1)=='2')
							result+='&nbsp;<a href="javascript:openWindows('+"'lmsjxx'"+','+"'国省道改造'"+','+"'"+row.xmbm+"'"+','+
							"'/jxzhpt/page/qqgl/zjxd/lmgz_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
							
						if(row.xmbm.substr(10,1)=='3')
							result+='&nbsp;<a href="javascript:openWindows('+"'lmsjxx'"+','+"'国省道改造'"+','+"'"+row.xmbm+"'"+','+
						"'/jxzhpt/page/qqgl/zjxd/xjgc_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						return result;
					}
				},
				/* {field:'xdzt',title:'资金下达',width:60,align:'center',
					formatter: function(value,row,index){
						var result='<a href="javascript:openWindow('+"'lmsjzjxd'"+','+"'国省道改造  — 资金下达'"+','+
							"'/jxzhpt/page/qqgl/zjxd/lmsj_zjxd.jsp'"+',900,400)" style="color:#3399CC;">资金下达</a>';
						return result;
					}
				}, */
				{field:'sbzt',title:'审核状态',width:60,align:'center',
					formatter: function(value,row,index){
						var result="";
						if(row.xdzt=='0')
							result='未审核';
						if(row.xdzt=='1')
							result='已审核';	
						return result;
					}
				},
				{field:'lsjl',title:'历史记录',width:60,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'xzqh',title:'行政区划',width:60,align:'center'},
				{field:'xmnf',title:'项目年份',width:60,align:'center',
					formatter: function(value,row,index){
		        		return row.xmbm.substr(0,4);
		        	}
				},
				{field:'zyd',title:'重要度排序',width:70,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center',
					formatter: function(value,row,index){
						if(Number(row.xmsl)>1){
		        			return '<label style="color:red;">'+value+'</label>';
		        		}else{
		        			return value;
		        		}
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'lc',title:'里程',width:60,align:'center'},
				{field:'jsjsdj',title:'建设技术等级',width:74,align:'center'},
				{field:'xjsdj',title:'现设技术等级',width:74,align:'center'},
				{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
				{field:'ghlxbh',title:'原路线编码',width:60,align:'center'},
				{field:'qdzh',title:'原起点桩号',width:70,align:'center'},
				{field:'zdzh',title:'原止点桩号',width:70,align:'center'},
				{field:'pfztz',title:'批复总投资',width:60,align:'center'},
				{field:'bbzzj',title:'车购税',width:60,align:'center'},
				{field:'gz',title:'国债',width:60,align:'center'},
				{field:'sz',title:'省债',width:60,align:'center'},
				{field:'zq',title:'债券',width:60,align:'center'},
				{field:'dk',title:'贷款',width:60,align:'center'},
				{field:'jl',title:'奖励',width:60,align:'center'},
				{field:'qt',title:'其他',width:60,align:'center'},
				{field:'xdwh',title:'计划下达文号',width:100,align:'center',
					formatter: function(value,row,index){
						return '<a href="#" style="text-decoration:none;color:#3399CC;" onclick=getWj('+index+',"计划下达文件")>'+value+'</a>';
					}
				},
				{field:'xdsj',title:'下达时间',width:70,align:'center'},
				{field:'tsdq',title:'特殊地区',width:100,align:'center'},
				{field:'sjpfwh',title:'初步设计批复文号',width:100,align:'center'},
				{field:'gkpfwh',title:'工可批复文号',width:100,align:'center'},
				{field:'kgsj',title:'计划开工时间',width:70,align:'center'},
				{field:'wgsj',title:'计划完工时间',width:70,align:'center'}
			    ]],
				view: detailview,
				detailFormatter:function(index,row){  
						return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
			    },
			    onExpandRow: function(index,row){
			    	parentindex=index;
			    	if(row.sl!=0){
			    		$('#table_lx'+row.id).datagrid({
			    			url:'/jxzhpt/qqgl/selectlxList.do',
				    		 queryParams: {
				    			 'lx.jdbs':2,
				    			 'lx.xmid':row.xmbm,
				    			 'lx.sffirst':'1'
				    			},
			    			columns:[[
					           {field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
					        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsjlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
					           }},
			    			    {field:'gydw',title:'管养单位',width:120,align:'center'},    
			    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
			    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
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
			    	
			    }   
			}); 
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	 	
		var editIndex = undefined;
		function beginEditing (rowIndex,field,value) {
	
		    if (rowIndex != editIndex) {
		        if (endEditing()) {
		        	$('#jhbz').datagrid('beginEdit', rowIndex);
		        	
		            editIndex = rowIndex;
		            
		        } else {
		            $('#jhbz').datagrid('selectRow', editIndex);
		        }
		    }
		}
		function endEditing() {
		    if (editIndex == undefined) { return true; }
		    
		    if ($('#jhbz').datagrid('validateRow', editIndex)) {
		    	
		        $('#jhbz').datagrid('endEdit', editIndex);
		        $('#jhbz').datagrid('selectRow', editIndex);
		        editIndex = undefined;
		        
		        return true;
		    } else {
		        return false;
		    }
		}
		 
	
		function createAll(){
			endEditing();
			var rows=$('#jhbz').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要生成统计表的计划");
				return;
			}
			alert(rows[0].bzpfztz);
		}
		function planxdwhAll(){
			
			//flagi=1;
			/* $.messager.defaults = { ok: "确认", cancel: "取消" };
			 $.messager.prompt("操作提示", "请您输入计划下达文号？", function (data) {
		            if (data) {
		            	planxdAll(data);
		            }else{
		            	alert("计划下达文号不能为空");
		            }
		      }); */
			endEditing();
			var rows=$('#jhbz').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要下达的计划");
				return;
			}
		      
			$('#jhxd').dialog("open");

		}
		function planxdAll(){
			if($("#sjpfTable").html()==''){
				alert("请上传该文号对应的文件。");
				return;
			}
			$('#jhxd').dialog("close");
			//alert($('#bzxdwh').val()+"     "+$('#bztbsj').datebox('getValue'));
			var jhxdwh=$('#bzxdwh').val();
			var bztbsj=$('#bztbsj').datebox('getValue');
			if(jhxdwh==''||bztbsj==''){
				alert("请填写计划下达文号或计划下达时间。");
				return;
			}
			$('#bztbsj').datebox('setValue', formatDate(new Date()));
			$('#bzxdwh').val("");
			var rows=$('#jhbz').datagrid('getSelections');
			if(rows.length==0){
				alert("请勾选要下达的计划");
				return;
			}
			for(var i=0;i<rows.length;i++){
				rows[i].jhxdwh=jhxdwh;
				rows[i].bztbsj=bztbsj;
				//alert(rows[i].xmbm.substr(10,1));
				rows[i].xmlx=rows[i].xmbm.substr(10,1);
			}
			var json_data = JSON.stringify(rows); 
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/planxdAll.do',
				data:"jhxdwh="+jhxdwh+"&bztbsj="+bztbsj+"&json_data="+json_data,
				dataType:'json',
				success:function(msg){
					if(msg){
						alert("下达成功");
						queryxmList();
						showMxbAll();
					}
						
				}
			});
			
			
		}
		
		function showMxbAll(){
			var xmnf='';
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2011,2012,2013,2014,2015,2016,2017,2018,2019,2020';
			//var xmnf=$("#xmnf").combobox("getValues").join(",");
			//if(xmnf.substr(0,1)==',')
				//xmnf=xmnf.substr(1,xmnf.length);
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xdzt=$("#xdzt").combobox("getValues").join(",");
			if(xdzt.substr(0,1)==',')
				xdzt=xdzt.substr(1,xdzt.length);
			var zjly=$("#zjly").combobox("getValues").join(",");
			if(zjly.substr(0,1)==',')
				zjly=zjly.substr(1,zjly.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var params={'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#lxbm').val(),'jhsh.xdzttj':xdzt,'jhsh.zjly':zjly,'jhsh.ghxlxbm':$('#ghlxbm').val(),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.xmmc':$('#xmmc').val(),'jhsh.tsdq':tsdq,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),'jhsh.jsjsdj':$('#jsjsdj').combobox("getValues").join(","),'jhsh.jhxdwh':jhxdwh,
					'jhsh.xdzt':1,'lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmnf':xmnf,'jhsh.scxdnf':xmnf,
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.gyfl':$('#gyfl').val()};
			//loadLj(params);
			$('#jhbz').datagrid({    
			    url:'/jxzhpt/qqgl/queryGsdgzxdbz.do',
			    striped:true,
			    pagination:false,
			    rownumbers:true,
			    checkOnSelect:true,
			    height:$(window).height()-300,
			    width:$(window).width()-20,
			    idField: 'xmbm', //主键
			    queryParams: params,
			    columns:[[
				{field:'ck',checkbox:true,width:20,align:'center'},
				/* {field:'xdzt',title:'资金下达',width:60,align:'center',
					formatter: function(value,row,index){
						var result='<a href="javascript:openWindow('+"'lmsjzjxd'"+','+"'国省道改造  — 资金下达'"+','+
							"'/jxzhpt/page/qqgl/zjxd/lmsj_zjxd.jsp'"+',900,400)" style="color:#3399CC;">资金下达</a>';
						return result;
					}
				}, */
				
				{field:'xzqh',title:'行政区划',width:60,align:'center'},
				{field:'xmnf',title:'项目年份',width:60,align:'center',
					formatter: function(value,row,index){
		        		return row.xmbm.substr(0,4);
		        	}
				},
				{field:'xmmc',title:'项目名称',width:250,align:'center',editor:{type:'text',options:{required:false}}},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'bzxdnf',title:'下达年份',width:70,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzpfztz',title:'总投资',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzcgs',title:'车购税',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzgz',title:'国债',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzsz',title:'省债',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzzq',title:'债券',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzdk',title:'贷款',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzjl',title:'奖励',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzqt',title:'其他',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzdfzc',title:'地方自筹',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'bzyhdk',title:'银行贷款',width:60,align:'center',editor:{type:'numberbox',options:{required:false}}},
				{field:'zyjsnr',title:'主要建设内容',width:160,align:'center',editor:{type:'text',options:{required:false}}},
				{field:'xzscnl',title:'新增能力',width:160,align:'center',editor:{type:'text',options:{required:false}}}
				
				/* ,
				
				//{field:'bztbsj',title:'填报时间',width:70,align:'center',editor:{type:'datebox',options:{required:false}}},
				{field:'tbdw',title:'填报单位',width:100,align:'center',
					formatter: function(value,row,index){
		        		return $.cookie('truename');
		        	}} */
			    ]],
			    onClickCell: function (rowIndex, field, value) {
// 			    	alert(field);
			    	beginEditing(rowIndex,field,value);
			    	//$('#jhbz').datagrid('enableCellEditing').datagrid('gotoCell', {index: rowIndex,field: field});
			    }

			}); 
			
		}
		
		/* 
		function queryLmsj(){
			
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			grid.id="grid";
			grid.url="../../../qqgl/queryGsdgz.do";
			var params={'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#txtlxbm').val(),
					'jhsh.xmmc':$('#txtxmmc').val(),'jhsh.tsdq':$('#tsdq').combo("getText"),'jsdj':$('#jsdj').combobox("getValues").join(","),
					'jhsh.xdzt':1,'lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmbm':$('#xmnf').combobox("getValues").join(','),
					'ylxbh':$('#gldj').combobox("getValues").join(',')};
			grid.queryParams=params;
			loadLj(params);
			grid.height=$(window).height()-280;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'lmsjxx'"+','+"'国省道改造'"+','+
						"'/jxzhpt/page/qqgl/jhsh/lmsj_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						return result;
					}
				},
				{field:'xdzt',title:'资金下达',width:60,align:'center',
					formatter: function(value,row,index){
						var result='<a href="javascript:openWindow('+"'lmsjzjxd'"+','+"'国省道改造  — 资金下达'"+','+
							"'/jxzhpt/page/qqgl/zjxd/lmsj_zjxd.jsp'"+',900,400)" style="color:#3399CC;">资金下达</a>';
						return result;
					}
				},
				{field:'sbzt',title:'审核状态',width:60,align:'center',
					formatter: function(value,row,index){
						var result="";
						xmlx=1;
						if(row.xdzt=='0')
							result='未审核';
						if(row.xdzt=='1')
							result='已审核';	
// 						var result='<a href="javascript:openWindow('+"'jhxd'"+','+"'计划审核'"+','+
// 							"'/jxzhpt/page/qqgl/jhsh/jhxd3.jsp'"+',900,400)" style="color:#3399CC;">计划审核</a>';
						return result;
					}
				},
				{field:'lsjl',title:'历史记录',width:60,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'xzqh',title:'行政区划',width:60,align:'center'},
				{field:'xmnf',title:'项目年份',width:60,align:'center',
					formatter: function(value,row,index){
		        		return row.xmbm.substr(0,4);
		        	}
				},
				{field:'zyd',title:'重要度排序',width:60,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center',
					formatter: function(value,row,index){
						if(Number(row.xmsl)>1){
		        			return '<label style="color:red;">'+value+'</label>';
		        		}else{
		        			return value;
		        		}
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'lc',title:'里程',width:60,align:'center'},
				{field:'jsjsdj',title:'建设技术等级',width:70,align:'center'},
				{field:'xjsdj',title:'现设技术等级',width:70,align:'center'},
				{field:'ghlxbh',title:'路线编码',width:60,align:'center'},
				{field:'qdzh',title:'起点桩号',width:70,align:'center'},
				{field:'zdzh',title:'止点桩号',width:70,align:'center'},
				{field:'kgsj',title:'开工时间',width:70,align:'center'},
				{field:'wgsj',title:'完工时间',width:70,align:'center'},
				{field:'gq',title:'工期（月）',width:60,align:'center'},
				{field:'xdwh',title:'下达文号',width:100,align:'center'},
				{field:'xdsj',title:'下达时间',width:70,align:'center'},
				{field:'pfztz',title:'批复总投资',width:60,align:'center'},
				{field:'bbzzj',title:'车购税',width:60,align:'center'},
// 				{field:'sbzzj',title:'省补助资金',width:60,align:'center'},
				{field:'gz',title:'国债',width:60,align:'center'},
				{field:'sz',title:'省债',width:60,align:'center'},
				{field:'zq',title:'债券',width:60,align:'center'},
				{field:'jl',title:'奖励',width:60,align:'center'},
				{field:'qt',title:'其他',width:60,align:'center'},
				{field:'sjpfwh',title:'设计批复文号',width:100,align:'center'},
				{field:'gkpfwh',title:'工可批复文号',width:100,align:'center'},
				{field:'tsdq',title:'特殊地区',width:100,align:'center'}
				
				]];
			bindLxGrid();
			gridBind(grid);
		} */
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLjgsdxd.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$("#xmsl").html(msg.SL);
						 $("#tz").html(msg.TZ);
						 $("#cgs").html(msg.CGS);
						 $("#sbz").html(msg.SBZ);
						 $("#sjl").html(msg.SJL);
						 $("#lc").html(msg.LC);
						 $("#dftz").html(msg.DFTZ);
						 $("#yhdk").html(msg.YHDK);
					}else{
						$('#spanbbz').html("0");
						$('#spansbz').html("0");
						$('#spanlc').html("0");
					}
				}
			});
		}
		function exportZjxd(){
			var xmnf='';
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2011,2012,2013,2014,2015,2016,2017,2018,2019,2020';
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xdzt=$("#xdzt").combobox("getValues").join(",");
			if(xdzt.substr(0,1)==',')
				xdzt=xdzt.substr(1,xdzt.length);
			var zjly=$("#zjly").combobox("getValues").join(",");
			if(zjly.substr(0,1)==',')
				zjly=zjly.substr(1,zjly.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			/* var params={'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#lxbm').val(),'jhsh.xdzttj':xdzt,'jhsh.zjly':zjly,'jhsh.ghxlxbm':$('#ghlxbm').val(),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.xmmc':$('#xmmc').val(),'jhsh.tsdq':tsdq,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),'jhsh.jsjsdj':$('#jsjsdj').combobox("getValues").join(","),'jhsh.jhxdwh':$('#jhxdwh').val(),
					'jhsh.xdzt':1,'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmnf':$('#xmnf').combobox("getValues").join(','),'jhsh.scxdnf':$('#scxdnf').combobox("getValues").join(','),
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.gyfl':$('#gyfl').val()};
 */
/* 			 var param='jhsh.xmlx1='+xmlx+'&jhsh.xzqhdm='+getxzqhdm('xzqh')+'&jhsh.ghlxbh='+$("#lxbm").val()+'&jhsh.xdzttj='+xdzt+'&jhsh.zjly='+zjly+'&jhsh.ghxlxbm='+$("#ghlxbm").val()+'&jhsh.ghxlxmc='+$("#ghlxmc").val()+'&jhsh.lxmc='+$("#lxmc").val()
					+'&jhsh.xmmc='+$("#xmmc").val()+'&jhsh.tsdq='+tsdq+'&jhsh.jsdj='+$("#jsdj").combobox("getValues").join(",")+'&jhsh.jsjsdj='+$("#jsjsdj").combobox("getValues").join(",")+'&jhsh.jhxdwh='+$("#jhxdwh").val()
					+'&jhsh.xdzt=1'+'&jhsh.lsjl='+$("#lsjl").combobox("getValue")+'&jhsh.xmbm='+$("#scxdnf").combobox("getValues").join(",")+'&jhsh.scxdnf='+$("#scxdnf").combobox("getValues").join(",")
					+'&jhsh.xzdj='+$("#gldj").combobox("getValues").join(",")+"&jhsh.gyfl="+$("#gyfl").val(); */
  
		  var param='jhsh.xmbm='+$('#scxdnf').combobox("getValues").join(',')+'&jhsh.xmlx1='+xmlx
			+'&jhsh.xzqhdm='+getxzqhdm('xzqh')+'&jhsh.ghlxbh='+$('#lxbm').val()+'&jhsh.scxdnf='+$("#scxdnf").combobox("getValues").join(",")
			+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+$('#tsdq').combobox("getValues").join(",")
			+'&jhsh.xdzt=1'+'&jhsh.jsdj='+$('#jsdj').combobox("getValues").join(",")+'&lsjl='+$('#lsjl').combobox("getValue")
			+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.ghxlxbm='+$("#ghlxbm").val()+'&jhsh.ghxlxmc='+$("#ghlxmc").val()+'&jhsh.jsjsdj='+$("#jsjsdj").combobox("getValues").join(",")+'&jhsh.jhxdwh='+jhxdwh
			+'&jhsh.xmnf='+$('#scxdnf').combobox("getValues").join(',')+'&jhsh.xdzttj='+xdzt+'&jhsh.zjly='+zjly; 
			/* var params={'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#lxbm').val(),'jhsh.xdzttj':xdzt,'jhsh.zjly':zjly,'jhsh.ghxlxbm':$('#ghlxbm').val(),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.xmmc':$('#xmmc').val(),'jhsh.tsdq':tsdq,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),'jhsh.jsjsdj':$('#jsjsdj').combobox("getValues").join(","),'jhsh.jhxdwh':jhxdwh,
					'jhsh.xdzt':1,'lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmnf':xmnf,'jhsh.scxdnf':xmnf,
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.gyfl':$('#gyfl').val()};
  */
			window.location.href="/jxzhpt/qqgl/exportJhshxxgsdexcel.do?"+param;
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;<span id="astext">计划下达</span>>&nbsp;<span id="bstext"></span>>&nbsp;国省道改造</div>
	</div>
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
        					<tr height="32">
        						<!-- <td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:114px;"></select></td>
        						<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:110px;" /></td>
        						<td style="display: none" align="right">项目年份：</td>
        						<td style="display: none"><select id="xmnf" style="width: 114px;"></select></td>
        						<td align="right">建设技术等级：</td>
        						<td><select name="jsjsdj" class="easyui-combobox" id="jsjsdj" style="width:114px;"></select></td>
        						<td align="right">现技术等级：</td>
        						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:55px;"></select></td>
        						<td align="right">行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:114px;" class="easyui-combobox"></select></td> -->
        						<td>行政区划：</td>
        						<td><select id="xzqh" style="width:114px;"></select></td>
        						<td>项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:110px;" /></td>
        						<td>建设性质：</td>
								<td><select name="xmlx" id="xmlx" style="width:114px;" ></select></td>
								<td >建设技术等级：</td>
        						<td><select name="jsjsdj" class="easyui-combobox" id="jsjsdj" style="width:114px;"></select></td>
        						<td>现技术等级：</td>
        						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:114px;"></select></td>
        						
        					</tr>
        					<tr height="32">
        					<td>首次下达年份：</td>
        						<td><input name="scxdnf" type="text" id="scxdnf" style="width:114px;" /></td>
        						
        					<!-- 	<td align="right">特殊地区：</td>
        						<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:114px;"></select></td>
        						<td align="right">原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:110px;" /></td>
        						<td align="right">原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:110px;" /></td>
        						
        						<td align="right">下达状态：</td>
        						<td><input name="xdzt" type="text" id="xdzt" style="width:55px;" /></td>
        					<td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:110px;" /></td> -->
        						<td>计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:114spx;" /></td>
        						<td>资金来源：</td>
        						<td><input name="zjly" type="text" id="zjly" style="width:114px;" /></td>
        						<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:114px;" class="easyui-combobox"></select></td>
								<td>原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:110px;" /></td>
        						</tr>
        					<tr height="32">
        					<td>原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:110px;" /></td>
        						<td>规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:110px;" /></td>
        					
        						<!-- <td align="right">管养分类：</td>
        						<td><input name="gyfl" type="text" id="gyfl" style="width:110px;" /></td>
        						<td align="right">规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:110px;" /></td>
        						<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:114spx;" /></td>
        						<td align="right">历史记录：</td>
        						<td>
        							<select name="lsjl" id="lsjl" class="easyui-combobox" style="width:55px;">
										<option value="" selected="selected">全部</option>
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
        						</td>
        						<td align="right">首次下达年份：</td>
        						<td><input name="scxdnf" type="text" id="scxdnf" style="width:114px;" /></td> -->
        						<td>规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:110px;" /></td>
        						<td>历史记录：</td>
        						<td>
        							<select name="lsjl" id="lsjl" class="easyui-combobox" style="width:55px;">
										<option value="" selected="selected">全部</option>
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
        						</td>
        						<td>特殊地区：</td>
        						<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:114px;"></select></td>
        						</tr>
        					<tr height="32">
        					 <td>管养分类：</td>
        						<td><input name="gyfl" type="text" id="gyfl" style="width:110px;" /></td>
        						<td>下达状态：</td>
        						<td><input name="xdzt" type="text" id="xdzt" style="width:55px;" /></td>
        					
        						<!-- <td>建设性质：</td>
								<td><select name="xmlx" id="xmlx" style="width:114px;" ></select></td>
								<td align="right">资金来源：</td>
        						<td><input name="zjly" type="text" id="zjly" style="width:114px;" /></td> -->
        						<td colspan="10">
        							<img onclick="queryxmList()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/>
									<img onclick="exportZjxd()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
									<!-- <img onclick="importJhshZjzj(4)" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
        						</td>
        					</tr>
        					<!-- <tr height="32">
        						
        						
        					</tr> -->
        				</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<!-- <tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【 <span id="lblCount" style="font-weight: bold; color: #FF0000">0</span> 】个路面升级项目，总里程共
        			【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，项目里程共【&nbsp;<span id="lblXMLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，其中中央车购税【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，省投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr> -->
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方自筹【<span id="dftz" style="color: red;">0</span>】万元,
            		银行贷款【<span id="yhdk" style="color: red;">0</span>】万元。
            		</div>
            		<div id="tt" border="false" class="easyui-tabs" >
            		<script type="text/javascript">
                	$("#tt").attr('style','width:'+($(window).width()*0.99)+'px');
     				</script>
	            		<div title="项目列表" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
					    	<table id="grid"></table>
					    </div>
					    <div title="计划编制" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
					    	<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:createAll()" class="button button-tiny button-border button-rounded button-primary">生成汇总</a>
							<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdwhAll()" class="button button-tiny button-border button-rounded button-primary">计划下达</a>
							
<!-- 					    	<input type="button" value="生成汇总" onclick="createAll()"><input type="button" value="计划下达"> -->
					    	<table id="jhbz">
					    	
					    	</table>
					    </div>
				    </div>
            		<!-- <div>
            			<table id="grid"></table>
            		</div> -->
            	</td>
        	</tr>
		</table>
		<div id="wj" class="easyui-dialog" title="计划下达文件" style="width:500px;height:200px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
					<table width="99.9%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 100%;" cellspacing="0" cellpadding="0">
		
				<tr style="height: 100%;font-size: 10px;">
					
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="wjTable"></tbody>
						</table>
						
					</td>
				</tr>
			</table>
		</div>
		<div id="jhxd" class="easyui-dialog" title="计划下达" style="width:500px;height:250px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
			<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达文号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="bzxdwh" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达时间</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="bztbsj" type="text"  class="easyui-datebox" />
					</td>
				</tr>
				<tr style="height: 30px;font-size: 10px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						下达文件</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td colspan="2">待上传：<div id="fileQueue" ></div></td>
							</tr>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('/jxzhpt/js/uploader/bdll.png');" name="uploadJhxd" id="uploadJhxd" /></td>
								<td>
									<img name="uploadFile" id="uploadFile" src="/jxzhpt/js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr style="height: 30px;font-size: 10px;">
					<td colspan="2" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<a style="margin-left: 48%" href="javascript:planxdAll()" class="button button-tiny button-border button-rounded button-primary">下达</a>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>
