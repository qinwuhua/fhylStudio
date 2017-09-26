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
			loadBmbm2('ddlGldj','行政等级');
			tsdq('tsdq');
			sbnf("sbnf");
			var jh={jhnf:$('#sbnf').combobox('getValue'),sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			if($.cookie("unit2").length==7 || $.cookie("unit2").length==2){
				$('#imglrjh').show();
			}
			querySumZhfz(jh,lx);
			zhfzxm1(jh,lx);
		});
		function searchZhfz(){
			var jh={jhnf:null,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:null,lxbm:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				var xian=true;
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
					xian=false;
				}
				if($('#ddlSHZT').combo("getValue")=="未上报"){
					if(xian){
						jh.jh_sbthcd=0;
					}else{
						jh.jh_sbthcd=2;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.lxjsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#ddlGldj').combobox('getText')!='全部'){
				lx.lxbm=$('#ddlGldj').combobox('getValue');
			}
			if($('#tsdq').combobox('getValue')!=''){
				lx.tsdq=$('#tsdq').combobox('getValue');
			}
			querySumZhfz(jh,lx);
			zhfzxm1(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function zhfzxm1(jh,lx){
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
					"lx.lxbm":lx.lxbm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
			
			var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
				pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
			    columns:[[
			        {field:'ck',checkbox:true},
			        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
			        	var result="";
			        	result+='<a href="javascript:locationXm1('+"'"+row.jckzhfz.lxbm+"',"+"'"+row.jckzhfz.qdzh+"',"+"'"+row.jckzhfz.zhzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
			        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
			        
			        	return result;
			        }},
			      
			        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
			        	if(row.sfylsjl=='无')
			        		return '无';
			        	else if(row.sfylsjl=='有')
			        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'zhfz'"+",'灾害防治历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
			        }},
			        {field:'sbnf',title:'上报年份',width:80,align:'center'},
			        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
			        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
			        {field:'gydw',title:'管养单位',width:150,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.gydw;
						}
			        },
			        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.xzqhmc;
						}
			        },
			        {field:'lxbm',title:'路线编码',width:80,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.lxbm;
						}
			        },
			        {field:'lxmc',title:'路线名称',width:80,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.lxmc;
						}
			        },
			        {field:'qdzh',title:'起点桩号',width:60,align:'center',
			        	formatter : function(value, row, index) {
							return row.jckzhfz.qdzh;
						}
			       },
			        {field:'zdzh',title:'止点桩号',width:60,align:'center',
			    	   formatter : function(value, row, index) {
							return row.jckzhfz.zdzh;
						}
			    	},
			        {field:'jsgm',title:'建设规模',width:60,align:'center',
			    		formatter : function(value, row, index) {
							return row.jckzhfz.yhlc;
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
					querySumZhfz(jh,lx);
				}
			};
			gridBind(grid);
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
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;灾害防治项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
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
        						<td>项目状态：</td>
        						<td><select name="ddlXMtype" id="ddlXMtype" style="width:104px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="待上报">待上报</option>
									<option value="已上报">已上报</option>
									<option value="已入库">已入库</option>
									<option value="已下达">已下达</option>
								</select></td>
        						<td align="right">路线名称：</td>
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:100px;" /></td>
        					</tr>
        					<tr height="32">
        						<td>上报年份：</td>
        						<td><select id="sbnf" style="width: 75px;"></select></td>
        						<td>计划状态：</td>
        						<td><select name="ddlSHZT" id="ddlSHZT" style="width:70px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select></td>
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:75px;" class="easyui-combobox"></select></td>
								<td>技术等级：</td>
								<td><select name="ddlPDDJ" id="ddlPDDJ" style="width:65px;" class="easyui-combobox"></select></td>
								<td>原行政等级：</td>
								<td><select name="ddlGldj" id="ddlGldj" style="width:104px;" class="easyui-combobox"></select></td>
								<td>补助历史：</td>
								<td><select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select></td>
        					</tr>
        					<tr height="32">
                              <td colspan="10">
        								<img onclick="searchZhfz()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
<%-- 										<img onclick="exportModule('Plan_Disaster')" alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/> --%>
<%-- 										<img onclick="importData_jh('zhfz_jh')" alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> --%>
<%-- 				                        <img onclick="dropZhfzs()" alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" style="vertical-align:middle;"> --%>
				                        <img onclick="exportExcel('zhfz')" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
                                		<!-- <img id="imglrjh" alt="列入计划" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/lrjh_2.png'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/lrjh_1.png'" src="${pageContext.request.contextPath}/images/Button/lrjh_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;display:none;"  onclick="showLrjh('lrjh_zh.jsp','1100','500');"/> -->
                                	</td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left; padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个灾害防治项目，
        			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
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
	
	<!-- <div id="zhfz_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
	<div id="zhfz_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
