<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目详细信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
	$(function(){
		loadJzxx();
		loadZjxdSumByXmid();
		loadZjxdList();
		if(parent.YMLib.Var.bz!=null){
			bz=parent.YMLib.Var.bz;
		}
		if(parent.YMLib.Var.jhbm!=null){
			xxId=parent.YMLib.Var.jhbm;
		}
		var lxls={'lx.lxbm':null,'lx.zdzh':null,'lx.xzqhdm':null,
				'lx.qdzh':null,'lx.jhid':null};
		$.ajax({
			type:'post',
			async:false,
			url:'../../../jhgl/queryAbgcById.do',
			data:"jh.id="+xxId,
			dataType:'json',
			success:function(data){
				sckid=data.sckid;
				//审查库
				lxls['lx.jhid']=data.jhnf;
				$.ajax({
					type:'post',
					async:false,
					url:'../../../xmsck/selectSckabgcById.do',
					dataType:'json',
					data:'sckid='+data.sckid,
					success:function(data){
						if(data!=null){
							lxls['lx.lxbm']=data.lxbm;
							lxls['lx.zdzh']=data.zdzh;
							lxls['lx.qdzh']=data.qdzh;
							lxls['lx.xzqhdm']=data.xzqhdm;
							//基础
							$('#lxmc').html(data.lxmc);
							$('#lxbm').html(data.lxbm);
							$('#gydwxx').html(data.gydw);
							$('#qdzh').html(data.qdzh);
							$('#zdzh').html(data.zdzh);
							$('#qzlc').html(data.qzlc);
							$('#xzqhdm').html(data.xzqhdm);
							$('#xzqhmc').html(data.xzqhmc);
							$('#xjgjnd').html(data.gjxjnd);
							$('#jsdjxx').html(data.lxjsdj);
							$('#yhlc').html(data.yhlc);
							$('#tsdq').html(data.tsdq);
							$('#xmnf').html(data.xmnf);
							$('#xmzt').html(data.xmzt);
							$('#yhnr').html(data.yhnr);
							$('#bz').html(data.bz);
							//审查
							$('#scqdzh').html(data.scqdzh);
							$('#sczdzh').html(data.sczdzh);
							$('#sczlc').html(data.sczdzh);
							$('#scyhlc').html(data.scyhlc);
							$('#fapgdw').html(data.fapgdw);
							$('#fascdw').html(data.fascdw);
							$('#faspsj').html(data.faspsj);
							$('#spwh').html(data.spwh);
							$('#tzgs').html(data.tzgs);
							$('#jsxz').html(data.jsxz);
							$('#jsnr').html(data.jsnr);
							$('#remarks').html(data.remarks);
						}
					}
				});
				//计划
				$('#jhid').val(data.id);
				$('#jhnfxx').html(data.jhnf);
				$('#JHKGSJ').html(data.jhkgsj);
				$('#JHWGSJ').html(data.jhwgsj);
				$('#sjwgsj').html(data.sjwgsj);
				$('#JHXDSJ').html(data.xdsj);
				$('#JHWC_C').html(data.jhwc_c);
				$('#SJDW').html(data.sjdw);
				$('#SJPFDW').html(data.sjpfdw);
				$('#PFWH').html(data.pfwh);
				$('#PFSJ').html(data.pfsj);
				$('#JHZTZ').html(data.pfztz);
				$('#bbz').html(data.jhsybbzje);
				$('#DFZC').html(data.jhsydfzczj);
				$('#JHXDWH').html(data.jhxdwh);
				$('#SFSQABLBZ').html(data.sfsqablbz);
				$('#ABLBZWH').html(data.ablbzsqwh);
				$('#JHRemarks').html(data.remarks);
				fileShow();
			}
		});
		/*$.ajax({
			type:'post',
			url:'../../../jhgl/queryXjls.do',
			async:false,
			data:lxls,
			dataType:'json',
			success:function(data){
				if(data.length>0){
					$.each(data,function(index,jh){
						var a='<a href="javascript:onclickXx('+"'"+jh.remarks+"','"+jh.id+"'"+')" style="color:#0066CB;font-size:12px;">';
						a+=jh.jhnf+'年,'+jh.xmmc+'【';
						$.each(jh.plan_lx_gcsjs,function(index,lx){
							a+=lx.lxbm+'('+lx.qdzh+'-'+lx.zdzh+')';
						});
						a+='】</a>';
						if(index<data.length-1){
							a+="；";
						}
						$('#divPlan').append(a);
					});
				}else{
					$('#divPlan').append("暂无历史记录！");
				}
			}
		});*/
	});
	function closeWindow(id){
		parent.$('#'+id).window('destroy');
	}
	
	function loadZjxdSumByXmid(){
		$.ajax({
			type:'post',
			url:'/jxzhpt/jhgl/queryZjxdSumByXmid.do',
			data:'zjxd.xmid='+parent.obj1.id,
			dataType:'json',
			success:function(data){
				if(data!=null){
					$('#sl').html(data.xmid);
					$('#xdzj').html(data.xdzj);
				}
			}
		});
	}
	function loadJzxx(){
		var data=parent.obj1;
		$('#xdsj').html(data.xdsj);
		$('#sjkgsj').html(data.sjkgsj);
		$('#yjwgsj').html(data.yjwgsj);
		$('#xdwh').html(data.xdwh);
		$('#sgdw').html(data.sgdw);
		$('#jldw').html(data.jldw);
		$('#jsdw').html(data.jsdw);
	//	$('#zljdwj').html(data.zljdwj);
		$('#htje').html(data.htje);
		$('#gys').html(data.gys);
		$('#wcbtz').html(data.wcbtz);
		$('#wcstz').html(data.wcstz);
		$('#wcztz').html(data.wcztz);
	}
	
	function loadZjxdList(){
		var params={'zjxd.xmid':parent.obj1.id};
		loadZjxdSumByXmid();
		$('#zjxdgrid').datagrid({
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
	</script>
</head>
<body>
	<div id="abgc_xx" style="text-align: left;font-size: 12px;width:100%;">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">安保工程项目基本信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">名称
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lxmc"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">路线编码</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lxbm"></span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">管养单位
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="gydwxx"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">起点桩号
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="qdzh"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">止点桩号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="zdzh"></span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">总里程
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="qzlc"></span> 公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">行政区划代码
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="xzqhdm"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">行政区划名称</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="xzqhmc"></span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">修建/改建年度
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="xjgjnd"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">路线技术等级
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="jsdjxx"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">隐患里程
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="yhlc">5</span> 公里
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">特殊地区
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="tsdq"></span>&nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">项目年份
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="xmnf">2010</span>&nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">项目状态
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="xmzt">待上报</span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">&nbsp;
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">&nbsp;
				</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">隐患内容
				</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="yhnr">2010000000</span> &nbsp;
				</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">备&nbsp;&nbsp;&nbsp;
					注</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="bz"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">安保工程项目审查信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">起点桩号
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="scqdzh"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">止点桩号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="sczdzh"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">总里程
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="sczlc"></span>公里 &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">隐患里程
				</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="scyhlc"></span>公里 &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">方案评估单位
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="fapgdw"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">方案审查单位</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="fascdw"></span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">方案审批时间
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="faspsj"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">审批文号
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="spwh"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">投资估算</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="tzgs"></span> 万元
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">建设性质
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="jsxz"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">建设内容
				</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="jsnr"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">备&nbsp;&nbsp;&nbsp;
					注</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="remarks"></span> &nbsp;
				</td>
			</tr>
			<!-- <tr style="height: 30px;">
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">工可报告
				</td>
				<td id="xz_gkbg"  colspan="5"
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
						<tbody id="gkbgTable"></tbody>
					</table>
				</td>
			</tr> -->
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">施工图设计批复
				</td>
				<td id="xz_sjsgt" colspan="5"
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
						<tbody id="sjsgtTable"></tbody>
					</table>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">安保工程建议计划信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">上报年份
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="jhnfxx"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">计划开工年</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="JHKGSJ"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">计划完工年
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="JHWGSJ"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">计划下达时间
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="JHXDSJ"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">计划完成</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="JHWC_C"></span> 处&nbsp; &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">设计单位
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="SJDW"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">设计批复单位
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="SJPFDW"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">批复文号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="PFWH"></span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">批复时间
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="PFSJ"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">批复总投资
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="JHZTZ"></span> 万元
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">计划使用部补助金额</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="bbz"></span> 万元
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">计划使用地方自筹资金
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="DFZC"></span> 万元
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">&nbsp;计划下达文号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="JHXDWH"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">&nbsp;是否申请按比例补助</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="SFSQABLBZ"></span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">&nbsp;按比例补助申请文号
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="ABLBZWH"></span> &nbsp;
				</td>
			</tr>
			
			<tr style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					备&nbsp;&nbsp;&nbsp;注</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="JHRemarks"></span>&nbsp;
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安防工程资金下达信息
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
            			<table id="zjxdgrid" ></table>
            		</div>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安防工程工程进展信息
				</td>
				
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">实际开工时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjkgsj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">预计完工时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="yjwgsj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划下达文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xdwh"></span></td>
				
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">监理单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jldw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">施工单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sgdw"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">合同金额（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="htje"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">概预算（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" >
					<span id="gys"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">实际完工时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" >
					<span id="sjwgsj"></span></td>
			<!-- 	<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">实际完工时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjwgsj"></span></td> -->
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">完成总投资（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="wcztz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">完成中央投资（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" >
					<span id="wcbtz"></span></td>
			 	<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">完成省投资（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="wcstz"></span></td> 
			</tr>
			<!-- <div id="divBBZJE"></div>
			<tr id="trSY" style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					最近年份历史修建记录
				</td>
			</tr>
			<tr id="trSY1" style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					历史修建记录
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<div id="divPlan"></div>
				</td>
			</tr> -->
		</table>
	</div>
</body>
</html>