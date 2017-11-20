<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修</title>
	<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/json2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/datagrid-cellediting.js"></script>
	<script type="text/javascript">
	function searchlist(){
		queryYhdzx();
		showMxbAll();
	}
		$(function(){
			loadGhlx('ghlxbm');
			loadylx('lxbm');
			$('#bztbsj').datebox('setValue', formatDate(new Date()));
			loadDist1("xzqh",$.cookie("dist"));
			tsdqdx("tsdq");
			xdzt('xdzt');
			zjly("zjly",'yh');
			jhxdwhdx("jhxdwh",'yh');
			yhxmlx('xmlx');
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm3('jsdj','技术等级');
			xmnfnull("scxdnf");
			urlxmnf("scxdnf",getUrlParame('id'));
			loadGldj('gldj');
			YMLib.Var.jdbs=2;
			queryYhdzx();
			showMxbAll();
			 $('#tt').tabs({ 
			    border:false, 
			    onSelect:function(title,index){ 
			        cxym(index);
			    } 
			}); 
			 loadFileUpload();
		});
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
				'sizeLimit' : 100000000,
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
				queryYhdzx();
				flag=true;
			}
			if(str==0 && flag==true){
				$("#grid").datagrid('reload');
			}
			
			
		}
		
		function queryYhdzx(){
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
			
			var scxdnf=$('#scxdnf').combobox("getValues").join(',');
			if(scxdnf.substr(0,1)==',')
				scxdnf=scxdnf.substr(1,xdzt.length);
			var xmnf='';
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2016,2017,2018,2019,2020';
			
			var params={'jhsh.xmlx':4,'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#lxbm').combotree('getText'),'jhsh.xdzttj':xdzt,'jhsh.zjly':zjly,'jhsh.ghxlxbm':$('#ghlxbm').combotree('getText'),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.xmmc':$('#xmmc').val(),'jhsh.tsdq':tsdq,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),'jhsh.jhxdwh':jhxdwh,
					'jhsh.xdzt':1,'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmnf':xmnf,'jhsh.scxdnf':scxdnf,
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.gyfl':$('#gyfl').val(),'jhsh.sfsycgs':$('#sfsycgs').combobox('getValue'),'jhsh.xdsj':$('#xdsj').datebox('getValue')};
			loadLj(params);
			$('#grid').datagrid({    
			    url:'/jxzhpt/qqgl/queryjhxdyh.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-255,
			    width:$(window).width()-20,
			    queryParams: params,
			    columns:[[
			        {field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindows('+"'yhdzxxx'"+','+"'养护大中修项目'"+','+"'"+row.xmbm+"'"+','+
						"'/jxzhpt/page/qqgl/zjxd/yhdzx_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						return result;
					}
				},
				/* {field:'xdzt',title:'资金下达',width:60,align:'center',
					formatter:function(value,row,index){
						xmlx=4;
						var result = '<a href="javascript:openWindow('+"'yhdzxzjxd'"+','+"'养护大中修 — 资金下达'"+','+
						"'/jxzhpt/page/qqgl/zjxd/yhdzx_zjxd.jsp'"+',900,400)" style="color:#3399CC;">资金下达</a>';
						return result;
					}
				}, */
				{field:'sbzt',title:'审核状态',width:60,align:'center',
					formatter: function(value,row,index){
						var result="";
						xmlx=1;
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
				{field:'zydpx',title:'重要度排序',width:65,align:'center'},
				{field:'xmmc',title:'项目名称',width:160,align:'center',
					formatter: function(value,row,index){
						if(Number(row.xmsl)>1){
		        			return '<label style="color:red;">'+value+'</label>';
		        		}else{
		        			return value;
		        		}
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'zlc',title:'里程',width:60,align:'center'},
				{field:'jsdj',title:'技术等级',width:60,align:'center'},
				{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
			    {field:'lxbm',title:'原路线编码',width:100,align:'center'},
				{field:'qdzh1',title:'原起点桩号',width:100,align:'center'},
				{field:'zdzh1',title:'原止点桩号',width:100,align:'center'},
				{field:'ztz',title:'批复总投资',width:60,align:'center'},
				{field:'rys',title:'燃油税',width:60,align:'center'},
				{field:'dk',title:'厅贷款',width:60,align:'center'},
				{field:'qt',title:'其他',width:60,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:100,align:'center',
					formatter: function(value,row,index){
						return '<a href="#" style="text-decoration:none;color:#3399CC;" onclick=getWj('+index+',"计划下达文件")>'+value+'</a>';
					}
				},
				{field:'jhxdsj',title:'下达时间',width:70,align:'center'},
				{field:'tsdq',title:'特殊地区',width:100,align:'center'},
				{field:'sjpfwh',title:'施工图设计批复文号',width:100,align:'center'},
				{field:'jhkgsj',title:'计划开工时间',width:80,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:80,align:'center'}
			    ]],
				view: detailview,
				detailFormatter:function(index,row){  
						return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
			    },
			    onExpandRow: function(index,row){
			    	parentindex=index;
			    	if(row.sl!=0){
			    		$('#table_lx'+row.xmbm).datagrid({
			    			url:'/jxzhpt/qqgl/selectlxList.do',
				    		 queryParams: {
				    			 'lx.jdbs':2,
				    			 'lx.xmid':row.xmbm,
				    			 'lx.sffirst':'1'
				    			},
			    			columns:[[
			    				{field:'cz',title:'操作',width:150,align:'center',
				    				formatter:function(value,row,index){
		    				    		var result='<a href="javascript:loadLxWin('+"'"+index+"',"+"'"+row.xmid+"'"+')" style="color:#3399CC;">详细</a>';
		    				    		return result;
		    				    	}
		    				    },
				         <%--  {field:'c3',title:'操作',width:70,align:'center',formatter:function(value,row,index){
				        	   return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="editsjlx('+parentindex+','+index+')">编辑</a>   '+'&nbsp;<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
				           }},--%>
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
			    			    //{field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
			    			    {field:'xjsdj',title:'技术等级',width:80,align:'center'},
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
		       // $('#jhbz').datagrid('selectRow', editIndex);
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
			var json_data = JSON.stringify(rows); 
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/planxdhzadd.do',
				data:"json_data="+json_data,
				dataType:'json',
				success:function(msg){
					if(msg){
						var str=new Date().getTime();
						obj= $("#tt").tabs("add",{
							 id:rows[0].xmbm+str,
							 title:"汇总表",
							 href :"yhdzxhz.jsp",
							 fit:true,
							 iconCls:'icon-file',
							 closable:true,
							 selected:true
						});
					}	
				}
			});

			
		}
		function planxdwhAll(){
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
			if($("#zjgl").is(':checked')){
				for(var i=0;i<rows.length;i++){
					if(rows[i].bzcgs!='0'){
						//alert(rows[i].bzcgs);
						alert("所选项目中车购税未下达完,不能使用资金归0下达");
						return;
					}
				}
			}   
			$('#jhxd').dialog("open");

		}
		function planxdAll(){
			if($("#zjgl").is(':checked')){//资金归0下达，即是不需要文件和文号下达
				$('#jhxd').dialog("close");
				//alert($('#bzxdwh').val()+"     "+$('#bztbsj').datebox('getValue'));
				var jhxdwh=$('#bzxdwh').val();
				var bztbsj=$('#bztbsj').datebox('getValue');
				if(bztbsj==''){
					alert("请填写计划下达时间。");
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
					rows[i].xmlx=rows[i].xmbm.substr(10,1);
				}
				var json_data = JSON.stringify(rows); 
				$.ajax({
					type:'post',
					url:'/jxzhpt/qqgl/planxdAll.do',
					data:"json_data="+json_data+"&jhxdwh="+jhxdwh+"&bztbsj="+bztbsj,
					dataType:'json',
					success:function(msg){
						if(msg){
							alert("下达成功");
							queryYhdzx();
							showMxbAll();
						}
							
					}
				});
			}else{
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
					rows[i].xmlx=rows[i].xmbm.substr(10,1);
				}
				var json_data = JSON.stringify(rows); 
				$.ajax({
					type:'post',
					url:'/jxzhpt/qqgl/planxdAll.do',
					data:"json_data="+json_data+"&jhxdwh="+jhxdwh+"&bztbsj="+bztbsj,
					dataType:'json',
					success:function(msg){
						if(msg){
							alert("下达成功");
							queryYhdzx();
							showMxbAll();
						}
							
					}
				});
			}
			
		}
		
		function showMxbAll(){

			var xmlx=$("#xmlx").val();
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
			var scxdnf=$('#scxdnf').combobox("getValues").join(',');
			if(scxdnf.substr(0,1)==',')
				scxdnf=scxdnf.substr(1,xdzt.length);
				var xmnf='';
				if(getUrlParame('id').substr(0,10)=='0101130301')
					xmnf='2011,2012,2013,2014,2015';
				if(getUrlParame('id').substr(0,10)=='0101130302')
					xmnf='2016,2017,2018,2019,2020';
			var params={'jhsh.xmlx':4,'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#lxbm').combotree('getText'),'jhsh.xdzttj':xdzt,'jhsh.zjly':zjly,'jhsh.ghxlxbm':$('#ghlxbm').combotree('getText'),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.xmmc':$('#xmmc').val(),'jhsh.tsdq':tsdq,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),'jhsh.jhxdwh':jhxdwh,
					'jhsh.xdzt':1,'jhsh.lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmnf':xmnf,'jhsh.scxdnf':scxdnf,
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.gyfl':$('#gyfl').val(),'jhsh.sfsycgs':$('#sfsycgs').combobox('getValue'),'jhsh.xdsj':$('#xdsj').datebox('getValue')};
			
			//loadLj(params);
			$('#jhbz').datagrid({    
			    url:'/jxzhpt/qqgl/queryjhxdshbz.do',
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
				{field:'bzxdnf',title:'下达年份',width:70,align:'center',editor:{type:'numberbox',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'bzpfztz',title:'总投资',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'bzrys',title:'燃油税',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'bzdk',title:'厅贷款',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'bzqt',title:'其他',width:60,align:'center',editor:{type:'text',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				//{field:'bztbsj',title:'填报时间',width:70,align:'center',editor:{type:'datebox',options:{valueField:'xzqh',textField:'xzqh',required:false}}},
				{field:'tbdw',title:'操作人',width:100,align:'center',
					formatter: function(value,row,index){
		        		return $.cookie('truename');
		        	}}
			    ]],
			    onClickCell: function (rowIndex, field, value) {
// 			    	alert(field);
			    	beginEditing(rowIndex,field,value);
			    	//$('#jhbz').datagrid('enableCellEditing').datagrid('gotoCell', {index: rowIndex,field: field});
			    }

			}); 
			
		}
		
		
		
		
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhbzLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$("#xmsl").html(msg.SL);
						 $("#tz").html(msg.TZ);
						 $("#rys").html(msg.RYS);
						 $("#dk").html(msg.DK);
						 $("#lc").html(msg.LC);
						 $("#qt").html(msg.QT);
					}else{
						$('#spanztz').html("0");
						$('#spansbz').html("0");
						$('#spanbcgs').html("0");
						$('#spanlc').html("0");
					}
				}
			});
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize');
		});
		
		function exportZjxd(){
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
			var xmnf='';
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2016,2017,2018,2019,2020';
			
			var params={'jhsh.xmlx':4,'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#lxbm').val(),'jhsh.xdzttj':xdzt,'jhsh.zjly':zjly,'jhsh.ghxlxbm':$('#ghlxbm').val(),'jhsh.ghxlxmc':$('#ghlxmc').val(),'jhsh.lxmc':$('#lxmc').val(),
					'jhsh.xmmc':$('#xmmc').val(),'jhsh.tsdq':tsdq,'jhsh.jsdj':$('#jsdj').combobox("getValues").join(","),'jhsh.jhxdwh':$('#jhxdwh').val(),
					'jhsh.xdzt':1,'lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmnf':$('#xmnf').combobox("getValues").join(','),'jhsh.scxdnf':$('#scxdnf').combobox("getValues").join(','),
					'jhsh.xzdj':$('#gldj').combobox("getValues").join(','),'jhsh.gyfl':$('#gyfl').val(),'jhsh.sfsycgs':$('#sfsycgs').combobox('getValue'),'jhsh.xdsj':$('#xdsj').datebox('getValue')};

			
			
			var param='jhsh.xmlx=4&jhsh.xmlx1='+xmlx+'&jhsh.xzqhdm='+getxzqhdm('xzqh')+'&jhsh.ghlxbh='+$('#lxbm').combotree('getText')+'&jhsh.xdzttj='+xdzt+'&jhsh.zjly='+zjly+'&jhsh.ghxlxbm='+$('#ghlxbm').combotree('getText')+'&jhsh.ghxlxmc='+$('#ghlxmc').val()+'&jhsh.lxmc='+$('#lxmc').val()+
			'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq+'&jhsh.jsdj='+$('#jsdj').combobox("getValues").join(",")+'&jhsh.jhxdwh='+$('#jhxdwh').val()+
			'&jhsh.xdzt=1'+'&jhsh.lsjl='+$('#lsjl').combobox("getValue")+'&jhsh.xmnf='+$('#xmnf').combobox("getValues").join(',')+'&jhsh.scxdnf='+$('#scxdnf').combobox("getValues").join(',')+
			'&jhsh.xzdj='+$('#gldj').combobox("getValues").join(',')+'&jhsh.gyfl='+$('#gyfl').val()+'&jhsh.sfsycgs='+$('#sfsycgs').combobox('getValue')+'&jhsh.xmbm='+xmnf+'&jhsh.xdsj='+$('#xdsj').datebox('getValue');

			//alert(param);
			window.location.href="/jxzhpt/qqgl/exportZjxd.do?"+param;
		}
		
		function exportJhshxx(){
			/* var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var param='jhsh.xmlx=4&jhsh.xzqhdm='+getxzqhdm('xzqh')+
			'&jhsh.ghlxbh='+$("#lxbm").val()+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",")+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+
			'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.ghxlxbm='+$("#ghlxbm").val()+"&jhsh.ghxlxmc="+$("#ghlxmc").val()+'&jhsh.jhxdwh='+$("#jhxdwh").val()+
			'&jhsh.xmnf='+xmnf;
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzx.do?"+param; */
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
			
			var scxdnf=$('#scxdnf').combobox("getValues").join(',');
			if(scxdnf.substr(0,1)==',')
				scxdnf=scxdnf.substr(1,xdzt.length);
			var xmnf='';
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2016,2017,2018,2019,2020';
			
			var param='jhsh.xmlx=4&jhsh.xzqhdm='+getxzqhdm('xzqh')+'&jhsh.xmlx1='+xmlx+
			'&jhsh.ghlxbh='+$("#lxbm").combotree('getText')+'&jhsh.xdzttj='+xdzt+'&jhsh.zjly='+zjly+'&jhsh.ghxlxbm='+$("#ghlxbm").combotree('getText')+"&jhsh.ghxlxmc="+$("#ghlxmc").val()+
			'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq+
			'&jhsh.jsdj='+$('#jsdj').combobox("getValues").join(",")+'&jhsh.jhxdwh='+jhxdwh+
			'&jhsh.lsjl='+$('#lsjl').combobox("getValue")+'&jhsh.xmnf='+xmnf+'&jhsh.scxdnf='+scxdnf+
			'&jhsh.xdzt='+1+'&jhsh.xzdj='+$('#gldj').combobox("getValues").join(',')+
			'&jhsh.gyfl='+$('#gyfl').val()+'&jhsh.sfsycgs='+$('#sfsycgs').combobox('getValue')+'&jhsh.xdsj='+$('#xdsj').datebox('getValue');
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzxExcel.do?"+param;
		}
		function exportJhshxx1(){
			/* var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var param='jhsh.xmlx=4&jhsh.xzqhdm='+getxzqhdm('xzqh')+
			'&jhsh.ghlxbh='+$("#lxbm").val()+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",")+'&ylxbh='+$('#gldj').combobox("getValues").join(',')+
			'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.ghxlxbm='+$("#ghlxbm").val()+"&jhsh.ghxlxmc="+$("#ghlxmc").val()+'&jhsh.jhxdwh='+$("#jhxdwh").val()+
			'&jhsh.xmnf='+xmnf;
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzx.do?"+param; */
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
			
			var scxdnf=$('#scxdnf').combobox("getValues").join(',');
			if(scxdnf.substr(0,1)==',')
				scxdnf=scxdnf.substr(1,xdzt.length);
			var xmnf='';
			if(getUrlParame('id').substr(0,10)=='0101130301')
				xmnf='2011,2012,2013,2014,2015';
			if(getUrlParame('id').substr(0,10)=='0101130302')
				xmnf='2016,2017,2018,2019,2020';
			
			var param='jhsh.xmlx=4&jhsh.xzqhdm='+getxzqhdm('xzqh')+'&jhsh.xmlx1='+xmlx+
			'&jhsh.ghlxbh='+$("#lxbm").combotree('getText')+'&jhsh.xdzttj='+xdzt+'&jhsh.zjly='+zjly+'&jhsh.ghxlxbm='+$("#ghlxbm").combotree('getText')+"&jhsh.ghxlxmc="+$("#ghlxmc").val()+
			'&jhsh.lxmc='+$("#lxmc").val()+'&jhsh.xmmc='+$('#xmmc').val()+'&jhsh.tsdq='+tsdq+
			'&jsdj='+$('#jsdj').combobox("getValues").join(",")+'&jhsh.jhxdwh='+jhxdwh+
			'&lsjl='+$('#lsjl').combobox("getValue")+'&jhsh.xmnf='+xmnf+'&jhsh.scxdnf='+scxdnf+
			'&jhsh.xdzt='+1+'&jhsh.xzdj='+$('#gldj').combobox("getValues").join(',')+
			'&jhsh.gyfl='+$('#gyfl').val()+'&jhsh.sfsycgs='+$('#sfsycgs').combobox('getValue')+'&jhsh.xdsj='+$('#xdsj').datebox('getValue');
			window.location.href="/jxzhpt/qqgl/exportJhshYhdzxDetailExcel.do?"+param;
		}
	</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;<span id="astext">计划下达</span>>&nbsp;<span id="bstext"></span>>&nbsp;养护大中修项目</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
       	<tr>
       		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 5px;">
       			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
       				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
       					<font style="color: #0866A0; font-weight: bold"></font>
       				</legend>
       				<div>
       				<table style="margin:5px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
       					<tr height="29">
        						<!-- <td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:114px;"></select></td>
        						<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:110px;" /></td>
        						<td style="display: none" align="right">项目年份：</td>
        						<td style="display: none" ><select id="xmnf" style="width: 114px;"></select></td>
        						<td align="right">技术等级：</td>
        						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:114px;"></select></td>
        						<td align="right">原行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:114px;" class="easyui-combobox"></select></td>
        						<td align="right">特殊地区：</td>
        						<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:114px;"></select></td> -->
        						<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:118px;"></select></td>
        						<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:110px;" /></td>
        						<td align="right">建设性质：</td>
								<td><input name="xmlx" type="text" id="xmlx" style="width:110px;" /></td>
								<td align="right">技术等级：</td>
        						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:118px;"></select></td>
        						<td align="right">首次下达年份：</td>
        						<td><input name="scxdnf" type="text" id="scxdnf" style="width:114px;" /></td>
        						</tr>
        						
        					<tr height="29">
        						<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:118px;" /></td>
        						
        						 <td align="right">资金来源：</td>
        						<td><input name="zjly" type="text" id="zjly" style="width:114px;" /></td>
        					
        						<!-- <td align="right">原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:110px;" /></td>
        						<td align="right">原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:110px;" /></td>
        						<td align="right">规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:110px;" /></td>
        						<td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:110px;" /></td>
        					<td align="right">管养分类：</td>
        						<td><input name="gyfl" type="text" id="gyfl" style="width:110px;" /></td> -->
        						<td align="right">原行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:114px;" class="easyui-combobox"></select></td>
								<td align="right">原路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:118px;" /></td>
        						<td align="right">原路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:110px;" /></td>
        						
        					</tr>
        					<tr height="29">
        					<td align="right">规划路线编码：</td>
        						<td><input name="ghlxbm" type="text" id="ghlxbm" style="width:118px;" /></td>
        						
        					<td align="right">规划路线名称：</td>
        						<td><input name="ghlxmc" type="text" id="ghlxmc" style="width:110px;" /></td>
        						<td align="right">补助历史：</td>
        						<td>
        							<select name="lsjl" id="lsjl" class="easyui-combobox" style="width:114px;">
										<option value="" selected="selected">全部</option>
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
        						</td>
        						<!-- <td align="right">下达状态：</td>
        						<td><input name="xdzt" type="text" id="xdzt" style="width:114px;" /></td>
        						<td align="right">历史记录：</td>
        						<td>
        							<select name="lsjl" id="lsjl" class="easyui-combobox" style="width:114px;">
										<option value="" selected="selected">全部</option>
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
        						</td>
        						<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:114px;" /></td>
        						<td align="right">首次下达年份：</td>
        						<td><input name="scxdnf" type="text" id="scxdnf" style="width:114px;" /></td>
        					<td>建设性质：</td>
								<td><input name="xmlx" type="text" id="xmlx" style="width:110px;" /></td> -->
							<td align="right">是否使用车购税：</td>
        						<td>
        							<select name="sfsycgs" id="sfsycgs" class="easyui-combobox" style="width:118px;">
										<option value="" selected="selected">全部</option>
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
        						</td>	
        					<td align="right">特殊地区：</td>
        					<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:114px;"></select></td> 
        					</tr>
        				<!-- 	<tr height="32">
        						<td align="right">资金来源：</td>
        						<td><input name="zjly" type="text" id="zjly" style="width:114px;" /></td>
        						<td align="right">是否使用车购税：</td>
        						<td>
        							<select name="sfsycgs" id="sfsycgs" class="easyui-combobox" style="width:114px;">
										<option value="" selected="selected">全部</option>
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
        						</td> 
        					</tr>-->
       					<tr height="29">
       						<td align="right">管养分类：</td>
        					<td><input name="gyfl" type="text" id="gyfl" style="width:110px;" /></td>
        					
        					<td align="right">下达状态：</td>
        					<td><input name="xdzt" type="text" id="xdzt" style="width:114px;" /></td>
        					<td align="right">前期完成：</td>
        						<td><input name="xdsj" type="text" id="xdsj" style="width:110px;" class='easyui-datebox'/></td>
        					</tr><tr>
       						<td colspan="4">
       							<img onclick="searchlist()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
								<img onclick="exportJhshxx()" onmouseover="this.src='../../../images/Button/dchz2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dchz1.gif'" src="../../../images/Button/dchz1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img onclick="exportJhshxx1()" onmouseover="this.src='../../../images/Button/dcmx2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcmx1.gif'" src="../../../images/Button/dcmx1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<!-- <img onclick="importJhshZjzj(7)" alt="删除" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
       						</td>
       					</tr>
       				</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px; font-size:12px;">
           		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		燃油税【<span id="rys" style="color: red;">0</span>】万元,
            		厅贷款【<span id="dk" style="color: red;">0</span>】万元,
            		其他【<span id="qt" style="color: red;">0</span>】万元。
            		</div>
           		<div id="tt" border="false" class="easyui-tabs" style="">
            		<script type="text/javascript" >
                	$("#tt").attr('style','width:'+($(window).width()*0.99)+'px;height:'+($(window).height()*0.55)+'px;');
     				</script>
	            		<div title="项目列表" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
					    	<table id="grid"></table>
					    </div>
					    <div title="计划编制" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
<!-- 					    	<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:endEditing()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">编辑完成</a> -->
					    	<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:createAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">生成汇总</a>
					    	<a id='mybuttion3' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdwhAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">计划下达</a>
					    	
					    	
					    	
					    	
<!-- 					    	<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:createAll()" class="button button-tiny button-border button-rounded button-primary">生成汇总</a> -->
<!-- 							<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdwhAll()" class="button button-tiny button-border button-rounded button-primary">计划下达</a> -->
							<input id='zjgl' type="checkbox">资金归0
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
					<td colspan="2" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 45%;">
						<a id='mybuttion4' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:planxdAll()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion4')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion4')"  class="button button-tiny button-rounded button-raised button-primary">下达</a>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>
