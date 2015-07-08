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
			loadGrid();
		});
		function loadGrid(){
			var colXzqh=[];
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryChildXzqh.do',
				data:'xzqh.id=36__00',
				dataType:'json',
				success:function(data){
					var sm={field:"sm",title:"",width:90,align:'center'};
					colXzqh.push(sm);
					$.each(data,function(index,item){
						if(item.id!="360000"){
							var xzqh={field:item.id,title:item.name,width:83,align:'center'};
							colXzqh.push(xzqh);
						}
					});
					$('#grid').datagrid({
					    url:'../../../tjfx/queryGckJhgcltj.do',
					    queryParams:{'nf':$('#searchYear').combobox('getValue')},
					    striped:true,
					    pagination:false,
					    rownumbers:false,
					    pageNumber:1,
					    pageSize:20,
					    height:110,
					    width:$('#grid').width(),
					    columns:[colXzqh],
					    onLoadSuccess:function(){
					    	loadTjt();
					    }
					});
				}
			});
		}
		
		function loadTjt(){
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");
		    barChart_1.width =980;
		    barChart_1.height =300;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
		    $.ajax({
				type:"post",
				url:'../../../tjfx/queryGckJhgcltjt.do',
				data:'nf='+$('#searchYear').combo('getValue')+'&ftlName=gck_jhgcl.ftl&xmlx=计划工程量统计',
				dataType:'text',
				success:function(msg){
					barChart_1.setData(msg);
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
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;工程库统计分析>&nbsp;与上年完成投资额比</div>
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
        				<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="loadGrid()" style="vertical-align:middle;"/>
            		</div>
            		<div>
            			<table id="grid" width="99%"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 5px;">
	        			<div style="">
	        				<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">计划工程量统计
	        			</div>
	        			<div style="height: 300px;border: 1px #C0C0C0 solid;text-align: center;">
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