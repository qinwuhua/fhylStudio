<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>按项目类型统计</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	<script type="text/javascript">
		$(function(){
			xzqhComboxTree("xzqh");
			sbnf("searchYear");
			loadData();
		});
		
		function loadData(){
			var xzqhdm=$('#xzqh').combobox('getValue');
			if(xzqhdm=="360000"){
				xzqhdm="36____";
			}else if(new RegExp("^36[0-9][1-9]00$").test(xzqhdm) || new RegExp("^36[1-9][0-9]00$").test(xzqhdm)){
				xzqhdm=xzqhdm.substring(0,4)+"__";
			}
			var jsonData=new Array();
			$.ajax({
				type:'post',
				async : false,
				url:'../../../tjfx/queryGcktj.do',
				data:'xzqhdm='+xzqhdm+'&nf='+$('#searchYear').combo('getValue'),
				dataType:'json',
				success:function(data){
					jsonData.push(eachData(data.gcgj,"路面改建"));
					jsonData.push(eachData(data.gcsj,"路面升级"));
					jsonData.push(eachData(data.shuih,"水毁项目"));
					jsonData.push(eachData(data.yhdzx,"养护大中修"));
					jsonData.push(eachData(data.abgc,"安保工程"));
					jsonData.push(eachData(data.wqgz,"危桥改造"));
					jsonData.push(eachData(data.zhfz,"灾害防治"));
					var jsonTr={'xmlx':"合计",'ztz':0,'sl':0,'wkgztz':0,'wkgsl':0,
							'zjztz':0,'zjsl':0,'jgztz':0,'jgsl':0};
					$.each(jsonData,function(index,item){
						jsonTr.ztz+=item.ztz;
						jsonTr.sl+=item.sl;
						jsonTr.wkgztz+=item.wkgztz;
						jsonTr.wkgsl+=item.wkgsl;
						jsonTr.zjztz+=item.zjztz;
						jsonTr.zjsl+=item.zjsl;
						jsonTr.jgztz+=item.jgztz;
						jsonTr.jgsl+=item.jgsl;
					});
					jsonData.unshift(jsonTr);
				}
			});
			gckxmlxtj(jsonData);
			loadBar(xzqhdm);
			loadBar2(xzqhdm);
		}
		function loadBar(xzqhdm){
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");
		    barChart_1.width =980;
		    barChart_1.height =300;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
		    $.ajax({
				type:"post",
				url:'../../../tjfx/queryGcktj2.do',
				data:'xzqhdm='+xzqhdm+'&nf='+$('#searchYear').combo('getValue')+'&ftlName=gckbar2.ftl',
				dataType:'text',
				success:function(msg){
					//var right=window.parent.window.document.getElementById("rightContent").contentWindow;
					barChart_1.setData(msg);
				}
			});
		}
		
		function loadBar2(xzqhdm){
			barChart_2= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");
		    barChart_2.width =980;
		    barChart_2.height =300;
		    barChart_2.padding =0;
		    barChart_2.wMode="transparent1";
		    barChart_2.write("anychart_div1");
		    var date=new Date();
		    $.ajax({
				type:"post",
				url:'../../../tjfx/queryGcktj2.do',
				data:'xzqhdm='+xzqhdm+'&nf='+$('#searchYear').combo('getValue')+'&ftlName=gckbar3.ftl',
				dataType:'text',
				success:function(msg){
					//var right=window.parent.window.document.getElementById("rightContent").contentWindow;
					barChart_2.setData(msg);
				}
			});
		}
		
		function eachData(data,xmlx){
			var jsonTr={'xmlx':xmlx,'ztz':0,'sl':0,'wkgztz':0,'wkgsl':0,
					'zjztz':0,'zjsl':0,'jgztz':0,'jgsl':0};
			$.each(data,function(index,item){
				if(item.id=="0"){
					jsonTr.wkgztz=parseFloat(item.text);
					jsonTr.wkgsl=parseFloat(item.name);
				}else if(item.id=="1"){
					jsonTr.zjztz=parseFloat(item.text);
					jsonTr.zjsl=parseFloat(item.name);
				}else if(item.id=="2"){
					jsonTr.jgztz=parseFloat(item.text);
					jsonTr.jgsl=parseFloat(item.name);
				}
			});
			jsonTr.ztz=jsonTr.wkgztz+jsonTr.zjztz+jsonTr.jgztz;
			jsonTr.sl=jsonTr.wkgsl+jsonTr.zjsl+jsonTr.jgsl;
			return jsonTr;
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
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2">
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;工程库统计分析>&nbsp;项目类型统计</div>
					</div>
	            </td>
        	</tr>  
        	<tr>
        		<td style="padding-left: 8px;padding-right: 8px;padding-top: 8px;" colspan="2">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div id="searchDiv">
        					<p style="margin:8px 0px 8px 20px;">
        						<span style="vertical-align:middle;">&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;vertical-align:middle;"></select>
        						<span>&nbsp;年份：</span>
        						<select id="searchYear" style="width:80px;">
		        					<option value="2011">2011年</option>
		        					<option value="2012">2012年</option>
		      						<option value="2013">2013年</option>
		        					<option value="2014">2014年</option>
		        					<option selected="selected" value="2015">2015年</option>
		        				</select>
        						<img alt="搜索" onclick="loadData()" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;" colspan="2">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td style="text-align: center;vertical-align:middle;padding-top: 10px;">
        			<div id="anychart_div" style="width:97%;height:300px;margin:10px;"> 
						<div>
							<param name="wmode" value="transparent" />
						</div>
					</div>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: center;vertical-align:middle;padding-top: 10px;">
        			<div id="anychart_div1" style="width:97%;height:300px;margin:10px;"> 
						<div>
							<param name="wmode1" value="transparent1" />
						</div>
					</div>
        		</td>
        	</tr>
		</table>
	</div>
</body>
</html>