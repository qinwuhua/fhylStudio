<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
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
			var myDate = new Date();
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('xzdj','行政等级');
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=y-10;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
				$("#ddlYear1").append("<option value="+x+">"+x+"</option>");
			}
			$('#ddlMonth').val(m);
			search();
		});
		
		function search(){
			$('#tbody_gcgj').empty();
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

			var xmbb = 'flag=""&xmbb.ybny='+$('#ddlYear').val()+"-"+$('#ddlMonth').val()+'&xmbb.sbnf='+$('#ddlYear1').val()+
			'&xmbb.tiaojian='+$('#xzdj').combotree('getValue')+"&xmbb.xzqh="+xzqhstr+"&xmbb.gydw="+gydwstr+"&xmbb.xmmc="+$('#xmmc').val()+"&xmbb.lxmc="+$('#lxmc').val();
			$.ajax({
				type:'post',
				url:'/jxzhpt/gcbb/selGcsjJdbb.do',
				dataType:'json',
				data:xmbb,
				success:function(data){
					$.each(data,function(index,item){
						var tr="<tr>";
						tr+="<td>"+(Number(index)+1)+"</td>";
						tr+="<td>"+item.lxbm+"</td>";
						tr+="<td>"+item.xmmc+"</td>";
						tr+="<td>"+item.jhnf+"</td>";
						tr+="<td>"+item.xmlc+"</td>";
						tr+="<td>"+item.yjsdj+"</td>";
						tr+="<td>"+item.jsjsbz+"</td>";
						tr+="<td>"+item.sjkgsj+"</td>";
						tr+="<td>"+item.pftz+"</td>";
						tr+="<td>"+item.ljtsf+"</td>";
						tr+="<td>"+item.ql_m+"</td>";
						tr+="<td>"+item.ql+"</td>";
						tr+="<td>"+item.hd+"</td>";
						tr+="<td>"+item.sd_m+"</td>";
						tr+="<td>"+item.sd+"</td>";
						tr+="<td>"+item.dc+"</td>";
						tr+="<td>"+item.jc+"</td>";
						tr+="<td>"+item.lqlm+"</td>";
						tr+="<td>"+item.snlm+"</td>";
						tr+="<td>"+item.bywcje+"</td>";
						tr+="<td>"+Number(Number(item.bywcje)/Number(item.pftz)*100).toFixed(2)+"</td>";
						tr+="<td>"+item.bywcljtsf+"</td>";
						tr+="<td>"+item.byqlwcqk_ym+"</td>";
						tr+="<td>"+item.byqlwcqk_z+"</td>";
						tr+="<td>"+item.byhdwcqk_m+"</td>";
						tr+="<td>"+item.bysdwcqk_ym+"</td>";
						tr+="<td>"+item.bysdwcqk_z+"</td>";
						tr+="<td>"+item.bydcwcqk+"</td>";
						tr+="<td>"+item.byjcwcqk+"</td>";
						tr+="<td>"+item.bylqlmwcqk+"</td>";
						tr+="<td>"+item.bysnlmwcqk+"</td>";
						tr+="<td>"+item.zjwcje+"</td>";
						tr+="<td>"+Number(Number(item.zjwcje)/Number(item.pftz)*100).toFixed(2)+"</td>";
						tr+="<td>"+item.zjwcljtsf+"</td>";
						tr+="<td>"+item.zjqlwcqk_ym+"</td>";
						tr+="<td>"+item.zjqlwcqk_z+"</td>";
						tr+="<td>"+item.zjhdwcqk_m+"</td>";
						tr+="<td>"+item.zjsdwcqk_ym+"</td>";
						tr+="<td>"+item.zjsdwcqk_z+"</td>";
						tr+="<td>"+item.zjdcwcqk+"</td>";
						tr+="<td>"+item.zjjcwcqk+"</td>";
						tr+="<td>"+item.zjlqlmwcqk+"</td>";
						tr+="<td>"+item.zjsnlmwcqk+"</td>";
						
						tr+="<td>"+item.bnwcje+"</td>";
						tr+="<td>"+Number(Number(item.bnwcje)/Number(item.pftz)*100).toFixed(2)+"</td>";
						tr+="<td>"+item.bnlqlmwcqk+"</td>";
						tr+="<td>"+item.bnsnlmwcqk+"</td>";
						tr+="<td>"+item.bz+"</td>";
						tr+="</tr>";
						$('#tbody_gcgj').append(tr);
					});
				},
				error:function(e){
					alert("系统错误！");
				}
			});
		}
		function exportExcel(){
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

			var data = 'flag=flag&xmbb.ybny='+$('#ddlYear').val()+"-"+$('#ddlMonth').val()+'&xmbb.sbnf='+$('#ddlYear1').val()+
			'&xmbb.tiaojian='+$('#xzdj').combotree('getValue')+"&xmbb.xmmc="+$('#xmmc').val()+"&xmbb.lxmc="+$('#lxmc').val();
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
				window.location.href='/jxzhpt/gcbb/selGcsjJdbb.do?'+data;
			 });
		}
	</script>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;升级改造进度报表</div>
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
		        				<img onclick="search()" alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
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
        						<span>路线名称：</span>
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
                	<div id="gddiv" style="width:100%;height:150px">
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:99%;height:'+($(window).height()-150)+'px');
                		</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="4500px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">普通国省干线公路建设项目工程进度完成情况汇总表</caption>
								<thead>
									<tr>
										<td rowspan="3" width="125px;">序号</td>
										<td rowspan="3" width="125px;">路线编码</td>
										<td rowspan="3" width="125px;">项目名称</td>
										<td rowspan="3" width="125px;">计划年度</td>
										<td rowspan="3" width="125px;">改造公里<br>（公里）</td>
										<td rowspan="3" width="125px;">原技术等级</td>
										<td rowspan="3" width="125px;">建设技术标准</td>
										<td rowspan="3" width="125px;">开工时间</td>
										<td colspan="11">计划工程</td>
										<td colspan="12">本月完成工程量</td>
										<td colspan="12">自开工累计完成工程量</td>
										<td colspan="4">本年元月至本月累计完成工程量</td>
										<td rowspan="3" width="125px;">备注</td>
									</tr>	
									<tr>
										<td rowspan="2" width="125px;">投资额<br>（万元）</td>
										<td rowspan="2" width="125px;">路基土石方（m³）</td>
										<td colspan="2">桥梁</td>
										<td rowspan="2" width="125px;">涵洞（米）</td>
										<td colspan="2">隧道</td>
										<td colspan="4">路面工程（公里）</td>
										<td rowspan="2" width="125px;">投资额<br>（万元）</td>
										<td rowspan="2" width="125px;">占投资比例（%）</td>
										<td rowspan="2" width="125px;">路基土石方 （m³）</td>
										<td colspan="2">桥梁</td>
										<td rowspan="2" width="125px;">涵洞（米）</td>
										<td colspan="2">隧道</td>
										<td colspan="4">路面工程（公里）</td>
										<td rowspan="2" width="125px;">投资额<br>（万元）</td>
										<td rowspan="2" width="125px;">占投资比例（%）</td>
										<td rowspan="2" width="125px;">路基土石方（m³）</td>
										<td colspan="2">桥梁</td>
										<td rowspan="2" width="125px;">涵洞（米）</td>
										<td colspan="2">隧道</td>
										<td colspan="4">路面工程<br>（公里）</td>
										<td rowspan="2" width="125px;">投资额<br>（万元）</td>
										<td rowspan="2" width="125px;">占投资比例（%）</td>
										<td colspan="2">路面工程<br>（公里）</td>
									</tr>
									<tr>
										<td width="125px;">米</td>
										<td width="125px;">座</td>
										<td width="125px;">米</td>
										<td width="125px;">座</td>
										<td width="125px;">垫层</td>
										<td width="125px;">基层</td>
										<td width="125px;">沥青路面</td>
										<td width="125px;">水泥路面</td>
										<td width="125px;">米</td>
										<td width="125px;">座</td>
										<td width="125px;">米</td>
										<td width="125px;">座</td>
										<td width="125px;">垫层</td>
										<td width="125px;">基层</td>
										<td width="125px;">沥青路面</td>
										<td width="125px;">水泥路面</td>
										<td width="125px;">米</td>
										<td width="125px;">座</td>
										<td width="125px;">米</td>
										<td width="125px;">座</td>
										<td width="125px;">垫层</td>
										<td width="125px;">基层</td>
										<td width="125px;">沥青路面</td>
										<td width="125px;">水泥路面</td>
										<td width="125px;">沥青路面</td>
										<td width="125px;">水泥路面</td>
									</tr>
								</thead>
								<tbody id="tbody_gcgj">
								
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
