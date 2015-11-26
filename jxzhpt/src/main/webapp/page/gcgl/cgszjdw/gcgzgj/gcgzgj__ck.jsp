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
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/gcgzgj.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadDist1("xzqh",$.cookie("dist")); 
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=2010;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
			}
			var mystr='';
			var mystr1='';
			var mystr2='';
			var mystr3='';
			var mystr4='';
			if(m==1){
				mystr=y+'-'+m;
				mystr1=(y-1)+'-'+11;
				mystr2=(y-1)+'-'+12;
				mystr3=(y-1)+'-'+10;
				mystr4=(y-1)+'-'+9;
			}
			else if(m==2){
				mystr=y+'-'+m;
				mystr1=(y-1)+'-'+12;
				mystr2=y+'-'+1;
				mystr3=(y-1)+'-'+11;
				mystr4=(y-1)+'-'+10;
			}else if(m==3){
				mystr=y+'-'+m;
				mystr1=y+'-'+1;
				mystr2=y+'-'+2;
				mystr3=(y-1)+'-'+12;
				mystr4=(y-1)+'-'+11;
			}else if(m==4){
				mystr=y+'-'+m;
				mystr1=y+'-'+2;
				mystr2=y+'-'+3;
				mystr3=y+'-'+1;
				mystr4=(y-1)+'-'+12;
			}else{
				mystr=y+'-'+m;
				mystr1=y+'-'+(m-2);
				mystr2=y+'-'+(m-1);
				mystr3=y+'-'+(m-3);
				mystr4=y+'-'+(m-4);
			}
			$("#ddlMonth").append("<option id="+mystr+" value="+mystr+" selected='selected'>"+mystr+"</option>");
			$("#ddlMonth").append("<option id="+mystr2+" value="+mystr2+">"+mystr2+"</option>");
			$("#ddlMonth").append("<option id="+mystr1+" value="+mystr1+">"+mystr1+"</option>");
			$("#ddlMonth").append("<option id="+mystr1+" value="+mystr3+">"+mystr3+"</option>");
			$("#ddlMonth").append("<option id="+mystr1+" value="+mystr4+">"+mystr4+"</option>");
			$("#ddlYear").val(myDate.getFullYear());
			showAll__ck();
		});
		function exportAbyb(){
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
			var jgzt='0';
			var kgzt='';
			var lxmc=$("#lxmc").val();
			var myDate = new Date();
			var y=$("#ddlYear").val();
			var m=$("#ddlMonth").val();    //获取当前月份(0-11,0代表1月)
			var sbyf=m;
			var data="jgzt="+jgzt+"&kgzt="+kgzt+"&lxmc="+lxmc+"&sbyf="+sbyf+"&tbr="+$.cookie("truename")+"&xmnf="+y;
			$.post('/jxzhpt/gcgl/exportsjyb_set.do',{gydw:xzqhstr} ,function(){
				window.location.href="/jxzhpt/gcgl/exportgjyb.do?"+data;
			    });
		}
		function importData_yb(flag){
			var weatherDlg = new J.dialog( {
				id : 'id4',
				title : '车购税信息导入',
				page : '../../upload.jsp?url='+"/jxzhpt/gcgl/insertCGS.do"+'&flag='+flag,
				width : 570,
				height : 440,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
			weatherDlg.ShowDialog();
			return false;
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
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程管理>&nbsp;车购税资金到位情况>&nbsp;路面改造工程项目</div>
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
        						<span>行政区划：</span>
        						<input id="xzqh" style="width: 150px;">
        						<span>路线名称：</span>
        							<input type="text" id="lxmc" >
        						<span>项目年份：</span> 
        						<select name="ddlYear" id="ddlYear" style="width: 50px;">
        						<option value="">全部</option>
        						</select>
        						<span>拨付月份：</span> <select name="ddlMonth"
									id="ddlMonth" style="width: 60px;">
								</select> <span>拨付状态：</span> <select id=bfzt
									style="width: 50px;">
									<option value="">全部</option>
									<option>已拨付</option>
									<option>未拨付</option>
								</select> 
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll__ck()"/>
<%-- 								<img onclick="exportAbyb()" alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
<%--         						 <img onclick="importData_yb('cgszjdw/gcgzgj/gcgzgj')" alt="导入月报" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> --%>
                                 </p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td width="100%" style="padding-top: 1%;padding-left:10px;">
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