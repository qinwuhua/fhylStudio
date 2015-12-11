<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/abbb.js"></script>
	<script type="text/javascript" src="../../js/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadUnit10("gydw",$.cookie("unit"));
			xmnf('xmnf');
			showAll();
		});
		function showAll(){
			var gydw=$("#gydw").combotree("getValues");
			if(gydw.length==0){
				if($.cookie("unit2")=='_____36')
					gydwstr=36;
				else gydwstr= $.cookie("unit2");
			}else if(gydw.length==1){
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				gydwstr=gydw[0] ;
			}else{
				gydwstr= gydw.join(',');
			}
			$("#biaotou").empty();
			var tbody = $("#bblist");
			tbody.empty();
			if($("#jsdj").combobox('getValue')=='12'){
				var str='<tr ><td rowspan="4">序号</td><td rowspan="4">省</td><td rowspan="4">市</td><td rowspan="4">县</td><td rowspan="4">公路编号</td><td>技术等级</td><td>方向</td><td rowspan="4">桩号起点</td><td rowspan="4">桩号终点</td><td>排查时间</td><td>路段分类</td><td >交通事故排查方法</td><td >交通事故风险等级</td><td>公路条件排查方法</td><td>公路风险等级</td><td colspan="10">公路条件信息</td><td colspan="4">路段既有安全设施信息</td><td colspan="7">拟新采取的处置措施</td><td rowspan="2">处置投资估算</td><td rowspan="2">计划实施安防工程年份</td></tr><tr><td rowspan="3">1、一级2、二级</td><td rowspan="3">1、桩号大到小2、桩号小到大3、不分方向</td><td rowspan="3">（年 / 月）</td><td rowspan="3">（A、B、C）</td><td rowspan="3">1、事故风险评估2、事故多发点段识别</td><td>（1、2、3、4、5级）</td><td rowspan="3">1、公路风险评估2、公路条件识别</td><td>（1、2、3、4、5级）</td><td>小半径圆曲线</td><td>连续下坡</td><td>陡坡</td><td>视距不良</td><td>路侧险要</td><td>环境复杂</td><td>交叉口不规范</td><td>交通量</td><td>通行校车或班线车</td><td>运行车速或路段限速或设计速度</td><td>护栏</td><td>标志标线</td><td>警示和视线诱导设施</td><td>其他</td><td>涉及路线参数调整的土建工程</td><td>边坡、边沟或路域环境整治</td><td>标志标线处置</td><td>交叉口综合处置</td><td>加装护栏</td><td>警示诱导设施处置</td><td>其他</td></tr><tr><td>或是否事故多发点段</td><td>或是否高公路风险路段</td><td rowspan="2">0、否1、是</td><td rowspan="2">0、否1、是</td><td rowspan="2">0、否1、是</td><td rowspan="2">0、否1、是</td><td rowspan="2">0、否1、是</td><td rowspan="2">0、否1、是</td><td rowspan="2">0、否1、是</td><td rowspan="2">（AADT）</td><td rowspan="2">0、否1、是</td><td rowspan="2">（km/h）</td><td rowspan="2">0、无1、有</td><td rowspan="2">0、无1、有</td><td rowspan="2">0、无1、有</td><td rowspan="2">用文字简要说明</td><td rowspan="2">0、无1、有</td><td rowspan="2">0、无1、有</td><td rowspan="2">0、无1、有</td><td rowspan="2">0、无1、有</td><td rowspan="2">0、无1、有</td><td rowspan="2">0、无1、有</td><td rowspan="2">用文字简要说明</td><td rowspan="2">万元</td><td rowspan="2">年</td></tr><tr><td>0、否 6、是</td><td>0、否 6、是</td></tr>'
				$("#biaotou").append(str);
				var data='gydw='+gydwstr+'&flag=0'+"&xzdj="+$("#jsdj").combobox('getValue')+"&xmnf="+$("#xmnf").combobox('getValue');
				$.ajax({
					url:"/jxzhpt/gcybb/xmkaqsmfhbb1.do",
					data:data,
					type:"post",
					dataType:"JSON",
					success:function(msg){
						if (msg != null) {
							for ( var i = 0; i < msg.length; i++) {
								tbody.append("<tr><td>"+msg[i].v_0+"</td><td>"
										+msg[i].v_1+"</td><td>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
										+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"
										+msg[i].v_16+"</td><td>"+msg[i].v_17+"</td><td>"
										+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"
										+msg[i].v_20+"</td><td>"+msg[i].v_21+"</td><td>"
										+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
										+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"
										+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"
										+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"
										+msg[i].v_30+"</td><td>"+msg[i].v_31+"</td><td>"
										+msg[i].v_32+"</td><td>"+msg[i].v_33+"</td><td>"
										+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"
										+msg[i].v_36+"</td><td>"+msg[i].v_37+"</td></tr>"
								);
								}
							}else{
								tbody.append("<tr><td></td></tr>"
								);
							}
					}
				});
			}else{
				var str='<tr ><td rowspan="3">序号</td><td rowspan="3">省</td><td rowspan="3">市</td><td rowspan="3">县</td><td rowspan="3">公路编号</td><td>技术等级</td><td>方向</td><td rowspan="3">桩号起点</td><td rowspan="3">桩号终点</td><td>排查时间</td><td>路段分类</td><td colspan="11">综合指标信息</td><td colspan="4">路段既有安全设施信息</td><td colspan="7">拟新采取的处置措施</td><td rowspan="2">处置投资估算</td><td rowspan="2">计划实施安防工程年份</td></tr><tr><td rowspan="2">3、三级4、四级</td><td rowspan="2">1、桩号大到小2、桩号小到大3、不分方向</td><td rowspan="2">（年 / 月）</td><td rowspan="2">（A.1、A.2、A.3、B.1、B.2、B.3、B.4、C）</td><td>符合事故判别指标</td><td>单个急弯</td><td>连续急弯</td><td>连续下坡</td><td>陡坡</td><td>视距不良</td><td>符合公路路侧判别指标</td><td>符合公路环境判别指标</td><td>符合交通量判别指标</td><td>符合通行校车或班线车判别指标</td><td>运行车速或路段限速或设计速度</td><td>护栏</td><td>标志标线</td><td>警示和视线诱导设施</td><td>其他</td><td>涉及路线参数调整的土建工程</td><td>边坡、边沟或路域环境整治</td><td>标志标线处置</td><td>交叉口综合处置</td><td>加装护栏</td><td>警示诱导设施处置</td><td>其他</td></tr><tr><td >0、否1、是</td><td >0、否1、是</td><td >0、否1、是</td><td >0、否1、是</td><td >0、否1、是</td><td >0、否1、是</td><td >0、否1、是</td><td >0、否1、是</td><td >0、否1、是</td><td >0、否1、是</td><td >（km/h）</td><td >0、无1、有</td><td >0、无1、有</td><td >0、无1、有</td><td >用文字简要说明</td><td >0、无1、有</td><td >0、无1、有</td><td >0、无1、有</td><td >0、无1、有</td><td >0、无1、有</td><td >0、无1、有</td><td >用文字简要说明</td><td >万元</td><td >年</td></tr>'
				$("#biaotou").append(str);
				var data='gydw='+gydwstr+'&flag=0'+"&xzdj="+$("#jsdj").combobox('getValue')+"&xmnf="+$("#xmnf").combobox('getValue');
				$.ajax({
					url:"/jxzhpt/gcybb/xmkaqsmfhbb2.do",
					data:data,
					type:"post",
					dataType:"JSON",
					success:function(msg){
						if (msg != null) {
							for ( var i = 0; i < msg.length; i++) {
								tbody.append("<tr><td>"+msg[i].v_0+"</td><td>"
										+msg[i].v_1+"</td><td>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
										+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"
										+msg[i].v_16+"</td><td>"+msg[i].v_17+"</td><td>"
										+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"
										+msg[i].v_20+"</td><td>"+msg[i].v_21+"</td><td>"
										+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
										+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"
										+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"
										+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"
										+msg[i].v_30+"</td><td>"+msg[i].v_31+"</td><td>"
										+msg[i].v_32+"</td><td>"+msg[i].v_33+"</td><td>"
										+msg[i].v_34+"</td></tr>"
								);
								}
							}else{
								tbody.append("<tr><td></td></tr>"
								);
							}
					}
				});
			} 
			
		}
	</script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
