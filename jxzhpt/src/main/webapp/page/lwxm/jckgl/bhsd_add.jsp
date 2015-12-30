<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理病害隧道项目</title>
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
$(function(){
	xmnf1("xmnf");
    loadBmbm2("jsxz", "建设性质");
	$("#save_button").click(function(){
		if($("#sddm").val()=="" || $("#sddm").val()==null){
			alert("请填写隧道代码！");
			$("#sddm").focus();
			return false;
		}
			var datas="sddm="+$("#sddm").val()+"&lxbm="+$("#lxbm").html()+"&sdzxzh="+$("#sdzxzh").html();
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmjck/onceBhsd.do',
				dataType:'json',
		        data:datas,
				success:function(msg){
					if(Boolean(msg)){
						saveBhsd();
					}else{
						alert('该项目已添加过，请勿重复添加！');
					}
				}
			});
	});
	$("#qx_window").click(function(){
		parent.$('#jck_add').window('destroy');
	});	
 	autoCompleteLXBM();
});
function autoCompleteLXBM(){
	var url = "/jxzhpt/xmjck/bhsdGpsroad.do";
	$("#sddm").autocomplete(url, {
		multiple : false,
		minChars :2,
		multipleSeparator : ' ',
		mustMatch: true,
  		cacheLength : 0,
  		delay : 200,
  		max : 50,
  		extraParams : {
  			sddm:function() {
  				var d = $("#sddm").val();
  				return d;
  			},
  			gydwbm:function() {
  				var d = $.cookie("unit2");
  				if(d=='_____36') return "";
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
  						value : row.sddm.replace(/(\s*$)/g,""),
  						result : row.sddm.replace(/(\s*$)/g,"")
  					};
  				});
  			return aa;
  		},
  		formatItem : function(row, i, max) {
  			return row.sddm.replace(/(\s*$)/g,"")+"("+row.sdzxzh+")"+"<br/>"+row.sdmc.replace(/(\s*$)/g,"");
  		}
  	}).result(
			function(e, item) {
				if(item==undefined) return ;
				$("#sdmc,#sdzxzh,#gydw,#xzqhdm,#xzqhmc,#lxmc,#lxbm,#sdcd,#sdkd,#sdgd,#pddj,#pdtime,#jsdj,#xjgjnd,#acdfl,#bhbw,#bhnr").attr("value",'');
				$("#sdmc").html(item.sdmc);
				$("#sdzxzh").html(parseFloat(item.sdzxzh));
				$("#gydw").html(item.gydw);
				$("#xzqhdm").html(item.xzqhdm);
				$("#xzqhmc").html(item.xzqhmc);
				$("#lxmc").html(item.lxmc);
				$("#lxbm").html(item.lxbm);
				$("#sdcd").html(item.sdcd);
				$("#sdkd").html(item.sdkd);
				$("#sdgd").html(item.sdgd);
				$("#pddj").html(item.pddj);
				$("#pdtime").html(item.pdtime);
				$("#jsdj").html(item.jsdj);
				$("#xjgjnd").html(item.xjgjnd);
				$("#acdfl").html(item.acdfl);
				$("#bhbw").html(item.bhbw);
				$("#bhnr").val(item.bhnr);
				$("#gydwbm").html(item.gydwbm);
			});
}

function saveBhsd(){
	var sbthcd=$.cookie("unit2").length;
	var data ="sddm="+$("#sddm").val()+"&sdmc="+$("#sdmc").html()+"&sdzxzh="+$("#sdzxzh").html()+"&gydw="+$("#gydw").html()+"&gydwbm="+$("#gydwbm").html()
	+"&xzqhdm="+$("#xzqhdm").html()+"&xzqhmc="+$("#xzqhmc").html()+"&lxmc="+$("#lxmc").html()+"&lxbm="+$("#lxbm").html()+"&sdgd="+$("#sdgd").html()+
	"&sdcd="+$("#sdcd").html()+"&sdkd="+$("#sdkd").html()+"&jsdj="+$("#jsdj").html()+"&pddj="+$("#pddj").html()+"&pdtime="+$("#pdtime").html()+"&xjgjnd="+$("#xjgjnd").html()+
	"&acdfl="+$("#acdfl").html()+"&xmnf="+$("#xmnf").combobox("getValue")+"&bhbw="+$("#bhbw").val()+"&bhnr="+$("#bhnr").val()+"&bz="+$("#bz").val()+
	"&tbbmbm="+$.cookie("unit")+"&sbthcd="+sbthcd+"&xmmc="+$("#xmmc").val()+"&jsxz="+$("#jsxz").combobox("getValue")+"&jsjd="+$("#jsjd").val()+"&jswd="+$("#jswd").val()
	+"&nsddm="+$("#nsddm").val()+"&nlxbm="+$("#nlxbm").val()+"&nlxmc="+$("#nlxmc").val()+"&nsdzxzh="+$("#nsdzxzh").val();
// 	alert(data); 
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmjck/insertBhsd.do',
        data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				parent.jckglBhsd();
				alert("保存成功！");
				parent.jckglBhsd();
				parent.$('#jck_add').window('destroy');
			}else{
				alert('保存失败！');
			}
		}
	});
}
</script>

<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>隧道代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="sddm"id="sddm" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="xmmc"id="xmmc" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<select id="jsxz" class="easyui-combobox" style="width: 150px">
                    </select>
			    </td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
                    <span id="xjgjnd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sdmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdzxzh"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span>
					<span id="gydwbm" style="display: none;"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhdm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhmc"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxbm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf"  style="width:155px" class="easyui-combobox" data-options="panelHeight:'100'">
                    </select>
                </td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdcd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道净宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="sdkd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道宽度(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdgd"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				    <span id="jsdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pddj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定日期</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pdtime"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="acdfl"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">进遂经度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="jsjd"id="jsjd" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">进遂纬度</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="jswd"id="jswd" style="width: 150px" />
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="nlxbm"id="nlxbm" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="nlxmc"id="nlxmc" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新隧道代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="nsddm"id="nsddm" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新隧道中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="nsdzxzh"id="nsdzxzh" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害部位：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bhbw" rows="2"  style="width:99%"></textarea>
			    </td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bhnr" rows="2"  style="width:99%"></textarea>
			    </td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff; height: 35px;"align="center">
				<a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> 
				<a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>