<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<style type="text/css">
		.table{border: 1px solid #CBE0FF;}
		.table tr{border: 1px solid #CBE0FF;}
		.table tr td{border: 1px solid #CBE0FF;}
	</style>
	<script type="text/javascript">
		$(function(){
			var xzqh=$.cookie("unit").substring(5);
			var reg=new RegExp(/00/);
			xzqh=xzqh.replace(reg,"__");
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryChildXzqh.do',
				data:'xzqh.id='+xzqh,
				dataType:'json',
				success:function(data){
					$.each(data,function(index,item){
						$('#zjqf_table_tbody').after('<tr id="'+item.id+'"><td align="center">'+item.name+'</td><td align="center"><input type="number" width="60" /></td><td  align="center"><input type="number" width="60" /></td><td  align="center"><input type="number" width="60" /></td></tr>');
					});
				}
			});
			var myDate = new Date();
			for(var i=0;i<=10;i++){
				var option="<option value='"+(myDate.getFullYear()-i)+"'>"+(myDate.getFullYear()-i)+"</option>";
				$('#selnf').append(option);
			}
		});
		function loadZjqfByIdAndXzqh(){
			//首先查询是否有上级的资金分配
			var xzqhfather;
			if(roleName()=="县级"){
				xzqhfather=$.cookie("unit").substring(5).substring(0,4)+"00";
			}else if(roleName()=="市级"){
				xzqhfather="360000";
			}
			var father={'zjqf.nf':$('#selnf').val(),'zjqf.xzqhdm':xzqhfather};
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryZjqfByXzqh.do',
				data:father,
				dataType:'json',
				success:function(data){
					var trsum = $('#zjqf_table tr:eq(2) input');
					if(data!=null){
						$.each(JSON.parse(data.zjqf),function(index,item){
							if(item.id==$.cookie("unit").substring(5)){
								$(trsum[0]).val(item.wqgz);
								$(trsum[1]).val(item.abgc);
								$(trsum[2]).val(item.zhfz);
								if($.cookie("unit").substring(5)!="360000"){
									$(trsum[0]).attr("disabled",true);
									$(trsum[1]).attr("disabled",true);
									$(trsum[2]).attr("disabled",true);
								}
							}
						});
					}else{
						$(trsum[0]).val("");
						$(trsum[1]).val("");
						$(trsum[2]).val("");
						if($.cookie("unit").substring(5)!="360000"){
							$(trsum[0]).attr("disabled",true);
							$(trsum[1]).attr("disabled",true);
							$(trsum[2]).attr("disabled",true);
						}
					}
				}
			});
			//查询本单位的资金切分情况
			var zjqf={'zjqf.nf':$('#selnf').val(),'zjqf.xzqhdm':$.cookie("unit").substring(5)};
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryZjqfByXzqh.do',
				data:zjqf,
				dataType:'json',
				success:function(data){
					if(data!=null){
						$('#zjqfid').val(data.id);
						$.each(JSON.parse(data.zjqf),function(index,item){
							if(($.cookie("unit").substring(5)!="360000" && $.cookie("unit").substring(5)!=item.id) || $.cookie("unit").substring(5)=="360000"){
								var tds=$('#'+item.id+' input');
								$(tds[0]).val(item.wqgz);
								$(tds[1]).val(item.abgc);
								$(tds[2]).val(item.zhfz);
							}
						});
					}else{
						var text= $("#zjqf_table input:gt(3)");
						$.each(text,function(index,item){
							$(item).val("");
						});
					}
				}
			});
		}
		function save(){
			if(roleName()=="县级"){
				alert("只有市级和市级以上才能进行资金切分");
				return;
			}
			var trsum = $('#zjqf_table tr:eq(2) input');
			var text= $("#zjqf_table input:gt(0)");
			var isnum=false;
			$.each(text,function(index,item){
				if($(item).val()==""){
					isnum=true;
					return;
				}
			});
			if(isnum){
				alert("所有分配金额不能为空！");
				return;
			}
			var tr = $('#zjqf_table tr :gt(1)');
			var zjqfJson=new Array();
			var wqsum=0,absum=0,zhsum=0;
			$.each(tr,function(index,item){
				var tds = $('#'+item.id+' input');
				if(index>0){
					wqsum+=parseInt($(tds[0]).val(),10);
					absum+=parseInt($(tds[1]).val(),10);
					zhsum+=parseInt($(tds[2]).val(),10);
				}
				var dq={id:item.id,wqgz:$(tds[0]).val(),abgc:$(tds[1]).val(),zhfz:$(tds[2]).val()}
				zjqfJson.push(dq);
			});
			var trsum = $('#zjqf_table tr:eq(2) input');
			if(parseInt($(trsum[0]).val(),10)==wqsum && parseInt($(trsum[1]).val(),10)==absum && parseInt($(trsum[2]).val(),10)==zhsum){
				var zjqf={'zjqf.id':$('#zjqfid').val(),'zjqf.nf':$('#selnf').val(),
						'zjqf.xzqhdm':$.cookie("unit").substring(5),'zjqf.zjqf':JSON.stringify(zjqfJson)};
				$.ajax({
					type:'post',
					url:'../../../jhgl/saveZjqf.do',
					data:zjqf,
					dataType:'json',
					success:function(data){
						if(data.result){
							alert("保存成功！");
						}
					}
				});	
			}else if( parseInt($(trsum[0]).val(),10)!=wqsum){
				alert("危桥改造的资金切分不正确");
			}else if(parseInt($(trsum[1]).val(),10)!=absum){
				alert("安保工程的资金切分不正确");
			}else if(parseInt($(trsum[2]).val(),10)!=zhsum){
				alert("灾害防治的资金切分不正确");
			}
		}
	</script>
</head>
<body>
	<div style="text-align: left;font-size: 12px;margin: 0px;width:100%;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
	            <td>
	                <div id="righttop">
						<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;资金切分</div>
					</div>
	            </td>
        	</tr>
        	<tr>
        		<td>
        			<div align="center">
						<table id="zjqf_table" width="800" class="table" cellpadding="0" cellspacing="0"
							style="margin-left: 10px; margin-top: 10px;">
							<tr align='center' height="28">
								<td colspan="4">
									<select id="selnf" onchange="loadZjqfByIdAndXzqh()">
										<option value="" selected="selected">--请选择---</option>
									</select>年资金切分情况
									<input id="zjqfid" type="hidden"/>
								</td>
							</tr>
							<tr align='center' height="28">
								<td width="200">单位名称</td>
								<td width="200">危桥改造(万元)</td>
								<td width="200">安保工程(万元)</td>
								<td>灾害防治(万元)</td>
							</tr>
							<tbody id="zjqf_table_tbody"></tbody>
						</table>
						<table width="600">
							<tr align="center">
								<td>
									<input value=" 保  存  " onclick="save()" style="text-align: center;" type="button"/>
								</td>
							</tr>
						</table>
					</div>
				</td>
        	</tr>
		</table>
	</div>
</body>
</html>
