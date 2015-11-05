<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lwxm/js/lwxm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lwxm/js/wqsj.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/wqsj.js"></script>
<script type="text/javascript">
$(function(){
	loadJhkxx();
	loadZjxdList();
});
function loadJhkxx(){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzjhkbyid.do",
		 dataType : 'json',
		 data : 'id='+parent.obj,
		 success : function(msg){
			 loadSckxx(msg.sckid);
			 $("#jhjsxz").html(msg.jhjsxz);
			 $("#sfylrbwqk").html(msg.sfylrbwqk);
			 $("#sbnf").html(msg.sbnf);
			 $("#jhkgsj").html(msg.jhkgsj);
			 $("#jhwgsj").html(msg.jhwgsj);
			 $("#sjdw").html(msg.sjdw);
			 $("#sjpfdw").html(msg.sjpfdw);
			 $("#jhpfwh").html(msg.pfwh);
			 $("#pfsj").html(msg.pfsj);
			 $("#sfsqablbz").html(msg.sfsqablbz);
			 $("#ablbzwh").html(msg.ablbzwh);
			 $("#pfztz").html(msg.pfztz);
			 if(msg.sfylrbwqk=='是'){
				 $("#wenz").html('计划使用部补助金额(万元)：');
				 $("#shengbz").html(msg.jhsybzje);
				 $("#dfzc").html(accSub(msg.pfztz,msg.jhsybzje));
			 }else{
				 $("#wenz").html('计划使用省补助金额(万元)：');
				 $("#shengbz").html(msg.shengbz);
				 $("#dfzc").html(accSub(msg.pfztz,msg.shengbz));
			 }
			 $("#qlszxz").html(msg.qlszxz);
			 $("#jhqlqc").html(msg.jhqlqc);
			 $("#jhqlqk").html(msg.jhqlqk);
			 $("#zyjsnr").html(msg.zyjsnr);
			 $("#jhbz").html(msg.bz);
		 }
	});
}

function loadJckxx(id){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzxmkbyid.do",
		 dataType : 'json',
		 data : 'id='+id,
		 success : function(item){
			 	fileShow2(item.id,"桥梁正面文件");
				fileShow3(item.id,"桥梁侧面文件");
				$("#qlbh").html(item.qlbh);
				$("#qlmc").html(item.qlmc);
				$("#qlzxzh").html(item.qlzxzh);
				$("#gydw").html(item.gydw);
				$("#xzqhmc").html(item.xzqhmc);
				$("#xzqhdm").html(item.xzqhdm);
				$("#lxmc").html(item.lxmc);
				$("#lxbm").html(item.lxbm);
				$("#kjzc").html(item.kjzc);
				$("#qlqc").html(item.qlqc);
				$("#qlkd").html(item.qlkd);
				$("#dkzdkj").html(item.dkzdkj);
				$("#jsdj").html(item.jsdj);
				$("#pddj").html(item.pddj);
				$("#xjgjnd").html(item.xjgjnd);
				$("#akjfl").html(item.akjfl);
				$("#sbjgxs").html(item.sbjgxs);
				$("#xmnf").html(item.xmnf);
				$("#xmtype").html(item.xmtype);
				$("#bhnr").html(item.bhnr);
				$("#bz").html(item.bz);
				$("#tsdq").html(item.tsdq);
				$("#qlyhgcs").html(item.qlyhgcs);
				$("#qljggcs").html(item.qljggcs);
				$("#xmrksj").html(item.xmrksj);
				$("#czyjhjy").html(item.czyjhjy);
				$("#sqs").html(item.sqs);$("#xsq").html(item.xsq);$("#szxz").html(item.szxz);
				$("#synf").html(item.synf);$("#sjhspl").html(item.sjhspl);$("#qxjkuan").html(item.qxjkuan);
				$("#qxjkong").html(item.qxjkong);$("#zqks").html(item.zqks);$("#qmjk").html(item.qmjk);$("#kydwlx").html(item.kydwlx);
				$("#thdj").html(item.thdj);$("#glqlyt").html(item.glqlyt);$("#qdlx").html(item.qdlx);
				$("#qtlx").html(item.qtlx);$("#pzlx").html(item.pzlx);
				$("#xlxbm").html(item.xlxbm);$("#xqlbm").html(item.xqlbm);$("#xzxzh").html(item.xzxzh);$("#jd").html(item.ptx);$("#wd").html(item.pty);
		 }
	});
}
function loadSckxx(id){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzsckbyid.do",
		 dataType : 'json',
		 data : 'id='+id,
		 success : function(item){
			 loadJckxx(item.xmkid);
			 sjtfileShow(item.sckid);
			 $("#scqlqc").html(item.scqlqc);
				$("#scqlqk").html(item.scqlqk);
				$("#scxmnf").html(item.scxmnf);
				$("#fapgdw").html(item.fapgdw);
				$("#fascdw").html(item.fascdw);
				$("#faspsj").html(item.faspsj);
				$("#spwh").html(item.spwh);
				$("#jsxz").html(item.jsxz);
				$("#tzgs").html(item.tzgs);
				$("#sjdwmc").html(item.sjdwmc);
				$("#jsgmqc").html(item.jsgmqc);
				$("#jsgmqk").html(item.jsgmqk);
				$("#hzdj").html(item.hzdj);
				$("#scsjhspl").html(item.scsjhspl);
				$("#sck_sbjgxs").html(item.sck_sbjgxs);
				$("#kjzh").html(item.kjzh);
				$("#ztz").html(item.ztz);
				$("#sck_xbjgxs").html(item.sck_xbjgxs);
				$("#sgtpfsj").html(item.sgtpfsj);
				$("#pfwh").html(item.pfwh);
				$("#zgq").html(item.zgq);
				$("#jsnr").html(item.jsnr);
				$("#scbz").html(item.scbz);
				$("#nsqbbz").html(item.nsqbbz);$("#rksj").html(item.rksj);$("#cjqz").html(item.cjqz);
				$("#scthdj").html(item.scthdj);$("#qljc").html(item.qljc);$("#ydgldj").html(item.ydgldj);
				$("#sjsd").html(item.sjsd);$("#scsqs").html(item.scsqs);$("#scxsq").html(item.scxsq);$("#scszxz").html(item.scszxz);
		 }
	});
}

