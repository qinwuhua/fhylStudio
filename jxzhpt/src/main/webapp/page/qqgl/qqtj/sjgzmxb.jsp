<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<link href="/jxzhpt/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/css/buttons.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
	<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
	
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(/jxzhpt/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(/jxzhpt/images/righttopbg.gif) 0 0 repeat-x;}
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
		loadDist1("xzqh",$.cookie("dist"));
		var myDate = new Date();
/* 		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1; 
		for(var x=y;x>=2010;x--){
			$("#ddlYear").append("<option value="+x+">"+x+"</option>");
		}
		$("#yf"+m).attr("selected","selected"); */
		//$("#biaotou").empty();
		
/* 		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val(); */
		
        var strDate=myDate.getFullYear()+"-"+((myDate.getMonth() + 1) > 9 ? (myDate.getMonth() + 1) : "0" + (myDate.getMonth() + 1))+"-"+myDate.getDate();          
        $("#enddate").datebox("setValue",strDate);
		var nf=myDate.getFullYear();
		var yf=(myDate.getMonth() + 1) > 9 ? (myDate.getMonth() + 1) : "0" + (myDate.getMonth() + 1);
		$(".nian").html(nf);
		$(".yue").html(yf);
		$(".nianyue1").html(nf+"年"+yf);
		$(".nianyue2").html(nf+".12");
		
		showBb();
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
	
	function dcExcel(){
		//var startdate = $("#startdate").datebox("getValue");
		var enddate = $("#enddate").datebox("getValue");
 		var nf=enddate.substring(0, 4);
		var yf=enddate.substring(5, 7);
		var xmbm= $("#xmbm").val();
		/* var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val(); */
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
		
 		var data="flag=1&nf="+nf+"&yf="+yf+"&xzqh="+xzqhstr
		+"&gcglabgc.jhnd="+$("#jhnd").combobox('getValues').join(',')
		+"&type="+$("#jsxz").val()+"&gcglabgc.endDate="+enddate+"&gcglabgc.xmbm="+xmbm;
		//var data="flag=1&nf="+nf+"&yf="+yf+"&xzqh="+xzqhstr;
		loadjzt();
		 $.post('/jxzhpt/gcbb/exportbbsj_set.do',{xzqh:xzqhstr},function(){
			window.location.href='/jxzhpt/gcybb/getGzxmb.do?'+data;
		 }); 
		 setTimeout('disLoadjzt()',4000);
	}

	function showBb(){
		var params = [];
		var enddate = $("#enddate").datebox("getValue");
 		var nf=enddate.substring(0, 4);
		var yf=enddate.substring(5, 7);
		var xmbm= $("#xmbm").val();
		
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
		
		$(".nian").html(nf);
		$(".yue").html(yf);
		$(".nianyue1").html(nf+"年"+yf);
		$(".nianyue2").html(nf+".12");
		
 		var data="flag=0&nf="+nf+"&yf="+yf+"&xzqh="+xzqhstr
		+"&gcglabgc.jhnd="+$("#jhnd").combobox('getValues').join(',')
		+"&type="+$("#jsxz").val()+"&gcglabgc.endDate="+enddate+"&gcglabgc.xmbm="+xmbm+"&excel_list.xzqhdm="+$.cookie('dist2'); 
		//var data="flag=0&nf="+nf+"&yf="+yf+"&xzqh="+xzqhstr;
		//alert(data);
		var tbody = $("#abgclist");
		tbody.empty();

		loadjzt();
		
		$.ajax({
			url:"/jxzhpt/gcybb/getGzxmb.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalist=msg;
				disLoadjzt();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						var tr="<tr>";
						tr=tr+ "<td>"+msg[i].v_0+"</td><td>"
						+msg[i].v_1+"</td><td>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"+msg[i].v_4+"</td><td>"
						+msg[i].v_5+"</td><td>"+msg[i].v_6+"</td><td>"+msg[i].v_7+"</td><td>"+msg[i].v_8+"</td><td>"
						+msg[i].v_9+"</td><td>"+msg[i].v_10+"</td><td>"+msg[i].v_11+"</td><td>"+msg[i].v_12+"</td><td>"
						+msg[i].v_13+"</td><td>"+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"+msg[i].v_16+"</td><td>"
						+msg[i].v_17+"</td><td>"+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"+msg[i].v_20+"</td><td>"
						+msg[i].v_21+"</td><td>"+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"+msg[i].v_24+"</td><td>"
						+msg[i].v_25+"</td><td>"+msg[i].v_26+"</td><td>"+msg[i].v_27+"</td><td>"+msg[i].v_28+"</td><td>"
						+msg[i].v_29+"</td><td>"+msg[i].v_30+"</td><td>"+msg[i].v_31+"</td><td>"+msg[i].v_32+"</td><td>"
						+msg[i].v_33+"</td><td>"+msg[i].v_34+"</td><td>"+msg[i].v_35+"</td><td>"+msg[i].v_36+"</td><td>"
						+msg[i].v_37+"</td><td>"+msg[i].v_38+"</td><td>"+msg[i].v_39+"</td><td>"+msg[i].v_40+"</td><td>"
						+msg[i].v_41+"</td><td>"+msg[i].v_42+"</td><td>"+msg[i].v_43+"</td><td>"+msg[i].v_44+"</td><td>"
						+msg[i].v_45+"</td><td>"+msg[i].v_46+"</td><td>"+msg[i].v_47+"</td><td>"+msg[i].v_48+"</td>"
						tr+="</tr>";
						tbody.append(tr);
						
				       /*  params.push({"v_0":msg[i].v_0,"v_1":msg[i].v_1,"v_2":msg[i].v_2,"v_3":msg[i].v_3,"v_4":msg[i].v_4,"v_5":msg[i].v_5,"v_6":msg[i].v_6,"v_7":msg[i].v_7,"v_8":msg[i].v_8,
				        	"v_9":msg[i].v_9,"v_10":msg[i].v_10,"v_11":msg[i].v_11,"v_12":msg[i].v_12,"v_13":msg[i].v_13,"v_14":msg[i].v_14,"v_15":msg[i].v_15,"v_16":msg[i].v_16,"v_17":msg[i].v_17,
				        	"v_18":msg[i].v_18,"v_19":msg[i].v_19,"v_20":msg[i].v_20,"v_21":msg[i].v_21,"v_22":msg[i].v_22,"v_23":msg[i].v_23,"v_24":msg[i].v_24,"v_25":msg[i].v_25,
				        	"v_25":msg[i].v_25,"v_26":msg[i].v_26,"v_27":msg[i].v_27,"v_28":msg[i].v_28,"v_29":msg[i].v_29,"v_30":msg[i].v_30,"v_31":msg[i].v_31,"v_32":msg[i].v_32,"v_33":msg[i].v_33,
				        	"v_34":msg[i].v_34,"v_35":msg[i].v_35,"v_37":msg[i].v_37,"v_38":msg[i].v_38,"v_39":msg[i].v_39,"v_40":msg[i].v_40,"v_41":msg[i].v_41,"v_42":msg[i].v_42,"v_43":msg[i].v_43,
				        	"v_44":msg[i].v_44,"v_45":msg[i].v_45,"v_46":msg[i].v_46,"v_47":msg[i].v_47,"v_48":msg[i].v_48}); */
					}	
/* 					var jsonData = JSON.stringify(params);
					$("#versionJson").val(jsonData); */
				}
			}
		});
	}
	
	function ghbb(){
		if($("#jsxz").val()=='sh'){
			YMLib.Var.formname='shxmb';
		}else{
			YMLib.Var.formname='lwgzxmb';
		}	
		YMLib.UI.createWindow('lxxx','将查询结果固化为版本','/jxzhpt/page/gcbb/ghbbxz.jsp','lxxx',460,360);
	}
	function ghbbcx(){
		if($("#jsxz").val()=='sh'){
			YMLib.Var.formname='shxmb';
		}else{
			YMLib.Var.formname='lwgzxmb';
		}
		YMLib.UI.createWindow('lxxx','固化版本查询','/jxzhpt/page/gcbb/ghbbcx.jsp','lxxx',460,360);
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
						<div id="p_top">当前位置>&nbsp;进度报表>&nbsp;生成报表>&nbsp;月报表>&nbsp;全省普通国省干线公路改造项目完成情况明细表</div>
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
        						<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:180px;"></select></td>
                                <td align="right">首次下达年份：</td>
		        				<td><input id="jhnd" type="text"  style="width: 100px"></td>
		        				<td align="right">月报时间：</td>
								<td><input id="enddate" class="easyui-datebox" name="enddate" data-options="editable:false"></td>
		        				<td align="right">项目类型：</td>
		 						<td><select name="jsxz" id="jsxz" style="width: 100px;">
									<option id="lmgz" value="lmgz">路面改造</option>
									<option id="sh" value="sh">灾毁恢复重建</option>
								</select>
								</td>
								<td align="right">项目编码：</td>
        						<td><input id='xmbm' type="text" style="width:100px" /></td>						
							</tr>
							
        					<tr height="32">
        							<td colspan="10">
        						<img onclick="showBb()" alt="查询" src="/jxzhpt/images/Button/Serch01.gif" onmouseover="this.src='/jxzhpt/images/Button/Serch02.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;"/>
								<img alt="导出Ecel" src="/jxzhpt/images/Button/dcecl1.gif" onmouseover="this.src='/jxzhpt/images/Button/dcecl2.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/dcecl1.gif' " onclick="dcExcel()" style="vertical-align: -50%;" />
                                <img id='ghbb' alt="固化版本" src="/jxzhpt/images/Button/ghbb1.png" onmouseover="this.src='/jxzhpt/images/Button/ghbb2.png'"
                                	onmouseout="this.src='/jxzhpt/images/Button/ghbb1.png' " onclick="ghbb()" style="vertical-align: -50%;" />
        						<img alt="固化版本查询" src="/jxzhpt/images/Button/ghbbcx1.gif" onmouseover="this.src='/jxzhpt/images/Button/ghbbcx2.gif'"
                                	onmouseout="this.src='/jxzhpt/images/Button/ghbbcx1.gif' " onclick="ghbbcx()" style="vertical-align: -50%;" />
  	
        				</td>	
        				</tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height: 380px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-140)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="3000px">
								<caption align="top" style="font-size:x-large;font-weight: bolder;">全省普通国省干线公路改造项目完成情况明细表</caption>
								<tbody id='biaotou'>
									<tr>
										<td colspan="24">一、项目计划</td>
										<td colspan="10">二、<span class='nian'></span>年元月至<span class='yue'></span>月完成情况</td>
										<td colspan="3"><span class='nianyue1'></span>月进展情况</td>
										<td colspan="11">三、自开工至<span class='nianyue1'></span>月底累计完成情况</td>
										<td rowspan="4" style="width: 100px;">备注</td>									
									</tr>
									<tr>
										<td rowspan="3" style="width: 60px;">序号</td>		
										<td rowspan="3" style="width: 500px;">设区市</td>
										<td rowspan="3" style="width: 380px;">县（市、区）</td>
										<td rowspan="3" style="width: 125px;">特殊地区</td>
										<td rowspan="3" style="width: 125px;">项目编码</td>
										<td rowspan="3" style="width: 125px;">项目名称</td>
										<td rowspan="3" style="width: 125px;">计划年度</td>
										<td rowspan="3" style="width: 125px;">行政等级</td>
										<td rowspan="3" style="width: 125px;">规划路线编码</td>
										<td rowspan="3" style="width: 125px;">规划起点桩号</td>
										<td rowspan="3" style="width: 125px;">规划止点桩号</td>
										<td rowspan="3" style="width: 125px;">现技术等级</td>
										<td rowspan="3" style="width: 125px;">建设技术等级</td>
										<td rowspan="3" style="width: 160px;">公里建设性质</td>			
										<td rowspan="3" style="width: 125px;">项目里程</td>
										<td rowspan="3" style="width: 125px;">总投资</td>
										<td rowspan="3" style="width: 125px;">中央车购税（万元）</td>
										<td rowspan="3" style="width: 125px;">地方自筹（万元）</td>
										<td rowspan="3" style="width: 125px;"><span class='nian'></span>年度计划投资（万元）</td>							
										<td rowspan="3" style="width: 125px;">其中中央车购税</td>
										<td rowspan="3" style="width: 125px;"><span class='nian'></span>年度实施里程（公里）</td>
										<td rowspan="3" style="width: 125px;">建设状态</td>
										<td rowspan="3" style="width: 125px;">开工时间</td>
										<td rowspan="3" style="width: 125px;">完工时间</td>	
										<td colspan="4">累计资金到位（万元）</td>
										<td rowspan="3" style="width: 125px;">项目完成投资（万元）</td>
										<td colspan="5">完成工程量（公里）</td>	
										
										<td rowspan="3" style="width: 125px;">新增资金到位（万元）</td>
										<td rowspan="3" style="width: 125px;">新增完成工作量（公里）</td>
										<td rowspan="3" style="width: 125px;">新增项目完成投资（万元）</td>
																
										<td colspan="4">累计资金到位（万元）</td>
										<td rowspan="3" style="width: 125px;">项目完成投资（万元）</td>
										<td colspan="5">累计完成工程量（公里）</td>			
										
										<td rowspan="3" style="width: 125px;">项目未完工程量（公里）</td>
									</tr>	
									<tr>
										<td rowspan="2" style="width: 125px;">合计</td>
										<td rowspan="2" style="width: 125px;">中央车购税</td>
										<td rowspan="2" style="width: 125px;">地方自筹</td>
										<td rowspan="2" style="width: 125px;">其他资金</td>				
										<td colspan="5">按技术等级</td>
										<td rowspan="2" style="width: 125px;">合计</td>
										<td rowspan="2" style="width: 125px;">中央车购税</td>
										<td rowspan="2" style="width: 125px;">地方自筹</td>
										<td rowspan="2" style="width: 125px;">其他资金</td>	
										<td colspan="5">按技术等级</td>
									</tr>
									<tr>
									    <td style="width: 80px;">合计</td>
									    <td style="width: 80px;">一级</td>
									    <td style="width: 80px;">二级</td>
									    <td style="width: 80px;">三级</td>
									    <td style="width: 80px;">四级</td>
									    
									    <td style="width: 80px;">合计</td>
									    <td style="width: 80px;">一级</td>
									    <td style="width: 80px;">二级</td>
									    <td style="width: 80px;">三级</td>
									    <td style="width: 80px;">四级</td>
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