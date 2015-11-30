<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安全生命防护工程项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css"/>
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
	var xmkid;
	var xmbm=$.cookie("dist")+new Date().getTime();
	function showLd(){
		$("#ldgrid").datagrid({    
			 url:'/jxzhpt/aqsmfh/selectSckaqsmfhld.do',
			 queryParams : {
				 	'xmkaqsmfh.xmbm':xmbm
				},
			    striped:true,
			   // pagination:true,
			   // rownumbers:true,
			    pageNumber:1,
			    pageSize:20,
		    columns:[[        
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){			
						return '<a href=javascript:delafld("'+row.id+'") style="text-decoration:none;color:#3399CC; ">删除</a>';			
				}},  
				{field:'xuh',title:'序号',width:60,align:'center'},
		        {field:'province',title:'省',width:160,align:'center'},
		        {field:'town',title:'市',width:120,align:'center'},
		        {field:'county',title:'县',width:120,align:'center'},
		        {field:'lxbm',title:'路线编码',width:120,align:'center'},
		        {field:'gydw',title:'管养单位',width:140,align:'center'},
		        {field:'xzqhdm',title:'行政区划代码',width:140,align:'center'},
		        {field:'lxmc',title:'路线名称',width:140,align:'center'},
		        {field:'jsdj',title:'技术等级',width:140,align:'center'},
		        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
		        {field:'cztzgs',title:'处置投资估算',width:140,align:'center'}
		    ]]
		});

	}
	
	$(function(){
		showLd();
		$('#faspsj').datebox({    
		    required:false,
		    formatter:function(date){
		    	var y = date.getFullYear();
		    	var m = date.getMonth()+1;
		    	var d = date.getDate();
		    	return y+'/'+m+'/'+d;
		    }
		}); 
		xmnf2("scjhnf");
		$("#qx_window").click(function(){
			parent.$('#sck_add').window('destroy');
		});	
		//autoCompleteLXBM();
		$("#save_button").click(function(){
			saveAbgc();
		});
		$("#add_button").click(function(){
			
			 if($("#ldxx").combobox('getValues')==''||$("#ldxx").combobox('getValues')==null){
				alert("请选择路段信息");
				return;
			}
		//	$("#tjldtb1").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;");
		// $("#tjldtb2").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;display:none");
			saveLd(); 
		});
		$("#tjld_button").click(function(){
			 loadobject();
				$("#fangx2,#jsdj1,#ldfl1,#fangx1,#pcsj1,#jtsgpcf,#jtsgfxdj,#glfxdj,#xbjyqx,#jckbgf,#jtl,#gldj1,#ldfl2,#pcsj2,#sgpb,#dgjw,#lxjw,#jtlpbzb,#gldj1").html('');
				$("#roadname,#unit,#unitcode,#roadstart,#roadend,#dist,#distcode,#xjgjnd,#province,#town,#county,#throadcode,#throadstart,#throadend,#lxxp,#doup,#sjbl,#lcxy,#hjfz,#xchbc").html('');
				$("#csxsss,#hul,#bzbx,#jshsxyd,#aqssqt,#tjgc,#hjzz,#bzbxcz,#jckcz,#jzhl,#jshsxydcz,#jshsxydcz,#aqssqtcz,#jhnf,#yhlc,#tzgs,#tsdq,#gltjpcf,#xuh").html('');
			$("#roadcode").val('');
			$("#tjldtb1").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;display:none");
			$("#tjldtb2").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;");
		});
		
		$("#cx_button").click(function(){
			 cxlx();
		});
	});
	var ldobj=new Object();
	
	function saveLd(){
		/* var qdzh=ldobj.roadstart.substr(1,ldobj.roadstart.length-1).replace('+','.');
		var zdzh=ldobj.roadend.substr(1,ldobj.roadend.length-1).replace('+','.');
		 */
		/* var data ="xmkaqsmfh.xuh="+$("#xuh").html()+"&xmkaqsmfh.province="+$("#province").html()+"&xmkaqsmfh.town="+$("#town").html()+"&xmkaqsmfh.county="+$("#county").html()+"&xmkaqsmfh.lxbm="+$("#roadcode").val()+"&xmkaqsmfh.lxmc="+$("#roadname").html()+"&xmkaqsmfh.gydw="+$("#unit").html()
		+"&xmkaqsmfh.gydwdm="+$("#unitcode").val()+"&xmkaqsmfh.xzqh="+$("#dist").html()+"&xmkaqsmfh.xzqhdm="+$("#distcode").val()+"&xmkaqsmfh.jsdj="+ldobj.jsdj
		+"&xmkaqsmfh.qdzh="+qdzh+"&xmkaqsmfh.zdzh="+zdzh+"&xmkaqsmfh.yhlc="+$("#yhlc").html()+"&xmkaqsmfh.xjgjnd="+$("#xjgjnd").html()
		+"&xmkaqsmfh.cztzgs="+$("#tzgs").html()+"&xmkaqsmfh.xmkid="+xmkid+"&xmkaqsmfh.xmbm="+xmbm; */
		 var data ="xmkaqsmfh.xmkid="+$("#ldxx").combobox('getValues')+"&xmkaqsmfh.xmbm="+xmbm; 
		
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/insertAqsmfhsckld.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("添加成功！");
					loadscktj();
					$("#tjldtb1").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;");
					$("#tjldtb2").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;display:none");
					$("#ldgrid").datagrid('reload');
				}else{
					alert('添加失败！');
				}
			}
		});
	}
	function delafld(id){
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/delafldsck.do',
	        data:"xmkaqsmfh.id="+id,
			dataType:'json',
			async:true,
			success:function(msg){
				if(Boolean(msg)){
					alert("删除成功！");
					$("#ldgrid").datagrid('reload');	
					loadscktj();
				}else{
					alert('删除失败！');
				}
			}
		});
	}
	var object=new Object();
	function loadobject(){
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/loadscktjld.do',
	        data:"xmkaqsmfh.xmbm="+xmbm,
			dataType:'json',
			success:function(item){
				object=item;
				}
			});
	}
	var tjldobj=new Object();
	function loadscktj(){
		tjldobj=null;
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/loadscktjld.do',
	        data:"xmkaqsmfh.xmbm="+xmbm,
			dataType:'json',
			success:function(item){
				if(item!=null){
					tjldobj=item;
					//审查
					$("#lxmc").val(item.lxmc);$("#scjsdj").val(item.jsdj);
					$("#qdzh").val(item.qdzh);$("#zdzh").val(item.zdzh);$("#scjsdj").val(item.jsdj);
					$("#scyhlc").val(item.yhlc);$("#scxjgjnd").val(item.xjgjnd);
					$("#cztzgs").val(item.cztzgs);$("#scjhnf").combobox('setValue',item.jhnf);
					loadUnit5("gydw",item.gydwdm,$.cookie("unit"));
					loadDist5("xzqh",item.xzqhdm,$.cookie("dist"));
					if(Math.round(item.cztzgs)>=500){
						$("#sfsqablbz").val("1");
						$("#ablbzsqwh").removeAttr('disabled');
						$("#sfsqablbz").removeAttr('disabled');
					}else{
						$("#sfsqablbz").val("0");
						$("#sfsqablbz").attr("disabled",'true');
						$("#ablbzsqwh").attr("disabled",'true');
					}
	 				var str="";
					if(item.str1!='0'&&item.str1!=''){
						str+="标志标线处置<input type='text' id='str1' style='width:70px;'>米，";
					}
					if(item.str2!='0'&&item.str2!=''){
						str+="交叉口综合处置<input type='text' id='str2' style='width:70px;'>处，";
					}
					if(item.str3!='0'&&item.str3!=''){
						str+="加装护栏警示诱导设施处置<input type='text' id='str3' style='width:70px;'>米，";
					}
					if(item.str4!='0'&&item.str4!=''){
						str+="涉及路线参数调整的土建工程<input type='text' id='str4' style='width:70px;'>处 <input type='text' id='str5' style='width:70px;'>立方米；";
					}
					if(item.str6!='0'&&item.str6!=''){
						str+="边坡、边沟或路域环境整治<input type='text' id='str6' style='width:70px;'>处 <input type='text' id='str7' style='width:70px;'>立方米；";
					}
					$("#jsnr").html(str);
				}
			}
		});
	}
	
