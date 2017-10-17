<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryLxshByXmbm.do',
				data:'jhsh.xmlx='+parent.YMLib.Var.xmbm.substr(10,1)+'&jhsh.xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(data){
					$('#lxsh').form("load",data);
					getghxxone(parent.YMLib.Var.xmbm,data.qdzh,data.zdzh);
				}
			});
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryKxxyjByXmbm.do',
				data:'xmlx='+parent.YMLib.Var.xmbm.substr(10,1)+'&xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(data){
					$('#kxxyj').form("load",data);
					fileShow1('gkpfTable',parent.YMLib.Var.xmbm,"工可批复文件");
				}
			});
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryCbsjByXmbm.do',
				data:'cbsj.xmlx='+parent.YMLib.Var.xmbm.substr(10,1)+'&cbsj.xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(data){
					$('#cbsj').form("load",data);
					fileShow1('sjpfTable',parent.YMLib.Var.xmbm,"设计批复文件");
				}
			});
			
			//getghxx(parent.YMLib.Var.xmbm);
		});
		function getghxx(xmid){
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/getghxx.do',
				data:"xmsq.xmbm="+xmid+"&xmsq.jsxz=jh",
				dataType:'json',
				success:function(msg){
					$("#ghlx").html(msg.ghlxbm);
					
				},
				error : function(){
				 YMLib.Tools.Show('未检索到数据错误！error code = 404',3000);
			 }
			});	
		}
		function getghxxone(xmid,qdzh,zdzh){
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/getghxxbyone.do',
				data:"xmsq.xmbm="+xmid+"&xmsq.qdzh="+qdzh+"&xmsq.zdzh="+zdzh+"&xmsq.jsxz=jh",
				dataType:'json',
				success:function(msg){
					$("#ghlxbm").val(msg.ghlxbm);
					$("#ghqdzh").val(msg.ghqdzh);
					$("#ghzdzh").val(msg.ghzdzh);
				},
				error : function(){
				 YMLib.Tools.Show('未检索到数据错误！error code = 404',3000);
			 }
			});	
		}
	</script>
