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
			loadBmbm2('txtGCFL','养护类别');
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
				multiple : false,minChars :1,multipleSeparator : ' ',
				mustMatch: true,cacheLength : 0,delay : 200,max : 50,
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
					selectTSDQ(node.id);
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
			if($('#txtXMMC').val()==""){alert("项目名称不能为空！");return;
			}else if($('#txtGCFL').combobox('getValue')==""){alert("工程分类不能为空！");return ;
			}else if($('#txtJhkgsj').combo('getValue')==""){alert("计划开工时间不能为空！");return;
			}else if($('#txtJhwgsj').combo('getValue')==""){alert("计划完工时间不能为空！");return;
			}else if($('#txtSBJF').val()==""){alert("上报经费不能为空！");return;
			}else if($('#ztz').val()==""){alert("总投资不能为空！");return;
			}else if($('#txtLXBM').val()==""){alert("路线编码不能为空！");return;
			}else if($('#txtLXMC').val()==""){alert("路线名称不能为空！");return;
			}else if($('#txtQDZH').val()==""){alert("起点桩号不能为空！");return;
			}else if($('#txtZDZH').val()==""){alert("止点桩号不能为空！");return;
			}else if($('#txtLC').val()==""){alert("起止里称不能为空！");return;
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
					'lx.ylmhd':$('#txtYLMHD').val(),'lx.yjsdj':$('#txtJSDJ').combotree('getValue'),
					'lx.xzqhdm':$('#txtXZQHMC').combotree('getValue'),'lx.xzqhmc':$('#txtXZQHMC').combotree('getText'),
					'lx.gydwmc':$('#txtGYDWMC').combotree('getText'),'lx.gydwdm':$('#txtGYDWMC').combotree('getValue'),
					'lx.bhnr':$('#txtBHNR').val(),'jh.sbnf':$('#lblYear').combotree('getValue'),
					'lx.dzxkd':$('#txtyhdzxkd').val(),'lx.lmjg':lmjgjson,'lx.aym':JSON.stringify(ymjson),
					'lx.asl':JSON.stringify(sljson),'lx.glf':JSON.stringify(glfjson),'lx.tbbmdm':$.cookie("unit"),
					'jh.jhkgsj':$('#txtJhkgsj').combo('getValue'),'jh.jhwgsj':$('#txtJhwgsj').combo('getValue'),
					'jh.classify':$('#txtGCFL').combobox('getValue'),'jh.aadt':$('#lblJTL').val(),
					'jh.pqi':$('#txtPQI').val(),'jh.dianceng':$('#txtDC').val(),'jh.jiceng':$('#txtJC').val(),
					'jh.surface':$('#txtMC').val(),'jh.reportingfee':$('#txtSBJF').val(),
					//'jh.plandownnumber':$('#txtJHXDWH').val(),'jh.xdsj':$('#txtJhxdsj').combo('getValue'),
					'jh.mark':$("input[name='txtXJBS']:checked").val(),'jh.constructnumber':$('#txtSGTWH').val(),
					'jh.replynumber':$('#txtGKPFWH').val(),'jh.devisenumbder':$('#txtSJPFWHH').val(),
					'jh.description':$('#txtJSCZMS').val(),'jh.xchsqk':$('#txtXCHSQK').val(),
					'jh.remarks':$('#txtSTCBZ').val(),'jh.qtbz':$('#txtQTBZ').val(),
					'jh.fee':$('#lxhsjf').html(),'jh.newfee':$('#lxspjf').html(),'jh.xmmc':$('#txtXMMC').val(),
					'jh.totalplacefund':$('#dfptztz').html(),'jh.totalsubsidyfund':$('#zbzzj').html(),
					'jh.totalinvest':$('#ztz').val(),'jh.tbbm':$.cookie("unit"),'jh.tbsj':tbsj,'lx.tsdq':$("#tsdq").html()};
			$.ajax({
				type:'post',
				url:'../../../jhgl/insertYhdzx.do',
				dataType:'json',
				data:params,
				success:function(data){
					if(data.result=="true"){
						alert("添加成功！");
						parent.$('#grid').datagrid('reload');
						parent.$('#add_yhdzx').window('destroy');
					}else if(data.result='have'){
						alert("此路线已存在！");
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
		
		function selectTSDQ(str){
			var data="xzqhdm1="+str;
			$("#tsdq").text("");
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmjck/selectTSDQ.do',
				data:data,
				dataType:'json',
				success:function(msg){
					if(msg.length>0){
						var tsdqstr="";
						for(var i=0;i<msg.length;i++){
							tsdqstr=tsdqstr+msg[i]+"、";
						}
						tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
						$("#tsdq").text(tsdqstr);
					}
				}
			});	
		}
		
		function check(str){
			var g = /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)|(^[1-9][0-9]*.[0-9]*$)/;
			if(str.value==''){
				return;
			}
		    if( !g.test(str.value)){
		    	alert("请输入正确的数字");
		    	$(str).val('');
		    	return;
		    }
		}
	</script>
</head>
<body>
	<div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:100%;">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	养护大中修项目计划信息
                </td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					上报年份</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id="lblYear" style="width:80px;"></select>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtXMMC" type="text"/><span style="color: red;">  *</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工程分类</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtGCFL" type="text"/><span style="color: red;">  *</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划开工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtJhkgsj" class="easyui-datebox" style="width:125px;" type="text"/><span style="color: red;">  *</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划完工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtJhwgsj" class="easyui-datebox" style="width:125px;" type="text"/><span style="color: red;">  *</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
				续建表示</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtXJBS0" name="txtXJBS" value="是" type="radio"/>是
					<input id="txtXJBS1" name="txtXJBS" value="否" type="radio" checked="checked"/>否
				</td>
				<!-- <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划下达时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtJhxdsj" class="easyui-datebox" style="width:125px;" type="text"/>
				</td> -->
            </tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					垫层</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="txtDC" style="width:100px;" type="text"/>m³
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					基层</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="txtJC" style="width:100px;" type="text"/>m³
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					面层</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="txtMC"  style="width:100px;" type="text"/>公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					上报经费</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="txtSBJF" style="width:100px;" type="text"/>万元<span style="color: red;">  *</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					核算经费</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lxhsjf">0</span>万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					审批经费</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lxspjf">0</span>万元
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					总投资</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="ztz" type="text" style="width:100px;"/>万元<span style="color: red;">  *</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					地方配套总投资</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="dfptztz">0</span>万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					总补助资金</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="zbzzj">0</span>万元
				</td>
			</tr>
			<tr style="height: 30px;">
				<!-- <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划下达文号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtJHXDWH" type="text"/>
				</td> -->
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					施工图文号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="txtSGTWH" type="text"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					工可批复文号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtGKPFWH" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					设计批复文号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtSJPFWHH" type="text"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					交通量</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="lblJTL" type="text" style="width:100px;"/>万辆/年
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					PQI指标</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<select id="txtPQI" style="width: 50px;">
						<option value="优">优</option>
						<option value="良">良</option>
						<option value="中">中</option>
						<option value="次">次</option>
						<option value="差">差</option>
					</select>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"></td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;"></td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术处置描述</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<textarea id="txtJSCZMS" style="width: 700px;height: 40px;"></textarea>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					现场核实情况</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="txtXCHSQK" style="width: 700px;height: 40px;"></textarea>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					省统筹备注</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="txtSTCBZ" style="width: 700px;height: 40px;"></textarea>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					其它备注
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="txtQTBZ"  style="width: 700px;height: 40px;"></textarea>
				</td>
			</tr>
		</table>
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	养护大中修项目路线信息
                	<input id="jhid" type="hidden"/>
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
				<td style="border-left: 1px solid #C0C0C0;border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
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
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
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
					<input id="txtZDZH"  onblur="jisuanlc(this)" type="text"/><span style="color: red;">  *</span>
					<div id="zdts" style="color:red;font-size:xx-small;display: none;">止点桩号要<=<span id="spzdzh">0</span></div>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					起止里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="txtLC" type="text" style="width: 100px;"/>公里<span style="color: red;">  *</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					核对里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="txtHDLC" type="text" style="width: 100px;"/>公里<span style="color: red;">  *</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					大中修宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="txtyhdzxkd" style="width: 100px;" type="text"/>米<span style="color: red;">  *</span>
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
					<input onblur="check(this)" id="txtYLMKD" style="width: 100px;" type="text"/>米
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面厚度</td>
				<td style="border-left: 1px solid #C0C0C0;border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="txtYLMHD" style="width:100px;" type="text"/>cm
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					特殊地区</td>
				<td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="tsdq"></span>
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
								<input onblur="check(this)" id="txtsmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtsmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtsmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">中面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selzmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtzmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtzmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtzmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">下面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selxmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtxmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtxmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtxmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">封层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selfc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtfchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtfcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtfcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">上基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selsjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtsjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtsjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtsjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">中基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selzjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtzjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtzjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtzjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">下基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selxjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtxjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtxjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtxjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">垫层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="seldc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtdchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtdcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtdcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">原路</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selyl" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtylhd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtyldj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input onblur="check(this)" id="txtylsddj" type="text" style="width: 80px"/>
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
								<input onblur="check(this)" id="txtglfdj" value="0" type="text" style="width: 80px;"/>
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
			<tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="insert()" alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " />
                </td>
            </tr>
		</table>
	</div>
</body>
</html>