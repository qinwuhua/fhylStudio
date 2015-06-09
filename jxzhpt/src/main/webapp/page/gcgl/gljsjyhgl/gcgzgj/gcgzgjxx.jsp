<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工程改造路面改建开工详情</title>
<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="js/gcgzgj.js"></script>
<script type="text/javascript"> 
$(function(){
	var data=parent.obj1;//$("#").text(data.);
	$("#xmmc").html(data.XMMC);$("#sjpfwh").html(data.SJPFWH);
	$("#xmbm").html(data.XMBM);$("#xdsj").html(data.XDSJ);
	$("#xzqh").html(data.XZQH);$("#sjkgsj").html(data.SJKGSJ);
	$("#qdzh").html(data.QDZH);$("#yjwgsj").html(data.YJWGSJ);
	$("#zdzh").html(data.ZDZH);$("#sgdw").html(data.SGDW);
	$("#kgsj").html(data.KGSJ);$("#jldw").html(data.JLDW);
	$("#wgsj").html(data.WGSJ);$("#jsdw").html(data.JSDW);
	$("#gq").html(data.GQ);$("#htje").html(data.HTJE);
	$("#gkpfwh").html(data.GKPFWH);$("#gys").html(data.GYS);
	fileShow1(data.XMBM,"工可批复文件");
	fileShow2(data.XMBM,"设计批复文件");
	});

function fileShow1(xmbm,type){
	$.ajax({
		type:'post',
		url:'../../../qqgl/queryFileByXmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#gkpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  </td></tr>";
				$("#gkpfTable").append(tr);
			}
		}
	});
}
function fileShow2(xmbm,type){
	$.ajax({
		type:'post',
		url:'../../../qqgl/queryFileByXmbm.do',
		data:'file.parentid='+xmbm+'&file.filetype='+type,
		dataType:'json',
		success:function(data){
			$("#sjpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  </td></tr>";
				$("#sjpfTable").append(tr);
			}
		}
	});
}
</script>
<style type="text/css">
a {
	text-decoration: none;
}
</style>
</head>
<body style="margin: 0 0 0 0">
	<div style="text-align: left; font-size: 12px; margin: 5px;">
		 <table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;"
            cellspacing="0" cellpadding="0">

			<tr style="height: 35px;">
				<td width="16%"
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					项目名称</td>
				<td width="16%"
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="xmmc"></span>
				</td>
				<td width="16%"
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目编码</td>
				<td width="16%"
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="xmbm"></span>
				</td>
				<td width="16%"
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					行政区划</td>
				<td width="16%"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="xzqh"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					起点桩号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="qdzh"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					止点桩号</td>
				<td colspan="3"
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="zdzh"></span>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					计划开工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="kgsj"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					计划完工时间</td>
				<td 
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="wgsj"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工期</td>
				<td 
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="gq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					工可批复文号</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id='gkpfwh'></span>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					工可批复文件</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="gkpfTable"></tbody>
					</table>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					设计批复文号</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id='sjpfwh'></span>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					设计批复文件</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
					</table>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					计划下达时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="xdsj"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					实际开工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sjkgsj"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					预计完工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="yjwgsj"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td
					style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					施工单位</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sgdw"></span>
				</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					监理单位</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="jldw"></span>
				</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					建设单位</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="jsdw"></span>&nbsp;
				</td>
			</tr>
			<tr style="height: 35px;">
				<td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					合同金额（万元）</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="htje"></span>&nbsp;
				</td>
				<td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
					概预算（万元）</td>
				<td colspan="3"
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="gys"></span>&nbsp;
				</td>
				
			</tr>
		</table>

	</div>
</body>
</html>