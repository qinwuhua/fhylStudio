<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义查询</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YMLib.js"></script>
<script type="text/javascript" src="../js/sjcx.js"></script>
<script type="text/javascript">
	$(function(){
		loadUnit1("gydw",$.cookie("unit"));
		loadDist1("xzqhmc",$.cookie("dist"));
		//loadBmbm2("kgzt","开工状态");
		tsdqdx('tsdq');
		xmnfdx1("xmnf");
		xmnfdx1("rksj");
		xmnfdx1("xdnf");
		xzdjdx("xzdj");
		//xmnf("jhnf");
		jhpcdx('jhpc','wqgz');
		kjfldx('kjfl');
		var gydwstr;var xzqhstr;
		$("#btnSelect").click(function(){
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
		var xzqhdm=$("#xzqhmc").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			var akjfl=$("#kjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var rksj=$("#rksj").combobox("getValues").join(",");
			if(rksj.substr(0,1)==',')
				rksj=rksj.substr(1,rksj.length);
			var xdnf=$("#xdnf").combobox("getValues").join(",");
			if(xdnf.substr(0,1)==',')
				xdnf=xdnf.substr(1,xdnf.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var xzdj=$("#xzdj").combobox("getValues").join(",");
			if(xzdj.substr(0,1)==',')
				xzdj=xzdj.substr(1,xzdj.length);
			var jhpc=$("#jhpc").combobox("getText");
			if(jhpc.substr(0,2)=='全部')
				jhpc=jhpc.substr(3,jhpc.length);
			YMLib.Var.gydw=gydwstr;
			YMLib.Var.xzqhdm=xzqhstr;
			YMLib.Var.lxmc=$("#lxmc").val();
			YMLib.Var.akjfl=akjfl;
			YMLib.Var.tsdq=tsdq;
			YMLib.Var.xmlx=$("#xmlx").combobox("getValue");
			YMLib.Var.kgzt=$("#kgzt").combobox("getValue");
			YMLib.Var.lxbm=$("#lxbm").val();
			YMLib.Var.rksj=rksj;
			YMLib.Var.xdnf=xdnf;
			YMLib.Var.xmnf=xmnf;
			YMLib.Var.pddj=$("#pddj").combobox("getValue");
			YMLib.Var.qlbh=$("#qlbh").val();
			YMLib.Var.qlmc=$("#qlmc").val();
			YMLib.Var.xzdj=xzdj;
			YMLib.Var.jhpc=jhpc;
			YMLib.Var.jsxz=$("#jsxz").combobox("getValue");
			 Wqgzsj();
		});
	});
</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
	
		<div id="righttop">
		<div id="p_top">数据查询>&nbsp;自定义查询>&nbsp;危桥改造（交通局）</div>
		</div>

<center>
<table style="width: 99%; margin-top: 15px; background-color: #aacbf8; font-size: 12px;"
			border="0" cellpadding="3" cellspacing="1">
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="gydw" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right">行政区划：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="xzqhmc" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="lxmc" style="width: 145px"/></td>
				<td style="background-color: #ffffff;width:15%" align="right">跨径分类：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="kjfl" style="width: 145px"/></td>
				<td style="background-color: #ffffff;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="tsdq" style="width: 145px"/></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">是否部库：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="xmlx" style="width: 160px" class="easyui-combobox" >
						<option value="">全部</option>
						<option value="是">是</option>
						<option value="否">否</option>
					</select></td>
					<td style="background-color: #ffffff;width:15%" align="right">工程进度：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="kgzt" class='easyui-combobox' style="width: 160px">
						<option value="">全部</option>
						<option value="未开工">未开工</option>
						<option value="在建">在建</option>
						<option value="完工">完工</option>
						<option value="完工未验收">完工未验收</option>
						<option value="完工已验收">完工已验收</option>
					</select></td>
				<td style="background-color: #ffffff;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="lxbm" style="width: 145px"/></td>
				<td style="background-color: #ffffff;width:15%" align="right">入库时间：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="rksj" style="width: 145px"/></td>
				<td style="background-color: #ffffff;width:15%" align="right">计划下达年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="xdnf" style="width: 145px"/></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="xmnf" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="pddj" class='easyui-combobox' style="width: 160px">
						<option value="">全部</option>
						<option value="四类">四类</option>
						<option value="五类">五类</option>
						
					</select></td>
				<td style="background-color: #ffffff;width:15%" align="right">桥梁编号：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="qlbh" style="width: 145px"/></td>
				<td style="background-color: #ffffff;width:15%" align="right">桥梁名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="qlmc" style="width: 145px"/></td>
				<td style="background-color: #ffffff;width:15%" align="right">行政等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="xzdj" style="width: 145px"/></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">计划批次：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="jhpc" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="jsxz" class='easyui-combobox' style="width: 160px">
						<option value="">全部</option>
						<option value="加固改造">加固改造</option>
						<option value="拆除重建">拆除重建</option>
						
					</select></td>
				<td style="background-color: #ffffff;width:15%" align="right"></td>
				<td style="background-color: #ffffff;" align="left">
					</td>
				<td style="background-color: #ffffff;width:15%" align="right"></td>
				<td style="background-color: #ffffff;" align="left">
					</td>
				<td style="background-color: #ffffff;width:15%" align="right"></td>
				<td style="background-color: #ffffff;" align="left">
					</td>
			</tr>
			
			<tr  style="height: 30px;">
				<td colspan="10" style="background-color: #ffffff;width:15%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif"  style="border-width:0px;cursor: hand;" />&nbsp;&nbsp;&nbsp;
						<img  onclick="exportExcel_wqsjzdy()" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
				</td>
			</tr>
			</table><br/>
			<div>
				<table id="grid" width="100%" > </table>
			</div>
		</center>
</body>
</html>