</head>
<body style="font-size: 12px;">
	<div>
		<form id="lxsh">
			<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
				<tr style="height: 25px;">
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
						国省道改造 — 立项申请
					</td>
				</tr>
				
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
					<td style="background-color: #ffffff; height: 25px;" align="left">
						<input name="gydw" style="font-size: 14px;width:120px;" type="text"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
					<td style="background-color: #ffffff; height: 25px;" align="left">
						<input name="xzqh" style="width: 120px;" type="text"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
					<td style="background-color: #ffffff; height: 25px;" align="left">
						<input name="tsdq" type="text" style="font-size: 14px;width: 120px;"/></td>
				</tr>
				
				<tr style="height: 30px;">
            	<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
						规划路线编码</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
						<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
						规划起点桩号</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
						<input id="ghqdzh" name="ghqdzh" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
						规划止点桩号</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
						<input id="ghzdzh" name="ghzdzh" type="text" style="width: 80px;"/>
				</td>
            </tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input id="ghlxbh" name="ghlxbh" style="width: 120px;"/></td>
					
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input id="qdzh" name="qdzh" type="text" style="width:120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="zdzh" style="width: 120px;" type="text"/></td>
					
				</tr>
				<tr style="height: 35px;">
					
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input id="lxmc" name="lxmc" style="width:120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
					<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
						<input id="xmmc" name="xmmc" style="width:120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点名称：</td>
					
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="qdmc" type="text" style="width:120px;"/><br/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点名称：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="zdmc" type="text" style="width:120px;"/><br/>
					</td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="jsxz" style="width:120px;" type="text"/>
					</td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
					</td>
				</tr>
				
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						现技术等<br/>级及里程
					</td>
					<td colspan="5" style="background-color: #ffffff;border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
						二级：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
						三级：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
						四级：<input id="silc" name="silc" style="width: 50px;" type="text"/>
						等外：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
						无路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
						总计：<input id="lc" name="lc" type="text" style="width: 50px;"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设技术<br/>等级及里程
					</td>
					<td colspan="5" style="background-color: #ffffff;border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级：<input id="jhyilc" name="jhyilc" style="width: 50px;" value="0" type="text"/>
						二级：<input id="jherlc" name="jherlc" style="width: 50px;" value="0" type="text"/>
						三级：<input id="jhsanlc" name="jhsanlc" style="width: 50px;" value="0" type="text"/>
						四级：<input id="jhsilc" name="jhsilc" style="width: 50px;" value="0" type="text"/>
						等外：<input id="jhdwlc" name="jhdwlc" style="width: 50px;" value="0" type="text"/>
						无路：<input id="jhwllc" name="jhwllc" style="width: 50px;" type="text" value="0"/>
						总计：<input id="jszlc" name="jszlc" style="width: 50px;" type="text" value="0"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设技术等级：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="jsjsdj" type="text" style="width:120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">现状技术等级：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="xjsdj" type="text" style="width:120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目编码：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="xmbm" style="width: 120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="xmnf" style="width: 120px;" type="text"/>
						</td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划开工年：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="jhkgn" type="text" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划完工年：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="jhwgn" type="text" style="width: 120px;"/></td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="tz" type="text" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">补助测算：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="bzcs" style="width: 120px;" type="text"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">地方自筹：</td>
					<td style="background-color: #ffffff; height: 20px;" align="left">
						<input name="dfzc" style="width: 120px;" type="text"/>
					</td>
				</tr>
			</table>
		</form>
		<form id="kxxyj">
			<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
				<tr style="height: 25px;">
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
						国省道改造 — 可行性研究
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="xmmc" name="xmmc" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目编码：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input id="xmbm" name="xmbm" type="text" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id='xzqh' name="xzqh" style="width: 120px;"/>
					</td>
				</tr>
				
				
				
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="lxbm" name="lxbm" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 120px;" onblur="changeZlc()"/><br/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input name="zdzh" id="zdzh" type="text" style="width: 120px;" onblur="changeZlc()"/><br/>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">规划路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">规划起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="ghqdzh" id="ghqdzh" style="width: 120px;" onblur="changeZlc()"/><br/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">规划止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input name="ghzdzh" id="ghzdzh" type="text" style="width: 120px;" onblur="changeZlc()"/><br/>
				</td>
			</tr>
				<tr style="height: 35px;">
					
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="jsxz" name="jsxz" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				</tr>
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						现技术等<br/>级及里程
					</td>
					<td colspan="5" style="background-color: #ffffff;border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
						二级：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
						三级：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
						四级：<input id="silc" name="silc" style="width: 50px;" type="text"/>
						等外：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
						无路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
						总计：<input id="lc" name="lc" type="text" style="width: 50px;"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设技术<br/>等级及里程
					</td>
					<td colspan="5" style="background-color: #ffffff;border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级：<input id="jhyilc" name="jhyilc" style="width: 50px;" value="0" type="text"/>
						二级：<input id="jherlc" name="jherlc" style="width: 50px;" value="0" type="text"/>
						三级：<input id="jhsanlc" name="jhsanlc" style="width: 50px;" value="0" type="text"/>
						四级：<input id="jhsilc" name="jhsilc" style="width: 50px;" value="0" type="text"/>
						等外：<input id="jhdwlc" name="jhdwlc" style="width: 50px;" value="0" type="text"/>
						无路：<input id="jhwllc" name="jhwllc" style="width: 50px;" type="text" value="0"/>
						总计：<input id="jszlc" name="jszlc" style="width: 50px;" type="text" value="0"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">大桥（米）：</td>
					<td style="background-color: #ffffff; height: 25px;" align="left">
						<input type="text" id="dq_m" name="dq_m" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">大桥（座）：</td>
					<td style="background-color: #ffffff; height: 25px;" align="left">
						<input type="text" id="dq"  name="dq" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设技术等级：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input id="jsjsdj" name="jsjsdj" type="text" style="width: 120px;"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道（米）：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="sd_m" name="sd_m" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道（座）：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="sd" name="sd" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设单位：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="jsdw" name="jsdw" style="width: 120px;"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">开工年月：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type='text' id='kgny' name="kgny" style="width: 120px;"/>
					</td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">完工年月：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type='text' id='wgny' name="wgny" style="width: 120px;"/>
					</td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">编制单位：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="bzdw" name="bzdw" style="width: 120px;"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资估算：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="tzgs" name="tzgs" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工可批复文号：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="gkpfwh" name="gkpfwh" style="width: 120px;"/></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复时间：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
						<input type="text" id="pfsj" name="pfsj" style="width: 120px;"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工可批复文件：</td>
					<td style="background-color: #ffffff; height: 20px;width:18%" align="left" colspan="5">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="gkpfTable"></tbody>
						</table>
					</td>
				</tr>
			</table>
		</form>
		<form id="cbsj">
			<table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;" cellspacing="0" cellpadding="0">
				<tr style="height: 25px;">
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
						国省道改造 — 初步设计或施工图设计
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						项目名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmmc" name="xmmc" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						项目编码
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmbm" name="xmbm" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsdw" name="jsdw" style="width: 120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						行政区划
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xzqh" name="xzqh" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						建设技术等级
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsjsdj" name="jsjsdj" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设性质
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsxz" name="jsxz" style="width: 120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路线编码：</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="lxbm" name="lxbm" type="text" style="width: 120px;"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原起点桩号：</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input type="text" name="qdzh" id="qdzh" style="width: 120px;" onblur="changeZlc()"/><br/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原止点桩号：</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input name="zdzh" id="zdzh" type="text" style="width: 120px;" onblur="changeZlc()"/><br/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码：</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号：</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input type="text" name="ghqdzh" id="ghqdzh" style="width: 120px;" onblur="changeZlc()"/><br/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划止点桩号：</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input name="ghzdzh" id="ghzdzh" type="text" style="width: 120px;" onblur="changeZlc()"/><br/>
					</td>
				</tr>
				
				<tr style="height: 30px;">
					
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						路基(m3)
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="lj" name="lj" style="width: 120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					</td>
					
				</tr>
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						现技术等<br/>级及里程
					</td>
					<td colspan="5" style="background-color: #ffffff;border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
						二级：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
						三级：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
						四级：<input id="silc" name="silc" style="width: 50px;" type="text"/>
						等外：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
						无路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
						总计：<input id="lc" name="lc" type="text" style="width: 50px;"/>
					</td>
				</tr>
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设技术<br/>等级及里程
					</td>
					<td colspan="5" style="background-color: #ffffff;border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级：<input id="jhyilc" name="jhyilc" style="width: 50px;" value="0" type="text"/>
						二级：<input id="jherlc" name="jherlc" style="width: 50px;" value="0" type="text"/>
						三级：<input id="jhsanlc" name="jhsanlc" style="width: 50px;" value="0" type="text"/>
						四级：<input id="jhsilc" name="jhsilc" style="width: 50px;" value="0" type="text"/>
						等外：<input id="jhdwlc" name="jhdwlc" style="width: 50px;" value="0" type="text"/>
						无路：<input id="jhwllc" name="jhwllc" style="width: 50px;" type="text" value="0"/>
						总计：<input id="jszlc" name="jszlc" style="width: 50px;" type="text" value="0"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						桥梁
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="ql" name="ql" style="width:40px;" type="text"/>座
						<input id="ql_ym" name="ql_ym" style="width:40px;" type="text"/>延米
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						涵洞
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="hd" name="hd" style="width: 40px;" type="text"/>座
						<input id="hd_m" name="hd_m" style="width: 40px;" type="text"/>米
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						隧道
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sd" name="sd" style="width: 40px;" type="text"/>座
						<input id="sd_ym" name="sd_ym" style="width: 40px;" type="text"/>延米
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层(类型/公里)
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="mc" name="mc" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						基层(公里)
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jc" name="jc" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						垫层(公里)
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dc" name="dc" style="width: 120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						大桥名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dq" name="dq" style="width:120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						大桥长度
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dq_cd" name="dq_cd" style="width: 50px;margin-top: 5px;" type="text"/>米
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						大桥单跨
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dq_dk" name="dq_dk" style="width:50px;" type="text"/>米
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						隧道名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sdmc" name="sdmc" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						隧道双幅长度
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sd_sfcd" name="sd_sfcd" style="width: 50px;margin-top: 5px;" type="text"/>米
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						隧道类型
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sd_lx" name="sd_lx" style="width: 50px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						开工时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="kgsj" name="kgsj" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						完工时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="wgsj" name="wgsj" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						工期（月）
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="gq" name="gq" style="width:120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						设计单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sjdw" name="sjdw" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						设计批复文号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sjpfwh" name="sjpfwh" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						批复时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="pfsj" name="pfsj" style="width:120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建安费（万元）
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jaf" name="jaf" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"></td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"></td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						设计批复文件
					</td>
					<td colspan="3" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
						</table>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
</body>
</html>