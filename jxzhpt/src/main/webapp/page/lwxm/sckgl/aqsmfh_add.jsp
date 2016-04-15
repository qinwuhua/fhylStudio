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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
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
		var str=ldxmkid+"";
		$("#ldgrid").datagrid({    
			 url:'/jxzhpt/aqsmfh/selectSckaqsmfhld.do',
			 queryParams : {
				 	'xmkaqsmfh.xmkid':str
				},
			    striped:true,
			   // pagination:true,
			   // rownumbers:true,
			    pageNumber:1,
			    pageSize:20,
		    columns:[[        
				{field:'xuh',title:'序号',width:60,align:'center'},
		        {field:'province',title:'省',width:160,align:'center'},
		        {field:'town',title:'市',width:120,align:'center'},
		        {field:'county',title:'县',width:120,align:'center'},
		        {field:'roadcode',title:'路线编码',width:120,align:'center'},
		        {field:'unit',title:'管养单位',width:140,align:'center'},
		        {field:'distcode',title:'行政区划代码',width:140,align:'center'},
		        {field:'roadname',title:'路线名称',width:140,align:'center'},
		        {field:'jsdj',title:'技术等级',width:140,align:'center'},
		        {field:'gpsqd',title:'起点桩号',width:140,align:'center'},
		        {field:'gpszd',title:'止点桩号',width:140,align:'center'},
		        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
		        {field:'tzgs',title:'处置投资估算',width:140,align:'center'}
		    ]]
		});

	}
	
	$(function(){

		loadUploadify();
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
			if(ldxmkid==null){
				alert("请选择路段");
				return;
			}
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/aqsmfh/sfcfbntj.do",
				 dataType : 'json',
				 data : 'xmkaqsmfh.xmkid=' +$("#ldxx").combobox('getValues')+'&xmkaqsmfh.jhnf='+$("#scjhnf").combobox('getValue')+'&xmkaqsmfh.xmbm='+xmbm,
				 success : function(msg){
					 if(msg.bz=='true'){
						 saveAbgc();
					 }else{
						 //YMLib.Tools.Show(msg,3000);
						 $.messager.alert('注意',msg.bz,'warning'); 
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		});
		$("#add_button").click(function(){
			
			 if($("#ldxx").combobox('getValues')==''||$("#ldxx").combobox('getValues')==null){
				alert("请选择路段信息");
				return;
			}
			 else{
				 ldxmkid=$("#ldxx").combobox('getValues');
				 loadscktj();
				 $("#tjldtb1").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;");
		 		$("#tjldtb2").attr('style',"width: 100%; background-color: #aacbf8; font-size: 12px;display:none");
			 }
				 
			
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
			  if($("#roadcode").val()=='')
				  return;
			 cxlx();
		});
	});
	function xzld(){
		if($("#ldxx").combobox('getValues')==''||$("#ldxx").combobox('getValues')==null){
			alert("请选择路段信息");
			return;
		}
		 else{
			 ldxmkid=$("#ldxx").combobox('getValues');
			// loadscktj();
			 showLd();
		 }
	}
	var ldxmkid;
	var ldobj=new Object();
	
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
	        data:"xmkaqsmfh.xmkid="+ldxmkid,
			dataType:'json',
			success:function(item){
				if(item!=null){
					tjldobj=item;
					//审查
					$("#lxmc").val(item.lxmc);$("#scjsdj").val(item.jsdj);
					$("#qdzh").val(parseFloat(item.qdzh).toFixed(3));$("#zdzh").val(parseFloat(item.zdzh).toFixed(3));$("#scjsdj").val(item.jsdj);
					$("#scxjgjnd").val(item.xjgjnd);
					if(accSub(parseFloat(item.zdzh),parseFloat(item.qdzh)) < parseFloat(item.yhlc))
						$("#scyhlc").val(accSub(parseFloat(item.zdzh),parseFloat(item.qdzh)).toFixed(3));
					else $("#scyhlc").val(parseFloat(item.yhlc).toFixed(3));
					$("#cztzgs").val(Math.round(item.cztzgs));
					//$("#scjhnf").combobox('setValue',item.jhnf);
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
						str+="标志标线处置<input type='text' name='bitian1' id='str1' style='width:70px;'>米  ";
						str+="交叉口综合处置<input type='text' name='bitian1' id='str2' style='width:70px;'>处  ";
						str+="加装护栏警示诱导设施处置<input type='text' name='bitian1' id='str3' style='width:70px;'>米  ";					
						str+="涉及路线参数调整的土建工程<input type='text' name='bitian1' id='str4' style='width:70px;'>处 <input type='text' name='bitian1' id='str5' style='width:70px;'>立方米  ";
						str+="边坡、边沟或路域环境整治<input type='text' name='bitian1' id='str6' style='width:70px;'>处 <input type='text' name='bitian1' id='str7' style='width:70px;'>立方米   ";
						str+="<br>其他 ：<input type='text' name='bitian1' id='str8' style='width:370px;'>";
						$("#jsnr").html(str);
				}
			}
		});
	}
	
