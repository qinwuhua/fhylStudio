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
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/SimpleCanleder.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SimpleCanleder.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/bhsd.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist")); 
			loadBmbm2('ddlGldj','行政等级');
// 			tsdq('ddlTSDQ');
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			/* for(var x=y+5;x>=2010;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
			} */
			 $('#ddlMonth').simpleCanleder();
			$('#ddlMonth').val(y+"-"+m);
			//$("#ddlYear").val(myDate.getFullYear());
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("ddlYear"); 
				xzdjdx('ddlGldj');
			}else{
				setxmnf("ddlYear",urlid);
				setxzdj('ddlGldj',urlid);
			}
			showAll();
		});
		function exportAbyb(){
			var gydw=$("#gydw").combotree("getValues");
			if(gydw.length==0){
				if($.cookie("unit2")=='_____36')
					gydwstr=36;
				else gydwstr= $.cookie("unit2");
			}else if(gydw.length==1){
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
	 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				gydwstr=gydw[0] ;
			}else{
				gydwstr= gydw.join(',');
			}
		
			var jgzt='0';
			var kgzt='';
			var lxmc=$("#lxmc").val();
			var sdmc=$("#sdmc").val();
			var y=$("#ddlYear").val();
			var m=$("#ddlMonth").val();         //获取当前月份(0-11,0代表1月)
			var sbyf=m;
			var data="jgzt="+jgzt+"&kgzt="+kgzt+"&lxmc="+lxmc+"&sbyf="+sbyf+"&tbr="+$.cookie("truename")+"&qlmc="+qlmc+"&xmnf="+y+"&sfylrbwqk=是";
			$.post('/jxzhpt/gcgl/exportsjyb_set.do',{gydw:gydwstr} ,function(){
				window.location.href="/jxzhpt/gcgl/exportwqyb.do?"+data;
			    });
		}
		function importData_yb(flag){
			var weatherDlg = new J.dialog( {
				id : 'id4',
				title : '车购税信息导入',
				page : '../../upload.jsp?url='+"/jxzhpt/gcgl/insertCGS1.do"+'&flag='+flag,
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
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;资金拨付>&nbsp;<span id="astext">资金拨付</span>>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;病害隧道</div>
					</div>
	            
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:4px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
        					<tr height="29">
        						<td align="right">管养单位：</td>
        						<td><input id="gydw" style="width: 140px;"></td>
        						<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:140px;"></select></td>
        						<td align="right">下达年份：</td>
        						<td><select name="ddlYear" id="ddlYear" style="width: 100px;">
        						<option value="">全部</option>
        						</select></td>
        						<td align="right">拨付月份：</td>
        						<td><input name="ddlMonth"
									id="ddlMonth" style="width: 76px;"></td>
								
								</tr>
								<tr height="29">
								<td align="right">拨付状态：</td>
								<td><select id=bfzt
									style="width: 140px;">
									<option value="">全部</option>
									<option>已拨付</option>
									<option>未拨付</option>
								</select> </td>
								<td align="right">原行政等级：</td>
								<td><select name="ddlGldj" id="ddlGldj" style="width:140px; vertical-align:middle;"></select></td>
<!--         						<span style=" vertical-align:middle;">&nbsp;特殊地区：</span> -->
<!-- 								<select name="ddlTSDQ" id="ddlTSDQ" style="width:85px; vertical-align:middle;"> -->
<!-- 								</select> -->
								<td align="right">路线名称：</td>
        						<td>	<input type="text" id="lxmc" style="width: 98px;"></td>
        						<td align="right">累计拨付状态：</td>
        						<td><select id="ljbfzt" class="easyui-combobox" style="width:78px;">
									<option value="" selected="selected">全部</option>
									<option value="已全部拨付">已全部拨付</option>
									<option value="未全部拨付">未全部拨付</option>
								</select></td>
								
								</tr>
								<tr height="29">
								<td align="right">隧道名称：</td>
        						<td>	<input type="text" id="sdmc" style="width: 138px;"></td>
								<td align="right">隧道编码：</td>
        						<td><input type="text" id="sddm" style="width: 138px;"></td>
        						</tr>
<!--         						<span>下达年份：</span> -->
<!--         							<input type="text" id="xdnf" style="width: 100px;"> -->
        						<tr height="29">
        						<td colspan="8">
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showAll()"/>        					
                                       <img onclick="exportAbyb()" alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        						 <img onclick="importData_yb('cgszjdw/wqgz/wqgz')" alt="导入月报" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> 
                                     </td>   </tr></table>
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