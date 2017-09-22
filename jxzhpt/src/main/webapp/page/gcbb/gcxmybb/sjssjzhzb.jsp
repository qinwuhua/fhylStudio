<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>三件实事</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			setjhxdnf('xmnf');
			loadUnit1('gydw',$.cookie('unit'));
			setYf('yf');
			if($.cookie('unit')==36){
				$("#tj").hide();
			}else{
				$("#tj").show();
			}
			
			showAll();
		});
		

		//月份
		function setYf(id){
			var years=[];
			years.push({text:'全部',value:''});
			for(var i=1;i<=12;i++){
				years.push({text:(i),value:(i)});
			}
			$('#'+id).combobox({
			    data:years,
			    valueField:'value',
			    textField:'text',
			    multiple:true,
			    formatter:function(row){
					var opts = $(this).combobox('options');
					return '<input id="'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.value);
							$('#'+id+item.value).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#'+id+record.value).attr('checked', true);
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
								$('#'+id+item.value).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#'+id+item.value).attr('checked', false);
						});
					}
				}
			});
			//$('#'+id).combobox("setText",'全部');
			//$('#'+id+'全部').attr('checked', true);
			
		}

		
		
		
		function setjhxdnf(id){
			
				var myDate = new Date();
				var years=[];
				var first;
				for(var i=0;i<=10;i++){
					
					years.push({text:(myDate.getFullYear()-i),value:(myDate.getFullYear()-i)});
				}
				$('#'+id).combobox({
				    data:years,
				    valueField:'value',
				    textField:'text'
				});
					first=myDate.getFullYear();
				$('#'+id).combobox("setValue",+first);
		
		}
		var datalist;
		function showAll(){
			$("#nian").text($("#xmnf").combobox('getValue'));
			var xmnf=$("#xmnf").combobox('getValue');
			var data="";var gydwstr="";
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
			var yf=$("#yf").combobox("getValues").join(",");
			if(yf.substr(0,1)==',')
				yf=yf.substr(1,yf.length);
			
			data="flag=1&excel_list.nf="+xmnf+"&excel_list.gydw="+gydwstr+"&excel_list.yf="+yf;
			var tbody = $("#wqgzlist");
			tbody.empty();
			$.ajax({
				url:"/jxzhpt/gcybb/getsjssjzhzb.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					datalist=msg;
					if (msg != null) {
						for ( var i = 0; i < 24; i++) {
							//alert(msg[i].v_4);
							if(i==0){
								tbody.append("<tr><td rowspan='4' colspan='2'>"+msg[i].v_0+"</td><td rowspan='2'>"
										+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==1){
								tbody.append("<tr><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==2){
								tbody.append("<tr><td rowspan='2'>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==3){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==4){
								tbody.append("<tr><td rowspan='14' style='width: 40px;'>"+msg[i].v_0+"</td><td rowspan='10' style='width: 100px;'>"+msg[i].v_1
										+"</td><td rowspan='2' style='width: 90px;'>"+msg[i].v_2+"</td><td style='width: 50px;'>"+msg[i].v_3+"</td><td style='width: 20px;'>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==5){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==6){
									tbody.append("<tr><td rowspan='2'>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
											+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
											+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
											+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
											+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
											+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
									);
							}else if(i==7){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==8){
								tbody.append("<tr><td rowspan='3'>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==9){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==10){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==11){
								tbody.append("<tr><td rowspan='3'>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==12){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==13){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==14){
								tbody.append("<tr><td rowspan='4'>"+msg[i].v_1
										+"</td><td rowspan='2'>"+msg[i].v_2+"</td><td>"
										+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==15){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==16){
								tbody.append("<tr><td rowspan='2'>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==17){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==18){
								tbody.append("<tr><td rowspan='6'>"+msg[i].v_0
										+"</td><td rowspan='3'>"+msg[i].v_1
										+"</td><td rowspan='2'>"+msg[i].v_2
										+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==19){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==20){
								tbody.append("<tr><td colspan='2'>"+msg[i].v_2+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==21){
								tbody.append("<tr><td rowspan='3'>"+msg[i].v_1+"</td><td rowspan='2'>"
										+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==22){
								tbody.append("<tr><td >"+msg[i].v_3+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}else if(i==23){
								tbody.append("<tr><td colspan='2'>"+msg[i].v_2+"</td><td>"
										+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"
										+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"
										+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"
										+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"
										+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td></tr>"
								);
							}
							
							
						}
					}
				}
			});
		}
	function exportWqgzyb(){
		var xmnf = $("#xmnf").combobox('getValue');
		var data="";
		if($.cookie("unit")=='36')
			data="flag=flag&excel_list.nf="+xmnf+"&excel_list.gydw="+$.cookie("unit");
		else
			data="flag=flag&excel_list.nf="+xmnf+"&excel_list.gydw="+$.cookie("unit2");
		var json_data = JSON.stringify(datalist); 
		$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:'',sql:json_data},function(){
			window.location.href='/jxzhpt/gcybb/getsjssjzhzb.do?'+data;
		 });
	}	
	
	
	function addInfo(){
		YMLib.UI.createWindow('lxxx','添加','sjss_tj.jsp','lxxx',900,450);
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
}
a:active {
 text-decoration: none;
}
#bbtable {
	border-collapse:collapse;
}
#bbtable thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
#bbtable tbody tr td {
	text-align:center; 	
	font-size:1em;
/* 	font-weight:bold; */
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
-->
</style>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;" >
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;height:100%;" cellspacing="0" cellpadding="0" >
			<tr>
			<div id="righttop"  style="height: 30px">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;(报部)危桥改造等三件实事进展情况汇总表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%;height:40px; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        					<span>管养单位：</span>
        						<select  id="gydw" style="width: 180px;"></select>
        					<span>汇总年度：</span>
        						<select  id="xmnf" style="width: 80px;"></select>
        					<span>汇总月份：</span>
        						<select  id="yf" style="width: 80px;"></select>
        						
        						
							<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="showAll()" />
        					<img id='tj' alt="添加" src="${pageContext.request.contextPath}/images/Button/tianjia1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/tianjia2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/tianjia1.gif' "  style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="addInfo()" />
        					
        					
        					<img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align:middle;" />
        					</p>         
        							 					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-100)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="1180px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;"><span id='nian' style="font-size:x-large;font-weight: bolder;"></span>年危桥改造等三件实事进展情况汇总表 </caption>
								<thead>
									<tr>
										<td rowspan="3" colspan="5" style="width: 400px;">项目</td>
										<td colspan="4" style="width: 270px;">公路安全生命防护工程（安保工程）</td>
										<td colspan="4" style="width: 270px;">危桥改造</td>
										<td rowspan="2" style="width: 90px;">灾害防治工程</td>
									</tr>	
									<tr>
										<td style="width: 90px;">总计</td>
										<td style="width: 90px;">国省干线</td>
										<td style="width: 90px;">县、乡公路</td>
										<td style="width: 90px;">村道公路</td>
										<td style="width: 90px;">总计</td>
										<td style="width: 90px;">国省干线</td>
										<td style="width: 90px;">县、乡公路</td>
										<td style="width: 90px;">村道公路</td>
									</tr>
									<tr>
										<td style="width: 90px;">甲</td>
										<td style="width: 90px;">乙</td>
										<td style="width: 90px;">丙</td>
										<td style="width: 90px;">丙</td>
										<td style="width: 90px;">丁</td>
										<td style="width: 90px;">戊</td>
										<td style="width: 90px;">己</td>
										<td style="width: 90px;">己</td>
										<td style="width: 90px;">庚</td>
									</tr>
								</thead>
								<tbody id="wqgzlist">
								
								</tbody>
								
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