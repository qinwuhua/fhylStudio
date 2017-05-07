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
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script> --%>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script> --%>
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
		setjhxdnf("ddlYear1");
		setjhxdnf1("jhnd");
		loadUnit1("gydw",$.cookie("unit"));
		loadDist1("xzqh",$.cookie("dist"));
		//loadBmbm3("xzdj","行政等级");
		loadBmbm3('yjsdj','技术等级');
		loadBmbm3('jsjsdj','技术等级');
		//loadBmbm3('jzzt','进展状态');
		xzdjdx('xzdj');
		xmjzzt("jzzt");
		bbxmlx('gljslx');
		setbnjhtz('bnjhtz');
		setbndsslc('bndsslc');
		//loadBmbm3('gljslx','项目类型2');
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1; 
		for(var x=y;x>=2010;x--){
			$("#ddlYear").append("<option value="+x+">"+x+"</option>");
			//$("#ddlYear1").append("<option value="+x+">"+x+"</option>");
		}
		$("#yf"+m).attr("selected","selected");
		//var urlid=getUrlParame('id');
		
		//urlxmnf("ddlYear1",urlid);
		
		//showAll();
		
		$("#biaotou").empty();
	});
	
	
	var str1="";var str2="";var datalist;
	
	function dcExcel(){
		if(str1==""||str2==""){
			alert("请您先查询报表数据");
			return;
		}
		
		var json_data = JSON.stringify(datalist); 
		
		var data="flag=1&excel_list.ssbb=gljsjhhzb";
		loadjzt();
		 $.post('/jxzhpt/gcbb/exportbbsj_set.do',{nameValue:str1,colValue:str2,sql:json_data},function(){
			window.location.href='/jxzhpt/gcybb/getGljsjhhzb.do?'+data;
		 }); 
		 setTimeout('disLoadjzt()',4000);
	}
	function wcmxb(){
		YMLib.Var.flag='';
		YMLib.UI.createWindow('zdybb','江西省“十三五”国省干线公路建设和养护计划汇总表字段选择','gljsjhhzb_zd.jsp','zdybb','650','380');
	}

	
	function showBb(ss){
		
		var tbody = $("#abgclist");
				tbody.empty();

		loadjzt();
		
		$.ajax({
			url:"/jxzhpt/gcybb/getGljsjhhzb.do",
			data:'flag=0',
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalist=msg;
				disLoadjzt();
				if (msg != null) {
					var l = new Array();
					var a=0;var b=msg[0].v_0; var c=0;
					for ( var i = 0; i < msg.length; i++) {
						if(msg[i].v_0!=b){
							b=msg[i].v_0;
							l[a]=c;
							a++;
							c=1;
						}else{
							c++;
						}
					}
					l[a]=c;
					var d="";var e=0;
					for ( var i = 0; i < msg.length; i++) {
						var tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							//alert(msg[i][ss[j]]+"    "+ss[j]);
							if(ss[0]=='v_0'){
								if(d!=msg[i].v_0){
									tr+="<td rowspan='"+l[e]+"'>"+msg[i][ss[j]]+"</td>";
									d=msg[i].v_0;
									e++;
								}
								else{
									if(ss[j]!='v_0')
									tr+="<td>"+msg[i][ss[j]]+"</td>";
								}
							}else{
								tr+="<td>"+msg[i][ss[j]]+"</td>";
							}
							
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
						<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;生成报表>&nbsp;月报表>&nbsp;江西省“十三五”国省干线公路建设和养护计划汇总表</div>
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
        							<td >
        						<img onclick="wcmxb()" alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
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
                	<div id="gddiv" style="width:100%;height: 450px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-100)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="1000px">
								<caption align="top" style="font-size:x-large;font-weight: bolder;"> 江西省“十三五”国省干线公路建设和养护计划汇总表</caption>
								<tbody id='biaotou'>
									
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
