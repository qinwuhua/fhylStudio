<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>灾毁重建项目</title>
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
				$.each($("img[name='sheng']"),function(index,item){
					$(item).show();
				});
				$.each($("img[name='dishi']"),function(index,item){
					$(item).hide();
				});
				$('#ztspan').html("审核状态");
				$('#spantitle').html("项目立项审核");
			}else if(userPanduan($.cookie("unit2"))!="省"){
				title='上报状态';
				$.each($("img[name='sheng']"),function(index,item){
					$(item).hide();
				});
				$.each($("img[name='dishi']"),function(index,item){
					$(item).show();
				});
				$('#ztspan').html("上报状态");
			}
			//xmnf("xmnf");
			loadGhlx('ghlxbm');
			loadylx('lxbm');
			urlxmnf("xmnf",getUrlParame('id'));
			tsdqdx("tsdq");
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit")); 
			loadBmbm3('jsdj','技术等级');
			loadGldj('gldj','行政等级');
			YMLib.Var.jdbs=0;
			if(userPanduan($.cookie("unit2"))!="省"){
				loadBmbm2('sqzt','申请状态地市');
			}else{
				loadBmbm2('sqzt','申请状态省');
			}
			loadBmbm3('lsxmlx','历史项目类型');  
			loadBmbm3('lsxmnf','历史项目年份');  
			
			queryShxm();
			
		});
		function queryShxm(){
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var lsxmnf=$("#lsxmnf").combobox('getValues').join(",");
			if(lsxmnf=='')
			lsxmnf='';
			if(lsxmnf.substr(0,1)==',')
			lsxmnf=lsxmnf.substr(1,lsxmnf.length);
			var lsxmlx=$("#lsxmlx").combobox('getValues').join(",");
			if(lsxmlx=='')
			lsxmlx='';
			if(lsxmlx.substr(0,1)==',')
			lsxmlx=lsxmlx.substr(1,lsxmlx.length);
			
			grid.id="grid";
			grid.url="../../../qqgl/queryXmsq.do";
			var params={'xmlx':5,
					//'gydwdm':getgydw('gydw'),
					'xzqhdm':getxzqhdm('xzqh'),
					'xmmc':$('#xmmc').val(),
					'ghlxbh':$('#lxbm').combotree('getText'),
					'lxmc':$('#lxmc').val(),
					'tsdq':tsdq,
					'jsdj':$('#jsdj').combobox("getValues").join(","),
					'sqzt':-1,
					"jdbs":0,
					'jdbs':YMLib.Var.jdbs,
					'lsjl':$('#lsjl').combobox("getValue"),
					'xmnf':xmnf,
					'ghlxbm':$("#ghlxbm").combotree('getText'),
					'ghlxmc':$("#ghlxmc").val(),
					'wnxmk':$('#wnxmk').combobox("getValue"),
					"ylxbh":$('#gldj').combobox("getValues").join(","),
					'lsxmlx':lsxmlx,
					'lsxmnf':lsxmnf,
					'xmbm':$("#xmbm").val()
					
			};
			var sqzt = $('#sqzt').combobox("getValue");
			if(userPanduan($.cookie("unit2"))!="省"){
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}
			loadLj(params);
			grid.queryParams=params;
			grid.height=$(window).height()-200;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			if($.cookie('unit2').length==7)
			grid.columns=[[
				{field:'ck',checkbox:true},
				{field:'cz',title:'操作',width:180,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','1'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow1('+"'shxmxx'"+','+"'灾毁重建项目'"+','+
								"'/jxzhpt/page/qqgl/jhsh/shxm_xx.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">详细</a>';
						//if(row.sqzt==0 || row.sqzt==9 || row.sqzt==11){
							result+='&nbsp;<a href="javascript:openWindow1('+"'shxmedit'"+','+"'灾毁重建项目'"+','+
							"'/jxzhpt/page/qqgl/jhsh/shxm_edit.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">编辑</a>';
						//}else{
						//	result+='&nbsp;<a style="color:black;">编辑</a>';
						//}
						
							if(Number(row.sqzt)==0 || Number(row.sqzt)>Number($.cookie('unit2').length)){
								return result+'&nbsp;<a href="javascript:openLxAdd('+"'shxm','"+row.xmbm+"','"+YMLib.Var.jdbs+"'"+')" style="color:#3399CC;">添加路线</a>';
							}else{
								return result+'&nbsp;添加路线';
							}
						
						//return result;
					}
				},
				{field:'sqzt',title:title,width:60,align:'center',
					formatter:function(value,row,index){
						var result="";
						if(userPanduan($.cookie('unit2'))!="省"){
							if(Number(value)==Number($.cookie('unit2').length)){
								result="已上报";
							}else if(Number(value)>0 && Number(value)<Number($.cookie('unit2').length)){
								result="已审核";
							}else if(Number(value)==0 || Number(value)>Number($.cookie('unit2').length)){
								result='<a href="javascript:sb('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">未上报</a>';
							}
						}else if(userPanduan($.cookie('unit2'))=="省"){
							if(Number(value)==Number($.cookie('unit2').length)){
								result="已审核";
							}else if(Number(value)==9){
								result='<a href="javascript:sp('+index+')" style="color:#3399CC;">未审核</a>';
							}else{
								result="未上报";
							}
						}
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
				{field:'xmmc',title:'项目名称',width:250,align:'center',
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
			else{
				grid.columns=[[
								{field:'ck',checkbox:true},
								{field:'cz',title:'操作',width:180,align:'center',
									formatter: function(value,row,index){
										var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','1'"+')">定位</a>';
										result+='&nbsp;<a href="javascript:openWindow1('+"'shxmxx'"+','+"'灾毁重建项目'"+','+
												"'/jxzhpt/page/qqgl/jhsh/shxm_xx.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">详细</a>';
												if(Number(row.sqzt)==0 || Number(row.sqzt)>Number($.cookie('unit2').length)){
											result+='&nbsp;<a href="javascript:openWindow1('+"'shxmedit'"+','+"'灾毁重建项目'"+','+
											"'/jxzhpt/page/qqgl/jhsh/shxm_edit.jsp'"+",980,400,'"+row.xmbm+"'"+')" style="color:#3399CC;">编辑</a>';
										}else{
											result+='&nbsp;<a style="color:black;">编辑</a>';
										}
										
											if(Number(row.sqzt)==0 || Number(row.sqzt)>Number($.cookie('unit2').length)){
												return result+'&nbsp;<a href="javascript:openLxAdd('+"'shxm','"+row.xmbm+"','"+YMLib.Var.jdbs+"'"+')" style="color:#3399CC;">添加路线</a>';
											}else{
												return result+'&nbsp;添加路线';
											}
										
										//return result;
									}
								},
								{field:'sqzt',title:title,width:60,align:'center',
									formatter:function(value,row,index){
										var result="";
										if(userPanduan($.cookie('unit2'))!="省"){
											if(Number(value)==Number($.cookie('unit2').length)){
												result="已上报";
											}else if(Number(value)>0 && Number(value)<Number($.cookie('unit2').length)){
												result="已审核";
											}else if(Number(value)==0 || Number(value)>Number($.cookie('unit2').length)){
												result='<a href="javascript:sb('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">未上报</a>';
											}
										}else if(userPanduan($.cookie('unit2'))=="省"){
											if(Number(value)==Number($.cookie('unit2').length)){
												result="已审核";
											}else if(Number(value)==9){
												result='<a href="javascript:sp('+index+')" style="color:#3399CC;">未审核</a>';
											}else{
												result="未上报";
											}
										}
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
								{field:'xmmc',title:'项目名称',width:250,align:'center',
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
								{field:'tsdq',title:'特殊地区',width:120,align:'center'},
								{field:'thyy',title:'退回原因',width:120,align:'center'}]];
				
			}
				
			gridBind(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryLj.do',
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
						$("#xmsl").html('0');
						 $("#tz").html('0');
						 $("#cgs").html('0');
						 $("#sbz").html('0');
						 $("#sjl").html('0');
						 $("#lc").html('0');
						 $("#dftz").html('0');
					}
				}
			});
		}
function deleteSh(){
	if(confirm('您确定删除该项目？')){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt!=0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能删除未申请的信息！");
				return;
			}
			if(selArray.length!=0){
				var xmbm=selRow[0].xmbm;
				for(var i=1;i<selRow.length;i++){
					xmbm+=","+selRow[i].xmbm;
				}
				$.ajax({
					type:'post',
					url:'../../../qqgl/deleteXmsq.do',
					data:'xmlx='+5+'&xmbm='+xmbm,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("删除成功!");
							queryShxm();
						}
					}
				});
			}else{
				alert("请选择要删除的信息！");
			}
	      }
		}
		function sb(xmbm){
			$.ajax({
				type:'post',
				url:'../../../qqgl/updateXmsqSbzt.do',
				data:'xmlx='+5+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("上报成功!");
						queryShxm();
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
					data:'xmlx='+5+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("上报成功!");
							queryShxm();
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
						
						//insert();
						$.ajax({
							type:'post',
							url:'../../../qqgl/updateXmsqSpzgc.do',
							data:'xmlx='+5+'&xmbm='+obj.xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
							dataType:'json',
							success:function(msg){
								if(msg.result=="true"){
									selArray.splice(0,selArray.length);
									alert("审核成功!");
									queryShxm();
								}
							}
						}); 
						//
					}else if(msg.result=="have"){
						var xsxx='';
						
						for(var i=0;i<msg.lx.length;i++){
							var xmlx='';
							if(msg.lx[i].xmlx!='改建' && msg.lx[i].xmlx!='新建' && msg.lx[i].xmlx!='路面改造' && msg.lx[i].xmlx!='灾毁恢复重建' && msg.lx[i].xmlx!='大修' && msg.lx[i].xmlx!='中修'){
								if(msg.lx[i].xmid.substr(10,1)==4)
								xmlx='预防性养护';
								else
									xmlx=msg.lx[i].xmlx;
							}else{
								xmlx=msg.lx[i].xmlx;
							}
							
							var lc=0;
							
							if(parseFloat(msg.lx[i].qdzh)!=parseFloat(obj.zdzh)&&parseFloat(msg.lx[i].zdzh)!=parseFloat(obj.qdzh)){
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
								var qdzh1=msg.lx[i].qdzh;var zdzh1=msg.lx[i].zdzh;
								var qdzh2;var zdzh2;var temp;
								if(parseFloat(qdzh1)>parseFloat(zdzh1)){
									temp=qdzh1;qdzh1=zdzh1;zdzh1=temp;
								}
								for(var j=0;j<msg.ylx.length;j++){
									qdzh2=msg.ylx[j].qdzh;zdzh2=msg.ylx[j].zdzh;
									if(parseFloat(qdzh2)>parseFloat(zdzh2)){
										temp=qdzh2;qdzh2=zdzh2;zdzh2=temp;
									}
									if(parseFloat(qdzh1)<parseFloat(zdzh2)&&parseFloat(zdzh1)>parseFloat(qdzh2)){
										break;
									}
								}
								
								if(parseFloat(qdzh1)<parseFloat(qdzh2)){
									qd=parseFloat(qdzh2);
								}else{
									qd=parseFloat(qdzh1);
								}
								if(parseFloat(zdzh1)>parseFloat(zdzh2)){
									zd=parseFloat(zdzh2);
								}else{
									zd=parseFloat(zdzh1);
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
							alert("重复项目\r"+xsxx);
							if(confirm('是否审核？')){
								//insert();
								$.ajax({
									type:'post',
									url:'../../../qqgl/updateXmsqSpzgc.do',
									data:'xmlx='+5+'&xmbm='+obj.xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
									dataType:'json',
									success:function(msg){
										if(msg.result=="true"){
											selArray.splice(0,selArray.length);
											alert("审核成功!");
											queryShxm();
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
								url:'../../../qqgl/updateXmsqSpzgc.do',
								data:'xmlx='+5+'&xmbm='+obj.xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
								dataType:'json',
								success:function(msg){
									if(msg.result=="true"){
										selArray.splice(0,selArray.length);
										alert("审核成功!");
										queryShxm();
									}
								}
							}); 
							//
						}
						
					}
				}
			});
			
		}
		function batchSp(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt==7 || item.sqzt==0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能审批未通过项目！");
				return;
			}
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/updateXmsqSpzgc.do',
					data:'xmlx='+5+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("审核成功!");
							queryShxm();
						}
					}
				});
			}else{
				alert("请选择要审核的信息！");
			}
		}
		function exportXmsq(){
			var tsdq=$("#tsdq").combobox("getValues").join(",");
			if(tsdq.substr(0,1)==',')
				tsdq=tsdq.substr(1,tsdq.length);
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var lsxmnf=$("#lsxmnf").combobox('getValues').join(",");
			if(lsxmnf=='')
			lsxmnf='';
			if(lsxmnf.substr(0,1)==',')
			lsxmnf=lsxmnf.substr(1,lsxmnf.length);
			var lsxmlx=$("#lsxmlx").combobox('getValues').join(",");
			if(lsxmlx=='')
			lsxmlx='';
			if(lsxmlx.substr(0,1)==',')
			lsxmlx=lsxmlx.substr(1,lsxmlx.length);
			
			var sqzt = $('#sqzt').combobox("getValue");
			if(userPanduan($.cookie("unit2"))!="省"){
				sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				sqzt=sqzt=='' ? -1 : sqzt;
			}
			
			var param='xmlx=5&sqzt='+sqzt+'&xzqhdm='+getxzqhdm('xzqh')+
			'&xmnf='+xmnf+'&jsdj='+$('#jsdj').combobox("getValues").join(",")+
			'&tsdq='+tsdq+'&xmmc='+$('#xmmc').val()+'&lsjl='+$('#lsjl').combobox("getValue")+
			'&ylxbh='+$('#gldj').combobox("getValues").join(",")+"&lxmc="+$("#lxmc").val()+
			"&ghlxbh="+$("#lxbm").combotree('getText')+"&ghlxbm="+$("#ghlxbm").combotree('getText')+
			"&ghlxmc="+$("#ghlxmc").val()+"&lsxmlx="+lsxmlx+"&lsxmnf="+lsxmnf+"&jdbs="+YMLib.Var.jdbs+
			"&wnxmk="+$('#wnxmk').combobox("getValue")+"&xmbm="+$("#xmbm").val();
			
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{tsdq:tsdq},function(){
				window.location.href="/jxzhpt/qqgl/exportExcelXmsqZhcj.do?"+param;
			 });
			
		}
		function importXmsq(){
			importExcel("/jxzhpt/qqgl/importExcelSh.do","shlxsh");
		}
		function openSh(){
			openWindow("shxmadd","添加灾毁重建项目","shxmAdd.jsp",980,400);
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
				var data = "lxsh.xmbm="+xmbm+"&lxsh.bz=sh";
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
		<div id="p_top">前期管理>&nbsp;<span id="spantitle">项目立项</span>>&nbsp;<span id='bstext'></span>>&nbsp;灾毁重建项目管理</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
		<tr>
        	<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 5px;">
        		<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
	       			<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
	       				<font style="color: #0866A0; font-weight: bold"></font>
	      			</legend>
	       			<div>
	       				<table style="margin:5px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
       						<tr height="30">
       							
	       						<!-- <td>&nbsp;管养单位：</td>
	       						<td><select id="gydw" style="width:170px;"></select></td> -->
	       						<!-- <td>&nbsp;行政区划：</td>
	       						<td><select id="xzqh" style="width:124px;"></select></td>
	       						<td>原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:95px;" /></td>
	       						<td>&nbsp;项目名称：</td>
	       						<td><input name="xmmc" id="xmmc" style="width:120px;" type="text"/></td>
	       						<td>项目年份：</td>
	       						<td><select id="xmnf" style="width: 70px;"></select></td>
	       						<td><span id="ztspan">上报状态</span>：</td>
	       						<td><select id="sqzt" class="easyui-combobox" name="jhzt" style="width: 70px;"></select></td> -->
	       						<td align="right">行政区划：</td>
	       						<td><select id="xzqh" style="width:124px;"></select></td>
	       						<td align="right">项目名称：</td>
	       						<td><input name="xmmc" id="xmmc" style="width:80px;" type="text"/></td>
	       						<td align="right">技术等级:</td>
	       						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:118px;"></select></td>
	       						<td align="right">项目年份：</td>
	       						<td><select id="xmnf" style="width: 95px;"></select></td>
	       						<td align="right">行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:80px;" class="easyui-combobox"></select></td>
								
	       					</tr>
	       					<tr height="30">
	       						<!-- <td>&nbsp;技术等级:</td>
	       						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select></td>
	       						<td>规划路线编码：</td>
        						<td><input type="text" id="ghlxbm" style="width:95px;" /></td>
        						<td>规划路线名称：</td>
        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
	       						<td>&nbsp;行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
	       						<td>&nbsp;历史记录：</td>
	       						<td>
	       							<select id="lsjl" class="easyui-combobox" style="width: 81px;">
		       							<option value="" selected="selected">全部</option>
		       							<option value="是">是</option>
		       							<option value="否">否</option>
		       						</select>
	       						</td> -->
	       						<td align="right">原路线编码：</td>
        						<td><input type="text" id="lxbm" style="width:124px;" /></td>
	       						<td align="right">原路线名称：</td>
        						<td><input type="text" id="lxmc" style="width:80px;" /></td>
	       						<td align="right">规划路线编码：</td>
        						<td><input type="text" id="ghlxbm" style="width:118px;" /></td>
        						<td align="right">规划路线名称：</td>
        						<td><input type="text" id="ghlxmc" style="width:95px;" /></td>
        						<td align="right">是否有补助历史：</td>
	       						<td>
	       							<select id="lsjl" class="easyui-combobox" style="width: 80px;">
		       							<option value="" selected="selected">全部</option>
		       							<option value="是">是</option>
		       							<option value="否">否</option>
		       						</select>
	       						</td>
	       						
	       					</tr>
	       					<tr height="30">
		       					<td align="right">特殊地区：</td>
		       						<td><select name="tsdq" id="tsdq" style="width:124px;" class="easyui-combobox"></select></td>
		       						<td align="right"><span id="ztspan">上报状态</span>：</td>
		       						<td><select id="sqzt" class="easyui-combobox" name="jhzt" style="width: 80px;"></select></td>
		       					 <td align="right">五年项目库：</td>
	   							 <td>
      								<select id="wnxmk" class="easyui-combobox" style="width: 118px;">
	       							<option value="" selected="selected">全部</option>
	       							<option value="是">是</option>
	       							<option value="否">否</option>
       								</select>
      							</td>
      							<!-- 筛选历史条件 -->
								<td align="right">历史项目类型：</td>
								<td>
									<select id='lsxmlx' class="easyui-combobox" style="width: 95px;">
									</select>
								</td>
								<td align="right">历史计划年份：</td>
								<td>
									<select id='lsxmnf' class="easyui-combobox" style="width:80px;">
									</select>
								</td>
       							</tr>
       							<tr height="30">
       							<td align="right">项目编码：</td>
								<td><input type="text" id="xmbm" style="width:100px;" /></td>
       							</tr>
       							<tr height="30">
	       						<td colspan="10">
	       							<img onclick="queryShxm()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
									<img id="sb" name="dishi" alt="上报" onclick="batchSb()" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='../../../images/Button/shangbao_1.png'" src="../../../images/Button/shangbao_1.png"/>
									<img id="tj" name="dishi" alt="添加" onclick="openSh()" style="disborder-width:0px;cursor: hand;vertical-align:middle;" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src=""/>
									<img id="sc" name="dishi" alt="删除" onclick="deleteSh()" style="vertical-align:middle;" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'">
									<img id="sp" name="sheng" alt="审批" onclick="batchSp()" style="display:none;border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/sp2.jpg'" alt="上报" onmouseout="this.src='../../../images/Button/sp1.jpg'" src="../../../images/Button/sp1.jpg"/>
					                <img name="sheng" id="thxj" src="../../../images/thxj1.jpg" onmouseover="this.src='../../../images/thxj2.jpg'" onmouseout="this.src='../../../images/thxj1.jpg'   " src=""  onclick="tuihxjlxsh('grid');" style="border-width:0px;vertical-align:middle;" />
					                <img id="dcExcel" name="sheng" onclick="exportXmsq()" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
					                <img id="drExcel" name="dishi" onclick="importXmsq()" alt="导入" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
					                <img id="dcmoban" name="dishi" onclick="exportTemplet('Lxsh_Sh')" alt="导出模版" onmouseover="this.src='../../../images/Button/DC2.gif'" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
	       						</td>
	       					</tr>
	       				</table>
	       			</div>
	       		</fieldset>
        	</td>
        </tr>
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
            	<div><table id="grid"></table></div>
    		</td>
    	</tr>
	</table>
</body>
</html>
