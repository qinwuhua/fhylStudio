<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>车购税资金到位情况</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_yhdzx.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){ 
			xmnf('nian');
			selectpqi();
		});
		function selectpqi(){
			var data1=parent.object;
			var lxbm="";
			var qdzh="";
			var zdzh="";
			for(var i=0;i<data1.length;i++){
				if(i==0){
					lxbm=lxbm+"'"+data1[i].lxbm.substr(0,4)+"'";
					qdzh=qdzh+data1[i].qdzh;
					zdzh=zdzh+data1[i].zdzh;
				}
				else{
					lxbm=lxbm+","+"'"+data1[i].lxbm.substr(0,4)+"'";
					qdzh=qdzh+","+data1[i].qdzh;
					zdzh=zdzh+","+data1[i].zdzh;
				}
			}
			var data="lkmxb.lxbh="+lxbm+"&lkmxb.qdzh="+qdzh+"&lkmxb.zdzh="+zdzh+"&lkmxb.tbnf="+$("#nian").combobox("getValue")+"年";
			//alert(data);
			$.ajax({
				url:"/jxzhpt/wjxt/getPqiList.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					var tbody = $("#pqilist");
					tbody.empty();
					if (msg != null) {
						for ( var i = 0; i < msg.length; i++) {
							tbody.append( "<tr style='background-color: #FFFFFF; height: 15px;'><td align='center'>"
									+ msg[i].lxbh + "</td><td align='center'>"
									+ msg[i].lxmc + "</td><td align='center'>"
									+ msg[i].qdzh + "</td><td align='center'>"
									+ msg[i].zdzh + "</td><td align='center'>"
									+ msg[i].qjfx + "</td><td align='center'>"
									+ msg[i].pdlc + "</td><td align='center'>"
									+ msg[i].mqi + "</td><td align='center'>"
									+ msg[i].pqi + "</td><td align='center'>"
									+ msg[i].sci + "</td><td align='center'>"
									+ msg[i].bci + "</td><td align='center'>"
									+ msg[i].tci + "</td><td align='center'>"
									+ msg[i].ydl + "</td><td align='center'>"
									+ msg[i].ldl + "</td><td align='center'>"
									+ msg[i].zdl + "</td><td align='center'>"
									+ msg[i].cdl + "</td><td align='center'>"
									+ msg[i].cadl + "</td><td align='center'>"								
									+ msg[i].yllv + " </td></tr>");
						}
					}
				}
			});
			
			
		};
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
-->
</style>
</head>
<body>
	<div style="margin-left: 15px;">
		<span style="font-size: small;">
		年份：
		</span>
		<select id="nian">
			<option>2015</option>
			<option>2014</option>
			<option>2013</option>
		</select>
		<img onclick="selectpqi()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
	</div>
		<table align="center" style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #404040; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
                                    <tr style="background-color: #CCCCCC; height: 12px;">
                                        <td align="center"rowspan="2" style="width: 130px;">
                                            路线编码
                                        </td>
                                        <td align="center"rowspan="2" style="width: 150px;">
                                            路线名称
                                        </td>
                                        <td align="center"rowspan="2" style="width: 90px;">
                                            起点桩号
                                        </td>
                                        <td align="center"rowspan="2" style="width: 90px;">
                                            止点桩号
                                        </td>
                                        <td align="center"rowspan="2" style="width: 90px;">
                                            前进方向
                                        </td>
                                        <td align="center"rowspan="2" style="width: 90px;">
                                            评定历程<br />
                                            （公里）
                                        </td>
                                        <td align="center"colspan="5" style="width: 300px;">
                                            评定结果
                                        </td>
                                        <td align="center"colspan="5" style="width: 300px;">
                                            评级里程
                                        </td>
                                        <td align="center"rowspan="2" style="width: 60px;">
                                            优良路率<br />
                                            (%)
                                        </td>
                                    </tr>
                                    <tr style="background-color: #CCCCCC; height: 12px;">
                                        <td align="center"style="width: 60px;">
                                            MQI
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            PQI
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            SCI
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            BCI
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            TCI
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            优等路
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            良等路
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            中等路
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            次等路
                                        </td>
                                        <td align="center"style="width: 60px;">
                                            差等路
                                        </td>
                                    </tr>
                                    <tr style="background-color: #CCCCCC; height: 15px;">
                                        <td align="center">
                                            1
                                        </td>
                                        <td align="center">
                                            2
                                        </td>
                                        <td align="center">
                                            3
                                        </td>
                                        <td align="center">
                                            4
                                        </td>
                                        <td align="center">
                                            5
                                        </td>
                                        <td align="center">
                                            6
                                        </td>
                                        <td align="center">
                                            7
                                        </td>
                                        <td align="center">
                                            8
                                        </td>
                                        <td align="center">
                                            9
                                        </td>
                                        <td align="center">
                                            10
                                        </td>
                                        <td align="center">
                                            11
                                        </td>
                                        <td align="center">
                                            12
                                        </td>
                                        <td align="center">
                                            13
                                        </td>
                                        <td align="center">
                                            14
                                        </td>
                                        <td align="center">
                                            15
                                        </td>
                                        <td align="center">
                                            16
                                        </td>
                                        <td align="center">
                                            17
                                        </td>
                                    </tr>
						<tbody id="pqilist" >
						
						</tbody>
		</table>
<!-- 		<table  width="100%" border="0" -->
<!-- 			style="vertical-align:bottom ;border-style: solid; border-width: 0px 0px 0px 0px; margin-top: 8px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" -->
<!-- 			cellspacing="0" cellpadding="0"> -->
<!-- 			<tr style="height: 30px;"> -->
<!-- 				<td align="center"> -->
<!-- 					<table> -->
<!-- 						<tr> -->
<!-- 							<td> -->
<%-- 									<img onclick="closes('pqi')" src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" alt="返回" --%>
<%-- 									onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" --%>
<%-- 									onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" --%>
<!-- 									style="border: 0" /> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
		</body>
</html>