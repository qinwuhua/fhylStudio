<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_yhdzx.js"></script>
	<script type="text/javascript">
		var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
		var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
		var xian=true;
		if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
			xian=false;
		}
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','行政等级');
			tsdq('ddlTSDQ');
			sbnf('sbnf');
			var jh={sbnf:null,sbzt:null,spzt:'0',jh_sbthcd:0};
			var lx={gydwdm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			if(roleName()=="市级"){
				jh.jh_sbthcd=2;
			}else if(roleName()=="省级"){
				jh.jh_sbthcd=2;
			}
			if(getParam("t")=='1'){
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
				jh.spzt=null;
			}
			querySumYhdzx(jh,lx);
			yhdzxxm_sb(jh,lx);
		});
		function searchYhdzx(){
			var jh={sbzt:null,spzt:null,jh_sbthcd:0};
			var lx={gydwdm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			if(!xian){
				jh.jh_sbthcd=2;
			}
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.sbnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.yjsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#ddlGldj').combobox('getText')!='全部'){
				lx.lxbm=$('#ddlGldj').combobox('getValue');
			}
			if($('#ddlTSDQ').combobox('getValue')!=''){
				lx.tsdq=$('#ddlTSDQ').combobox('getValue');
			}
			if($('#jhzt').combobox('getValue')=="未上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}else if($('#jhzt').combobox('getValue')=="已上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=2;
				}else{
					jh.jh_sbthcd=4;
				}
			}else{
				jh.spzt='0';
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}
			querySumYhdzx(jh,lx);
			yhdzxxm_sb(jh,lx);
		}
		function sbList(){
			var isOk=true;
			var selList=gridObj.datagrid('getSelections');
			if(selList.length==0){
				alert("请选择要上报的计划！");
				return;
			}
			$.each(selList,function(index,item){
				if((item.jh_sbthcd>=4 && roleName()=="市级") || (item.jh_sbthcd>=2 && roleName()=="县级")){
					isOk=false;
					return isOk;
				}
			});
			if(isOk){
				$.each(selList,function(index,item){
					var date=new Date();
					var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
						" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
					var jh={'jh.id':item.id,'jh.sbsj':sbsj,'jh.sbbm':$.cookie("unit"),'jh.sbzt':'1',
						'jh.jh_sbthcd':Number(item.jh_sbthcd)+2};
					if(xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))){
						jh['jh.sbzt']='0';
					}
					editStatus(jh);
				});
				alert("上报成功！");
				searchYhdzx();
			}else{
				alert("请检查选中的数据，只能上报未上报过的计划！");
			}
		}
		function sb(id,jh_sbthcd){
			var date=new Date();
			var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
				" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			var jh={'jh.id':id,'jh.sbsj':sbsj,'jh.sbbm':$.cookie("unit"),'jh.sbzt':'1',
					'jh.jh_sbthcd':Number(jh_sbthcd)+2};
			if(xian){
				jh['jh.sbzt']='0';
			}
			if(editStatus(jh)){
				alert("上报成功！");
				searchYhdzx();
			}
		}
		function tuihui(id,jh_sbthcd){
			var jh={'jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':Number(jh_sbthcd)-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchYhdzx();
			}
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库上报>&nbsp;养护大中修项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:237px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:170px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" id="txtRoad" style="width:80px;"  type="text"/>
        						<span>&nbsp;计划状态：</span>
        						<select id="jhzt" class="easyui-combobox" name="dept" style="width: 70px;">
									<option value="全部">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
								</select>
        					</p>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>上报年份：</span>
        						<select id="sbnf" class="easyui-combobox" style="width: 80px;"></select>
								<span>&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" class="easyui-combobox" id="ddlTSDQ" style="width:80px;">
								</select>
								<span>&nbsp;原行政等级：</span>
								<select name="ddlGldj" class="easyui-combobox" id="ddlGldj" style="width:170px;">
								</select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" class="easyui-combobox" id="ddlPDDJ" style="width:84px;">
								</select>
        					</p>
        					<p style="margin-left:12px;margin-bottom: 5px;">
        						<img onclick="searchYhdzx()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
        						<img onclick="sbList()" id="btnShangbao" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/shangbao_1.png'" src="${pageContext.request.contextPath}/images/Button/shangbao_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        						<img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">105</span>&nbsp;】个养护大中修项目，
        			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">535.028</span>&nbsp;】公里，
        			核对里程共【&nbsp;<span id="lblHDLC" style="font-weight: bold; color: #FF0000">469.878</span>&nbsp;】公里；
        			总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">17451.1730</span>&nbsp;】万元，
        			总补助资金【&nbsp;<span id="lblZBZZJ" style="font-weight: bold; color: #FF0000">3303.7680</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<!-- <div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
</body>
</html>
