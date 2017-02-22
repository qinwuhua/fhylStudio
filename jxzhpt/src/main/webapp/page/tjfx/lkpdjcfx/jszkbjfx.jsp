<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>公路技术状况比较分析</title>
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
			loadBmbm2("jsdj","技术等级");
			
			$("#query").click(function(){
				if($("#roadcode").combobox("getValue")==""){
					alert("请先选择路段！");
					return;
				}
				Query();
			});
		});
		
		function Query(){
			$.ajax({
				type:'post',
				url:"/jxzhpt/tjfx/queryLkbjfx.do",
				data:"lkmxb.lxbh="+$("#roadcode").combobox("getValue")+"&lkmxb.qdzh="+$("#qdzh").val()+"&lkmxb.zdzh="+$("#zdzh").val()+
				"&lkmxb.jsdj="+$('#jsdj').combobox("getValue")+"&lkmxb.tbnf="+$("#lkpdbb").val(),
				dataType:'json',
				success:function(msg){
					if(msg.length>0){
						$("#grid").html("");
						var str="";
						for(var i=0;i<msg.length;i++){
							str+="<tr align='center' height='30'><td>"+msg[i].v_0+"</td><td>"+
							"<td>"+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td>"+"<td>"+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td>"+"<td>"+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td>"+
							"<td>"+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td>"+"<td>"+msg[i].v_16+"</td><td>"+msg[i].v_17+"</td>"+"<td>"+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td>"+
							"<td>"+msg[i].v_20+"</td><td>"+msg[i].v_21+"</td>"+"<td>"+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td>"+"<td>"+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td>"+
							"<td>"+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td>"+"<td>"+msg[i].v_28+"</td>"+
							"</tr>";
						}
						$("#grid").html(str);
						queryBar(msg);
					}else{
						$("#grid").html("<tr align='center' height='30'><td colspan='23'>暂无数据</td></tr>");
					}
				}
			});
		}
		
		function queryBar(msg){
			$(".tjt").show();
			var mqiArray= [];var pqiArray = [];var pciArray= [];var rqiArray= [];
			var sciArray= [];var bciArray= [];var tciArray= [];var blArray  = [];
			
		   $.each(msg,function(i,p){
			        blArray.push(p.v_0);
					mqiArray.push(p.v_1);
					pqiArray.push(p.v_2);
					pciArray.push(p.v_3);
					rqiArray.push(p.v_4);
					sciArray.push(p.v_5);
					bciArray.push(p.v_6);
					tciArray.push(p.v_7);
	              });
		   
// 		    blArray.push('2015年路况评定');
// 			mqiArray.push('55');
// 			pqiArray.push('55');
// 			pciArray.push('55');
// 			rqiArray.push('55');
// 			sciArray.push('55');
// 			bciArray.push('55');
// 			tciArray.push('55');
			
	         var myChart = echarts.init(document.getElementById("anychart_div")); 
	         var mqi_img=$("#lkpdbb").val()+"年与"+(parseFloat($("#lkpdbb").val())+1)+"年比较分析表";  
	         
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
	        		    	show:true,
	        		    	data:["MQI","PQI","PCI","RQI","SCI","BCI","TCI"],
	        		        x : 'right',
	        		        y : 'center',
	        		        orient: 'vertical'
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
	        		            data : blArray
	        		        }
	        		    ],
	        		    yAxis : [
	        		        {
	        		            type : 'value'
	        		        }
	        		    ],
	        		    series : [
	        		        {
	        		           name:"MQI",
	        		           type:'bar',
	        	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
	        	　　　　　　　　　　barWidth:20,
	        		           data:mqiArray
	        		        },
	        		        {
	        		        	name:"PQI",
	        		           type:'bar',
	        	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
	        	　　　　　　　　　　barWidth:20,
	        		           data:pqiArray
	        		        },
	        		        {
	        		        	name:"PCI",
	        		            type:'bar',
	        	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
	        	　　　　　　　　　　barWidth:20,
	        		           data:pciArray
	        		        },
	        		        {
	        		        	name:"RQI",
	        		            type:'bar',
	        	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
	        	　　　　　　　　　　barWidth:20,
	        		           data:rqiArray
	        		        },
	        		        {
	        		        	name:"SCI",
	        		            type:'bar',
	        	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
	        	　　　　　　　　　　barWidth:20,
	        		           data:sciArray
	        		        },
	        		        {
	        		        	name:"BCI",
	        		            type:'bar',
	        	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
	        	　　　　　　　　　　barWidth:20,
	        		           data:bciArray
	        		        },
	        		        {
	        		        	name:"TCI",
	        		            type:'bar',
	        	　　　　　　　　　　//设置柱的宽度，要是数据太少，柱子太宽不美观~
	        	　　　　　　　　　　barWidth:20,
	        		           data:tciArray
	        		        }
	        		    ]
	        		};
	            
	            myChart.setOption(option1);
		}

	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">统计分析>&nbsp;路况评定决策分析>&nbsp;公路技术状况比较分析</div>
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
        						<span>路况评定版本：</span>
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
        						<span>技术等级：</span>
        						<span><select id="jsdj" style="width:70px"class="easyui-combobox"></select></span>
        						
        						<img alt="查询" id="query" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table style="width:800px; margin-top: 15px;margin-left: 10px; font-size: 12px;"class="sjhz_bg"
			border="1" cellpadding="3" cellspacing="1">
						<tr align="center" height="30"><td  colspan="2">指标</td><td colspan="3">MQI</td><td  colspan="3">PQI</td><td colspan="3">PCI</td><td colspan="3">RQI</td><td colspan="3">SCI</td><td colspan="3">BCI</td><td colspan="3">TCI</td></tr>
						<tr align="center" height="30"><td colspan="2">段落</td><td>双向</td><td>上行</td><td>下行</td><td>双向</td><td>上行</td><td>下行</td><td>双向</td><td>上行</td><td>下行</td><td>双向</td><td>上行</td><td>下行</td><td>双向</td><td>上行</td><td>下行</td><td>双向</td><td>上行</td><td>下行</td><td>双向</td><td>上行</td><td>下行</td></tr>
						<tbody id="grid">
						<tr align="center"><td style="color: red;" colspan="23">请选择路段后查询</td></tr>
						</tbody>
					</table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;display: none;" class="tjt">
	        			<div style="">
	        				<img id="mqi_img" alt="" src="${pageContext.request.contextPath}/images/jt.jpg">比较分析表
	        			</div>
	        			<div style="height: 300px;border: 1px #C0C0C0 solid;text-align: center;">
	        				<div id="anychart_div" style="width:900px;height:300px;margin:10px;"> 
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