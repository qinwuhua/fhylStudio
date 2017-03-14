<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>选择项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/uploader/uploadify.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/wngh/wnjh/js/wnjh.js"></script>
	<script type="text/javascript">
		$(function(){
			gsdxmlx('xmlx');
			loadBmbm3("xmnf",'全部项目年份',new Date().getFullYear());
			tsdqdx('tsdq');
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('jsjsdj','技术等级');
			loadBmbm3('xmlx','拟完工建设性质');
			//gsdxmlx('xmlx');
			loadGldj('gldj');
			
		});
		
		function showAllgsd(){
			$("#cxtj").attr('style','display:none');
			$("#xsdata").attr('style','');
			
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
			var xmnf=$("#xmnf").combobox('getValues').join(",");
			if(xmnf=='')
				xmnf=new Date().getFullYear();
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var jsdj=$("#jsdj").combotree('getText');
			var gldj=$("#gldj").combobox('getValues').join(",");
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/qqgl/selectGsdxzxm.do',
			    striped:true,
			    pagination:false,
			    rownumbers:true,
			   checkOnSelect:true,
			    height:$(window).height()-40,
			    width:$(window).width()-20,
			    queryParams: {
			    	xzqh:xzqhstr,
					xmnf:xmnf,
					tsdq:tsdq,
					jsdj:jsdj,
					gldj:gldj,
					'lxsh.lsjl':$("#lsjl").combobox('getValue'),
					'lxsh.xmmc':$("#xmmc").val(),
					'lxsh.ghlxbh':$("#lxbm").val(),
					'lxsh.lxmc':$("#lxmc").val(),
					'lxsh.jsjsdj':$("#jsjsdj").combotree('getText'),
					'lxsh.ghxlxbm':$("#ghxlxbm").val(),
					'lxsh.ghxlxmc':$("#ghxlxmc").val(),
					'lxsh.xmlx1':xmlx,
					'lxsh.qqkzzt':$("#qqkzzt").combobox('getValue'),
					'lxsh.xmklx':$("#xmklx").combotree('getValue'),
					'lxsh.gydw':$.cookie("dist2"),
// 					'lxsh.nwgxzdj':parent.$("#nwgxzdj").combobox('getValues').join(',')
				},
			    columns:[[
			        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
			        
					{field : 'xzqh',title : '行政区划',width : 105,align : 'center'},
					{field : 'xmnf',title : '项目年份',width : 53,align : 'center'},
			        {field : 'xmmc',title : '项目名称',width : 210,align : 'center',formatter:function(value,row,index){
			        	if(row.sl>0)
			        	return '<font color="red">'+row.xmmc+'</font>';
			        	else return  row.xmmc;
			        }},
			        {field : 'zjhlc',title : '里程',width : 50,align : 'center'},
			        {field:'xjsdj',title:'现技术等级',width:69,align:'center'},
				    {field:'jsjsdj',title:'建设技术等级',width:79,align:'center'},
				    {field:'ghlxbm',title:'规划路线编码',width:79,align:'center',formatter: function(value,row,index){if(row.xmlx1=="新建工程"){return row.xjlxbm;}else{return value;}}},
				   
				    {field : 'ghlxbhs',title : '原路线编码',width : 60,align : 'center',formatter:function(value,row,index){
				    	if(row.ghlxbh=='')
				    	return row.xjlxbm;
				    	else
				    		return row.ghlxbh;
					}}
				   
				    
			    ]],
				view: detailview,
				detailFormatter:function(index,row){  
						return '<div style="padding:2px"><table id="table_lx' + row.id + '"></table></div>';   
			    },
			    onExpandRow: function(index,row){
			    	parentindex=index;
			    	if(row.sl!=0){
			    		$('#table_lx'+row.id).datagrid({
				    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
				    		 queryParams: {
				    			 'lxsh.xmbm':row.id,
				    			 'lxsh.sffirst':'1'
				    			},
			    			columns:[[
			    			    {field:'xzqh',title:'行政区划',width:120,align:'center'},
			    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
			    			    {field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
							    {field:'ghlxbh',title:'原路线编码',width:100,align:'center'},
			    			     {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
			    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
			    			    {field:'jhlc',title:'里程',width:60,align:'center'}
			    			]]
				    	});
			    	}
			    	
			    }   
			}); 
		}
		
		function ckxlwjg(){
			var gr=$("#datagrid").datagrid('getSelections');
			
			if(gr.length==0){
				alert("请勾选项目");
				return;
			}
			
		   /*  var xmbm="";
			for(var i=0;i<gr.length;i++){
				xmbm+=gr[i].xmbm+',';
			}
			xmbm=xmbm.substring(0,xmbm.length-1);
			
			parent.xmbm=xmbm;
			var title='';
			if(parent.$("#tjfl").combobox('getValue')=='按地市'){
				title='地市';
			}else{
				if(parent.$("#nwgxzdj").combobox('getValues').join(',')=='G'){
					title='国道编号';
				}else if(parent.$("#nwgxzdj").combobox('getValues').join(',')=='S'){
					title='省道编号';
				}else{
					title='国省道编号';
				}
			}
			
			if(parent.$("#nwgxzdj").combobox('getValues').join(',')==''){
				alert("请勾选行政等级");
				return;
			}
			parent.$('#grid').datagrid({    
			    url:'/jxzhpt/qqgl/ckxlwjg.do',
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:parent.y,
			    width:parent.x,
			    queryParams: {
			    	'lxsh.nwgxzdj':parent.$("#nwgxzdj").combobox('getValues').join(','),
					'lxsh.tjfl':parent.$("#tjfl").combobox('getValue'),
					'lxsh.xmbm':xmbm
				},
			    columns:[[
			        {field:'v_0',title:title,width:120,align:'center'},
					{field:'v_1',title:'里程（公里）',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
					{field:'v_2',title:'一级公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
			        {field:'v_3',title:'二级公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
			        {field:'v_4',title:'三级公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
				    {field:'v_5',title:'四级公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
				    {field:'v_6',title:'等外公路',width:120,align:'center',formatter: function(value,row,index){if(value.substring(0,1)=="."){return '0'+value;}else{return value;}}},
				    {field:'v_7',title:'二级以上占比',width:100,align:'center'},
				    {field:'v_8',title:'三级以上占比',width:100,align:'center'}
			    ]]
				 
			});   */ 
			
			parent.$('#lwyx').window('destroy');
			
		}
	
		function fhsxtj(){
			$("#cxtj").attr('style','');
			$("#xsdata").attr('style','display:none');
		}
	</script>
	<style type="text/css">
	TD {font-size: 8px;}
	a{text-decoration:none;}
	
	</style>
