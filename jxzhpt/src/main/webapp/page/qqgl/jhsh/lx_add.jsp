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
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<style type="text/css">
		TD {font-size: 12px;} 
		a{text-decoration:none;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadBmbm2('xjsdj','技术等级');
			$('#xmbm1').val(parent.YMLib.Var.xmbm);
			$('#xmbm').val(parent.YMLib.Var.xmbm);
			$('#jdbs').val(parent.YMLib.Var.jdbs);
			$('#xmbm1').attr("disabled","disabled");
			loadUnit("gydw",$.cookie("unit"));
			loadDist("xzqh",$.cookie("dist"));
			autoCompleteLXBM();
		});
		function autoCompleteLXBM(){
			var url = "/jxzhpt/qqgl/qqglGpsroad.do";
			$("#lxbm").autocomplete(url, {
				multiple : false,
				minChars :1,
				multipleSeparator : ' ',
				mustMatch: true,
		  		cacheLength : 0,
		  		delay : 200,
		  		max : 50,
		  		extraParams : {
		  			ghlxbh:function() {
		  				var d = $("#lxbm").val();
		  				return d;
		  			},
		  			xzqh:function() {
		  				var d = $.cookie("dist");
		  				return d;
		  			}
		  		},
		  		dataType : 'json',// 返回类型
		  		// 对返回的json对象进行解析函数，函数返回一个数组
		  		parse : function(data) {
		  			var aa = [];
		  			aa = $.map(eval(data), function(row) {
		  					return {
		  						data : row,
		  						value : row.ghlxbh.replace(/(\s*$)/g,""),
		  						result : row.ghlxbh.replace(/(\s*$)/g,"")
		  					};
		  				});
		  			return aa;
		  		},
		  		formatItem : function(row, i, max) {
		  			return row.ghlxbh.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
		  		}
		  	}).result(
				function(e, item) {
					$('#lxbm').val(item.ghlxbh);
					$('#lxmc').val(item.lxmc);
					$('#qdzh').val(item.qdzh);
					$('#zdzh').val(item.zdzh);
					$('#lc').val(item.lc);
					$('#qdmc').val(item.qdmc);
					$('#zdmc').val(item.zdmc);
					$('#xjsdj').combobox("setValue",item.xjsdj);
					$("#qd").html("<font color='red' size='2'>&nbsp;*不能小于</font>"+"<font color='red' size='2'>"+item.qdzh);
					$("#zd").html("<font color='red' size='2'>&nbsp;*不能大于</font>"+"<font color='red' size='2'>"+item.zdzh);
				});
		}
		function insert(){
			var params={'lx.jdbs':$('#jdbs').val(),'lx.xmid':$('#xmbm').val(),'lx.lxmc':$('#lxmc').val(),'lx.qdzh':$('#qdzh').val(),
					'lx.lxbm':$('#lxbm').val(),'lx.zdzh':$('#zdzh').val(),'lx.lc':$('#lc').val(),'lx.qdmc':$('#qdmc').val(),'lx.zdmc':$('#zdmc').val(),
					'lx.jsxz':$('#jsxz').val(),'lx.gydw':$('#gydw').combobox("getText"),'lx.gydwdm':$('#gydw').combobox("getValue"),
					'lx.xzqh':$('#xzqh').combobox("getText"),'lx.xzqhdm':$('#xzqh').combobox("getValue"),'lx.xjsdj':$('#xjsdj').combobox("getValue")};
			$.ajax({
				type:'post',
				url:'../../../qqgl/insertLx.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						alert("添加成功!");
						closeWindow(parent.YMLib.Var.id);
					}
				}
			});
		}
	</script>
</head>
<body>
	<form id="lxadd" action="../../../qqgl/insertLx.do">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
		<tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				项目编码</td>
			<td style="background-color: #ffffff; height: 20px;" align="left">
				<input id="xmbm1" name="xmbm" type="text" style="width: 120px;"/><font color='red' size='2'>&nbsp;*</font>
				<input id="xmbm" name="xmbm" type="hidden"/>
				<input id="jdbs" name="jdbs" type="hidden"/>
			</td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				路线编码</td>
			<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				<input type="text" name="lxbm" id="lxbm" style="width: 120px" /><font color='red' size='2'>&nbsp;*</font>
			</td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				路线名称
			</td>
			<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				<input id="lxmc" name="lxmc" style="width: 120px;"/><font color='red' size='2'>&nbsp;*</font>
			</td>
		</tr>
		<tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				起点桩号</td>
			<td style="background-color: #ffffff; height: 20px;" align="left">
				<input type="text" name="qdzh" id="qdzh" style="width: 120px"/><font color='red' size='2'>&nbsp;*</font><br/>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				止点桩号</td>
			<td style="background-color: #ffffff; height: 20px;" align="left">
				<input type="text" name="zdzh"id="zdzh" style="width: 120px"/><font color='red' size='2'>&nbsp;*</font><br/>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				里程</td>
			<td style="background-color: #ffffff; height: 20px;" align="left">
				<input id="lc" name="lc" type="text" style="width: 90px;"/>&nbsp;公里<font color='red' size='2'>&nbsp;*</font>
			</td>
		</tr>
		<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				起点名称</td>
			<td style="background-color: #ffffff; height: 20px;" align="left">
				<input id="qdmc" name="qdmc" type="text" style="width: 120px;"/><font color='red' size='2'>&nbsp;*</font>
			</td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				止点名称</td>
			<td style="background-color: #ffffff; height: 20px;" align="left">
				<input id="zdmc" name="zdmc" type="text" style="width: 120px;"/><font color='red' size='2'>&nbsp;*</font>
			</td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					建设性质</td>
			<td style="background-color: #ffffff; height: 20px;" align="left">
				<input type="text" id="jsxz" style="width: 120px" value=''/><font color='red' size='2'>&nbsp;*</font>
			</td>
		</tr>
		<tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				管养单位：</td>
			<td style="background-color: #ffffff; height: 25px;" align="left">
				<input type='text' id='gydw' style="width: 124px;"><font color='red' size='2'>&nbsp;*</font>
			</td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				行政区划：</td>
			<td style="background-color: #ffffff; height: 25px;" align="left" >
				<input type='text' id='xzqh' style="width: 124px;"><font color='red' size='2'>&nbsp;*</font>
			</td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				现技术等级：
			</td>
			<td style="background-color: #ffffff; height: 20px;" align="left">
				<input id="xjsdj" name="xjsdj" type="text" style="width: 120px;"/><font color='red' size='2'>&nbsp;*</font>
			</td>
		</tr>
		<tr style="height: 35px;">
			<td colspan="6" style="background-color: #ffffff;"align="center">
			<a href="javascript:void(0)" onclick="insert()" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
			<a href="# "  onclick="removes('lxxx')" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
		</tr>
	</table>
	</form>
</body>
</html>