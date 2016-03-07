<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护中心add</title>
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
					data:'xmsq.xmlx='+6+'&xmsq.xzqhdm='+$.cookie('dist')+'&xmsq.xmnf='+rec.value,
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
			xmnf1("xmnf");
			loadDist("xzqh1",$.cookie("dist"));
			loadUnit("gydw1",$.cookie("unit"));
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryNextXmbm.do',
				data:'xmsq.xmlx='+6+'&xmsq.xzqhdm='+$.cookie('dist')+'&xmsq.xmnf='+$("#xmnf").combobox('getValue'),
				dataType:'json',
				success:function(msg){
					
					$('#xmbm1').val($("#xmnf").combobox('getValue')+$.cookie('dist')+msg.xmbm);
					$('#xmbm1').attr("disabled","disabled");
					$('#xmbm').val($("#xmnf").combobox('getValue')+$.cookie('dist')+msg.xmbm);
				}
			});
// 			autoCompleteLXBM();
		});
		
// 		function autoCompleteLXBM(){
// 			var url = "/jxzhpt/qqgl/queryAutoList.do";
// 			$("#ylxbh").autocomplete(url, {
// 				multiple : false,minChars :4,multipleSeparator : ' ',
// 				mustMatch: true,cacheLength : 0,delay : 200,max : 50,
// 		  		extraParams : {
// 		  			'ylxbh':function() {
// 		  				var d = $("#ylxbh").val();
// 		  				return d;
// 		  			},
// 		  			'xzqhdm':function() {
// 		  				var d = $.cookie("dist");
// 		  				return d;
// 		  			}
// 		  		},
// 		  		dataType:'json',// 返回类型
// 		  		// 对返回的json对象进行解析函数，函数返回一个数组
// 		  		parse : function(data) {
// 		  			var aa = [];
// 		  			aa = $.map(eval(data), function(row) {
// 		  					return {
// 		  					data : row,
// 		  					value : row.lxbm.replace(/(\s*$)/g,""),
// 		  					result : row.lxbm.replace(/(\s*$)/g,"")
// 		  				};
// 		  			});
// 		  			return aa;
// 		  		},
// 		  		formatItem : function(row, i, max) {
// 		  			return row.lxbm.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
// 		  		}
// 		  	}).result(
// 				function(e, item) {
// 					$('#ylxbh').val(item.lxbm);
// 					$('#ghlxbh').val(item.lxbm);
// 					$('#lxmc').val(item.lxmc);
// 					$('#qdmc').val(item.qdmc);
// 					$('#zdmc').val(item.zdmc);
// 					$('#qdzh').val(item.qdzh);
// 					$('#gpsqdzh').val(item.qdzh);
// 					$('#span_qdzh').html(item.qdzh);
// 					$('#zdzh').val(item.zdzh);
// 					$('#gpszdzh').val(item.zdzh);
// 					$('#span_zdzh').html(item.zdzh);
// 					$('#lc').val(item.lc);
// 					$('#jsdj').val(item.xjsdj);
// 					$('#lmkd').val(item.ylmlx);
// 					queryJsdjAndLc($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
// 					$.ajax({
// 						type:'post',
// 						url:'../../../qqgl/queryTsdq.do',
// 						data:'ylxbh='+$('#ylxbh').val()+'&qdzh='+$('#qdzh').val()+'&zdzh='+$('#zdzh').val(),
// 						dataType:'json',
// 						success:function(msg){
// 							$('#tsdq1').html(msg.tsdq);
// 							$('#tsdq').val(msg.tsdq);
// 						}
// 					});
// 			});
// 		}
		
