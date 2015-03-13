<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>行政区划统计趋势分析</title>
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
			load();
		});
		function search(){
			$('#grid').datagrid('loadData', { total: 0, rows: [] });
			load();
		}
		function load(){
			var colYears =[],colZj=[];
			var col=[];
			var trJson='{"xzqh":null';//每一行的Json数据的字符串，在下面转为JSON数据并添加入databox中
			for (var i=$('#startYear').val();i<=$('#endYear').val();i++){
				trJson+=',"'+i+'xmzj":0,"'+i+'je":0';
				var year ={title:i+'年',width:160,align:'center',colspan:2};
				colYears.push(year);
				var lczj={field:i+'je',title:'金额总计(万元)',width:90,align:'center'};
				colZj.push(lczj);
				var xmgs={field:i+'xmzj',title:'项目总计(个)',width:80,align:'center'};
				colZj.push(xmgs);
				col[i+'je']=i;
				col[i+'xmzj']=i+"万元";
			}
			trJson+='}';
			var zjtitle={title:'各年份项目金额和数量统计',colspan:colYears.length*2,width:800};
			var grid={id:'grid',data:null,fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
					pageNumber:1,pageSize:20,height:380,width:970,
				    columns:[
					    [
					     	{field:'xzqh',title:'行政区划',width:80,align:'center',rowspan:3,fixed:true},
					     	zjtitle
					    ],
					    colYears,colZj
				    ]
			};
			gridBind(grid);
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryChildXzqh.do',
				data:'xzqh.id=36__00',
				dataType:'json',
				success:function(data){
					$.each(data,function(index,item){
						var a=JSON.parse(trJson);
						a['xzqh']=item.name;
						//alert(a[2012+'xmzj']);
						$('#grid').datagrid('appendRow',a);
					});
				}
			});
		}
		
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;计划库统计分析>&nbsp;行政区划统计趋势分析</div>
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
        						<img onclick="search()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
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
	        			<div style="height: 300px;border: 1px #C0C0C0 solid;text-align: center;">
	        				<img alt="" src="${pageContext.request.contextPath}/page/tjfx/img/tjqs.jpg" width="900" height="300" align="">
	        			</div>
	        		</div>
        		</td>
        	</tr>
		</table>
	</div>
</body>
</html>