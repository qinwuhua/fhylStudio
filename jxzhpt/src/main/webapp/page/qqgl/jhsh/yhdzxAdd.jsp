<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修详细</title>
	<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../js/jquery-form.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
	function xmnf1(id){
		queryyhdzxsfdj();
		var myDate = new Date();
		var years=[];
		var first;
		for(var i=0;i<=10;i++){
			if(i==0)
				first=myDate.getFullYear()-i;
			years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text',
		    onSelect:function(rec){
		    	$.ajax({
					type:'post',
					url:'../../../qqgl/queryNextXmbm.do',
					data:'xmsq.xmlx='+4+'&xmsq.xzqhdm='+$.cookie('dist')+'&xmsq.xmnf='+rec.value,
					dataType:'json',
					success:function(msg){
						$('#xmbm1').val(rec.value+$.cookie('dist')+msg.xmbm);
						$('#xmbm1').attr("disabled","disabled");
						$('#xmbm').val(rec.value+$.cookie('dist')+msg.xmbm);
					}
				});
		    }
		});
		$('#'+id).combobox("setValue",first);
	}
	
		$(function(){
			
			$("#bzsf .easyui-numberbox").attr("disabled","disabled");
			$("#bzsf input:checkbox").attr("disabled","disabled");
			xmnf1("xmnf");
			loadBmbm2("gcfl1",'工程分类');
			loadDistadd("xzqh1",$.cookie("dist"));
			
			loadUnitadd("gydw1",$.cookie("unit"));
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryNextXmbm.do',
				data:'xmsq.xmlx='+4+'&xmsq.xzqhdm='+$.cookie('dist')+'&xmsq.xmnf='+$("#xmnf").combobox('getValue'),
				dataType:'json',
				success:function(msg){
					
					$('#xmbm1').val($("#xmnf").combobox('getValue')+$.cookie('dist')+msg.xmbm);
					$('#xmbm1').attr("disabled","disabled");
					$('#xmbm').val($("#xmnf").combobox('getValue')+$.cookie('dist')+msg.xmbm);
				}
			});
			autoCompleteLXBM();
			autoCompleteGHLXBM();
			$("#gcfl1").combobox({
				onSelect:function(){
					$("#bzsf input").attr("disabled","disabled");
					//
					if($("#gcfl1").combobox('getValue')!='' && $("#gcfl1").combobox('getValue')!=null){
						$("#bzsf .easyui-numberbox").removeAttr("disabled");
						$("#bzsf input:checkbox").removeAttr("disabled");
					}
				}
			});
		});
		function autoCompleteLXBM(){
			var url = "/jxzhpt/qqgl/queryAutoList.do";
			$("#ylxbh").autocomplete(url, {
				multiple : false,minChars :4,multipleSeparator : ' ',
				mustMatch: true,cacheLength : 0,delay : 200,max : 50,
		  		extraParams : {
		  			'ylxbh':function() {
		  				var d = $("#ylxbh").val();
		  				return d;
		  			},
		  			'xzqhdm':function() {
		  				var d = $.cookie("dist2");
		  				return d;
		  			}
		  		},
		  		dataType:'json',// 返回类型
		  		// 对返回的json对象进行解析函数，函数返回一个数组
		  		parse : function(data) {
		  			var aa = [];
		  			aa = $.map(eval(data), function(row) {
		  					return {
		  					data : row,
		  					value : row.lxbm.replace(/(\s*$)/g,""),
		  					result : row.lxbm.replace(/(\s*$)/g,"")
		  				};
		  			});
		  			return aa;
		  		},
		  		formatItem : function(row, i, max) {
		  			return row.lxbm.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
		  		}
		  	}).result(
				function(e, item) {
					//$('#ylxbh').val(item.lxbm);
					//$('#ghlxbh').val(item.lxbm);
					
					$('#lxmc').val(item.lxmc);
					//$('#qdmc').val(item.qdmc);
					//$('#zdmc').val(item.zdmc);
					$('#qdzh').val(item.qdzh);
					$('#gpsqdzh').val(item.qdzh);
					
					$('#zdzh').val(item.zdzh);
					$('#gpszdzh').val(item.zdzh);
					if(parseFloat(item.qdzh)<parseFloat(item.zdzh)){
						$('#span_qdzh').html(">="+item.qdzh);
						$('#span_zdzh').html("<="+item.zdzh);
					}else{
						$('#span_qdzh').html("<="+item.qdzh);
						$('#span_zdzh').html(">="+item.zdzh);
					}
					$("#lc").val(accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())));
					//$('#lc').val(item.lc);
					cxqdmc($('#ylxbh').val(),$('#qdzh').val());
					cxzdmc($('#ylxbh').val(),$('#zdzh').val());
					getghlxinfo($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
					//queryJsdjAndLc($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
					//queryylmlx($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
					if(parseFloat($('#qdzh').val())<parseFloat($('#zdzh').val()))
					getylxlminfo($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
					else
					getylxlminfo($('#ylxbh').val(),$('#zdzh').val(),$('#qdzh').val());
					$.ajax({
						type:'post',
						url:'../../../qqgl/queryTsdq.do',
						data:'ylxbh='+$('#ylxbh').val()+'&qdzh='+$('#qdzh').val()+'&zdzh='+$('#zdzh').val(),
						dataType:'json',
						success:function(msg){
							$('#tsdq1').html(msg.tsdq);
							$('#tsdq').val(msg.tsdq);
						}
					});
			});
		}
		
		
		function loadXzqh(id,dwbm){
			$('#'+id).combotree({
				checkbox:false,
				url : '/jxzhpt/xtgl/selAllXzqh.do?yhdw=' + dwbm,
				onBeforeExpand:function(node, param) {
					$('#'+id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="+ node.id;
				},
				onSelect:function(node) {
					YMLib.Var.DistName = node.text;
					//alert("sss");
					$('#xzqhdm').html(node.id);
					selectTSDQ(node.id);
				}
			});
			$('#'+id).combotree('setValue', dwbm);
		}
		
		function sfinsert(){
			var datas='xmsq.ylxbh='+$("#ylxbh").val()+'&xmsq.qdzh='+$("#qdzh").val()+'&xmsq.zdzh='+$("#zdzh").val()+'&xmsq.xmbm='+$("#xmbm").val();
			//alert(datas);
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/sfinsert.do',
		        data:datas,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						$("#lsjl").val("否");
						insert();
					}else if(msg.result=="have"){
						var xsxx='';
						
						//alert();
						for(var i=0;i<msg.lx.length;i++){
							var xmlx='';
							if(msg.lx[i].xmid.substr(10,1)==1){
								xmlx='改建';
							}
							if(msg.lx[i].xmid.substr(10,1)==2){
								xmlx='路面改造';
							}
							if(msg.lx[i].xmid.substr(10,1)==3){
								xmlx='新建';
							}
							if(msg.lx[i].xmid.substr(10,1)==4){
								xmlx=msg.lx[i].xjsdj;
							}
							if(msg.lx[i].xmid.substr(10,1)==5){
								xmlx='灾毁重建';
							}

							xsxx+="      项目类型："+xmlx+"     项目编码："+msg.lx[i].xmid+"      项目名称："+msg.lx[i].xmmc+"\r";
							
						}
						if(msg.lx.length>0){
							$("#lsjl").val("是");
							alert("存在补助历史\r"+xsxx);
							if(confirm('是否保存？')){
								insert();
							}
						}else{
							$("#lsjl").val("否");
							insert();
						}
						
					}
				}
			});
		}
		function insert(){
			$('#gcfl').val($('#gcfl1').combo("getText"));
			$('#gydw').val($('#gydw1').combo("getText"));
			$('#gydwdm').val($('#gydw1').combo("getValues").join(','));
			$("#xzqhdm").val($.cookie("dist"));
			$('#xzqhdm2').val($('#xzqh1').combo("getValues").join(","));
			$('#xzqh').val($('#xzqh1').combo("getText"));
			var result=true;
			result = validateText('ylxbh',null,result);
			result = validateText('ghlxbm',null,result);
			result = validateText('lmkd','number',result);
			result = validateText('qdzh','number',result);
			result = validateText('zdzh','number',result);
			result = validateText('lc','number',result);
			result = validateText('xmmc',null,result);
			if($('#ntz').val()!="" && $('#ntz').val()!=null){
				result = validateText('ntz','number',result);
			}
			if(!result){
				return;
			}
			
			
			if(zhuanghao()){
				$("#bzsf input").removeAttr("disabled");
				$('#submit').ajaxSubmit({
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							alert("添加成功！");
							closeWindow("yhdzxadd");
						}else if(msg.result=="have"){
							alert("路线 "+$('#ylxbh').val()+"【"+$('#qdzh').val()+"-"+$('#zdzh').val()+"】已存在"+panduanxmlx(msg.lx.xmid)+"【"+msg.lx.xmmc+"】"+"中！");
						}
					},
					error:function(msg){
						alert("添加失败！");
						$("#bzsf input").attr("disabled","disabled");
						$("#bzsf .easyui-numberbox").removeAttr("disabled");
						$("#bzsf input:checkbox").removeAttr("disabled");
					}
				});
			}
		}
		function zhuanghao(){
			/* if(Number($('#qdzh').val())<Number($('#span_qdzh').html())){
				alert("起点桩号不能小于"+$('#span_qdzh').html());
				return false;
			}else if(Number($('#zdzh').val())>Number($('#span_zdzh').html())){
				alert("止点桩号不能大于"+$('#span_zdzh').html());
				return false;
			}else if(Number($("#zdzh"))<Number($('#qdzh').val())){
				alert("止点桩号不能小于起点桩号");
				return false;
			}else{
				return true;
			} */
			return true;
		}
		
		
		

		
		
	</script>
