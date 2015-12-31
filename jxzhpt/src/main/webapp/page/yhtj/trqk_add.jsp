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
<script type="text/javascript" src="./js/trqk.js"></script>

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
		loadUnit("gydw",'36');
	//	setGydw1("gydw",'36');
		loadUnit("tbdw",$.cookie("unit"));
		$("#tbsj").datebox({    
		    
		});  
		var date = new Date();
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		if(m<=9){
			m='0'+m;
		}
		if(d<=9){
			d='0'+d;
		}
		$('#tbsj').datebox('setValue', y+"-"+m+"-"+d);
	});
	
	function setGydw1(id, dwbm){
		$('#' + id).combotree(
		{
			url : '/jxzhpt/gcgl/selAllBm3.do?yhdw=' + dwbm,
			valueField:'id',    
		    textField:'text'   
		});
	$('#' + id).combotree('setValue', '11101360000');

}
	function check(str){
    	if(str.value!=''){
    		if($.trim(str.value)==''){
    			$(str).val('');
    			return;
    		}
    		var flag = /^-?[1-9]+(?=\.{0,1}\d+$)|(^0$)|(^-?0\.[0-9]*[1-9]$)|(^-?[1-9][0-9]*.[0-9]*$)/;
    		if(!flag.test($.trim(str.value))){
    			alert("请输入正确的数字");
    			$(str).val('');
    		}else{
    			$(str).val($.trim(str.value));
    		}
    	}
    }
	function check1(str){
    	if(str.value!=''){
    		if($.trim(str.value)==''){
    			$(str).val('');
    			return;
    		}
    		var flag= /^[0-9]*[1-9][0-9]*$/;
    		if(!flag.test($.trim(str.value))){
    			alert("请输入正整数");
    			$(str).val('');
    		}else{
    			$(str).val($.trim(str.value));
    		}
    	}
    }
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况基本信息 
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="gydw" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">抢修人数(工日)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="qxrs" style="width: 156px" onblur="check1(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投入抢修经费(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="trqxjf"  onblur="check(this)"/></td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况材料 
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">沥青(吨)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="lq" style="width: 156px" onblur="check(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">水泥(吨)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="sn" style="width: 156px" onblur="check(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">沙石(立方)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="ss"  onblur="check(this)"/></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">编织袋(个)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="bzd" style="width: 156px" onblur="check1(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工业盐(吨)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="gyy" style="width: 156px" onblur="check(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">沥青冷补料：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="lqlbl" /></td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况设备（台班）  
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">挖掘机 ：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="wjj" style="width: 156px" onblur="check1(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">装载机：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="zzj" style="width: 156px" onblur="check1(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">自卸汽车：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="zxqc"  onblur="check1(this)"/></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">抽水台班：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="cstb" style="width: 156px" onblur="check1(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设备台班小计：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="sbtbxj" style="width: 156px" onblur="check1(this)"/></td>
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
					<input type="text"  id="tjr" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审核人：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="shr" /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">填报时间：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="tbsj" style="width: 156px" /></td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="addtrqk()">保存</a>
				<a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel" onclick="closes('trqk_add')">取消</a></td>
			</tr>
			</table>
</body>
</html>