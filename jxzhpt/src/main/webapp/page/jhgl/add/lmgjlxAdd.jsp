<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
	$(function(){
		loadBmbm2('yjsdj','技术等级');
		gydwComboxTree("gydwxx");
		loadXzqh("xzqhmc",$.cookie("dist"));
		sbnf("editjhnf");
		autoCompleteLXBM();
	});
	function autoCompleteLXBM(){
		var url = "/jxzhpt/jhgl/gjAutoCompleteLxbm.do";
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
				$('#ylmlx').val(item.ylmlx);
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
		if(Number($('#qdzh').val())<Number($('#spqdzh').html())){
			alert("起点桩号要大于或等于"+$('#spqdzh').html());
			return;
		}
		if(Number($('#zdzh').val())>Number($('#spzdzh').html())){
			alert("止点桩号要小于或等于"+$('#spzdzh').html());
			return;
		}
		if(Number($('#qzlc').val())>($('#yhlc').val())){
			alert("核对里程不能大于起止里程！");
			return;
		}
		var myDate = new Date();
		var tbsj=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
		var obj={'lx.lxmc':$('#lxmc').val(),'lx.lxbm':$('#lxbm').val(),'lx.jsdd':$('#jsdd').val(),
				'lx.qdzh':$('#qdzh').val(),'lx.zdzh':$('#zdzh').val(),'lx.qzlc':$('#qzlc').val(),
				'lx.gydwdm':$('#gydwxx').combobox("getValue"),'lx.gydw':$('#gydwxx').combobox("getText"),
				'lx.xzqhmc':$('#xzqhmc').combobox("getText"),'lx.xzqhdm':$('#xzqhmc').combobox("getValue"),
				'lx.yjsdj':$('#yjsdj').combobox("getValue"),'lx.ylmlx':$('#ylmlx').val(),'lx.yhlc':$('#yhlc').val(),
				'lx.bhnr':$('#bhnr').val(),'lx.tbsj':tbsj,'lx.jhid':parent.YMLib.Var.ID,
				'jh.sbnf':parent.YMLib.Var.NF,'lx.tbbmbh':$.cookie("unit")};
		$.ajax({
			type:'post',
			url:'/jxzhpt/jhgl/insertGcgjLx.do',
			data:obj,
			dataType:'json',
			success:function(data){
				if(data.result=="true"){
					alert("添加成功！");
					parent.$('#grid').datagrid('reload');
					parent.$('#add_gjlx').window('destroy');
				}else if(data.result=="have"){
					alert("此路线以存在！");
				}else if(data.result=="none"){
					alert("计划库中没有此路线！");
				}
			},
			error:function(e){
				alert("添加失败！");
			}
		});
	}
	function jisuanlc(t){
		if(Number($('#qdzh').val())<Number($('#spqdzh').html())){
			alert("起点桩号要大于或等于"+$('#spqdzh').html());
			return;
		}
		if(Number($('#zdzh').val())>Number($('#spzdzh').html())){
			alert("起点桩号要小于或等于"+$('#spzdzh').html());
			return;
		}
		var lc = (Number($('#zdzh').val()).toFixed(3)-Number($('#qdzh').val()).toFixed(3)).toFixed(3);
		if(lc>=0){
			$('#qzlc').val(lc);
			$('#yhlc').val(lc);
		}else{
			alert("起止里程不能为负数！");
			$(t).focus();
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
					路面改造路面改建项目路线信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路线编码
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lxbm" style="width:120px;" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					路线名称
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lxmc" style="width: 120px;" type="text"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设地点
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jsdd" style="width: 120px;" type="text"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					起点桩号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="qdzh" onblur="jisuanlc(this)" style="width: 120px;" type="text"/>
					<div id="qdts" style="color:red;font-size:xx-small; ;display: none;">起点桩号要>=<span id="spqdzh">0</span></div>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					止点桩号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zdzh" onblur="jisuanlc(this)" style="width: 120px;" type="text"/>
					<div id="zdts" style="color:red;font-size:xx-small; ;display: none;">起点桩号要>=<span id="spzdzh">0</span></div>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					起止里程
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="qzlc" style="width: 90px;" type="text"/>公里
				</td>
			</tr>
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管养单位
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<select id="gydwxx" class="easyui-combobox" style="width: 120px;"></select>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					行政区划
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id="xzqhmc" class="easyui-combobox" style="width: 120px;"></select>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					行政区划代码
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="xzqhdm"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原技术等级
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id="yjsdj" style="width: 100px;"></select>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面类型
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ylmlx" style="width: 120px;" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					隐患里程
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="yhlc" style="width:90px;" type="text"/>公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					特殊地区
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					病害内容
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="bhnr" style="width: 700px;height: 30px;"></textarea>
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