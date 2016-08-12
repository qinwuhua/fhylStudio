<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>病害隧道项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_bhsd.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
	var gljjtj="";
		$(function(){
			//plannf("sbnf");
			
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("sbnf"); 
			}else{
				setxmnf("sbnf",urlid);
			}
			gljjtj=getgljjtj(urlid);
			//xzdjdx('gldj');
			//setxzdj('gldj',urlid);
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			var jh={jhnf:$('#sbnf').combobox('getValue'),sbnf:null,sbzt:null,spzt:null,
					jh_sbthcd:$.cookie("unit2").length};
// 			var gydw=$.cookie("unit2");
// 			var xzqh=$.cookie("dist2");
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			querySumWqgz(jh,lx);
			
			if($.cookie("unit2").length==7 || $.cookie("unit2").length==2){
				$('#imglrjh').show();
			}
			wqxm(jh,lx);
		});
		function searchWqgz(){

	 		var jh={jhnf:$('#sbnf').combobox('getValue'),sbzt:null,spzt:null,
					jh_sbthcd:$.cookie("unit2").length};
			var lx={gydwbm:getgydw("gydw"),gydwlx:gljjtj,xzqhdm:getxzqhdm('xzqh'),lxmc:null,jsdj:null,lxbm:null,sddm:null};
			
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sdmc').val()!=''){
				lx.sdmc=$('#sdmc').val();
			}
			if($('#sddm').val()!=''){
				lx.sddm=$('#sddm').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				if($('#ddlSHZT').combo("getValue")=="未上报"){
				   jh.sbzt='0';
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					jh.sbzt='1';
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.spzt='0';
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.spzt='1';
				}
			}else{
				jh.sbzt=null;
				jh.spzt=null;
			}
			
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.jsdj=$('#ddlPDDJ').combobox('getValue');
			}
			bhxm(jh,lx);
			querySumBhsd(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		
		function sbList(){
			//判断是否能上报，如果可以上报就查询所有要上报的计划，并上报
				var param={'jh.sbnf':zjqf['zjqf.nf'],'jh.jh_sbthcd':11,
						'lx.gydwbm':$.cookie("unit")};
				if(roleName()=="市级"){
					param['jh.jh_sbthcd']=9;
				}
				$.ajax({
					type:'post',
					url:'../../../jhgl/queryBhsdByStatus.do',
					async:false,
					data:param,
					dataType:'json',
					success:function(data){
						if(data.length>0){
							$.each(data,function(index,item){
								var date=new Date();
								var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
									" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
								var jh={'jh.id':item.id,'jh.sbsj':sbsj,'jh.sbbmdm':$.cookie("unit"),'jh.sbzt':'1',
										'jh.jh_sbthcd':parseInt(item.jh_sbthcd,10)+2};
								if(xian){
									jh['jh.sbzt']='0';
								}
								editStatus(jh);
							});
							alert("上报成功！");
							searchWqgz();
						}else{
							alert("无需要上报的计划！");
						}
					}
				});
		}
		
		function shangB(){
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要上报项目！");
				return;
			}
			var ids=rows[0].id;
			if($.cookie("unit2")=='15'){
				alert("对不起，您无法上报！");
				return;
			}
			for(var i=0;i<rows.length;i++){
				if(rows[i].sbzt=='1'){
					alert("有项目已上报，请勿重复操作！");
					return ;
				}
			}
			for(var i=1;i<rows.length;i++){
				ids+=","+rows[i].id ;
			}
			if(confirm('您确定上报该项目？')){
				var date=new Date();
				var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
					" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
				var jh={'jhIds':ids,'jh.sbsj':sbsj,'jh.sbbm':$.cookie("unit"),'jh.sbzt':'1',
						'jh.jh_sbthcd':$.cookie("unit2").length-2,'jh.jh_thyj':''};
// 				alert(jh);
				$.ajax({
					 type : "POST",
					 url : "../../../jhgl/jHBhsdShangB.do",
					 dataType : 'json',
					 data : jh,
					 success : function(msg){
						 if(msg){
							 alert('上报成功！'); 
							 $("#grid").datagrid('reload');
							 searchWqgz();
						 }else{
							 alert('上报失败,请选择要上报项目！');
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
		}
		}
		
		function shangB1(id,sbzt){
			if($.cookie("unit2")=='15'){
				alert("对不起，您无法上报！");
				return;
			}
			if(sbzt=='1'){
				alert("有项目已上报，请勿重复操作！");
				return;
			}
		
			if(confirm('您确定上报该项目？')){
				var date=new Date();
				var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
					" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
				var jh={'jhIds':id,'jh.sbsj':sbsj,'jh.sbbm':$.cookie("unit"),'jh.sbzt':'1',
						'jh.jh_sbthcd':$.cookie("unit2").length-2,'jh.jh_thyj':''};
				$.ajax({
					 type : "POST",
					 url : "../../../jhgl/jHBhsdShangB.do",
					 dataType : 'json',
					 data : jh,
					 success : function(msg){
						 if(msg){
							 alert('上报成功！'); 
							 $("#grid").datagrid('reload');
							 searchWqgz();
						 }else{
							 alert('上报失败,请选择要上报项目！');
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
		}
		}
		
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;计划查询>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;病害隧道项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;border:1px solid #e4e5e6;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:227px;"></select> 
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:224px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:90px;" />
        						<span>&nbsp;隧道名称：</span>
        						<input name="sdmc" type="text" id="sdmc" style="width:90px;" />
        						
        					</p>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>&nbsp;隧道代码：</span>
        						<input name="sddm" type="text" id="sddm" style="width:90px;" />
        						<span>计划年份：</span>
        						<select id="sbnf" style="width: 80px;"></select>
        						<span>&nbsp;计划状态：</span>
        						<select name="ddlSHZT" id="ddlSHZT" style="width:70px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" style="width:65px;" class="easyui-combobox">
								</select>
        					</p>
							<p style="margin:8px 0px 4px 20px;">
<!-- 								<span>是否有补助历史：</span> -->
<!-- 								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;"> -->
<!-- 									<option value="" selected="selected">全部</option> -->
<!-- 									<option value="无">否</option> -->
<!-- 									<option value="是">是</option> -->
<!-- 								</select> -->
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" style="vertical-align:middle;"/>
<%-- 								<img alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportModule('Plan_Bridge')"/> --%>
<%-- 								<img alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" onclick="importData_jh('wqgz_jh')" style="vertical-align:middle;"/> --%>
				                <img onclick="dropWqgzs()" alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" style="vertical-align:middle;">
				                <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportExcel('bhsd','gl')"/>
<%-- 				                <img onclick="shangB()" id="btnShangbao" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/shangbao_1.png'" src="${pageContext.request.contextPath}/images/Button/shangbao_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
<!-- 								<img name="tuiH" id="tuiH" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'   " src=""  onclick="th_jhkgl('bhsd_th.jsp','500','200');" style="border-width:0px;cursor: hand;vertical-align:middle;" /> -->
							</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个病害隧道项目，
        			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
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
	
	<div id="wqgz_xx" style="text-align: left;font-size: 12px;width:80%;"></div>
	<div id="wqgz_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
