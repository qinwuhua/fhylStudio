<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修</title>
	<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="../../../js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<script type="text/javascript">
		var title='';
		$(function(){
			//根据用户等级展示按钮
			if(userPanduan($.cookie("unit2"))=="省"){
				title='审核状态';
				$.each($("[name='sheng']"),function(index,item){
					$(item).show();
				});
				$.each($("[name='dishi']"),function(index,item){
					$(item).hide();
				});
				$('#ztspan').html("审核状态");
				$('#spantitle').html("项目立项审核");
			}else if(userPanduan($.cookie("unit2"))!="省"){
				title='上报状态';
				$.each($("[name='sheng']"),function(index,item){
					$(item).hide();
				});
				$.each($("[name='dishi']"),function(index,item){
					$(item).show();
				});
				$('#ztspan').html("上报状态");
			}
			tsdqdx("tsdq");
			//xmnf("xmnf");
			urlxmnf("xmnf",getUrlParame('id'));
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm3('jsdj','技术等级');
			loadGcfl('gcfl','工程分类');
			loadGldj('gldj');
			//gsdxmlx('xmlx');
			yhxmlx('xmlx');
			YMLib.Var.jdbs=1;
			if(userPanduan($.cookie("unit2"))!="省"){
				loadBmbm2('sqzt','申请状态地市');
			}else{
				loadBmbm2('sqzt','申请状态省');
			}
			queryYhdzx();
		});
		function queryYhdzx(){
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			var jsxz=$("#xmlx").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			grid.id="grid";
			grid.url="../../../qqgl/queryXmsqbyyhc.do";
			var params={'xmlx':4,
					//'gydwdm':getgydw('gydw'),
					'xzqhdm':getxzqhdm('xzqh'),
					'xmmc':$('#xmmc').val(),
					'ghlxbh':$('#lxbm').val(),
					'lxmc':$('#lxmc').val(),
					'tsdq':tsdq,
					'jsdj':$('#jsdj').combobox("getValues").join(","),
					'sqzt':-1,
					"jdbs":1,
					'jdbs':YMLib.Var.jdbs,
					'lsjl':$('#lsjl').combobox("getValue"),
					'wnxmk':$('#wnxmk').combobox("getValue"),
					'ghlxbm':$("#ghlxbm").val(),
					'ghlxmc':$("#ghlxmc").val(),
					'jsxz':jsxz,
					'xmbm':xmnf,
					//'gcfl':$('#gcfl').combobox("getValues").join(","),
					"ylxbh":$('#gldj').combobox("getValues").join(",")};
			var sqzt = $('#sqzt').combobox("getValue");
			
			if(userPanduan($.cookie("unit2"))!="省"){
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}
			loadLj(params);
			grid.queryParams=params;
			grid.height=$(window).height()-160;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			
			
			grid.columns=[[
				{field:'ck',checkbox:true},
				{field:'cz',title:'操作',width:180,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','1'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'yhdzxxx'"+','+"'养护大中修项目'"+','+
								"'/jxzhpt/page/qqgl/jhsh/yhdzx_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						//if(row.sqzt==0 || row.sqzt==9 || row.sqzt==11){
							result+='&nbsp;<a href="javascript:openWindow('+"'yhdzxedit'"+','+"'养护大中修项目'"+','+
							"'/jxzhpt/page/qqgl/jhsh/yhdzx_edit.jsp'"+',980,400)" style="color:#3399CC;">编辑</a>';
						//}else{
						//	result+='&nbsp;<a style="color:black;">编辑</a>';
						//}
						
							if(Number(row.sqzt)==0 || Number(row.sqzt)>Number($.cookie('unit2').length)){
								return result+'&nbsp;<a href="javascript:openLxAddyh('+"'yhdzx','"+row.xmbm+"','"+YMLib.Var.jdbs+"'"+')" style="color:#3399CC;">添加路线</a>';
							}else{
								return result+'&nbsp;添加路线';
							}
						//return result;
					}
				},
				{field:'yhcsh',title:title,width:60,align:'center',
					formatter:function(value,row,index){
						var result="";
						//alert(value);
						if(value=='1')
						result="已审核";
						else
						result='<a href="javascript:sp('+index+')" style="color:#3399CC;">未审核</a>';
						return result;
					}
				},
				
				{field:'lsjl',title:'历史记录',width:60,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				{field:'wnxmk',title:'五年项目库',width:70,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openwnxmk('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'xzqh',title:'行政区划',width:60,align:'center'},
				{field:'xmmc',title:'项目名称',width:150,align:'center',
					formatter: function(value,row,index){
		        		if(Number(row.xmsl)>1){
		        			return '<label style="color:red;">'+value+'</label>';
		        		}else{
		        			return value;
		        		}
		        	}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'zlc',title:'里程',width:60,align:'center'},
				{field:'jsdj',title:'技术等级',width:100,align:'center'},
				{field:'ghlxbm',title:'规划路线编码',width:80,align:'center'},
			    {field:'ghqdzh',title:'规划起点桩号',width:80,align:'center'},
			    {field:'ghzdzh',title:'规划止点桩号',width:80,align:'center'},
				{field:'ylxbh',title:'原路线编码',width:60,align:'center'},
				{field:'qdzh',title:'原起点桩号',width:80,align:'center'},
				{field:'zdzh',title:'原止点桩号',width:80,align:'center'},
				{field:'jhkgsj',title:'计划开工时间',width:80,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:80,align:'center'},
				//{field:'gq',title:'工期（月）',width:60,align:'center'},
				{field:'ntz',title:'总投资',width:60,align:'center'},
				{field:'tsdq',title:'特殊地区',width:120,align:'center'}]];
			
			
			gridBindyh(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryLjbyyhc.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$("#xmsl").html(msg.SL);
						 $("#tz").html(msg.TZ);
						 $("#cgs").html(msg.BZYS);
						 $("#sbz").html(msg.SBZ);
						 $("#sjl").html(msg.SJL);
						 $("#lc").html(msg.LC);
						 $("#dftz").html(msg.DFTZ);
					}else{
						$('#spanntz').html('0');
						$('#spanlc').html('0');
						$("#xmsl").html('0');
					}
				}
			});
		}
		function deleteYhdzx(){
			var selRow = $('#grid').datagrid("getSelections");
			
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt!=0){
					y=false;
					return;
				}
			}
			
			);
			if(!y){
				alert("只能删除未申请的信息！");
				return;
			}
			if(selArray.length!=0){
				var xmbm=selRow[0].xmbm;
				for(var i=1;i<selRow.length;i++){
					xmbm+=","+selRow[i].xmbm;
				}
				//var xmbm = selArray.join(",");
				//alert(xmbm+"         "+xmbm1);
				$.ajax({
					type:'post',
					url:'../../../qqgl/deleteXmsq.do',
					data:'xmlx='+4+'&xmbm='+xmbm,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("删除成功!");
							queryYhdzx();
						}
					}
				});
			}else{
				alert("请选择要删除的信息！");
			}
		}
		function sb(xmbm){
			$.ajax({
				type:'post',
				url:'../../../qqgl/updateXmsqSbzt.do',
				data:'xmlx='+4+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("上报成功!");
						queryYhdzx();
					}
				}
			});
		}
		
		
		function batchSb(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt!=0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能上报未上报过的项目！");
				return;
			}
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/updateXmsqSbzt.do',
					data:'xmlx='+4+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("上报成功!");
							queryYhdzx();
						}
					}
				});
			}else{
				alert("请选择要上报的信息！");
			}
		}
		function sp(index){
			
			var obj=$("#grid").datagrid('getRows')[index];
			
			var datas='xmsq.ylxbh='+obj.ylxbh+'&xmsq.qdzh='+obj.qdzh+'&xmsq.zdzh='+obj.zdzh+'&xmsq.xmbm='+obj.xmbm;
			//alert(datas);
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/sfinsert1.do',
		        data:datas,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						var ls='';var wn='';
						/* if(obj.lsjl=='是'){
							//alert("该条数据未查询到历史记录，后台数据有误");
							//ls="否";
						}
						else if(obj.wnxmk=='是'){
							//alert("该条数据未查询到历史记录，后台数据有误");
							//wn='否';
						} */
						
						if(!confirm('是否审核？')){
							return;
						}
						//insert();
						$.ajax({
							type:'post',
							url:'../../../qqgl/updateXmsqSp.do',
							data:'xmlx='+4+'&xmbm='+obj.xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs+"&wnxmk="+wn+"&lsjl="+ls,
							dataType:'json',
							success:function(msg){
								if(msg.result=="true"){
									selArray.splice(0,selArray.length);
									alert("审核成功!");
									queryYhdzx();
								}
							}
						}); 
						//
					}else if(msg.result=="have"){
						var xsxx='';
						
						//alert();
						for(var i=0;i<msg.lx.length;i++){
							var xmlx='';
							if(msg.lx[i].jsxz!='改建' && msg.lx[i].jsxz!='新建' && msg.lx[i].jsxz!='路面改造' && msg.lx[i].jsxz!='恢复重建' && msg.lx[i].jsxz!='大修' && msg.lx[i].jsxz!='中修'){
								if(msg.lx[i].xmid.substr(10,1)==4)
								xmlx='预防性养护';
								else
									xmlx=msg.lx[i].jsxz;
							}else{
								xmlx=msg.lx[i].jsxz;
							}
							
							var lc=0;
							
							if(parseFloat(msg.lx[i].jsqdzh)!=parseFloat(msg.lx[i].xmzd)&&parseFloat(msg.lx[i].jszdzh)!=parseFloat(msg.lx[i].xmqd)){
								var qd;var zd;
								// alert(msg.lx[i].yqdzh+"    "+msg.lx[i].xmqd+"     "+msg.lx[i].yzdzh+"     "+msg.lx[i].xmzd)
								/*var zjbl=0;//中间变量
								if(msg.lx[i].yqdzh>msg.lx[i].yzdzh){
									zjbl=msg.lx[i].yqdzh;msg.lx[i].yqdzh=msg.lx[i].yzdzh;msg.lx[i].yzdzh=zjbl;
									zjbl=0;
								}
								alert(msg.lx[i].yqdzh+"    "+msg.lx[i].xmqd+"     "+msg.lx[i].yzdzh+"     "+msg.lx[i].xmzd) */
								/* if(msg.lx[i].yqdzh>msg.lx[i].yzdzh){
									zjbl=msg.lx[i].yqdzh;msg.lx[i].yqdzh=msg.lx[i].yzdzh;msg.lx[i].yzdzh=zjbl;
									zjbl=0;
								} */	
								if(parseFloat(msg.lx[i].jsqdzh)<parseFloat(msg.lx[i].xmqd)){
									qd=parseFloat(msg.lx[i].xmqd);
								}else{
									qd=parseFloat(msg.lx[i].jsqdzh);
								}
								if(parseFloat(msg.lx[i].jszdzh)>parseFloat(msg.lx[i].xmzd)){
									zd=parseFloat(msg.lx[i].xmzd);
								}else{
									zd=parseFloat(msg.lx[i].jszdzh);
								}
								//alert(zd+"    "+qd);
								lc=accSub(zd,qd);
								
							}
							//lc= (parseFloat(msg.lx[i].qdzh)*1000-parseFloat(obj.qdzh)*1000)+(parseFloat(msg.lx[i].zdzh)*1000-parseFloat(obj.zdzh)*1000);

							//Math.abs(lc/1000);
							xsxx+="   项目年份："+msg.lx[i].xmnf+"   项目名称："+msg.lx[i].xmmc+"   建设类型："+xmlx+"     重复里程："+lc+"\r";
							
						}
						if(msg.lx.length>0){
							$("#lsjl").val("是");
							//alert("存在补助历史\r"+xsxx);
							alert("重复项目\r"+xsxx);
							if(confirm('是否审核？')){
								//insert();
								$.ajax({
									type:'post',
									url:'../../../qqgl/updateXmsqSp.do',
									data:'xmlx='+4+'&xmbm='+obj.xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
									dataType:'json',
									success:function(msg){
										if(msg.result=="true"){
											selArray.splice(0,selArray.length);
											alert("审核成功!");
											queryYhdzx();
										}
									}
								}); 
								//
							}
						}else{
							$("#lsjl").val("否");
							//insert();
							$.ajax({
								type:'post',
								url:'../../../qqgl/updateXmsqSp.do',
								data:'xmlx='+4+'&xmbm='+obj.xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
								dataType:'json',
								success:function(msg){
									if(msg.result=="true"){
										selArray.splice(0,selArray.length);
										alert("审核成功!");
										queryYhdzx();
									}
								}
							}); 
							//
						}
						
					}
				}
			});
			
			
		}
		
		//退回审批
		function thsp(xmbm){
			$.ajax({
				type:'post',
				url:'../../../qqgl/updateXmsqthSp.do',
				data:'xmlx='+4+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("退回成功!");
						queryYhdzx();
					}
				}
			}); 
			
			
		}
		
		
		function batchSp(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.yhcsh==1){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能审批未通过的项目！");
				return;
			}
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				if(confirm('是否审核？')){
				$.ajax({
					type:'post',
					url:'../../../qqgl/updateXmsqSp.do',
					data:'xmlx='+4+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("审核成功!");
							queryYhdzx();
						}
					}
				});
			}else{
				alert("请选择要上报的信息！");
			}
		}
		/* function exportXmsq(){
			var sqzt = $('#sqzt').combobox("getValue");
			if(userPanduan($.cookie("unit2"))!="省"){
				sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				sqzt=sqzt=='' ? -1 : sqzt;
			}
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var param='xmlx=4&sqzt='+sqzt+'&xzqhdm='+getxzqhdm('xzqh')+'&gydwdm='+""+
			'&xmbm='+$('#xmnf').combobox("getValues").join(',')+'&jsdj='+$('#jsdj').combobox("getValues").join(",")+
			'&tsdq='+tsdq+'&xmmc='+$('#xmmc').val()+'&lsjl='+$('#lsjl').combobox("getValue")+
			'&ylxbh='+$('#gldj').combobox("getValues").join(",")+"&wnxmk="+$("#wnxmk").combobox("getValue")+
			'&ghlxbh='+$("#lxbm").val()+'&lxmc='+$("#lxmc").val()+'&ghlxbm='+$("#ghlxbm").val()+'&ghlxmc='+$("#ghlxmc").val();
			window.location.href="/jxzhpt/qqgl/exportExcelXmsq.do?"+param;
		} */
		
		
		
		function exportXmsq(){
			var sqzt = $('#sqzt').combobox("getValue");
			if(userPanduan($.cookie("unit2"))!="省"){
				sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				sqzt=sqzt=='' ? -1 : sqzt;
			}
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var param='xmlx=4&sqzt='+sqzt+'&xzqhdm='+getxzqhdm('xzqh')+'&gydwdm='+""+
			'&xmbm='+$('#xmnf').combobox("getValues").join(',')+'&jsdj='+$('#jsdj').combobox("getValues").join(",")+
			'&tsdq='+tsdq+'&xmmc='+$('#xmmc').val()+'&lsjl='+$('#lsjl').combobox("getValue")+
			'&ylxbh='+$('#gldj').combobox("getValues").join(",")+"&wnxmk="+$("#wnxmk").combobox("getValue")+
			'&ghlxbh='+$("#lxbm").val()+'&lxmc='+$("#lxmc").val()+'&ghlxbm='+$("#ghlxbm").val()+'&ghlxmc='+$("#ghlxmc").val();
			window.location.href="/jxzhpt/qqgl/exportExcelXmsq1.do?"+param;
		}
		function importXmsq(){
			importExcelqwh("/jxzhpt/qqgl/importExcelYhdzx.do","yhlxsh");
		}
		function openYhdzx(){
			openWindow("yhdzxadd","添加养护大中修项目","yhdzxAdd.jsp",980,400);
		}
		function loadGcfl(id,name){
			$.ajax({
				type:'post',
				url:'/jxzhpt/xtgl/getBmbmTreeByName2.do',
				data:'yhm='+ encodeURI(encodeURI(name)),
				dataType:'json',
				async:false,
				success:function(msg){
					$('#' + id).combobox({
						data:msg,
						valueField : 'bmid',
						textField : 'name',
						panelHeight:'auto',
						multiple:true
					});
				}
			});
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize');
		});
		
		function tuiHui(){
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要退回项目！");
				return;
			}
			if($.cookie("unit2").length!=7){
				alert("您不是省级用户");
				return;
			}
			var id=rows[0].id;
			var xmbm=rows[0].xmbm;
			for(var i=1;i<rows.length;i++){
				xmbm+=","+rows[i].xmbm;
			}
			for(var i=0;i<rows.length;i++){
			if(rows[i].sqzt=='9'){
				var data = "lxsh.xmbm="+xmbm+"&lxsh.bz=yhdzx";
				//在可行性中是否已经操作过
				$.ajax({
						 type : "POST",
						 url : "/jxzhpt/qqgl/thxmsqsh.do",
						 dataType : 'json',
						 data : data,
						 success : function(msg){
						 if(msg){
							 alert('退回成功！');
							 $("#grid").datagrid('reload');
						 }else{
							 alert('退回失败,请选择要退回项目！');
						 }
					 },
					 error : function(){
						 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
					 }
				});
				return;
			}
		}
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">前期管理>&nbsp;<span id="spantitle">项目立项</span>>&nbsp;<span id='bstext'></span>>&nbsp;养护大中修项目</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
       	<tr>
       		<td align="left" style="padding-left: 10px; padding-right: 10px;">
       			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
       				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
       					<font style="color: #0866A0; font-weight: bold"></font>
       				</legend>
       				<div>
       					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
       						<tr height="32">
       							
       							<!-- <td>&nbsp;管养单位：</td>
       							<td><select id="gydw" style="width:170px;"></select></td> -->
       							<!-- <td>&nbsp;行政区划：</td>
       							<td><select id="xzqh" style="width:124px;"></select></td>
       							<td>&nbsp;技术等级：</td>
       							<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select></td>
       							<td>&nbsp;工程分类：</td>
	       						<td><select name="gcfl" class="easyui-combobox" id="gcfl" style="width:100px;"></select></td>
       							<td>&nbsp;建设性质：</td>
								<td><select name="xmlx" id="xmlx" style="width:100px;" ></select></td>
       							<td>项目年份：</td>
       							<td><select id="xmnf" style="width: 70px;"></select></td>
       							<td>&nbsp;历史记录：</td>
       							<td>
       								<select id="lsjl" class="easyui-combobox" style="width: 81px;">
		       							<option value="" selected="selected">全部</option>
		       							<option value="是">是</option>
		       							<option value="否">否</option>
	       							</select>
       							</td> -->
       							<td>&nbsp;行政区划：</td>
       							<td><select id="xzqh" style="width:124px;"></select></td>
       							<td>&nbsp;项目名称：</td>
       							<td><input name="xmmc" id="xmmc" style="width:95px;" type="text"/></td>
       							<td>&nbsp;建设性质：</td>
								<td><select name="xmlx" id="xmlx" style="width:100px;" ></select></td>
								<td>&nbsp;技术等级：</td>
       							<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select></td>
       							<td>项目年份：</td>
       							<td><select id="xmnf" style="width: 70px;"></select></td>
       							
       						</tr>
       						<tr height="32">
       							<!-- <td>&nbsp;原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
       							<td>&nbsp;原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
       							<td>&nbsp;项目名称：</td>
       							<td><input name="xmmc" id="xmmc" style="width:120px;" type="text"/></td>
       							
       							<td>&nbsp;五年项目库：</td>
       							<td>
       								<select id="wnxmk" class="easyui-combobox" style="width: 81px;">
		       							<option value="" selected="selected">全部</option>
		       							<option value="是">是</option>
		       							<option value="否">否</option>
	       							</select>
       							</td>
        						<td><span id="ztspan">上报状态</span>：</td>
       							<td><select id="sqzt" class="easyui-combobox" style="width: 70px;"></select></td> -->
       							<td>&nbsp;行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
								 <td>&nbsp;原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
       							<td>&nbsp;原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:95px;" /></td>
        						<td>&nbsp;规划路线编码：</td>
        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
        						<td>&nbsp;规划路线名称：</td>
        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
        						
       						</tr>
       						<tr>
       						    <!-- <td>&nbsp;特殊地区：</td>
       							<td><select name="tsdq" id="tsdq" style="width:170px;" class="easyui-combobox"></select></td>
        						<td>&nbsp;规划路线编码：</td>
        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
        						<td>&nbsp;规划路线名称：</td>
        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
       							<td>&nbsp;行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td> -->
								<!-- <td>&nbsp;管养单位：</td>
       							<td><select id="gydw" style="width:170px;"></select></td> -->
       						</tr>
       						<tr height="32">
       						<td>&nbsp;是否有补助历史：</td>
       							<td>
       								<select id="lsjl" class="easyui-combobox" style="width: 81px;">
		       							<option value="" selected="selected">全部</option>
		       							<option value="是">是</option>
		       							<option value="否">否</option>
	       							</select>
       							</td>
       							<td>&nbsp;五年项目库：</td>
       							<td>
       								<select id="wnxmk" class="easyui-combobox" style="width: 70px;">
		       							<option value="" selected="selected">全部</option>
		       							<option value="是">是</option>
		       							<option value="否">否</option>
	       							</select>
       							</td>
       							<td>&nbsp;特殊地区：</td>
       							<td><select name="tsdq" id="tsdq" style="width:100px;" class="easyui-combobox"></select></td>
       							<td><span id="ztspan">上报状态</span>：</td>
       							<td><select id="sqzt" class="easyui-combobox" style="width: 70px;"></select></td>
       							</tr>
       							<tr height="32">
       							<td colspan="8">
       								<img onclick="queryYhdzx()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
									<img id="sb" name="dishi" alt="上报" onclick="batchSb()" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='../../../images/Button/shangbao_1.png'" src="../../../images/Button/shangbao_1.png"/>
									<img id="tj" name="dishi" alt="添加" onclick="openYhdzx()" style="disborder-width:0px;cursor: hand;vertical-align:middle;" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src=""/>
									<img id="sc" name="dishi" alt="删除" onclick="deleteYhdzx()" style="vertical-align:middle;" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'">
									<img id="sp" name="sheng" alt="审批" onclick="batchSp()" style="display:none;border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/sp2.jpg'" alt="上报" onmouseout="this.src='../../../images/Button/sp1.jpg'" src="../../../images/Button/sp1.jpg"/>
