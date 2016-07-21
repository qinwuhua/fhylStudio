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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/wqgz.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/SimpleCanleder.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SimpleCanleder.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist")); 
			loadBmbm2('ddlGldj','行政等级');
			tsdq('ddlTSDQ');
			//gcglxmnf("ddlYear");
			
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("ddlYear"); 
				xzdjdx('ddlGldj');
			}else{
				setxmnf("ddlYear",urlid);
				setxzdj('ddlGldj',urlid);
			}
			
			showAll__ck();
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
 cursor: pointer;
}
a:active {
 text-decoration: none;
}
-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;<span id="astext">完工项目</span>>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;危桥改造工程项目</div>
					</div>

        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 1% 0% 1% 2%;">
        						<span>管养单位：</span>
        						<input id="gydw" style="width: 150px;">
        						<span style=" vertical-align:middle;">行政等级：</span>
								<select name="ddlGldj" id="ddlGldj" style="width:102px; vertical-align:middle;"></select>
        						<span>路线名称：</span>
        							<input type="text" id="lxmc" style="width: 100px;">
        						<span>桥梁名称：</span>
        						<input type="text" id="qlmc" style="width: 100px;">
        						</p>
        						 <p style="margin: 1% 0% 1% 2%;">
								<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
								
        						<span style=" vertical-align:middle;">特殊地区：</span>
								<select name="ddlTSDQ" id="ddlTSDQ" style="width:102px; vertical-align:middle;">
								</select>
								
        							<span>桥梁编码：</span>
        						<input type="text" id="qlbm" style="width: 100px;">
        						<span>项目年份：</span> 
        						<select name="ddlYear" id="ddlYear" style="width: 70px;">
        						<option value="">全部</option>
        						</select>
								</p>
								<p style="margin: 1% 0% 1% 2%;">
								<span>是否交工验收：</span>
								<select id='jgys' class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'90'">
									<option value="">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select>
        						 <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll__ck()"/>
</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td width="100%" style="padding-top: 1%;padding-left:10px;">
                    <div>
                                                     共有【&nbsp;<span id="sl" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个项目，
        			批复总投资【&nbsp;<span id="pfztz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="btz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中省投资【&nbsp;<span id="stz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="dftz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			总补助资金【&nbsp;<span id="zbz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
                                                    总申请奖励资金【&nbsp;<span id="jlzj" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
                    
						<table id="datagrid"  >			
						</table>
					</div>
				</td>
		</tr>
	</table>
	</div>
	
</body>
</html>