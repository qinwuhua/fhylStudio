<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部反馈编辑</title>
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/jquery-form.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
	<script type="text/javascript" src="/jxzhpt/page/qqgl/js/util.js"></script>
	<script type="text/javascript">
	$(function(){
		$.ajax({
			type:'post',
			url:'../../../qqgl/queryJhshxxByXmbm.do',
			data:'jhsh.xmlx='+parent.YMLib.Var.xmbm.substr(10,1)+'&jhsh.xmbm='+parent.YMLib.Var.xmbm,
			dataType:'json',
			success:function(data){
				$('#jhxdFrom').form("load",data);
				$('#xmklx').val(data.xmklx);
				$('#xmlx').val(parent.YMLib.Var.xmbm.substr(10,1));
				$('#gldj1').combobox('setValue',data.gldj);
				$('#xdzt').val("1");
				$('#yjgd').val(isNull(data.yjgd));
				$('#ejgd').val(isNull(data.ejgd));
				$('#yjsd').val(isNull(data.yjsd));
				$('#ejsd').val(isNull(data.ejsd));
				$('#sjsd').val(isNull(data.sjsd));
				$('#yjgdql').val(isNull(data.yjgdql));
				$('#ejgdql').val(isNull(data.ejgdql));
				$('#yjsdql').val(isNull(data.yjsdql));
				$('#ejsdql').val(isNull(data.ejsdql));
				$('#sjsdql').val(isNull(data.sjsdql));
				$('#yjgdsd').val(isNull(data.yjgdsd));
				$('#ejgdsd').val(isNull(data.ejgdsd));
				$('#yjsdsd').val(isNull(data.yjsdsd));
				$('#ejsdsd').val(isNull(data.ejsdsd));
				$('#sjsdsd').val(isNull(data.sjsdsd));
				$('#tsdq').val(data.tsdq);
				$('#xzqh').val(data.xzqh);
				queryBbzzj();
			}
		});
	});
	
	function updataJhsh(){
		var result =true;
		result = validateText('pfztz','number',result);
		//result = validateText('bbzzj','number',result);
		//result = validateText('sbzzj','number',result);
		if(!true){
			return;
		}
		alert("确定要保存当前数据吗？");
		$('#jhxdFrom').ajaxSubmit({
			dataType:'json',
			success:function(msg){
				if(msg.result){
					alert("保存成功！");
					parent.$("#grid").datagrid('reload');
					closeWindow("bfkgsdgz");
				}
			},
			error:function(msg){
				alert("保存失败！");
			}
		});
	}
	function queryBbzzj(){
		
		var tsdq =  $('#tsdq').val();
		var xzqh = $('#xzqh').val();
		
		var tsdqbz = contains($('#tsdq').val(),"原中央苏区");
		var xzqhbz = contains($('#xzqh').val(),"赣州市");		
		
		var yjgd = $('#yjgd').val();var ejgd = $('#ejgd').val();
		var yjsd = $('#yjsd').val();var ejsd = $('#ejsd').val();var sjsd = $('#sjsd').val();
		var yjgdql = $('#yjgdql').val();var ejgdql = $('#ejgdql').val();
		var yjsdql = $('#yjsdql').val();var ejsdql = $('#ejsdql').val();var sjsdql = $('#sjsdql').val();
		var yjgdsd = $('#yjgdsd').val();var ejgdsd = $('#ejgdsd').val();
		var yjsdsd = $('#yjsdsd').val();var ejsdsd = $('#ejsdsd').val();var sjsdsd = $('#sjsdsd').val();
		
		//路总金额
		var lxgd = accAdd(accMul(yjgd,1000),accMul(ejgd,500));
		var lxsd = accAdd(accAdd(accMul(yjsd,350),accMul(ejsd,350)),accMul(sjsd,150));
		
		if(true == tsdqbz && false == xzqhbz){
			lxsd = accSub(lxsd,1.2);
		} 
		if(false == tsdqbz && true == xzqhbz){
			lxsd = accSub(lxsd,1.1);
		}
		if(true == tsdqbz && true == xzqhbz){
			lxsd = accSub(accSub(lxsd,1.2),1.1);
		}
		var lx = accAdd(lxgd,lxsd);
		//alert("lx = " + lx);
		
        //独立桥梁总金额
        var qlgd = accAdd(accDiv(accMul(accMul(yjgdql,21),3000),10000),accDiv(accMul(accMul(ejgdql,21),3000),10000));
        var qlsd = accAdd(accAdd(accDiv(accMul(accMul(yjsdql,8),3000),10000),accDiv(accMul(accMul(ejsdql,8),3000),10000)),accDiv(accMul(accMul(sjsdql,8),3000),10000));
        var ql = accAdd(qlgd,qlsd);
        //alert("ql = " + ql);
        
        //独立隧道总金额        
        var sdgd = accAdd(accDiv( accMul(accMul(yjgdsd,21) ,3000 ),10000 ),accDiv(accMul(accMul(ejgdsd,21),3000),10000));
        var sdsd = accAdd(accAdd(accDiv(accMul(accMul(yjsdsd,8),3000),10000),accDiv(accMul(accMul(ejsdsd,8),3000),10000)),accDiv(accMul(accMul(sjsdsd,8),3000),10000));
        var sd = accAdd(sdgd,sdsd);
        //alert("sd = " + sd);
        
        //按路程标准补助桥梁
        var qlgdbz = accAdd(accMul(accDiv(yjgdql,1000),1000),accMul(accDiv(ejgdql,1000),500));
        var qlsdbz = accAdd(accAdd(accMul(accDiv(yjsdql,1000),350),accMul(accDiv(ejsdql,1000),350)),accMul(accDiv(sjsdql,1000),150));
        var qlbz = accAdd(qlgdbz,qlsdbz);
        //alert("qlbz = " + qlbz);
        
        //按路程标准补助隧道
        var sdgdbz = accAdd(accMul(accDiv(yjgdsd,1000),1000),accMul(accDiv(ejgdsd,1000),500));
        var sdsdbz = accAdd(accAdd(accMul(accDiv(yjsdsd,1000),350),accMul(accDiv(ejsdsd,1000),350)),accMul(accDiv(sjsdsd,1000),150));
        var sdbz = accAdd(sdgdbz,sdsdbz);   
        //alert("sdbz = " + sdbz);
        
        //总的金额
        var bbzzj = accSub( accAdd(lx,accAdd(ql,sd)) , accAdd(qlbz,sdbz) ); 
        $('#csbbzzj').val(bbzzj);
	}

	function isNull(data){ 
		return (data == "" || data == undefined || data == null) ? "0" : data;
		}
	
	function contains(str1,str2){
		if(str1 == "" || str1 == undefined || str1 == null){
			return false;
		}else{
			var data = str1.split(",");
		        for(var i = 0;i < data.length;i++){	
		            if(data[i].match(str2+".*") != null){
		            	return true;
	 	            }
		        }
		        return false;
		}
}
    </script>