#kdtb {
	border-collapse:collapse;
}
#kdtb thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
#kdtb tbody tr td {
	text-align:center; 	
	font-size:1em;
/* 	font-weight:bold; */
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
-->
</style>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;" >
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;height:100%;" cellspacing="0" cellpadding="0" >
			<tr>
			<div id="righttop"  style="height: 30px">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;对部报表>&nbsp;安全生命防护工程基础库报表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%;height:40px; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>单位名称：</span>
        						<select id="gydw" style="width:150px;"></select>
									<span>计划实施年份：</span>
        						<select id="xmnf" style="width:150px;"></select>
        						<span>技术等级：</span>
        						<select id="jsdj" class="easyui-combobox" data-options="panelHeight:'70'">
									<option value="12"selected>一级、二级</option>
										<option value="34">三级、四级</option>
									</select>
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()"/>
									 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportExcel_abjc()" style="vertical-align: -50%;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
		 <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-110)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id="kdtb" width="6000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">安全生命防护工程基础库报表</caption>
								<thead id="biaotou">
									<tr >
									<td rowspan="3">序号</td>
									<td rowspan="3">省</td>
									<td rowspan="3">市</td>
									<td rowspan="3">县</td>
									<td rowspan="3">公路编号</td>
									<td>技术等级</td>
									<td>方向</td>
									<td rowspan="3">桩号起点</td>
									<td rowspan="3">桩号终点</td>
									<td>排查时间</td>
									<td>路段分类</td>
									<td colspan="11">综合指标信息</td>
									<td colspan="4">路段既有安全设施信息</td>
									<td colspan="7">拟新采取的处置措施</td>
									<td rowspan="2">处置投资估算</td>
									<td rowspan="2">计划实施安防工程年份</td>
									</tr>
									<tr>
									<td rowspan="2">3、三级4、四级</td>
									<td rowspan="2">1、桩号大到小2、桩号小到大3、不分方向</td>
									<td rowspan="2">（年 / 月）</td>
									<td rowspan="2">（A.1、A.2、A.3、B.1、B.2、B.3、B.4、C）</td>
									<td>符合事故判别指标</td>
									<td>单个急弯</td>
									<td>连续急弯</td>
									<td>连续下坡</td>
									<td>陡坡</td>
									<td>视距不良</td>
									<td>符合公路路侧判别指标</td>
									<td>符合公路环境判别指标</td>
									<td>符合交通量判别指标</td>
									<td>符合通行校车或班线车判别指标</td>
									<td>运行车速或路段限速或设计速度</td>
									<td>护栏</td>
									<td>标志标线</td>
									<td>警示和视线诱导设施</td>
									<td>其他</td>
									<td>涉及路线参数调整的土建工程</td>
									<td>边坡、边沟或路域环境整治</td>
									<td>标志标线处置</td>
									<td>交叉口综合处置</td>
									<td>加装护栏</td>
									<td>警示诱导设施处置</td>
									<td>其他</td>
									</tr>
									<tr>					
									<td >0、否1、是</td>
									<td >0、否1、是</td>
									<td >0、否1、是</td>
									<td >0、否1、是</td>
									<td >0、否1、是</td>
									<td >0、否1、是</td>
									<td >0、否1、是</td>
									<td >0、否1、是</td>
									<td >0、否1、是</td>
									<td >0、否1、是</td>

									<td >（km/h）</td>
									<td >0、无1、有</td>
									<td >0、无1、有</td>
									<td >0、无1、有</td>
									<td >用文字简要说明</td>
									<td >0、无1、有</td>
									<td >0、无1、有</td>
									<td >0、无1、有</td>
									<td >0、无1、有</td>
									<td >0、无1、有</td>
									<td >0、无1、有</td>
									<td >用文字简要说明</td>
									<td >万元</td>
									<td >年</td>
									</tr>
								</thead>
								 <tbody id='bblist'>
								
								</tbody> 
							</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>