<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>补助标准</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<style>
#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(../../images/jianjiao.png) 8px 0 no-repeat;}
#righttop{height:33px;background:url(../../images/righttopbg.gif) 0 0 repeat-x;}
.bgg{ background-color:#a7d1f9; width:80%;border-color:#a7d1f9;}
.bgg td{ background-color:#FFF; text-align:center; height:25px; line-height:25px;}
.bgg input{ width:80px; height:16px;  text-align:center; line-height:16px;border:1px solid #f4f9fd;background-color:#f4f9fd;}
</style>
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
$(function(){
	loadTable();
});
var obj=new Object();
var array=new  Array();
function loadTable(){
	$("#wqbztable").html("");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/selectWqjlbz.do',
		dataType:'json',
		data:"",
		success:function(data){
			var tbody="";
			for(var i=0;i<data.length;i++){
				array[i]=data[i];
				tbody=tbody+"<tr><td>"+data[i].qllx+"</td>"+"<td>"+data[i].minqc+"</td>"
				+"<td>"+data[i].maxqc+"</td>"+"<td>"+data[i].qk+"</td>"
				+"<td>"+data[i].jsdj1+"</td>"+"<td>"+data[i].jlzj+"</td></tr>"
				;
			}
			$("#wqbztable").html(tbody);
		}
	});
}
function edit(index){
	obj=array[index];
	YMLib.UI.createWindow('lxxx','危桥补助标准编辑','wqbzbz_xg.jsp','lxxx',400,300);
}
function del(id){
	if(confirm('您确认删除吗？'))
	$.ajax({
		data:'wqbzbz.id='+id,
		type:'post',
		datatype:'json',
		url:'/jxzhpt/qqgl/delwqbzbz.do',
		success:function(msg){
			if(msg){
				alert("删除成功！");
				loadTable();
			}else{
				alert("删除失败！");
			}
		}
	})
}
</script>
<div style="width:100%;">
    <div  style="height:34px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;危桥补助标准</div>
		</div>
    </div>
    <div style="height:450px;margin-top:10px;margin-left:10px;overflow: auto;" >
    	<table width="100%" class="bgg" border="0" cellpadding="0" cellspacing="1">
    		<tr style="font-weight:700;font-size:16px;"><td width="14%">桥梁类型</td><td width="14%">最小桥长</td><td width="14%">最大桥长</td><td width="14%">最大宽度</td><td width="14%">行政等级</td><td width="14%">奖励金额(元/每平方米)</td></tr>
    		<tbody id="wqbztable"></tbody>
    	</table>
    	<!-- <div style="width:80%;margin-top:10px;text-align:center;">
    		<a id="tjwqbz" iconCls="icon-add" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="false"  onclick="YMLib.UI.createWindow('lxxx','危桥补助标准添加','wqbzbz_add.jsp','lxxx',400,300);">添    加</a>
    		<a id="dwgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="false" >保　存</a>
    	</div> -->
    </div>
</div>
</body>
</html>