function saveAbgc(){
		var sbthbmcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthbmcd=7;
		}
		var data ="xmkaqsmfh.province="+tjldobj.province+"&xmkaqsmfh.town="+tjldobj.town+"&xmkaqsmfh.county="+tjldobj.county+"&xmkaqsmfh.lxbm="+tjldobj.lxbm+"&xmkaqsmfh.lxmc="+$("#lxmc").val()+"&xmkaqsmfh.gydw="+$("#gydw").combobox('getText')
		+"&xmkaqsmfh.gydwdm="+$("#gydw").combobox('getValue')+"&xmkaqsmfh.xzqh="+$("#xzqh").combobox('getText')+"&xmkaqsmfh.xzqhdm="+$("#xzqh").combobox('getValue')+"&xmkaqsmfh.jsdj="+$("#scjsdj").val()
		+"&xmkaqsmfh.qdzh="+$("#qdzh").val()+"&xmkaqsmfh.zdzh="+$("#zdzh").val()+"&xmkaqsmfh.yhlc="+$("#scyhlc").val()+"&xmkaqsmfh.czzlc="+$("#czzlc").val()+"&xmkaqsmfh.xjgjnd="+$("#scxjgjnd").val()
		+"&xmkaqsmfh.fapgdw="+$("#fapgdw").val()+"&xmkaqsmfh.fascdw="+$("#fascdw").val()+"&xmkaqsmfh.faspsj="+$("#faspsj").datebox('getValue')+"&xmkaqsmfh.spwh="+$("#spwh").val()+"&xmkaqsmfh.cztzgs="+$("#cztzgs").val()+"&xmkaqsmfh.sfsqablbz="+$("#sfsqablbz").val()
 		+"&xmkaqsmfh.ablbzsqwh="+$("#ablbzsqwh").val()+"&xmkaqsmfh.jsxz="+$("#jsxz").val()+"&xmkaqsmfh.bz="+$("#bz").val()+"&xmkaqsmfh.jhnf="+$("#scjhnf").combobox('getValue')+"&xmkaqsmfh.sbthbmcd="+sbthbmcd+"&xmkaqsmfh.tbdwdm="+$.cookie("unit")+"&xmkaqsmfh.xmbm="+xmbm;
		var str="";
		if(tjldobj.str1!='0'&&tjldobj.str1!=''){
			str+= "标志标线处置"+$("#str1").val()+"米，";
			data+="&xmkaqsmfh.str1="+$("#str1").val();
		}
		if(tjldobj.str2!='0'&&tjldobj.str2!=''){
			str+="交叉口综合处置"+$("#str2").val()+"处，";
			data+="&xmkaqsmfh.str2="+$("#str2").val();
		}
		if(tjldobj.str3!='0'&&tjldobj.str3!=''){
			str+="加装护栏警示诱导设施处置"+$("#str3").val()+"米，";
			data+="&xmkaqsmfh.str3="+$("#str3").val();
		}
		if(tjldobj.str4!='0'&&tjldobj.str4!=''){
			str+="涉及路线参数调整的土建工程"+$("#str4").val()+"处 "+$("#str5").val()+"立方米；";
			data+="&xmkaqsmfh.str4="+$("#str4").val()+"&xmkaqsmfh.str5="+$("#str5").val();
		}
		if(tjldobj.str6!='0'&&tjldobj.str6!=''){
			str+="边坡、边沟或路域环境整治"+$("#str6").val()+"处 "+$("#str7").val()+"立方米；";
			data+="&xmkaqsmfh.str6="+$("#str6").val()+"&xmkaqsmfh.str7="+$("#str7").val();
		}
		data+="&xmkaqsmfh.jsnr="+str;
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/insertAqsmfhsck.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("保存成功！");
					parent.$("#grid").datagrid('reload');
					parent.loadtj();
					parent.$('#sck_add').window('destroy');
					
				}else{
					alert('保存失败！');
				}
			}
		});
	}
	
	function cxlx(){
			var roadcode = '';
			if(object!=null){
				roadcode=object.lxbm;
			}else{
				roadcode=$("#roadcode").val().toUpperCase();
			}
			var unitcode = '';
			if(object!=null){
				unitcode=object.gydwdm;
			}else{
				unitcode=$.cookie("unit2");
			}
			var distcode = '';
			if(object!=null){
				distcode=object.xzqhdm;
			}else{
				distcode=$.cookie("dist2");
			}
			var data="roadcode="+roadcode+"&unitcode="+unitcode+"&distcode="+distcode;
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/aqsmfhJckGpsRoad.do',
	        data:data,
			dataType:'json',
			success:function(row){
				if(row!=null){
					var years=[];
					 for(var i=0;i<row.length;i++){
 					var text=row[i].roadcode.replace(/(\s*$)/g,"")+"("+row[i].roadstart+","+row[i].roadend+")"+row[i].roadname.replace(/(\s*$)/g,"");
						years.push({text:(text),value:(row[i].id)});
					} 
					$('#ldxx').combobox({
					    data:years,
					    valueField:'value',
					    textField:'text',
					    multiple:true,
					    formatter:function(row){
							var opts = $(this).combobox('options');
							return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
						},
						onSelect:function(record){
							var opts = $(this).combobox('options');
							if(record[opts.valueField]==""){
								var values =new Array();
								var datas = $('#ldxx').combobox("getData");
								$.each(datas,function(index,item){
									values.push(item.value);
									$('#id'+item.value).attr('checked', true);
								});
								$('#ldxx').combobox("setValues",values);
							}else{
								$('#id'+record.value).attr('checked', true);
							}
						},
						onUnselect:function(record){
							var opts = $(this).combobox('options');
							var datas = $('#ldxx').combobox("getData");
							var values = $('#ldxx').combobox("getValues");
							$('#ldxx').combobox("clear");
							if(record[opts.valueField]!=""){
								if(jQuery.inArray("",values)>=0){
									values.splice(jQuery.inArray("",values),1);
								}
								$.each(datas,function(index,item){
									if(jQuery.inArray(""+item.value,values)<0){
										$('#id'+item.value).attr('checked', false);
									}
								});
								$('#ldxx').combobox("setValues",values);
							}else{
								$.each(datas,function(index,item){
									$('#id'+item.value).attr('checked', false);
								});
							}
						}
					});
					
				}
				
			}
		});
	  			
		//
	}