</head>
<body>
     <center>
		<table width="98%" height="60%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; margin-left: 13px;">
			<tr>
				<td>
					<form id="jhxdFrom" action="../../../qqgl/updateJhshxx.do" method="post">
					<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">批复总投资：</font></b>
								<input id="xmbm" name="xmbm" type="hidden"/>
								<input id="xmlx" name="xmlx" type="hidden"/>
								<input id="xdzt" name="xdzt" value="1" type="hidden"/>
								<input id="tsdq" name="tsdq" type="hidden"/>
								<input id="xzqh" name="xzqh" type="hidden"/>		
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="pfztz" name="pfztz" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">车购税：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="bbzzj" name="bbzzj" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元<br/>
								（<input id="csbbzzj" name="csbbzzj" class="easyui-numberbox" type="text" style="width: 80px;height: 20px;border:0px;" readonly="readonly"/>）万元
							</td>
			 				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">国债：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="gz" name="gz" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
						</tr>
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">省债：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="sz" name="sz" type="text" class="easyui-numberbox" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">债券：</font></b>
								
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="zq" name="zq" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">厅贷款：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="dk" name="dk" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							
						</tr>
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">奖励：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="jl" name="jl" type="text" class="easyui-numberbox" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">其他：</font></b>
								
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="qt" name="qt" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							<b><font color="#009ACD" style="cursor: hand; font-size: 12px">地方自筹：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input type="text" id='dfzc' name="dfzc" class="easyui-numberbox" value="0" style="width: 100px;height: 20px;" data-options="panelHeight:'50'">
							</td>
						</tr>
						
						<tr style="height: 30px;font-size: 10px;">							
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							<b><font color="#009ACD" style="cursor: hand; font-size: 12px">银行贷款：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input type="text" id='yhdk' name="yhdk" class="easyui-numberbox" value="0" style="width: 100px;height: 20px;" data-options="panelHeight:'50'">
								
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">重要度排序：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="zydpx" name="zydpx" type="text" class="easyui-numberbox"   style="width: 100px;height: 20px;" />
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">项目库类型：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="xmklx" name="xmlkx" style="width: 120px;background-color: #EDEDED;" readonly="readonly"/>
							</td>
						</tr>
  
                        <tr style="height: 30px;font-size: 10px;">
						<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							<b><font color="#009ACD" style="cursor: hand; font-size: 12px">项目里程：</font></b>
							</td>
				        <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;" align="left">
				           	  一级国道：<input id="yjgd" onchange="queryBbzzj()" name="yjgd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>
					                二级国道：<input id="ejgd" onchange="queryBbzzj()" name="ejgd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>   
				        <br/><div style="margin-bottom:2px;"></div>
					                一级省道：<input id="yjsd" onchange="queryBbzzj()" name="yjsd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>
					                二级省道：<input id="ejsd" onchange="queryBbzzj()" name="ejsd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>   
					                三级省道：<input id="sjsd" onchange="queryBbzzj()" name="sjsd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>
				        </td>
						</tr>
							<tr style="height: 30px;font-size: 10px;">
						<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							<b><font color="#009ACD" style="cursor: hand; font-size: 12px">独立桥梁（延米）：</font></b>
							</td>
				        <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;" align="left">
				           	 一级国道：<input id="yjgdql" onchange="queryBbzzj()" name="yjgdql" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>
					                二级国道：<input id="ejgdql" onchange="queryBbzzj()" name="ejgdql" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>   
				        <br/><div style="margin-bottom:2px;"></div>
					                一级省道：<input id="yjsdql" onchange="queryBbzzj()" name="yjsdql" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>
					                二级省道：<input id="ejsdql" onchange="queryBbzzj()" name="ejsdql" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>   
					                三级省道：<input id="sjsdql" onchange="queryBbzzj()" name="sjsdql" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>					                   
				        </td>
						</tr>
						<tr style="height: 30px;font-size: 10px;">
						<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							<b><font color="#009ACD" style="cursor: hand; font-size: 12px">独立隧道（延米）：</font></b>
							</td>
				        <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;" align="left">
				           	  一级国道：<input id="yjgdsd" onchange="queryBbzzj()" name="yjgdsd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>
					                二级国道：<input id="ejgdsd" onchange="queryBbzzj()" name="ejgdsd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>   
				        <br/><div style="margin-bottom:2px;"></div>
					                一级省道：<input id="yjsdsd" onchange="queryBbzzj()" name="yjsdsd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>
					                二级省道：<input id="ejsdsd" onchange="queryBbzzj()" name="ejsdsd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>   
					                三级省道：<input id="sjsdsd" onchange="queryBbzzj()" name="sjsdsd" style="width: 50px;" type="text" class="easyui-numberbox" value="0" data-options="min:0,precision:3"/>					                   
				        </td>
						</tr>			
						<tr style="height: 30px;font-size: 10px;">
						<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							<b><font color="#009ACD" style="cursor: hand; font-size: 12px">主要建设内容：</font></b>
							</td>
							<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="zyjsnr" name="zyjsnr" type="text" style="width: 70%"/>
							</td>
						</tr>
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							<b><font color="#009ACD" style="cursor: hand; font-size: 12px">新增能力：</font></b>
							</td>
							<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
									<input id="xzscnl" name="xzscnl" type="text" style="width: 70%"/>
							</td>
						</tr>

					</table>
					<table width="98%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 30px;">
							<td align="center">
							<td align="center">
								<img onclick="updataJhsh()" alt="保存" onmouseover="this.src='../../../images/Button/baocun2.gif'" onmouseout="this.src='../../../images/Button/baocun1.gif'"
									src="../../../images/Button/baocun1.gif">
								&nbsp; 
								<input type="image" name="btnCancel" id="btnCancel" onmouseover="this.src='../../../images/Button/fanhui2.GIF'" alt="返回"
								onclick="closeWindow('bfkgsdgz')" onmouseout="this.src='../../../images/Button/fanhui1.GIF'"
								src="../../../images/Button/fanhui1.GIF" style="border-width: 0px;" />
							</td>
						</tr>
					</table>
					</form>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>