<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>基础库管理安保工程项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/util.js"></script>
	<style type="text/css">
		TD {font-size: 12px;} 
		a{text-decoration:none;}
	</style>
	<script type="text/javascript">
		var qdStr;
		var zdStr;
		$(function(){
			//十三五补助标准选择复选框只选其中一个
			var groupCheckbox=$("input[name='bzbzs']");
			groupCheckbox.click(function () {
	               if(this.checked || this.checked=='checked'){
	            	   groupCheckbox.removeAttr("checked");
	                   $(this).attr("checked", true);
	                 }
	        });				
			queryyhdzxsfdj();
			loadDistadd("xzqh",$.cookie("dist"));
			loadUnitadd("gydw",$.cookie("unit"));
			$('#xmbm').html(parent.YMLib.Var.xmbm);
			//$('#jsxz').val(parent.YMLib.Var.gcfl);
			$('#jdbs').val(parent.YMLib.Var.jdbs);
			autoCompleteGHLXBM();
		});
		
		function updateLx(){
			var redqdzh = $("#span_qdzh").text().substr(5,$("#span_qdzh").text().length);
			var redzdzh = $("#span_zdzh").text().substr(5,$("#span_zdzh").text().length);
			//alert(redqdzh+"  "+redzdzh);
			 if(parseFloat($("#ghqdzh").val())*1000<redqdzh*1000){
				alert("对不起，起点桩号不能小于"+redqdzh+"！");
				$("#ghqdzh").focus();
				return false;
			}
			if(parseFloat($("#ghzdzh").val())*1000>redzdzh*1000){
				alert("对不起，止点桩号不能大于"+redzdzh+"！");
				$("#ghzdzh").focus();
				return false;
			} 
			 if(parseFloat($("#ghqdzh").val())*1000>parseFloat($("#ghzdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#ghqdzh").focus();
				return false;
			} 
			 
			$('#bzlx135').val("");
         	$('#bzje135').val("");
				var groupCheckbox=$("input[name='bzbzs']");
			    for(i=0;i<groupCheckbox.length;i++){
			        if(groupCheckbox[i].checked){
			            var id =groupCheckbox[i].id;
	                    if(id=="dxxz"){
	                    	$('#bzlx135').val("1");
	                    	$('#bzje135').val($('#dxbz').val());
	                    }
	                    if(id=="zxxz"){
	                    	$('#bzlx135').val("2");
	                    	$('#bzje135').val($('#zxbz').val());
	                    	
	                    }
	                    if(id=="yfxyhxz"){
			            	$('#bzlx135').val("3");
	                    	$('#bzje135').val($('#yfxyhbz').val());
			            }
			        }
			    }  
			 
			
			var params={'lx.jdbs':$('#jdbs').val(),'lx.xmid':$('#xmbm').html(),'lx.lxmc':$('#lxmc').val(),
					'lx.lxbm':$('#ylxbh').val(),'lx.zdzh':$('#zdzh').val(),'lx.qdzh':$('#qdzh').val(),
					'lx.lc':$('#lc').val(),'lx.qdmc':$('#qdmc').val(),'lx.zdmc':$('#zdmc').val(),'lx.jsxz':$('#jsxz').val(),
					'lx.gydw':$('#gydw').combobox("getText"),'lx.gydwdm':$('#gydw').combobox("getValues").join(','),
					'lx.xzqh':$('#xzqh').combobox("getText"),'lx.xzqhdm':$('#xzqh').combobox("getValues").join(','),
					'lx.yilc':$('#yilc').val(),'lx.erlc':$('#erlc').val(),'lx.sanlc':$('#sanlc').val(),
					'lx.silc':$('#silc').val(),'lx.dwlc':$('#dwlc').val(),'lx.wllc':$('#wllc').val(),
					'lx.jsjsdj':$('#jsjsdj').val(),'lx.xjsdj':$('#jsdj').val(),'lx.jsfa':$('#jsfa').val(),
					'lx.lqhntmc':$('#lqhntmc').val(),'lx.gxlqhntmc':$('#gxlqhntmc').val(),'lx.snhntmc':$('#snhntmc').val()
					,'lx.lqlmjdrzs':$('#lqlmjdrzs').val(),'lx.lqlmcbrzs':$('#lqlmcbrzs').val(),'lx.swjc':$('#swjc').val()
					,'lx.lqlmpmlqjdlzs':$('#lqlmpmlqjdlzs').val(),'lx.lqlmrhlqjdlzs':$('#lqlmrhlqjdlzs').val(),'lx.lqlmcblzs':$('#lqlmcblzs').val()
					,'lx.xzrxjc':$('#xzrxjc').val(),'lx.swjclzs':$('#swjclzs').val(),'lx.xfc':$('#xfc').val()
					,'lx.wcsnmb':$('#wcsnmb').val(),'lx.wcswjc':$('#wcswjc').val(),'lx.snhntmchb':$('#snhntmchb').val()
					,'lx.bx':$('#bx').val(),'lx.snhntmcssh':$('#snhntmcssh').val(),
					'lx.lqhntmchd':$('#lqhntmchd').val(),'lx.gxlqhntmchd':$('#gxlqhntmchd').val(),'lx.snhntmchd':$('#snhntmchd').val()
					,'lx.lqlmjdrzshd':$('#lqlmjdrzshd').val(),'lx.lqlmcbrzshd':$('#lqlmcbrzshd').val(),'lx.swjchd':$('#swjchd').val()
					,'lx.lqlmpmlqjdlzshd':$('#lqlmpmlqjdlzshd').val(),'lx.lqlmrhlqjdlzshd':$('#lqlmrhlqjdlzshd').val(),'lx.lqlmcblzshd':$('#lqlmcblzshd').val()
					,'lx.xzrxjchd':$('#xzrxjchd').val(),'lx.swjclzshd':$('#swjclzshd').val(),'lx.xfchd':$('#xfchd').val()
					,'lx.wcsnmbhd':$('#wcsnmbhd').val(),'lx.wcswjchd':$('#wcswjchd').val(),'lx.snhntmchbhd':$('#snhntmchbhd').val(),'lx.snhntmchbmj':$('#snhntmchbmj').val()
					,'lx.bxhd':$('#bxhd').val(),'lx.snhntmcsshhd':$('#snhntmcsshhd').val(),'lx.sbzj':$('#sbzj').val(),'lx.lmkd':$('#lmkd').val()
					,"lx.ghlxmc":$('#ghlxmc').val(),"lx.ghlxbm":$('#ghlxbm').val(),"lx.ghqdzh":$('#ghqdzh').val(),"lx.ghzdzh":$('#ghzdzh').val()
					,"lx.gpsqdzh":$('#gpsqdzh').val(),"lx.gpszdzh":$('#gpszdzh').val()
					,"lx.gxlxbm":$('#gxlxbm').val(),"lx.gxqdzh":$('#gxqdzh').val(),"lx.gxzdzh":$('#gxzdzh').val()                              
					,'lx.fcbc30hd':$('#fcbc30hd').val(),'lx.bc6hd':$('#bc6hd').val(),'lx.bc25hd':$('#bc25hd').val()
					,'lx.bc30hd':$('#bc30hd').val(),'lx.bmc25hd':$('#bmc25hd').val(),'lx.wfchd':$('#wfchd').val()
					,'lx.xjfchd':$('#xjfchd').val()
					,'lx.fcbc30':$('#fcbc30').val(),'lx.fcbc30hd':$('#fcbc30hd').val()
					,'lx.bc6':$('#bc6').val(),'lx.bc6hd':$('#bc6hd').val()
					,'lx.bc25':$('#bc25').val(),'lx.bc25hd':$('#bc25hd').val()
					,'lx.bc30':$('#bc30').val(),'lx.bc30hd':$('#bc30hd').val()
					,'lx.bmc25':$('#bmc25').val(),'lx.bmc25hd':$('#bmc25hd').val()
					,'lx.wfc':$('#wfc').val(),'lx.wfchd':$('#wfchd').val()
					,'lx.xjfc':$('#xjfc').val(),'lx.xjfchd':$('#xjfchd').val()
					,'lx.wbc':$('#wbc').val(),'lx.wbchd':$('#wbchd').val()
			        ,'lx.bzlx135':$('#bzlx135').val(),'lx.bzje135':$('#bzje135').val()
			};
			if($('#xzqh').combo("getValues").join(",")==""){
				alert("请选择行政区划！");
				return false;
			}
			if($('#gydw').combo("getValues").join(',')==""){
				alert("请选择管养单位！");
				return false;
			}
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/insertLx.do',
		        data:params,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						alert("保存成功!");
						if(parent.YMLib.Var.xmbm.substring(10,11)=="4"){
							parent.queryYhdzx();
						}else if(parent.YMLib.Var.xmbm.substring(10,11)=="5"){
							parent.queryShxm();
						}
						closeWindow(parent.YMLib.Var.id);
					}else if(msg.result=="have"){
						alert("路线 "+$('#ylxbh').val()+"【"+$('#qdzh').val()+"-"+$('#zdzh').val()+"】已存在"+panduanxmlx(msg.lx.xmid)+"【"+msg.lx.xmmc+"】"+"中！");
					}else{
						alert("保存失败！");
					}
				}
			});
		}
		function changeZlc(){
			/* if(parseFloat($("#qdzh").val())>parseFloat(zdStr)){
				alert("起点桩号不能大于止点桩号");
				$("#qdzh").val(qdStr);
			}
			if(parseFloat($("#zdzh").val())<parseFloat(qdStr)){
				alert("止点桩号不能小于起点桩号");
				$("#zdzh").val(zdStr);
			} */
			var zlcs=accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val()));var zlc=Math.abs(zlcs);
			queryJsdjAndLc($('#ghlxbm').val(),$("#ghqdzh").val(),$("#ghzdzh").val());
			$("#lc").val(zlc);
			
			
			if(parseFloat($('#ghqdzh').val())<parseFloat($('#ghzdzh').val()))
			getylxlminfo($('#ghlxbm').val(),$('#ghqdzh').val(),$('#ghzdzh').val());
			else
			getylxlminfo($('#ghlxbm').val(),$('#ghzdzh').val(),$('#ghqdzh').val());

			
			//selectTSDQ($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
			if($("#ghqdzh").val()!='')
				cxqdmc($("#ghlxbm").val(),$("#ghqdzh").val());
			if($("#ghzdzh").val()!='')
				cxzdmc($("#ghlxbm").val(),$("#ghzdzh").val());

		}
		function removes(){
			closeWindow(parent.YMLib.Var.id);
		}
		
		//十三五补助标准
		function bzbz(flag){
			if("dxxz" == flag){
				if($('#dxxz').is(':checked')){
	 				if($('#ghlxbm').val().substring(0,1) == "G"){
		                $('#dxbz').val(accMul(accMul(accMul($('#lc').val(),$('#lmkd').val()),0.7),26));
					}else if($('#ghlxbm').val().substring(0,1) == "S"){
		                $('#dxbz').val(accMul(accMul(accMul($('#lc').val(),$('#lmkd').val()),0.7),21));
					}else{
						$('#dxbz').val("0");
					}
					$('#zxbz').val("");
					$('#yfxyhbz').val(""); 
					//$('#bzje').val($('#dxbz').val()); 
				}else{
					$('#dxbz').val("");
				}
			}
			if("zxxz" == flag){
				if($('#zxxz').is(':checked')){
                $('#zxbz').val(accMul($('#lc').val(),70));
                $('#dxbz').val("");
                $('#yfxyhbz').val("");
				//$('#bzje').val($('#zxbz').val()); 
                //jsbzzj("zxxz");
			  }else{
				  $('#zxbz').val("");
			  }
			}
			if("yfxyhxz" == flag){
				if($('#yfxyhxz').is(':checked')){
                $('#yfxyhbz').val(accMul($('#lc').val(),50));
                $('#zxbz').val("");
                $('#dxbz').val("");
				//$('#bzje').val($('#yfxyhbz').val()); 
			}else{
				$('#yfxyhbz').val("");
			}
		  }
			jsbzzj();
		}
		
		function changelc(){
			   var groupCheckbox=$("input[name='bzbzs']");
			   for(i=0;i<groupCheckbox.length;i++){
				   if(groupCheckbox[i].checked){
			            var id =groupCheckbox[i].id;
			            bzbz(id);
				  }
				}
			}
		
	</script>
