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
	
		
		
		$("#biaotou").empty();
	});
	
	
	var str1="";var str2="";var datalist;
	
	function dcExcel(){
		if(str1==""||str2==""){
			alert("请您先查询报表数据");
			return;
		}
		
		var json_data = JSON.stringify(datalist); 
		
		var ss=str2.split(',');
		
		var ss1=new Array();
		var ss2=new Array();
		
		for(var i=0;i<ss.length;i++){
			ss1.push(parseInt(ss[i].substring(ss[i].indexOf('v_')+2,ss[i].length)));
			
		}
		bubbleSort(ss1);
		for(var i=0;i<ss1.length;i++){
			ss2.push("v_"+ss1[i]);
		}
		
		
		var data="flag=1&excel_list.ssbb=gljsjhhzb";
		loadjzt();
		 $.post('/jxzhpt/gcbb/exportbbsj_set.do',{nameValue:str1,colValue:ss2.join(','),sql:json_data},function(){
			window.location.href='/jxzhpt/gcybb/getGljsjhhzb.do?'+data;
		 }); 
		 setTimeout('disLoadjzt()',4000);
	}
	function wcmxb(){
		YMLib.Var.flag='';
		YMLib.UI.createWindow('zdybb','江西省“十三五”国省干线公路建设和养护计划汇总表字段选择','gljsjhhzb_zd.jsp','zdybb','650','380');
	}

	function bubbleSort(array){
	    /*给每个未确定的位置做循环*/
	    for(var unfix=array.length-1; unfix>0; unfix--){
	      /*给进度做个记录，比到未确定位置*/
	      for(var i=0; i<unfix;i++){
	        if(array[i]>array[i+1]){
	          var temp = array[i];
	          array.splice(i,1,array[i+1]);
	          array.splice(i+1,1,temp);
	        }
	      }
	    }
	  }
	function showBb(ss){
		
		var tbody = $("#abgclist");
				tbody.empty();

		loadjzt();
		var ss1=new Array();
		var ss2=new Array();
		
		for(var i=0;i<ss.length;i++){
			ss1.push(parseInt(ss[i].substring(ss[i].indexOf('v_')+2,ss[i].length)));
			
		}
		bubbleSort(ss1);
		for(var i=0;i<ss1.length;i++){
			ss2.push("v_"+ss1[i]);
		}
		
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
						for ( var j = 0; j < ss2.length; j++) {
							//alert(msg[i][ss[j]]+"    "+ss[j]);
							if(ss[0]=='v_0'){
								if(d!=msg[i].v_0){
									tr+="<td rowspan='"+l[e]+"'>"+msg[i][ss2[j]]+"</td>";
									d=msg[i].v_0;
									e++;
								}
								else{
									if(ss2[j]!='v_0')
									tr+="<td>"+msg[i][ss2[j]]+"</td>";
								}
							}else{
								tr+="<td>"+msg[i][ss2[j]]+"</td>";
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
