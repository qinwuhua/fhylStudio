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
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_gcgj.js"></script>
	
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('yjsdj','技术等级');
			loadBmbm2('gldj','行政等级');
			loadBmbm2('add_yjsdjxx','技术等级');
			tsdq('tsdq');
			sbnf("sbnf");
			var jh={sbnf:$("#sbnf").combo("getValue"),sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwdm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			querySumGcgj(jh,lx);
			gclmgjxm(jh,lx);
			loadJhzt('jhzt');
		});
		function searchGcgj(){
			var jh={jhnf:null,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwdm:getgydw("gydw"),lxmc:null,xzqhdm:getxzqhdm('xzqh'),yjsdj:null,lxbm:null};
			if($("#sbnf").combo("getValue")!=""){
				jh.sbnf=$("#sbnf").combo("getValue");
			}
			if($('#txtlxmc').val()!=""){
				lx.lxmc=$('#txtlxmc').val();
			}
			if($("#yjsdj").combo("getValue")!=""){
				lx.yjsdj= $("#yjsdj").combo("getValue");
			}
			if($("#gldj").combo("getValue")!=""){
				lx.lxbm=$("#gldj").combo("getValue");
			}
			if($('#tsdq').combo("getValue")!=''){
				lx.tsdqbm=$('#tsdq').combo("getValue");
			}
			if($('#jhzt').combo("getValue")!="" && $('#jhzt').combo("getValue")!='全部'){
				if(roleName()=="县级"){
					if($('#jhzt').combo("getValue")=="未上报"){
						jh.jh_sbthcd=0;
					}else if($('#jhzt').combo("getValue")=="已上报"){
						jh.jh_sbthcd=2;
					}else if($('#jhzt').combo("getValue")=="未审核"){
						jh.jh_sbthcd=4;
					}else if($('#jhzt').combo("getValue")=="已审核"){
						jh.jh_sbthcd=6;
					}
				}
				if(roleName()=="市级"){
					if($('#jhzt').combo("getValue")=="待上报"){
						jh.jh_sbthcd=0;
					}else if($('#jhzt').combo("getValue")=="未上报"){
						jh.jh_sbthcd=2;
					}else if($('#jhzt').combo("getValue")=="已上报"){
						jh.jh_sbthcd=4;
					}else if($('#jhzt').combo("getValue")=="已审核"){
						jh.jh_sbthcd=6;
					}
				}
				if(roleName()=="省级"){
					if($('#jhzt').combo("getValue")=="未上报"){
						jh.spzt="0";
						jh.jh_sbthcd="0";
					}else if($('#jhzt').combo("getValue")=="未审核"){
						jh.jh_sbthcd=4;
					}else if($('#jhzt').combo("getValue")=="已审核"){
						jh.jh_sbthcd=6;
					}
				}
			}
			querySumGcgj(jh,lx);
			gclmgjxm(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		function addlx(){
			var row=gridObj.datagrid('getSelected');
			var lx={'lx.lxmc':$('#add_lxmc').val(),'lx.lxbm':$('#add_lxbm').val(),
					'lx.xzqhdm':$('#add_xzqh').combo("getValue"),'lx.xzqhmc':$('#add_xzqh').combo("getText"),
					'lx.jsdd':$('#add_jsdd').val(),'lx.gydw':$('#add_gydwxx').combo("getText"),
					'lx.gydwdm':$('#add_gydwxx').combo("getValue"),'lx.bhnr':$('#add_bhnr').val(),
					'lx.qdzh':$('#add_qdzh').val(),'lx.zdzh':$('#add_zdzh').val(),
					'lx.qzlc':$('#add_qzlc').val(),'lx.yhlc':$('#add_yhlc').val(),
					'lx.ylmlx':$('#add_ylmlx').val(),'lx.yjsdj':$('#add_yjsdjxx').combo('getValue'),
					'lx.jhid':row.id,'lx.tbbmbh':$.cookie("unit"),'jh.sbnf':row.sbnf};
			$.ajax({
				type:'post',
				url:'../../../jhgl/insertGcgjLx.do',
				data:lx,
				dataType:'json',
				success:function(data){
					if(data.result=="true"){
						alert("路线添加成功！");
						location.replace(location.href);
					}else{
						alert(data.msg);
					}
				}
			});
		}
		function exportExcel_gcgj(){
			var param="jh.jh_sbthcd="+"&jh.sbzt="+"&jh.spzt="+"&lx.gydwbm="+getgydw("gydw");
			window.location.href="/jxzhpt/jhgl/exportGcgjZjxdExcel.do?"+param;
		}
		function addLmsj(){
			YMLib.UI.createWindow('add_lmgj','添加路面改建',"/jxzhpt/page/jhgl/add/lmgjAdd.jsp",'addlmgj',980,500);
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;工程改造路面改建项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
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
        						<input name="txtRoad" type="text" id="txtlxmc" style="width:100px;" />
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<span>上报年份：</span>
        						<select id="sbnf" style="width: 80px;"></select>
        						<span>&nbsp;计划状态：</span>
        						<select id="jhzt" class="easyui-combobox" name="dept" style="width: 70px;">
								</select>
								<span>&nbsp;特殊地区：</span>
								<select name="tsdq" id="tsdq" class="easyui-combobox" style="width:80px;"></select>
								<span>&nbsp;技术等级：</span>
								<select name="yjsdj" id="yjsdj" class="easyui-combobox" style="width:65px;"></select>
								<span>&nbsp;原行政等级：</span>
								<select name="gldj" id="gldj" class="easyui-combobox" style="width:104px;"></select>
								<span>&nbsp;补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="否">否</option>
									<option value="是">是</option>
								</select>
        					</p>
        					<p style="margin:8px 0px 4px 20px;">
        						<img onclick="searchGcgj()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        						<img onclick="exportGj('Plan_LuM')" alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        						<img onclick="addLmsj()" name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src="" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        						<img  onclick="importData_jh('gcgj_jh')" alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
        						<img  onclick="dropGcgjs()" alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" style="vertical-align:middle;">
        						<img onclick="exportExcel_gcgj()" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			 共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			 个路面改建项目，总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里，
        			 隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里；
        			 批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			 其中中央车购税【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			 省投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
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
	<!-- <div id="add_lx" class="easyui-dialog" title="添加路线" style="width:800px;height:300px;"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
       		<tr style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	工程改造路面改建路线信息
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="background-color:#F1F8FF;padding-right:5px;color:#007DB3;font-weight:bold;font-size:small;text-align:right;border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;">
                	路线名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <input id="add_lxmc" type="text"/>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	路线编码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <input id="add_lxbm" type="text"/>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	建设地点
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <input id="add_jsdd" type="text"/>
                </td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                	起点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <input id="add_qdzh" type="text"/>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	止点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <input id="add_zdzh" type="text"/>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                	起止里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <input id="add_qzlc" type="text" style="width:60px;"/>公里
                </td>
            </tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管养单位
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<select id="add_gydwxx" style="width:125px;"></select>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					行政区划
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<select id="add_xzqh" style="width:125px;"></select>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					隐患里程
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="add_yhlc" type="text" style="width:60px;"/>公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;padding-right:5px;color:#007DB3;font-weight:bold;font-size:small;text-align:right;border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;">
                	原技术等级
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <input id="add_yjsdjxx" type="text"/>
                </td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路面类型
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="add_ylmlx" type="text"/>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					病害内容
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="add_bhnr" style="width: 400px;height: 40px;"></textarea> &nbsp;
				</td>
			</tr>
			<tr style="height: 30px;" align="center">
				<td colspan="6" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: center; padding-left: 10px;">
					<img onclick="addlx()" alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " />
					<!-- <input onclick="addlx()" type="button" value="添    加" style="width: 80px;text-align: center;" /> -->
				</td>
			</tr>
		</table>
	</div>
	<!-- <div id="gclmgj_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
</body>
</html>
