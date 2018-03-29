<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新改建完成明细表</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<style type="text/css">
		<!--
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:hover {text-decoration: none;}
		a:active {text-decoration: none;}
		#bbtable {border-collapse:collapse;}
		#bbtable thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid #cde0f3;padding:3px 7px 2px 7px;}
		#bbtable tbody tr td {text-align:center;font-size:1em;border:1px solid #cde0f3;padding:3px 7px 2px 7px;}
		-->
	</style>
	<script type="text/javascript">
	$(function(){
		if($.cookie('dist2')!='36'){$("#ghbb").hide()}
		setjhxdnf1("jhnd");
		loadUnit1("gydw",$.cookie("unit"));
		loadDist1("xzqh",$.cookie("dist"));
		loadBmbm3('yjsdj','技术等级');
		loadBmbm3('jsjsdj','技术等级');
		xzdjdx('xzdj');
		xmjzzt1("jzzt");
		xgjxmlx('gljslx');
		setbnjhtz('bnzjdw');
		setbnjhtz('bnwctz');
		setbndsslc('bndsslc');
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth() < 10 ? "0"+(myDate.getMonth()+1) : myDate.getMonth()+1; 
		var d= myDate.getDate() < 10 ? "0"+myDate.getDate() : myDate.getDate();
		var timestr = y+"-"+m+"-"+d;
		$("#ybsj").datebox('setValue',timestr);
		//$("#biaotou").empty();
	});
	function setjhxdnf1(id){
		
		var years=[];
		//var first;
		years.push({text:'全部',value:''});
		var myvalues=new Array();
		
		for(var i=2011;i<=2020;i++){
			years.push({text:(i),value:(i)});
			myvalues.push(i);
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text',
		    multiple:true,
		    formatter:function(row){
				var opts = $(this).combobox('options');
				return '<input id="name'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
			},
			onSelect:function(record){
				var opts = $(this).combobox('options');
				if(record[opts.valueField]==""){
					var values =new Array();
					var datas = $('#' +id).combobox("getData");
					$.each(datas,function(index,item){
						values.push(item.value);
						$('#name'+id+item.value).attr('checked', true);
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$('#name'+id+record.value).attr('checked', true);
				}
			},
			onUnselect:function(record){
				var opts = $(this).combobox('options');
				var datas = $('#' +id).combobox("getData");
				var values = $('#' +id).combobox("getValues");
				$('#' +id).combobox("clear");
				if(record[opts.valueField]!=""){
					if(jQuery.inArray("",values)>=0){
						values.splice(jQuery.inArray("",values),1);
					}
					$.each(datas,function(index,item){
						if(jQuery.inArray(""+item.value,values)<0){
							$('#name'+id+item.value).attr('checked', false);
						}
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$.each(datas,function(index,item){
						$('#name'+id+item.value).attr('checked', false);
					});
				}
			}
		}); 
		for(var i=0;i<myvalues.length;i++){
			$('#name'+id+myvalues[i]).attr('checked', true);
		}
		$('#'+id).combobox("setValues",myvalues);
		
	}
	
	
	function setbnjhtz(id){
		var years=[];
		years.push({text:'全部',value:''});
		years.push({text:'0',value:'0'});
		years.push({text:'非0',value:'非0'});
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text',
		    multiple:true,
		    formatter:function(row){
				var opts = $(this).combobox('options');
				return '<input id="id'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
			},
			onSelect:function(record){
				var opts = $(this).combobox('options');
				if(record[opts.valueField]==""){
					var values =new Array();
					var datas = $('#' +id).combobox("getData");
					$.each(datas,function(index,item){
						values.push(item.value);
						$('#id'+id+item.value).attr('checked', true);
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$('#id'+id+record.value).attr('checked', true);
				}
			},
			onUnselect:function(record){
				var opts = $(this).combobox('options');
				var datas = $('#' +id).combobox("getData");
				var values = $('#' +id).combobox("getValues");
				$('#' +id).combobox("clear");
				if(record[opts.valueField]!=""){
					if(jQuery.inArray("",values)>=0){
						values.splice(jQuery.inArray("",values),1);
					}
					$.each(datas,function(index,item){
						if(jQuery.inArray(""+item.value,values)<0){
							$('#id'+id+item.value).attr('checked', false);
						}
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$.each(datas,function(index,item){
						$('#id'+id+item.value).attr('checked', false);
					});
				}
			}
		});
		
	}
	
	function setbndsslc(id){
		var years=[];
		years.push({text:'全部',value:''});
		years.push({text:'0',value:'0'});
		years.push({text:'非0',value:'非0'});
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text',
		    multiple:true,
		    formatter:function(row){
				var opts = $(this).combobox('options');
				return '<input id="name'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
			},
			onSelect:function(record){
				var opts = $(this).combobox('options');
				if(record[opts.valueField]==""){
					var values =new Array();
					var datas = $('#' +id).combobox("getData");
					$.each(datas,function(index,item){
						values.push(item.value);
						$('#name'+item.value).attr('checked', true);
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$('#name'+record.value).attr('checked', true);
				}
			},
			onUnselect:function(record){
				var opts = $(this).combobox('options');
				var datas = $('#' +id).combobox("getData");
				var values = $('#' +id).combobox("getValues");
				$('#' +id).combobox("clear");
				if(record[opts.valueField]!=""){
					if(jQuery.inArray("",values)>=0){
						values.splice(jQuery.inArray("",values),1);
					}
					$.each(datas,function(index,item){
						if(jQuery.inArray(""+item.value,values)<0){
							$('#name'+item.value).attr('checked', false);
						}
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$.each(datas,function(index,item){
						$('#name'+item.value).attr('checked', false);
					});
				}
			}
		});
		
	}
	
	var str1="";var str2="";var datalist;
	
	function dcExcel(){
		
		if(str1==""||str2==""){
			alert("请您先查询报表数据");
			return;
		}
		
		var json_data = JSON.stringify(datalist); 
		
		var nf=$("#ybsj").datebox("getValue").substr(0,4);
		var yf=$("#ybsj").datebox("getValue").substr(5,2);
		
		var gydw=$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("unit2")=='_____36')
				gydwstr=36;
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
	var xzqhdm=$("#xzqh").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var xzdj=$("#xzdj").combobox("getValues").join(',');
		var lxbm=$("#lxbm").val();var xmbm=$("#xmbm").val();
		var data="flag=1&nf="+nf+"&yf="+yf+"&xzdj="+xzdj+"&gcglabgc.lxbm="+lxbm+"&xmmc="+$("#xmmc").val()+"&gcglabgc.xmbm="+xmbm
		+"&gcglabgc.yjsdj="+$("#yjsdj").combobox('getValues').join(',')
		+"&gcglabgc.jsjsdj="+$("#jsjsdj").combobox('getValues').join(',')
		+"&gcglabgc.gljslx="+$("#gljslx").combobox('getValues').join(',')
		+"&gcglabgc.jhnd="+$("#jhnd").combobox('getValues').join(',')
		+"&gcglabgc.jzzt="+$("#jzzt").combobox('getValues').join(',')
		+"&gcglabgc.bnjhtz="+$("#bnjhtz").val()
		+"&gcglabgc.bndsslc="+$("#bndsslc").val();
		loadjzt();
		 $.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr,nameValue:str1,colValue:str2,sql:json_data},function(){
			window.location.href='/jxzhpt/gcybb/getXgjwcmxb.do?'+data;
		 }); 
		 setTimeout('disLoadjzt()',4000);
	}
	function wcmxb(){
		YMLib.Var.flag='';
		YMLib.UI.createWindow('zdybb','普通干线公路新改建工程项目完成情况明细表字段选择','xgjwcmxb_zd.jsp','zdybb','950','380');
	}
	
	function showBb(ss){
		var nf=$("#ybsj").datebox("getValue").substr(0,4);
		var yf=$("#ybsj").datebox("getValue").substr(5,2);
		var gydw=$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("unit2")=='_____36')
				gydwstr=36;
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
	var xzqhdm=$("#xzqh").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var xzdj=$("#xzdj").combobox("getValues").join(',');
		var lxbm=$("#lxbm").val();var xmbm=$("#xmbm").val();
		var data="flag=0&nf="+nf+"&yf="+yf+"&gydw="+gydwstr+"&xzqh="+xzqhstr+"&xzdj="+xzdj+"&gcglabgc.lxbm="+lxbm+"&xmmc="+$("#xmmc").val()+"&gcglabgc.xmbm="+xmbm+"&gcglabgc.ybsj="+$("#ybsj").datebox('getValue')
		+"&gcglabgc.yjsdj="+$("#yjsdj").combobox('getValues').join(',')
		+"&gcglabgc.jsjsdj="+$("#jsjsdj").combobox('getValues').join(',')
		+"&gcglabgc.gljslx="+$("#gljslx").combobox('getValues').join(',')
		+"&gcglabgc.jhnd="+$("#jhnd").combobox('getValues').join(',')
		+"&gcglabgc.jzzt="+$("#jzzt").combobox('getValues').join(',')
		+"&gcglabgc.bnjhtz="
		+"&gcglabgc.bnzjdw="+$("#bnzjdw").combobox('getValues').join(',')
		+"&gcglabgc.bnwctz="+$("#bnwctz").combobox('getValues').join(',')
		+"&gcglabgc.bndsslc="+$("#bndsslc").combobox('getValues').join(',');
		//alert(data);
		var tbody = $("#abgclist");
				tbody.empty();

		loadjzt();
		//alert(ss.join(","));
		$.ajax({
			url:"/jxzhpt/gcybb/getXgjwcmxb.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalist=msg;
				disLoadjzt();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						var tr="<tr>";
						for ( var j = 0; j < ss.length; j++) {
							if(msg[i].v_0=='是'){
								if(ss[j]=='v_0'){
									tr+="<td>"+''+"</td>";
								}else{
									tr+="<td>"+msg[i][ss[j]]+"</td>";
								}
							}else{
								tr+="<td>"+msg[i][ss[j]]+"</td>";
							}
							
						}
						tr+="</tr>";
						tbody.append(tr);
					}
				}
			}
		});
	}
	
	function ghbb(){
		if(datalist==null){
			alert("当前尚无查询结果，不能固化版本");
			return;
		}
		YMLib.Var.formname='xgjwcmxb';
		YMLib.UI.createWindow('lxxx','将查询结果固化为版本','ghbbxz.jsp','lxxx',400,400);
	}
	function ghbbcx(){
		
		YMLib.Var.formname='xgjwcmxb';
		YMLib.UI.createWindow('lxxx','固化版本查询','ghbbcx.jsp','lxxx',400,400);
	}
	
	
	</script>
	
		<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
 cursor: pointer;
}
a:active {
 text-decoration: none;
}
-->
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>

	
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
					<div id="righttop">
						<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;生成报表>&nbsp;月报表>&nbsp;普通干线公路新改建工程项目完成情况明细表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.9%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
        						<td align="right">管养单位：</td>
        						<td><select id="gydw" style="width:150px;"></select></td>
        					</select></td>
		 						
		        				<td align="right">项目名称：</td>
		        				<td><input id="xmmc" type="text"  style="width: 100px"></td>
		        				<td align="right">项目编码：</td>
		        				<td><input id="xmbm" type="text"  style="width: 100px"></td>
		        				<td align="right">路线编码：</td>
        						<td><input id="lxbm" type="text"  style="width: 100px"></td>
		        				<td align="right">原技术等级：</td>
		        				<td><input id="yjsdj" type="text"  style="width: 103px"></td>
		        				</tr>
        							<tr height="32">
        						<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:150px;"></select></td>
        						<td align="right">原行政等级：</td>
        						<td><select id="xzdj" class="easyui-combobox" style="width:103px;">
        						</select></td>
        						
								<td align="right">建设技术标准：</td>
        						<td><input id="jsjsdj" type="text"  style="width: 103px"></td>
        						
        						<td align="right">公路建设类型：</td>
        						<td><input id="gljslx" type="text"  style="width: 103px"></td>
        						<td align="right">月报时间：</td>
        						<td><input id="ybsj" type="text"  style="width: 103px" class='easyui-datebox'  ></td>
							</tr>
									<tr height="32">
        						
        						<td align="right">首次下达计划年度：</td>
		        				<td><input id="jhnd" type="text"  style="width: 150px"></td>
        						<td align="right">项目进展状态：</td>
        						<td><input id="jzzt" type="text"  style="width: 103px"></td>
        					<!-- 	<span>本年计划投资：</span>
        						<input id="bnjhtz" type="text"  style="width: 60px">
        						<span>本年度实施里程：</span>
        						<input id="bndsslc" type="text"  style="width: 60px">
        						</select> -->
        						
        						<td align="right">本年度实施里程：</td>
        						<td><select name="bndsslc" id="bndsslc" class="easyui-combobox" style="width:103px;">
									<!-- <option value="" selected="selected">全部</option>
									<option value="0">0</option>
									<option value="非0">非0</option> -->
								</select></td>
								
								<td align="right">本年资金到位：</td>
        						<td><select name="bnzjdw" id="bnzjdw" class="easyui-combobox" style="width:103px;">
								</select></td>
								<td align="right">本年完成投资：</td>
        						<td><select name="bnwctz" id="bnwctz" class="easyui-combobox" style="width:103px;">
								</select></td>
								
							</tr>
        							<tr height="32">
        							<td colspan="10">
        						<img onclick="wcmxb()" alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;"/>
								<img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="dcExcel()" style="vertical-align: -50%;" />
        						<img id='ghbb' alt="固化版本" src="${pageContext.request.contextPath}/images/Button/ghbb1.png" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/ghbb2.png'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/ghbb1.png' " onclick="ghbb()" style="vertical-align: -50%;" />
        						<img alt="固化版本查询" src="${pageContext.request.contextPath}/images/Button/ghbbcx1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/ghbbcx2.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/ghbbcx1.gif' " onclick="ghbbcx()" style="vertical-align: -50%;" />
        						
        						
        						<!-- <input type="button" value="固化版本" onclick="ghbb()"></input>
        						<input type="button" value="固化版本查询" onclick="ghbbcx()"></input> -->
        				
        				</td>	</tr>
        				
        				
        				</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height: 380px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-200)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="8000px">
								<caption align="top" style="font-size:x-large;font-weight: bolder;"> 普通干线公路新改建工程项目完成情况明细表</caption>
								<tbody id='biaotou'>
									<tr>
										<td colspan="36">一、 项 目 计 划</td>
										<td colspan="20">二、 本年元月至本月完成情况</td>
										<td colspan="3">三、本月进展情况</td>
										<td colspan="23">四、 自开工至本月底累计完成情况</td>
										<td rowspan="4">备注</td>
									</tr>
									<tr>
										<td rowspan="3"  style="width: 125px;">序号</td>
										<td rowspan="3"  style="width: 125px;">计划唯一编码</td>
										<td rowspan="3"  style="width: 125px;">项目所在地市</td>
										<td rowspan="3"  style="width: 125px;">项目所在县市</td>
										<td rowspan="3"  style="width: 125px;">特殊地区</td>
										<td rowspan="3"  style="width: 125px;">路线编码</td>
										<td rowspan="3" style="width: 125px;">项目名称</td>
										<td rowspan="3" style="width: 125px;">首次下达计划年度</td>
										<td rowspan="3" style="width: 125px;">原行政等级</td>
										<td rowspan="3" style="width: 125px;">起点桩号</td>
										<td rowspan="3" style="width: 125px;">讫点桩号</td>
										<td rowspan="3" style="width: 125px;">原技术等级</td>
										<td rowspan="3" style="width: 125px;">建设技术标准</td>
										<td rowspan="3" style="width: 125px;">公路建设类型</td>
										<td rowspan="3" style="width: 125px;">项目里程<br>(公里)</td>
										<td rowspan="3" style="width: 125px;">施工图设计里程<br>(公里)</td>
										<td rowspan="3" style="width: 125px;">施工图起点桩号</td>
										<td rowspan="3" style="width: 125px;">施工图止点桩号</td>
										<td rowspan="3" style="width: 125px;">总投资<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">车购税<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">国债<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">省债<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">债券<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">厅贷款<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">奖励<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">其他<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">地方自筹<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">银行贷款<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">本年度计划投资<br>(万元)</td>
										<td rowspan="2" style="width: 125px;"></td>
										<td rowspan="3" style="width: 125px;">本年度实施里程<br>(公里)</td>
										<td rowspan="3" style="width: 125px;">项目在建个数<br>(个)</td>										
										<td rowspan="3" style="width: 125px;">项目完工个数<br>(个)</td>
										<td rowspan="3" style="width: 125px;">项目未开工个数<br>(个)</td>
										<td rowspan="3" style="width: 125px;">开工时间(精确到月)</td>
										<td rowspan="3" style="width: 125px;">完工时间(精确到月)</td>
										<td colspan="10">累计资金到位<br>(万 元)</td>
										<td rowspan="3" style="width: 125px;">项目完成投资<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">占投资比例<br>(%)</td>
										<td colspan="8">完   成  工  程  量<br>(公里)</td>
										<td rowspan="3">新增资金到位<br>(万 元)</td>
										<td rowspan="3">新增完成路面工程量<br>(公里)</td>
										<td rowspan="3">新增项目完成投资<br>(万 元)</td>
										<td colspan="10">累计资金到位<br>(万 元)</td>
										<td rowspan="3">项目完成投资<br>(万 元)</td>
										<td colspan="8">累  计  完   成  工  程  量<br>(公里)</td>
										<td rowspan="3" style="width: 125px;">项目未完工程量<br>(公里)</td>
										<td rowspan="3" style="width: 125px;">完成工程量比例(%)</td>
										<td rowspan="3" style="width: 125px;">车购税到位比例(%)</td>
										<td rowspan="3" style="width: 125px;">完成投资比例(%)</td>
									</tr>	
									<tr>
										<td rowspan="2" style="width: 125px;">总投资</td>
										<td rowspan="2" style="width: 125px;">车购税</td>
										<td rowspan="2" style="width: 125px;">国债</td>
										<td rowspan="2" style="width: 125px;">省债</td>
										<td rowspan="2" style="width: 125px;">债券</td>
										<td rowspan="2" style="width: 125px;">厅贷款</td>
										<td rowspan="2" style="width: 125px;">奖励</td>
										<td rowspan="2" style="width: 125px;">其他</td>
										<td rowspan="2" style="width: 125px;">地方自筹</td>
										<td rowspan="2" style="width: 125px;">银行贷款</td>
										<td colspan="5">按技术等级</td>
										<td colspan="2">按路面类型</td>
										<td rowspan="2" style="width: 125px;">完成垫层里程</td>
										<td rowspan="2" style="width: 125px;">总投资</td>
										<td rowspan="2" style="width: 125px;">车购税</td>
										<td rowspan="2" style="width: 125px;">国债</td>
										<td rowspan="2" style="width: 125px;">省债</td>
										<td rowspan="2" style="width: 125px;">债券</td>
										<td rowspan="2" style="width: 125px;">厅贷款</td>
										<td rowspan="2" style="width: 125px;">奖励</td>
										<td rowspan="2" style="width: 125px;">其他</td>
										<td rowspan="2" style="width: 125px;">地方自筹</td>
										<td rowspan="2" style="width: 125px;">银行贷款</td>
										<td colspan="5">按技术等级</td>
										<td colspan="2">按路面类型</td>
										<td rowspan="2" style="width: 125px;">完成垫层里程</td>
									</tr>
									<tr>
										<td style="width: 100px;">其中：中央车购税</td>
										
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">一级</td>
										<td style="width: 100px;">二级</td>
										<td style="width: 100px;">三级</td>
										<td style="width: 100px;">四级</td>
										<td style="width: 100px;">沥青路</td>
										<td style="width: 100px;">水泥砼</td>
										
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">一级</td>
										<td style="width: 100px;">二级</td>
										<td style="width: 100px;">三级</td>
										<td style="width: 100px;">四级</td>
										<td style="width: 100px;">沥青路</td>
										<td style="width: 100px;">水泥砼</td>
									</tr>
								</tbody>
								<tbody id="abgclist"></tbody>
							</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
