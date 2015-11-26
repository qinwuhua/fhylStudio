<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安全生命防护工程项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css"/>
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>

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
<script type="text/javascript">
	var xmkid;
	var xmbm=parent.obj.xmbm;
	function showLd(){
		$("#ldgrid").datagrid({    
			 url:'/jxzhpt/aqsmfh/selectSckaqsmfhld.do',
			 queryParams : {
				 	'xmkaqsmfh.xmbm':xmbm
				},
			    striped:true,
			   // pagination:true,
			   // rownumbers:true,
			    pageNumber:1,
			    pageSize:20,
		    columns:[[        
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(htmlue,row,index){			
						return '<a href=javascript:ckxxld("'+row.xmkid+'") style="text-decoration:none;color:#3399CC; ">详细</a>';			
				}},  
				{field:'xuh',title:'序号',width:60,align:'center'},
		        {field:'province',title:'省',width:160,align:'center'},
		        {field:'town',title:'市',width:120,align:'center'},
		        {field:'county',title:'县',width:120,align:'center'},
		        {field:'lxbm',title:'路线编码',width:120,align:'center'},
		        {field:'gydw',title:'管养单位',width:140,align:'center'},
		        {field:'xzqhdm',title:'行政区划代码',width:140,align:'center'},
		        {field:'lxmc',title:'路线名称',width:140,align:'center'},
		        {field:'jsdj',title:'技术等级',width:140,align:'center'},
		        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
		        {field:'cztzgs',title:'处置投资估算',width:140,align:'center'}
		    ]]
		});

	}
	function loadscxx(){
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/selectAqsmfhsckbyid.do',
	        data:"xmkaqsmfh.id="+parent.obj.id,
			dataType:'json',
			success:function(item){
				if(item!=null){
					tjldobj=item;
					//审查
					$("#lxmc").html(item.lxmc);$("#scjsdj").html(item.jsdj);
					$("#qdzh").html(item.qdzh);$("#zdzh").html(item.zdzh);$("#scjsdj").html(item.jsdj);
					$("#scyhlc").html(item.yhlc);$("#scxjgjnd").html(item.xjgjnd);
					$("#cztzgs").html(item.tzgs);$("#scjhnf").html(item.jhnf);
					$("#gydw").html(item.gydw);
					$("#xzqh").html(item.xzqh);
					$("#sfsqablbz").html(item.sfsqablbz);
					$("#jsnr").html(item.jsnr);
					$("#scxjgjnd").html(item.xjgjnd);$("#cztzgs").html(item.cztzgs);$("#czzlc").html(item.czzlc);
					$("#fapgdw").html(item.fapgdw);$("#fascdw").html(item.fascdw);
					$("#faspsj").html(item.faspsj);$("#spwh").html(item.spwh);$("#sfsqablbz").html(item.sfsqablbz);
			 		$("#ablbzsqwh").html(item.ablbzsqwh);$("#jsxz").html(item.jsxz);$("#bz").html(item.bz);
					$("#scjhnf").html(item.jhnf);
					
				}
			}
		});
	}
	$(function(){
		showLd();
		loadscxx();
		$("#qx_window").click(function(){
			parent.$('#lxxx').window('destroy');
		});	
	});
	var xmkid;
	function ckxxld(id){
		xmkid=id;
		YMLib.UI.createWindow('lxxx','项目路段信息','aqsmfhld_ck.jsp','lxxx',700,400);
	}
</script>

<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			
				<tr style="height: 25px;" >
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 150px; padding-left: 10px;">
						安全生命防护工程项目路段信息
					</td>
				</tr>
				<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff; height: 20px;" align="center">
					<table id="ldgrid" width="100%" ></table>
					</td>				
				</tr>
	
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 150px; padding-left: 10px;">
					安全生命防护工程项目审查信息
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="gydw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">行政区划：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="xzqh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">路线名称：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="lxmc"></span></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">技术等级：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="scjsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="qdzh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">止点桩号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="zdzh"></span></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">隐患里程：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="scyhlc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">处置总里程：</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="czzlc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">修建/改建年度：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="scxjgjnd"></span></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">方案评估单位：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="fapgdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="fascdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">方案审批时间(年/月/日)：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="faspsj"></span></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">审批文号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="spwh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">处置投资估算(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="cztzgs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">是否申请按比例补助(0、否1、是)：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="sfsqablbz"></span></td>
				
			</tr>		
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">按比例补助申请文号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="ablbzsqwh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">建设性质(1、中修2、大修)：</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="jsxz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">项目年份</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="scjhnf"></span></td>
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id='jsnr'> </span></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">备注(批复文件路线编码及桩号如为老编码，需在备注栏说明)：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<textarea id='bz' rows="2" style="width:99%"></textarea>

				</td>
				
			</tr>	
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff; height: 30px;"
					align="center"><a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">关闭</a></td>
			</tr>
			</table>
</body>
</html>