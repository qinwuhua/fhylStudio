<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造月报列表</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/wqgz.js"></script>
	<script type="text/javascript">
	$(function(){
			showYBlist1__ck();
			$("#nf").text(new Date().getFullYear());
			shezhi();
		});
		var pfztz=0;
		var pfbtz=0;
		var pfstz=0;
		var zwcbtz=0;
		var sfylrbwqk='';
		
		function shezhi(){
			pfztz=parent.obj1.pfztz;
			pfbtz=parent.obj1.jhsybzje;
			pfstz=parent.obj1.shengbz;
			sfylrbwqk=parent.obj1.sfylrbwqk;
			if(parent.obj1.sfylrbwqk=='是'){
				$("#pfztz").text(pfztz);
				$("#pfbtz").text(pfbtz);
				$("#btext").attr('style','');
				$("#stext").attr('style','display: none');
			}else{
				$("#pfztz").text(pfztz);
				$("#pfbtz").text(pfstz);
				$("#btext").attr('style','display: none');
				$("#stext").attr('style','');
			}
			
			
			var data="gcglwqgz.jhid="+parent.obj1.jhid+"&gcglwqgz.nf="+new Date().getFullYear()+"&gcglwqgz.id="+parent.obj1.id+"&gcglwqgz.tablename=gcgl_wqgz";
			$.ajax({
				type:'post',
				url:'../../../../gcgl/selectWqgzbzzj.do',
				data:data,
				dataType:'json',
				success:function(msg){
					if(msg.zbfzj=='')
						$("#zbfzj").text('0');
					else
						$("#zbfzj").text(msg.zbfzj);
					if(msg.nbfzj=='')
						$("#nbfzj").text('0');
					else
						$("#nbfzj").text(msg.nbfzj);
					if(msg.nxdzj=='')
						$("#nxdzj").text('0');
					else
						$("#nxdzj").text(msg.nxdzj);
					if(msg.zxdzj=='')
						$("#jhxdzj").text('0');
					else
						$("#jhxdzj").text(msg.zxdzj);
					if(msg.zwczj=='')
						$("#zwczj").text('0');
					else
						$("#zwczj").text(msg.zwczj);
					if(parent.obj1.sfylrbwqk=='是'){
						if(msg.zwcbtz=='')
							$("#zwcbtz").text('0');
						else
							$("#zwcbtz").text(msg.zwcbtz);
						$("#btext1").attr('style','');
						$("#stext1").attr('style','display: none');
					}else{
						if(msg.zwcstz=='')
							$("#zwcbtz").text('0');
						else
							$("#zwcbtz").text(msg.zwcstz);
						$("#btext1").attr('style','display: none');
						$("#stext1").attr('style','');
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
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">         
            <tr>
                <td height="30" align="left" style="font-size: 12px;">
                		项目批复总投资共【<span id="pfztz" style="color: Red; font-weight: bold;"></span>】万元，
                	   其中<span id='btext' style="display: none">部</span><span id='stext' style="display: none">省</span>投资【<span id="pfbtz" style="color: Red; font-weight: bold;"></span>】万元，
                    项目计划下达资金共【<span id="jhxdzj" style="color: Red; font-weight: bold;"></span>】万元，
                    累计拨付资金共【<span id="zbfzj" style="color: Red; font-weight: bold;"></span>】万元。
                    其中，<span id="nf"></span>年计划下达资金【<span id="nxdzj" style="color: Red; font-weight: bold;"></span>】万元，
                    已拨付【<span id="nbfzj" style="color: Red; font-weight: bold;"></span>】万元，
                    累计完成【<span id="zwczj" style="color: Red; font-weight: bold;"></span>】万元，
                    其中<span id='btext1' style="display: none">部</span><span id='stext1' style="display: none">省</span>投资【<span id="zwcbtz" style="color: Red; font-weight: bold;"></span>】万元。
                </td>
            </tr>
            <tr>
                <td align="center" >
                            <table id="ybgrid" align="center" ></table>
                </td>
            </tr>
        
        </table>
        <table width="97%" border="0" style="border-style: solid; border-width: 0px 0px 0px 0px;
            margin-top: 8px; margin-left: 13px;
            height: 45px;" cellspacing="0" cellpadding="0">
            <tr style="height: 30px;">
                <td align="center">
                    <table>
                        <tr>
                        <%--     <td>
                                <img id="imgAdd" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/tianj2.gif'" alt="添加" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/tianj1.gif'" onclick="AddInfo1()" src="${pageContext.request.contextPath}/images/Button/tianj1.gif" style="border-width:0px;cursor: hand;" />
                            </td> --%>
                            <td>
                             
                                    <img onclick="closes('wqxx1')" src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" alt="返回" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" style="border: 0" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>