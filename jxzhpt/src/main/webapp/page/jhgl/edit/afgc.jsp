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
		sbnf("editjhnf");
		$.ajax({
			type:'post',
			url:'../../../jhgl/queryAbgcById.do',
			data:"jh.id="+xxId+"&jh.xmlx=af",
			dataType:'json',
			success:function(data){
				//计划
				$('#jhid').val(data.id);
				$('#editjhnf').combobox('select',data.jhnf);
				$('#JHKGSJ').datebox('setValue',data.jhkgsj);
				$('#JHWGSJ').datebox('setValue',data.jhwgsj);
				//$('#JHXDSJ').datebox('setValue',data.xdsj);
				$('#JHWC_C').val(data.jhwc_c);
				$('#SJDW').val(data.sjdw);
				$('#SJPFDW').val(data.sjpfdw);
				$('#PFWH').val(data.pfwh);
				$('#PFSJ').datebox('setValue',data.pfsj);
				$('#JHZTZ').val(data.pfztz);
				$('#bbz').val(data.jhsybbzje);
				$('#DFZC').html(data.jhsydfzczj);
				//$('#JHXDWH').val(data.jhxdwh);
				radioChecked("sfsqablbz",data.sfsqablbz);
				if(data.sfsqablbz=="否"){
					$('#ABLBZWH').attr("disabled",'true');
				}
				$('#ABLBZWH').val(data.ablbzsqwh);
				$('#JHRemarks').val(data.remarks);
				loadscxx(data.sckid);
				//审查库
				
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
			bzzj=(parseFloat($("#czzlc").html())*1000000000000000*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
			if($("#jhztz").val()!="" || $("#jhztz").val()!=null){
				if(ztz*1000000000000000<bzzj*1000000000000000){
					ts=ztz.toFixed(0);
					$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
				}else{
					ts=bzzj.toFixed(0);
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
			bzzj=(parseFloat($("#czzlc").html())*1000000000000000*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
			if(ztz*1000000000000000<bzzj*1000000000000000){
				ts=ztz.toFixed(0);
				$("#bbz").val(ts);
				$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
				$("#DFZC").html((parseFloat($("#JHZTZ").val())-ts).toFixed(0));
			}else{
				ts=bzzj.toFixed(0);
				$("#bbz").val(bzzj.toFixed(0));
				$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
				$("#DFZC").html((parseFloat($("#JHZTZ").val())-bzzj.toFixed(0)).toFixed(0));
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
			$("#DFZC").html((parseFloat($("#JHZTZ").val())-$("#bbz").val()).toFixed(0));
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
						$("#qdzh").html(item.qdzh);$("#zdzh").html(item.zdzh);
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
						$("#ylxmc").html(item.ylxmc);
						$("#lxbm").html(item.lxbm);
						$("#ylxbm").html(item.ylxbm);
						$("#yqdzh").html(item.yqdzh);
						$("#yzdzh").html(item.yzdzh);
						
						//

							if(item.lxbm.substr(0,1)=="X" || item.lxbm.substr(0,1)=="Y"){
								bz="县乡";
							}else{
								bz="国省";
							}
							$.ajax({
								type:'post',
								url:'../../../jhgl/getafBzbz.do',
								data:"bzbz.xmlx="+item.xzqh+"&bzbz.lx="+bz,
								dataType:'json',
								success:function(data){
									if(data.bz==7){
										bl=0.85;
									}else{
										bl=data.bl;
									}
									bz=data.bz;
									//bl=data.bl;
									fd=data.fd;
									bzInit();
								}
							}); 

						//
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
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">技术等级：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="scjsdj"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">规划路线名称：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="lxmc"></span></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:110px" align="right">原路线名称：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="ylxmc"></span></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:110px" align="right"></td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">

			</tr>
					
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">规划路线编码：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="lxbm"></span></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">规划起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="qdzh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">规划止点桩号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<span id="zdzh"></span></td>
			</tr>
			
			<tr style="height: 35px;">
			
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:110px" align="right">原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="ylxbm"></span></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:110px" align="right">原起点桩号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="yqdzh"></span></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:110px" align="right">原止点桩号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<span id="yzdzh"></span></td>		
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
					<select id="editjhnf" class="easyui-combobox" style="width: 60px;"></select> &nbsp;
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划开工年</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<input id="JHKGSJ" type="text" style="width: 100px;" class="easyui-datebox"></input>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划完工年
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<input id="JHWGSJ" type="text" style="width: 100px;" class="easyui-datebox"></input>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划完成</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<input type="text" id="JHWC_C" style="width: 100px;"/> 处
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">设计单位
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<input type="text" id="SJDW" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">设计批复单位
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<input type="text" id="SJPFDW" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">批复文号</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<input type="text" id="PFWH" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">批复时间
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<input id="PFSJ" type="text" class="easyui-datebox" style="width: 100px;"></input>
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">批复总投资
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
					<input type="text" id="JHZTZ" onblur="bzSum()" style="width: 120px;"></input> 万元
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">计划使用部补助金额</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<input type="text" id="bbz" onblur="zjSum()" style="width: 120px;"/>万元
					<br/><span id="bbzts"></span>
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
					<input id="sfsqablbz0" type="radio" onchange="ablwhDis('是')" name="sfsqablbz" value="是"/>是
					<input id="sfsqablbz1" type="radio" onchange="ablwhDis('否')" name="sfsqablbz" value="否"/>否
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">按比例补助申请文号
				</td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<input type="text" id="ABLBZWH" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:180px" align="left">
				</tr>

			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">备&nbsp;&nbsp;&nbsp;注</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:180px" align="left">
				<textarea id="JHRemarks" style="width: 700px;height: 40px;"></textarea> &nbsp;
				</td>
			</tr>
			<div id="divBBZJE"></div>
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff; height: 30px;"
					align="center">
					<img alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " onclick="editAbgc('af')" />
                	<input type="hidden" id="jhid"/>
                </td>
            </tr>
		</table>
	</div>
</body>
</html>
