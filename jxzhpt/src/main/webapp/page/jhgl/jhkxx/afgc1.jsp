<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目修改</title>
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
	var bz;
	var bl;
	var fd;
	var bzzj;
	var ts;
	var xxId=parent.YMLib.Var.jhbm;
	$(function(){
		loadJzxx();
		loadZjxdSumByXmid();
		loadZjxdList();
		//sbnf("editjhnf");
		$.ajax({
			type:'post',
			url:'../../../jhgl/queryAbgcById.do',
			data:"jh.id="+xxId+"&jh.xmlx=af",
			dataType:'json',
			success:function(data){
				//计划
				$('#jhid').html(data.id);
				$('#editjhnf').html(data.jhnf);
				$('#JHKGSJ').html(data.jhkgsj);
				$('#JHWGSJ').html(data.jhwgsj);
				//$('#JHXDSJ').datebox('setValue',data.xdsj);
				$('#JHWC_C').html(data.jhwc_c);
				$('#SJDW').html(data.sjdw);
				$('#SJPFDW').html(data.sjpfdw);
				$('#PFWH').html(data.pfwh);
				$('#PFSJ').html(data.pfsj);
				$('#JHZTZ').html(data.pfztz);
				$('#bbz').html(data.jhsybbzje);
				$('#DFZC').html(data.jhsydfzczj);
				//$('#JHXDWH').val(data.jhxdwh);
				$('#sfsqablbz1').html(data.sfsqablbz);
				
				$('#ABLBZWH').html(data.ablbzsqwh);

				$('#JHRemarks').html(data.remarks);
				loadscxx(data.sckid);
				//审查库
				$.ajax({
					type:'post',
					url:'../../../xmsck/selectSckabgcById.do',
					dataType:'json',
					data:'sckid='+data.sckid,
					success:function(sck){
						if(sck!=null){
							//基础
							$('#lxmc').html(sck.lxmc);
							$('#lxbm').html(sck.lxbm);
							if(sck.lxbm.substr(0,1)=="X" || sck.lxbm.substr(0,1)=="Y"){
								bz="县乡";
							}else{
								bz="国省";
							}
							$.ajax({
								type:'post',
								url:'../../../jhgl/lwBzbz.do',
								data:"bzbz.xmlx="+"安保"+"&bzbz.lx="+bz,
								dataType:'json',
								success:function(data){
									bz=data.bz;
									bl=data.bl;
									fd=data.fd;
									bzInit();
								}
							}); 
							$('#gydwxx').html(sck.gydw);
							$('#qdzh').html(sck.qdzh);
							$('#zdzh').html(sck.zdzh);
							$('#qzlc').html(sck.qzlc);
							$('#xzqhdm').html(sck.xzqhdm);
							$('#xzqhmc').html(sck.xzqhmc);
							$('#xjgjnd').html(sck.gjxjnd);
							$('#jsdjxx').html(sck.lxjsdj);
							$('#yhlc').html(sck.yhlc);
							$('#tsdq').html(sck.tsdq);
							$('#xmnf').html(sck.xmnf);
							$('#xmzt').html(sck.xmzt);
							$('#yhnr').html(sck.yhnr);
							$('#bz').html(sck.bz);
							//审查
							$('#scqdzh').val(sck.scqdzh);
							$('#sczdzh').val(sck.sczdzh);
							$('#sczlc').val(sck.sczlc);
							$('#scyhlc').val(sck.scyhlc);
							$('#fapgdw').val(sck.fapgdw);
							$('#fascdw').val(sck.fascdw);
							$('#faspsj').datebox('setValue',sck.faspsj);
							$('#spwh').val(sck.spwh);
							$('#tzgs').val(sck.tzgs);
							$('#jsxz').val(sck.jsxz);
							$('#jsnr').val(sck.jsnr);
							$('#remarks').val(sck.scbz);
							$('#sckid').val(data.sckid);
						}
					}
				});
			}
		});
		loadUploadify();
	});
	function downFile(id){
		parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.id="+id;
	}
	function deleteFile(id){
		if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/jhgl/deleteFile.do",
				 dataType : 'json',
				 data : 'uploads.id=' +id,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 fileShow();
					 }else{
						 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
	}

	function loadUploadify(){
		$("#uploadGk").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '../../../js/uploader/uploadify.swf',
			'script' : '../../../jhgl/uploadAbgcFile.do',
			'cancelImg' : '../../../js/uploader/cancel.png',
			'queueID' : 'fileQueue',
			'fileDataName' : 'uploadGk',
			'auto' : false,
			'multi' : false,
			'buttonImg': '../../../js/uploader/bdll.png',
			'simUploadLimit' : 3,
			'sizeLimit' : 100000000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:xls',
			'fileExt' : '',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'uploads.parentid':xxId,
			},
			onComplete : function(event, queueID, fileObj, response, data) {
				alert(response);
				fileShow();
			},
			onError : function(event, queueID, fileObj) {
				alert("文件:" + fileObj.name + "上传失败");
			},
			onCancel : function(event, queueID, fileObj) {
			},
			onQueueFull : function(event, queueSizeLimit) {
				alert("最多支持上传文件数为：" + queueSizeLimit);

			}
		});
		
		$("#uploadSjt").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '../../../js/uploader/uploadify.swf',
			'script' : '../../../jhgl/uploadAbgcFile.do',
			'cancelImg' : '../../../js/uploader/cancel.png',
			'queueID' : 'fileQueue1',
			'fileDataName' : 'uploadSjt',
			'auto' : false,
			'multi' : true,
			'buttonImg': '../../../js/uploader/bdll.png',
			'simUploadLimit' : 3,
			'sizeLimit' : 100000000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:xls',
			'fileExt' : '',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'uploads.parentid':xxId,
			},
			onComplete : function(event, queueID, fileObj, response, data) {
				alert(response);
				fileShow();
			},
			onError : function(event, queueID, fileObj) {
				alert("文件:" + fileObj.name + "上传失败");
			},
			onCancel : function(event, queueID, fileObj) {
			},
			onQueueFull : function(event, queueSizeLimit) {
				alert("最多支持上传文件数为：" + queueSizeLimit);

			}
		});
	}
	
		function bzInit(){
			if($("input[name='sfsqablbz']:checked").val()=="否"){
				document.getElementById("ABLBZWH").disabled=true;
			}
			ztz=(parseFloat($("#JHZTZ").val())*bl*1000000000000000+parseFloat(fd)*1000000000000000)/1000000000000000;
			bzzj=(parseFloat($("#scyhlc").val())*1000000000000000*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
			if($("#jhztz").val()!="" || $("#jhztz").val()!=null){
				if(ztz*1000000000000000>=bzzj*1000000000000000){
					ts=bzzj.toFixed(3);
					$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
				}else{
					ts=ztz.toFixed(3);
					$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
				}
			}
			
		}
		function bzSum(){
			var ztz;
			if(isNaN($("#JHZTZ").val())){
				alert("请输入投资金额！");
				$("#JHZTZ").focus();
				return;
			}
			ztz=(parseFloat($("#JHZTZ").val())*bl*1000000000000000+parseFloat(fd)*1000000000000000)/1000000000000000;
			bzzj=(parseFloat($("#scyhlc").val())*1000000000000000*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
			if(ztz*1000000000000000>=bzzj*1000000000000000){
				ts=bzzj.toFixed(3);
				$("#bbz").val(bzzj.toFixed(3));
				$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
				$("#DFZC").html((parseFloat($("#JHZTZ").val())-bzzj.toFixed(3)).toFixed(3));
			}else{
				ts=ztz.toFixed(3);
				$("#bbz").val(ztz.toFixed(3));
				$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
				$("#DFZC").html((parseFloat($("#JHZTZ").val())-ztz.toFixed(3)).toFixed(3));
			}
			if(parseFloat($("#JHZTZ").val())*10000>=500*10000){
				$("#sfsqablbz0").attr('checked','true');
				document.getElementById("ABLBZWH").disabled=false;
			}else{
				$("#sfsqablbz1").attr('checked','true');
				$("#ABLBZWH").val("");
				document.getElementById("ABLBZWH").disabled=true;
			}
		}
		function zjSum(){
			if($("#bbz").val()*1000>ts*1000){
				alert("补助金额不能大于"+ts+"万元");
				$("#bbz").val("");
				$("#bbz").focus();
				return;
			}
			if(isNaN($("#bbz").val()) || $("#bbz").val()==""){
				alert("请填写补助金额");
				$("#bbz").val("");
				$("#bbz").focus();
				return;
			}
			$("#DFZC").html((parseFloat($("#JHZTZ").val())-$("#bbz").val()).toFixed(3));
		}
		
		function ablwhDis(value){
			if(value=="是"){
				$('#ABLBZWH').removeAttr("disabled");
			}else{
				$('#ABLBZWH').attr("disabled",'true');
			}
		}
		
		var xmkid;
		var xmbm;
		function showLd(xmbm1){
			$("#ldgrid").datagrid({    
				 url:'/jxzhpt/aqsmfh/selectSckaqsmfhld1.do',
				 queryParams : {
					 	'xmkaqsmfh.xmbm':xmbm1
					},
				    striped:true,
				   // pagination:true,
				   // rownumbers:true,
				    pageNumber:1,
				    pageSize:20,
			    columns:[[        
					
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
		function loadscxx(id){
			$.ajax({
				type:'post',
				url:'/jxzhpt/aqsmfh/selectAqsmfhsckbyid.do',
		        data:"xmkaqsmfh.id="+id,
				dataType:'json',
				success:function(item){
					if(item!=null){
						tjldobj=item;
						//审查
						xmbm=item.xmbm;
						showLd(item.xmbm);
						fileShow(item.xmbm);
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
						$("#nsqbbz").html(item.nsqbbz);
					}
				}
			});
		}
		
		var xmkid;
		function ckxxld(id){
			xmkid=id;
			YMLib.UI.createWindow('lxxx','项目路段信息','aqsmfhld_ck.jsp','lxxx',700,400);
		}
		
		
		function fileShow(xmbm1){
			//加载文件
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryFjByParentId.do',
				dataType:'json',
				data:'uploads.id='+xmbm1,
				success:function(data){
			/* 		var data=datas.rows; */
				/* 	alert(data); */
					$("#gkbgTable").empty();
					$("#sjsgtTable").empty();
					var gkbg="";
					var sjsgt="";
					for ( var i = 0; i < data.length; i++) {
						if(data[i].filetype=="工可报告"){
							gkbg += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"+
							'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')">下载</a>  ';
						}if(data[i].filetype=="设计施工图"){
							sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"+
							'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')">下载</a>  ';
						}
					}
					$("#gkbgTable").append(gkbg);
					$("#sjsgtTable").append(sjsgt);
				}
			});
		}
		function downFile(fileurl,filename){
			parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
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
	</script>
</head>
<body>
	<div id="abgc_xx" style="text-align: left;font-size: 12px;width:100%;">
		<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;" >
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 150px; padding-left: 10px;">
						安防工程路段信息
					</td>
				</tr>
				<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff; height: 20px;" align="center">
					<table id="ldgrid" width="100%" ></table>
					</td>				
				</tr>
	
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 150px; padding-left: 10px;">
					安防工程审查信息
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
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold; align="right">拟申请部(省)补助(单位:万元,保留整数)：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px; align="left">
					 <span id='nsqbbz'></span></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id='jsnr'> </span></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">备注(批复文件路线编码及桩号如为老编码，需在备注栏说明)：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<textarea id='bz' rows="2" style="width:99%" readonly="readonly"></textarea>

				</td>
				
			</tr>	
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">施工图设计批复：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
						<tbody id="sjsgtTable"></tbody>
					</table>
				</td>
			</tr>

			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 150px; padding-left: 10px;">
					安防工程计划信息
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">上报年份
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span  id="editjhnf"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划开工年</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="JHKGSJ"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划完工年
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="JHWGSJ"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划完成</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="JHWC_C"></span> 处
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">设计单位
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="SJDW"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">设计批复单位
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="SJPFDW"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">批复文号</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="PFWH"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">批复时间
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="PFSJ"></span>
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">批复总投资
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="JHZTZ"></span>万元
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划使用部补助金额</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="bbz" ></span>万元
					
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划使用地方自筹资金
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="DFZC"></span> 万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">是否申请按比例补助</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="sfsqablbz1"></span>	
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">按比例补助申请文号
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="ABLBZWH"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				</tr>

			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">备&nbsp;&nbsp;&nbsp;注</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="JHRemarks"></span>
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
            			<table id="zjxfgrid" ></table>
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
				<td style="background-color: #ffffff; height: 20px;" align="left" colspan="3">
					<span id="gys"></span></td>
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
			<!-- <tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">施工许可（附件上传）：</td>
				<td id="td_sgxk" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="sgxkTable"></tbody>
					</table>
					
				</td>
			</tr> -->
		</table>
	</div>
</body>
</html>
