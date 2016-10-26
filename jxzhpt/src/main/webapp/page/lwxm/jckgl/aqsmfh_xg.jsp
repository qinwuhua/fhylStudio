<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
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
	var jsdjmb;
	var qdStr;
	var zdStr;
	function loadXX(){
		var item=parent.obj;
		if(item.jsdj=='1'||item.jsdj=='2'){
			jsdjmb="1";
			$("#yjej").attr('style','');
			$("#sjsj").attr('style','display: none');
			$("#jsdj1").val(item.jsdj);$("#fangx1").val(item.fangx);
			$("#ldfl1").val(item.ldfl);$("#pcsj1").val(item.pcsj);$("#jtsgpcf").val(item.jtsgpcf);$("#jtsgfxdj").val(item.jtsgfxdj);$("#glfxdj").val(item.glfxdj);$("#xbjyqx").val(item.xbjyqx);$("#jckbgf").val(item.jckbgf);$("#jtl").val(item.jtl);$("#gldj1").val(item.gldj);
		}else{
			jsdjmb="2";
			$("#yjej").attr('style','display: none');
			$("#sjsj").attr('style','');
			$("#jsdj2").val(item.jsdj);$("#fangx2").val(item.fangx);
			$("#ldfl2").val(item.ldfl);$("#pcsj2").val(item.pcsj);$("#sgpb").val(item.sgpb);$("#dgjw").val(item.dgjw);$("#lxjw").val(item.lxjw);$("#jtlpbzb").val(item.jtlpbzb);$("#gldj2").val(item.gldj);
		}
		$("#xuh").val(item.xuh);
		$("#roadcode").val(item.roadcode);$("#roadname").val(item.roadname);$("#unit").val(item.unit);$("#unitcode").val(item.unitcode);$("#roadstart").val(item.roadstart);
		$("#roadend").val(item.roadend);$("#dist").val(item.dist);$("#distcode").val(item.distcode);$("#xjgjnd").val(item.xjgjnd);
		$("#province").val(item.province);$("#town").val(item.town);$("#county").val(item.county);$("#throadcode").val(item.throadcode);$("#throadstart").val(item.throadstart);$("#throadend").val(item.throadend);
		$("#lxxp").val(item.lxxp);$("#doup").val(item.doup);$("#sjbl").val(item.sjbl);$("#lcxy").val(item.lcxy);$("#hjfz").val(item.hjfz);$("#xchbc").val(item.xchbc);
		$("#csxsss").val(item.csxsss);$("#hul").val(item.hul);$("#bzbx").val(item.bzbx);$("#jshsxyd").val(item.jshsxyd);$("#aqssqt").val(item.aqssqt);$("#tjgc").val(item.tjgc);
		$("#hjzz").val(item.hjzz);$("#bzbxcz").val(item.bzbxcz);$("#jckcz").val(item.jckcz);$("#jzhl").val(item.jzhl);$("#jshsxydcz").val(item.jshsxydcz);$("#aqssqtcz").val(item.aqssqtcz);
		$("#jhnf").combobox('getValue',item.jhnf);$("#yhlc").val(item.yhlc);$("#tzgs").val(item.tzgs);$("#tsdq").html(item.tsdq);
		$("#gltjpcf").val(item.gltjpcf);$("#glfxdj").val(item.glfxdj);
		jsnsqbz();
		qdStr=item.roadstart;
		zdStr=item.roadend;
		$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+item.roadstart);
		$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+item.roadend);
	
	}
	$(function(){
		xmnf2("jhnf");
		loadXX();
		$("#save_button").click(function(){
			if($("#roadcode").val()=="" || $("#roadcode").val()==null){
				alert("请填写路线编码！");
				$("#roadcode").focus();
				return false;
			}
			if(jsdjmb=="1"){
				if($("#jsdj1").val()=="" || $("#jsdj1").val()==null){
					alert("请填写技术等级！");
					$("#jsdj1").focus();
					return false;
				}
			}else{
				if($("#jsdj2").val()=="" || $("#jsdj2").val()==null){
					alert("请填写技术等级！");
					$("#jsdj2").focus();
					return false;
				}
			}
			var str1=$("#roadstart").val();
			var str2=$("#roadend").val();
			var qdzh=str1.substr(1,str1.length-1).replace('+','.');
			var qdzh1=qdStr.substr(1,qdStr.length-1).replace('+','.');
			var zdzh=str2.substr(1,str2.length-1).replace('+','.');
			var zdzh1=zdStr.substr(1,zdStr.length-1).replace('+','.');
			if(parseFloat(qdzh)*1000<parseFloat(qdzh1)*1000){
				alert("对不起，起点桩号不能小于"+qdStr+"！");
				$("#roadstart").focus();
				return false;
			}
			if(parseFloat(zdzh)*1000>parseFloat(zdzh1)*1000){
				alert("对不起，止点桩号不能大于"+zdStr+"！");
				$("#roadend").focus();
				return false;
			}
			saveAbgc();
		});
		$("#qx_window").click(function(){
			parent.$('#lxxx').window('destroy');
		});	
		autoCompleteroadcode();
	});
	function autoCompleteroadcode(){
		var url = "/jxzhpt/aqsmfh/smfhGpsroad.do";
		$("#roadcode").autocomplete(url, {
			multiple : false,
			minChars :4,
			multipleSeparator : ' ',
			mustMatch: true,
	  		cacheLength : 0,
	  		delay : 200,
	  		max : 150,
	  		extraParams : {
	  			roadcode:function() {
	  				var d = $("#roadcode").val().toUpperCase();
	  				return d;
	  			},
	  			unitcode:function() {
	  				var d = $.cookie("unit2");
	  				if(d=='_____36') return "";
	  				else return d;
	  			},
	  			distcode:function() {
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
	  						value : row.roadcode.replace(/(\s*$)/g,""),
	  						result : row.roadcode.replace(/(\s*$)/g,"")
	  					};
	  				});
	  			return aa;
	  		},
	  		formatItem : function(row, i, max) {
	  			return row.roadcode.replace(/(\s*$)/g,"")+"("+row.roadstart+","+row.roadend+")"+""+row.roadname.replace(/(\s*$)/g,"");
	  		}
	  	}).result(
				function(e, item) {
					if(item==undefined) return ;
					selectTSDQ(item.distcode);
					$("#fangx2,#jsdj1,#ldfl1,#fangx1,#pcsj1,#jtsgpcf,#jtsgfxdj,#glfxdj,#xbjyqx,#jckbgf,#jtl,#gldj1,#ldfl2,#pcsj2,#sgpb,#dgjw,#lxjw,#jtlpbzb,#gldj1").val('');
					$("#roadname,#unit,#unitcode,#roadstart,#roadend,#dist,#distcode,#xjgjnd,#town,#county,#throadcode,#throadstart,#throadend,#lxxp,#doup,#sjbl,#lcxy,#hjfz,#xchbc").val('');
					$("#csxsss,#hul,#bzbx,#jshsxyd,#aqssqt,#tjgc,#hjzz,#bzbxcz,#jckcz,#jzhl,#jshsxydcz,#jshsxydcz,#aqssqtcz,#jhnf,#yhlc,#tzgs,#tsdq,#gltjpcf,#xuh").val('');
					$("#tsdq").html('');
					$("#roadname").val(item.roadname);
					$("#unit").val(item.unit);
					$("#dist").val(item.dist);
					$("#unitcode").val(item.unitcode);
					$("#distcode").val(item.distcode);
					$("#roadstart").val("K"+item.roadstart.replace('.','+'));
					$("#roadend").val("K"+item.roadend.replace('.','+'));
					$("#xjgjnd").val(item.xjgjnd);
					if(item.jsdj=='一级公路'||item.jsdj=='二级公路'){
						jsdjmb="1";
						$("#yjej").attr('style','');
						$("#sjsj").attr('style','display: none');
						if(item.jsdj=='一级公路')
							$("#jsdj1").val("1");
						else
							$("#jsdj1").val("2");
						$("#gldj1").val(item.gldj);
					}else if(item.jsdj=='三级公路'||item.jsdj=='四级公路'){
						jsdjmb="2";
						$("#yjej").attr('style','display: none');
						$("#sjsj").attr('style','');
						if(item.jsdj=='三级公路')
							$("#jsdj2").val("3");
						else
							$("#jsdj2").val("4");
						$("#gldj2").val(item.gldj);
					}else{
						if(confirm("该路线技术等级不属于1234级公路，选择确定按12级否则按34级，请选择！")){
							jsdjmb="1";
							$("#yjej").attr('style','');
							$("#sjsj").attr('style','display: none');
							$("#gldj1").val(item.gldj);
						}else{
							jsdjmb="2";
							$("#yjej").attr('style','display: none');
							$("#sjsj").attr('style','');
							$("#gldj2").val(item.gldj);
						}
					}
					$("#xmzt").html('待上报');
					qdStr="K"+item.roadstart.replace('.','+');
					zdStr="K"+item.roadend.replace('.','+');
					$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+"K"+item.roadstart.replace('.','+'));
					$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+"K"+item.roadend.replace('.','+'));
				});
	}
	function jszlc(str1,str2){
		var qdzh=str1.substr(1,str1.length-1).replace('+','.');
		var zdzh=str2.substr(1,str2.length-1).replace('+','.');
		var zlc=0;
		zlc=Math.abs(accSub(parseFloat(zdzh),parseFloat(qdzh)));
		return zlc;
	}
	function saveAbgc(){
		
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		var zlc=jszlc($("#roadstart").val(),$("#roadend").val());
		var data ="xmkaqsmfh.roadcode="+$("#roadcode").val()+"&xmkaqsmfh.roadname="+$("#roadname").val()+"&xmkaqsmfh.unit="+$("#unit").val()+"&xmkaqsmfh.unitcode="+$("#unitcode").val()+"&xmkaqsmfh.roadstart="+$("#roadstart").val().replace(/\+/g,"%2B")
		+"&xmkaqsmfh.roadend="+$("#roadend").val().replace(/\+/g,"%2B")+"&xmkaqsmfh.zlc="+zlc+"&xmkaqsmfh.dist="+$("#dist").val()+"&xmkaqsmfh.distcode="+$("#distcode").val()+"&xmkaqsmfh.xjgjnd="+$("#xjgjnd").val()+"&xmkaqsmfh.xuh="+$("#xuh").val()+
		"&xmkaqsmfh.province="+$("#province").val()+"&xmkaqsmfh.town="+$("#town").val()+"&xmkaqsmfh.county="+$("#county").val()+"&xmkaqsmfh.throadcode="+$("#throadcode").val()+"&xmkaqsmfh.throadstart="+$("#throadstart").val().replace(/\+/g,"%2B")+"&xmkaqsmfh.throadend="+$("#throadend").val().replace(/\+/g,"%2B")
		+"&xmkaqsmfh.lxxp="+$("#lxxp").val()+"&xmkaqsmfh.doup="+$("#doup").val()+"&xmkaqsmfh.sjbl="+$("#sjbl").val()+"&xmkaqsmfh.lcxy="+$("#lcxy").val()+"&xmkaqsmfh.hjfz="+$("#hjfz").val()+"&xmkaqsmfh.xchbc="+$("#xchbc").val()
		+"&xmkaqsmfh.csxsss="+$("#csxsss").val()+"&xmkaqsmfh.hul="+$("#hul").val()+"&xmkaqsmfh.bzbx="+$("#bzbx").val()+"&xmkaqsmfh.jshsxyd="+$("#jshsxyd").val()+"&xmkaqsmfh.aqssqt="+$("#aqssqt").val()+"&xmkaqsmfh.tjgc="+$("#tjgc").val()
		+"&xmkaqsmfh.hjzz="+$("#hjzz").val()+"&xmkaqsmfh.bzbxcz="+$("#bzbxcz").val()+"&xmkaqsmfh.jckcz="+$("#jckcz").val()+"&xmkaqsmfh.jzhl="+$("#jzhl").val()+"&xmkaqsmfh.jshsxydcz="+$("#jshsxydcz").val()+"&xmkaqsmfh.aqssqtcz="+$("#aqssqtcz").val()
		+"&xmkaqsmfh.jhnf="+$("#jhnf").combobox('getValue')+"&xmkaqsmfh.yhlc="+$("#yhlc").val()+"&xmkaqsmfh.tzgs="+$("#tzgs").val()+"&xmkaqsmfh.tsdq="+$("#tsdq").html()+"&xmkaqsmfh.sbthcd="+sbthcd+"&xmkaqsmfh.id="+parent.obj.id+"&xmkaqsmfh.gpsqd="+qdStr.replace(/\+/g,"%2B")+"&xmkaqsmfh.gpszd="+zdStr.replace(/\+/g,"%2B");
		if(jsdjmb==1){
			data+="&xmkaqsmfh.jsdj="+$("#jsdj1").val()+"&xmkaqsmfh.fangx="+$("#fangx1").val()
			+"&xmkaqsmfh.ldfl="+$("#ldfl1").val()+"&xmkaqsmfh.pcsj="+$("#pcsj1").val()+"&xmkaqsmfh.jtsgpcf="+$("#jtsgpcf").val()+"&xmkaqsmfh.jtsgfxdj="+$("#jtsgfxdj").val()+"&xmkaqsmfh.gltjpcf="+$("#gltjpcf").val()+"&xmkaqsmfh.glfxdj="+$("#glfxdj").val()+"&xmkaqsmfh.xbjyqx="+$("#xbjyqx").val()+"&xmkaqsmfh.jckbgf="+$("#jckbgf").val()+"&xmkaqsmfh.jtl="+$("#jtl").val()+"&xmkaqsmfh.gldj="+$("#gldj1").val();
		}else{
			data+="&xmkaqsmfh.jsdj="+$("#jsdj2").val()+"&xmkaqsmfh.fangx="+$("#fangx2").val()
			+"&xmkaqsmfh.ldfl="+$("#ldfl2").val()+"&xmkaqsmfh.pcsj="+$("#pcsj2").val()+"&xmkaqsmfh.sgpb="+$("#sgpb").val()+"&xmkaqsmfh.dgjw="+$("#dgjw").val()+"&xmkaqsmfh.lxjw="+$("#lxjw").val()+"&xmkaqsmfh.jtlpbzb="+$("#jtlpbzb").val()+"&xmkaqsmfh.gldj="+$("#gldj2").val();
		}
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/updateAqsmfhxmk.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("保存成功！");
					parent.showAll();
					parent.$('#lxxx').window('destroy');
					
				}else{
					alert('保存失败！');
				}
			}
		});
	}
	function selectTSDQ(str){
		$("#tsdq").html("");
		var data="xzqhdm1="+str;
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmjck/selectTSDQ1.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(msg.length>0){
					var tsdqstr="";
					for(var i=0;i<msg.length;i++){
						tsdqstr=tsdqstr+msg[i]+"、";
					}
					tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
					$("#tsdq").html(tsdqstr);
				}
			}
		});	
	}
	
	
	var bz;
	var bl;
	var fd;
	var bzzj;
	function jsnsqbz(){
		if($("#roadcode").val().substr(0,1)=='G'||$("#roadcode").val().substr(0,1)=='S')
			bz='国省';
		else
			bz='县乡';
		$.ajax({
			type:'post',
			url:'../../../jhgl/lwBzbz.do',
			data:"bzbz.xmlx="+"安保"+"&bzbz.lx="+bz,
			dataType:'json',
			success:function(data){
				bz=data.bz;
				bl=data.bl;
				fd=data.fd;
				bzInit();
			}
		}); 
	}
	function bzInit(){
		bzzj=(parseFloat($("#yhlc").val())*1000000000000000*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
		ts=bzzj.toFixed(3);
		$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
	}
</script>

<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="roadcode" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="roadname" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">序号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="xuh" style="width: 156px"  /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="unit" style="width: 156px" />
					<input type="text" id="unitcode" style="display:none"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="dist" style="width: 156px" />
					<input type="text" id="distcode" style="display:none"/></td>
				
				</tr>	
				<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">省：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="province" style="width: 156px" value="江西省" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">市：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="town" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="county" style="width: 156px" /></td>
				</tr>	
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桩号起点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text"  id="roadstart" style="width: 156px" /><br>
					<span id="qd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桩号终点：</td>
				<td colspan="3"  style="background-color: #ffffff; height: 20px;" align="left"><br>
					<input type="text" id="roadend" style="width: 156px" />
					<span id="zd"></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>公路编号：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="throadcode" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>桩号起点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="throadstart" style="width: 156px" />
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>桩号终点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="throadend" style="width: 156px" />
					</td>
				</tr>
			
			<tbody id='yjej' style="display: none">
			
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>技术等级(1、一级 2、二级)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="jsdj1" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方向(1、桩号大到小2、桩号小到大3、不分方向)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="fangx1" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路段分类(A、B、C)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="ldfl1" style="width: 156px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">排查时间(年 / 月)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				<input type="text" id="pcsj1" style="width: 156px" />	</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通事故排查方法(1、事故风险评估2、事故多发点段识别)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jtsgpcf" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通事故风险等级(1、2、3、4、5级)或是否事故多发点段(0、否 6、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jtsgfxdj" style="width: 156px" />
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路条件排查方法(1、公路风险评估2、公路条件识别)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="gltjpcf" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路风险等级(1、2、3、4、5级)或是否事故多发点段(0、否 6、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="glfxdj" style="width: 156px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">小半径圆曲线(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="xbjyqx" style="width: 156px" /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交叉口不规范(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jckbgf" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通量(AADT)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jtl" style="width: 156px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="gldj1" style="width: 156px" /></td>
			</tr>
		
			</tbody>
			<tbody id="sjsj" style="display: none">
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>技术等级(3、三级4、四级)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="jsdj2" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方向(1、桩号大到小2、桩号小到大3、不分方向)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="fangx2" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路段分类(A.1、A.2、A.3、B.1、B.2、B.3、B.4、C)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="ldfl2" style="width: 156px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">排查时间(年 / 月)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="pcsj2" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">符合事故判别指标(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="sgpb" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">单个急弯(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="dgjw" style="width: 156px" value="0"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">连续急弯(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="lsjw" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">符合交通量判别指标(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jtlpbzb" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="gldj2" style="width: 156px" />
				</td>
			</tr>
		
			</tbody>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">连续下坡(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="lxxp" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">陡坡(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="doup" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">视距不良(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="sjbl" style="width: 156px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路侧险要(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="lcxy" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">环境复杂(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="hjfz" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通行校车或班线车(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="xchbc" style="width: 156px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">运行车速或路段限速或设计速度(km/h)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="csxsss" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">护栏(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="hul" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">标志标线(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="bzbx" style="width: 156px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">警示和视线诱导设施(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="jshsxyd" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">其他路段既有安全设施信息(用文字简要说明)：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px; " align="left">
					<input type="text" id="aqssqt" style="width: 356px" /></td>
				
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">涉及路线参数调整的土建工程(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="tjgc" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">边坡、边沟或路域环境整治(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="hjzz" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">标志标线处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="bzbxcz" style="width: 156px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交叉口综合处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="jckcz" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">加装护栏(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="jzhl" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">警示诱导设施处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="jshsxydcz" style="width: 156px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划实施安防工程年份(年)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="jhnf" style="width: 156px" class="easyui-combobox" data-options="panelHeight:'150'"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">其他拟新采取的处置措施(用文字简要说明)：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="aqssqtcz" style="width: 356px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程(公里)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="yhlc" style="width: 156px" value="0" onchange="jsnsqbz()"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置投资估算(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="tzgs" style="width: 156px" /><br>
					<span id='bbzts'></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修改建年度(年)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="xjgjnd" style="width: 156px" /></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id='tsdq'></span></td>
				</tr>
				<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
				<a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>