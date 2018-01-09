<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>补助历史数据</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			bbxmlx1('xmlx');
			tsdqdx("tsdq");
			loadBmbm3("xdnf",'历史项目年份');
			loadBmbm3("xmknf",'十三五项目年份');
			loadBmbm3("sjlx",'综合查询数据类型');
			loadDist1("xzqh",$.cookie("dist"));
		});
		function search(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			if(xmlx==''){
				xmlx='改建,路面改造,新建,养护大中修,灾毁重建,路网结构工程';
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
			var lxbm=$('#lxbm').val().toUpperCase( );
			var ghlxbm=$('#ghlxbm').val().toUpperCase( );
			var xdnf=$("#xdnf").combobox("getValues").join(",");
			if(xdnf.substr(0,1)==',')
				xdnf=xdnf.substr(1,xdnf.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmknf=$("#xmknf").combobox("getValues").join(",");
			if(xmknf.substr(0,1)==',')
				xmknf=xmknf.substr(1,xmknf.length);
			var sjlx=$("#sjlx").combobox("getValues").join(",");
			if(sjlx.substr(0,1)==',')
				sjlx=sjlx.substr(1,sjlx.length);
 			var params={'lx.lxbm': lxbm,'lx.qdzh':$('#qdzh').val(),'lx.zdzh':$('#zdzh').val(),
					'lx.ghlxbm': ghlxbm,'lx.ghqdzh':$('#ghqdzh').val(),'lx.ghzdzh':$('#ghzdzh').val(),'lx.xmlx':xmlx,'lx.xzqh':xzqhstr,'lx.xdnf':xdnf,'lx.tsdq':tsdq,
					'lx.xmknf':xmknf,'lx.sjlx':sjlx,'lx.xmid':$('#xmid').val(),'lx.xmmc':$('#xmmc').val()};
			loadLj(params);
			$('#grid').datagrid({
				url:'../../../qqgl/queryLsxx2new.do',
				queryParams: params,
				rownumbers:true,
				fitColumns:true,
				height:$(window).height()-120,
			    width:$(window).width()-20,
				columns:[[
					{field:'sjlx',title:'数据类型',width:100,align:'center'},
					{field:'xmlx',title:'项目类型',width:100,align:'center'},
					{field:'xmmc',title:'项目名称',width:200,fixed:true,align:'center',
						formatter:function(value,row,index){
							var a="";
							if(row.sjlx=='补助历史')
							a='<a href="javascript:msgxx('+"'"+row.xmid+"','"+row.xmlx+"','"+row.ghqdzh+"','"+row.ghzdzh+"','"+row.qdzh+"','"+row.zdzh+"'"+')" style="color:#0066CB;font-size:12px;">';
							else
							a='<a href="javascript:msgxx1('+"'"+row.xmid+"','"+row.xmlx+"','"+row.ghqdzh+"','"+row.ghzdzh+"','"+row.qdzh+"','"+row.zdzh+"'"+')" style="color:#0066CB;font-size:12px;">';	
							a+=value+'</a>';
							return a;
						}
					},
					{field:'xmid',title:'项目年份',width:100,align:'center',
						formatter:function(value,row,index){
							if(row.sjlx=='补助历史')
							return value.substring(0,4);
							else
							return row.xmknf;
						}
					},
					{field:'xdnf',title:'下达年份',width:180,align:'center'},
					{field:'ghlxbm',title:'规划路线编码',width:110,align:'center'},
					{field:'jsjsdj',title:'规划技术等级',width:110,align:'center',
						formatter:function(value,row,index){
							if(value=='')
							return row.xjsdj;
							else return value;
						}
					},
					{field:'ghqdzh',title:'规划起点桩号',width:110,align:'center'},
					{field:'ghzdzh',title:'规划止点桩号',width:110,fixed:true,align:'center'},
					{field:'lxbm',title:'原路线编码',width:100,align:'center'},
					{field:'xjsdj',title:'原技术等级',width:100,align:'center'},
					{field:'qdzh',title:'原起点桩号',width:100,align:'center',
						formatter:function(value,row,index){
							if(row.xmlx=='危桥改造')
							return accDiv(accAdd(row.qdzh,row.zdzh),2);
							else return value;
						}
					},
					{field:'zdzh',title:'原止点桩号',width:100,align:'center',
							formatter:function(value,row,index){
								if(row.xmlx=='危桥改造')
									return '';
									else return value;
							}
					}
/* 					{field:'jhlc',title:'计划里程',width:100,align:'center'},
					{field:'ztz',title:'总投资',width:100,align:'center'},
					{field:'cgs',title:'车购税',width:100,align:'center'},
					{field:'stz',title:'省补助资金',width:100,align:'center'},
					{field:'sjl',title:'省奖励资金',width:100,align:'center'},
					{field:'rys',title:'燃油税',width:100,align:'center'},
					{field:'tdk',title:'厅贷款',width:100,align:'center'},
					{field:'dfzc',title:'地方自筹',width:100,align:'center'} */
					]]
			});
		}
		
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryLsxxTotal.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						 $("#xmsl").html(msg.xmsl);
						 $("#jhlc").html(msg.jhlc);
						 $("#ztz").html(msg.ztz);
						 $("#cgs").html(msg.cgs);
						 $("#stz").html(msg.stz);
						 $("#sjl").html(msg.sjl);
						 $("#rys").html(msg.rys);
						 $("#tdk").html(msg.tdk);
						 $("#dfzc").html(msg.dfzc);
					}/* else{
						$('#xmsl').html("0");
						$('#jhlc').html("0");
						$('#ztz').html("0");
						$('#cgs').html("0");
						$('#stz').html("0");
						$('#sjl').html("0");
						$('#rys').html("0");
						$('#tdk').html("0");
						$('#dfzc').html("0");
					} */
				}
			});
		}
		
		
		var obj;
		function msgxx(xmid,jsdj,ghqdzh,ghzdzh,qdzh,zdzh){
			
			YMLib.Var.ghqdzh=ghqdzh;
			YMLib.Var.ghzdzh=ghzdzh;
			YMLib.Var.qdzh=qdzh;
			YMLib.Var.zdzh=zdzh;
			YMLib.Var.xmbm=xmid;
			if(jsdj=='安防工程'||jsdj=='危桥改造'||jsdj=='灾害防治'){
				obj=xmid.substr(4,xmid.length);
				if(jsdj=='危桥改造'){
					YMLib.UI.createWindow('lmsjxx','危桥改造项目','/jxzhpt/page/jhgl/jhkxx/wqgz.jsp','lmsjxx',980,400);
				}
				if(jsdj=='安防工程'){
					YMLib.Var.jhbm=xmid.substr(4,xmid.length);
					YMLib.UI.createWindow('abgc_xx','安防工程',"/jxzhpt/page/jhgl/jhkxx/abgc.jsp",'abgc_xx',1000,500);
				}
				if(jsdj=='灾害防治'){
					YMLib.Var.jhbm=xmid.substr(4,xmid.length);
					YMLib.UI.createWindow('zhfz_xx','灾害防治',"/jxzhpt/page/jhgl/jhkxx/zhfz.jsp",'zhfz_xx',1000,500);
				}
				
			}else{
				if(xmid.substring(10,11)=="1"){
					YMLib.UI.createWindow('lmsjxx','升级改造工程项目','/jxzhpt/page/qqgl/zjxd/lmsj_xx_zhcx.jsp','lmsjxx',980,400);
				}else if(xmid.substring(10,11)=="2"){
					YMLib.UI.createWindow('lmgzxx','路面改造工程项目','/jxzhpt/page/qqgl/zjxd/lmgz_xx_zhcx.jsp','lmgzxx',980,400);
				}else if(xmid.substring(10,11)=="3"){
					YMLib.UI.createWindow('xjgcxx','新建工程项目','/jxzhpt/page/qqgl/zjxd/xjgc_xx_zhcx.jsp','xjgcxx',980,400);
				}else if(xmid.substring(10,11)=="4"){
					YMLib.UI.createWindow('yhdzxxx','养护大中修项目','/jxzhpt/page/qqgl/zjxd/yhdzx_xx_zhcx.jsp','yhdzxxx',980,400);
				}else if(xmid.substring(10,11)=="5"){
					YMLib.UI.createWindow('shxmxx','灾毁恢复重建项目','/jxzhpt/page/qqgl/zjxd/shxm_xx_zhcx.jsp','shxmxx',980,400);
				}
			}
			
			
		}
		
		function msgxx1(xmid,jsdj,ghqdzh,ghzdzh,qdzh,zdzh){
			YMLib.Var.ghqdzh=ghqdzh;
			YMLib.Var.ghzdzh=ghzdzh;
			YMLib.Var.qdzh=qdzh;
			YMLib.Var.zdzh=zdzh;
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/cxwnxmkbyxmbm.do',
		        data:'lxsh.xmbm='+xmid,
				dataType:'json',
				success:function(msg){
					obj=msg;
					if(jsdj=='改建'){
						YMLib.UI.createWindow('shxmxx','改建项目','/jxzhpt/page/wngh/wnjh/sjgz_xx_zhcx.jsp','shxmxx',980,400);
					}
					if(jsdj=='路面改造'){
						YMLib.UI.createWindow('shxmxx','路面改造项目','/jxzhpt/page/wngh/wnjh/lmgz_xx_zhcx.jsp','shxmxx',980,400);
					}
					if(jsdj=='新建'){
						YMLib.UI.createWindow('shxmxx','新建项目','/jxzhpt/page/wngh/wnjh/xj_xx_zhcx.jsp','shxmxx',980,400);
					}
				}
			});
				
		}
		
		
		function reset(){
			$("#lxbm").val("");
			$("#qdzh").val("");
			$("#zdzh").val("");
			$("#ghlxbm").val("");
			$("#ghqdzh").val("");
			$("#ghzdzh").val("");
		}
		
		
		//加法
		function accAdd(arg1,arg2){  
		    var r1,r2,m;  
		    try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;}  
		    try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;}  
		    m=Math.pow(10,Math.max(r1,r2));
		    return (arg1*m+arg2*m)/m;  
		}
		//浮点数减法
		function accSub(arg1,arg2){
			 var r1,r2,m,n;
			 try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;}
			try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;}
			m=Math.pow(10,Math.max(r1,r2));
			//last modify by deeka
			//动态控制精度长度
			n=(r1>=r2)?r1:r2;
			return ((arg1*m-arg2*m)/m).toFixed(n);
			}
		//乘法
		function accMul(arg1,arg2)  
		{  
		    var m=0,s1=arg1.toString(),s2=arg2.toString();  
		    try{m+=s1.split(".")[1].length;}catch(e){
		    }  
		    try{m+=s2.split(".")[1].length;}catch(e){
		    }  
		    return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);  
		}
		//除法
		function accDiv(arg1,arg2){  
		    var t1=0,t2=0,r1,r2;  
		    try{t1=arg1.toString().split(".")[1].length;}catch(e){}  
		    try{t2=arg2.toString().split(".")[1].length;}catch(e){}  
		    with(Math){  
		        r1=Number(arg1.toString().replace(".",""));  
		        r2=Number(arg2.toString().replace(".",""));  
		        return (r1/r2)*pow(10,t2-t1);  
		    }  
		}
		
		//导出综合查询Excel
		function exportJhshxx(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			if(xmlx==''){
				xmlx='改建,路面改造,新建,养护大中修,灾毁重建,路网结构工程';
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
			var lxbm=$('#lxbm').val().toUpperCase( );
			var ghlxbm=$('#ghlxbm').val().toUpperCase( );
			var xdnf=$("#xdnf").combobox("getValues").join(",");
			if(xdnf.substr(0,1)==',')
				xdnf=xdnf.substr(1,xdnf.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmknf=$("#xmknf").combobox("getValues").join(",");
			if(xmknf.substr(0,1)==',')
				xmknf=xmknf.substr(1,xmknf.length);
			var sjlx=$("#sjlx").combobox("getValues").join(",");
			if(sjlx.substr(0,1)==',')
				sjlx=sjlx.substr(1,sjlx.length);
			
			var param='lx.lxbm='+lxbm+'&lx.qdzh='+$('#qdzh').val()+'&lx.zdzh='+$('#zdzh').val()+'&lx.ghlxbm='+ghlxbm+
			'&lx.ghqdzh='+$('#ghqdzh').val()+'&lx.ghzdzh='+$('#ghzdzh').val()+'&lx.xmlx='+encodeURI(encodeURI(xmlx))+'&lx.xzqh='+xzqhstr+
			'&lx.xdnf='+xdnf+'&lx.tsdq='+tsdq+'&lx.xmknf='+xmknf+'&lx.sjlx='+sjlx;
			
			window.location.href="/jxzhpt/qqgl/exportLsjlSearchExcel.do?"+param;
		}
	</script>
	<style>
	TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">统计分析>&nbsp;计划库统计分析>&nbsp;综合查询</div>
	</div>
	<form action="">
	<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:99.7%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="32">
								<td style="text-align: right;">原路线编码：</td>
        						<td style="text-align: left;"><input id="lxbm" type="text" style="width: 70px;margin-right: 10px;"/></td>
								<td style="text-align: right;">原起点桩号：</td>
        						<td style="text-align: left;"><input id="qdzh" type="text" style="width: 60px;margin-right: 10px;"/></td>
								<td style="text-align: right;">原止点桩号：</td>
        						<td style="text-align: left;"><input id="zdzh" type="text" style="width: 60px;margin-right: 10px;"/></td>
        						<td style="text-align: right;">项目类型：</td>
        						<td style="text-align: left;"><input id="xmlx" type="text" style="width: 150px;margin-right: 10px;"/></td>
        						<td style="text-align: right;">下达年份：</td>
        						<td style="text-align: left;"><input id="xdnf" type="text" style="width: 100px;margin-right: 10px;"/></td>
        						<td style="text-align: right;">项目库年份：</td>
        						<td style="text-align: left;"><input id="xmknf" type="text" style="width: 100px;margin-right: 10px;"/></td>
        					
        					</tr>
        					<tr height="32">
								<td style="text-align: right;">规划路线编码：</td>
        						<td style="text-align: left;"><input id="ghlxbm" type="text" style="width: 70px;margin-right: 10px;"/></td>
								<td style="text-align: right;">规划起点桩号：</td>
        						<td style="text-align: left;"><input id="ghqdzh" type="text" style="width: 60px;margin-right: 10px;"/></td>
								<td style="text-align: right;">规划止点桩号：</td>
        						<td style="text-align: left;"><input id="ghzdzh" type="text" style="width: 60px;margin-right: 10px;"/></td>
        						<td style="text-align: right;">行政区划：</td>
        						<td style="text-align: left;"><input id="xzqh" type="text" style="width: 150px;margin-right: 10px;"/></td>
        						<td style="text-align: right;">特殊地区：</td>
        						<td style="text-align: left;"><input id="tsdq" type="text" style="width: 100px;margin-right: 10px;"/></td>
        						<td style="text-align: right;">数据类型：</td>
        						<td style="text-align: left;"><input id="sjlx" type="text" style="width: 100px;margin-right: 10px;"/></td>
        					
        					</tr>
        					<tr height="32">
								<td style="text-align: right;">项目编码：</td>
        						<td style="text-align: left;"><input id="xmid" type="text" style="width: 70px;margin-right: 10px;"/></td>
								<td style="text-align: right;">项目名称：</td>
        						<td style="text-align: left;"><input id="xmmc" type="text" style="width: 60px;margin-right: 10px;"/></td>
        					</tr>
                            <tr height="32">
                            	<td colspan="8">
								<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:search()" class="button button-tiny button-raised button-primary">查询</a>
                            	<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:reset()" class="button button-tiny button-raised button-primary">重置</a>
                            	<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:exportJhshxx()" class="button button-tiny button-raised button-primary">导出Excel</a>
                            	
<!--                             		<img onclick="search()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/> -->
									
								</td>
                            </tr>
        					</table>
        					
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
           	    <td style="padding-left: 10px; font-size:12px;">
           		     项目【<span id="xmsl" style="color: red;">0</span>】个，
            	     建设里程【<span id="jhlc" style="color: red;">0</span>】公里，
            	     总投资【<span id="ztz" style="color: red;">0</span>】万元，
            	     其中车购税【<span id="cgs" style="color: red;">0</span>】万元，
            	     省补资金【<span id="stz" style="color: red;">0</span>】万元，
            	     省奖励资金【<span id="sjl" style="color: red;">0</span>】万元，
            	     燃油税【<span id="rys" style="color: red;">0</span>】万元，
            	     厅贷款【<span id="tdk" style="color: red;">0</span>】万元，
            	     地方投资【<span id="dfzc" style="color: red;">0</span>】万元。
           	    </td>
       	     </tr>
		</table>
	</form>
	<%-- <div id="searchDiv" style="margin-left: 20px;margin-top: 5px;margin-bottom: 5px;">
		<table>
			<tr>
				<td >原路线编码：<input id="lxbm" type="text" style="width: 100px;margin-right: 10px;"/></td>
				<td >原起点桩号：<input id="qdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td >原止点桩号：<input id="zdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td>
				<img onclick="search()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
				</td>
			</tr>
			<tr>
				<td >规划路线编码：<input id="ghlxbm" type="text" style="width: 100px;margin-right: 10px;"/></td>
				<td >规划起点桩号：<input id="ghqdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td >规划止点桩号：<input id="ghzdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td><img onclick="search()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/></td>
			</tr>
		</table>
	</div> --%>
	<table id="grid" width="98%" border="0" class="easyui-datagrid" data-options="fitColumns:true" style="margin-top:1px;margin-left:1px;" cellspacing="0" cellpadding="0">
		 <thead>
        	<tr>
        		<th data-options="field:'sjlx',width:150,fixed:true,align:'center'">数据类型</th>
        		<th data-options="field:'xmlx',width:150,fixed:true,align:'center'">项目类型</th>
        		<th data-options="field:'scbz',width:150,fixed:true,align:'center'">项目名称</th>
        		<th data-options="field:'jhnf',width:150,fixed:true,align:'center'">计划年份</th>
				<th data-options="field:'lxbm',width:100,align:'center'">规划路线编码</th>
				<th data-options="field:'gjjsdj',width:100,align:'center'">规划技术等级</th>
				<th data-options="field:'xqdzh',width:100,align:'center'">规划起点桩号</th>
				<th data-options="field:'xzdzh',width:100,align:'center'">规划止点桩号</th>
				<th data-options="field:'ylxbm',width:100,align:'center'">原路线编码</th>
				<th data-options="field:'yjsjd',width:100,align:'center'">原技术等级</th>
				<th data-options="field:'yqdzh',width:100,align:'center'">原起点桩号</th>
				<th data-options="field:'yzdzh',width:100,align:'center'">原止点桩号</th>
        	</tr>
    	</thead> 
	</table>
</body>
</html>
