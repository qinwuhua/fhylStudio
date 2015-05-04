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
	<style type="text/css">
		<!--
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:hover {text-decoration: none;}
		a:active {text-decoration: none;}
		table {border-collapse:collapse;}
		table thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid black;padding:3px 7px 2px 7px;}
		table tbody tr td {text-align:center;font-size:1em;border:1px solid black;padding:3px 7px 2px 7px;}
		-->
	</style>
	<script type="text/javascript">
		$(function(){
			var myDate = new Date();
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('xzdj','公路等级');
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
			var xmbb={'xmbb.ybny':$('#ddlYear').val()+"-"+$('#ddlMonth').val(),'xmbb.sbnf':$('#ddlYear1').val(),
					'xmbb.gydw':gydwstr,'xmbb.xzqh':xzqhstr,
					'xmbb.sbnf':$('#ddlYear1').val(),'xmbb.tiaojian':null};
			if($('#xzdj').combotree('getValue')!=""){
				xmbb['xmbb.tiaojian']=$('#xzdj').combotree('getValue');
			}
			$.ajax({
				type:'post',
				url:'/jxzhpt/gcbb/selShuihJdbb.do',
				dataType:'json',
				data:xmbb,
				success:function(data){
					$.each(data,function(index,item){
						var tr="<tr>";
						tr+="<td>"+item.xmmc+"</td>";
						tr+="<td>"+item.sfgyhbm+"</td>";
						var jsdd="";
						var lxbm="";
						var zh="";
						var yhlc="";
						$.each(item.shjdlx,function(index,lx){
							jsdd+=lx.jsdd;
							lxbm+=lx.lxbm;
							zh+=lx.qdzh+"-"+lx.zdzh;
							yhlc+=lx.yhlc;
							if(lx.yhlb=="大修"){
								dx+=lx.yhlb;
							}else if(lx.yhlb=="中修"){
								zx+=lx.yhlb;
							}else if(lx.yhlb=="防御性养护"){
								yfx+=lx.yhlb;
							}
							if(index!=item.gjjdlx.length-1){
								jsdd+=",";
								lxbm+=",";
								zh+=",";
								yhlc+=",";
							}
						});
						tr+="<td>"+jsdd+"</td>";
						tr+="<td>"+lxbm+"</td>";
						tr+="<td>"+zh+"</td>";
						tr+="<td>"+yhlc+"</td>";
						var sjkgsj="",sjwgsj="";
						if(item.sjkgsj!=null){
							sjkgsj=item.sjkgsj.replace(/-/g,':');
						}
						if(item.sjwgsj!=null){
							sjwgsj=item.sjwgsj.replace(/-/g,':');
						}
						if(item.yhlb=="大修"){
							tr+="<td>"+item.yhlb+"</td>";
							tr+="<td></td>";
							tr+="<td></td>";
						}else if(item.yhlb=="中修"){
							tr+="<td></td>";
							tr+="<td>"+item.yhlb+"</td>";
							tr+="<td></td>";
						}else if(item.yhlb=="防御性养护"){
							tr+="<td></td>";
							tr+="<td></td>";
							tr+="<td>"+item.yhlb+"</td>";
						}
						tr+="<td>"+sjkgsj+"-"+sjwgsj+"</td>";
						tr+="<td>"+item.ylmlx+"</td>";
						tr+="<td>"+item.sjlmlx+"</td>";
						tr+="<td>"+item.dc+"</td>";
						tr+="<td>"+item.bywcdc+"</td>";
						tr+="<td>"+item.bnwcdc+"</td>";
						tr+="<td>"+item.zjwcdc+"</td>";
						tr+="<td>"+(Number(item.zjwcdc)/Number(item.dc)*100).toFixed(2)+"%"+"</td>";
						tr+="<td>"+item.jc+"</td>";
						tr+="<td>"+item.bywcjc+"</td>";
						tr+="<td>"+item.bnwcjc+"</td>";
						tr+="<td>"+item.zjwcjc+"</td>";
						tr+="<td>"+(Number(item.zjwcjc)/Number(item.jc)*100).toFixed(2)+"%"+"</td>";
						tr+="<td>"+item.mc+"</td>";
						tr+="<td>"+item.bywcmc+"</td>";
						tr+="<td>"+item.bnwcmc+"</td>";
						tr+="<td>"+item.zjwcmc+"</td>";
						tr+="<td>"+(Number(item.zjwcmc)/Number(item.mc)*100).toFixed(2)+"%"+"</td>";
						tr+="<td>"+item.pfztz+"</td>";
						tr+="<td>"+item.gys+"</td>";
						tr+="<td>"+item.bywcje+"</td>";
						tr+="<td>"+item.bnwcje+"</td>";
						tr+="<td>"+item.zjwcje+"</td>";
						tr+="<td>"+(Number(item.zjwcje)/Number(item.pfztz)*100).toFixed(2)+"%"+"</td>";
						var zt="";
						if(item.kgzt=="0"){
							zt="未开工";
						}else if(item.kgzt=="1" && item.jgzt=="0"){
							zt="在建";
						}else if(item.kgzt=="1" && item.jgzt=="1"){
							zt="竣工";
						}
						tr+="<td>"+zt+"</td>";
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
			'&xmbb.tiaojian='+$('#xzdj').combotree('getValue');
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
				window.location.href='/jxzhpt/gcbb/selShuihJdbb.do?'+data;
			 });
		}
	</script>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;水毁重建进度报表</div>
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
                	<div id="gddiv" style="width:99%;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:99%;height:'+($(window).height()-150)+'px');
                		</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table width="4500px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">2015年水毁重建进度报表 </caption>
								<thead>
									<tr>
										<td rowspan="4">项目名称</td>
										<td rowspan="4">是否归口市局养护部门</td>
										<td rowspan="4">建设地点</td>
										<td rowspan="4">路线编号</td>
										<td rowspan="4">起讫点桩号</td>
										<td rowspan="4">里程长度（km）</td>
										<td colspan="3">养护类别（KM）</td>
										<td rowspan="4">开工日--竣工日</td>
										<td rowspan="4">原路面类型</td>
										<td rowspan="4">设计路面类型</td>
										<td colspan="15">主 要 工 程 <br>数 量 完 成 情 况</td>
										<td colspan="6">投 资 额 完 成 情 况 </td>
										<td rowspan="4">形象进度<br>（未开工\在建\完工）</td>
										<td rowspan="4">备注</td>
									</tr>	
									<tr>
										<td rowspan="3">大修（KM）</td>
										<td rowspan="3">中修（KM）</td>
										<td rowspan="3">预防性养护</td>
										<td colspan="5">垫层</td>
										<td colspan="5">基层</td>
										<td colspan="5">面层</td>
										<td rowspan="3">计划（万元）</td>
										<td rowspan="3">批准预算（万元）</td>
										<td rowspan="3">本月完成（万元）</td>
										<td colspan="3">累计</td>
									</tr>
									<tr>
										<td rowspan="2">计划数量（M³）</td>										
										<td rowspan="2">本月完成数量（M³）</td>
										<td colspan="3">累计</td>
										<td rowspan="2">计划数量（M³）</td>										
										<td rowspan="2">本月完成数量（M³）</td>
										<td colspan="3">累计</td>
										<td rowspan="2">计划数量（M³）</td>										
										<td rowspan="2">本月完成数量（M³）</td>
										<td colspan="3">累计</td>
										<td rowspan="2">年初至本月完成（万元）</td>
										<td rowspan="2">自开工累计完成（万元）</td>
										<td rowspan="2">完成比例(%)</td>
									</tr>
									<tr>
										<td>年初至本月完成数量（M³）</td>
										<td>自开工累计完成数量（M³）</td>
										<td>完成比例(%)</td>
										<td>年初至本月完成数量（M³）</td>
										<td>自开工累计完成数量（M³）</td>
										<td>完成比例(%)</td>
										<td>年初至本月完成数量（M³）</td>
										<td>自开工累计完成数量（M³）</td>
										<td>完成比例(%)</td>
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