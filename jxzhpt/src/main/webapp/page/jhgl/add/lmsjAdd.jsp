<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
	$(function(){
		loadBmbm2('yjsdj','技术等级');
		loadBmbm2('gjhjsdj','技术等级');
		loadBmbm2('jsjsbz','技术等级');
		gydwComboxTree("gydwxx");
		loadXzqh("xzqhmc",$.cookie("dist"));
		sbnf("editjhnf");
		autoCompleteLXBM();
		sfsqablbz("否");
	});
	function autoCompleteLXBM(){
		var url = "/jxzhpt/jhgl/sjAutoCompleteLxbm.do";
		$("#lxbm").autocomplete(url, {
			multiple : false,minChars :1,multipleSeparator : ' ',
			mustMatch: true,cacheLength : 0,delay : 200,max : 50,
	  		extraParams : {
	  			'lx.lxbm':function() {
	  				var d = $("#lxbm").val();
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
				
				$('#lxmc').val(item.lxmc);
				$('#qdzh').val(item.qdzh);
				$('#spqdzh').html(item.qdzh);
				$('#qdts').show();
				$('#zdzh').val(item.zdzh);
				$('#spzdzh').html(item.zdzh);
				$('#zdts').show();
				$('#qzlc').val(item.qzlc);
				$('#yhlc').val(item.qzlc);
				$('#yjsdj').combobox("setValue",item.yjsdj);
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
		if($("#lxbm").val()==''||$("#lxbm").val()==null){
			alert("路线编码不能为空");
			return;
		}
		if($("#lxmc").val()==''||$("#lxmc").val()==null){
			alert("路线名称不能为空");
			return;
		}
		if($('#yjsdj').combobox("getValue")==''||$('#yjsdj').combobox("getValue")==null){
			alert("请选择原技术等级");
			return;
		}
		if($("#qdzh").val()==''||$("#qdzh").val()==null){
			alert("起点桩号不能为空");
			return;
		}
		if($("#zdzh").val()==''||$("#zdzh").val()==null){
			alert("止点桩号不能为空");
			return;
		}
		if($("#qzlc").val()==''||$("#qzlc").val()==null){
			alert("起止里程不能为空");
			return;
		}
		if($("#xmlc").val()==''||$("#xmlc").val()==null){
			alert("项目里程不能为空");
			return;
		}
		if($('#jhkgsj').datebox("getText")==''||$('#jhkgsj').datebox("getText")==null){
			alert("计划开工时间不能为空");
			return;
		}
		if($('#jhwgsj').datebox("getText")==''||$('#jhwgsj').datebox("getText")==null){
			alert("计划完工时间不能为空");
			return;
		}
		if($('#xmmc').val()==''||$('#xmmc').val()==null){
			alert("项目名称不能为空");
			return;
		}
		if($('#pftz').val()==''||$('#pftz').val()==null){
			alert("批复总投资不能为空");
			return;
		}
		if($('#jhsybbzje').val()==''||$('#jhsybbzje').val()==null){
			alert("计划使用部补助金额不能为空");
			return;
		}
		if($('#jhsysbzje').val()==''||$('#jhsysbzje').val()==null){
			alert("计划使用省补助金额不能为空");
			return;
		}
		
		if(Number($('#qdzh').val())<Number($('#spqdzh').html())){
			alert("起点桩号要大于或等于"+$('#spqdzh').html());
			return;
		}
		if(Number($('#zdzh').val())>Number($('#spzdzh').html())){
			alert("止点桩号要小于或等于"+$('#spzdzh').html());
			return;
		}
		if(Number($('#qzlc').val())<Number($('#xmlc').val())){
			alert("项目里程不能大于起止里程！");
			return;
		}
		var myDate = new Date();
		var tbsj=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
		var obj={'lx.lxmc':$('#lxmc').val(),'lx.lxbm':$('#lxbm').val(),'lx.yjsdj':$('#yjsdj').combobox("getValue"),
				'lx.qdzh':$('#qdzh').val(),'lx.zdzh':$('#zdzh').val(),'lx.qzlc':$('#qzlc').val(),
				'lx.qdmc':$('#qdmc').val(),'lx.zdmc':$('#zdmc').val(),'lx.xmlc':$('#xmlc').val(),
				'lx.lyllqk':$('#lyllqk').val(),'lx.dlqlbm':$('#dlqlbm').val(),'lx.dlqlzxzh':$('#dlqlzxzh').val(),
				'lx.gydwdm':$('#gydwxx').combobox("getValue"),'lx.gydw':$('#gydwxx').combobox("getText"),
				'lx.xzqhmc':$('#xzqhmc').combobox("getText"),'lx.xzqhdm':$('#xzqhmc').combobox("getValue"),
				'lx.bhnr':$('#bhnr').val(),'lx.tbsj':tbsj,'lx.sfxz':$('#sfxz').val(),
				'jh.fapgdw':$('#fapgdw').val(),'jh.fascdw':$('#fascdw').val(),'jh.faspsj':$('#faspsj').datebox("getText"),
				'jh.spwh':$('#spwh').val(),'jh.tzgs':$('#tzgs').val(),'jh.jsxz':$('#jsxz').val(),
				'jh.jsnr':$('#jsnr').val(),'jh.jhnf':$('#editjhnf').combobox("getValue"),'jh.jhkgsj':$('#jhkgsj').datebox("getText"),
				'jh.jhwgsj':$('#jhwgsj').datebox("getText"),
				//'jh.xdsj':$('#xdsj').datebox("getText"),'jh.jhxdwh':$('#jhxdwh').val(),
				'jh.xmwybh':$('#xmwybh').val(),'jh.xmmc':$('#xmmc').val(),'jh.sjdw':$('#sjdw').val(),
				'jh.sjpfdw':$('#sjpfdw').val(),'jh.jsjsbz':$('#jsjsbz').combobox("getValue"),
				'jh.ql':$('#ql').val(),'jh.ql_m':$('#ql_m').val(),
				'jh.sd':$('#sd').val(),'jh.sd_m':$('#sd_m').val(),'jh.hd':$('#hd').val(),
				'jh.ljtsf':$('#ljtsf').val(),'jh.dc':$('#dc').val(),'jh.jc':$('#jc').val(),
				'jh.lqlm':$('#lqlm').val(),'jh.snlm':$('#snlm').val(),'jh.gjhjsdj':$('#gjhjsdj').combobox("getValue"),
				'jh.sftqss':$("input[name='sftqss']:checked").val(),'jh.pfwh':$('#pfwh').val(),'jh.pfsj':$('#pfsj').datebox('getText'),
				'jh.pftz':$('#pftz').val(),'jh.jhsybbzje':$('#jhsybbzje').val(),'jh.jhsydfzczj':$('#jhsysbzje').val(),
				'jh.sfsqablbz':$("input[name='sfsqablbz']:checked").val(),
				'jh.ablbzsqwh':$('#ablbzsqwh').val(),'jh.gksjwh':$('#gksjwh').val(),'jh.sjpfwh':$('#sjpfwh').val(),
				'jh.remarks':$('#remarks').val(),'jh.tbbm':$.cookie("unit"),'lx.tsdq':$("#tsdq").html()};
		$.ajax({
			type:'post',
			url:'/jxzhpt/jhgl/insertGcsj.do',
			data:obj,
			dataType:'json',
			success:function(data){
				if(data.result=="true"){
					alert("添加成功！");
					parent.$("#grdab").datagrid('reload');
					parent.$('#add_lmsj').window('destroy');
				}else if(data.result=="have"){
					alert("此路线以存在！");
				}else if(data.result=="none"){
					alert("计划库中没有此路线！");
				}
			}
		});
	}
	function jisuanlc(t){
		var lc = (Number($('#zdzh').val()).toFixed(3)-Number($('#qdzh').val()).toFixed(3)).toFixed(3);
		if(lc<0){
			alert("起止里程不能为负数！");
			$(t).focus();
			return;
		}else{
			$('#qzlc').val(lc);
			if(t.id!="xmlc")
				$('#xmlc').val(lc);
		}
		if(Number($('#qdzh').val())<Number($('#spqdzh').html())){
			alert("起点桩号要大于或等于"+$('#spqdzh').html());
			$(t).focus();
			return;
		}
		if(Number($('#zdzh').val())>Number($('#spzdzh').html())){
			alert("起点桩号要小于或等于"+$('#spzdzh').html());
			$(t).focus();
			return;
		}
		if(Number($('#xmlc').val())>Number($('#qzlc').val())){
			alert("项目里程不能大于起止里程！");
			$(t).focus();
			return;
		}
	}
	function sfsqablbz(value){
		if(value=="是"){
			$('#ablbzsqwh').removeAttr("disabled");
		}else if(value=="否"){
			$('#ablbzsqwh').attr("disabled","disabled");
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
		var g = /^-?[1-9]+(?=\.{0,1}\d+$)|(^0$)|(^-?0\.[0-9]*[1-9]$)|(^-?[1-9][0-9]*.[0-9]*$)/;
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
<body style="font-size: 12px;">
	<div>
		<table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; 
			border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;" cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					路面改造路面升级项目路线信息
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	路线编码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" id="lxbm" style="width: 120px;"/><span style="color: red;">  *</span>
                </td>
				<td style="background-color:#F1F8FF;padding-right:5px;color:#007DB3;font-weight:bold;font-size:small;text-align:right;border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;">
                	路线名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" id="lxmc" style="width: 120px;"/><span style="color: red;">  *</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	原技术等级
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                	<select id="yjsdj" style="width: 100px;"></select><span style="color: red;">  *</span>
                </td>
			</tr>
			<tr style="height: 30px;">
            	<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                	起点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" onblur="jisuanlc(this)" id="qdzh" style="width: 120px;"/><span style="color: red;">  *</span>
                	<div id="qdts" style="color:red;font-size:xx-small; ;display: none;">起点桩号要>=<span id="spqdzh">0</span></div>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	止点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" onblur="jisuanlc(this)" id="zdzh" style="width: 120px;"/><span style="color: red;">  *</span>
                	<div id="zdts" style="color:red;font-size:xx-small; ;display: none;">止点桩号桩号要<=<span id="spzdzh">0</span></div>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	起止里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                	<input type="text" id="qzlc" style="width: 80px;"/>（公里）<span style="color: red;">*</span>
            	</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                	起点名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" id="qdmc" style="width: 120px;"/>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	止点名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" id="zdmc" style="width: 120px;"/>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目里程
				</td>
				<td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="xmlc" style="width: 80px;"/>（公里）<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	利用老路情况
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" id="lyllqk" style="width: 120px;"/>
                </td>
            	<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                	独立桥梁编码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" id="dlqlbm" style="width: 120px;"/>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	独立桥梁中心桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                	<input type="text" id="dlqlzxzh" style="width: 120px;"/>
                </td>
            </tr>
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管养单位</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id="gydwxx" class="easyui-combobox" style="width: 150px;"></select>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					行政区划</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<select id="xzqhmc" class="easyui-combobox" style="width: 150px;"></select>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					行政区划代码</td>
				<td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="xzqhdm"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					收费性质
				</td>
				<td style="border:1px solid #C0C0C0;width: 18%;text-align:left;padding-left: 10px;">
					<select id="sfxz">
						<option value="收费">收费</option>
						<option value="不收费" selected="selected">不收费</option>
					</select>
				</td>
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					特殊地区
				</td>
				<td colspan="3" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="tsdq"></span>&nbsp;
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-top: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					病害内容
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="bhnr" style="width:600px;height:30px;"></textarea>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					路面改造路面升级项目计划审核信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					方案评估单位</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="fapgdw" style="width: 120px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					方案审查单位
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="fascdw" style="width: 120px;"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					方案审批时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input type="text" id="faspsj" class="easyui-datebox" style="width: 100px;"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					审批文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="spwh" style="width: 120px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					投资估算
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="tzgs" style="width: 80px;"/>&nbsp;万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设性质
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="jsxz" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height:70px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					建设内容
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="jsnr" style="width: 700px;height: 50px;"></textarea>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					工程改造路面升级项目计划信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					上报年份
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<select id="editjhnf" style="width: 60px;"></select> &nbsp;
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					计划开工时间
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhkgsj" type="text" style="width: 100px;" class="easyui-datebox"></input><span style="color: red;">  *</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划完工时间
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhwgsj" type="text" style="width: 100px;" class="easyui-datebox"></input><span style="color: red;">  *</span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<!-- <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划下达时间
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xdsj" type="text" style="width: 100px;" class="easyui-datebox"></input>
				</td> -->
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					工程唯一编码
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="xmwybh" style="width: 120px;"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					项目名称
				</td>
				<td style="border-left: 1px solid #C0C0C0;border-right: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="xmmc" style="width: 120px;"/><span style="color: red;">  *</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设技术标准
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input type="text" id="jsjsbz" style="width:120px;"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					设计单位
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="sjdw" style="width:120px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					设计批复单位
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="sjpfdw" style="width:120px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					桥梁
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="ql" style="width: 40px;"/>&nbsp;座 <input onblur="check(this)" type="text" id="ql_m" style="width:40px;"/>&nbsp;延米
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					隧道
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="sd" style="width:40px;"/>&nbsp;座<input onblur="check(this)" type="text" id="sd_m" style="width:40px;"/></span>&nbsp;延米
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					涵洞
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="hd" style="width:40px;"/>&nbsp;米
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路基土石方
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="ljtsf" style="width: 80px;"/>&nbsp;㎡
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					垫层
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="dc" style="width: 80px;"/>&nbsp;公里
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					基层
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="jc" style="width: 80px;"/>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					沥青路面
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="lqlm" style="width: 80px;"/>&nbsp;公里
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					水泥路面
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="snlm" type="text" style="width: 80px;"/>&nbsp;公里
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					改建后技术等级
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="gjhjsdj" type="text" style="width: 80px;"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					是否提前实施
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="sftqss0" name="sftqss" type="radio" value="是"/>是
					<input id="sftqss1" name="sftqss" type="radio" value="否" checked="checked"/>否
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					批复文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="pfwh" style="width: 120px;"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					批复时间
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="pfsj" type="text" class="easyui-datebox" style="width: 100px;"></input>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					批复总投资
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" type="text" id="pftz" style="width: 80px;"/>&nbsp;万元<span style="color: red;">  *</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划使用部补助金额
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="jhsybbzje" type="text" style="width: 80px;"/>&nbsp;万元<span style="color: red;">  *</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">&nbsp;
					计划使用省补助金额
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input onblur="check(this)" id="jhsysbzje" type="text" style="width: 80px;"/>&nbsp;万元<span style="color: red;">  *</span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<!-- <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划下达文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhxdwh" type="text" style="width: 120px;"/>
				</td> -->
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					是否申请按比例补助
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="radio" id="sfsqablbz0" onchange="sfsqablbz('是')" name="sfsqablbz" value="是"/>是
					<input type="radio" id="sfsqablbz1" onchange="sfsqablbz('否')" checked="checked" name="sfsqablbz" value="否"/>否
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					按比例补助申请文号
				</td>
				<td style="border-left: 1px solid #C0C0C0;border-right: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input type="text" id="ablbzsqwh" style="width: 120px;"/>
				</td>
				<td style="border-style: none none solid none;border-right: 1px none #C0C0C0;border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"></td>
				<td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;"></td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					工可批复文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="gksjwh" style="width: 120px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					设计批复文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="text" id="sjpfwh" style="width: 120px;">
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">&nbsp;</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">&nbsp;</td>
			</tr>
			<tr style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					备&nbsp;&nbsp;&nbsp;注
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="remarks" style="width: 700px;height: 40px;"></textarea>
				</td>
			</tr>
			<tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="insert()" alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif'" />
                </td>
            </tr>
		</table>
	</div>
</body>
</html>
