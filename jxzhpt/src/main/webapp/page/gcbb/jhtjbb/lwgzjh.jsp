<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<style>
#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(../../../images/jianjiao.png) 8px 0 no-repeat;}
#righttop{height:33px;background:url(../../../images/righttopbg.gif) 0 0 repeat-x;}
a:link {text-decoration: none;}
a:visited {text-decoration: none;}
a:hover {text-decoration: none;}
a:active {text-decoration: none;}
table {border-collapse:collapse;}
table thead tr td {text-align:center; 	font-size:1em;font-weight:bold;border:1px solid black;padding:3px 7px 2px 7px;}
</style>
<script type="text/javascript">
$(function(){
	loadUnit("gydw",$.cookie("unit"));
	loadDist("xzqh",$.cookie("dist"));
	getYearList();
	startSearch();
});
function startSearch(){
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcbb/getLwjgjsgzb.do',
		dataType:"json",
		data:"dist="+$("#xzqh").combotree("getValue")+"&unit="+$("#gydw").combotree("getValue")+"&nf=2014",
		success:function(data){
			var str="";
			$("#tbody_sj").html("");
			if(msg!=null){
				for(var i=0;i<msg.length;i++){
					str+="<tr align='center'>";
					str+="<td>"+msg[i].v_0+"</td>"+"<td>"+msg[i].v_1+"</td>"+"<td>"+msg[i].v_2+"</td>"+"<td>"+msg[i].v_3+"</td>"
					+"<td>"+msg[i].v_4+"</td>"+"<td>"+msg[i].v_5+"</td>"+"<td>"+msg[i].v_6+"</td>"+"<td>"+msg[i].v_7+"</td>"
					+"<td>"+msg[i].v_8+"</td>"+"<td>"+msg[i].v_9+"</td>"+"<td>"+msg[i].v_10+"</td>"+"<td>"+msg[i].v_11+"</td>"
					+"<td>"+msg[i].v_12+"</td>"+"<td>"+msg[i].v_13+"</td>"+"<td>"+msg[i].v_14+"</td>"+"<td>"+msg[i].v_15+"</td>"
					+"<td>"+msg[i].v_16+"</td>"+"<td>"+msg[i].v_17+"</td>"+"<td>"+msg[i].v_18+"</td>"+"<td>"+msg[i].v_19+"</td>"
					+"<td>"+msg[i].v_20+"</td>"+"<td>"+msg[i].v_21+"</td>"+"<td>"+msg[i].v_22+"</td>"+"<td>"+msg[i].v_23+"</td>"
					+"<td>"+msg[i].v_24+"</td>"+"<td>"+msg[i].v_25+"</td>"+"<td>"+msg[i].v_26+"</td>"+"<td>"+msg[i].v_27+"</td>"
					+"<td>"+msg[i].v_28+"</td>"+"<td>"+msg[i].v_29+"</td>"+"<td>"+msg[i].v_30+"</td>"+"<td>"+msg[i].v_31+"</td>"
					+"<td>"+msg[i].v_32+"</td>"+"<td>"+msg[i].v_33+"</td>"+"<td>"+msg[i].v_34+"</td>"+"<td>"+msg[i].v_35+"</td>"
					+"<td>"+msg[i].v_36+"</td>"+"<td>"+msg[i].v_37+"</td>"+"<td>"+msg[i].v_38+"</td>"+"<td>"+msg[i].v_39+"</td>"
					+"<td>"+msg[i].v_40+"</td>";
					str+="</tr>";
				}
				$("#tbody_sj").html(str);
			}else{
				str+="<tr><td colspan='41'>暂无数据</td></tr>";
			}
		}
	});
}
</script>
</head>
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;计划统计报表>&nbsp;路网结构改造建议计划汇总表</div>
			</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:100%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>单位名称：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>上报年份：</span>
        						<select id="year" style="width:80px;">
        						</select>
        							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <img alt="查询" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'"
                                        onmouseout="this.src='../../../images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" />
									 <img alt="导出Excel" src="../../../images/Button/dcecl1.gif" onmouseover="this.src='../../../images/Button/dcecl2.gif'"
                                        onmouseout="this.src='../../../images/Button/dcecl1.gif' " onclick="aqgltj()" style="vertical-align: -50%;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div style="width:100%;height:126px;">
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" >
							<table width="1200px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">2015年路网结构改造建议计划汇总表</caption>
								<thead>
									<tr>
										<td width="150px;"></td>
										<td width="150px;"></td>
										<td width="150px;">座/项目数</td>
										<td width="150px;">延米</td>
										<td width="150px;">处治里程</td>
										<td width="150px;">补助资金(万元)</td>
										<td width="150px;">部安排资金</td>
										<td width="150px;">总投资(万元)</td>
									</tr>
								</thead>
								<tbody id="2"></tbody>
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