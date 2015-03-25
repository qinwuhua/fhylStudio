<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>按行政区划统计</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript">
		$(function(){
			var jsonData=new Array();
			sbnf("searchYear");
			$.ajax({
				type:'post',
				async : false,
				url:'../../../jhgl/queryChildXzqh.do',
				data:'xzqh.id=36__00',
				dataType:'json',
				success:function(data){
					$.each(data,function(index,item){
						var xzqhdm="";
						if(item.id=="360000")
							xzqhdm=item.id.substring(0,2)+"____";
						else
							xzqhdm=item.id.substring(0,4)+"__";
						jsonData.push(loadData(xzqhdm,item.name));
					});
				}
			});
			gckxzqhtj(jsonData);
			loadTjt();
		});
		
		function loadData(xzqhdm,xzqhmc){
			var jsonTr={'xzqh':xzqhmc,'ztz':0,'wctz':0,'sl':0,'wkgztz':0,'wkgsl':0,
					'zjztz':0,'zjwctz':0,'zjsl':0,'jgztz':0,
					'jgwctz':0,'jgsl':0};
			$.ajax({
				type:'post',
				async : false,
				url:'../../../tjfx/queryGcktj.do',
				data:'xzqhdm='+xzqhdm+'&nf='+$('#searchYear').combo("getValue"),
				dataType:'json',
				success:function(data){
					$.each(data.gcgj,function(index,item){
						eachData(jsonTr,item);
					});
					$.each(data.gcsj,function(index,item){
						eachData(jsonTr,item);
					});
					$.each(data.shuih,function(index,item){
						eachData(jsonTr,item);
					});
					$.each(data.yhdzx,function(index,item){
						eachData(jsonTr,item);
					});
					$.each(data.abgc,function(index,item){
						eachData(jsonTr,item);
					});
					$.each(data.wqgz,function(index,item){
						eachData(jsonTr,item);
					});
					$.each(data.zhfz,function(index,item){
						eachData(jsonTr,item);
					});
				}
			});
			return jsonTr;
		}
		
		function loadTjt(){
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
		    barChart_1.width =980;
		    barChart_1.height =450;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
			$.ajax({
				type:'post',
				url:'../../../tjfx/queryGcktjt.do',
				data:'xzqhdm=36__00&nf='+$('#searchYear').val(),
				dataType:'text',
				success:function(data){
					barChart_1.setData(data);
				}
			});
		}
		
		function eachData(jsonTr,item){
			if(item.id=="0"){
				jsonTr.wkgztz+=parseInt(item.text);
				jsonTr.wkgsl+=parseInt(item.name);
			}else if(item.id=="1"){
				jsonTr.zjztz+=parseInt(item.text);
				jsonTr.zjwctz+=parseInt(item.parent);
				jsonTr.zjsl+=parseInt(item.name);
			}else if(item.id=="2"){
				jsonTr.jgztz+=parseInt(item.text);
				jsonTr.jgwctz+=parseInt(item.parent);
				jsonTr.jgsl+=parseInt(item.name);
			}
			jsonTr.ztz=jsonTr.wkgztz+jsonTr.zjztz+jsonTr.jgztz;
			jsonTr.wctz=jsonTr.zjwctz+jsonTr.jgwctz;
			jsonTr.sl=jsonTr.wkgsl+jsonTr.zjsl+jsonTr.jgsl;
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
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;工程库统计分析>&nbsp;行政区划统计</div>
					</div>
	            </td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div style="margin-bottom:10px;">
            			<span style="vertical-align:middle;">年份：</span>
        				<select id="searchYear" style="width:80px;">
        					<option value="2011">2011年</option>
        					<option value="2012">2012年</option>
      						<option value="2013">2013年</option>
        					<option value="2014">2014年</option>
        					<option selected="selected" value="2015">2015年</option>
        				</select>
        				<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="importExcel()" style="vertical-align:middle;"/>
            		</div>
            		<div>
            			<table id="grid" width="99%"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;">
	        			<div style="">
	        				<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">项目信息分布
	        			</div>
	        			<div style="height: 500px;border: 1px #C0C0C0 solid;text-align: center;">
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