<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>灾害防治项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_zhfz.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
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
			loadBmbm2('ddlGldj','公路等级');
			tsdq('ddlTSDQ');
			var myDate = new Date();
			sbnf("sbnf");
			$('#sbnf').combobox("setValue",myDate.getFullYear());
			queryZjqf($('#sbnf').combobox("getValue"));
			var jh={sbnf:$('#sbnf').combobox("getValue"),sbzt:null,spzt:'0',jh_sbthcd:0,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			if(!xian){
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
			querySumZhfz(jh,lx);
			zhfzxm_sb(jh,lx);
		});
		function searchZhfz(){
			var jh={jhnf:null,sbzt:null,spzt:null,jh_sbthcd:null};
			if(!xian){
				jh.jh_sbthcd=2;
			}
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:null,lxbm:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.lxjsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#ddlGldj').combobox('getText')!='全部'){
				lx.lxbm=$('#ddlGldj').combobox('getValue');
			}
			if($('#ddlSHZT').combobox('getValue')=="未上报"){
				if(roleName()=="县级"){
					jh.jh_sbthcd=0;
				}else{
					jh.jh_sbthcd=2;
				}
			}else if($('#ddlSHZT').combobox('getValue')=="已上报"){
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
			queryZjqf($('#sbnf').combobox("getValue"));
			querySumZhfz(jh,lx);
			zhfzxm_sb(jh,lx);
		}
		function sbList(){
			//判断是否能上报，如果可以上报就查询所有要上报的计划，并上报
			if($('#lblQfzj').html()==$('#lblBTZ').html()){
				var param={'jh.sbnf':zjqf['zjqf.nf'],'jh.jh_sbthcd':0,
						'lx.gydwbm':$.cookie("unit2")};
				if(roleName()=="市级"){
					param['jh.jh_sbthcd']=2;
				}
				$.ajax({
					type:'post',
					url:'../../../jhgl/queryZhfzByStatus.do',
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
										'jh.jh_sbthcd':Number(item.jh_sbthcd)+2};
								if(xian){
									jh['jh.sbzt']='0';
								}
								editStatus(jh);
							});
							alert("上报成功！");
							searchZhfz();
						}else{
							alert("无需要上报的计划！");
						}
					}
				});
			}else{
				alert("计划项目的资金不等于分到的资金！");
			}
		}
		function sb(id,jh_sbthcd){
			var date=new Date();
			var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
				" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			var jh={'jh.id':id,'jh.sbsj':sbsj,'jh.sbbmdm':$.cookie("unit"),'jh.sbzt':'1',
					'jh.jh_sbthcd':Number(jh_sbthcd)+2};
			if(xian){
				jh['jh.sbzt']='0';
			}
			if(editStatus(jh)){
				alert("上报成功！");
				searchZhfz();
			}
		}
		function tuihui(id,jh_sbthcd){
			var jh={'jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':Number(jh_sbthcd)-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchZhfz();
			}
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库上报>&nbsp;灾害防治项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
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
        						<input name="txtRoad" type="text" id="txtRoad" style="width:100px;" />
        					</p>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>上报年份：</span>
        						<select id="sbnf" style="width: 80px;"></select>
        						<span>&nbsp;上报状态：</span>
        						<select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:70px;">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
								</select>
								<span>&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" class="easyui-combobox" id="ddlTSDQ" style="width:80px;"></select>
								<span>&nbsp;技术等级：</span>
								<select name="ddlPDDJ" class="easyui-combobox" id="ddlPDDJ" style="width:65px;"></select>
								<span>&nbsp;公路等级：</span>
								<select name="ddlGldj" class="easyui-combobox" id="ddlGldj" style="width:104px;"></select>
								<span>是否有补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="无" selected="selected">否</option>
									<option value="是">是</option>
								</select>
        					</p>
        					<table style="margin:8px 0px 8px 20px;">
        						<tr>
        							<td>
        								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchZhfz()" style="vertical-align:middle;padding-left: 8px;"/>
        								<img onclick="sbList()" id="btnShangbao" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qbshangbao_2.png'" alt="上报" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qbshangbao_1.png'" src="${pageContext.request.contextPath}/images/Button/qbshangbao_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        								<img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
                                	</td>
                                </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 30px; font-size: 12px;">
        			切分资金【&nbsp;<span id="lblQfzj" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个灾害防治项目，
        			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<div id="zhfz_sb" style="text-align: left;font-size: 12px;width:80%;"></div>
	<!-- <div id="zhfz_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
</body>
</html>
