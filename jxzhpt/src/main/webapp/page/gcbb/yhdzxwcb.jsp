<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>全省普通国省干线养护大中修工程完成情况表</title>
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
		#bbtable thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid #cde0f3;padding:3px 7px 2px 7px;}
		#bbtable tbody tr td {text-align:center;font-size:1em;border:1px solid #cde0f3;padding:3px 7px 2px 7px;}
		-->
	</style>
	<script type="text/javascript">
	$(function(){
		setjhxdnf1("jhnd");
		loadDist1("xzqh",$.cookie("dist"));
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1; 
		for(var x=y;x>=2010;x--){
			$("#ddlYear").append("<option value="+x+">"+x+"</option>");
		}
		$("#yf"+m).attr("selected","selected");
		//$("#biaotou").empty();
		
		var nf=$("#ddlYear").val();
		$(".nian").html(nf);
		showBb();
	});
	function setjhxdnf1(id){
		
		var years=[];
		//var first;
		years.push({text:'全部',value:''});
		var myvalues=new Array();
		
		for(var i=2011;i<=2020;i++){
			years.push({text:(i),value:(i)});
			myvalues.push(i);
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text',
		    multiple:true,
		    formatter:function(row){
				var opts = $(this).combobox('options');
				return '<input id="name'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
			},
			onSelect:function(record){
				var opts = $(this).combobox('options');
				if(record[opts.valueField]==""){
					var values =new Array();
					var datas = $('#' +id).combobox("getData");
					$.each(datas,function(index,item){
						values.push(item.value);
						$('#name'+id+item.value).attr('checked', true);
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$('#name'+id+record.value).attr('checked', true);
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
							$('#name'+id+item.value).attr('checked', false);
						}
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$.each(datas,function(index,item){
						$('#name'+id+item.value).attr('checked', false);
					});
				}
			}
		}); 
		for(var i=0;i<myvalues.length;i++){
			$('#name'+id+myvalues[i]).attr('checked', true);
		}
		$('#'+id).combobox("setValues",myvalues);
		
	}
	
	
	
	
	
	
	function dcExcel(){
		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val();
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
		
		var data="flag=1&nf="+nf+"&yf="+yf+"&xzqh="+xzqhstr
		+"&gcglabgc.jhnd="+$("#jhnd").combobox('getValues').join(',');
		loadjzt();
		 $.post('/jxzhpt/gcbb/exportbbsj_set.do',{xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/gcybb/getYhdzxwcb.do?'+data;
		 }); 
		 setTimeout('disLoadjzt()',4000);
	}

	function showBb(){
		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val();
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
		
		$(".nian").html(nf);
		var data="flag=0&nf="+nf+"&yf="+yf+"&xzqh="+xzqhstr
		+"&gcglabgc.jhnd="+$("#jhnd").combobox('getValues').join(',');
		var ssstr="v_0";
		for(var i=1;i<110;i++){
			ssstr+=",v_"+i;
		}
		var ss=ssstr.split(",");
		
		//alert(data);
		var tbody = $("#abgclist");
				tbody.empty();

		loadjzt();
		
		$.ajax({
			url:"/jxzhpt/gcybb/getYhdzxwcb.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalist=msg;
				disLoadjzt();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						var tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							tr+="<td>"+msg[i][ss[j]]+"</td>";
						}
						
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
						<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;生成报表>&nbsp;月报表>&nbsp;普通国省道建设养护全省普通国省干线养护大中修工程完成情况表</div>
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
        						<td align="right">计划年度：</td>
		        				<td><input id="jhnd" type="text"  style="width: 80px"></td>
        						<td align="right">截止年份：</td>
		 						<td><select name="ddlYear" id="ddlYear" style="width: 80px;">
								</select></td>
		 						<td align="right">截止月份：</td>
		 						<td><select name="ddlMonth" id="ddlMonth" style="width: 60px;">
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
								</select></td>
							</tr>
							
        					<tr height="32">
        							<td colspan="10">
        						<img onclick="showBb()" alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;"/>
								<img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="dcExcel()" style="vertical-align: -50%;" />
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
							<table id='bbtable' width="10000px">
								<caption align="top" style="font-size:x-large;font-weight: bolder;">全省普通国省干线养护大中修工程完成情况表</caption>
								<tbody id='biaotou'>
									<tr>
										<td rowspan="4"  style="width: 75px;">设区市公路局</td>
										<td colspan="109">养护大中修</td>
									</tr>
									
									<tr>
										<td colspan="12"><span class='nian'></span>年下达计划里程(公里)</td>
										<td colspan="12"><span class='nian'></span>年下达计划完成里程（公里）</td>
										<td colspan="12">累计完成里程（公里）</td>
										<td colspan="12">计划总投资（万元）</td>
										<td colspan="12">省级补助资金</td>
										<td colspan="12"><span class='nian'></span>年完成总投资（万元）</td>
										<td colspan="12">累计完成总投资（万元）</td>
										<td colspan="12"><span class='nian'></span>年完成省级补助资金</td>
										<td colspan="12">累计完成省级补助资金</td>
										<td rowspan="3"  style="width: 75px;">备注</td>
									</tr>
									
									<tr>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
										<td colspan="4" style="width: 100px;">国道</td>
										<td colspan="4" style="width: 100px;">省道</td>
										<td colspan="4" style="width: 100px;">农村公路</td>
									</tr>
									
									<tr>	
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">大修</td>
										<td style="width: 100px;">中修</td>
										<td style="width: 100px;">预防性养护</td>
										
									
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
