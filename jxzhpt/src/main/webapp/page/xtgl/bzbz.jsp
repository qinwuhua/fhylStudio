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
.bgg{ background-color:#a7d1f9; width:700px;border-color:#a7d1f9;}
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
function updateBzbz(){
	var ss="[";
	for ( var i=0;i<5;i++){
		ss=ss+"{\"id\":\""+$("#id_"+i).val()
		+"\",\"bz\":\""+$("#bz_"+i).val()
		+"\",\"bl\":\""+$("#bl_"+i).val()
		+"\",\"fd\":\""+$("#fd_"+i).val()
		+"\"}";
		 if(i!=4){
			 ss=ss+",";
		 }
	}
	ss=ss+"]";
	
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/updateBzbz.do",
		 dataType : 'json',
		 data : 'bzbz.id='+ss ,
		 success : function(msg){
			 if(msg){
				 YMLib.Tools.Show('保存成功！',3000);
			 }
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}

$(function(){
	selBzbz();
	$("#dwgl_btn_Save").click(function(){
		updateBzbz();
	});
	
});
function selBzbz(){
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/selBzbz.do",
		 dataType : 'json',
		 success : function(msg){
			 if(msg){
				 var htmlStr="";
				 $("#bzbz_table").html("");
				 for(var i=0;i<msg.length;i++){
					 htmlStr+="<tr><td>"+msg[i].xmlx+"<input type='hidden' id='id_"+i+"' value='"+msg[i].id+"'></td><td>"+msg[i].lx+"</td><td><input id='bz_"+i+"' value='"+msg[i].bz+"' class='numOnly'/></td><td>"+
					 "<input id='bl_"+i+"' value='"+msg[i].bl+"'  class='numOnly'/></td><td><input id='fd_"+i+"' value='"+msg[i].fd+"'  class='numOnly'/></td></tr>";
				 }
				 $("#bzbz_table").html(htmlStr);
				 $(".numOnly").keypress(function(event){
					var keyCode = event.which;
					if(keyCode==46||(keyCode>=48&&keyCode<=57)||keyCode==8) return true;
					else return false;
				}).focus(function(){
					this.style.imeMode='disabled';
				});
			 }
		 }
	});
}
</script>
<div style="width:100%;">
    <div  style="height:34px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;路网补助标准</div>
		</div>
    </div>
    <div style="height:700px;margin-top:10px;margin-left:10px;">
    	<table width="100%" class="bgg" border="0" cellpadding="0" cellspacing="1">
    		<tr style="font-weight:700;font-size:16px;"><td>项目类型</td><td>补助类型</td><td>补助标准(万元/公里)</td><td>补助比例</td><td>补助浮动(万元)</td></tr>
    		<tbody id="bzbz_table"></tbody>
    	</table>
    	<div style="width:700px;margin-top:10px;text-align:center;">
    		<a id="dwgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="false" >保　存</a>
    	</div>
    </div>
</div>
</body>
</html>