<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编目编码管理</title>
	<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
	<style type="text/css">
		.bgg{border:1px solid #a7d1f9;}
		.bgg tr td{border:1px solid #a7d1f9;width:200px;text-align:center;height:30px;}
	</style>
	<script type="text/javascript">
		$(function(){
			$('#tsdq').combotree({    
			    url:'../../jhgl/queryTsdq.do',
			    valueField:'id',
			    textField:'text',
			    width:125
			});
			
			$('#xtgl_flwbzbz_table').datagrid({
				url:'../../xtgl/queryFlwbzbz.do',
				pagination:false,
				rownumbers:true,
				fitColumns:true,
			    pageNumber:1,
			    pageSize:10,
			    height:260,
			    width:$('#xtgl_flwbzbz_table').parent().width(),
				columns:[[
					{field:'id',title:'操作',width:80,align:'center',
						formatter : function(value, row, index){
							return '<a href="javascript:update('+"'"+row.id+"'"+')">编辑</a>';
						}
					},
					{field:'xmlx',title:'项目类型',width:100,align:'center',
						formatter : function(value, row, index){
							if(value==null || value=="")
								return "无";
							else
								return value;
						}
					},
					{field:'gldj',title:'行政等级',width:100,align:'center',
						formatter:function(value){
							if(value=="X"){
								return '县道';
							}else if(value=="S"){
								return '省道';
							}else if(value=="G"){
								return '国道';
							}else{
								return "无";
							}
						}
					},
					{field:'jsdj',title:'技术等级',width:100,align:'center',
						formatter:function(value){
							if(value==null || value=="")
								return '无';
							else
								return value;
						}
					},
					{field:'tsdq',title:'特殊地区',width:150,align:'center'},
					{field:'bzzj',title:'补助金额(公里/万元)',width:100,align:'center'}
				]],
				toolbar:[
					{
						iconCls: 'icon-add',
						text:'添加',
						handler: function(){
							$('#add').show();
							$('#update').hide();
							$('#tsdq').combotree('clear');
							$('#addFlwbzbz').dialog("open",false);
						}
					},
					{
						iconCls: 'icon-remove',
						text:'删除',
						handler: function(){
							var rows = $('#xtgl_flwbzbz_table').datagrid('getSelections');
							if(rows.length==0){
								alert("请选择要删除的数据！");
								return;
							}
							var id="";
							$.each(rows,function(index,item){
								if(index==rows.length-1){
									id+=item.id;
								}else{
									id+=item.id+",";
								}
							});
							$.ajax({
								type:'post',
								url:'../../xtgl/dropFlwbzbzById.do',
								dataType:'json',
								data:'flwbzbz.id='+id,
								success:function(data){
									if(data.result){
										alert("删除成功！");
										$('#xtgl_flwbzbz_table').datagrid('reload');
									}
								}
							});
						}
					}
				],
				onLoadSuccess:function(){
					loadFdbz();
				}
			});
			
		});
		function addFlwbzbz(){
			var bzbz={'flwbzbz.xmlx':$('#selxmlx').val(),
					'flwbzbz.gldj':$('#gldj').val(),
					'flwbzbz.jsdj':$('#gljsdj').val(),
					'flwbzbz.tsdq':$('#tsdq').combotree("getText"),
					'flwbzbz.bzzj':$('#bzzj').val()
			};
			$.ajax({
				type:'post',
				url:'../../xtgl/addFlwbzbz.do',
				dataType:'json',
				data:bzbz,
				success:function(data){
					if(data.result=="true"){
						$('#addFlwbzbz').dialog("close",false);
						$('#xtgl_flwbzbz_table').datagrid('reload');
					}
				}
			});
		}
		
		function update(id){
			$('#add').hide();
			$('#update').show();
			$.ajax({
				type:'post',
				url:'../../xtgl/queryFlwbzbzById.do',
				dataType:'json',
				data:'flwbzbz.id='+id,
				success:function(data){
					$('#flwid').val(data.id);
					$('#selxmlx').val(data.xmlx),
					$('#gldj').val(data.gldj),
					$('#gljsdj').val(data.jsdj),
					$('#tsdq').combotree("setValue",data.tsdq),
					$('#bzzj').val(data.bzzj);
					$('#addFlwbzbz').dialog("open",false);
				}
			});
		}
		
		function updateFlwbzbz(){
			var bzbz={'flwbzbz.xmlx':$('#selxmlx').val(),
					'flwbzbz.gldj':$('#gldj').val(),
					'flwbzbz.jsdj':$('#gljsdj').val(),
					'flwbzbz.tsdq':$('#tsdq').combotree("getText"),
					'flwbzbz.bzzj':$('#bzzj').val(),
					'flwbzbz.id':$('#flwid').val()
			};
			$.ajax({
				type:'post',
				url:'../../xtgl/updateFlwbzbz.do',
				dataType:'json',
				data:bzbz,
				success:function(data){
					if(data.result){
						$('#addFlwbzbz').dialog("close",false);
						$('#xtgl_flwbzbz_table').datagrid('reload');
					}
				}
			});
		}
		
		function loadFdbz(){
			$.ajax({
				type:'post',
				url:'../../xtgl/queryFlwxmFdfw.do',
				dataType:'json',
				success:function(data){
					$.each(data,function(index,item){
						var html="";
						if(item.xmlx!="" && item.xmlx!=null)
							html="<tr><td><span id='xmlx'>"+item.xmlx+"</span></td><td><input id='fdbz' value='"+item.fdbz+"' type='text'/></td></tr>";
						else
							html="<tr><td><span id='xmlx'>默认</span></td><td><input id='fdbz' value='"+item.fdbz+"' type='text'/></td></tr>";	
						$('#fdfw_tbody').append(html);
					});
				}
			});
		}
		function saveFdfw(){
			var fdfw = $('#fdfw_tbody tr');
			var result=false;
			$.each(fdfw,function(index,item){
				var fdbz={'flwbzbz.xmlx':$(item).find("span[id='xmlx']").html(),
						'flwbzbz.fdbz':$(item).find("input[id='fdbz']").val()};
				$.ajax({
					type:'post',
					async:false,
					url:'../../xtgl/updateFdbzByXmlx.do',
					data:fdbz,
					dataType:'json',
					success:function(data){
						if(!data){
							alert(fdbz['flwbzbz.xmlx']+"项目的浮动标准修改出错！");
							result=false;
						}else{
							result=true;
						}
					}
				});
				return result;
			});
			if(result){
				alert("项目浮动标准修改成功!");
			}
		}
	</script>
</head>
<body>
	<div border="false">
		<div data-options="region:'north',border:true,split:true" style="height:40px;border-left:0px;border-right:0px;border-top:0px;">
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;非路网项目补助标准</div>
			</div>
		</div>
		<div region="center" border="false" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
			<table id="xtgl_flwbzbz_table"></table>
		</div>
	</div>
	<div>
		<table class="bgg">
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">计划总投资浮动范围设置
				</td>
			</tr>
			<tr>
				<td style="width: 50px;">项目类型</td>
				<td style="width: 100px;">浮动范围</td>
			</tr>
			<tbody id="fdfw_tbody"></tbody>
			<tr>
				<td colspan="2">
					<input type="button" value=" 保   存 " onclick="saveFdfw()"/>
				</td>
			</tr>
		</table>
	</div>
	<div id="addFlwbzbz" class="easyui-dialog" title="添加补助标准" style="width:250px;height:200px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<table>
			<tr style="height: 25px;">
				<td width="100" align="right" style="padding-right: 10px;">项目类型</td>
				<td width="150" align="left">
				<input type="hidden" id="flwid"/>
					<select id="selxmlx" style="width: 125px;">
						<option value="">--请选择--</option>
						<option value="升级改造工程项目">升级改造工程项目</option>
						<option value="路面改造工程项目">路面改造工程项目</option>
						<option value="新建工程项目">新建工程项目</option>
						<option value="大中修工程项目">大中修工程项目</option>
						<option value="水毁项目">灾毁重建</option>
						<option value="红色旅游项目">红色旅游项目</option>
					</select>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">行政等级</td>
				<td>
					<select id="gldj" style="width: 80px;">
						<option value="">--请选择--</option>
						<option value="G">国道</option>
						<option value="S">省道</option>
						<option value="X">县道</option>
					</select>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">公路技术等级</td>
				<td>
					<select id="gljsdj" style="width: 80px;">
						<option value="">--请选择--</option>
						<option value="一级公路">一级公路</option>
						<option value="二级公路">二级公路</option>
						<option value="三级公路">三级公路</option>
						<option value="四级公路">四级公路</option>
						<option value="等外公路">等外公路</option>
					</select>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">特殊地区</td>
				<td>
					<select id="tsdq" style="width: 100px;"></select>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">补助金额</td>
				<td>
					<input id="bzzj" style="width: 120px;" type="text"/>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="2" align="center">
					<input id="add" type="button" onclick="addFlwbzbz()" value="添加补助标准" style="margin-top: 5px;"/>
					<input id="update" type="button" onclick="updateFlwbzbz()" value="修改补助标准" style="margin-top: 5px;"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
