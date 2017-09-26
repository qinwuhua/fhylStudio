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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			xmnfdx('ddlYear1');
			xzdjdx("xzdj");
			//xmnf1('wgnf');
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			
			
			showAll();
		});
		
		var fls=1;
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
			
		var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var xmnf=$("#ddlYear1").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var gldj=$("#xzdj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var data="flag=''+&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+gldj+"&xmnf="+xmnf;

			var tbody = $("#wqgzlist");
			tbody.empty();
			//$("#btnf").html(xmnf);
			$.ajax({
				url:"/jxzhpt/gcybb/getAbjsqk.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							tbody.append(
								"<tr><td>"+msg[i].v_0+"</td><td>"+msg[i].v_1+"</td><td>"
								+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
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
								+msg[i].v_36+"</td><td>"+msg[i].v_37+"</td><td>"
								+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td></tr>");
							}
						}
					}
			});
		}
	function exportWqgzyb(){
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
		
	var xzqhdm=$("#xzqh").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var xmnf=$("#ddlYear1").combobox("getValues").join(",");
		if(xmnf.substr(0,1)==',')
			xmnf=xmnf.substr(1,xmnf.length);
		var gldj=$("#xzdj").combobox("getValues").join(",");
		if(gldj.substr(0,1)==',')
			gldj=gldj.substr(1,gldj.length);
		var data="flag=flag&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+gldj+"&xmnf="+xmnf;

		//var data="flag=flag&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+xzdj+"&xmnf="+xmnf+"&sfylrbwqk="+$("#sfylrbwqk").combobox('getValue')+"&gcglwqgz.wgnf="+$("#wgnf").combobox("getValue").replace('不选择','');
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/gcybb/getAbjsqk.do?'+data;
		 });
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
#bbtable {
	border-collapse:collapse;
}
#bbtable thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
#bbtable tbody tr td {
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
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;市农村公路安保工程项目建设表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%;height:70px; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>项目年份：</span>
        						<select  id="ddlYear1" style="width: 80px;"></select>
        						<span>原行政等级：</span>
        						<input type="text" id="xzdj" style="width:50px;">
								<!-- <span>是否部库：</span>
	                           	<select id="sfylrbwqk" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 50px">
								<option value="" selected>全部</option>
								<option value="否">否</option>
								<option value="是">是</option>
								</select> -->
								</p>
							<p style="margin: 8px 0px 8px 20px;">
<!-- 										<span>完工年份：</span> -->
<!--         									<select  id="wgnf" style="width: 80px;"></select> -->
       								<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll()" />
								    <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align: middle;" />
        					</p>		
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-130)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="3000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">市农村公路安保建设明细表</caption>
								<thead>
									<tr>
										<td rowspan="3" style="width: 125px">序号</td>
										<td rowspan="3" style="width: 125px">县（市、区）</td>
										<td rowspan="3" style="width: 125px">是否17个罗宵山区连片特困县</td>
										<td rowspan="3" style="width: 125px">是否38个原中央苏区和特困片区县</td>
										<td rowspan="3" style="width: 125px">是否54个赣南等原中央苏区县</td>
										<td rowspan="3" style="width: 125px">是否21个国家贫困县</td>
										<td colspan="14" style="width: 125px">计划情况</td>
										<td colspan="13" style="width: 125px">建设进展情况</td>
										<td colspan="6" style="width: 125px">资金落实情况</td>
										<td rowspan="3" style="width: 125px">备注</td>
									</tr>
									<tr>
										<td rowspan="2" style="width: 125px">行政区划代码</td>
										<td rowspan="2" style="width: 125px">行政区划名称</td>
										<td rowspan="2" style="width: 125px">路线编码</td>
										<td rowspan="2" style="width: 125px">路线名称</td>
										<td rowspan="2" style="width: 125px">起点桩号</td>
										<td rowspan="2" style="width: 125px">止点桩号</td>
										<td rowspan="2" style="width: 125px">处理隐患里程（公里）</td>
										<td rowspan="2" style="width: 125px">建设性质</td>
										<td rowspan="2" style="width: 125px">计划下达时间</td>
										<td rowspan="2" style="width: 125px">计划开工时间</td>
										<td rowspan="2" style="width: 125px">计划完成时间</td>
										<td rowspan="2" style="width: 125px">预计竣工时间</td>
										
										<td rowspan="2" style="width: 125px">总投资(万元)</td>
										<td rowspan="2" style="width: 125px">其中中央投资(万元)</td>
										<td rowspan="2" style="width: 125px">实际开工时间</td>
										<td rowspan="2" style="width: 125px">工程竣工时间</td>
										<td rowspan="2" style="width: 125px">建设单位</td>
										<td rowspan="2" style="width: 125px">设计单位</td>
										<td rowspan="2" style="width: 125px">施工单位</td>
										<td rowspan="2" style="width: 125px">监理单位</td>
										<td rowspan="2" style="width: 125px">完成总里程（公里）</td>
										<td rowspan="2" style="width: 125px">本年完成里程（公里）</td>
										<td rowspan="2" style="width: 125px">完成总投资（万元）</td>
										<td rowspan="2" style="width: 125px">完成中央投资(万元)</td>
										<td rowspan="2" style="width: 125px">完成地方自筹(万元)</td>
										<td rowspan="2" style="width: 125px">本年完成投资（万元）</td>
										<td rowspan="2" style="width: 125px">项目验收里程(公里)</td>
										<td colspan="3" style="width: 125px">车购税补助资金</td>
										<td colspan="3" style="width: 125px">地方配套资金</td>
										</tr>
										<tr>
										<td style="width: 125px">计划补助资金(万元) </td>
										<td style="width: 125px">到位金额(万元) </td>
										<td style="width: 125px">到位率(%)</td>
										
										<td style="width: 125px">应配套资金(万元)</td>
										<td style="width: 125px">到位金额(万元) </td>
										<td style="width: 125px">到位率(%)</td>
																	
									</tr>
									<tr>
									<td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td>
									<td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td>
									<td>21</td><td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td><td>28</td><td>29</td><td>30</td>
									<td>31</td><td>32</td><td>33</td><td>34</td><td>35</td><td>36</td><td>37</td><td>38</td><td>39</td><td>40</td>
									
									</tr>	
									
								</thead>
								<tbody id="wqgzlist">
								
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