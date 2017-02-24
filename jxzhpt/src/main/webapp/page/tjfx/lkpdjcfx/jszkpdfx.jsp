<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>路况技术状况评定分析</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts-plain.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#roadcode").combobox({
				url :"/jxzhpt/tjfx/getLxldCombo.do",
				valueField : "id",
				textField : "text",
				panelHeight:170
			});
			loadBmbm2("jcfx","方向");
			
			$("#query").click(function(){
				if($("#roadcode").combobox("getValue")==""){
					alert("请先选择路段！");
					return;
				}
				Query();
			});
		});
		
		function Query(){
			$("#pdfx_tr").show();
		    $("#mx_tr").hide();
		    
			$.ajax({
				type:'post',
				url:"/jxzhpt/tjfx/queryLkpdfx.do",
				data:"lkmxb.lxbh="+$("#roadcode").combobox("getValue")+"&lkmxb.qdzh="+$("#qdzh").val()+"&lkmxb.zdzh="+$("#zdzh").val()+
				"&lkmxb.jcfx="+$('#jcfx').combobox("getValue")+"&lkmxb.tbnf="+$("#lkpdbb").val(),
				dataType:'json',
				success:function(msg){
					if(msg.length>0){
						$("#grid").html("");
						var str="";
						for(var i=0;i<msg.length;i++){
							str+="<tr align='center' height='30'><td>"+msg[i].v_0+"</td><td>"+msg[i].v_1+"</td><td>"+msg[i].v_2+"</td>"+
							"<td>"+msg[i].v_3+"</td><td>"+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td>"+
							"<td>"+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td></tr>";
						}
						$("#grid").html(str);
						queryBar(msg);
					}else{
						$(".tjt").hide();
						$("#grid").html("<tr align='center' height='30'><td colspan='10'>暂无数据</td></tr>");
					}
				}
			});
		}
		
		function queryBar(msg){
			$(".tjt").show();
			var mqiArray  = [];//mqi各级别路数据
			var rateArray = [];//优良路率数据
			var pdjgArray= [];//评定结果数据
			
			var mqi_img=$("#roadcode").combobox("getValue")+"线MQI状况表";
			var pdjg_img=$("#roadcode").combobox("getValue")+"线技术状况各项指标评定结果";
			
			$.each(msg,function(i,p){
				 if(i==0){
					 mqiArray.push(p.v_2);mqiArray.push(p.v_3);mqiArray.push(p.v_4);
					 mqiArray.push(p.v_5);mqiArray.push(p.v_6);
				 }
				    rateArray.push(p.v_7);
				    pdjgArray.push(p.v_8);
	              });
	            
	         var myChart_mqi = echarts.init(document.getElementById("anychart_div_mqi")); 
	         var myChart_pdjg = echarts.init(document.getElementById("anychart_div_pdjg"));
	            
	            option1 = {
	        		    title : {
	        		        text: mqi_img,
	        		        x:'center',
	        		        textStyle:{
	    			            fontSize: 18
	    			        } 
	        		    },
	        		    tooltip : {
	        		        trigger: 'axis'
	        		    },
	        		    legend: {
	        		    	show:false,
	        		        data:['优等路','良等路','中等路','次等路','差等路'],
	        		        x : 'rihgt',
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
	        		            type : 'category',
	        		            data : ["优等路","良等路","中等路","次等路","差等路"]
	        		        }
	        		    ],
	        		    yAxis : [
	        		        {
	        		            type : 'value'
	        		        }
	        		    ],
	        		    series : [
	        		        {
	        		            type:'bar',
	        		            itemStyle: {
	        	                    normal: {
	        	　　　　　　　　　　　　　　//好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，
	        	                        color: function(params) {
	        	                            // build a color map as your need.
	        	                            var colorList = [
	        	                              '#87CEFA','#2EC7C9','#F59311','#FA4343','#16AFCC'
	        	                            ];
	        	                            return colorList[params.dataIndex]
	        	                        },
	        	　　　　　　　　　　　　　　//以下为是否显示，显示位置和显示格式的设置了
	        	                        label: {
	        	                            show: true,
	        	                            position: 'top',
	        	                            formatter: '{b}\n{c}'
	        	                        }
	        	                    }
	        	                },
	        	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
	        	　　　　　　　　　　barWidth:30,
	        		           data:mqiArray
	        		        }
	        		    ]
	        		};
	            
	            option2 = {
	        		    title : {
	        		        text: pdjg_img,
	        		        x:'center',
	        		        textStyle:{
	    			            fontSize: 18
	    			        } 
	        		    },
	        		    tooltip : {
	        		        trigger: 'axis'
	        		    },
	        		    legend: {
	        		    	show:true,
	        		        data:["优良路率(%)","评定结果"],
	        		        x : 'left',
	        		        y : 'top',
	        		        orient: 'horizontal'
	        		    },
	        		    toolbox: {
	        		        show : true,
	        		        feature : {
	        		            mark : {show: true},
	        		            dataView : {show: true, readOnly: false},
	        		            magicType : {show: true, type: ['line', 'bar']},
	        		            restore : {show: true},
	        		            saveAsImage : {show: true}
	        		        }
	        		    },
	        		    calculable : true,
	        		    xAxis : [
	        		        {
	        		        	boundaryGap: true,	//类目起始和结束两端空白策略，默认为true留空，false则顶头
	        		            type : 'category',
	        		            data : ["MQI","PQI","SCI","BCI","TCI"]
	        		        }
	        		    ],
	        		    yAxis : [
	        		        {
	        		            type : 'value'
	        		        }
	        		    ],
	        		    series : [
	        		        {
	        		        	name:"优良路率(%)",
	        		            type:'bar',
	        		            data:rateArray,
	        		            barWidth:30,
	        		        },
	        		        {
	        		        	name:"评定结果",
	        		            type:'bar',
	        		            data:pdjgArray,
	        		            barWidth:30,
	        		        }
	        		    ]
	            };
	            
	            myChart_mqi.setOption(option1);
	     		myChart_pdjg.setOption(option2);
		}
	
  function loadGrid(lxbh,qdzh,zdzh){
	  $("#pdfx_tr").hide();
	  $("#mx_tr").show();
			$("#grid_mx").datagrid({  
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
						 	'lkmxb.lxbh':$("#roadcode").combobox("getValue"),
						 	'lkmxb.qdzh':$("#qdzh").val(),
						 	'lkmxb.zdzh':$("#zdzh").val(),
						 	'kmxb.jcfx':$('#jcfx').combobox("getValue"),
						 	'lkmxb.tbnf':$("#lkpdbb").val()
						},
			    columns:[
			      [
					{field:'lxbh',title:'路线编码',width:80,align:'center',rowspan:2},
			        {field:'zh',title:'桩号',width:160,align:'center',rowspan:2},
			        {field:'cd',title:'长度',width:120,align:'center',rowspan:2},
			        {field:'mqi',title:'MQI',width:120,align:'center',rowspan:2},
			        {field:'pqi',title:'路面PQI',width:120,align:'center',rowspan:2},
			        {title:'路面分项指标',colspan:5},
			        {field:'sci',title:'路基SCI',width:140,align:'center',rowspan:2},
			        {field:'bci',title:'桥隧构造物BCI',width:140,align:'center',rowspan:2},
			        {field:'tci',title:'沿线设施TCI',width:140,align:'center',rowspan:2}
		         ],
				[	
				    {field:'pci',title:'PCI',width:140,align:'center',rowspan:1},
			        {field:'rqi',title:'RQI',width:140,align:'center',rowspan:1},
			        {field:'rdi',title:'RDI',width:140,align:'center',rowspan:1},
			        {field:'sri',title:'SRI',width:140,align:'center',rowspan:1},
			        {field:'pssi',title:'PSSI',width:140,align:'center',rowspan:1}
			    ]  
			]		
			});
			
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">统计分析>&nbsp;路况评定决策分析>&nbsp;路况技术状况评定分析</div>
	</div>
		<table id="table_message" width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
        		<td style="padding-left: 8px;padding-right: 8px;padding-top: 8px;" colspan="2">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div id="searchDiv">
        					<p style="margin:8px 0px 8px 20px;">
        						<span>路况评定版本：：</span>
        						<span>
        						<select id="lkpdbb" style="width:70px">
        						<option value="2014">2014年</option>
        						<option value="2015">2015年</option>
        						<option value="2016">2016年</option>
        						<option value="2017">2017年</option>
        						</select>
        						</span>
        						<span>管辖路段：</span>
        						<span>
        						<select class="easyui-combobox" id="roadcode" panelHeight="auto" style="width: 160px;"></select>
        						<input id="qdzh" type="text" style="width: 50px;"/>--<input id="zdzh" type="text" style="width: 50px;"/>
        						</span>
        						<span>方向：</span>
        						<span><select id="jcfx" style="width:70px"class="easyui-combobox"></select></span>
        						
        						<img alt="查询" id="query" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        						<img alt="查看明细" onclick="loadGrid();" src="${pageContext.request.contextPath}/images/Button/Serch_01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch_02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch_01.gif'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr id="pdfx_tr">
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table style="width:800px; margin-top: 15px;margin-left: 10px; font-size: 12px;"class="sjhz_bg"
			border="1" cellpadding="3" cellspacing="1">
						<tr align="center" height="30"><td  rowspan="2">项目</td><td colspan="6">实际评定里程（公里）</td><td  rowspan="2">优良路率(%)</td><td colspan="2">评定结果</td></tr>
						<tr align="center" height="30"><td>合计</td><td>优等路</td><td>良等路</td><td>中等路</td><td>次等路</td><td>差等路</td><td>分值</td><td>等级</td></tr>
						<tbody id="grid">
						<tr align="center"><td style="color: red;" colspan="11">请选择路段后查询</td></tr>
						</tbody>
					</table>
            		</div>
            	</td>
        	</tr>
        	<tr id="mx_tr" style="display: none;">
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid_mx"></table>
					</table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;display: none;" class="tjt">
	        			<div style="">
	        				<img id="mqi_img" alt="" src="${pageContext.request.contextPath}/images/jt.jpg">MQI状况表
	        			</div>
	        			<div style="height: 300px;border: 1px #C0C0C0 solid;text-align: center;">
	        				<div id="anychart_div_mqi" style="width:900px;height:300px;margin:10px;"> 
								<div>
									<param name="wmode" value="transparent" />
								</div>
							</div>
	        			</div>
	        		</div>
        		</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;display: none;" class="tjt">
	        			<div style="">
	        				<img id="pdjg_img" alt="" src="${pageContext.request.contextPath}/images/jt.jpg">技术状况各项指标评定结果
	        			</div>
	        			<div style="height: 300px;border: 1px #C0C0C0 solid;text-align: center;">
	        				<div id="anychart_div_pdjg" style="width:900px;height:300px;margin:10px;"> 
								<div>
									<param name="wmode" value="transparent" />
								</div>
							</div>
	        			</div>
	        		</div>
        		</td>
        	</tr>
		</table>
</body>
</html>