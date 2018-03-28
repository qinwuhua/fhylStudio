<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<link href="/jxzhpt/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
	<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(/jxzhpt/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(/jxzhpt/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<style type="text/css">
		<!--
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:hover {text-decoration: none;}
		a:active {text-decoration: none;}
		#bbtable {border-collapse:collapse;}
		#bbtable thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid #cde0f3;padding:3px 7px 2px 7px;}
		#bbtable tbody tr td {text-align:center;font-size:1em;border:1px solid #cde0f3;padding:3px 7px 2px 7px;}
		-->
	</style>
	<script type="text/javascript">
	$(function(){
		loadDist1("xzqh",$.cookie("dist"));
		showBb();
	});

	function dcExcel(){
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
		
 		var data="flag=1"+"&xzqh="+xzqhstr; 

 		loadjzt();
		window.location.href='/jxzhpt/qqgl/queryXmQqjdhzb1.do?'+data;
		setTimeout('disLoadjzt()',4000); 
	}

	function showBb(){
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
		
 		var data="flag=0"+"&xzqh="+xzqhstr; 

 		var tbody = $("#abgclist");
				tbody.empty();

		loadjzt();
		
		$.ajax({
			url:"/jxzhpt/qqgl/queryXmQqjdhzb1.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalist=msg;
				disLoadjzt();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						var tr="<tr>";
						tr=tr+ "<td>"+msg[i].v_0+"</td><td>"
						+msg[i].v_1+"</td><td>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"+msg[i].v_4+"</td><td>"
						+msg[i].v_5+"</td><td>"+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"+msg[i].v_8+"</td><td>"
						+msg[i].v_9+"</td><td>"+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"+msg[i].v_12+"</td><td>"
						+msg[i].v_13+"</td><td>"+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"+msg[i].v_16+"</td><td>"
						+msg[i].v_17+"</td><td>"+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"+msg[i].v_20+"</td><td>"
						+msg[i].v_21+"</td><td>"+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"+msg[i].v_24+"</td><td>"
						+msg[i].v_25+"</td><td>"+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"+msg[i].v_28+"</td><td>"
						+msg[i].v_29+"</td><td>"+msg[i].v_30+"</td><td>"+msg[i].v_31+"</td><td>"+msg[i].v_32+"</td><td>"
						+msg[i].v_33+"</td><td>"+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"+msg[i].v_36+"</td><td>"
						+msg[i].v_37+"</td><td>"+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td><td>"+msg[i].v_40+"</td><td>"
						+msg[i].v_41+"</td><td>"+msg[i].v_42+"</td><td>"+msg[i].v_43+"</td><td>"+msg[i].v_44+"</td><td>"
						+msg[i].v_45+"</td><td>"+msg[i].v_46+"</td><td>"+msg[i].v_47+"</td><td>"+msg[i].v_48+"</td><td>"
						+msg[i].v_49+"</td><td>"+msg[i].v_50+"</td><td>"+msg[i].v_51+"</td><td>"+msg[i].v_52+"</td>"
						tr+="</tr>";
						tbody.append(tr);
					}
				}
			}
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
 cursor: pointer;
}
a:active {
 text-decoration: none;
}
-->
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>

	
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
					<div id="righttop">
						<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;生成报表>&nbsp;月报表>&nbsp;江西省“十三五”普通国省干线规划项目前期工作汇总表-1</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.9%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
        						<tr height="32">
        						<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
							
        					<tr height="32">
        							<td colspan="10">
        						<img onclick="showBb()" alt="查询" src="/jxzhpt/images/Button/Serch01.gif" onmouseover="this.src='/jxzhpt/images/Button/Serch02.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;"/>
								<img alt="导出Ecel" src="/jxzhpt/images/Button/dcecl1.gif" onmouseover="this.src='/jxzhpt/images/Button/dcecl2.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/dcecl1.gif' " onclick="dcExcel()" style="vertical-align: -50%;" />
        				</td>	</tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height: 380px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-140)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="3000px">
								<caption align="top" style="font-size:x-large;font-weight: bolder;">江西省“十三五”普通国省干线规划项目前期工作汇总表-1</caption>
								<tbody id='biaotou'>
									<tr>
										<td rowspan="4" style="width: 160px;">设区市</td>
										<td colspan="47">“十三五”项目（含库外项目）</td>
										<td rowspan="3" colspan="5">库外项目</td>										
									</tr>
									<tr>
									    <td rowspan="3" style="width: 90px;">项目个数</td>
									    <td rowspan="3" style="width: 90px;">行业意见未批复</td>
									    <td rowspan="3" style="width: 90px;">工可未批复</td>
									    <td rowspan="3" style="width: 90px;">工可完成比例</td>
									    <td rowspan="3" style="width: 90px;">初设未批复</td>
									    <td rowspan="3" style="width: 90px;">初设完成比例</td>
									    <td rowspan="3" style="width: 90px;">施工图未批复</td>
									    <td rowspan="3" style="width: 90px;">施工图完成比例</td>
									    <td rowspan="2" colspan="5">其中贫困地区</td>
									    <td colspan="10">2016-2017年建设规模</td>
									    <td colspan="12">2018年应开工建设项目</td>
									    <td rowspan="2" colspan="7">2019-2020建设项目</td>
									    <td rowspan="2" colspan="5">跨“十四五”建设项目</td>    
									</tr>
									<tr>
									    <td rowspan="2" style="width: 120px;">项目个数</td>
									   	<td rowspan="2" style="width: 120px;">行业意见未批复</td>
									   	<td rowspan="2" style="width: 120px;">工可未批复</td>
									   	<td rowspan="2" style="width: 120px;">初设未批复</td>
									   	<td rowspan="2" style="width: 120px;">施工图未批复</td>
										<td colspan="5">其中库外项目</td>
										
										<td rowspan="2" style="width: 120px;">项目个数</td>
									   	<td rowspan="2" style="width: 120px;">行业意见未批复</td>
									   	<td rowspan="2" style="width: 120px;">工可未批复</td>
									   	<td rowspan="2" style="width: 120px;">初设未批复</td>
									   	<td rowspan="2" style="width: 120px;">初设完成比例</td>
									   	<td rowspan="2" style="width: 120px;">施工图未批复</td>
									  	<td rowspan="2" style="width: 120px;">施工图完成比例</td>
									    <td colspan="5">其中库外项目</td>
									</tr>
									<tr>
									   	<td rowspan="1" style="width: 120px;">项目个数</td>
									   	<td rowspan="1" style="width: 120px;">行业意见未批复</td>
									   	<td rowspan="1" style="width: 120px;">工可未批复</td>
									   	<td rowspan="1" style="width: 120px;">初设未批复</td>
									   	<td rowspan="1" style="width: 120px;">施工图未批复</td>
									   
									   	<td rowspan="1" style="width: 120px;">项目个数</td>
									   	<td rowspan="1" style="width: 120px;">行业意见未批复</td>
									   	<td rowspan="1" style="width: 120px;">工可未批复</td>
									   	<td rowspan="1" style="width: 120px;">初设未批复</td>
									   	<td rowspan="1" style="width: 120px;">施工图未批复</td>
									   	
									   	<td rowspan="1" style="width: 120px;">项目个数</td>
									   	<td rowspan="1" style="width: 120px;">行业意见未批复</td>
									   	<td rowspan="1" style="width: 120px;">工可未批复</td>
									   	<td rowspan="1" style="width: 120px;">初设未批复</td>
									   	<td rowspan="1" style="width: 120px;">施工图未批复</td>
									   	
									   	<td rowspan="1" style="width: 120px;">项目个数</td>
									   	<td rowspan="1" style="width: 120px;">行业意见未批复</td>
									   	<td rowspan="1" style="width: 120px;">工可未批复</td>
									   	<td rowspan="1" style="width: 120px;">初设未批复</td>
									   	<td rowspan="1" style="width: 120px;">初设完成比例</td>
									   	<td rowspan="1" style="width: 120px;">施工图未批复</td>
									   	<td rowspan="1" style="width: 120px;">施工图完成比例</td>
									   	
									    <td rowspan="1" style="width: 120px;">项目个数</td>
									   	<td rowspan="1" style="width: 120px;">行业意见未批复</td>
									   	<td rowspan="1" style="width: 120px;">工可未批复</td>
									   	<td rowspan="1" style="width: 120px;">初设未批复</td>
									   	<td rowspan="1" style="width: 120px;">施工图未批复</td>
									   	
									   	<td rowspan="1" style="width: 120px;">项目个数</td>
									   	<td rowspan="1" style="width: 120px;">行业意见未批复</td>
									   	<td rowspan="1" style="width: 120px;">工可未批复</td>
									   	<td rowspan="1" style="width: 120px;">初设未批复</td>
									   	<td rowspan="1" style="width: 120px;">施工图未批复</td>

									</tr>									
								</tbody>
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