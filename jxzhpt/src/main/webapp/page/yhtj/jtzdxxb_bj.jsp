<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="./js/zdxx.js"></script>

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
		autoCompleteLXBM();
		loadUnit("gydw",'36');
		loadUnit("tbdw",$.cookie("unit"));
		$("#zdsj").datebox({    
		    
		});  
		$("#yjhfsj").datebox({    
		    
		}); 
		$("#tbsj").datebox({    
		    
		}); 
		var data=parent.obj;
		$("#lxbm").val(data.lxbm);
		$("#lxmc").text(data.lxmc);
		$("#qdzh").val(data.qdzh);
		$("#zdzh").val(data.zdzh);
		qd=data.qdzh;
		zd=data.zdzh;
		$("#zdsj").val(data.zdsj);
		$("#zhlb").val(data.zhlb);
		$("#qtcs").val(data.qtcs);
		$("#yjhfsj").val(data.yjhfsj);
		$("#tjr").val(data.tjr);
		$("#shr").val(data.shry);
		$("#tbsj").val(data.tbsj);
		$('#zdsj').datebox('setValue', data.tbsj);
		$('#yjhfsj').datebox('setValue', data.yjhfsj);
		$('#tbsj').datebox('setValue', data.tbsj);
		var temp = document.getElementsByName("sfhf");
		if(data.sfhf=="是"){
			temp[0].checked=true;
		}else{
			temp[1].checked=true;
		}
		
		$("#gydw").combobox("setValue",data.gydw);
		$("#tbdw").combobox("setValue",data.tbdw);
	});
	var qd;
	var zd;
	function autoCompleteLXBM(){
		var url = "/jxzhpt/xmjck/abgcGpsroad.do";
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
	  				if(d.split("(").length>1){
	  					return d.split("(")[0];
	  				}else{
	  					return d.toUpperCase( );
	  				}
	  			},
	  			gydwbm:function() {
	  				return '';
	  			},
	  			xzqhdm:function() {
					return "";
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
					$("#lxmc").text('');$("#qdzh").val('');$("#zdzh").val('');
					$("#lxmc").text(item.lxmc);$("#qdzh").val(item.qdzh);$("#zdzh").val(item.zdzh);
					qd=parseFloat(item.qdzh);
					zd=parseFloat(item.zdzh);
					$("#qd").text("大于等于"+item.qdzh);
					$("#zd").text("小于等于"+item.zdzh);
				});
	}
	function check(str){
		var flag = /^-?[1-9]+(?=\.{0,1}\d+$)|(^0$)|(^-?0\.[0-9]*[1-9]$)|(^-?[1-9][0-9]*.[0-9]*$)/;
		if(!flag.test($.trim(str.value))){
			alert("请输入正确的数字");
			$(str).val('');
		}
		var qdzh=parseFloat($("#qdzh").val());
		var zdzh=parseFloat($("#qdzh").val());
		if(qdzh<qd){
			alert("请您输入大于等于"+qd+"的值");
			$("#qdzh").val("");
		}
		if(zdzh>zd){
			alert("请您输入小于等于"+zd+"的值");
			$("#qdzh").val("");
		}
		if(qdzh>zdzh){
			alert("起点桩号不能大于止点桩号");
			$("#qdzh").val("");
			$("#qdzh").val("");
		}
	}
	
	function insertzdxx(){
		if($("#lxbm").val()==''){
			alert("请输入路线编码");
			return;
		}
		if($("#qdzh").val()==''){
			alert("请输入起点桩号");
			return;
		}
		if($("#zdzh").val()==''){
			alert("请输入止点桩号");
			return;
		}
		var sf='';
		var temp = document.getElementsByName("sfhf");
		  for(var i=0;i<temp.length;i++)
		  {
		     if(temp[i].checked)
		           sf = temp[i].value;
		  }
		  if(sf==''){
			  alert("请您选择该阻断是否恢复");
			  return;
		  }

		var data=$("#zdxxform").serialize()+"&zdxx.lxmc="+$("#lxmc").text()+"&zdxx.sfhf="+sf
		+"&zdxx.gydw="+$("#gydw").combobox("getValue")+"&zdxx.gydwmc="+$("#gydw").combobox("getText")
		+"&zdxx.tbdw="+$("#gydw").combobox("getValue")+"&zdxx.tbdwmc="+$("#tbdw").combobox("getText")
		+"&zdxx.zdsj="+$('#zdsj').datebox('getValue')+"&zdxx.yjhfsj="+$('#yjhfsj').datebox('getValue')+"&zdxx.tbsj="+$('#tbsj').datebox('getValue')+"&zdxx.id="+parent.obj.id;
		 $.ajax({
 			type:"post",
 			url:"/jxzhpt/wjxt/updatezdxx.do",
 			dataType:'json',
 			data:data,
 			success:function(msg){
 				if(msg){
 					alert("保存成功！");
 					parent.$("#zdxx_table").datagrid('reload');
 					closes('zdxx_bj');
 				}else{
 					alert("保存失败！");
 				}
 			}
 		});
	}
</script>
	<form action="" id="zdxxform" method="post">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路交通阻断基本信息
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="gydw" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  name="zdxx.lxbm" id="lxbm" style="width: 156px" />
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称 ：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="lxmc"></span>
					</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  name="zdxx.qdzh" id="qdzh" style="width: 50px"  onblur="check(this)"/><font color="red"><span id="qd"></span></font></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="zdxx.zdzh"  id="zdzh" style="width: 50px" onblur="check(this)"/><font color="red"><span id="zd"></span></font></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">阻断时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="zdsj" /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">灾害类别：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" name="zdxx.zhlb" id="zhlb" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">抢通措施：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  name="zdxx.qtcs" id="qtcs" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">预计恢复时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="yjhfsj" /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否恢复：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="radio" id="sfhf1"  name="sfhf"   value="是"/>是
					<input type="radio"  id="sfhf2"  name="sfhf"   value="否"/>否
					</td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况填报信息  
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">填报单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="tbdw" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">统计人：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="zdxx.tjr"  id="tjr" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审核人：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" name="zdxx.shry" id="shr" /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">填报时间：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="tbsj" style="width: 156px" /></td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="insertzdxx()">保存</a>
				<a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel" onclick="closes('zdxx_bj')">取消</a></td>
			</tr>
			</table>
		</form>
</body>
</html>