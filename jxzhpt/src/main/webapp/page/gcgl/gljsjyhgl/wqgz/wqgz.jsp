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
	<script type="text/javascript" src="js/wqgz.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#gydw').combotree({   
				url:"js/gydw.json"
			}); 
		});
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
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
	            <td height="25" align="left" background="${pageContext.request.contextPath}/images/dht_bg.jpg" style="padding-left: 25px; background-repeat: no-repeat; font-size: 12px;">
	                <a style="color: #1a5780" href="#">工程管理</a> &nbsp;>&nbsp;
	                <a style="color: #1a5780" href="#">项目进度管理</a>
	            	<font style="color: #5C5C5C;">&nbsp;>&nbsp;危桥改造施工过程管理</font>
	            </td>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:1000px; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold">项目信息：</font>
        				</legend>
        				<div>
        					<p>
        						<span>管养单位：</span>
        						<select id="gydw" style="width:200px;"></select>
        						<span>开工状态：</span>
        						<select id="sbnf" style="width: 65px;">
        							<option value="">全部</option>
        							<option value="已开工">已开工</option>
        							<option value="未开工">未开工</option>
        						</select>
        						<span>路线：</span>
        							<input type="text" id="lx" >
        						<span>桥梁：</span>
        							<input type="text" id="ql" >
        							&nbsp;&nbsp;&nbsp;&nbsp;
        							<span></span>
        						<input type="image" name="btnSelect" id="btnSelect" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" style="border-width:0px;cursor: hand;height: 22px;vertical-align: -40%;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td width="100%" style="padding-top: 10px;padding-left:10px;">
                    <div>
	<table cellspacing="0" rules="all" border="1" id="GrdAB" style="width:1300px;border-collapse:collapse;">
		<tr align="center" valign="middle" style="color:#33AECC;background-color:#EFF8FE;border-width:1px;border-style:Solid;height:40px;">
			<th scope="col" style="border-color:#CCEEFF;border-style:Solid;">定位</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">操作</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">管养单位</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">行政区划</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">桥梁编码</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">桥梁名称</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">桥梁中心桩号</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">桥梁全宽</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">桥梁全长</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">跨径总长</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">技术等级</th><th scope="col" style="border-color:#CCEEFF;border-style:Solid;">改建/修建年度</th>
		</tr>

			<tbody>
				<tr align="center" valign="middle" >
					<td style="height: 30px;width: 30px">
						<a href="#" onclick="dingwei()">
							<font color="#0066CB">定位</font>
						</a>
					</td>
					<td style="height:30px;width:220px;">
						<a href="#" onclick="wqxiangxi()">
							<font color="#0066CB">详细</font>
						</a>| 
						<a href="#" onclick="sfkaigong()">
							<font color="#0066CB">开工</font>
						</a>| 
						<a href="#" onclick="ybsb()">
							<font color="#0066CB">月报上报</font>
						</a>| 
						<a href="#" onclick="sfkaigong()">
							<font color="#0066CB">完工</font>
						</a>| 
						<a href="#" onclick="sfkaigong()">
							<font color="#0066CB">未完工</font>
						</a>
					</td>
					<td style="height:30px;width:200px;">
			           南昌市南昌县交通局
			 		</td>
			 		<td style="height:30px;width:100px;">
                                    南昌市南昌县
                      </td>
					<td style="height:30px;width:60px;">
                                    X024360121L0020
                   </td>
					<td style="height:30px;width:60px;">
                                    泾口大桥
                     </td>
					<td style="height:30px;width:60px;">
                                    39.059
                     </td>
					<td style="height:30px;width:60px;">
                                    7.2
                      </td>
                      <td style="height:30px;width:80px;">
                                    286m
                      </td>
					<td style="height:30px;width:80px;">
                                    250m
                      </td>
					<td style="height:30px;width:100px;">
                                    四级
                     </td>
					<td style="height:30px;width:90px;">
                                    1977
                     </td>
				</tr>
			</tbody>
			</table>
			<div id="AspNetPager1" dir="ltr" style="width:98%;text-align:left;">
			<div style="width:40%;float:left;">
					共1条 每页10条 当前第1页/1页
			</div>
			<div align="left" style="width:60%;float:left;">
			<a disabled="disabled" style="margin-right:5px;">首页</a><a disabled="disabled" style="margin-right:5px;">上一页</a><a href="javascript:__doPostBack('AspNetPager1','2')" style="margin-right:5px;">下一页</a><a href="javascript:__doPostBack('AspNetPager1','28')" style="margin-right:5px;">末页</a>&nbsp;&nbsp;转到<input type="text" value="1" name="AspNetPager1_input" id="AspNetPager1_input" onkeydown="ANP_keydown(event,'AspNetPager1_btn');" style="width:30px;" />页<input type="submit" value="Go" name="AspNetPager1" id="AspNetPager1_btn" onclick="if(ANP_checkInput('AspNetPager1_input',28)){__doPostBack('AspNetPager1','')} else{return false}" />
			</div>
			</div>
			
		</table>
	</div>
</body>
</html>