</head>
<body >
	
		<table width="99.8%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr id='cxtj'>
        		<td align="left" style="padding-left: 5px; padding-top: 10px;height: 330px;">
        			<fieldset id="searchField" style="width:99.3%; text-align: left; vertical-align: middle;height: 330px; padding-bottom:10px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="42" >
        						<td style="width: 100px;">行政区划：</td>
        						<td style="width: 176px;"><select id="xzqh" style="width:170px;"></select></td>
        						<td style="width: 100px;">项目库类型：</td>
								<td style="width: 176px;">
									<select id='xmklx' class="easyui-combobox" style="width: 170px;">
										<option value="">请选择</option>
										<option value="部库">部库</option>
										<option value="省库">省库</option>
									</select>
								</td>
        						<td style="width: 100px;">项目名称：</td>
        						<td style="width: 146px;"><input id='xmmc' type="text" /></td>
        						
        						
        					</tr>
        					<tr height="42" >
        						<td>建设性质：</td>
        						<td><select name="xmlx" id="xmlx" style="width:170px;" ></select></td>
        						<td>建设技术等级：</td>
								<td><select name="jsjsdj" id="jsjsdj" style="width:170px;" ></select></td>
								<td>原路线编码：</td>
        						<td><input id='lxbm' type="text" /></td>
        						
								</tr>
        						<tr height="42">
        						<td>现技术等级：</td>
								<td  width="65px;"><select name="jsdj" id="jsdj" style="width:170px;" ></select></td>
								</select></td>
								<td>项目年份：</td>
        						<td><select id="xmnf" style="width:170px;">
								<td>原路线名称：</td>
        						<td><input id='lxmc' type="text" /></td>
								
        						
        					</tr>
        					<tr height="42" >
        						<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:170px;" ></select></td>       					
								<td>是否有补助历史：</td>
								<td  width="65px;"><select id="lsjl" style="width:170px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></select></td>
        						
								<td>规划路线编码：</td>
        						<td><input id='ghxlxbm' type="text" /></td>
        						
        						</tr>
        					<tr height="42" >
        						
								
        						<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:170px;" >
								</select></td>
								<td>前期开展状态：</td>
        						<td><select id="qqkzzt" style="width:170px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="已开展">已开展</option>
									<option value="部分开展">部分开展</option>
									<option value="未开展">未开展</option>
								</select></select>
								</td>
								<td>规划路线名称：</td>
        						<td><input id='ghxlxmc' type="text" /></td>
        					</tr>
        					<tr height="42" >
        					
							</tr>
        					<tr height="42" align="center">
                              <td colspan="6">
                               <a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:showAllgsd()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
                              
				              </td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr id='xsdata' style="display: none;">
        		
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            	<a id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:fhsxtj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">返回筛选条件</a>
            	<a id='mybuttion3' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:ckxlwjg()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">查看项目对路网影响</a>
            		<div style="padding-left: 5px;padding-top:5px; font-size:12px;">
            			<table id="datagrid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
