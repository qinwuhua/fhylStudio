<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<style type="text/css">
		.table{border: 1px solid #CBE0FF;}
		.table tr{border: 1px solid #CBE0FF;}
		.table tr td{border: 1px solid #CBE0FF;}
	</style>
	<script type="text/javascript">
		$(function(){
			var gydw=$.cookie("unit");
			if(gydw=="36"){
				loadChildGydw("21101360000");
				loadChildGydw("11101360000");
			}else{
				loadChildGydw(gydw);
			}
			var myDate = new Date();
			for(var i=0;i<=10;i++){
				var option="<option value='"+(myDate.getFullYear()-i)+"'>"+(myDate.getFullYear()-i)+"</option>";
				$('#selnf').append(option);
			}
		});
		function loadChildGydw(gydw){
			$.ajax({
				type:'post',
				async:false,
				url:'../../../jhgl/queryChildGydw.do',
				data:'xzqh.id='+gydw,
				dataType:'json',
				success:function(data){
					$.each(data,function(index,item){
						$('#zjqf_table_tbody').append('<tr name="'+gydw+'" id="'+item.id+'"><td align="center">'+item.name+'</td><td align="center"><input type="number" width="60" /></td><td  align="center"><input type="number" width="60" /></td><td  align="center"><input type="number" width="60" /><input type="hidden" value="'+item.parent+'"/></td></tr>');
					});
				}
			});
		}
		
		function loadZjqfMessage(){
			if($.cookie("unit")=="36"){
				loadZjqf("11101360000");
				loadZjqf("21101360000");
			}else{
				loadZjqf($.cookie("unit"));
			}
		}
		
		function loadZjqf(gydwbm){
			var zjqf={'zjqf.gydwbm':gydwbm,'zjqf.nf':$('#selnf').val()};
			$.ajax({
				type:'post',
				async:false,
				url:'../../../jhgl/queryZjqfByGydwbm.do',
				data:zjqf,
				dataType:'json',
				success:function(data){
					if(data.length>0){
						$.each(data,function(index,item){
							var input=$("#"+item.gydwbm+" input");
							$(input[0]).val(item.wqgz);
							$(input[1]).val(item.abgc);
							$(input[2]).val(item.zhfz);
							$(input[3]).val(item.parent);
							if($.cookie("unit")!="36" && $.cookie("unit")==item.gydwbm){
								$(input[0]).attr("disabled","disabled");
								$(input[1]).attr("disabled","disabled");
								$(input[2]).attr("disabled","disabled");
							}
						});
					}else{
						var tr = $("tr[name='"+gydwbm+"']");
						$.each(tr,function(index,item){
							var inputList = $("#"+item.id+" input");
							$(inputList[0]).val("");
							$(inputList[1]).val("");
							$(inputList[2]).val("");
						});
					}
				}
			});
		}
		
		function save(){
			if($('#selnf').val()!=""){
				var zjqf={'zjqf.gydwbm':null,'zjqf.parent':null,'zjqf.nf':null,
						'zjqf.wqgz':null,'zjqf.abgc':null,'zjqf.zhfz':null};
				if($.cookie("unit")=="36"){
					if(jisuan("11101360000") && jisuan("21101360000")){
						var jtj = caiji("11101360000");
						var glj = caiji("21101360000");
						zjqf['zjqf.gydwbm']=jtj.gydwbm+"-"+glj.gydwbm;
						zjqf['zjqf.parent']=jtj.parent+"-"+glj.parent;
						zjqf['zjqf.nf']=jtj.nf+"-"+glj.nf;
						zjqf['zjqf.wqgz']=jtj.wqgz+"-"+glj.wqgz;
						zjqf['zjqf.abgc']=jtj.abgc+"-"+glj.abgc;
						zjqf['zjqf.zhfz']=jtj.zhfz+"-"+glj.zhfz;
					}else{
						return;
					}
				}else{
					if(jisuan($.cookie("unit"))){
						var data = caiji($.cookie("unit"));
						zjqf['zjqf.gydwbm']=data.gydwbm;
						zjqf['zjqf.parent']=data.parent;
						zjqf['zjqf.nf']=data.nf;
						zjqf['zjqf.wqgz']=data.wqgz;
						zjqf['zjqf.abgc']=data.abgc;
						zjqf['zjqf.zhfz']=data.zhfz;
					}else{
						return;
					}
				}
				$.ajax({
					type:'post',
					url:'../../../jhgl/editOrSave.do',
					data:zjqf,
					dataType:'json',
					success:function(data){
						alert("资金切分成功！");
					}
				});
			}else{
				alert("请选择年份！");
			}
		}
		
		function jisuan(name){
			var sumwq=0,sumab=0,sumzh=0;
			var wq=0,ab=0,zh=0;
			var jtj = $("tr[name='"+name+"']");
			$.each(jtj,function(index,item){
				var inputList = $("#"+item.id+" input");
				if(name!=item.id){
					if($(inputList[0]).val()!=""){
						sumwq=Number(sumwq)+Number($(inputList[0]).val());
					}
					if($(inputList[1]).val()!=""){
						sumab=Number(sumab)+Number($(inputList[1]).val());
					}
					if($(inputList[2]).val()!=""){
						sumzh=Number(sumzh)+Number($(inputList[2]).val());
					}
				}else{
					if($(inputList[0]).val()!=""){
						wq=Number($(inputList[0]).val());
					}
					if($(inputList[1]).val()!=""){
						ab=Number($(inputList[1]).val());
					}
					if($(inputList[2]).val()!=""){
						zh=Number($(inputList[2]).val());
					}
				}
			});
			if(sumwq>wq){
				alert("请检查危桥改造的资金切分！");
			}else if(sumab>ab){
				alert("请检查安保工程的资金切分！");
			}else if(sumzh>zh){
				alert("请检查灾害防止的资金切分！");
			}
			return (wq>=sumwq && ab>=sumab && zh>=sumzh);
		}
		
		function caiji(name){
			var zj = {gydwbm:"",parent:"",nf:"",wqgz:"",abgc:"",zhfz:""};
			var zjqf={'zjqf.gydwbm':null,'zjqf.parent':null,'zjqf.nf':null,'zjqf.wqgz':null,
					'zjqf.abgc':null,'zjqf.zhfz':null};
			var tr = $("tr[name='"+name+"']");
			$.each(tr,function(index,item){
				var inputList = $("#"+item.id+" input");
				zjqf['zjqf.gydwbm']=item.id;
				zjqf['zjqf.parent']=$(inputList[3]).val();
				zjqf['zjqf.nf']=$('#selnf').val();
				zjqf['zjqf.wqgz']=$(inputList[0]).val();
				zjqf['zjqf.abgc']=$(inputList[1]).val();
				zjqf['zjqf.zhfz']=$(inputList[2]).val();
				if(index==0){
					zj.gydwbm+=item.id;
					zj.parent+=$(inputList[3]).val();
					zj.nf+=$('#selnf').val();;
					zj.wqgz+=$(inputList[0]).val();;
					zj.abgc+=$(inputList[1]).val();
					zj.zhfz+=$(inputList[2]).val();
				}else{
					zj.gydwbm+="-"+item.id;
					zj.parent+="-"+$(inputList[3]).val();
					zj.nf+="-"+$('#selnf').val();;
					zj.wqgz+="- "+$(inputList[0]).val();;
					zj.abgc+="- "+$(inputList[1]).val();
					zj.zhfz+="- "+$(inputList[2]).val();
				}
			});
			return zj;
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
        				<input id="zjqfidglj" type="hidden"/>
						<input id="zjqfidjtj" type="hidden"/>
						<table id="zjqf_table" width="800" class="table" cellpadding="0" cellspacing="0"
							style="margin-left: 10px; margin-top: 10px;">
							<tr align='center' height="28">
								<td colspan="4">
									<select id="selnf" onchange="loadZjqfMessage()">
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
