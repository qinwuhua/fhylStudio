<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>选择路线</title>
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
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			loadBmbm3("mqi","MQI等级");
		});
		
		function showAllgsd(){
			$("#cxtj").attr('style','display:none');
			$("#xsdata").attr('style','');
			
			var mqi=$('#mqi').combobox("getValues").join(",");
			if(mqi.substr(0,1)==',')
				mqi=mqi.substr(1,mqi.length);
			
			$('#datagrid').datagrid({    
			    url:'/jxzhpt/tjfx/selectKxjcLx.do',
			    striped:true,
			    pagination:false,
			    rownumbers:true,
			   checkOnSelect:true,
//  		   checkOnSelect: false, 
// 			   selectOnCheck: false,
// 			   idField: 'LXBH', 
// 			   fit: false, 
// 			   fitColumns: true, 
			    height:$(window).height()-40,
			    width:$(window).width()-20,
			    queryParams: {
			    	'lkmxb.lxbm':$("#lxbm").val(),
					'lkmxb.mqi':mqi,
					'lkmxb.xzdj':$("#xzdj").val()
				},
			    columns:[[
			        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
					{field : 'LXBH',title : '路线编号',width : 110,align : 'center'},
					{field : 'YDL',title : '优等路(公里)',width : 110,align : 'center'},
					{field:  'LDL',title:'良等路(公里)',width:110,align:'center'},
			        {field : 'ZDL',title : '中等路(公里)',width : 110,align : 'center'},
			        {field : 'CDL',title : '次等路(公里)',width : 110,align : 'center'},
/* 			        {field: 'op16', title: '<input id=\"cadlcheckbox\" type=\"checkbox\"  >', width: 30,
					    formatter: function (value, rec, rowIndex) {
						    return "<input type=\"checkbox\"  name=\"CADL\" value=\"" + rec.LXBH + "\" >";
						}
					},
 */			        {field : 'CADL',title:'差等路(公里)',width:110,align:'center'},
			    ]],
			    onLoadSuccess: function () {
			    	/* $("#lxcheckbox").unbind();
	                $("#ydlcheckbox").unbind();
	                $("#ldlcheckbox").unbind();
	                $("#zdlcheckbox").unbind();
	                $("#cdlcheckbox").unbind();
	                $("#cadlcheckbox").unbind();
	                
	             //路线复选
	             $("input[name='LX']").unbind().bind("click", function () {
						//总记录数
						var totolrows = $("input[name='LX']").length;
						//选中的记录数
						var checkrows = $("input[name='LX']:checked").length;
						//全选
						if (checkrows == totolrows) {
						    $("#lxcheckbox").attr("checked", 'checked');
						}
						else {
						    $("#lxcheckbox").removeAttr("checked");
						}
						
						$("#lxlist").val("");
						var items = $("input[name='LX']:checked");
						var result = "";
						$.each(items, function (index, item) {
						    result += item.value+',';
						});
						$("#lxlist").val(result);
				     });
				
					//全选
				$("#lxcheckbox").click(function () {
						if ($(this).attr('checked') == 'checked') {
						    $("input[name='LX']").attr("checked", 'checked');
						} else {
						    $("input[name='LX']").removeAttr("checked");
						}
						$("#lxlist").val("");
						var items = $("input[name='LX']:checked");
						var result = "";
						$.each(items, function (index, item) {
						    result += item.value+',';
						});
						$("#lxlist").val(result);
					   });   
					
			  //优等路复选		
	           $("input[name='YDL']").unbind().bind("click", function () {
					//总记录数
					var totolrows = $("input[name='YDL']").length;
					//选中的记录数
					var checkrows = $("input[name='YDL']:checked").length;
					//全选
					if (checkrows == totolrows) {
					    $("#ydlcheckbox").attr("checked", 'checked');
					}
					else {
					    $("#ydlcheckbox").removeAttr("checked");
					}
					
					$("#ydllist").val("");
					var items = $("input[name='YDL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#ydllist").val(result);
			     });
			
			  $("#ydlcheckbox").click(function () {
					if ($(this).attr('checked') == 'checked') {
					    $("input[name='YDL']").attr("checked", 'checked');
					} else {
					    $("input[name='YDL']").removeAttr("checked");
					}
					$("#ydllist").val("");
					var items = $("input[name='YDL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#ydllist").val(result);
				   }); 
			  
			//良等路复选		
	           $("input[name='LDL']").unbind().bind("click", function () {
					//总记录数
					var totolrows = $("input[name='LDL']").length;
					//选中的记录数
					var checkrows = $("input[name='LDL']:checked").length;
					//全选
					if (checkrows == totolrows) {
					    $("#ldlcheckbox").attr("checked", 'checked');
					}
					else {
					    $("#ldlcheckbox").removeAttr("checked");
					}
					
					$("#ldllist").val("");
					var items = $("input[name='LDL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#ldllist").val(result);
			     });
			
			  $("#ldlcheckbox").click(function () {
					if ($(this).attr('checked') == 'checked') {
					    $("input[name='LDL']").attr("checked", 'checked');
					} else {
					    $("input[name='LDL']").removeAttr("checked");
					}
					$("#ldllist").val("");
					var items = $("input[name='LDL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#ldllist").val(result);
				   }); 
			  
			//中等路复选		
	           $("input[name='ZDL']").unbind().bind("click", function () {
					//总记录数
					var totolrows = $("input[name='ZDL']").length;
					//选中的记录数
					var checkrows = $("input[name='ZDL']:checked").length;
					//全选
					if (checkrows == totolrows) {
					    $("#zdlcheckbox").attr("checked", 'checked');
					}
					else {
					    $("#zdlcheckbox").removeAttr("checked");
					}
					
					$("#zdllist").val("");
					var items = $("input[name='ZDL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#zdllist").val(result);
			     });
			
			  $("#zdlcheckbox").click(function () {
					if ($(this).attr('checked') == 'checked') {
					    $("input[name='ZDL']").attr("checked", 'checked');
					} else {
					    $("input[name='ZDL']").removeAttr("checked");
					}
					$("#zdllist").val("");
					var items = $("input[name='ZDL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#zdllist").val(result);
				   }); 
			  
			//次等路复选		
	           $("input[name='CDL']").unbind().bind("click", function () {
					//总记录数
					var totolrows = $("input[name='CDL']").length;
					//选中的记录数
					var checkrows = $("input[name='CDL']:checked").length;
					//全选
					if (checkrows == totolrows) {
					    $("#cdlcheckbox").attr("checked", 'checked');
					}
					else {
					    $("#cdlcheckbox").removeAttr("checked");
					}
					
					$("#cdllist").val("");
					var items = $("input[name='CDL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#cdllist").val(result);
			     });
			
			  $("#cdlcheckbox").click(function () {
					if ($(this).attr('checked') == 'checked') {
					    $("input[name='CDL']").attr("checked", 'checked');
					} else {
					    $("input[name='CDL']").removeAttr("checked");
					}
					$("#cdllist").val("");
					var items = $("input[name='CDL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#cdllist").val(result);
				   }); 
			  
			  
			//差等路复选		
	           $("input[name='CADL']").unbind().bind("click", function () {
					//总记录数
					var totolrows = $("input[name='CADL']").length;
					//选中的记录数
					var checkrows = $("input[name='CADL']:checked").length;
					//全选
					if (checkrows == totolrows) {
					    $("#cadlcheckbox").attr("checked", 'checked');
					}
					else {
					    $("#cadlcheckbox").removeAttr("checked");
					}
					
					$("#cadllist").val("");
					var items = $("input[name='CADL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#cadllist").val(result);
			     });
			
			  $("#cadlcheckbox").click(function () {
					if ($(this).attr('checked') == 'checked') {
					    $("input[name='CADL']").attr("checked", 'checked');
					} else {
					    $("input[name='CADL']").removeAttr("checked");
					}
					$("#cadllist").val("");
					var items = $("input[name='CADL']:checked");
					var result = "";
					$.each(items, function (index, item) {
						result += item.value+',';
					});
					$("#cadllist").val(result);
				   });  */

			    }
			}); 
		}
		
		function ckxlwjg(){
			 var gr=$("#datagrid").datagrid('getSelections');
			
			if(gr.length==0){
				alert("请勾选项目");
				return;
			}
			
		    var lxbm="";
			for(var i=0;i<gr.length;i++){
				lxbm+=gr[i].LXBH+',';
			}
			lxbm=lxbm.substring(0,lxbm.length-1);
			
			parent.lxbm=lxbm; 
			
			var mqi=$('#mqi').combobox("getValues").join(",");
			if(mqi.substr(0,1)==',')
				mqi=mqi.substr(1,mqi.length);
			
			var title='';
			if(parent.$("#tjfl").val()=='1'){
				title={field:'XZQH',title:'行政区划',width:200,align:'center',fixed:true};
			}else{
				title={field:'LXBM',title:'路线编码',width:200,align:'center',fixed:true};
			}
			
			parent.$('#grid').datagrid({    
			    url:'/jxzhpt/tjfx/queryKxjc_lx.do',
			    striped:true,
			    pagination:false,
			    rownumbers:false,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:parent.y,
			    width:parent.x,
			    queryParams: {
					'tjfl':parent.$("#tjfl").val(),
					'xmsq.lxbm':lxbm,
					/* 'lkmxb.ydl':$("#ydllist").val(),
					'lkmxb.ldl':$("#ldllist").val(),
					'lkmxb.zdl':$("#zdllist").val(),
					'lkmxb.cdl':$("#cdllist").val(),
					'lkmxb.cadl':$("#cadllist").val(), */
					'lkmxb.mqi':mqi,
					'xmsq.xzqh':$("#xzdj").val()
				},
			    columns:[[
                    title,
                    {field:'LC',title:'里程(公里)',width:150,align:'center'},
                    {field:'BZZJ',title:'补助资金(万元)',width:150,align:'center'}
			    ]]
				 
			}); 
			
			parent.$('#xmyc').window('destroy');
			
		}
	
		function fhsxtj(){
			$("#cxtj").attr('style','');
			$("#xsdata").attr('style','display:none');
		}
	</script>
	<style type="text/css">
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
							<td style="width: 100px;">行政等级：</td>
							<td style="width: 176px;">
								<select id="xzdj" style="width:70px;">
								<option value="">全部</option>
								<option value="G">国道</option>
								<option value="S">省道</option>
								</select>
							</td>
							<td style="width: 100px;">路线编码：</td>
							<td style="width: 176px;">
								<input id='lxbm' type="text" />
							</td>
        					<td>MQI等级：</td>
							<td><select id="mqi" style="width:80px"class="easyui-combobox"></select></td>
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
            	<a id='mybuttion3' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:ckxlwjg()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">查看项目预测</a>
            		<div style="padding-left: 5px;padding-top:5px; font-size:12px;">
            			<table id="datagrid">
            			<input type="hidden" id="lxlist" name="lxlist" value="">
            			<input type="hidden" id="ydllist" name="ydllist" value="">
            			<input type="hidden" id="ldllist" name="ldllist" value="">
            			<input type="hidden" id="zdllist" name="zdllist" value="">
            			<input type="hidden" id="cdllist" name="cdllist" value="">
            			<input type="hidden" id="cadllist" name="cadllist" value="">
            			</table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
