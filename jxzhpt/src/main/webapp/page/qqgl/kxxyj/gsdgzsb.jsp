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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_abxm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/kxxyj/js/kxxyj.js"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script> --%>
	<script type="text/javascript">
		$(function(){
			tsdqdx("tsdq");
			if($.cookie("unit2").length!=7)
			$("img[name='bxs']").attr('style','display:none');
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('jsjsdj','技术等级');
			loadGldj('gldj');
			//tsdq("tsdq");
			//xmnf("xmnf");
			urlxmnf("xmnf",getUrlParame('id'));
			gsdxmlx('xmlx');
			setTimeout("showAllgsd()",'1700');
		});
		function showAllgsd(){
			
			showkxxTjxx('gsdgz');
			/* var gydw=$("#gydw").combotree("getValues");
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
			} */
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
			
			var xmmc=$("#xmmc").val();
			var xmnf=$("#xmnf").combobox('getValues').join(",");
			
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var jsdj=$("#jsdj").combobox('getValues').join(",");
			var jsjsdj=$("#jsjsdj").combobox('getValues').join(",");
			var gldj=$("#gldj").combobox('getValues').join(",");
			var lsjl=$("#lsjl").combobox('getValue');
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			var sbzt=$("#sbzt").combobox('getValue');
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/qqgl/selectgsdkxList.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-160,
			    width:$(window).width()-30,
			    queryParams: {
			    	lsjl:lsjl,
			    	xzqh:xzqhstr,
			    	//gydw:gydwstr,
			    	xmmc:xmmc,
					xmnf:xmnf,
					sbzt:sbzt,
					tsdq:tsdq,
					jsdj:jsdj,
					jsjsdj:jsjsdj,
					gldj:gldj,
					ghlxbm:$("#ghlxbm").val(),
					ghlxmc:$("#ghlxmc").val(),
					'lxsh.ghlxbh':$("#lxbm").val(),
					'lxsh.xmlx1':xmlx,
					'lxsh.lxmc':$("#lxmc").val()
				},
			    columns:[[
			        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
			        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
			        	//if(row.sbzt1=='1')
			        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    ';
			        	if($.cookie("unit2").length!=7)
			        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    ';

			        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    ';
			        }},
			        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
			        	if(row.sbzt1=='0'){
// 			        		if($.cookie("unit2").length!=7)
			        			return '未审核';
// 			        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
			        	}else if(row.sbzt1=='1')
			        		return '已审核';
			        }},
			        {field:'lsjl',title:'历史记录',width:60,align:'center',
						formatter: function(value,row,index){
							if(value=="是"){
								return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
							}else{
								return value;
							}
						}
					},
			        
				    {field : 'gydw',title : '管养单位',width : 120,align : 'center'},
				    {field : 'xzqh',title : '行政区划',width : 60,align : 'center'},
				    {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
						formatter: function(value,row,index){
			        		if(Number(row.xmsl)>1){
			        			return '<label style="color:red;">'+value+'</label>';
			        		}else{
			        			return value;
			        		}
			        	}
			        },
			        {field : 'JSZLC',title : '里程',width : 60,align : 'center',
			        	formatter: function(value,row,index){
			        		if(row.xmbm.substr(10,1)=='1'){
			        			return row.jszlc;
			        		}else{
			        			return row.lc;
			        		}
			        	}
				    },
				    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
				    {field : 'xmbm',title : '项目编码',width : 100,align : 'center'},
				    {field : 'lxbh',title : '路线编号',width : 60,align : 'center'},
				    {field : 'qdzh',title : '起点桩号',width : 80,align : 'center'},
				    {field : 'zdzh',title : '止点桩号',width : 80,align : 'center'},
				    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'},
				    {field : 'kgny',title : '开工年月',width : 80,align : 'center'},
				    {field : 'wgny',title : '完工年月',width : 80,align : 'center'},
				    {field : 'tz',title : '投资',width : 60,align : 'center'},
				    {field : 'tsdq',title : '特殊地区',width : 100,align : 'center'}
			    ]],
				view: detailview,
				detailFormatter:function(index,row){   
			        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
			    },
			    onExpandRow: function(index,row){
			    	$('#table_lx'+row.xmbm).datagrid({
			    		url:'/jxzhpt/qqgl/selectlxList.do',
			    		 queryParams: {
			    			 'lx.jdbs':1,
			    			 'lx.xmid':row.xmbm,
			    			 'lx.sffirst':'1'
			    			},
		    			columns:[[
							{field:'cz',title:'操作',width:150,align:'center',
								formatter: function(value,row,index){
									return '<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
								}
							},
		    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
		    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
		    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
		    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
		    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
		    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
		    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
		    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
		    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
		    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
		    			    {field:'lc',title:'里程',width:60,align:'center'}
		    			]]
			    	});
			    }   
			}); 
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
		<div id="p_top">前期管理>&nbsp;工程可行性研究审核>&nbsp;改建工程项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-top: 10px;height: 100px;">
        			<fieldset id="searchField" style="width:99%; text-align: left; vertical-align: middle;height: 130px;padding-bottom:10px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
								<tr height="32">
	        						<!-- <td>管养单位：</td>
	        						<td colspan="3" style="width:220px;"><select id="gydw" style="width:220px;"></select></td> 
	        						<td>行政区划：</td>
	        						<td colspan="3" style="width:220px;"><select id="xzqh" style="width:220px;"></select></td>
	        						<td>项目名称：</td>
	        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
	        						<td>原路线编码：</td>
	        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
	        						<td>审核状态：</td>
	        						<td><select id="sbzt" style="width:80px;" class="easyui-combobox">
										<option selected="selected" value="">全部</option>
										<option value="0">未审核</option>
										<option value="1">已审核</option> 
									</select></td>-->
									<td>行政区划：</td>
	        						<td colspan="3" style="width:220px;"><select id="xzqh" style="width:220px;"></select></td>
	        						<td>项目名称：</td>
	        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
	        						<td>建设技术等级：</td>
									<td><select name="jsdj" id="jsdj" style="width:65px;" class="easyui-combobox"></select></td>
									<td>现技术等级：</td>
									<td><select name="jsjsdj" id="xjsjsdj" style="width:65px;" class="easyui-combobox"></select></td>
									 <td>项目年份：</td>
	        						<td><select id="xmnf" style="width:70px;">
									</select></td>
									<td>行政等级：</td>
									<td><select name="gldj" id="gldj" style="width:90px;" class="easyui-combobox"></select></td>
	        					</tr>
	        					<tr height="32">
	        						
									<!-- <td>项目年份：</td>
	        						<td><select id="xmnf" style="width:70px;">
									</select></td>
        							<td>技术等级：</td>
									<td><select name="jsjsdj" id="jsjsdj" style="width:65px;" class="easyui-combobox"></select></td>
									<td>建设技术等级：</td>
									<td><select name="jsdj" id="jsdj" style="width:65px;" class="easyui-combobox"></select></td>
									
									<td>行政等级：</td>
									<td><select name="gldj" id="gldj" style="width:90px;" class="easyui-combobox"></select></td>
	        						<td>是否有历史记录：</td>
	        						<td><select id="lsjl" style="width:80px;" class="easyui-combobox">
										<option selected="selected" value="">全部</option>
										<option value="是">是</option>
										<option value="否">否</option>
									</select></td> -->
									<td>原路线编码：</td>
	        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
									<td>原路线名称：</td>
	        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
	        						<td>规划路线编码：</td>
	        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
	        						<td>规划路线名称：</td>
	        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
	        						<td>是否有补助历史：</td>
	        						<td><select id="lsjl" style="width:80px;" class="easyui-combobox">
										<option selected="selected" value="">全部</option>
										<option value="是">是</option>
										<option value="否">否</option>
									</select></td> 
	        						<td>特殊地区：</td>
									<td><select name="tsdq" id="tsdq" style="width:88px;" >
									</select></td>
	        					</tr>
	        					<tr height="32">
	        						<!-- <td>原路线名称：</td>
	        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
	        						<td>建设性质：</td>
									<td><select name="xmlx" id="xmlx" style="width:100px;" ></select></td>
	                               	<td>规划路线编码：</td>
	        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
	        						<td>规划路线名称：</td>
	        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
	                              	<td>特殊地区：</td>
									<td><select name="tsdq" id="tsdq" style="width:88px;" >
									</select></td> -->
	                              	<td>审核状态：</td>
	        						<td><select id="sbzt" style="width:80px;" class="easyui-combobox">
										<option selected="selected" value="">全部</option>
										<option value="0">未审核</option>
										<option value="1">已审核</option> 
									</select></td>
	                            </tr>
	                            <tr height="32">
	                            	<td colspan="10">
	        						<img onclick="showAllgsd()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
	        						<img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif"  onclick="dckxxModule('gsdgz');" style="border-width:0px;cursor: hand;vertical-align:middle;" />
	<!--         					<img onclick="dckxxModule('gsdgz');" name="bxs" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" /> -->
									</td>
	                            </tr>
	                        </table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
<!--         	<tr> -->
<!--         		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;"> -->
<!--         			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个安保工程项目， -->
<!--         			总里程共【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里， -->
<!--         			隐患里程共【&nbsp;<span id="lblYHLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】公里， -->
<!--         			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元， -->
<!--         			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元， -->
<!--         			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。 -->
<!--         		</td> -->
<!--         	</tr> -->
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
            		<div>
            			<table id="datagrid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<!-- <div id="abgc_xx" style="text-align: left;font-size: 12px;width:80%;"></div> -->
	<div id="abgc_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>