function sjtfileShow(id){
	//加载文件
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+id,
		success:function(data){
	/* 		var data=datas.rows; */
		/* 	alert(data); */
			$("#sjsgtTable").empty();
			var gkbg="";
			var sjsgt="";
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype=="设计施工图"){
					sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=sjtdownFile('"+data[i].id+"')>下载</a></td></tr>";
				}
				}
			$("#sjsgtTable").append(sjsgt);
		}
	});
}
function sjtdownFile(id){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.id="+id;
}
function loadZjxdList(){
	var params={'zjxd.xmid':parent.obj};
	loadZjxdSumByXmid();
	$('#zjxfgrid').datagrid({
		url : '/jxzhpt/jhgl/queryZjxdByXmId.do',
		queryParams : params,
		striped : true,
		pagination : true,
		rownumbers : true,
		pageNumber : 1,
		pageSize : 3,
		height : 140,
		fitColumns:true,
		columns : [[
		
		{field : 'sfzj',title : '是否追加',width : 100,align : 'center',
			formatter : function(value, row, index) {
				if (row.sfzj == "0") {
					return "否";
				} else {
					return "是";
				}
			}
		},
		{field:'xdnf',title : '下达年份',width : 100,align : 'center'}, 
		{field : 'xdzj',title : '总补助资金',width : 150,align : 'center'},
		{field : 'btzzj',title : '车购税',width : 150,align : 'center'}, 
		{field : 'stz',title : '省投资',width : 150,align : 'center'}, 
		{field : 'tbdw',title : '填报部门',width : 150,align : 'center'}, 
		{field : 'jhxdwh',title : '计划下达文号',width : 150,align : 'center'}, 
		{field : 'tbtime',title : '填报时间',width : 150,align : 'center'}
		]]
	});
}
function loadZjxdSumByXmid(){
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/queryZjxdSumByXmid.do',
		data:'zjxd.xmid='+parent.obj,
		dataType:'json',
		success:function(data){
			if(data!=null){
				$('#sl').html(data.xmid);
				$('#xdzj').html(data.xdzj);
			}
		}
	});
}

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
		<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目基本信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:16%" align="right">桥梁编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:17%" align="left">
					<span id="qlbh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:16%" align="right">桥梁名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:17%" align="left">
					<span id="qlmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:18%" align="right">桥梁中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlzxzh"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养（监管）单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="xzqhdm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhmc"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="lxbm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径总长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kjzc"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlqc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="qlkd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">单孔最大跨径(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dkzdkj"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术状况评定：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="pddj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xjgjnd"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="akjfl"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="sbjgxs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xlxbm" ></span> </td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新桥梁编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xqlbm" ></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzxzh" ></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">经度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jd" > </span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">纬度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="wd" ></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">入库时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmnf"></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmtype"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁养护工程师：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlyhgcs"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁监管工程师：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qljggcs"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">危桥添加时间：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmrksj"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设区市：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sqs"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县（市、区）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xsq"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">所在乡镇：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="szxz"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按建筑材料和&nbsp;&nbsp;<br>使用年限分类：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="synf"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计洪水频率(年)：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjhspl"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥下净宽（米）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qxjkuan"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥下净空（米）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qxjkong"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">主桥孔数（孔）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zqks"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥面净宽（米）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qmjk"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨越地物类型：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kydwlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通航等级：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="thdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路桥梁用途：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="glqlyt"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥墩类型：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qdlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥台类型：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qtlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">铺装类型：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pzlx"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bhnr"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置意见和建议：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="czyjhjy"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁正面照片：</td>
				<td id="td_jgtc" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="qlzmTable"></tbody>
					</table>
					
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁侧面照片：</td>
				<td id="td_wgys" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="2">
						<tbody id="qlcmTable"></tbody>
					</table>
					
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目审查信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scqlqc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scqlqk"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scxmnf"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估(设计)单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="fapgdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审核(批复)单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="fascdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案(施工图)批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="faspsj"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="spwh"></span></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsxz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">荷载等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="hzdj"></span></td>
			</tr>
			
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计洪水频率：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scsjhspl"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径组合：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kjzh"></span></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sck_sbjgxs"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">下部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sck_xbjgxs"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总工期：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zgq"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">重建桥址：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="cjqz"></span>米</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通航等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scthdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁基础：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qljc"></span></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">引道公路等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="ydgldj"></span></td>
			</tr>
			<tr style="height: 30px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计速度(km/h)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjsd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总投资：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="ztz"></span>&nbsp;万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">拟申请部（省）<br>级补助资金（万元）：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="nsqbbz"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设区市：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scsqs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县（市、区）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scxsq"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">所在乡镇：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scszxz"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsnr"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scbz"></span>
				</td>
		</tr>
		<tr>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计施工图：</td>
				<td id="td_sjsgt" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="sjsgtTable"></tbody>
					</table>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目计划信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上报年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sbnf"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划开工时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jhkgsj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划完工时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jhwgsj"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计批复单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjpfdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jhpfwh"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pfsj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否申请按比例补助：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sfsqablbz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按比例补助申请文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="ablbzwh"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复总投资(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pfztz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font id="wenz">计划使用省补助金额(万元)：</font></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="shengbz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划使用地方自筹资金(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dfzc"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁所在乡镇：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlszxz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁建设规模：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					长<span id="jhqlqc"></span>&nbsp;&nbsp;宽<span id="jhqlqk"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jhjsxz"></span></td>
			</tr>
			<tr id="sftr" style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%;" align="right">是否入部危桥库：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sfylrbwqk"></span>
				</td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%;" align="right">主要建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zyjsnr"></span></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%;" align="right">备注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jhbz"></span></td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目资金下达信息
				</td>
				
			</tr>
			<tr style="margin: 0px;">
				<td colspan="6" style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;background-color:#ffffff; ">
				共有【&nbsp;<span id="sl" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个下发信息，
				总补助资金【&nbsp;<span id="xdzj" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
				</td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="6" style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:100%;" align="center">
					<div>
            			<table id="zjxfgrid" ></table>
            		</div>
				</td>
			</tr>
			
		</table>
	</body>
</html>