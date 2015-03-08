<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理灾害防治项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
var xmkid;
var qdStr;
var zdStr;
var bzls;
	$(function(){
		autoCompleteLXBM();

		$("#save_button").click(function(){
			var datas="lxbm="+$("#lxbm").val()+"&qdzh="+$("#scqdzh").val()+"&zdzh="+$("#sczdzh").val();
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmsck/onceSckZhfz.do',
				dataType:'json',
		        data:datas,
				success:function(msg){
					if(Boolean(msg)){
						bzZhfz();
					}else{
						alert("该项目已添加，请勿重复添加！");
						return;
					}
				}
			}); 
		});
		$("#qx_window").click(function(){
			parent.$('#sck_add').window('destroy');
		});	
	});
	function autoCompleteLXBM(){
		var url = "/jxzhpt/xmjck/JckzhfzRoad.do";
		$("#lxbm").autocomplete(url, {
			multiple : false,
			minChars :2,
			multipleSeparator : ' ',
			mustMatch: true,
	  		cacheLength : 0,
	  		delay : 200,
	  		max : 50,
	  		extraParams : {
	  			lxbm:function() {
	  				var d = $("#lxbm").val();
	  				return d;
	  			},
	  			gydwbm:function() {
	  				var d = $.cookie("unit2");
	  				if(d=='______36') return "";
	  				else return d;
	  			},
	  			xzqhdm:function() {
	  				var d = $.cookie("dist");
	  				if(d=='360000') return "";
	  				else return d;
	  			}
	  		},
	  		dataType : 'json',// 返回类型
	  		// 对返回的json对象进行解析函数，函数返回一个数组
	  		parse : function(data) {
	  			var aa = [];
	  			aa = $.map(eval(data), function(row) {
	  					return {
	  						data : row,
	  						value : row.lxbm.replace(/(\s*$)/g,""),
	  						result : row.lxbm.replace(/(\s*$)/g,"")
	  					};
	  				});
	  			return aa;
	  		},
	  		formatItem : function(row, i, max) {
	  			return row.lxbm.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
	  		}
	  	}).result(
				function(e, item) {

					if(item==undefined) return ;
					$("#lxmc,#qdzh,#zdzh,#zlc,#xjnd,#lxjsdj,#gydw").attr("value",'');
					xmkid=item.id;
					$("#lxmc").html(item.lxmc);
					$("#gydw").html(item.gydw);
					$("#xzqhmc").html(item.xzqhmc);
					$("#xzqhdm").html(item.xzqhdm);
 					$("#qdzh").html(item.qdzh);
					$("#zdzh").html(item.zdzh);
					$("#gjxjnd").html(item.gjxjnd);
					$("#lxjsdj").html(item.lxjsdj);
					$("#qzlc").html(item.qzlc);
					$("#yhlc").html(item.yhlc);
					$("#xmnf").html(item.xmnf);
					$("#xmtype").html(item.xmtype);
					$("#yhnr").html(item.yhnr);
					$("#bz").html(item.bz);
					qdStr=parseFloat(item.qdzh);
					zdStr=parseFloat(item.zdzh);
					$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+item.qdzh);
					$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+item.zdzh);
				});
	}
	function saveZhfz(){
		if($("#scqdzh").val()==null || $("#scqdzh").val()==''){
			alert("对不起，起点桩号不能为空！");
			return false;
		}
		if(parseFloat($("#scqdzh").val())*1000<qdStr*1000){
			alert("对不起，起点桩号不能小于"+qdStr+"！");
			return false;
		}
		if($("#sczdzh").val()==null || $("#sczdzh").val()==''){
			alert("对不起，止点桩号不能为空！");
			return false;
		}
		if(parseFloat($("#sczdzh").val())*1000>zdStr*1000){
			alert("对不起，止点桩号不能大于"+zdStr+"！");
			return false;
		}
		if(parseFloat($("#scqdzh").val())*1000>=parseFloat($("#sczdzh").val())*1000){
			alert("对不起，起点桩号不能大于止点桩号！");
			return false;
		}
		if(parseFloat($("#scyhlc").val())*1000>parseFloat($("#sczlc").html())*1000){
			alert("对不起，隐患里程不能大于总里程！");
			return false;
		}
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		var data ="xmkid="+xmkid+"&scqdzh="+$("#scqdzh").val()+"&sczdzh="+$("#sczdzh").val()+"&sczlc="+$("#sczlc").html()+"&scyhlc="+$("#scyhlc").val()
		+"&fapgdw="+$("#fapgdw").val()+"&fascdw="+$("#fascdw").val()+"&faspsj="+$("#faspsj").datebox('getValue')+"&spwh="+$("#spwh").val()+"&tzgs="+
		$("#tzgs").val()+"&jsxz="+$("#jsxz").val()+"&jsnr="+$("#jsnr").val()+"&scbz="+$("#scbz").val()+"&scbmbm="+$.cookie("unit")+"&lxbm="+
		$("#lxbm").val()+"&lxmc="+$("#lxmc").html()+"&sck_sbthcd="+sbthcd+"&bzls="+bzls;
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmsck/insertSckzhfz.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					parent.$("#grid").datagrid('reload');
					alert("保存成功！");
					parent.$('#sck_add').window('destroy');
					
				}else{
					alert('保存失败！');
				}
			}
		});  
	}
	function bzZhfz(){
		var datas="lxbm="+$("#lxbm").val()+"&qdzh="+$("#scqdzh").val()+"&zdzh="+$("#sczdzh").val();
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmsck/bzZhfz.do',
			dataType:'json',
	        data:datas,
			success:function(msg){
				if(Boolean(msg)){
					bzls="无";
					saveZhfz();
				}else{
					if(confirm('该项目有补助历史，你确定继续提交吗？')){
						bzls="有";
						 saveZhfz(); 
					}
				}
			}
		}); 
	}
	
	function changeZlc(){
		var zlc=(parseFloat($("#sczdzh").val())*1000000000000-parseFloat($("#scqdzh").val())*1000000000000)/1000000000000;
		$("#sczlc").html(zlc);
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
					灾害防治项目基本信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" name="lxbm" id="lxbm" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="gydw"></span>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="qdzh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="zdzh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="qzlc"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xzqhdm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; "align="left">
					<span id="xzqhmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="gjxjnd"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="lxjsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="yhlc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xmnf"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xmtype"></span></td>
				<td colspan="2" style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患内容：</td>
				<td colspan="5" style="background-color: #ffffff; " align="left">
					<span id="yhnr"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安保工程项目审查信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" name="scqdzh" id="scqdzh" style="width: 150px" onblur="changeZlc()"/><br/>
					<span id="qd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" name="sczdzh"id="sczdzh" style="width: 156px" onblur="changeZlc()"/><br/>
					<span id="zd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="sczlc">0</span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<input type="text" id="scyhlc" style="width: 150px"value="0"/>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估单位：</td>
				<td style="background-color: #ffffff; " align="left">
					<input type="text" name="fapgdw" id="fapgdw" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" name="fascdw"id="fascdw" style="width: 156px" /></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审批时间：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type=text id="faspsj" class="easyui-datebox" />
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" name="spwh" id="spwh" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" name="tzgs"id="tzgs" style="width: 115px" />&nbsp;万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="jsxz" style="width: 150px">
						<option value="中修"selected>中修</option>
						<option value="大修">大修</option>
						<option value="改建">改建</option>
					</select>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<textarea id="jsnr"rows="2"  style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<textarea id="scbz" rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>