// 		function loadXzqh(id,dwbm){
// 			$('#'+id).combotree({
// 				checkbox:false,
// 				url : '/jxzhpt/xtgl/selAllXzqh.do?yhdw=' + dwbm,
// 				onBeforeExpand:function(node, param) {
// 					$('#'+id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="+ node.id;
// 				},
// 				onSelect:function(node) {
// 					YMLib.Var.DistName = node.text;
// 					//alert("sss");
// 					$('#xzqhdm').html(node.id);
// 					selectTSDQ(node.id);
// 				}
// 			});
// 			$('#'+id).combotree('setValue', dwbm);
// 		}
		
		function insert(){
			$('#gydw').val($('#gydw1').combo("getText"));
			$('#gydwdm').val($('#gydw1').combo("getValue"));
			$('#xzqh').val($('#xzqh1').combo("getText"));
			$('#xzqhdm').val($('#xzqh1').combo("getValue"));
			var result=true;
			result = validateText('ydbmc',null,result);
			result = validateText('lxmc',null,result);
			result = validateText('jb',null,result);
			result = validateText('jsxz',null,result);
			result = validateText('lxzh',null,result);
			result = validateText('xmmc',null,result);
			result = validateText('ztz','number',result);
			result = validateText('zbzzj','number',result);
			result = validateText('sbzzj','number',result);
			
			if(!result){
				return;
			}
				$('#submit').ajaxSubmit({
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							alert("添加成功！");
							parent.queryYhzx();
							closeWindow("yhzxadd");
						}
					},
					error:function(msg){
						alert("添加失败！");
					}
				});
			}
		function changeDfzc(){
			var ztz=$("#ztz").val();
			var zbzzj=$("#zbzzj").val();
			var result=true;
			result = validateText('ztz','number',result);
			result = validateText('zbzzj','number',result);
			if(!result){return;}
			var dfzc=parseFloat(ztz)-parseFloat(zbzzj);
			$("#dfzcSpan").html(dfzc);
			$("#dfzc").val(dfzc);
		}
		
		function changeZddzjl(){
			var zbzzj=$("#zbzzj").val();
			var sbzzj=$("#sbzzj").val();
			var result=true;
			result = validateText('zbzzj','number',result);
			result = validateText('sbzzj','number',result);
			if(!result){return;}
			var zddzjl=parseFloat(zbzzj)-parseFloat(sbzzj);
			$("#zddzjl").val(zddzjl);
			$("#zddzjlSpan").html(zddzjl);
		}
// 		function zhuanghao(){
// 			if(Number($('#qdzh').val())<Number($('#span_qdzh').html())){
// 				alert("起点桩号不能小于"+$('#span_qdzh').html());
// 				return false;
// 			}else if(Number($('#zdzh').val())>Number($('#span_zdzh').html())){
// 				alert("止点桩号不能大于"+$('#span_zdzh').html());
// 				return false;
// 			}else if(Number($("#zdzh"))<Number($('#qdzh').val())){
// 				alert("止点桩号不能小于起点桩号");
// 				return false;
// 			}else{
// 				return true;
// 			}
// 		}
	</script>
</head>
<body>
	<div id="yhzx_xx" style="text-align: left;font-size: 12px;width:100%;">
		<form id="submit" action="../../../qqgl/insertYhzx.do">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					所在路线名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lxmc" name="lxmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					所在路线桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lxzh" name="lxzh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原道班名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ydbmc" name="ydbmc" type="text" style="width: 80px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					级别
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id="jb" name="jb"  style="width: 124px;">
					<option value="1">市级</option>
					<option value="2">县级</option>
					</select>
					&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					行政区划</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xzqh1" name="xzqh1" type="text" style="width: 124px;"/>
					<input id="xzqh" name="xzqh" type="hidden"/>
					<input id="xzqhdm" name="xzqhdm" type="hidden"/>
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
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xmmc" name="xmmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					建设性质</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id="jsxz" name="jsxz"  style="width: 124px;">
					<option value="1">新建</option>
					<option value="2">扩建</option>
					<option value="2">改建</option>
					</select>
					&nbsp;<span style="color: red;">*</span>
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
					总投资（万元）</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ztz" name="ztz" type="text" style="width: 80px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					总补助资金（万元）</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zbzzj" name="zbzzj" type="text" onblur="changeDfzc()"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					省补助资金（万元）</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="sbzzj" name="sbzzj" type="text" onblur="changeZddzjl()"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					重点打造奖励（万元）</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="zddzjlSpan"></span>
					<input type="hidden" id="zddzjl" name="zddzjl"/>
				</td>
            </tr>
            <tr>
            <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
				地方自筹（万元）</td>
			<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
				<span id="dfzcSpan"></span>
				<input type="hidden" id="dfzc" name="dfzc"/>
			</td>
            <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
				项目年份
			</td>
			<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
				<select id="xmnf" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
			</td>
            </tr>
            <tr style="height: 70px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					备注</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<textarea id="bz" name="bz" rows="" cols="" style="width: 650px;height: 60px;"></textarea>
				</td>
            </tr>
			<tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="insert()" alt="确定" src="../../../images/Button/qd1.gif" onmouseover="this.src='../../../images/Button/qd2.gif'" onmouseout="this.src='../../../images/Button/qd1.gif' " />
                </td>
            </tr>
		</table>
		</form>
	</div>
</body>
</html>