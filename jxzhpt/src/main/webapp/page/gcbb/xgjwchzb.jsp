<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新改建完成汇总表</title>
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
		if($.cookie('dist2')!='36'){$("#ghbb").hide()}
		
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth() < 10 ? "0"+(myDate.getMonth()+1) : myDate.getMonth()+1; 
		var d= myDate.getDate() < 10 ? "0"+myDate.getDate() : myDate.getDate();
		var timestr = y+"-"+m+"-"+d;
		$("#ybsj").datebox('setValue',timestr);
		setjhxdnf();
		//urlxmnf("jhxdnf",urlid);
		loadDist1("xzqh",$.cookie("dist"));
	//	loadBmbm2("xmlx","项目类型2");
		xgjxmlx('xmlx');
		//$("#jhxdnf").combotree("setValues",arr);
		showAll();
	});
	
	function setjhxdnf(){
			var id='jhxdnf';
			var myDate = new Date();
			var years=[];
			years.push({text:'全部',value:''});
			for(var i=2011;i<=2020;i++){
				years.push({text:(i),value:(i)});
			}
			$('#'+id).combobox({
			    data:years,
			    valueField:'value',
			    textField:'text',
			    multiple:true,
			    formatter:function(row){
					var opts = $(this).combobox('options');
					return '<input id="'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.value);
							$('#'+id+item.value).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#'+id+record.value).attr('checked', true);
					}
				},
				onUnselect:function(record){
					var opts = $(this).combobox('options');
					var datas = $('#' +id).combobox("getData");
					var values = $('#' +id).combobox("getValues");
					$('#' +id).combobox("clear");
					if(record[opts.valueField]!=""){
						if(jQuery.inArray("",values)>=0){
							values.splice(jQuery.inArray("",values),1);
						}
						$.each(datas,function(index,item){
							if(jQuery.inArray(""+item.value,values)<0){
								$('#'+id+item.value).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#'+id+item.value).attr('checked', false);
						});
					}
				}
			});
			$('#'+id).combobox("setValue",myDate.getFullYear()+'');
			$('#id'+myDate.getFullYear()).attr('checked', true);
		}
		function showAll(){
			var xmnf=$("#jhxdnf").combobox("getValues");
			if(xmnf.join(",").substr(0,1)==',')
			xmnf=xmnf.join(",").substr(1,xmnf.join(",").length).split(',');
			xmnf.sort(function (x,y) {
	            return y-x;
	        });
			var xmlx=$("#xmlx").combobox('getValues').join(',');
			if(xmnf==''){
				alert("请选择年份");
				return;
			}
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		xzqhstr=xzqhdm[0];
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			var biaotou = $("#biaotou");
			var str1='';
			var str2='';
			var str3='';
			var min=xmnf[xmnf.length-1];
			var max=xmnf[0];
			var len=(xmnf.length+1)*1000+"px";
			$("#kdtb").attr('width',len);
			var sv="v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12,v_13,v_14,v_15,v_16,v_17";
			var l=18;
			for(var i=xmnf.length-1;i>=0;i--){
				sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;sv+=",v_"+l;l++;
				str1=str1+'<td colspan="8">计划下达及完成情况</td>';
				str2=str2+'<td rowspan="1" colspan="2">'+xmnf[i]+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td><td rowspan="2">本年到位车购税（万元）</td><td rowspan="2">累计到位车购税（万元）</td>';
				str3=str3+'<td>项目数量</td><td>计划里程（公里）</td>';
			}
			sv+=",v_"+l;l++;
			var ss=sv.split(",");
			biaotstr='<tr><td rowspan="3">序号</td><td rowspan="3">设区市</td><td colspan="16">计划下达及完成情况</td>'
			+str1+'<td rowspan="3">备注</td></tr>'
			+'<td rowspan="1" colspan="2">'+min+'-'+max+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td><td rowspan="2">本年到位资金（万元）</td><td rowspan="2">累计到位资金（万元）</td><td rowspan="2">本年到位车购税（万元）</td><td rowspan="2">累计到位车购税（万元）</td><td rowspan="2">工程完成比例（规模）</td><td rowspan="2">'+max+'年目标任务里程（公里）</td><td rowspan="2">'+max+'年目标任务投资（万元）</td><td rowspan="2">'+max+'年目标任务已完成里程（公里）</td><td rowspan="2">目标任务完成比例（规模）</td><td rowspan="2">目标任务总投资完成比例</td>'
			+str2+'</tr>'
			+'<td>项目数量</td><td>计划里程（公里）</td>'
			+str3+'</tr>';
			biaotou.empty();
			biaotou.append(biaotstr);
			var tbody = $("#wqgzlist");
			tbody.empty();
			var data="gcglwqgz.tiaojian="+xmlx+"&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+$("#ybsj").datebox("getValue").substr(0,4)+"&gcglwqgz.ybyf="+$("#ybsj").datebox("getValue").substr(5,2)+"&gcglwqgz.xzqh="+xzqhstr+"&gcglwqgz.ybsj="+$("#ybsj").datebox("getValue");
			//alert(data);
			loadjzt();
			$.ajax({
				url:"/jxzhpt/gcybb/getXgjwchzb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					datalist=msg;
					disLoadjzt();
						for ( var x = 0; x < msg.length; x++) {
							var tr="";
							if(x==0){
								tr="<tr>";
								for ( var j = 0; j < ss.length; j++) {
									if(ss[j]=='v_0'){
										tr+="<td colspan='2'>"+msg[x][ss[j]]+"</td>";
										j++;
									}else{
										tr+="<td>"+msg[x][ss[j]]+"</td>";
									}
								}
								tr+="</tr>";
							}else{
								var tr="<tr>";
								for ( var j = 0; j < ss.length; j++) {
									tr+="<td>"+msg[x][ss[j]]+"</td>";
								}
								tr+="</tr>";
							}
							tbody.append(tr);
						}
						
				}
			});
		}
		
	function exportWqgzyb(){
		var xmnf=$("#jhxdnf").combobox("getValues");
		if(xmnf.join(",").substr(0,1)==',')
		xmnf=xmnf.join(",").substr(1,xmnf.join(",").length).split(',');
		xmnf.sort(function (x,y) {
            return y-x;
        });
		var xmlx=$("#xmlx").combobox("getValue");
		if(xmnf==''){
			alert("请选择年份");
			return;
		}
		var xzqhdm=$("#xzqh").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0];
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var data="flag=flag&gcglwqgz.tiaojian="+xmlx+"&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+$("#ybsj").datebox("getValue").substr(0,4)+"&gcglwqgz.ybyf="+$("#ybsj").datebox("getValue").substr(5,2)+"&gcglwqgz.xzqh="+xzqhstr+"&gcglwqgz.ybsj="+$("#ybsj").datebox("getValue");
		window.location.href="/jxzhpt/gcybb/getXgjwchzb.do?"+data;
	}	
	
	var datalist;
	function ghbb(){
		if(datalist==null){
			alert("当前尚无查询结果，不能固化版本");
			return;
		}
		YMLib.Var.formname='xgjwchzb';
		YMLib.UI.createWindow('lxxx','将查询结果固化为版本','ghbbxz.jsp','lxxx',400,400);
	}
	function ghbbcx(){
		
		YMLib.Var.formname='xgjwchzb';
		YMLib.UI.createWindow('lxxx','固化版本查询','ghbbcx.jsp','lxxx',400,400);
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
	color:#292929;
}
#kdtb thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid #cde0f3;
  	padding:3px 7px 2px 7px;
  	color:#292929;
}
#kdtb tbody tr td {
	text-align:center; 	
	font-size:1em;
