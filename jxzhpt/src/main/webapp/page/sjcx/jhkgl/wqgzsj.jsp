<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_wqgz.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			xmnfdx("sbnf"); 
			xzdjdx('gldj');
			kjfldx('akjfl');
			tsdqdx('tsdq');
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			//loadBmbm2('jsdj','技术等级');
			//loadBmbm2('gldj','行政等级');
			//tsdq('tsdq');
			jhpcdx('jhpc','wqgz');
			
			loadwqjhkgl();
		});
		var gydwstr;
		var xzqhstr;
		function tuihui(){
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要退回的项目！");
				return;
			}
			var id=rows[0].id;
			for(var i=0;i<rows.length;i++){
				if(rows[i].spzt!='1'){
					alert('请勾选已审核的项目！');
					return;
				}
			}
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].id ;
			}
			if(confirm('确定退回到未审核状态？')){
				$.ajax({
					 type : "POST",
					 url : "/jxzhpt/jhgl/tuihuiWqgzsjById.do",
					 dataType : 'json',
					 data : 'planwqgzsj.id=' +id,
					 success : function(msg){
						 if(msg){
							 alert('退回成功！');
							 loadwqjhkgl();
						 }else{
							 YMLib.Tools.Show('退回失败！',3000);
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
			}
		}
		
		function loadwqjhkgl(){
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
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var akjfl=$("#akjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			 var jhpc=$("#jhpc").combobox("getText");
				if(jhpc.substr(0,2)=='全部')
					jhpc=jhpc.substr(3,jhpc.length);
		$("#grid").datagrid({    
			 url:'/jxzhpt/jhgl/selectwqjhksb1.do',
			 queryParams : {
				 'sbthcd':function(){
					 if($.cookie("unit2").length==11) return 0;
					 else if($.cookie("unit2").length==9) return 2;
				 		else return 4;
				 	},
				 	'gydw': gydwstr,
				 	'xzqhdm':xzqhstr,
				 	'lxmc':$('#lxmc').val(),
				 	'lxbm':$('#lxbm').val(),
				 	'qlmc':$("#qlmc").val(),
				 	'sbnf':xmnf,
				 	'planwqgzsj.jhzt':'审核通过',
				 	'pddj':$("#pddj").combobox("getValue"),
				 	'planwqgzsj.jsxz':$("#jsxz").combobox("getValue"),
				 	'gldj':gldj,
				 	'akjfl':akjfl,
				 	'sfylsjl':$("#sfylsjl").combobox("getValue"),
				 	'tsdq':tsdq,
				 	'sfylrbwqk':$("#sfylrbwqk").combobox("getValue"),
				 	'planwqgzsj.qlbh':$('#txtqlbm').val(),
				 	'planwqgzsj.jhpc':jhpc
				},
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:50,
			    height:$(window).height()-197,
				width:$(window).width()-25,
			    columns:[[    
					{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
					{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
						/* if(row.sfylrbwqk=='是')
							return '<a href="javascript:locationQl('+"'"+row.sck_qlbh+"','"+row.sck_qlzxzh+"'"+')" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href="javascript:ckwqgz('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>  <a href="javascript:edit1('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC; ">编辑</a>';
							else */
								return '<a href="javascript:locationQl('+"'"+row.sck_qlbh+"','"+row.sck_qlzxzh+"'"+')" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
								'<a href="javascript:ckwqgz('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>  ';
					}},    
					 
		 		{field:'sfylsjl',title:'是否有修建记录',width:120,align:'center',formatter:function(value,row,index){
		        	if(row.sfylsjl=='无')
		        		return '无';
		        	else if(row.sfylsjl=='有')
		        		return '有';
		        }},
		        {field:'sfbk',title:'计划类别',width:120,align:'center',formatter:function(value,row,index){
		        	if(row.sfylrbwqk=='是')
		        		return '车购税';
		        	else if(row.sfylrbwqk=='否')
		        		return '省补';
		        }},
		        {field:'sbnf',title:'上报年份',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
		        {field:'gydw',title:'管养（监管）单位',width:150,align:'center'},
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
		        {field:'lxbm',title:'路线编码',width:100,align:'center'},
		        {field:'lxmc',title:'路线名称',width:100,align:'center'},
		        {field:'qlbh',title:'桥梁编码',width:100,align:'center'},
		        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
		        {field:'pfztz',title:'批复总投资',width:100,align:'center'}
			    ]]    
				}); 
		tjwqgz();
		}
		function tjwqgz(){
			var sbthcd;
			if($.cookie("unit2").length==11) sbthcd=0;
		 	else if($.cookie("unit2").length==9) sbthcd=2;
	 		else sbthcd=4;
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var akjfl=$("#akjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			 var jhpc=$("#jhpc").combobox("getText");
				if(jhpc.substr(0,2)=='全部')
					jhpc=jhpc.substr(3,jhpc.length);
			var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&lxbm="+$('#lxbm').val()+"&qlmc="+$("#qlmc").val()+
			"&sbnf="+xmnf+"&planwqgzsj.jhzt=审核通过"+"&gldj="+gldj+"&planwqgzsj.jsxz="+$("#jsxz").combobox("getValue")+
			"&pddj="+$("#pddj").combobox("getValue")+"&akjfl="+akjfl+"&sfylsjl="+
			$("#sfylsjl").combobox("getValue")+"&tsdq="+tsdq+'&sfylrbwqk='+$("#sfylrbwqk").combobox("getValue")
			+"&planwqgzsj.qlbh="+$('#txtqlbm').val()+"&planwqgzsj.jhpc="+jhpc;
			$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/loadwqjhksbCount1.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 $("#sl").html(msg.sl);
				 $("#pfztz").html(msg.pfztz);
				 $("#btz").html(msg.jhsybzje);
				 $("#stz").html(msg.shengbz);
				 $("#dftz").html(msg.jhsydfzcje);
			 }
		});
		}
		var obj;
		function edit(id){
			obj=id;
			YMLib.UI.createWindow('wq_edit','危桥改造',"/jxzhpt/page/jhgl/jhkgl/wqgzsj_xg.jsp",'wq_edit',1000,500);
		}
		function tz(id){
			obj=id;
			YMLib.UI.createWindow('wq_tz','危桥改造',"/jxzhpt/page/jhgl/jhkgl/wqgzsj_tz.jsp",'wq_tz',500,200);
		}
		function ckwqgz(id){
			obj=id;
			YMLib.UI.createWindow('wq_edit','危桥改造',"/jxzhpt/page/jhgl/jhkgl/wqgzsj_ck.jsp",'wq_edit',1000,500);
		}
		var tsdq1;
		function shangb1(id,tsdq){
			obj=id;
			tsdq1=tsdq;
			YMLib.UI.createWindow('wq_edit','省级审核',"/jxzhpt/page/jhgl/jhksh/wqgzsj_sh.jsp",'wq_edit',500,300);
		}
		
		function dcExcel(){
			var sbthcd;
			if($.cookie("unit2").length==11) sbthcd=0;
		 	else if($.cookie("unit2").length==9) sbthcd=2;
	 		else sbthcd=4;
			var xmnf=$("#sbnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var gldj=$("#gldj").combobox("getValues").join(",");
			if(gldj.substr(0,1)==',')
				gldj=gldj.substr(1,gldj.length);
			var akjfl=$("#akjfl").combobox("getValues").join(",");
			if(akjfl.substr(0,1)==',')
				akjfl=akjfl.substr(1,akjfl.length);
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&lxbm="+$('#lxbm').val()+"&qlmc="+$("#qlmc").val()+
			"&sbnf="+xmnf+"&planwqgzsj.jhzt=审核通过"+"&gldj="+gldj+"&planwqgzsj.jsxz="+$("#jsxz").combobox("getValue")+
			"&pddj="+$("#pddj").combobox("getValue")+"&akjfl="+akjfl+"&sfylsjl="+
			$("#sfylsjl").combobox("getValue")+"&tsdq="+tsdq+'&sfylrbwqk='+$("#sfylrbwqk").combobox("getValue")
			+"&planwqgzsj.qlbh="+$('#txtqlbm').val();
			
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
				window.location.href='/jxzhpt/jhgl/dcwqgzsjjhshExcel.do?'+data;
			 });
		}
		function shenghwtg(index){
			var data=$("#grid").datagrid('getRows')[index];
			obj=data;
			alert("未通过原因："+obj.shyj);
		}
	</script>
<style type="text/css">
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
		<div id="p_top">计划管理>&nbsp;项目计划库审核>&nbsp;危桥改造项目</div>
	</div>
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:99.7%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="32">
        						<td>管养（监管）单位：</td>
        						<td  colspan="3" style="width:120px;"><select id="gydw" style="width:220px;"></select></td>
        						
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:70px;" class="easyui-combobox">
									
								</select></td>
        						<td>跨径分类：</td>
        						<td><select name="ddlAKJFL" id="akjfl" style="width:80px;" class="easyui-combobox">
									
								</select></td>
        						<td>桥梁名称：</td>
        						<td><input name="txtBridge" type="text" id="qlmc" style="width:80px;" /></td>
        						<td>路线编码：</td>
        						<td><input name="txtRoad" type="text" id="lxbm" style="width:90px;" /></td>
        						<td>路线名称：</td>
        						<td><input name="txtRoad" type="text" id="lxmc" style="width:80px;" /></td>
        					</tr>
        					<tr height="32">
        						<td>行政区划：</td>
        						<td  colspan="3" style="width:120px;"><select id="xzqh" style="width:220px;"></select></td>
        						<td>上报年份：</td>
        						<td><select id="sbnf" style="width: 60px;"></select></td>
        						<td>评定等级：</td>
                              <td><select id="pddj" style="width:65px"class="easyui-combobox">
                              	<option value="" selected>全部</option>
								
								<option value="四类">四类</option>
								<option value="五类">五类</option>
                              </select></td>
								<td>行政等级：</td>
								<td><select name="ddlGldj" id="gldj" style="width:80px;" class="easyui-combobox">
								</select></td>
								
								
        						<td>建设性质：</td>
								<td><select id="jsxz" class="easyui-combobox" data-options="panelHeight:'100'" onchange="setbz()">
									<option value=""selected>全部</option>
									<option value="加固改造">加固改造</option>
									<option value="拆除重建">拆除重建</option>
<!-- 									<option value="大修">大修</option> -->
									</select></td>	
								<td>是否有补助历史：</td>
        						<td>
									<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:74px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="有">是</option>
									</select>
								</td>
        					</tr>
								<tr height="32">
								
								<td>计划类别：</td>
                              	<td><select id="sfylrbwqk" class="easyui-combobox"  style="width: 52px">
								<option value="" selected>全部</option>
								<option value="是" >车购税</option>
								<option value="否">省补</option>
								</select></td>
								<td>桥梁编码：</td>
        						<td><input name="txtRoad" type="text" id="txtqlbm" style="width:80px;" /></td>
                              	<td>计划批次：</td>
        						<td><select id="jhpc" class="easyui-combobox"  style="width: 80px"></td>
                              
                              <td colspan="10">
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="loadwqjhkgl()" style="vertical-align:middle;"/>
<!-- 								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="tuihui();" style="border-width:0px;vertical-align:middle;" /> -->
								 <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="dcExcel()"/>
							</td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;">
        			共有【&nbsp;<span id="sl" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个危桥改造项目，
        			批复总投资【&nbsp;<span id="pfztz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="btz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中省投资【&nbsp;<span id="stz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="dftz" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid" ></table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