</head>
<body>
	<div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:100%;">
		<form id="submit" action="../../../qqgl/insertXmsq.do" method="post">
		<table width="98%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
           
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路线编号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ylxbh" name="ylxbh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
					<input id="xmlx" name="xmlx" value="4" type="hidden"/>
					<input id="gpsqdzh" name="gpsqdzh" type="hidden"/>
					<input id="gpszdzh" name="gpszdzh" type="hidden"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					起点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="qdzh" name="qdzh" onchange="querymc('qdzh')" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
					<span id="span_qdzh" style="font-size: small;color: red;"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					止点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zdzh" name="zdzh" onchange="querymc('zdzh')" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
					<span id="span_zdzh" style="font-size: small;color: red;"></span>
				</td>
            </tr>
             <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
            </tr>
            
            
            <tr style="height: 30px;">
            	
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					路面宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lmkd" name="lmkd" type="text" style="width: 80px;"  disabled/>&nbsp;米&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划路线名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ghlxmc" name="ghlxmc" type="text" style="width: 80px;" />&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路线名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lxmc" name="lxmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					起点名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="qdmc" name="qdmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					止点名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zdmc" name="zdmc" type="text" style="width: 80px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lc" name="lc" type="text" style="width: 80px;"/>&nbsp;km&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路面类型</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ylmlx" name="ylmlx" type="text" style="width: 120px;"/>&nbsp;
					<span style="color: red;">*</span><br/>
					
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面结构</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ylmjg" name="ylmjg" type="text" style="width: 120px;"/>&nbsp;
					<span style="color: red;">*</span><br/>
				</td>
            </tr>
            
             
            
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级及里程
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					一级公路：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
					二级公路：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
					三级公路：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
					四级公路：<input id="silc" name="silc" style="width: 50px;" type="text"/>
					等外公路：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
					无路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
				</td>
			</tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jsdj" name="jsdj" type="text" style="width: 124px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					行政区划</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xzqh1" name="xzqh1" type="text" style="width: 124px;"/>
					<input id="xzqh" name="xzqh" type="hidden"/>
					<input id="xzqhdm" name="xzqhdm" type="hidden"/>
					<input id="xzqhdm2" name="xzqhdm2" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					管养单位</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gydw1" name="gydw1" type="text" style="width: 120px;"/>
					<input id="gydw" name="gydw" type="hidden"/>
					<input id="gydwdm" name="gydwdm" type="hidden"/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					项目编码</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xmbm1" name="xmbm1" type="text" style="width: 120px;"/>
					<input id="xmbm" name="xmbm" type="hidden"/>
					<input id="lsjl" name="lsjl" type="hidden" value="否"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xmmc" name="xmmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					总投资</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ntz" name="ntz" type="text" style="width: 80px;"/>&nbsp;万元
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划开工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhkgsj" name="jhkgsj" type="text" class="easyui-datebox" style="width: 124px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					计划完工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhwgsj" name="jhwgsj" type="text" class="easyui-datebox" style="width: 120px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工期（月）</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gq" name="gq" type="text" style="width: 80px;"/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					工程分类</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id='gcfl1' style="width: 80px;"></select>
					<input id="gcfl" name="gcfl" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					特殊地区</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="tsdq1"></span>
					<input id="tsdq" name="tsdq" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">项目年份</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id="xmnf" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
            </tr>
            <tr style="height: 70px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设方案</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<textarea id="jsfa" name="jsfa" rows="" cols="" style="width: 650px;height: 60px;"></textarea>
				</td>
            </tr>
            <tr style="height: 70px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					备注</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<textarea id="bz" name="bz" rows="" cols="" style="width: 650px;height: 60px;"></textarea>
				</td>
            </tr>
            <tbody id='bzsf'>
	            <tr>
	            	<td rowspan="5" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青混凝土面层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqhntmcdj">1150</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：70号重胶沥青
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqhntmchd' value='0' onchange="jsbzzj('lqhntmc')" name='lqhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqhntmc' name='lqhntmc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						改性沥青混凝土面层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="gxlqhntmcdj">1300</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：SBS
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='gxlqhntmchd' value='0' onchange="jsbzzj('gxlqhntmc')" name='gxlqhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='gxlqhntmc' name='gxlqhntmc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
            	<tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmcdj">450</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='snhntmchd' value='0' onchange="jsbzzj('snhntmc')" name='snhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmc' name='snhntmc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面就地热再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmjdrzsdj">1250</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmjdrzshd' value='0' onchange="jsbzzj('lqlmjdrzs')" name='lqlmjdrzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmjdrzs' name='lqlmjdrzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面场拌热再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmcbrzsdj">950</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmcbrzshd' value='0' onchange="jsbzzj('lqlmcbrzs')" name='lqlmcbrzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmcbrzs' name='lqlmcbrzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td rowspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						基层</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水稳基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="swjcdj">200</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='swjchd' value='0' onchange="jsbzzj('swjc')" name='swjchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='swjc' name='swjc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面泡沫沥青就地冷再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmpmlqjdlzsdj">600</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmpmlqjdlzshd' value='0' onchange="jsbzzj('lqlmpmlqjdlzs')" name='lqlmpmlqjdlzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmpmlqjdlzs' name='lqlmpmlqjdlzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面乳化沥青就地冷再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmrhlqjdlzsdj">700</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmrhlqjdlzshd' value='0' onchange="jsbzzj('lqlmrhlqjdlzs')" name='lqlmrhlqjdlzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmrhlqjdlzs' name='lqlmrhlqjdlzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面场拌冷再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmcblzsdj">650</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmcblzshd' value='0' onchange="jsbzzj('lqlmcblzs')" name='lqlmcblzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmcblzs' name='lqlmcblzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						新做柔性基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="xzrxjcdj">800</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='xzrxjchd' value='0' onchange="jsbzzj('xzrxjc')" name='xzrxjchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='xzrxjc' name='xzrxjc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水稳基层冷再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="swjclzsdj">170</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='swjclzshd' value='0' onchange="jsbzzj('swjclzs')" name='swjclzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='swjclzs' name='swjclzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						下封层</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						下封层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="xfcdj">8</span>元/平方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='xfcse' onclick="jsbzzj('xfc')" type="checkbox"/>
						<input type="hidden" id='xfchd' name='xfchd'>
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='xfc' name='xfc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td rowspan="2" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						挖除面层与基层</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						挖除水泥面板
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="wcsnmbdj">100</span>100元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input type="text" value='0' onchange="jsbzzj('wcsnmb')" id='wcsnmbhd' name='wcsnmbhd' class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='wcsnmb' name='wcsnmb' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						挖除水稳基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="wcswjcdj">30</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input type="text" value='0' onchange="jsbzzj('wcswjc')" id='wcswjchd' name='wcswjchd' class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='wcswjc' name='wcswjc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						打板</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层换板
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmchbdj">160</span>元/平方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='snhntmchbse' onclick="jsbzzj('snhntmchb')" type="checkbox"/>
						<input type="hidden" id='snhntmchbhd' name='snhntmchbhd'>
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmchb' name='snhntmchb' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						标线</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						标线
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：二级及以下  <span id="bxerdj">10000</span>元/公里,一级<span id="bxyidj">15000</span>元/公里
						
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：中修打板不计
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='bxse' onclick="jsbzzj('bx')" type="checkbox"/>
						<input type="hidden" id='bxhd' name='bxhd'>
						
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='bx' name='bx' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						碎石化</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层碎石化
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmcsshdj">8</span>元/平方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='snhntmcsshse' onclick="jsbzzj('snhntmcssh')" type="checkbox"/>
						<input type="hidden" id='snhntmcsshhd' name='snhntmcsshhd'>
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmcssh' name='snhntmcssh' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr style="height: 30px;">
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						省补资金</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<span id='sbzj1'></span>万元
						<input type="hidden" id='sbzj' name="sbzj">
					</td>
					
	            </tr>
	            
            </tbody>
            
            
            
			<tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="sfinsert()" alt="确定" src="../../../images/Button/qd1.gif" onmouseover="this.src='../../../images/Button/qd2.gif'" onmouseout="this.src='../../../images/Button/qd1.gif' " />
                </td>
            </tr>
		</table>
		</form>
	</div>
</body>
</html>