</head>
<body>
	<form action="" id="lx">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
		<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" onblur="jslckdgbbzzj()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
					<span id="span_qdzh"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
					<span id="span_zdzh"></span>
				</td>
            </tr>
            <tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" id="ylxbh" name="ylxbh" onblur="jslckdgbbzzj()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
					
					<input id="gpsqdzh" name="gpsqdzh" type="hidden"/>
					<input id="gpszdzh" name="gpszdzh" type="hidden"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点桩号：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input readonly="readonly" type="text" name="qdzh" onblur="jslckdgbbzzj()" id="qdzh" style="width: 120px" onchange="changeZlc()"/>
					<input type="hidden" id="gpsqdzh" name="gpsqdzh"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点桩号：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input readonly="readonly" type="text" name="zdzh" onblur="jslckdgbbzzj()" id="zdzh" style="width: 120px" onchange="changeZlc()"/><br/>
					<input type="hidden" id="gpszdzh" name="gpszdzh"/>
				</td>
				
			</tr>
             <tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
            </tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmbm"></span>
					<input id="id" name="id" type="hidden"/>
					<input id="jdbs" name="jdbs" type="hidden"/>
				</td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input name="lxmc" id="lxmc" type="text" style="width: 120px;">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>里程：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="lc" id="lc" type="text" style="width: 100px;"/>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 35px;">
			   <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>管养单位：
				</td>
				<td colspan="3" style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='gydw' name="gydw" style="width: 468px;">
					<input id='gydwdm' name="gydwdm" style="width: 124px;" type="hidden">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
			   <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>行政区划：
				</td>
				<td colspan="3" style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='xzqh' name="xzqh" style="width: 468px;">
					<input id='xzqhdm' name="xzqhdm" style="width: 124px;" type="hidden">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="qdmc" id="qdmc" type="text" style="width: 120px;">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="zdmc" id="zdmc" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设性质：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="jsxz" id="jsxz" style="width:120px"  type="text"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="ghlxmc" name="ghlxmc" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					技术等级</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsdj" name="jsdj" type="text" style="width: 124px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>路面宽度：
				</td>
				<td style="background-color: #ffffff; height: 25px;" align="left" colspan="3">
					<input id="lmkd" name="lmkd" readonly="readonly" type="text" style="width: 80px;"/>&nbsp;米&nbsp;
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					现技术等<br/>级及里程
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" colspan="5">
					一级公路：<input id="yilc" name="yilc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					二级公路：<input id="erlc" name="erlc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					三级公路：<input id="sanlc" name="sanlc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					四级公路：<input id="silc" name="silc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					等外公路：<input id="dwlc" name="dwlc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					无路：<input id="wllc" name="wllc" onchange="cesuan2()" style="width: 50px;" type="text"/>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设方案</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="jsfa" name="jsfa" rows="" cols="" style="width: 650px;height: 60px;"></textarea>
				</td>
			</tr>
			<tbody id='bzsf'>
			    <tr>
	            	<td rowspan="3" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						十三五补助标准</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						大修
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：国道26万元/千平方的70%，省道21万元/千平方的70%
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='dxxz' name='bzbzs' onclick="bzbz('dxxz')" type="checkbox" value="1"/>
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='dxbz' name='dxbz' type="text" style="width: 50px;" readonly="readonly" />万元
					          <input id='bzlx135' name='bzlx135' type="hidden"/>
                              <input id='bzje135' name='bzje135' type="hidden"/>
					</td>
	            </tr>
				<tr>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						中修
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：70万元/公里
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                            选择：<input id='zxxz' name='bzbzs' onclick="bzbz('zxxz')" type="checkbox" value="2"/>					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='zxbz' name='zxbz' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
				<tr>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						预防性养护
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：50万元/公里
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='yfxyhxz' name='bzbzs' onclick="bzbz('yfxyhxz')" type="checkbox" value="3"/>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='yfxyhbz' name='yfxyhbz' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
			
	            <tr>
	            	<td rowspan="5" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青混凝土面层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqhntmcdj">1150</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：70号重胶沥青
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqhntmchd' value='0' onchange="jsbzzj('lqhntmc')" name='lqhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqhntmc' name='lqhntmc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						改性沥青混凝土面层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="gxlqhntmcdj">1300</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：SBS
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='gxlqhntmchd' value='0' onchange="jsbzzj('gxlqhntmc')" name='gxlqhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='gxlqhntmc' name='gxlqhntmc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
            	<tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmcdj">450</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='snhntmchd' value='0' onchange="jsbzzj('snhntmc')" name='snhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmc' name='snhntmc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面就地热再生
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmjdrzsdj">1250</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmjdrzshd' value='0' onchange="jsbzzj('lqlmjdrzs')" name='lqlmjdrzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmjdrzs' name='lqlmjdrzs' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面场拌热再生
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmcbrzsdj">950</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmcbrzshd' value='0' onchange="jsbzzj('lqlmcbrzs')" name='lqlmcbrzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmcbrzs' name='lqlmcbrzs' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td rowspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						基层</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水稳基层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="swjcdj">200</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='swjchd' value='0' onchange="jsbzzj('swjc')" name='swjchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='swjc' name='swjc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面泡沫沥青就地冷再生
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmpmlqjdlzsdj">600</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmpmlqjdlzshd' value='0' onchange="jsbzzj('lqlmpmlqjdlzs')" name='lqlmpmlqjdlzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmpmlqjdlzs' name='lqlmpmlqjdlzs' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面乳化沥青就地冷再生
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmrhlqjdlzsdj">700</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmrhlqjdlzshd' value='0' onchange="jsbzzj('lqlmrhlqjdlzs')" name='lqlmrhlqjdlzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmrhlqjdlzs' name='lqlmrhlqjdlzs' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面场拌冷再生
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmcblzsdj">650</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmcblzshd' value='0' onchange="jsbzzj('lqlmcblzs')" name='lqlmcblzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmcblzs' name='lqlmcblzs' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						新做柔性基层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="xzrxjcdj">800</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='xzrxjchd' value='0' onchange="jsbzzj('xzrxjc')" name='xzrxjchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='xzrxjc' name='xzrxjc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水稳基层冷再生
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="swjclzsdj">170</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='swjclzshd' value='0' onchange="jsbzzj('swjclzs')" name='swjclzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='swjclzs' name='swjclzs' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						下封层</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						下封层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="xfcdj">8</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='xfcse' onclick="jsbzzj('xfc')" type="checkbox"/>
						<input type="hidden" id='xfchd' name='xfchd'>
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='xfc' name='xfc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td rowspan="2" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						挖除面层与基层</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						挖除水泥面板
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="wcsnmbdj">100</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input type="text" value='0' onchange="jsbzzj('wcsnmb')" id='wcsnmbhd' name='wcsnmbhd' class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='wcsnmb' name='wcsnmb' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						挖除水稳基层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="wcswjcdj">30</span>元/立方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input type="text" value='0' onchange="jsbzzj('wcswjc')" id='wcswjchd' name='wcswjchd' class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='wcswjc' name='wcswjc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						打板</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层换板
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmchbdj">160</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='snhntmchbse' onclick="jsbzzj('snhntmchb')" type="checkbox"/>
						<input type="hidden" id='snhntmchbhd' name='snhntmchbhd'>
						面积：<input type="text" value='0' onchange="jsbzzj('snhntmchb')" id='snhntmchbmj' name='snhntmchbmj' class="easyui-numberbox" style="width:50px;"/>㎡
						
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmchb' name='snhntmchb' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						标线</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						标线
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：二级及以下  <span id="bxerdj">10000</span>元/公里,一级<span id="bxyidj">15000</span>元/公里
						
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：中修打板不计
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='bxse' onclick="jsbzzj('bx')" type="checkbox"/>
						<input type="hidden" id='bxhd' name='bxhd'>
						
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='bx' name='bx' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						碎石化</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层碎石化
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmcsshdj">8</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='snhntmcsshse' onclick="jsbzzj('snhntmcssh')" type="checkbox"/>
						<input type="hidden" id='snhntmcsshhd' name='snhntmcsshhd'>
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmcssh' name='snhntmcssh' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td rowspan="8" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						预防性养护</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						封层（透层）+30mm薄层罩面
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="fcbc30dj">50</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='fcbc30se' onclick="jsbzzj('fcbc30')" type="checkbox"/>
						<input type="hidden" id='fcbc30hd' name='fcbc30hd' />
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='fcbc30' name='fcbc30' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						6mm超薄层罩面
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="bc6dj">35</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='bc6se' onclick="jsbzzj('bc6')" type="checkbox"/>
						<input type="hidden" id='bc6hd' name='bc6hd' />
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='bc6' name='bc6' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						25mm薄层罩面
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="bc25dj">45</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='bc25se' onclick="jsbzzj('bc25')" type="checkbox"/>
						<input type="hidden" id='bc25hd' name='bc25hd' />
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='bc25' name='bc25' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						30mm薄层罩面
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="bc30dj">50</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='bc30se' onclick="jsbzzj('bc30')" type="checkbox"/>
						<input type="hidden" id='bc30hd' name='bc30hd' />
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='bc30' name='bc30' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						25mm超薄磨耗层
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="bmc25dj">55</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='bmc25se' onclick="jsbzzj('bmc25')" type="checkbox"/>
						<input type="hidden" id='bmc25hd' name='bmc25hd' />
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='bmc25' name='bmc25' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            						<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						雾封层<2mm
					</td>
										<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="wfcdj">12</span>元/平方米
					</td>
										<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
										<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='wfcse' onclick="jsbzzj('wfc')" type="checkbox"/>
						<input type="hidden" id='wfchd' name='wfchd' />
					</td>
										<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='wfc' name='wfc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            <tr>
	            						<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						稀浆封层 5mm
					</td>
										<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="xjfcdj">15</span>元/平方米
					</td>
										<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
										<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='xjfcse' onclick="jsbzzj('xjfc')" type="checkbox"/>
						<input type="hidden" id='xjfchd' name='xjfchd' />
					</td>
										<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='xjfc' name='xjfc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            
	            <tr>
	            	<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						10mm微表处
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="wbcdj">22</span>元/平方米
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='wbcse' onclick="jsbzzj('wbc')" type="checkbox"/>
						<input type="hidden" id='wbchd' name='wbchd' />
					</td>
					<td style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='wbc' name='wbc' type="text" style="width: 50px;" readonly="readonly"/>万元
					</td>
	            </tr>
	            
	            
	            
	            <tr style="height: 30px;">
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						省补资金</td>
					<td colspan="5" style="background-color: #ffffff;border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<span id='sbzj1'></span>万元
						<input type="hidden" id='sbzj' name="sbzj">
					</td>
					
	            </tr>
	            
            </tbody>
			
			
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:updateLx()" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
				<a href="# "  onclick="removes()" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
	</table>
	</form>
</body>
</html>