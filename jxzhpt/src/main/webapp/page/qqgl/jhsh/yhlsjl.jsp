<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护补助历史数据</title>
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
	<script type="text/javascript">
		$(function(){
			/* var lsxmnf=''; */
			var lsxmlx='';
			var xmlxnf='';
			try {
				/* lsxmnf=parent.$("#lsxmnf").combobox("getValues").join(",");
				if(lsxmnf.substr(0,1)==',')
					lsxmnf=lsxmnf.substr(1,lsxmnf.length); */
				
				/* lsxmlx=parent.$("#lsxmlx").combobox("getValues").join(",");
				if(lsxmlx.substr(0,1)==',')
					lsxmlx=lsxmlx.substr(1,lsxmlx.length); */
				lsxmlx = parent.YMLib.Var.lsxmlx;
			    var lsxdnf=parent.YMLib.Var.lsxdnf;
                var xmlxnf=lmlxxx(lsxdnf);
			} 
			catch (e) { 
				//alert(e.name + ": " + e.message);
				 /* lsxmnf=''; */lsxmlx='';xmlxnf='';
			} 
			
			$('#grid').datagrid({
				//url:'../../../qqgl/queryLsxx.do',
				url:'../../../qqgl/queryyhLsxx.do',
				queryParams: {xmbm: parent.YMLib.Var.xmbm,lsxmlx:lsxmlx,xmlxnf:xmlxnf},
				height:$(window).height()-1,
				fitColumns:true,
				columns:[[
							{field:'xmlx',title:'项目类型',width:100,align:'center'},
							{field:'xmmc',title:'项目名称',width:200,fixed:true,align:'center',
								formatter:function(value,row,index){
									var a='<a href="javascript:msgxx('+"'"+row.xmbm+"'"+')" style="color:#0066CB;font-size:12px;">';
									a+=value+'</a>';
									return a;
								}
							},
							{field:'xmnf',title:'计划年份',width:100,align:'center'},
							{field:'ghlxbm',title:'现路线编码',width:100,align:'center'},
							{field:'jsjsdj',title:'现技术等级',width:100,align:'center'},
							{field:'ghqdzh',title:'现起点桩号',width:100,align:'center'},
							{field:'ghzdzh',title:'现止点桩号',width:150,fixed:true,align:'center'},
							{field:'lxbm',title:'路线编码',width:100,align:'center'},
							{field:'xjsdj',title:'原技术等级',width:100,align:'center'},
							{field:'qdzh',title:'原起点桩号',width:100,align:'center'},
							{field:'zdzh',title:'原止点桩号',width:100,align:'center'}
						]]
			});
		});
		function msgxx(xmid){
			//load();
			//return;
			parent.YMLib.Var.xmbm=xmid;
			if(xmid.substring(10,11)=="1"){
				parent.YMLib.UI.createWindow('lmsjxx','改建工程项目','/jxzhpt/page/qqgl/zjxd/lmsj_xx.jsp','lmsjxx',980,400);
			}else if(xmid.substring(10,11)=="2"){
				parent.YMLib.UI.createWindow('lmgzxx','路面改造工程项目','/jxzhpt/page/qqgl/zjxd/lmgz_xx.jsp','lmgzxx',980,400);
			}else if(xmid.substring(10,11)=="3"){
				parent.YMLib.UI.createWindow('xjgcxx','新建工程项目','/jxzhpt/page/qqgl/zjxd/xjgc_xx.jsp','xjgcxx',980,400);
			}else if(xmid.substring(10,11)=="4"){
				parent.YMLib.UI.createWindow('yhdzxxx','养护大中修项目','/jxzhpt/page/qqgl/zjxd/yhdzx_xx.jsp','yhdzxxx',980,400);
			}else if(xmid.substring(10,11)=="5"){
				parent.YMLib.UI.createWindow('shxmxx','灾毁重建','/jxzhpt/page/qqgl/zjxd/shxm_xx.jsp','shxmxx',980,400);
			}
		}
		
       function lmlxxx(args){
           var lsxdnf = args.split(",");
           var xz = [];
           var dx = [];
           for(var i = 0; i < lsxdnf.length; i++){
               if(lsxdnf[i].substr(4) == '中修'){
                   xz.push(lsxdnf[i].substr(0,4));
               }
                if(lsxdnf[i].substr(4) == '大修'){
                   dx.push(lsxdnf[i].substr(0,4));
               }
           } 
           var dxMin = ''; var zxMin = ''; var res = [];
           if(dx.length > 0){
               dxMin = Math.min.apply(null,dx) + '大修';
               res.push(dxMin);
           }
           if(xz.length > 0){
               dxMin = Math.min.apply(null,xz) + '中修';
               res.push(dxMin);
           }
           return res.join(",");
       }	 
		
	</script>
</head>
<body style="overflow: auto;">
	<table id="grid" height="99%" width="99%" border="0" style="margin-top:1px;margin-left:1px;overflow: auto;" cellspacing="0" cellpadding="0"></table>
</body>
</html>