</script>
		<table style="width: 100%; background-color: #aacbf8; font-size: 12px;"
			border="0" cellpadding="3" cellspacing="1" id='tjldtb1'>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					<a href="javascript:void(0)" id="tjld_button"
						class="easyui-linkbutton" plain="false" iconCls="icon-add">添加路段</a>
				</td>
				</tr>
			</table>
		<table style="width: 100%; background-color: #aacbf8; font-size: 12px;display: none;"
			border="0" cellpadding="3" cellspacing="1" id='tjldtb2'>
			
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					请先填写路线编码-->查询-->选择路段-->保存路段
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:130px" align="right">请您输入路线编码：</td>
				<td  style="background-color: #ffffff; height: 20px;width:200px" align="left">
					<input type="text" id='roadcode'>
					<a href="javascript:void(0)" id="cx_button"
						class="easyui-linkbutton" plain="true" iconCls="icon-save">查询</a>
					 
			</tr>
			<tr><td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:130px" align="right">请您选择路段：</td>
			<td  style="background-color: #ffffff; height: 20px;width:200px" align="left">
				<input type="text" id='ldxx'>
				<a href="javascript:void(0)" id="add_button"
						class="easyui-linkbutton" plain="true" iconCls="icon-save">保存路段</a></td>
				
				</tr>
		</table>
		<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			

				<tr style="height: 25px;" >
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
						安全生命防护工程项目路段信息
					</td>
				</tr>
				<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<table id="ldgrid" width="100%" ></table>
					</td>				
				</tr>
	
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安全生命防护工程项目审查信息
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="gydw"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="xzqh"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="lxmc"></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="scjsdj"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="qdzh"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="zdzh"></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="scyhlc"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置总里程：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="czzlc"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="scxjgjnd"></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估单位：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="fapgdw"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="fascdw"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审批时间(年/月/日)：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="faspsj"></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="spwh"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置投资估算(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="cztzgs"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否申请按比例补助(0、否1、是)：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="sfsqablbz"></td>
				
			</tr>		
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按比例补助申请文号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="ablbzsqwh"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质(1、中修2、大修)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="jsxz"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="scjhnf"></td>
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id='jsnr'> </span></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备注(批复文件路线编码及桩号如为老编码，需在备注栏说明)：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<textarea id='bz' rows="2" style="width:99%"></textarea>

				</td>
				
			</tr>	
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff; height: 30px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>