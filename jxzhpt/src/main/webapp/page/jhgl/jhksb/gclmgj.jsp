<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面改建项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_gcgj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
		var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
		var xian=true;
		if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
			xian=false;
		}
		$(function(){
			gydwComboxTree("gydw");
			xzqhComboxTree("xzqh");
			tsdq('ddlTSDQ');
			var jh={sbnf:null,sbzt:null,spzt:'0',jh_sbthcd:0};
			if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
				jh.jh_sbthcd=2;
			}
			var lx={gydw:null,gydwdm:filterGydwdm($("#gydw").combo("getValue")),lxmc:null,xzqhmc:null,yjsdj:null,lxbm:null};
			querySumGcgj(jh,lx);
			sbnf("sbnf");
			gclmgjxm_sb(jh,lx);
		});
		function searchGcgj(){
			var jh={jhnf:null,sbzt:null,spzt:'0',jh_sbthcd:0};
			if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
				jh.jh_sbthcd=2;
			}
			var lx={gydw:$("#gydw").combo("getText"),gydwdm:$("#gydw").combo("getValue"),lxmc:null,xzqhmc:null,xzqhdm:$("#xzqh").combo("getValue"),yjsdj:null,lxbm:null};
			lx.gydwdm = filterGydwdm(lx.gydwdm);
			lx.xzqhdm=filterXzqhdm(lx.xzqhdm);
			if($("#sbnf").combo("getValue")!=""){
				jh.sbnf=$("#sbnf").combo("getValue");
			}
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($("#ddlPDDJ").combo("getValue")!=""){
				lx.yjsdj= $("#ddlPDDJ").combo("getValue");
			}
			if($("#ddlGldj").combo("getValue")!=""){
				lx.lxbm=$("#ddlGldj").combo("getValue");
			}
			if($('#ddlTSDQ').combo("getValue")!=''){
				lx.tsdqbm=$('#ddlTSDQ').combo("getValue");
			}
			gclmgjxm_sb(jh,lx);
		}
		function sbList(){
			var selList=gridObj.datagrid('getSelections');
			var isOk=true;
			$.each(selList,function(index,item){
				if(item.jh_sbthcd>4)
					isOk=false;
			});
			if(isOk){
				$.each(selList,function(index,item){
					var date=new Date();
					var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
						" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
					var jh={'jh.id':item.id,'jh.sbsj':sbsj,'jh.sbbmdm':$.cookie("unit"),'jh.sbzt':'1',
							'jh.jh_sbthcd':item.jh_sbthcd+2};
					if(xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))){
						jh['jh.sbzt']='0';
					}
					editStatus(jh);
				});
				alert("上报成功！");
				searchGcgj();
			}else{
				alert("请检查选中的数据，只能上报未上报过的计划！");
			}
		}
		function sb(id,jh_sbthcd){
			var date=new Date();
			var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
				" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			var jh={'jh.id':id,'jh.sbsj':sbsj,'jh.sbbmdm':$.cookie("unit"),'jh.sbzt':'1',
					'jh.jh_sbthcd':jh_sbthcd+2};
			var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
			var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
			if(xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))){
				jh['jh.sbzt']='0';
			}
			if(editStatus(jh)){
				alert("上报成功！");
				searchGcgj();
			}
		}
		function tuihui(id,jh_sbthcd){
			var jh={'jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':jh_sbthcd-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchGcgj();
			}
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">计划管理>&nbsp;项目计划库上报>&nbsp;工程改造路面改建项目</div>
					</div>
	            </td>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:227px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:100px;" />
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>上报年份：</span>
        						<select id="sbnf" style="width: 80px;"></select>
        						<span>&nbsp;上报状态：</span>
        						<select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:70px;">
									<option selected="selected" value="">全部</option>
									<option value="0">未上报</option>
									<option value="1">已上报</option>
								</select>
								<span>&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" class="easyui-combobox" id="ddlTSDQ" style="width:80px;">
									<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
									<option value="FEE9AE40475863D6E040007F010045D7">cs</option>
									<option value="517e0f37-12cd-4de9-a452-6aca259457c1">csss</option>
								</select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" class="easyui-combobox" id="ddlPDDJ" style="width:65px;">
									<option selected="selected" value="">全部</option>
									<option value="一级公路">一级公路</option>
									<option value="二级公路">二级公路</option>
									<option value="三级公路">三级公路</option>
									<option value="四级公路">四级公路</option>
									<option value="等外公路">等外公路</option>公路</option>
								</select>
								<span>&nbsp;公路等级：</span>
								<select name="ddlGldj" class="easyui-combobox" id="ddlGldj" style="width:104px;">
									<option selected="selected" value="">全部</option>
									<option value="G">国道</option>
									<option value="S">省道</option>
									<option value="X">县道</option>
									<option value="Y">乡道</option>
									<option value="C">村道</option>
									<option value="Z">专道</option>
								</select>
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<img onclick="searchGcgj()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
        						<img onclick="sbList()" id="btnShangbao" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/shangbao_1.png'" src="${pageContext.request.contextPath}/images/Button/shangbao_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        						<img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 30px; font-size: 12px;">
        			 共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			 个路面改建项目，总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			 隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里；
        			 批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			 其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			 地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid" width="100%" height="320px"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	</div>
	
	<div id="gclmgj_sb" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
