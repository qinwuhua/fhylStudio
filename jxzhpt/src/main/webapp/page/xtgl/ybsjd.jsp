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
	xmnf('xmnf');
	loadTable();
});

function xmnf(id){
	var myDate = new Date();
	var years=[];
	for(var i=0;i<=10;i++){
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
}
var obj=new Object();
var array=new  Array();
function loadTable(){
	//alert($("#xmnf").combobox('getValue'));
	$("#wqbztable").html("");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/selectYbsjd.do',
		dataType:'json',
		data:"wqbzbz.xmlx="+$("#xmlx").combobox('getValue')+"&wqbzbz.nf="+$("#xmnf").combobox('getValue'),
		success:function(data){
			var tbody="";
			for(var i=0;i<data.length;i++){
				array[i]=data[i];
				tbody=tbody+"<tr><td><a href='#' onclick=edit('"+i+"')>编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=del('"+i+"')>删除</a>"
				+"<td>"+data[i].xmlx+"</td>"+"<td>"+data[i].nf+"</td>"+"<td>"+data[i].yf+"</td>"
				+"<td>"+data[i].jzsj+"</td></tr>";
			}
			$("#wqbztable").html(tbody);
		}
	});
}
function edit(index){
	obj=array[index];
	YMLib.UI.createWindow('lxxx','月报时间点修改','ybsjd_xg.jsp','lxxx',400,300);
}
function del(index){
	if(confirm('您确认删除吗？'))
	$.ajax({
		data:'wqbzbz.id='+array[index].id,
		type:'post',
		datatype:'json',
		url:'/jxzhpt/qqgl/delybsjd.do',
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
			<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;月报上报时间点</div>
		</div>
    </div>
    <div style="width:80%;margin-top:10px;text-align:center;">
    		项目类型<select id='xmlx' class="easyui-combobox">
    			<option value="gcgl_wqgz" selected>危桥</option>
    			<option value="gcgl_abgc">安保</option>
    			<option value="gcgl_zhfz">灾害</option>
    			<option value="gcgl_gcgzsj">改建</option>
    			<option value="gcgl_gcgzgj">路面改造</option>
    			<option value="gcgl_xj">新建</option>
    			<option value="gcgl_yhdzx">养护大中修</option>
    			<option value="gcgl_sh">灾毁重建</option>
    		</select>
    		年份
    		<select id='xmnf' class="easyui-combobox" style="width: 50px">
    		</select>
    		<a id="dwgl_btn_Save" onclick="loadTable()" iconCls="icon-search" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >查询</a>
    		<a id="tjwqbz" iconCls="icon-add" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true"  onclick="YMLib.UI.createWindow('lxxx','月报时间点添加','ybsjd_add.jsp','lxxx',400,300);">添    加</a>
    		 
    	</div>
    <div style="height:450px;margin-top:10px;margin-left:10px;overflow: auto;" >
    	<table width="100%" class="bgg" border="0" cellpadding="0" cellspacing="1">
    		<tr style="font-weight:700;font-size:16px;"><td width="16%">操作</td><td width="14%">项目类型</td><td width="14%">年份</td><td width="14%">月份</td><td width="14%">截止时间</td></tr>
    		<tbody id="wqbztable"></tbody>
    	</table>
    	
    </div>
</div>
</body>
</html>