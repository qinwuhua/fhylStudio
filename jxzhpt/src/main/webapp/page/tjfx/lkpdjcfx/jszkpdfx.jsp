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
			$.ajax({
				type:'post',
				url:"/jxzhpt/tjfx/queryLkpdfx.do",
				data:"lkmxb.lxbh="+$("#roadcode").combobox("getValue")+"&lkmxb.qdzh="+$("#qdzh").val()+"&lkmxb.zdzh="+$("#zdzh").val()+
				"&lkmxb.jcfx="+$('#jcfx').combobox("getValue"),
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
					}else{
						$("#grid").html("<tr align='center' height='30'><td colspan='10'>暂无数据</td></tr>");
					}
				}
			});
		}
		
		function queryBar(){
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
		    barChart_1.width =980;
		    barChart_1.height =300;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
		    $.ajax({
				type:"post",
				url:"/jxzhpt/tjfx/queryJcktj1.do?xmlx="+$('#selxmlx').val(),
				dataType:'text',
				success:function(msg){
					barChart_1.setData(msg);
				}
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
        						<span><select id="lkpdbb" style="width:70px"></select></span>
        						<span>管辖路段：</span>
        						<span>
        						<select class="easyui-combobox" id="roadcode" panelHeight="auto" style="width: 160px;"></select>
        						<input id="qdzh" type="text" style="width: 50px;"/>--<input id="zdzh" type="text" style="width: 50px;"/>
        						</span>
        						<span>方向：</span>
        						<span><select id="jcfx" style="width:70px"class="easyui-combobox"></select></span>
        						
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
						<tr align="center" height="30"><td  rowspan="2">项目</td><td colspan="6">实际评定里程（公里）</td><td  rowspan="2">优良路率(%)</td><td colspan="2">评定结果</td></tr>
						<tr align="center" height="30"><td>合计</td><td>优等路</td><td>良等路</td><td>中等路</td><td>次等路</td><td>差等路</td><td>分值</td><td>等级</td></tr>
						<tbody id="grid">
						<tr align="center"><td style="color: red;" colspan="11">请选择路段后查询</td></tr>
						</tbody>
					</table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;">
	        			<div style="">
	        				<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">MQI状况表
	        			</div>
	        			<div style="height: 350px;border: 1px #C0C0C0 solid;text-align: center;">
	        				<div id="anychart_div" style="width:900px;height:300px;margin:0px;"> 
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