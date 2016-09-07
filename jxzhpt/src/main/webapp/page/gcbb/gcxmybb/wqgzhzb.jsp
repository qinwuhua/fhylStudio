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
			kjfldx('akjfl');
			xzdjdx('xzdj');
			ybnf('ybnf');
			ybyf('ybyf');
			setjhxdnf();
			loadUnit("gydw",$.cookie("unit"));
			loadDist("xzqh",$.cookie("dist"));

			showAll();
		});
		function setjhxdnf(){
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
			var xmnf=$("#jhxdnf").combotree("getValues");
			if(xmnf.join(",").substr(0,1)==',')
				xmnf=xmnf.join(",").substr(1,xmnf.join(",").length).split(',');
			if(xmnf==''){
				alert("请选择年份");
				return;
			}
			var akjfl=$("#akjfl").combotree("getValues");
			if(akjfl.join(",").substr(0,1)==',')
				akjfl=akjfl.join(",").substr(1,akjfl.join(",").length).split(',');
			var xzdj=$("#xzdj").combotree("getValues");
			if(xzdj.join(",").substr(0,1)==',')
				xzdj=xzdj.join(",").substr(1,xzdj.join(",").length).split(',');
			
			
			var biaotou = $("#biaotou");
			var str1='';
			var str2='';
			var str3='';
			var min=xmnf[xmnf.length-1];
			var max=xmnf[0];
			var len=(xmnf.length+1)*700+"px";
			$("#kdtb").attr('width',len);
			for(var i=xmnf.length-1;i>=0;i--){
				str1=str1+'<td colspan="11">'+xmnf[i]+'年度</td>';
				str2=str2+'<td colspan="2">计划项目</td><td colspan="2">完工项目</td><td colspan="2">在建项目</td><td colspan="2">未开工项目</td><td rowspan="2">完成投资(万元)</td><td rowspan="2">本年完成投资(万元)</td><td rowspan="2">完成率(%)</td>';
				str3=str3+'<td>座</td><td>延米</td><td>座</td><td>延米</td><td>座</td><td>延米</td><td>座</td><td>延米</td>';
			}
			biaotstr='<tr><td rowspan="3">设区市交通局</td><td colspan="11">合计</td>'
			+str1+'</tr>'
			+'<td rowspan="1" colspan="2">计划项目</td><td colspan="2">完工项目</td><td colspan="2">在建项目</td><td colspan="2">未开工项目</td><td rowspan="2">完成投资(万元)</td><td rowspan="2">本年完成投资(万元)</td><td rowspan="2">完成率(%)</td>'
			+str2+'</tr>'
			+'<td>座</td><td>延米</td><td>座</td><td>延米</td><td>座</td><td>延米</td><td>座</td><td>延米</td>'
			+str3+'</tr>';
			biaotou.empty();
			biaotou.append(biaotstr);
			var tbody = $("#wqgzlist");
			tbody.empty();
			var data="gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+$("#ybnf").combobox('getValue')+"&gcglwqgz.ybyf="+$("#ybyf").combobox('getValue')+"&gcglwqgz.akjfl="+akjfl+"&gcglwqgz.xzdj="+xzdj;
			//alert(data);
			$.ajax({
				url:"/jxzhpt/gcybb/getWqgzhzb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					var tbodystr="";
						for ( var i = 0; i < msg.length; i++) {
										var strs="";
										for(var j=xmnf.length-1;j>=0;j--){
											var s1="XMSL"+xmnf[j];
											var s2="YM"+xmnf[j];
											var s3="WCXMSL"+xmnf[j];
											var s4="WCYM"+xmnf[j];
											var s5="ZJXMSL"+xmnf[j];
											var s6="ZJYM"+xmnf[j];
											var s7="WKXMSL"+xmnf[j];
											var s8="WKYM"+xmnf[j];
											var s9="WC"+xmnf[j];
											var s10="BNWC"+xmnf[j];
											var s11="WCL"+xmnf[j];
											if(j==0)
												strs=strs+msg[i][s1]+"</td><td>"+msg[i][s2].toFixed(2)+"</td><td>"
												+msg[i][s3]+"</td><td>"+msg[i][s4].toFixed(2)+"</td><td>"
												+msg[i][s5]+"</td><td>"+msg[i][s6].toFixed(2)+"</td><td>"
												+msg[i][s7]+"</td><td>"+msg[i][s8].toFixed(2)+"</td><td>"
												+msg[i][s9].toFixed(2)+"</td><td>"+msg[i][s10].toFixed(2)+"</td><td>"
												+msg[i][s11]+"</td>";
											else
											strs=strs+msg[i][s1]+"</td><td>"+msg[i][s2].toFixed(2)+"</td><td>"
											+msg[i][s3]+"</td><td>"+msg[i][s4].toFixed(2)+"</td><td>"
											+msg[i][s5]+"</td><td>"+msg[i][s6].toFixed(2)+"</td><td>"
											+msg[i][s7]+"</td><td>"+msg[i][s8].toFixed(2)+"</td><td>"
											+msg[i][s9].toFixed(2)+"</td><td>"+msg[i][s10].toFixed(2)+"</td><td>"
											+msg[i][s11]+"</td><td>";
										}
										tbodystr=tbodystr+"<tr><td>"+msg[i].XZQHMC+"</td><td>"
										+msg[i].XMSL+"</td><td>"+msg[i].YM.toFixed(2)+"</td><td>"
										+msg[i].WCXMSL+"</td><td>"+msg[i].WCYM.toFixed(2)+"</td><td>"
										+msg[i].ZJXMSL+"</td><td>"+msg[i].ZJYM.toFixed(2)+"</td><td>"
										+msg[i].WKXMSL+"</td><td>"+msg[i].WKYM.toFixed(2)+"</td><td>"
										+msg[i].WC.toFixed(2)+"</td><td>"+msg[i].BNWC.toFixed(2)+"</td><td>"
										+msg[i].WCL+"</td><td>"+strs+"</tr>";
						
					}
						tbody.append(tbodystr);
				}
			});
		}
	function exportWqgzyb(){
		var xmnf=$("#jhxdnf").combotree("getValues");
		if(xmnf.join(",").substr(0,1)==',')
			xmnf=xmnf.join(",").substr(1,xmnf.join(",").length).split(',');
		//var xmlx=$("#xmlx").combobox("getValue");
		if(xmnf==''){
			alert("请选择年份");
			return;
		}
		var data="flag=flag&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+$("#ybnf").combobox('getValue')+"&gcglwqgz.ybyf="+$("#ybyf").combobox('getValue');
		window.location.href="/jxzhpt/gcybb/getWqgzhzb.do?"+data;
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
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;全省危桥改造项目汇总表</div>
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
								<span>截至进展年份：</span>
        						<input type="text" id="ybnf"  style="width:80px;">
        						<span>截至进展月份：</span>
        						<input type="text" id="ybyf"  style="width:80px;">
        						<span>按跨径分类</span>	
        						<input type="text" id="akjfl"  style="width:80px;">
        						<span>行政等级</span>	
        						<input type="text" id="xzdj"  style="width:80px;">
        						
        						
       							<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll()" />
								 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align: middle;" />
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
							<table id="kdtb" width="2000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">全省危桥改造项目汇总表</caption>
								<thead id="biaotou">
									<tr>
										<td rowspan="3" style="width: 100px;">设区市交通局</td>
										<td rowspan="3" style="width: 125px;">合计</td>
										<td colspan="7">2011年度</td>
										<td colspan="7">2012年度</td>
										<td colspan="7">2013年度</td>
										<td colspan="7">2014年度</td>
										</tr>
									<tr>
										<td rowspan="1" colspan="2">计划项目</td>
										<td rowspan="1" colspan="2">完工项目</td>
										<td rowspan="1" >完成投资(万元)</td>
										<td rowspan="1" >本年完成投资(万元)</td>
										<td rowspan="1" >完成率(%)</td>
										<td rowspan="1" colspan="2">计划项目</td>
										<td rowspan="1" colspan="2">完工项目</td>
										<td rowspan="1" >完成投资(万元)</td>
										<td rowspan="1" >本年完成投资(万元)</td>
										<td rowspan="1" >完成率(%)</td>
										<td rowspan="1" colspan="2">计划项目</td>
										<td rowspan="1" colspan="2">完工项目</td>
										<td rowspan="1" >完成投资(万元)</td>
										<td rowspan="1" >本年完成投资(万元)</td>
										<td rowspan="1" >完成率(%)</td>
										<td rowspan="1" colspan="2">计划项目</td>
										<td rowspan="1" colspan="2">完工项目</td>
										<td rowspan="1" >完成投资(万元)</td>
										<td rowspan="1" >本年完成投资(万元)</td>
										<td rowspan="1" >完成率(%)</td>
										<td rowspan="1" colspan="2">计划项目</td>
										<td rowspan="1" colspan="2">完工项目</td>
										<td rowspan="1" >完成投资(万元)</td>
										<td rowspan="1" >本年完成投资(万元)</td>
										<td rowspan="1" >完成率(%)</td>
									</tr>
									<tr>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
										<td>座</td>
										<td>延米</td>
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