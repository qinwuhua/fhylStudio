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
			xmnf('ddlYear1');
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2("xzdj","行政等级");
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=2010;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
				$("#ddlYear1").append("<option value="+x+">"+x+"</option>");
			}
			showAll();
		});
		function xmnf(id){
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
		var fls=1;
		function showAll(){
			var myDate = new Date();
			var y = myDate.getFullYear();
			var xmnf=$("#ddlYear1").combotree("getValues");
			if(fls==1){
				xmnf=y;
				fls++;
			}
			if(xmnf.length==0){
				alert("请选择项目年份");
				return;
			}
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
			var data="gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+xzdj+"&xmnf="+xmnf+"&sfylrbwqk="+$("#sfylrbwqk").combobox('getValue');
			//alert(data);
			var tbody = $("#wqgzlist");
			tbody.empty();
			$("#btnf").html(xmnf);
			$.ajax({
				url:"/jxzhpt/gcybb/getWqgzjy.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
								if(msg[i].v_4==''){
									tbody.append("<tr><td>"+msg[i].v_0+"</td><td  colspan='2'>"+msg[i].v_1+"</td><td>"
											+msg[i].v_3+"</td><td>"
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
											+msg[i].v_28+"</td></tr>"
									);
								}else{
									tbody.append("<tr><td>"+msg[i].v_0+"</td><td>"+msg[i].v_1+"</td><td>"
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
											+msg[i].v_28+"</td></tr>"
											);
								}
							}
						}
					}
			});
		}
	function exportWqgzyb(){
		var myDate = new Date();
		var y = myDate.getFullYear();
		
		var xmnf=$("#ddlYear1").combotree("getValues");
		if(fls==1){
			xmnf=y;
			fls++;
		}
		if(xmnf.length==0){
			alert("请选择项目年份");
			return;
		}
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
		var data="flag=flag&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+xzdj+"&xmnf="+xmnf+"&sfylrbwqk="+$("#sfylrbwqk").combobox('getValue');
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/gcybb/getWqgzjy.do?'+data;
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
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;计划统计报表>&nbsp;农村公路危桥改造工程建议计划（第二批）</div>
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
        						<span>管养单位：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>项目年份：</span>
        						<select  id="ddlYear1" style="width: 80px;"></select>
        						<span>原行政等级：</span>
        						<input type="text" id="xzdj" style="width:50px;">
								<span>是否部库：</span>
	                           	<select id="sfylrbwqk" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 50px">
								<option value="" selected>全部</option>
								<option value="否">否</option>
								<option value="是">是</option>
								</select>
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
							<table id='bbtable' width="4000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;"><span id="btnf" style="font-size: x-large;"></span>年农村公路危桥改造工程建议计划（第二批）</caption>
								<thead>
									<tr>
										<td style="width: 125px">序号</td>
										<td style="width: 125px">设区市</td>
										<td style="width: 125px">县（市、区）</td>
										<td style="width: 125px">路线编码</td>
										<td style="width: 125px">路线名称</td>
										<td style="width: 125px">桥梁编码</td>
										<td style="width: 125px">桥梁名称</td>  
										<td style="width: 125px">中心桩号</td>
										<td style="width: 125px">设计单位</td>
										<td style="width: 125px">设计批复单位</td>
										<td style="width: 125px">批复文号</td>
										<td style="width: 125px">批复总投资（万元）</td>
										<td style="width: 125px">计划使用部（省）补助金额（万元）</td>
										<td style="width: 125px">计划使用地方自筹资金（万元）</td>
										<td style="width: 125px">是否申请按比例补助</td>
										<td style="width: 125px">按比例补助申请文号</td>
										<td style="width: 125px">建设性质</td>
										<td style="width: 125px">建设内容</td>
										<td style="width: 125px">开工年</td>
										<td style="width: 125px">完工年</td>
										<td style="width: 125px">设区市名称</td>
										<td style="width: 125px">县市区名称</td>
										<td style="width: 125px">乡镇名称</td>
										<td style="width: 125px">预算60%（万元）</td>
										<td style="width: 125px">按定额计算（万元）</td>
										<td style="width: 125px">实际补助（万元）</td>
										<td style="width: 125px">桥长（米）</td>
										<td style="width: 125px">桥宽（米）</td>
										<td style="width: 125px">备注</td>
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