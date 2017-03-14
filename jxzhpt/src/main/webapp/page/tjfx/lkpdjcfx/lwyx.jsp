<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目对路网影响</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts-plain.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/widget/echarts/echarts-all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			nf('endYear');
			$('#endYear').combobox("setValue",new Date().getFullYear());
			nf('startYear');
			$('#startYear').combobox("setValue",$('#endYear').combobox('getValue')-3);
			loadgrid();
		});
		function nf(id){
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
		
		function loadgrid(){
			var tjfl=$("#tjfl").val();
			var zjtitle="";
			var colYears =[],colZj=[];
			var col=[]; 
			var years=[];
			
			for (var i=$('#startYear').combobox("getValue");i<=$('#endYear').combobox('getValue');i++){
				var year ={title:i+'年',width:160,align:'center',colspan:6};
				colYears.push(year);
				var ylll={field:i+'yyll',title:'优良路率(%)',width:90,align:'center'};
				colZj.push(ylll);
				var count={field:i+'count',title:'项目数量',width:90,align:'center'};
				colZj.push(count);
				var ztz={field:i+'ztz',title:'总投资(万元)',width:80,align:'center'};
				colZj.push(ztz);
				var zbz={field:i+'zbz',title:'总补助(万元)',width:80,align:'center'};
				colZj.push(zbz);
				var lc={field:i+'lc',title:'总里程',width:80,align:'center'};
				colZj.push(lc);
				var tsbl={field:i+'tsbl',title:'优良路率提升比例(%)',width:100,align:'center'};
				colZj.push(tsbl);
				years.push(i+'年');
			} 
			
			if(tjfl=='1'){
				zjtitle={field:'xzqh',title:'行政区划',width:80,align:'center',rowspan:3,fixed:true};
			}else{
				zjtitle={field:'lxbm',title:'路线编码',width:80,align:'center',rowspan:3,fixed:true};
			}
			 
			
			$('#grid').datagrid({
			    url:'../../../tjfx/queryXmtoLwyx.do',
			    queryParams:{
			    	'nf':$('#startYear').combobox('getValue'),
			    	'end':$('#endYear').combobox('getValue'),
			    	'tjfl':$("#tjfl").val()
			    	},
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:20,
			    height:380,
			    width:$('#grid').width(),
			    columns:[
							[
                             zjtitle
					    	],
					    	colYears,colZj
						],
			    onLoadSuccess:function(){
			    	queryBar(years,tjfl);
			    }
			});
		}
		
		function queryBar(years,tjfl){
			
			var lengData=[];
			var value1=[]; var value2=[]; var value3=[];var value4=[];
			for (var i=$('#startYear').combobox("getValue");i<=$('#endYear').combobox('getValue');i++){
				value1.push(parseFloat(20.6)+parseFloat(i)-parseFloat(2000));
			}
			for (var i=$('#startYear').combobox("getValue");i<=$('#endYear').combobox('getValue');i++){
				value2.push(parseFloat(80.6)+parseFloat(i)-parseFloat(2000));
			}
			for (var i=$('#startYear').combobox("getValue");i<=$('#endYear').combobox('getValue');i++){
				value3.push(parseFloat(50.6)+parseFloat(i)-parseFloat(2000));
			}
			for (var i=$('#startYear').combobox("getValue");i<=$('#endYear').combobox('getValue');i++){
				value4.push(parseFloat(10.3)+parseFloat(i)-parseFloat(2000));
			}
			
			if(tjfl=="1"){
				lengData=['江西省','南昌市','景德镇','九江市'];
			}
			else{
				lengData=['G105','G320','S310'];
			}
			
			 var myChart = echarts.init(document.getElementById("anychart_div")); 
	            
	            option1 = {
	        		    title : {
	        		        text: "各年份优良路提升比例趋势图",
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
	        		        data:lengData,
	        		        x : 'center',
	        		        y : 'bottom',
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
	        		            data : years
	        		        }
	        		    ],
	        		    yAxis : [
	        		        {
	        		            type : 'value'
	        		        }
	        		    ],
	        		    series : [
							{
								name:"江西省",
							    type:'bar',
							    data:value1,
							    barWidth:30,
							},
							{
								name:"南昌市",
							    type:'bar',
							    data:value2,
							    barWidth:30,
							},
							{
								name:"景德镇",
							    type:'bar',
							    data:value3,
							    barWidth:30,
							},
							{
								name:"九江市",
							    type:'bar',
							    data:value4,
							    barWidth:30,
							},
	        		    ]
	        		};
	            
	            option2 = {
	        		    title : {
	        		        text: "各年份优良路提升比例图",
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
	        		        data:lengData,
	        		        x : 'center',
	        		        y : 'bottom',
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
	        		            data : years
	        		        }
	        		    ],
	        		    yAxis : [
	        		        {
	        		            type : 'value'
	        		        }
	        		    ],
	        		    series : [
							{
								name:"G105",
							    type:'bar',
							    data:value1,
							    barWidth:30,
							},
							{
								name:"G320",
							    type:'bar',
							    data:value2,
							    barWidth:30,
							},
							{
								name:"S310",
							    type:'bar',
							    data:value3,
							    barWidth:30,
							}
	        		    ]
	        		};
	            if(tjfl=="1"){
	            	 myChart.setOption(option1);
	            }else{
	            	 myChart.setOption(option2);
	            }
	           
		}
		
		function xzxm(){
			YMLib.UI.createWindow('lwyx','选择项目','xuanzxm.jsp','lwyx',850,400);
		}	
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;路况评定决策分析>&nbsp;项目对路网影响</div>
					</div>
	            </td>
        	</tr>
        	<tr>
        		<td style="padding-left: 8px;padding-right: 8px;padding-top: 8px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
	        				<p style="margin:8px 0px 8px 20px;vertical-align:middle;">
	        				<span>统计分类：</span>
	        				<span>
	        				<select id="tjfl" style="width:70px;">
	        					 <option value="1">按地市</option>
	        					 <option value="2">按路线</option>
	        				</select>
	        				</span>
	        				<span>
        						开始年份
        						<select id="startYear" style="width:70px;">
        							<option value="2011" selected="selected">2011年</option>
        							<option value="2012">2012年</option>
        							<option value="2013">2013年</option>
        							<option value="2014">2014年</option>
        							<option value="2015">2015年</option>
        						</select>
        						结束年份
        						<select id="endYear" style="width:70px">
        							<option value="2011">2011年</option>
        							<option value="2012">2012年</option>
        							<option value="2013">2013年</option>
        							<option value="2014">2014年</option>
        							<option value="2015" selected="selected">2015年</option>
        						</select>
        					</span>
        						<img onclick="loadgrid()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        					    <a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:xzxm()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">选择项目</a>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div style="width:99%;">
            			<table id="grid" width="100%"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;">
	        			<div style="">
	        				<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">项目信息分布
	        			</div>
	        			<div style="height: 500px;border: 1px #C0C0C0 solid;text-align: center;width:98%;">
	        				<div id="anychart_div" style="width:97%;height:300px;margin:10px;"> 
								<div>
									<param name="wmode" value="transparent" />
								</div>
							</div>
	        			</div>
	        		</div>
        		</td>
        	</tr>
		</table>
	</div>
</body>
</html>