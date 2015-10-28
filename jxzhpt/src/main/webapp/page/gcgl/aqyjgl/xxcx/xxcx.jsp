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
	<script type="text/javascript" src="js/xxcx.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			var date=new Date();
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate(); 
			var m1;
			var y1;
			if(m==1){
				m1=12;
				y1=y-1;
			}else{
				m1=m-1;
				y1=y;
			}
			if(m<=9){
				m='0'+m;
			}
			if(m1<=9){
				m1='0'+m1;
			}
			if(d<=9){
				d='0'+d;
			}
			$("#kssj").datebox({    
			    
			});  
			$("#jssj").datebox({    
		    
			});  
			$('#jssj').datebox('setValue',  y+"-"+m+"-"+d);
			if(m1==4||m1==6||m1==9||m1==11){
				if(d==31){
					d=30;
				}
			}
			if(m1==2){
				if(d==29||d==30||d==31){
					d=28
				}
			}
			$('#kssj').datebox('setValue', y1+"-"+m1+"-"+d);
			showAll();
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
						<div id="p_top">当前位置>&nbsp;工程管理>&nbsp;安全应急管理>&nbsp;信息通知数据查询</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 1% 0px 1% 2%;">
        						<span>发布时间：</span>
        							<input type="text" id="kssj" >
        							<span>至</span>
        							<input type="text" id="jssj" >
<!--         							<span>状态：</span> -->
<!--         							<select id="ckzt"> -->
<!--         								<option value="">全部</option> -->
<!--         								<option value="未查看">未查看</option> -->
<!--         								<option value="已查看">已查看</option> -->
<!--         							</select> -->
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll()"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td style="padding-top: 1%;padding-left:10px;">
                    <div>
				<table id="datagrid" >
				</table>
			</div>
			</td>
			</tr>
		</table>
	</div>
</body>
</html>