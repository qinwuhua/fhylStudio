<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修详细</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_yhdzx.js"></script>
	<script type="text/javascript">
		var lmjgjson,ymjson,sljson,glfjson;//1、存储路面结构的json字符串   2、存储延米数据的json 3、存储数量的json 4、存储管养费的json
		$(function(){
			loadBmbm2('txtJSDJ','技术等级');
			gydwComboxTree("txtGYDWMC");
			loadXzqh("txtXZQHMC",$.cookie("dist"));
			sbnf("lblYear");
			loadCslx('selsmc','上面层');
			loadCslx('selzmc','中面层');
			loadCslx('selxmc','下面层');
			loadCslx('selfc','封层');
			loadCslx('selsjc','上基层');
			loadCslx('selzjc','中基层');
			loadCslx('selxjc','下基层');
			loadCslx('seldc','垫层');
			loadCslx('selyl','原路');
			if(roleName()!="省级"){
				$.each($('td [name=sdtd]'),function(index,item){
					$(item).hide();
				});
			}
			autoCompleteLXBM();
		});
		function autoCompleteLXBM(){
			var url = "/jxzhpt/jhgl/yhdzxAutoCompleteLxbm.do";
			$("#txtLXBM").autocomplete(url, {
				multiple : false,minChars :4,multipleSeparator : ' ',
				mustMatch: true,cacheLength : 0,delay : 200,max : 150,
		  		extraParams : {
		  			'lx.lxbm':function() {
		  				var d = $("#txtLXBM").val();
		  				return d;
		  			},
		  			'lx.xzqhdm':function() {
		  				var d = $.cookie("dist");
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
					$('#txtLXMC').val(item.lxmc);
					$('#txtQDZH').val(item.qdzh);
					$('#spqdzh').html(item.qdzh);
					$('#qdts').show();
					$('#txtZDZH').val(item.zdzh);
					$('#spzdzh').html(item.zdzh);
					$('#zdts').show();
					$('#txtLC').val(item.qzlc);
					$('#txtHDLC').val(item.qzlc);
					$('#txtJSDJ').combobox("setValue",item.yjsdj);
					$('#txtYLMLX').val(item.ylmlx);
					$('#txtYLMKD').val(item.ylmkd);
					$('#txtyhdzxkd').val(item.ylmkd);
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
					$('#xzqhdm').html(node.id);
				}
			});
			$('#'+id).combotree('setValue', dwbm);
		}
		function sbnf(id){
			var myDate = new Date();
			var years=[];
			var first;
			for(var i=0;i<=10;i++){
				if(i==0)
					first=myDate.getFullYear()-i;
				years.push({text:(myDate.getFullYear()-i)});
			}
			$('#'+id).combobox({    
			    data:years,
			    valueField:'text',    
			    textField:'text'   
			});
			$('#'+id).combobox("setValue",first);
		}
		
		function insert(){
			if($('#txtLXBM').val()==""){alert("路线编码不能为空！");return;
			}else if($('#txtLXMC').val()==""){alert("路线名称不能为空");return;
			}else if($('#txtQDZH').val()==""){alert("起点桩号不能为空！");return;
			}else if($('#txtZDZH').val()==""){alert("止点桩号不能为空！");return;
			}else if($('#txtLC').val()==""){alert("起止里程不能为空！");return;
			}else if($('#txtHDLC').val()==""){alert("核对里程不能为空！");return;
			}else if($('#txtyhdzxkd').val()==""){alert("大中修宽度不能为空！");return;}
			if(Number($('#txtQDZH').val())<Number($('#spqdzh').html())){
				alert("起点桩号要大于或等于"+$('#spqdzh').html());
				return;
			}
			if(Number($('#txtZDZH').val())>Number($('#spzdzh').html())){
				alert("起点桩号要小于或等于"+$('#spzdzh').html());
				return;
			}
			if(Number($('#txtHDLC').val())>Number($('#txtLC').val())){
				alert("核对里程不能大于起止里程！");
				return;
			}
			reckonsum();
			var myDate = new Date();
			var tbsj=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
			var params={'lx.lxid':$('#lxid').val(),'lx.lxmc':$('#txtLXMC').val(),'lx.lxbm':$('#txtLXBM').val(),'lx.qdzh':$('#txtQDZH').val(),
					'lx.zdzh':$('#txtZDZH').val(),'lx.qzlc':$('#txtLC').val(),'lx.hdlc':$('#txtHDLC').val(),
					'lx.ylmlx':$('#txtYLMLX').val(),'lx.ylmkd':$('#txtYLMKD').val(),
					'lx.ylmhd':$('#txtYLMHD').val(),'lx.yjsdj':$('#txtJSDJ').combo('getValue'),
					'lx.xzqhdm':$('#txtXZQHMC').combotree('getValue'),'lx.xzqhmc':$('#txtXZQHMC').combotree('getText'),
					'lx.gydwmc':$('#txtGYDWMC').combotree('getText'),'lx.gydwdm':$('#txtGYDWMC').combotree('getValue'),
					'lx.bhnr':$('#txtBHNR').val(),'lx.dzxkd':$('#txtyhdzxkd').val(),
					'lx.lmjg':lmjgjson,'lx.aym':JSON.stringify(ymjson),'lx.asl':JSON.stringify(sljson),
					'lx.glf':JSON.stringify(glfjson),'lx.tbbmdm':$.cookie("unit"),
					'lx.tbsj':tbsj,'lx.jhid':parent.YMLib.Var.ID,'jh.sbnf':parent.YMLib.Var.NF,'zjlx':'true',
					'jh.totalsubsidyfund':Number(glfjson.pgdj)*Number($('#txtHDLC').val()),
					'jh.fee':Number(glfjson.ysdj)*Number($('#txtHDLC').val()),
					'jh.newfee':Number(glfjson.pgdj)*Number($('#txtHDLC').val())};
			$.ajax({
				type:'post',
				url:'../../../jhgl/insertYhdzxLx.do',
				dataType:'json',
				data:params,
				success:function(data){
					if(data.result){
						alert("添加成功！");
						parent.$('#grid').datagrid('reload');
						parent.$('#add_yhdzxlx').window('destroy');
					}
				},
				error:function(e){
					alert("添加失败！");
				}
			});
		}
		function jisuanlc(t){
			if(Number($('#txtQDZH').val())<Number($('#spqdzh').html())){
				alert("起点桩号要大于或等于"+$('#spqdzh').html());
				return;
			}
			if(Number($('#txtZDZH').val())>Number($('#spzdzh').html())){
				alert("起点桩号要小于或等于"+$('#spzdzh').html());
				return;
			}
			var lc = (Number($('#txtZDZH').val()).toFixed(3)-Number($('#txtQDZH').val()).toFixed(3)).toFixed(3);
			if(lc>=0){
				$('#txtLC').val(lc);
			}else{
				alert("项目里程不能为负数！");
				$(t).focus();
			}
		}
	</script>
</head>
<body>
	<div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:100%;">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	养护大中修项目路线信息
                </td>
            </tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管养单位</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="txtGYDWMC" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					路线编码</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtLXBM" type="text"/><span style="color: red;">  *</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路线名称<input id="lxid" type="hidden"/>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtLXMC" type="text"/><span style="color: red;">  *</span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					行政区划名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<select id="txtXZQHMC" style="width:130px;"></select>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					起点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtQDZH" onblur="jisuanlc(this)" type="text"/><span style="color: red;">  *</span>
					<div id="qdts" style="color:red;font-size:xx-small; ;display: none;">起点桩号要>=<span id="spqdzh">0</span></div>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					止点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="txtZDZH" onblur="jisuanlc(this)" type="text"/><span style="color: red;">  *</span>
					<div id="zdts" style="color:red;font-size:xx-small;display: none;">止点桩号要<=<span id="spzdzh">0</span></div>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					起止里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtLC" type="text" style="width:80px;"/>&nbsp;公里<span style="color: red;">  *</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					核对里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtHDLC" type="text" style="width:80px;"/>&nbsp;公里<span style="color: red;">  *</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					大中修宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtyhdzxkd" style="width: 80px;" type="text"/>&nbsp;米<span style="color: red;">  *</span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="txtJSDJ" type="text"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路面类型</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtYLMLX" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtYLMKD" type="text"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面厚度</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtYLMHD" type="text"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					特殊地区</td>
				<td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblTSDQ">罗霄山山脉</span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					病害内容</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="txtBHNR" style="width: 700px;height: 40px;"></textarea>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路面结构
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="margin-top: 5px;margin-bottom: 5px;">
						<tr align="center">
							<td width="80" style="border: 1px solid #C0C0C0;">
								<input id="ljkdzj" type="checkbox"/> 路基宽度增加0.5m
							</td>
							<td width="100" style="border: 1px solid #C0C0C0;">材料</td>
							<td width="60" style="border: 1px solid #C0C0C0;">厚度(cm)</td>
							<td style="border: 1px solid #C0C0C0;">单价(元/m³)</td>
							<td name="sdtd" style="border: 1px solid #C0C0C0;">审定单价(元/m³)</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">上面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selsmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtsmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtsmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtsmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">中面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selzmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtzmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtzmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtzmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">下面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selxmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtxmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtxmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtxmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">封层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selfc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtfchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtfcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtfcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">上基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selsjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtsjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtsjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtsjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">中基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selzjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtzjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtzjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtzjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">下基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selxjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtxjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtxjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtxjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">垫层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="seldc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtdchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtdcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtdcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">原路</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selyl" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtylhd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtyldj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtylsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					按延米</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table id="ymtab" style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center" id="ymtr">
							<td width="200" height="30" style="border: 1px solid #C0C0C0;">项目：如路肩、标线等</td>
							<td width="120" height="30" style="border: 1px solid #C0C0C0;">说明</td>
							<td width="60" height="30" style="border: 1px solid #C0C0C0;">长度(m)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">单价(元/m)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">
								操作  <input onclick="addym()" type="button" value="添加"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					按数量</td>
				<td colspan="5" id="sltab" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center" id="asltr">
							<td width="200" height="30" style="border: 1px solid #C0C0C0;">项目：如边坡、挡土墙等</td>
							<td width="120" height="30" style="border: 1px solid #C0C0C0;">说明</td>
							<td width="60" height="30" style="border: 1px solid #C0C0C0;">数量(m、m²、m³)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">单价(元/m、m²、m³)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">
								操作  <input onclick="addasl()" type="button" value="添加"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管理费</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center">
							<td width="198" align="center" style="border: 1px solid #C0C0C0;">项目</td>
							<td width="120" align="center" style="border: 1px solid #C0C0C0;">单位</td>
							<td width="58" style="border: 1px solid #C0C0C0;"></td>
							<td width="99" align="center" style="border: 1px solid #C0C0C0;">单价(元)</td>
							<td width="100" style="border: 1px solid #C0C0C0;"></td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">
								按每%或元/每公里计算
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="seldw" style="width:100px;">
									<option value="百分比">按%计算</option>
									<option value="公里">按元/每公里</option>
								</select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;"></td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtglfdj" value="0" type="text" style="width: 80px;"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">此项目只能选择一种 </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					合计</td>
				<td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table  style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr height="25">
							<td width="130" style="border: 1px solid #C0C0C0;">预算单价(万元/公里)：</td>
							<td width="80" style="border: 1px solid #C0C0C0;"><span id="lblysdj" style="margin-left: 5px;">0</span>万元</td>
							<td width="130" name="sdtd" style="border: 1px solid #C0C0C0;">评估单价(万元/公里)：</td>
							<td width="80" name="sdtd" style="border: 1px solid #C0C0C0;"><span id="lblpgdj" style="margin-left: 5px;">0</span>万元</td>
						</tr>
					</table>
				</td>
				<td colspan="2"  style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="button" onclick="reckonsum()" value=" 计 算 价 格 "/>
				</td>
			</tr>
		</table>
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="insert()" alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " />
                </td>
            </tr>
		</table>
	</div>
</body>
</html>