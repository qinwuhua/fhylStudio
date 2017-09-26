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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_wqgz.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','行政等级');
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
				querySumWqgz(jh,lx);
				wqxm_sh1(jh,lx);
			/*}else{
				alert("只有省级用户才能查看审核中的计划信息");
			}*/
		});
		function searchWqgz(){
			var jh={jhnf:$('#sbnf').combobox("getValue"),sbzt:null,spzt:null,jh_sbthcd:4,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:null,lxbm:null,qlmc:null,qlbh:null,akjfl:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			if($('#sbnf').combobox('getValue')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				jh.jh_sbthcd=4;
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				jh.jh_sbthcd=6;
			}else{
				jh.jh_sbthcd=4;
				jh.sbzt='1';
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.lxjsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#ddlGldj').combobox('getText')!='全部'){
				lx.lxbm=$('#ddlGldj').combobox('getValue');
			}
			if($('#ddlAKJFL').combobox('getText')!="全部"){
				lx.akjfl=$('#ddlAKJFL').combobox('getValue');
			}
			queryZjqf($('#sbnf').combobox("getValue"));
			querySumWqgz(jh,lx);
			wqxm_sh1(jh,lx);
		}
		function spBatch(){
			var jh={sbnf:$('#sbnf').combobox("getValue"),sbzt:'1',spzt:null,jh_sbthcd:4};
			var lx={gydw:$('#gydw').combobox('getText'),gydwbm:getgydw($.cookie("unit")),
					xzqhmc:$('#xzqh').combobox('getText'),xzqhdm:getxzqhdm('xzqh'),
					lxmc:null,lxjsdj:null,lxbm:null,qlmc:null,akjfl:null
			};
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,
					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,'jh.jh_sbthcd':jh.jh_sbthcd};
			$.ajax({
				type:'post',
				async:false,
				url:'../../../jhgl/editWqgzStatusBatch.do',
				data:params,
				dataType:'json',
				success:function(data){
					if(data.result){
						alert("全部审批成功！");
						searchWqgz();
					}
				}
			});
		}
		function sp(id,jh_sbthcd){
			var date=new Date();
			var sbsj=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
				" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			var jh={'jh.id':id,'jh.spsj':sbsj,'jh.spbmdm':$.cookie("unit"),'jh.spzt':'1',
					'jh.jh_sbthcd':jh_sbthcd+2};
			if(editStatus(jh)){
				alert("审批成功！");
				searchWqgz();
			}
		}
		function tuihui(id,jh_sbthcd){
			var jh={'jh.id':id,'jh.sbzt':'0','jh.jh_sbthcd':jh_sbthcd-2};
			if(editStatus(jh)){
				alert("成功将计划退回！");
				searchWqgz();
			}
		}
		function dcExcel(){
			var param="lx.gydwbm="+getgydw("gydw")+"&lx.xzqhdm="+getxzqhdm('xzqh');
			param+="&jh.sbnf="+$('#sbnf').combobox("getValue");
			if($('#ddlSHZT').combobox('getValue')=="未审核"){
				param+="&jh.jh_sbthcd=4";
			}else if($('#ddlSHZT').combobox('getValue')=="已审核"){
				param+="&jh.jh_sbthcd=6";
			}else{
				param+="&jh.jh_sbthcd=4&jh.sbzt=1";
			}
			
			window.location.href="/jxzhpt/jhgl/exportExcelWqgzJhSh.do?"+param;
		}
		function importWqtzSh(){
			var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page : '/jxzhpt/js/uploader/upload.jsp?url='+"/jxzhpt/jhgl/importWqgzJhSh.do"+'&flag='+"wqgzjhsh",
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
			weatherDlg.ShowDialog();
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		
		function wqxm_sh1(jh,lx){
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
					'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
					"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.qlbh":lx.qlbh,"lx.akjfl":lx.akjfl};
			var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
				    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
				    columns:[[
				        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				        	var result='<a href="javascript:locationQl('+"'"+row.jckwqgz.qlbh+"',"+"'"+row.jckwqgz.qlzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
				        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				        	
				        	return result;
				        }},
				        
				        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
				        	if(row.sfylsjl=='无')
				        		return '无';
				        	else if(row.sfylsjl=='有')
				        		return '有';
				        }},
				        {field:'sbnf',title:'上报年份',width:80,align:'center'},
				        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				        {field:'gydwbm',title:'交通局/公路局',width:150,align:'center',
				        	formatter:function(value, row, index){
				        		return row.jckwqgz.gydwbm.substring(0,1)=="1" ? "交通局" : "公路局";
				        	}
				        },
				        {field:'gydw',title:'管养单位',width:150,align:'center',
				        	formatter:function(value, row, index){
				        		return row.jckwqgz.gydw;
				        	}
				        },
				        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
				        	formatter:function(value, row, index){
				        		return row.jckwqgz.xzqhmc;
				        	}
				        },
				        {field:'lxbm',title:'路线编码',width:80,align:'center',
				        	formatter:function(value,row,index){
					        	return row.jckwqgz.lxbm;
				        	}
				        },
				        {field:'lxmc',title:'路线名称',width:80,align:'center',
				        	formatter:function(value,row,index){
					        	return row.jckwqgz.lxmc;
				        	}
				        },
				        {field:'qlbm',title:'桥梁编码',width:60,align:'center',
				        	formatter:function(value,row,index){
					        	return row.jckwqgz.qlbh;
				        	}
				       },
				       {field:'qlmc',title:'桥梁名称',width:60,align:'center',
				    	   formatter:function(value,row,index){
				    		   return row.jckwqgz.qlmc;
				    	   }
				       },
				       {field:'scqlqc',title:'审查桥梁全长',width:60,align:'center',
				    	   formatter:function(value,row,index){
				    		   return row.jckwqgz.scqlqc;
				    	   }
				       },
				       {field:'scqlqk',title:'审查桥梁全宽',width:60,align:'center',
				    	   formatter:function(value,row,index){
				    		   return row.jckwqgz.scqlqk;
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
						querySumWqgz(jh,lx);
					}
			};
			gridBind(grid);
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
		<div id="p_top">计划管理>&nbsp;项目计划库审核>&nbsp;危桥改造项目</div>
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
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:90px;" /></td>
        						<td>桥梁名称：</td>
        						<td><input name="txtBridge" type="text" id="txtBridge" style="width:90px;" /></td>
        					</tr>
        					<tr height="32">
        						<td>上报年份：</td>
        						<td><select id="sbnf" style="width:75px;"></select></td>
        						<td>上报状态：</td>
        						<td><select name="ddlSHZT" class="easyui-combobox" id="ddlSHZT" style="width:70px;">
									<option selected="selected" value="">全部</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select></td>
								<td>特殊地区：</td>
								<td><select name="ddlTSDQ" class="easyui-combobox" id="ddlTSDQ" style="width:80px;">
								</select></td>
								<td>技术等级：</td>
								<td><select name="ddlPDDJ" class="easyui-combobox" id="ddlPDDJ" style="width:65px;">
								</select></td>
								<td>原行政等级：</td>
								<td><select name="ddlGldj" class="easyui-combobox" id="ddlGldj" style="width:94px;">
								</select></td>
								<td>跨径分类：</td>
        						<td><select name="ddlAKJFL" class="easyui-combobox" id="ddlAKJFL" style="width:94px;">
									<option selected="selected" value="">全部</option>
									<option value="特大桥">特大桥</option>
									<option value="大桥">大桥</option>
									<option value="中桥">中桥</option>
									<option value="小桥">小桥</option>
								</select></td>
        					</tr>
							<tr height="32">
                              <td colspan="10">
								<span>补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select>
								<span>桥梁编码：</span>
        						<input name="txtRoad" type="text" id="txtqlbm" style="width:80px;" />
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" style="vertical-align:middle;padding-left: 10px;"/>
<%--         						<img name="shenPi" id="shenPi" onclick="spBatch()" src="${pageContext.request.contextPath}/images/Button/qbsp1.png" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qbsp2.png'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qbsp1.png'" style="vertical-align:middle;padding-left: 3px;"/> --%>
        						<img alt="导出Excel" onclick="dcExcel()" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
<!--         						<img id="drExcel" onclick="importWqtzSh()" alt="导入" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
							</td>
                                </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个危桥改造项目，
        			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left:10px;font-size:12px;">
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<div id="wqgz_xx" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
