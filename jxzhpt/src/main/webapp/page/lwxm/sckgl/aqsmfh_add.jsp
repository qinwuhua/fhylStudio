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
		autoCompleteLXBM();
		$("#save_button").click(function(){
			saveAbgc();
		});
		$("#add_button").click(function(){
			if($("#roadcode").val()==''||$("#roadcode").val()==null){
				alert("请输入路段信息");
				return;
			}
			$("#tjldtb1").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;");
			$("#tjldtb2").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;display:none");
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
	});
	var ldobj=new Object();
	function autoCompleteLXBM(){
		
		ldobj=null;
		var url = "/jxzhpt/aqsmfh/aqsmfhJckGpsRoad.do";
		$("#roadcode").autocomplete(url, {
			multiple : false,
			minChars :2,
			multipleSeparator : ' ',
			mustMatch: true,
	  		cacheLength : 0,
	  		delay : 200,
	  		max : 50,
	  		extraParams : {
	  			roadcode:function() {
	  				var d = '';
	  				if(object!=null){
	  					d=object.lxbm;
	  				}else{
	  					d=$("#roadcode").val().toUpperCase();
	  				}
	  				return d;
	  			},
	  			unitcode:function() {
	  				var d = '';
	  				if(object!=null){
	  					d=object.gydwdm;
	  				}else{
	  					d=$.cookie("unit2");
	  				}
	  				if(d=='_____36') return "";
	  				else return d;
	  			},
	  			distcode:function() {
	  				var d = '';
	  				if(object!=null){
	  					d=object.xzqhdm;
	  				}else{
	  					d=$.cookie("dist2");
	  				}
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
	  						value : row.roadcode.replace(/(\s*$)/g,""),
	  						result : row.roadcode.replace(/(\s*$)/g,"")
	  					};
	  				});
	  			return aa;
	  		},
	  		formatItem : function(row, i, max) {
	  			return row.roadcode.replace(/(\s*$)/g,"")+"("+row.roadstart+","+row.roadend+")"+"<br/>"+row.roadname.replace(/(\s*$)/g,"");
	  		}
	  	}).result(
				function(e, item) {
					if(item==undefined) return ;
					
				//	$("#lxmc,#qdzh,#zdzh,#zlc,#xjnd,#lxjsdj,#gydw").attr("value",'');
					xmkid=item.id;
					ldobj=item;
					if(item.jsdj=='1'||item.jsdj=='2'){
						jsdjmb="1";
						$("#yjej").attr('style','');
						$("#sjsj").attr('style','display: none');
						$("#jsdj1").html(item.jsdj);$("#fangx1").html(item.fangx);
						$("#ldfl1").html(item.ldfl);$("#pcsj1").html(item.pcsj);$("#jtsgpcf").html(item.jtsgpcf);$("#jtsgfxdj").html(item.jtsgfxdj);$("#glfxdj").html(item.glfxdj);$("#xbjyqx").html(item.xbjyqx);$("#jckbgf").html(item.jckbgf);$("#jtl").html(item.jtl);$("#gldj1").html(item.gldj);
					}else{
						jsdjmb="2";
						$("#yjej").attr('style','display: none');
						$("#sjsj").attr('style','');
						$("#jsdj2").html(item.jsdj);$("#fangx2").html(item.fangx);
						$("#ldfl2").html(item.ldfl);$("#pcsj2").html(item.pcsj);$("#sgpb").html(item.sgpb);$("#dgjw").html(item.dgjw);$("#lxjw").html(item.lxjw);$("#jtlpbzb").html(item.jtlpbzb);$("#gldj2").html(item.gldj);
					}
					$("#roadcode").html(item.roadcode);$("#roadname").html(item.roadname);$("#unit").html(item.unit);$("#unitcode").val(item.unitcode);$("#roadstart").html(item.roadstart);
					$("#roadend").html(item.roadend);$("#dist").html(item.dist);$("#distcode").val(item.distcode);$("#xjgjnd").html(item.xjgjnd);
					$("#province").html(item.province);$("#town").html(item.town);$("#county").html(item.county);$("#throadcode").html(item.throadcode);$("#throadstart").html(item.throadstart);$("#throadend").html(item.throadend);
					$("#lxxp").html(item.lxxp);$("#doup").html(item.doup);$("#sjbl").html(item.sjbl);$("#lcxy").html(item.lcxy);$("#hjfz").html(item.hjfz);$("#xchbc").html(item.xchbc);
					$("#csxsss").html(item.csxsss);$("#hul").html(item.hul);$("#bzbx").html(item.bzbx);$("#jshsxyd").html(item.jshsxyd);$("#aqssqt").html(item.aqssqt);$("#tjgc").html(item.tjgc);
					$("#hjzz").html(item.hjzz);$("#bzbxcz").html(item.bzbxcz);$("#jckcz").html(item.jckcz);$("#jzhl").html(item.jzhl);$("#jshsxydcz").html(item.jshsxydcz);$("#aqssqtcz").html(item.aqssqtcz);
					$("#jhnf").html(item.jhnf);$("#yhlc").html(item.yhlc);$("#tzgs").html(item.tzgs);$("#tsdq").html(item.tsdq);
					$("#gltjpcf").html(item.gltjpcf);$("#xuh").html(item.xuh);
					
					
				});
	}

	
	function saveLd(){
		var qdzh=ldobj.roadstart.substr(1,ldobj.roadstart.length-1).replace('+','.');
		var zdzh=ldobj.roadend.substr(1,ldobj.roadend.length-1).replace('+','.');
		
		var data ="xmkaqsmfh.xuh="+$("#xuh").html()+"&xmkaqsmfh.province="+$("#province").html()+"&xmkaqsmfh.town="+$("#town").html()+"&xmkaqsmfh.county="+$("#county").html()+"&xmkaqsmfh.lxbm="+$("#roadcode").val()+"&xmkaqsmfh.lxmc="+$("#roadname").html()+"&xmkaqsmfh.gydw="+$("#unit").html()
		+"&xmkaqsmfh.gydwdm="+$("#unitcode").val()+"&xmkaqsmfh.xzqh="+$("#dist").html()+"&xmkaqsmfh.xzqhdm="+$("#distcode").val()+"&xmkaqsmfh.jsdj="+ldobj.jsdj
		+"&xmkaqsmfh.qdzh="+qdzh+"&xmkaqsmfh.zdzh="+zdzh+"&xmkaqsmfh.yhlc="+$("#yhlc").html()+"&xmkaqsmfh.xjgjnd="+$("#xjgjnd").html()
		+"&xmkaqsmfh.cztzgs="+$("#tzgs").html()+"&xmkaqsmfh.xmkid="+xmkid+"&xmkaqsmfh.xmbm="+xmbm;
		if($("#bzbxcz").html()=="1"){
			data+="&xmkaqsmfh.str1="+'1';
		}
		if($("#jckcz").html()=="1"){
			data+="&xmkaqsmfh.str2="+'1';
		}
		if($("#jzhl").html()=="1"){
			data+="&xmkaqsmfh.str3="+'1';
		}
		if($("#tjgc").html()=="1"){
			data+="&xmkaqsmfh.str4="+'1'+"&xmkaqsmfh.str5="+'1';
		}
		if($("#hjzz").html()=="1"){
			data+="&xmkaqsmfh.str6="+'1'+"&xmkaqsmfh.str7="+'1';
		}
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/insertAqsmfhsckld.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("添加成功！");
					loadscktj();
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
					if(item.str1=="1"){
						str+="标志标线处置<input type='text' id='str1' style='width:70px;'>米，";
					}
					if(item.str2=="1"){
						str+="交叉口综合处置<input type='text' id='str2' style='width:70px;'>处，";
					}
					if(item.str3=="1"){
						str+="加装护栏警示诱导设施处置<input type='text' id='str3' style='width:70px;'>米，";
					}
					if(item.str4=="1"){
						str+="涉及路线参数调整的土建工程<input type='text' id='str4' style='width:70px;'>处 <input type='text' id='str5' style='width:70px;'>立方米；";
					}
					if(item.str6=="1"){
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
		if(tjldobj.str1=="1"){
			str+= "标志标线处置"+$("#str1").val()+"米，";
			data+="&xmkaqsmfh.str1="+$("#str1").val();
		}
		if(tjldobj.str2=="1"){
			str+="交叉口综合处置"+$("#str2").val()+"处，";
			data+="&xmkaqsmfh.str2="+$("#str2").val();
		}
		if(tjldobj.str3=="1"){
			str+="加装护栏警示诱导设施处置"+$("#str3").val()+"米，";
			data+="&xmkaqsmfh.str3="+$("#str3").val();
		}
		if(tjldobj.str4=="1"){
			str+="涉及路线参数调整的土建工程"+$("#str4").val()+"处 "+$("#str5").val()+"立方米；";
			data+="&xmkaqsmfh.str4="+$("#str4").val()+"&xmkaqsmfh.str5="+$("#str5").val();
		}
		if(tjldobj.str6=="1"){
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
					安全生命防护工程项目基本信息
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:130px" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:200px" align="left">
					<input type="text" id='roadcode'></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:130px" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:200px" align="left">
					<span  id="roadname" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:130px" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:200px" align="left">
					<span id="unit" ></span>
					<input type="hidden" id='unitcode'>
					</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="dist" ></span>
					<input type="hidden" id='distcode'>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">省：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="province"  ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">市：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="town" ></span></td>
				</tr>	
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="county" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桩号起点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span  id="roadstart" ></span><br>
					<span id="qd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桩号终点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left"><br>
					<span id="roadend" ></span>
					<span id="zd"></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>公路编号：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="throadcode" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>桩号起点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="throadstart" ></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>桩号终点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="throadend" ></span>
					</td>
				</tr>
			
			<tbody id='yjej' style="display: none">
			
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级(1、一级 2、二级)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jsdj1" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方向(1、桩号大到小2、桩号小到大3、不分方向)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="fangx1" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路段分类(A、B、C)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="ldfl1" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">排查时间(年 / 月)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				<span id="pcsj1" ></span>	</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通事故排查方法(1、事故风险评估2、事故多发点段识别)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jtsgpcf" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通事故风险等级(1、2、3、4、5级)或是否事故多发点段(0、否 6、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jtsgfxdj" ></span>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路条件排查方法(1、公路风险评估2、公路条件识别)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gltjpcf" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路风险等级(1、2、3、4、5级)或是否事故多发点段(0、否 6、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="glfxdj" ></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">小半径圆曲线(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xbjyqx" ></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交叉口不规范(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jckbgf" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通量(AADT)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jtl" ></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gldj1" ></span></td>
			</tr>
		
			</tbody>
			<tbody id="sjsj" style="display: none">
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级(3、三级4、四级)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jsdj2" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方向(1、桩号大到小2、桩号小到大3、不分方向)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="fangx2" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路段分类(A.1、A.2、A.3、B.1、B.2、B.3、B.4、C)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="ldfl2" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">排查时间(年 / 月)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pcsj2" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">符合事故判别指标(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sgpb" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">单个急弯(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dgjw" ></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">连续急弯(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lsjw" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">符合交通量判别指标(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jtlpbzb" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gldj2" ></span>
				</td>
			</tr>
		
			</tbody>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">连续下坡(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="lxxp" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">陡坡(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="doup" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">视距不良(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="sjbl" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路侧险要(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="lcxy" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">环境复杂(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="hjfz" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通行校车或班线车(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="xchbc" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">运行车速或路段限速或设计速度(km/h)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="csxsss" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">护栏(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="hul" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">标志标线(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="bzbx" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">警示和视线诱导设施(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jshsxyd" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">其他路段既有安全设施信息(用文字简要说明)：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px; " align="left">
					<span id="aqssqt" style="width: 356px"></span></td>
				
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">涉及路线参数调整的土建工程(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="tjgc" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">边坡、边沟或路域环境整治(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="hjzz" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">标志标线处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="bzbxcz" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交叉口综合处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jckcz" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">加装护栏(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jzhl" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">警示诱导设施处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="jshsxydcz" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划实施安防工程年份(年)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jhnf" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">其他拟新采取的处置措施(用文字简要说明)：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="aqssqtcz" style="width: 356px"></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程(公里)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="yhlc" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置投资估算(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="tzgs" ></span><br>
					<span id='bbzts'></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修改建年度(年)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="xjgjnd" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<span id='tsdq'></span></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				序号：<span id='xuh'></span>
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<a href="javascript:void(0)" id="add_button"
						class="easyui-linkbutton" plain="true" iconCls="icon-save">保存路段</a>
				</td>
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