<!-- 					                <img id="th" name="sheng" alt="退回" onclick="tuiHui()" style="display:none;vertical-align:middle;" alt="退回" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'"/> -->
					               	<img name="sheng" id="thxj" src="../../../images/thxj1.jpg" onmouseover="this.src='../../../images/thxj2.jpg'" onmouseout="this.src='../../../images/thxj1.jpg'   " src=""  onclick="tuihxjlxshyhc('grid');" style="border-width:0px;vertical-align:middle;" />
									<img id="thwsh" name="sheng" alt="退回" onclick="thwshlxsh()" style="display:none;vertical-align:middle;" alt="退回" src="../../../images/thwsh1.jpg" onmouseover="this.src='../../../images/thwsh2.jpg'" onmouseout="this.src='../../../images/thwsh1.jpg'"/>
					                <img id="dcExcel" name="sheng" onclick="exportXmsq()" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
					                <img id="drExcel" name="dishi" onclick="importXmsq()" alt="导入" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
					                <img id="dcmoban" name="dishi" onclick="exportTemplet('Lxsh_Yhdzx')" alt="导出模版" onmouseover="this.src='../../../images/Button/DC2.gif'" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
       							</td>
       						</tr>
       					</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
           		<div>
           			<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
           			<table id="grid"></table>
           		</div>
           	</td>
       	</tr>
	</table>
</body>
</html>
