<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>路况评定结果与养护大中修项目分析</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts-plain.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="../../../js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
<script type="text/javascript">
$(function(){
	$("#roadcode").combobox({
		url :"/jxzhpt/tjfx/getLxldCombo.do",
		valueField : "id",
		textField : "text",
		panelHeight:170
	});
	YMLib.Var.jdbs=1;
	if(userPanduan($.cookie("unit2"))!="省"){
		loadBmbm2('sqzt','申请状态地市');
	}else{
		loadBmbm2('sqzt','申请状态省');
	}
	urlxmnf("xmnf",'010112010202');
	queryYhdzx();
});

function queryYhdzx(){
	var xmnf=$("#xmnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',') xmnf=xmnf.substr(1,xmnf.length);
	
	grid.id="grid";
	grid.url="/jxzhpt/qqgl/queryXmsq.do";
	var params={'xmlx':4,
			    'lxbm':$('#roadcode').combobox("getValue"),
			    'xmbm':xmnf,
			    'qdzh':$("#qdzh").val(),
			    'zdzh':$("#zdzh").val(),
			    'xzqhdm':36,
			    'jdbs':YMLib.Var.jdbs,
			    'tsdq':''
	            };
	var sqzt = $('#sqzt').combobox("getValue");
	if(userPanduan($.cookie("unit2"))!="省"){
		params.sqzt=sqzt=='' ? -1 : sqzt;
	}else{
		params.sqzt=sqzt=='' ? -1 : sqzt;
	}
	
	grid.queryParams=params;
	grid.height=$(window).height()-280;
	grid.width=$(window).width()-10;
	grid.pageSize=10;
	grid.pageNumber=1;
	
	if($.cookie('unit2').length==7)
	grid.columns=[[
		{field:'ck',checkbox:true},
		{field:'sqzt',title:'审核状态',width:60,align:'center',
			formatter:function(value,row,index){
				var result="";
				if(userPanduan($.cookie('unit2'))!="省"){
					if(Number(value)==Number($.cookie('unit2').length)){
						result="已上报";
					}else if(Number(value)>0 && Number(value)<Number($.cookie('unit2').length)){
						result="已审核";
					}else if(Number(value)==0 || Number(value)>Number($.cookie('unit2').length)){
						result='未上报';
					}
				}else if(userPanduan($.cookie('unit2'))=="省"){
					if(Number(value)==Number($.cookie('unit2').length)){
						result='已审核';
					}else if(Number(value)==9){
						result='未审核';
					}else{
						result="未上报";
					}
				}
				return result;
			}
		},
		
		{field:'lsjl',title:'历史记录',width:60,align:'center',
			formatter: function(value,row,index){
				if(value=="是"){
					return '是';
				}else{
					return value;
				}
			}
		},
		{field:'wnxmk',title:'五年项目库',width:70,align:'center',
			formatter: function(value,row,index){
				if(value=="是"){
					return '是';
				}else{
					return value;
				}
			}
		},
		{field:'gydw',title:'管养单位',width:100,align:'center'},
		{field:'xzqh',title:'行政区划',width:60,align:'center'},
		{field:'xmmc',title:'项目名称',width:150,align:'center',
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
		{field:'jsdj',title:'技术等级',width:100,align:'center'},
		{field:'ylxbh',title:'原路线编码',width:60,align:'center'},
		{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
		{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
		{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
	    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
	    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
		{field:'ntz',title:'总投资',width:60,align:'center'},
		{field:'sbzj',title:'省补资金',width:60,align:'center'}
		]];
	else{
		grid.columns=[[
						{field:'ck',checkbox:true},
						{field:'sqzt',title:"审核状态",width:60,align:'center',
							formatter:function(value,row,index){
								var result="";
								if(userPanduan($.cookie('unit2'))!="省"){
									if(Number(value)==Number($.cookie('unit2').length)){
										result="已上报";
									}else if(Number(value)>0 && Number(value)<Number($.cookie('unit2').length)){
										result="已审核";
									}else if(Number(value)==0 || Number(value)>Number($.cookie('unit2').length)){
										result='未上报';
									}
								}else if(userPanduan($.cookie('unit2'))=="省"){
									if(Number(value)==Number($.cookie('unit2').length)){
										result='已审核';

									}else if(Number(value)==9){
										result='未审核';
									}else{
										result="未上报";
									}
								}
								return result;
							}
						},
						
						{field:'lsjl',title:'历史记录',width:60,align:'center',
							formatter: function(value,row,index){
								if(value=="是"){
									return '是';
								}else{
									return value;
								}
							}
						},
						{field:'wnxmk',title:'五年项目库',width:70,align:'center',
							formatter: function(value,row,index){
								if(value=="是"){
									return '是';
								}else{
									return value;
								}
							}
						},
						{field:'gydw',title:'管养单位',width:100,align:'center'},
						{field:'xzqh',title:'行政区划',width:60,align:'center'},
						{field:'xmmc',title:'项目名称',width:150,align:'center',
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
						{field:'jsdj',title:'技术等级',width:100,align:'center'},
						{field:'ylxbh',title:'原路线编码',width:60,align:'center'},
						{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
						{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
						{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
					    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
					    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
						{field:'jhkgsj',title:'计划开工时间',width:80,align:'center'},
						{field:'jhwgsj',title:'计划完工时间',width:80,align:'center'},
						{field:'ntz',title:'总投资',width:60,align:'center'}
						]];
		
	}
	gridBindyh(grid);
}

function queryLkpd(){
	var selRow = $('#grid').datagrid("getSelections");
	if(selRow.length==0){alert("请选择一条项目数据！");return;}
	else if(selRow.length!=1){
		alert("只能选择一条数据！");return;
	}else{
		loadGrid(selRow[0].ylxbh,selRow[0].qdzh,selRow[0].zdzh);
		queryBar(selRow[0].ylxbh,selRow[0].qdzh,selRow[0].zdzh);
	}
}

function loadGrid(lxbh,qdzh,zdzh){
	var xmnf=$("#xmnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',') xmnf=xmnf.substr(1,xmnf.length);
	
	$("#grid_lkpd").datagrid({  
		    border:true,
			pagination:true,
			rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    fitColumns:true,
		    height:$(window).height()-250,
			width:$(window).width()-10,
			url:'/jxzhpt/tjfx/queryLkpdmx.do',
			queryParams : {
				 	'lkmxb.lxbh':lxbh,
				 	'lkmxb.qdzh':qdzh,
				 	'lkmxb.zdzh':zdzh,
				 	'lkmxb.tbnf':xmnf,
				},
	    columns:[
	      [
			{field:'lxbh',title:'路线编码',width:80,align:'center',rowspan:2},
	        {field:'zh',title:'桩号',width:160,align:'center',rowspan:2},
	        {field:'cd',title:'长度',width:120,align:'center',rowspan:2},
	        {field:'jcfx',title:'检查方向',width:120,align:'center',rowspan:2},
	        {field:'jsdj',title:'技术等级',width:120,align:'center',rowspan:2},
	        {field:'lmlx',title:'路面类型',width:120,align:'center',rowspan:2},
	        {field:'mqi',title:'MQI',width:100,align:'center',rowspan:2},
	        {field:'pqi',title:'路面PQI',width:100,align:'center',rowspan:2},
	        {title:'路面分项指标',colspan:5},
	        {field:'sci',title:'路基SCI',width:140,align:'center',rowspan:2},
	        {field:'bci',title:'桥隧构造物BCI',width:140,align:'center',rowspan:2},
	        {field:'tci',title:'沿线设施TCI',width:140,align:'center',rowspan:2}
         ],
		[	
		    {field:'pci',title:'PCI',width:80,align:'center',rowspan:1},
	        {field:'rqi',title:'RQI',width:80,align:'center',rowspan:1},
	        {field:'rdi',title:'RDI',width:80,align:'center',rowspan:1},
	        {field:'sri',title:'SRI',width:80,align:'center',rowspan:1},
	        {field:'pssi',title:'PSSI',width:80,align:'center',rowspan:1}
	    ]  
	]		
	});
	
}

function queryBar(lxbh,qdzh,zdzh){
	var xmnf=$("#xmnf").combobox("getValues").join(",");
	if(xmnf.substr(0,1)==',') xmnf=xmnf.substr(1,xmnf.length);
	
	$.ajax({
		type:'post',
		url:"/jxzhpt/tjfx/queryLkpdmxList.do",
		data:"lkmxb.lxbh="+lxbh+"&lkmxb.qdzh="+qdzh+"&lkmxb.zdzh="+zdzh+"&lkmxb.tbnf="+xmnf,
		dataType:'json',
		success:function(msg){
			if(msg.length>0){
				
				var mqiArray  = [];//mqi各级别路数据
				var pqiArray = [];
				var xArray = [];
				
				$.each(msg,function(i,p){
						mqiArray.push(p.mqi);
						pqiArray.push(p.pqi);
						xArray.push(p.zh);
			          });
				
			     var myChart = echarts.init(document.getElementById("anychart_div")); 
			        
			        option1 = {
			    		    title : {
			    		        text: "路况评定分段信息统计图",
			    		        x:'center',
			    		        textStyle:{
						            fontSize: 18
						        } 
			    		    },
			    		    tooltip : {
			    		        trigger: 'axis'
			    		    },
			    		    legend: {
			    		    	show: true,
			    		        data:['MQI','PQI'],
			    		        x : 'left',
			    		        y : 'top',
			    		        orient: 'horizontal'
			    		    },
			    		    toolbox: {
			    		        show : true,
			    		        feature : {
			    		            mark : {show: true},
			    		            dataZoom : {	//框选区域缩放
										show : true,
										title : {
											dataZoom : '区域缩放',
											dataZoomReset : '区域缩放后退'
										}
									},
			    		            dataView : {show: true, readOnly: false},
			    		            magicType : {show: true, type: ['line', 'bar']},
			    		            restore : {show: true},
			    		            saveAsImage : {show: true}
			    		        }
			    		    },
			    		    calculable : true,
			    		    xAxis : [
			    		        {
			    		        	boundaryGap: true,
			    		            type : 'category',
			    		            data : xArray,
			    		            textStyle:{
							            fontSize: 10
							        } 
			    		        }
			    		    ],
			    		    yAxis : [
			    		        {
			    		            type : 'value'
			    		        }
			    		    ],
			    		    series : [
			    		        {
			    		        	name:'MQI',
			    		            type:'bar',
			    	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
			    	　　　　　　　　　　barWidth:20,
			    		           data:mqiArray
			    		        },
			    		        {
			    		        	name:'PQI',
			    		            type:'bar',
			    	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
			    	　　　　　　　　　　barWidth:20,
			    		           data:pqiArray
			    		        }
			    		    ]
			    		};
			        
			        myChart.setOption(option1);
			}
		}
	});
	
}
</script>
<style type="text/css">
TD {
font-size: 12px;margin:0px;padding:0px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:6px;}
</style>
</head>
<body>
		<div id="righttop">
		<div id="p_top">统计分析>&nbsp;路况评定决策分析>&nbsp;路况评定结果与养护大中修项目分析</div>
		</div>

	<table id="table_message" width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #cde0f3;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
				<div>
						<table style=" margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr  height="32">
							  <td>管辖路段：</td>
							  <td>
							  <select class="easyui-combobox" id="roadcode" panelHeight="auto" style="width: 220px;"></select>
							  <input id="qdzh" type="text" style="width: 50px;"/>--<input id="zdzh" type="text" style="width: 50px;"/>
							  </td>
							  <td><span id="ztspan">&nbsp;审核状态</span>：</td>
       						  <td><select id="sqzt" class="easyui-combobox" style="width: 70px;"></select></td>
							  <td>项目年份：</td>
        					  <td><select id="xmnf" style="width:100px;"></select></td>
							  <td>
							 	<img onclick="queryYhdzx()" name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif"  style="border-width:0px;cursor: hand;" />
							 	<img onclick="queryLkpd()" name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch_02.gif'" alt="查看路况评定" onmouseout="this.src='../../../images/Button/Serch_01.gif'" src="../../../images/Button/Serch_01.gif"  style="border-width:0px;cursor: hand;" />
							  </td>
							</tr>
							</table>
						</div>
			</fieldset>
			 </td>
		  </tr>
		  <tr>
		  <td style="padding-left: 10px;padding-top:5px; font-size:12px;">
		  <div id="grid"></div>
		  </td>
		  </tr>
		  <tr>
		  <td style="padding-left: 10px;padding-top:5px; font-size:12px;">
		   <div class="easyui-tabs" style="width:1200px;">
			<div title="路况评定分段信息列表">
				<table id="grid_lkpd"></table>
			</div>
			<div title="路况评定分段信息统计图">
			 <div style="margin-left: 10px;margin-top: 10px;" >
	        	<div style="height: 350px;border: 1px #C0C0C0 solid;text-align: center;">
	        		<div id="anychart_div" style="width:900px;height:300px;margin:10px;"> 
						<div>
							<param name="wmode" value="transparent" />
						</div>
					</div>
	        	</div>
	         </div>
		    </div>  
	       </div>
	       </td>
		  </tr>
		</table>
		
	
</body>
</html>
