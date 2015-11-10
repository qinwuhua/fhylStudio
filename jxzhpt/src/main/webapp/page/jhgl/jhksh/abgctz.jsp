<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','公路等级');
			tsdq('ddlTSDQ');
			var myDate = new Date();
			sbnf("sbnf");
			$('#sbnf').combobox("setValue",myDate.getFullYear());
			var jh={jhnf:$('#sbnf').combobox("getValue"),sbzt:'1',spzt:null,jh_sbthcd:4,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			//if(roleName()=="省级"){
				if(getParam("t")=='1'){
					jh.jh_sbthcd=4;
					jh.sbzt=null;
				}
				abgcxm_tz(jh,lx);
			/*}else{
				alert("只有省级用户才能查看审核中的计划信息");
			}*/
		});
		function searchAbgc(){
			var jh={jhnf:null,sbzt:null,spzt:null,jh_sbthcd:4,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:null,lxbm:null,qlmc:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				jh.jh_sbthcd=4;
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				jh.jh_sbthcd=6;
			}else{
				jh.sbzt='1';
				jh.jh_sbthcd=4;
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.lxjsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#ddlGldj').combobox('getText')!='全部'){
				lx.lxbm=$('#ddlGldj').combobox('getValue');
			}
			if($('#ddlTSDQ').combobox('getValue')!=''){
				lx.tsdq=$('#ddlTSDQ').combobox('getValue');
			}
			queryZjqf($('#sbnf').combobox("getValue"));
			querySumAbgcTz(jh,lx);
			abgcxm_tz(jh,lx);
		}
		function abgcxm_tz(jh,lx){
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
					"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
					"lx.lxbm":lx.lxbm,'lx.tsdq':lx.tsdq,'jh.jh_sbthcd':jh.jh_sbthcd};
			var grid={id:'grid',url:'../../../jhgl/queryAbgcTzList.do',pagination:true,rownumbers:false,
			    pageNumber:1,pageSize:10,height:$(window).height()-188,width:$('#searchField').width(),queryParams:params,
			    columns:[[
			        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
			        	var result="";
			        	result+='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>  ';
			        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
			        	//if(($.cookie("unit")=="36" && row.jh_sbthcd<=4))
			        	if(row.tzxz!="取消"){
			        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
			        	}else{
			        		result+='<span>编辑</span>';
			        	}
			        	//else
			        	//	result+='<a style="text-decoration:none;color:black;">编辑</a>';
			        	result+='  <a href="javascript:th('+"'"+row.id+"',"+"'"+row.tzxz+"'"+')" style="text-decoration:none;color:#3399CC;">退回</a>';
			        	return result;
			        }},
			        {field:'c4',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
			        	var result;
						if(row.spzt=='0'){
							var id="'"+row.id+"'";
							result='<a href="javascript:sp('+id+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
							result+='<a href="javascript:tuihhui('+id+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
						}
						else if(row.spzt=="1"){
							result="已审批";
						}
						return result;
			        }},
			        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
			        	if(row.sfylsjl=='无')
			        		return '无';
			        	else if(row.sfylsjl=='有')
			        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
			        }},
			        {field:'jhnf',title:'上报年份',width:80,align:'center'},
			        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
			        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
			        {field:'gydw',title:'管养单位',width:150,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.gydw;
						}
			        },
			        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.xzqhmc;
						}
			        },
			        {field:'lxbm',title:'路线编码',width:80,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.lxbm;
						}
			        },
			        {field:'lxmc',title:'路线名称',width:80,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.lxmc;
						}
			        },
			        {field:'qdzh',title:'起点桩号',width:60,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.qdzh;
						}
			        },
			        {field:'zdzh',title:'止点桩号',width:60,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.zdzh;
						}
			        },
			        {field:'yhlc',title:'隐患里程',width:60,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckabgc.yhlc;
						}
			        },
			        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
			    ]],
			    onClickRow:function(rowIndex,rowDate){
					if(oldIndex!=-1){
						gridObj.datagrid("unselectRow",oldIndex);
					}
					selRow.push(rowIndex);
					gridObj.datagrid("selectRow",rowIndex);
					oldIndex=rowIndex;
				},
				onLoadSuccess:function(data){
					querySumAbgcTz(jh,lx);
				}
			};
			gridBind(grid);
		}
		function querySumAbgcTz(jh,lx){
			var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
					"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
					"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
			$.ajax({
				type:'post',
				url:'../../../jhgl/querySumAbgcTz.do',
				data:param,
				dataType:'json',
				success:function(data){
					if(data.id>0){
						$('#lblCount').html(data.id);
						if(data.jckabgc.qzlc!=null && data.jckabgc.qzlc!="")
							$('#lblZLC').html(data.jckabgc.qzlc);
						if(data.jckabgc.yhlc!=null && data.jckabgc.yhlc!="")
							$('#lblYHLC').html(data.jckabgc.yhlc);
						if(data.pfztz!=null && data.pfztz!="")
							$('#lblZTZ').html(data.pfztz);
						if(data.jhsybbzje!=null && data.jhsybbzje!="")
							$('#lblBTZ').html(data.jhsybbzje);
						if(data.jhsydfzczj!=null && data.jhsydfzczj!="")
							$('#lblDFTZ').html(data.jhsydfzczj);
					}else{
						$('#lblCount').html("0");
						$('#lblZLC').html("0");
						$('#lblYHLC').html("0");
						$('#lblZTZ').html("0");
						$('#lblBTZ').html("0");
						$('#lblDFTZ').html("0");
					}
				}
			});
		}
		function tuihhui(id,jh_sbthcd){
			var jh={'jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':Number(jh_sbthcd)-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchAbgc();
			}
		}
		function dcExcel(){
			var param="lx.gydwbm="+getgydw("gydw")+"&lx.xzqhdm="+getxzqhdm('xzqh');
			param+="&jh.jhnf="+$('#sbnf').combobox("getValue");
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				param+="&jh.jh_sbthcd=4";
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				param+="&jh.jh_sbthcd=6";
			}else{
				param+="&jh.jh_sbthcd=4&jh.sbzt=1";
			}
			window.location.href="/jxzhpt/jhgl/exportExcelAbgcJhSh.do?"+param;
		}
		function openWindow(id){
			YMLib.Var.jhbm=id;
			YMLib.UI.createWindow('abgc_xx','安保工程',"/jxzhpt/page/jhgl/jhkxx/abgctz.jsp",'abgc_xx',1000,500);
		}
		function openEditWindow(id){
			YMLib.Var.jhbm=id;
			YMLib.UI.createWindow('abgc_edit','安保工程',"/jxzhpt/page/jhgl/edit/abgctz.jsp",'abgc_edit',1000,500);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function th(id,tzxz){
			$.ajax({
				type:'post',
				url:'../../../jhgl/tzTh.do',
				data:"jh.id="+id+"&jh.tzxz="+tzxz,
				dataType:'json',
				success:function(data){
					alert(data.result);
					if(data.result){
						alert("退会成功！");
						searchAbgc();
					}else{
						alert("退回失败！");
					}
				}
			});
		}
	</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库调整>&nbsp;安保工程项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 8px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
        						<td>管养单位：</td>
        						<td colspan="3" style="width:215px;"><select id="gydw" style="width:215px;"></select></td>
        						<td>行政区划：</td>
        						<td colspan="3" style="width:224px;"><select id="xzqh" style="width:224px;"></select></td>
        						<td>路线名称：</td>
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:100px;" /></td>
        					</tr>
        					<tr height="32">
        						<td>上报年份：</td>
        						<td><select id="sbnf" style="width: 75px;"></select></td>
        						<td>审批状态：</td>
        						<td><select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:70px;">
									<option selected="selected" value="">全部</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select></td>
								<td>特殊地区：</td>
								<td><select name="ddlTSDQ" class="easyui-combobox" id="ddlTSDQ" style="width:80px;"></select></td>
								<td>技术等级：</td>
								<td><select name="ddlPDDJ" class="easyui-combobox" id="ddlPDDJ" style="width:65px;"></select></td>
								<td>公路等级：</td>
								<td><select name="ddlGldj" class="easyui-combobox" id="ddlGldj" style="width:104px;"></select></td>
								<td>是否有补助历史：</td>
								<td><select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select></td>
        					</tr>
        					<tr height="32">
                              	<td colspan="10">
        							<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchAbgc()" style="vertical-align:middle;padding-left: 10px;"/>
        							<img alt="导出Excel" onclick="dcExcel()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
                             	</td>
                           	</tr>
        				</table>
        			</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安保工程项目，
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
	
	<div id="abgc_sh" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