/* 	font-weight:bold; */
  	border:1px solid #cde0f3;
  	padding:3px 7px 2px 7px;
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
	<div style="text-align: left; font-size: 12px; margin: 0px;" >
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;height:100%;" cellspacing="0" cellpadding="0" >
			<tr>
			<div id="righttop"  >
						<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;<span id="astext">生成报表</span>>&nbsp;<span id="bstext"></span>&nbsp;普通干线公路新改建工程项目完成情况汇总表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
								<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
        						<td align="right">下达年份：</td>
        						<td><input type="text" id="jhxdnf"  style="width:80px;"></td>
        						<td align="right">项目类型：</td>
        						<td><input type='text' id="xmlx" style="width:80px;">
        							</td>
        						<!-- <td align="right">截至进展年份：</td>
        						<td><input type="text" id="ybnf"  style="width:80px;"></td>
        						<td align="right">截至进展月份：</td>
        						<td><input type="text" id="ybyf"  style="width:80px;">	</td> -->
        						
        						<td align="right">月报时间：</td>
        						<td><input id="ybsj" type="text"  style="width: 103px" class='easyui-datebox'  ></td>
        						</tr>
        						<tr>
        						<td colspan="10">
       							<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()" />
								 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align: -50%;" />
        						<img id='ghbb' alt="固化版本" src="${pageContext.request.contextPath}/images/Button/ghbb1.png" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/ghbb2.png'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/ghbb1.png' " onclick="ghbb()" style="vertical-align: -50%;" />
        						<img alt="固化版本查询" src="${pageContext.request.contextPath}/images/Button/ghbbcx1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/ghbbcx2.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/ghbbcx1.gif' " onclick="ghbbcx()" style="vertical-align: -50%;" />
        						
        				
        				</td>	
        				
        				
        				</tr></table>
        					      					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:430px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-126)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id="kdtb" width="6000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">普通干线公路新改建工程项目完成情况汇总表</caption>
								<thead id="biaotou">
									<!-- <tr>
										<td rowspan="3" style="width: 100px;">序号</td>
										<td rowspan="3" style="width: 125px;">设区市</td>
										<td rowspan="3" style="width: 125px;">项目类型</td>
										<td colspan="6">计划下达及完成情况</td>
										<td colspan="6">计划下达及完成情况</td>
										<td colspan="6">计划下达及完成情况</td>
										<td colspan="6">计划下达及完成情况</td>
										<td colspan="6">计划下达及完成情况</td>
										<td rowspan="3" style="width: 125px;">备注</td>
										</tr>
									<tr>
										<td rowspan="1" colspan="3">2011-2014年度</td>
										<td rowspan="2">本年完成里程（公里）</td>
										<td rowspan="2">累计完成里程（公里）</td>
										<td rowspan="2">本年完成投资（万元）</td>
										<td rowspan="1" colspan="3">2011年度</td>
										<td rowspan="2">本年完成里程（公里）</td>
										<td rowspan="2">累计完成里程（公里）</td>
										<td rowspan="2">本年完成投资（万元）</td>
										<td rowspan="1" colspan="3">2012年度</td>
										<td rowspan="2">本年完成里程（公里）</td>
										<td rowspan="2">累计完成里程（公里）</td>
										<td rowspan="2">本年完成投资（万元）</td>
										<td rowspan="1" colspan="3">2013年度</td>
										<td rowspan="2">本年完成里程（公里）</td>
										<td rowspan="2">累计完成里程（公里）</td>
										<td rowspan="2">本年完成投资（万元）</td>
										<td rowspan="1" colspan="3">2014年度</td>
										<td rowspan="2">本年完成里程（公里）</td>
										<td rowspan="2">累计完成里程（公里）</td>
										<td rowspan="2">本年完成投资（万元）</td>
									</tr>
									<tr>
										<td>项目数量</td>
										<td>建设里程（公里）</td>
										<td>中央或省统筹资金（万元）含续建</td>
										<td>项目数量</td>
										<td>建设里程（公里）</td>
										<td>中央或省统筹资金（万元）含续建</td>
										<td>项目数量</td>
										<td>建设里程（公里）</td>
										<td>中央或省统筹资金（万元）含续建</td>
										<td>项目数量</td>
										<td>建设里程（公里）</td>
										<td>中央或省统筹资金（万元）含续建</td>
										<td>项目数量</td>
										<td>建设里程（公里）</td>
										<td>中央或省统筹资金（万元）含续建</td>
									</tr> -->
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