function saveAbgc(){
		
		var flag=true;
		if($("#faspsj").datebox('getValue')==''){
			alert("请选择方法审批时间");
			return;
		}
		if($("#scjhnf").combobox('getValue')==''){
			alert("请选择项目年份");
			return;
		}
	    $("input[name='bitian']").each(function(){
	        if ($(this).val() == ""||$(this).val() == null){
	        	alert("请将页面除备注外的信息填写完整。");
	        	flag=false;
	        	return false;
	        }
	    });
	    if(flag==false){
	    	return;
	    }
	    if(parseFloat($("#nsqbbz").val())>parseFloat(ts)){
	    	alert("拟申请部(省)补助不能大于"+ts);
	    	return;
	    }
		var sbthbmcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthbmcd=7;
		}
		
		var data ="xmkaqsmfh.province="+tjldobj.province+"&xmkaqsmfh.town="+tjldobj.town+"&xmkaqsmfh.county="+tjldobj.county+"&xmkaqsmfh.lxbm="+tjldobj.lxbm+"&xmkaqsmfh.lxmc="+$("#lxmc").val()+"&xmkaqsmfh.gydw="+$("#gydw").combobox('getText')
		+"&xmkaqsmfh.gydwdm="+$("#gydw").combobox('getValue')+"&xmkaqsmfh.xzqh="+$("#xzqh").combobox('getText')+"&xmkaqsmfh.xzqhdm="+$("#xzqh").combobox('getValue')+"&xmkaqsmfh.jsdj="+$("#scjsdj").val()
		+"&xmkaqsmfh.qdzh="+$("#qdzh").val()+"&xmkaqsmfh.zdzh="+$("#zdzh").val()+"&xmkaqsmfh.yhlc="+$("#scyhlc").val()+"&xmkaqsmfh.czzlc="+$("#czzlc").val()+"&xmkaqsmfh.xjgjnd="+$("#scxjgjnd").val()
		+"&xmkaqsmfh.fapgdw="+$("#fapgdw").val()+"&xmkaqsmfh.fascdw="+$("#fascdw").val()+"&xmkaqsmfh.faspsj="+$("#faspsj").datebox('getValue')+"&xmkaqsmfh.spwh="+$("#spwh").val()+"&xmkaqsmfh.cztzgs="+Math.round(parseFloat($("#cztzgs").val()))+"&xmkaqsmfh.sfsqablbz="+$("#sfsqablbz").val()
 		+"&xmkaqsmfh.ablbzsqwh="+$("#ablbzsqwh").val()+"&xmkaqsmfh.jsxz="+$("#jsxz").val()+"&xmkaqsmfh.bz="+$("#bz").val()+"&xmkaqsmfh.jhnf="+$("#scjhnf").combobox('getValue')+"&xmkaqsmfh.sbthbmcd="+sbthbmcd+"&xmkaqsmfh.tbdwdm="+$.cookie("unit")+"&xmkaqsmfh.xmbm="+xmbm+"&xmkaqsmfh.nsqbbz="+$("#nsqbbz").val()+"&xmkaqsmfh.xmkid="+ldxmkid+"";
		var str="";
		if($("#str1").val()!=''){
			str+= "标志标线处置"+$("#str1").val()+"米，";
			data+="&xmkaqsmfh.str1="+$("#str1").val();
		}
		if($("#str2").val()!=''){
			str+="交叉口综合处置"+$("#str2").val()+"处，";
			data+="&xmkaqsmfh.str2="+$("#str2").val();
		}
		if($("#str3").val()!=''){
			str+="加装护栏警示诱导设施处置"+$("#str3").val()+"米，";
			data+="&xmkaqsmfh.str3="+$("#str3").val();
		}
		if($("#str4").val()!=''){
			str+="涉及路线参数调整的土建工程"+$("#str4").val()+"处 "+$("#str5").val()+"立方米；";
			data+="&xmkaqsmfh.str4="+$("#str4").val()+"&xmkaqsmfh.str5="+$("#str5").val();
		}
		if($("#str6").val()!=''){
			str+="边坡、边沟或路域环境整治"+$("#str6").val()+"处 "+$("#str7").val()+"立方米；";
			data+="&xmkaqsmfh.str6="+$("#str6").val()+"&xmkaqsmfh.str7="+$("#str7").val();
		}
		if($("#str8").val()!=''){
			str+="其他："+$("#str8").val();
			data+="&xmkaqsmfh.str8="+$("#str8").val();
		}
		if(str==''){
			alert("您必须填写一项建设内容");
			return;
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
							xzld();
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
							xzld();
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
	
	function loadUploadify(){
	$("#uploadSjt").uploadify({
		/*注意前面需要书写path的代码*/
		'uploader' : '../../../js/uploader/uploadify.swf',
		'script' : '../../../jhgl/uploadAbgcFile.do',
		'cancelImg' : '../../../js/uploader/cancel.png',
		'queueID' : 'fileQueue1',
		'fileDataName' : 'uploadSjt',
		'auto' : false,
		'multi' : true,
		'buttonImg': '../../../js/uploader/bdll.png',
		'simUploadLimit' : 3,
		'sizeLimit' : 20000000,
		'queueSizeLimit' : 5,
		'fileDesc' : '支持格式:xls',
		'fileExt' : '',
		'height' : 30,
		'width' : 92,
		'scriptData' : {
			'uploads.parentid':xmbm,
		},
		onComplete : function(event, queueID, fileObj, response, data) {
			alert(response);
			fileShow();
		},
		onError : function(event, queueID, fileObj) {
			alert("文件:" + fileObj.name + "上传失败");
		},
		onCancel : function(event, queueID, fileObj) {
		},
		onQueueFull : function(event, queueSizeLimit) {
			alert("最多支持上传文件数为：" + queueSizeLimit);

		}
	});
}

function fileShow(){
	//加载文件
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
	/* 		var data=datas.rows; */
		/* 	alert(data); */
			$("#gkbgTable").empty();
			$("#sjsgtTable").empty();
			var gkbg="";
			var sjsgt="";
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype=="工可报告"){
					gkbg += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"+
					'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')">下载</a>  |  '+
					"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				}if(data[i].filetype=="设计施工图"){
					sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"+
					'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')">下载</a>  |  '+
					"<a href='javascript:void(0)' style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				}
			}
			$("#gkbgTable").append(gkbg);
			$("#sjsgtTable").append(sjsgt);
		}
	});
}
function downFile(fileurl,filename){
	//alert(fileurl);
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
}
function deleteFile(id){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 fileShow();
				 }else{
					 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
	function upload(id){
		$("#"+id).uploadifySettings('scriptData',{'jh.jhnf':$('#scjhnf').combo("getValue"),'uploads.parentid':xmbm});
		$('#'+id).uploadifyUpload();
	}
	function sfcgwbw(){
		var cztzgs=parseFloat($("#cztzgs").val());
		if(Math.round(cztzgs)>=500){
			$("#sfsqablbz").val("1");
			$("#ablbzsqwh").removeAttr('disabled');
			$("#sfsqablbz").removeAttr('disabled');
		}else{
			$("#sfsqablbz").val("0");
			$("#sfsqablbz").attr("disabled",'true');
			$("#ablbzsqwh").attr("disabled",'true');
		}
	}
	
	function sfdyzlc(){
		if(parseFloat($("#scyhlc").val())>parseFloat(tjldobj.yhlc)){
			alert("隐患里程不能大于总里程"+tjldobj.yhlc+"公里");
			$("#scyhlc").val("");
		}
	}
	function sfdyyhlc(){
		if(parseFloat($("#czzlc").val())>parseFloat($("#scyhlc").val())){
			alert("处置总里程不能大于隐患里程");
			$("#czzlc").val("");
		}
	}
	
	
	var bz;
	var bl;
	var fd;
	var bzzj;
	var ts;
	function jsnsqbz(){
		if(tjldobj.lxbm.substr(0,1)=='G'||tjldobj.lxbm.substr(0,1)=='S')
			bz='国省';
		else
			bz='县乡';
		$.ajax({
			type:'post',
			url:'../../../jhgl/getafBzbz.do',
			data:"bzbz.xmlx="+tjldobj.xzqh+"&bzbz.lx="+bz,
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
		bzzj=(parseFloat($("#czzlc").val())*1000000000000000*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
		if(parseFloat(($("#cztzgs").val())*0.6)<parseFloat(bzzj))
		ts=parseFloat(($("#cztzgs").val())*0.6).toFixed(0);
		else
		ts=bzzj.toFixed(0);
		$("#bbzts").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+ts+"万元");
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
					请先填写路线编码-->查询-->选择路段-->确认所选路段
				</td>
			</tr>
			<tr id='kyctr' style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:130px" align="right">请您输入路线编码：</td>
				<td  style="background-color: #ffffff; height: 20px;width:200px" align="left">
					<input type="text" id='roadcode'>
					<a href="javascript:void(0)" id="cx_button"
						class="easyui-linkbutton" plain="true" iconCls="icon-save">查询</a>
					 
			</tr>
			<tr><td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:130px" align="right">请您选择路段：</td>
			<td  style="background-color: #ffffff; height: 20px;width:200px" align="left">
				<input type="text" id='ldxx' >
				<a href="javascript:void(0)" id="add_button"
						class="easyui-linkbutton" plain="true" iconCls="icon-save">确认所选路段</a></td>
				
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
					<input type="text" id="lxmc" name='bitian'></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="scjsdj" name='bitian'></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="qdzh" name='bitian' disabled="disabled"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="zdzh" name='bitian' disabled="disabled"></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="scyhlc" name='bitian' onchange="sfdyzlc()" disabled="disabled"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置总里程：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="czzlc" name='bitian' onchange="sfdyyhlc()" onblur="jsnsqbz()"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="scxjgjnd" name='bitian'></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估单位：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="fapgdw" name='bitian'></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="fascdw" name='bitian'></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审批时间(年/月/日)：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="faspsj"></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="spwh" name='bitian'></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置投资估算(单位:万元,保留整数)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="cztzgs" name='bitian' onchange="sfcgwbw()" onblur="jsnsqbz()"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否申请按比例补助(0、否1、是)：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="sfsqablbz" maxlength="1"></td>
				
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按比例补助申请文号：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="ablbzsqwh"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质(1、中修2、大修)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="jsxz" name='bitian' maxlength="1"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="scjhnf" maxlength="4"></td>
			</tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">拟申请部(省)补助(单位:万元,保留整数)：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="nsqbbz" name='bitian'> <span id='bbzts'></span></td>
				
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
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">施工图设计批复：</td>
				<td id="td_sjsgt" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="sjsgtTable"></tbody>
					</table>
					<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadSjt" id="uploadSjt" /></td>
								<td><div id="fileQueue1" ></div></td>
							</tr>
							<tr>
								<td rowspan="2">
									<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload('uploadSjt')"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
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