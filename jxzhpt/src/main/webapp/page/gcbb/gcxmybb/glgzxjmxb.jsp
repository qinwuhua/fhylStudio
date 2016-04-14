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
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
	function ybnf(id){
		var myDate = new Date();
		
		var years=[];
		var first;
		for(var i=myDate.getFullYear();i>=2005;i--){
			years.push({text:(i),value:(i)});
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text'
		});
			first=myDate.getFullYear();
		$('#'+id).combobox("setValue",+first);
	}
	function ybyf(id){
		var myDate = new Date();
		var years=[];
		var first;
		for(var i=1;i<=12;i++){
			years.push({text:(i),value:(i)});
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text'
		});		
			first=myDate.getMonth()+1;

		$('#'+id).combobox("setValue",+first);
	}
		$(function(){
			ybnf('ybnf');
			ybyf('ybyf');
			//setjhxdnf();
			var urlid=getUrlParame('id');
			urlxmnf("jhxdnf",urlid);
			loadUnit("gydw",$.cookie("unit"));
			loadDist("xzqh",$.cookie("dist"));
		//	loadBmbm2("xmlx","项目类型2");
			$("#xmlx").combobox("setValue",'升级改造');
			
			//$("#jhxdnf").combotree("setValues",arr);
			showAll();
		});
		function setjhxdnf(){
			/* $("#jhxdnf").combotree({    
				checkbox: true,
			    url: '/jxzhpt/xmjzbb/setjhxdnf1.do',    
			    required: false,
			    multiple:true
			}); */
			var id='jhxdnf';
			var myDate = new Date();
			var years=[];
			var first;
			years.push({text:'全部',value:''});
			for(var i=0;i<=10;i++){
				if(i==0)
					first=myDate.getFullYear()-i;
				years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
			}
			$('#'+id).combobox({
			    data:years,
			    valueField:'value',
			    textField:'text',
			    multiple:true,
			    formatter:function(row){
					var opts = $(this).combobox('options');
					return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.value);
							$('#id'+item.value).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#id'+record.value).attr('checked', true);
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
								$('#id'+item.value).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#id'+item.value).attr('checked', false);
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
			var xmlx=$("#xmlx").combobox("getText");
			if(xmnf==''){
				alert("请选择年份");
				return;
			}
			var biaotou = $("#biaotou");
			var str1='';
			var str2='';
			var str3='';
			var min=xmnf[xmnf.length-1];
			var max=xmnf[0];
			var len=(xmnf.length+1)*1000+"px";
			$("#kdtb").attr('width',len);
			for(var i=xmnf.length-1;i>=0;i--){
				str1=str1+'<td colspan="10">计划下达及完成情况</td>';
				str2=str2+'<td rowspan="1" colspan="4">'+xmnf[i]+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年车购税到位（万元）</td><td rowspan="2">累计车购税到位（万元）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td>';
				str3=str3+'<td>项目数量</td><td>建设里程（公里）</td><td>中央或省统筹资金（万元）含续建</td><td>计划总投资</td>';
			}
			biaotstr='<tr><td rowspan="3">序号</td><td rowspan="3">设区市</td><td rowspan="3">项目类型</td><td colspan="10">计划下达及完成情况</td>'
			+str1+'<td rowspan="3">备注</td></tr>'
			+'<td rowspan="1" colspan="4">'+min+'-'+max+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年车购税到位（万元）</td><td rowspan="2">累计车购税到位（万元）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td>'
			+str2+'</tr>'
			+'<td>项目数量</td><td>建设里程（公里）</td><td>中央或省统筹资金（万元）含续建</td><td>计划总投资</td>'
			+str3+'</tr>';
			biaotou.empty();
			biaotou.append(biaotstr);
			var tbody = $("#wqgzlist");
			tbody.empty();
			var data="gcglwqgz.tiaojian="+xmlx+"&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+$("#ybnf").combobox('getValue')+"&gcglwqgz.ybyf="+$("#ybyf").combobox('getValue');
			//alert(data);
			$.ajax({
				url:"/jxzhpt/gcybb/getGjxjmxb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					
					var tbodystr="";
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							if(i==0){
										var strs="";
										for(var j=xmnf.length-1;j>=0;j--){
											var s1="XMSL"+xmnf[j];
											var s2="XMLC"+xmnf[j];
											var s3="BBZORSBZ"+xmnf[j];
											var s4="WCLC"+xmnf[j];
											var s5="LJWCLC"+xmnf[j];
											var s6="BBZ"+xmnf[j];
											var s7="PFZTZ"+xmnf[j];
											var s8="LJWCBBZ"+xmnf[j];
											var s9="WCXMZJ"+xmnf[j];
											var s10="LJWCZJ"+xmnf[j];
											strs=strs+msg[i][s1]+"</td><td>"+msg[i][s2].toFixed(2)+"</td><td>"
											+msg[i][s3].toFixed(2)+"</td><td>"+msg[i][s7].toFixed(2)+"</td><td>"+msg[i][s4].toFixed(2)+"</td><td>"
											+msg[i][s5].toFixed(2)+"</td><td>"+msg[i][s6].toFixed(2)+"</td><td>"
											+msg[i][s8].toFixed(2)+"</td><td>"
											+msg[i][s9].toFixed(2)+"</td><td>"+msg[i][s10].toFixed(2)+"</td><td>";
										}
										tbodystr=tbodystr+"<tr><td colspan='2'>"+msg[i].XZQHMC+"</td><td>"
										+$("#xmlx").combobox("getText")+"</td><td>"
										+msg[i].XMSL+"</td><td>"+msg[i].XMLC.toFixed(2)+"</td><td>"
										+msg[i].BBZORSBZ.toFixed(2)+"</td><td>"+msg[i].PFZTZ.toFixed(2)+"</td><td>"+msg[i].WCLC.toFixed(2)+"</td><td>"
										+msg[i].LJWCLC.toFixed(2)+"</td><td>"+msg[i].BBZ.toFixed(2)+"</td><td>"
										+msg[i].LJWCBBZ.toFixed(2)+"</td><td>"+msg[i].WCXMZJ.toFixed(2)+"</td><td>"
										+msg[i].LJWCZJ.toFixed(2)+"</td><td>"
										+strs+"</tr>";
							}else{
								var strs="";
								for(var j=xmnf.length-1;j>=0;j--){
									var s1="XMSL"+xmnf[j];
									var s2="XMLC"+xmnf[j];
									var s3="BBZORSBZ"+xmnf[j];
									var s4="WCLC"+xmnf[j];
									var s5="LJWCLC"+xmnf[j];
									var s6="BBZ"+xmnf[j];
									var s7="PFZTZ"+xmnf[j];
									var s8="LJWCBBZ"+xmnf[j];
									var s9="WCXMZJ"+xmnf[j];
									var s10="LJWCZJ"+xmnf[j];
									strs=strs+msg[i][s1]+"</td><td>"+msg[i][s2].toFixed(2)+"</td><td>"
									+msg[i][s3].toFixed(2)+"</td><td>"+msg[i][s7].toFixed(2)+"</td><td>"+msg[i][s4].toFixed(2)+"</td><td>"
									+msg[i][s5].toFixed(2)+"</td><td>"+msg[i][s6].toFixed(2)+"</td><td>"
									+msg[i][s8].toFixed(2)+"</td><td>"
									+msg[i][s9].toFixed(2)+"</td><td>"+msg[i][s10].toFixed(2)+"</td><td>";
								}
								tbodystr=tbodystr+"<tr><td>"+msg[i].XH+"</td><td>"+msg[i].XZQHMC+"</td><td>"
								+$("#xmlx").combobox("getText")+"</td><td>"
								+msg[i].XMSL+"</td><td>"+msg[i].XMLC.toFixed(2)+"</td><td>"
								+msg[i].BBZORSBZ.toFixed(2)+"</td><td>"+msg[i].PFZTZ.toFixed(2)+"</td><td>"+msg[i].WCLC.toFixed(2)+"</td><td>"
								+msg[i].LJWCLC.toFixed(2)+"</td><td>"+msg[i].BBZ.toFixed(2)+"</td><td>"
								+msg[i].LJWCBBZ.toFixed(2)+"</td><td>"+msg[i].WCXMZJ.toFixed(2)+"</td><td>"
								+msg[i].LJWCZJ.toFixed(2)+"</td><td>"
								+strs+"</tr>";
							}
						}
						tbody.append(tbodystr);
					}
				}
			});
		}
	function exportWqgzyb(){
		var xmnf=$("#jhxdnf").combobox("getValues");
		if(xmnf.join(",").substr(0,1)==',')
		xmnf=xmnf.join(",").substr(1,xmnf.join(",").length).split(',');
		var xmlx=$("#xmlx").combobox("getText");
		if(xmnf==''){
			alert("请选择年份");
			return;
		}
		var data="flag=flag&gcglwqgz.tiaojian="+xmlx+"&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+$("#ybnf").combobox('getValue')+"&gcglwqgz.ybyf="+$("#ybyf").combobox('getValue');
		window.location.href="/jxzhpt/gcybb/getGjxjmxb.do?"+data;
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
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;公路改造工程新上、续建工程项目完成情况汇总表</div>
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
        						<span>下达年份：</span>
        						<input type="text" id="jhxdnf"  style="width:80px;">
        						<span>项目类型：</span>
        						<select id="xmlx" style="width:80px;" class='easyui-combobox'>
        							<option value="升级改造">升级改造</option>
        							<option value="路面改造">路面改造</option>
        							<option value="灾毁重建">灾毁重建</option>
        						</select>
        						<span>截至进展年份：</span>
        						<input type="text" id="ybnf"  style="width:80px;">
        						<span>截至进展月份：</span>
        						<input type="text" id="ybyf"  style="width:80px;">	
        						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       							<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()" />
								 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align: -50%;" />
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">

        						
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
								<caption align="top" style="font-size:x-large;font-weight: bolder;">公路改造工程新上、续建工程项目完成情况明细表</caption>
								<thead id="biaotou">
									<tr>
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