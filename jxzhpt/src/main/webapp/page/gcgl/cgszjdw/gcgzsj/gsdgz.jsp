<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/SimpleCanleder.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/SimpleCanleder.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/gcgzsj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadDist1("xzqh",$.cookie("dist"));
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','行政等级');
			gsdxmlx('xmlx');
			tsdq('ddlTSDQ');
			$('#ddlMonth').simpleCanleder();
			$('#ddlMonth').val(y+"-"+m);
			//gcglxmnf("ddlYear");
			var urlid=getUrlParame('id');
			urlxmnf("ddlYear",urlid);
			showGsd();
		});
		
		function showGsd(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
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

			var jgzt='';
			var kgzt='';
			var xmnf=$("#ddlYear").combobox('getValues').join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var bfyf=$("#ddlMonth").val();
			var lxmc=$("#lxmc").val();
			$('#datagrid').datagrid({    
			    url:'../../../../gcgl/selectgsdgzListbf.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-195,
			    width:$(window).width()-$(window).width()*0.019,
			    queryParams: {
			    	gydw: xzqhstr,
			    	kgzt: kgzt,
			    	jgzt:jgzt,
			    	lxmc:lxmc,
			    	ybzt:'',
			    	sfsj:7,
			    	xmnf:xmnf,
			    	bfyf:bfyf,
			    	bfzt:$("#bfzt").val(),
			    	'gcglgcgzsj.jsdj':$("#ddlPDDJ").combobox('getValue'),
			    	'gcglgcgzsj.lxbm':$("#lxbm").val(),
//			    	'gcglgcgzsj.xdsj':$("#xdnf").val(),
			    	'gcglgcgzsj.xmmc':$("#xmmc").val(),
			    	'gcglgcgzsj.lxmc':$("#lxmc").val(),
			    	'gcglgcgzsj.gldj':$("#ddlGldj").combobox('getValue'),
			    	'gcglgcgzsj.tsdq':$("#ddlTSDQ").combobox('getText'),
			    	'gcglgcgzsj.xmlx1':xmlx,
			    	'gcglgcgzsj.ljbfzt':$("#ljbfzt").combobox('getValue')
				},
			    columns:[[
			         {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		  				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>     '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
		  			}},
		  			 {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
		  	        	if(row.SL!=1)
		  	        		return '<font color="red">'+row.XMMC+'</font>';
		  	        	else return  row.XMMC;	
		  	        }},
					{field : 'XMBM',title : '项目编码',width : 120,align : 'center'},
					{field : 'XZQH',title : '行政区划',width : 180,align : 'center'},
					
					{field : 'QDZH',title : '起点桩号',width : 100,align : 'center'},
					{field : 'ZDZH',title : '止点桩号',width : 100,align : 'center'},
					{field:'KGSJ',title:'计划开工时间',width:150,align:'center'},
					{field:'WGSJ',title:'计划完工时间',width:150,align:'center'},
					{field:'GQ',title:'工期（月）',width:100,align:'center'},
			        {field:'XDZJ',title:'已下达计划(万元)',width:120,align:'center'},
			        {field:'BFZJ',title:'已拨付资金(万元)',width:120,align:'center'},
					{field:'GKPFWH',title:'工可批复文号',width:100,align:'center'},
					{field:'SJPFWH',title:'设计批复文号',width:100,align:'center'}
					]],
					view: detailview,
					detailFormatter:function(index,row){   
					return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
					},
					onExpandRow: function(index,row){
					$('#table_lx'+index).datagrid({
						url:'/jxzhpt/qqgl/selectSjgzlxList.do',
						 queryParams: {
							 	jdbs:2,
						    	xmbm:row.XMBM
							},
						columns:[[
						    {field:'gydw',title:'管养单位',width:150,align:'center'},    
						    {field:'xzqh',title:'行政区划',width:150,align:'center'},
						    {field:'lxmc',title:'路线名称',width:120,align:'center'},
						    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
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
		
		
		
		function exportAbyb(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
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
		
			var jgzt='';
			var kgzt='';
			var lxmc=$("#lxmc").val();
			var myDate = new Date();
			var y=$("#ddlYear").val();
			var m=$("#ddlMonth").val();    //获取当前月份(0-11,0代表1月)
			var sbyf=m;
			var data="jgzt="+jgzt+"&kgzt="+kgzt+"&lxmc="+lxmc+"&sbyf="+sbyf+"&tbr="+$.cookie("truename")+"&xmnf="+y
			+"&bfzt="+$("#bfzt").val()+
	    	'&gcglabgc.jsdj='+$("#ddlPDDJ").combobox('getValue')+
	    	'&gcglabgc.gldj='+$("#ddlGldj").combobox('getValue')+
	    	'&gcglabgc.lxbm='+$("#lxbm").val()+
	    	'&gcglabgc.xmmc='+$("#xmmc").val()+
	    	'&gcglabgc.lxmc='+$("#lxmc").val()+
	    	'&gcglabgc.xmlx1='+xmlx+
	    	'&gcglabgc.tsdq='+$("#ddlTSDQ").combobox('getText')+
	    	'&gcglabgc.ljbfzt='+$("#ljbfzt").combobox('getValue');
			
			$.post('/jxzhpt/gcgl/exportsjyb_set.do',{gydw:xzqhstr} ,function(){
				window.location.href="/jxzhpt/gcgl/exportgsdyb.do?"+data;
			    });
		}
		function importData_yb(flag){
			var weatherDlg = new J.dialog( {
				id : 'id4',
				title : '车购税信息导入',
				page : '../../upload.jsp?url='+"/jxzhpt/gcgl/insertCGS2.do"+'&flag='+flag,
				width : 570,
				height : 440,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
			weatherDlg.ShowDialog();
			return false;
		}
	</script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
 cursor: pointer;
}
a:active {
 text-decoration: none;
}
-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
			<div id="righttop">
						<div id="p_top">当前位置>&nbsp;资金拨付>&nbsp;<span id="astext">资金拨付</span>>&nbsp;<span id="bstext"></span>>&nbsp;国省道改造项目</div>
					</div>
	            
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.7%; text-align: left; vertical-align: middle;margin: 1% 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 1% 0% 1% 2%;">
        						<span>行政区划：</span>
        						<input id="xzqh" style="width: 150px;">
        						<span>下达年份：</span> 
        						<select name="ddlYear" id="ddlYear" style="width: 68px;">
        						<option value="">全部</option>
        						</select>
        						<span>拨付月份：</span> <input name="ddlMonth"
									id="ddlMonth" style="width: 60px;">
								<span>拨付状态：</span> <select id=bfzt
									style="width: 50px;">
									<option value="">全部</option>
									<option>已拨付</option>
									<option>未拨付</option>
								</select> 
								<span>路线名称：</span>
        							<input type="text" id="lxmc" style="width: 138px;">
								</p>
								   <p style="margin: 1% 0% 1% 2%;">
								<span style=" vertical-align:middle;">&nbsp;技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" style="width:70px; vertical-align:middle;"></select>
								<span style=" vertical-align:middle;">&nbsp;行政等级：</span>
								<select name="ddlGldj" id="ddlGldj" style="width:70px; vertical-align:middle;"></select>
        						<span style=" vertical-align:middle;">&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" id="ddlTSDQ" style="width:115px; vertical-align:middle;">
								</select>
								
        						<span>累计拨付状态：</span>
        						<select id="ljbfzt" class="easyui-combobox" style="width:83px;">
									<option value="" selected="selected">全部</option>
									<option value="已全部拨付">已全部拨付</option>
									<option value="未全部拨付">未全部拨付</option>
								</select>
								</p>
								<p style="margin: 1% 0% 1% 2%;">
								<span>路线编码：</span>
        						<span><input type="text" id="lxbm" style="width:95px;" /></span>
        						<span>项目名称：</span>
        						<span><input type="text" id="xmmc" style="width:95px;" /></span>
        						<span>项目类型：</span>
        						<span><select name="xmlx" id="xmlx" style="width:100px;" ></select></span>
<!--         						<span>下达年份：</span> -->
<!--         							<input type="text" id="xdnf" style="width: 100px;"> -->
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: middle;" onclick="showGsd()"/>        					
                                <img onclick="exportAbyb()" alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
        						 <img onclick="importData_yb('cgszjdw/gcgzsj/gsdgz')" alt="导入月报" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
                                        </p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td width="100%" style="padding-top: 1%;padding-left:10px;">
                    <div>
		<table id="datagrid" >

			</table>
			</div>
			</td>
			</tr>
			
		</table>
	</div>
</body>
</html>