<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<style type="text/css">
		<!--
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:hover {text-decoration: none;}
		a:active {text-decoration: none;}
		#bbtable {border-collapse:collapse;}
		#bbtable thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid black;padding:3px 7px 2px 7px;}
		#bbtable tbody tr td {text-align:center;font-size:1em;border:1px solid black;padding:3px 7px 2px 7px;}
		-->
	</style>
	<script type="text/javascript">
	$(function(){
		setjhxdnf();
		loadUnit1("gydw",$.cookie("unit"));
		loadDist1("xzqh",$.cookie("dist"));
		loadBmbm2("xzdj","公路等级");
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1; 
		for(var x=y;x>=2010;x--){
			$("#ddlYear").append("<option value="+x+">"+x+"</option>");
			$("#ddlYear1").append("<option value="+x+">"+x+"</option>");
		}
		$("#yf"+m).attr("selected","selected");
	});
	function setjhxdnf(){
		$("#ddlYear1").combotree({    
			checkbox: true,
			async: false,
		    url: '/jxzhpt/xmjzbb/setjhxdnf1.do',    
		    required: false,
		    multiple:true,
		    onLoadSuccess:function(node, data){
		    	showAll();
		    }
		});
		
	}
	function showAll(){
		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val();
		var xmnf=$("#ddlYear1").combotree("getValues");
		var gydw1=$("#gydw").combotree("getValues");
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
		var xzdj=$("#xzdj").combobox("getValue");
		var lxmc=$("#lxmc").val();
		var data="flag=''&nf="+nf+"&yf="+yf+"&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+xzdj+"&lxmc="+lxmc+"&xmmc="+$("#xmmc").val()+"&xmnf="+xmnf;
		//alert(data);
		var tbody = $("#abgclist");
				tbody.empty();
		$.ajax({
			url:"/jxzhpt/gcybb/getGlgzxj.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				$("#nian").text($("#ddlYear").val());
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						if(msg[i].v_2==' '){
							tbody.append("<tr><td colspan='2'>"+msg[i].v_0+"</td><td>"
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
									+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td><td>"
									+msg[i].v_40+"</td><td>"+msg[i].v_41+"</td><td>"
									+msg[i].v_42+"</td><td>"+msg[i].v_43+"</td><td>"
									+msg[i].v_44+"</td><td>"+msg[i].v_45+"</td><td>"
									+msg[i].v_46+"</td><td>"+msg[i].v_47+"</td><td>"
									+msg[i].v_48+"</td><td>"+msg[i].v_49+"</td><td>"
									+msg[i].v_50+"</td><td>"+msg[i].v_51+"</td><td>"
									+msg[i].v_52+"</td><td>"+msg[i].v_53+"</td><td>"
									+msg[i].v_54+"</td><td>"+msg[i].v_55+"</td><td>"
									+msg[i].v_56+"</td><td>"+msg[i].v_57+"</td><td>"
									+msg[i].v_58+"</td><td>"+msg[i].v_59+"</td><td>"
									+msg[i].v_60+"</td><td>"+msg[i].v_61+"</td></tr>"
							);
						}else{
							tbody.append("<tr><td >"+msg[i].v_0+"</td><td>"+msg[i].v_1+"</td><td>"
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
									+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td><td>"
									+msg[i].v_40+"</td><td>"+msg[i].v_41+"</td><td>"
									+msg[i].v_42+"</td><td>"+msg[i].v_43+"</td><td>"
									+msg[i].v_44+"</td><td>"+msg[i].v_45+"</td><td>"
									+msg[i].v_46+"</td><td>"+msg[i].v_47+"</td><td>"
									+msg[i].v_48+"</td><td>"+msg[i].v_49+"</td><td>"
									+msg[i].v_50+"</td><td>"+msg[i].v_51+"</td><td>"
									+msg[i].v_52+"</td><td>"+msg[i].v_53+"</td><td>"
									+msg[i].v_54+"</td><td>"+msg[i].v_55+"</td><td>"
									+msg[i].v_56+"</td><td>"+msg[i].v_57+"</td><td>"
									+msg[i].v_58+"</td><td>"+msg[i].v_59+"</td><td>"
									+msg[i].v_60+"</td><td>"+msg[i].v_61+"</td></tr>"
							);
						}
					}
				}
			}
		});
	}
	function exportExcel(){
		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val();
		var xmnf=$("#ddlYear1").combotree("getValues");
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
		var xzdj=$("#xzdj").combobox("getValue");
		var lxmc=$("#lxmc").val();
		var data="flag=flag&nf="+nf+"&yf="+yf+"&xzdj="+xzdj+"&lxmc="+lxmc+"&xmmc="+$("#xmmc").val()+"&xmnf="+xmnf;
		
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/gcybb/getGlgzxj.do?'+data;
		 });
	}	
	</script>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
					<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;公路改造工程新上、续建工程项目完成情况明细表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.9%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>月报年份：</span>
		 						<select name="ddlYear" id="ddlYear" style="width: 80px;">
								</select>
		 						<span>月报月份：</span>
		 						<select name="ddlMonth" id="ddlMonth" style="width: 60px;">
									<option id="yf1" value="1">01</option>
									<option id="yf2" value="2">02</option>
									<option id="yf3" value="3">03</option>
									<option id="yf4" value="4">04</option>
									<option id="yf5" value="5">05</option>
									<option id="yf6" value="6">06</option>
									<option id="yf7" value="7">07</option>
									<option id="yf8" value="8">08</option>
									<option id="yf9" value="9">09</option>
									<option id="yf10" value="10">10</option>
									<option id="yf11" value="11">11</option>
									<option id="yf12" value="12">12</option>
								</select>
		        				<span>项目名称：</span>
		        				<input id="xmmc" type="text"  style="width: 100px">
		        				<img onclick="showAll()" alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;"/>
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>项目年份：</span>
        						<select  id="ddlYear1" style="width: 80px;"></select>
        						<span>行政等级：</span>
        						<select id="xzdj" class="easyui-combobox" style="width:60px;">
        						</select>
        						<span>路线编码：</span>
        						<input id="lxmc" type="text"  style="width: 100px">
								<img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportExcel()" style="vertical-align: -50%;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height: 400px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-150)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="8000px">
								<caption align="top" style="font-size:x-large;font-weight: bolder;"> 公路局<span id='nian' style="font-size: x-large;"></span>年公路改造工程项目完成情况表</caption>
								<thead>
									<tr>
										<td colspan="23">一、 项 目 计 划</td>
										<td colspan="16">二、 本年元月至本月完成情况</td>
										<td colspan="3">三、本月进展情况</td>
										<td colspan="19">四、 自开工至本月底累计完成情况</td>
										<td rowspan="4">备注</td>
									</tr>
									<tr>
										<td rowspan="3"  style="width: 125px;">序号</td>
										<td rowspan="3"  style="width: 125px;">项目所在地市</td>
										<td rowspan="3"  style="width: 125px;">项目所在县市</td>
										<td rowspan="3" style="width: 125px;">路线编码、项目名称</td>
										<td rowspan="3" style="width: 125px;">计划年度</td>
										<td rowspan="3" style="width: 125px;">行政等级</td>
										<td rowspan="3" style="width: 125px;">起点桩号</td>
										<td rowspan="3" style="width: 125px;">讫点桩号</td>
										<td rowspan="3" style="width: 125px;">原技术等级</td>
										<td rowspan="3" style="width: 125px;">建设技术标准</td>
										<td rowspan="3" style="width: 125px;">公路建设类型</td>
										<td rowspan="3" style="width: 125px;">项目里程<br>(公里)</td>
										<td rowspan="3" style="width: 125px;">总投资<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">中央车购税<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">地方配套<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">本年度计划投资<br>(万元)</td>
										<td rowspan="2" style="width: 125px;"></td>
										<td rowspan="3" style="width: 125px;">本年度实施里程<br>(公里)</td>
										<td rowspan="3" style="width: 125px;">项目在建个数<br>(个)</td>										
										<td rowspan="3" style="width: 125px;">项目完工个数<br>(个)</td>
										<td rowspan="3" style="width: 125px;">项目未开工个数<br>(个)</td>
										<td rowspan="3" style="width: 125px;">开工时间(精确到月)</td>
										<td rowspan="3" style="width: 125px;">完工时间(精确到月)</td>
										<td colspan="6">累计资金到位<br>(万 元)</td>
										<td rowspan="3" style="width: 125px;">项目完成投资<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">占投资比例<br>(%)</td>
										<td colspan="8">完   成  工  程  量<br>(公里)</td>
										<td rowspan="3">新增资金到位<br>(万 元)</td>
										<td rowspan="3">新增完成路面工程量<br>(公里)</td>
										<td rowspan="3">新增项目完成投资<br>(万 元)</td>
										<td colspan="6">累计资金到位<br>(万 元)</td>
										<td rowspan="3">项目完成投资<br>(万 元)</td>
										<td colspan="8">累  计  完   成  工  程  量<br>(公里)</td>
										<td rowspan="3" style="width: 125px;">项目未完工程量<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">完成工程量比例(%)</td>
										<td rowspan="3" style="width: 125px;">车购税到位比例(%)</td>
										<td rowspan="3" style="width: 125px;">完成投资比例(%)</td>
									</tr>	
									<tr>
										<td rowspan="2" style="width: 125px;">合计</td>
										<td rowspan="2" style="width: 125px;">中央车购税</td>
										<td colspan="2" >地方配套</td>
										<td rowspan="2" style="width: 125px;">省厅贴息<br>(贷款)</td>
										<td rowspan="2" style="width: 125px;">其他资金</td>
										<td colspan="5">按技术等级</td>
										<td colspan="2">按路面类型</td>
										<td rowspan="2" style="width: 125px;">砂石垫层通车</td>
										<td rowspan="2" style="width: 125px;">合计</td>
										<td rowspan="2" style="width: 125px;">中央车购税</td>
										<td colspan="2" >地方配套</td>
										<td rowspan="2" style="width: 125px;">省厅贴息<br>(贷款)</td>
										<td rowspan="2" style="width: 125px;">其他资金</td>
										<td colspan="5">按技术等级</td>
										<td colspan="2">按路面类型</td>
										<td rowspan="2" style="width: 125px;">砂石垫层通车</td>
									</tr>
									<tr>
										<td style="width: 100px;">其中：中央车购税</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">其中：银行贷款</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">一级</td>
										<td style="width: 100px;">二级</td>
										<td style="width: 100px;">三级</td>
										<td style="width: 100px;">四级</td>
										<td style="width: 100px;">沥青路</td>
										<td style="width: 100px;">水泥砼</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">其中：银行贷款</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">一级</td>
										<td style="width: 100px;">二级</td>
										<td style="width: 100px;">三级</td>
										<td style="width: 100px;">四级</td>
										<td style="width: 100px;">沥青路</td>
										<td style="width: 100px;">水泥砼</td>
									</tr>
								</thead>
								<tbody id="abgclist"></tbody>
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
