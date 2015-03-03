<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修路面参数设置</title>
	<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#tsdq').combotree({    
			    url:'../../jhgl/queryTsdq.do',
			    valueField:'id',
			    textField:'text',
			    width:125
			});
			
			$('#xtgl_flwbzbz_table').datagrid({
				url:'../../xtgl/queryYhdzxcs.do',
				//pagination:true,
				rownumbers:true,
			    pageNumber:1,
			    pageSize:1,
			    height:470,
			    width:600,
				columns:[[
					{field:'id',title:'操作',width:80,align:'center',
						formatter : function(value, row, index){
							return '<a href="javascript:loadYhdzxlmcs('+"'"+row.id+"'"+')">编辑</a>';
						}
					},
					{field:'cslx',title:'参数类型',width:100,align:'center'},
					{field:'clmc',title:'材料名称',width:190,align:'center'},
					{field:'lfmdj',title:'立方米单价',width:96,align:'center'},
					{field:'sddj',title:'审定单价',width:100,align:'center'}
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
				]
			});
		});
		
		function addYhdzxlmcs(){
			var lmcs = {
					'yhdzxcs.cslx' : $('#addsellmjg').val(),
					'yhdzxcs.clmc' : $('#txtclmc').val(),
					'yhdzxcs.lfmdj' : $('#txtlfmdj').val(),
					'yhdzxcs.sddj' : $('#txtsddj').val()
				};
			$.ajax({
				url:'../../xtgl/addYhdzxcs.do',
				data:lmcs,
				dataType:'json',
				success:function(result){
					alert("添加成功！");
					$('#addFlwbzbz').dialog("close");
					$('#xtgl_flwbzbz_table').datagrid('reload');
				},
				error:function(){
					alert("添加错误！");
				}
			});
		}
		
		function loadYhdzxlmcs(id){
			$('#add').hide();
			$('#update').show();
			$.ajax({
				url:'../../xtgl/queryYhdzxcsById.do',
				data:'yhdzxcs.id='+id,
				dataType:'json',
				success:function(result){
					$('#yhdzxcsid').val(result.id);
					$('#addsellmjg').val(result.cslx);
					$('#txtclmc').val(result.clmc);
					$('#txtlfmdj').val(result.lfmdj);
					$('#txtsddj').val(result.sddj);
					$('#addFlwbzbz').dialog("open",false);
				}
			});
		}
		
		function updateYhdzxcs(){
			var lmcs = {
					'yhdzxcs.id':$('#yhdzxcsid').val(),
					'yhdzxcs.cslx' : $('#addsellmjg').val(),
					'yhdzxcs.clmc' : $('#txtclmc').val(),
					'yhdzxcs.lfmdj' : $('#txtlfmdj').val(),
					'yhdzxcs.sddj' : $('#txtsddj').val()
				};
			$.ajax({
				url:'../../xtgl/updateYhdzxcs.do',
				data:lmcs,
				dataType:'json',
				success:function(result){
					alert("修改成功！");
					$('#addFlwbzbz').dialog("close");
					$('#xtgl_flwbzbz_table').datagrid('reload');
				},
				error:function(){
					alert("修改出错！");
				}
			});
		}
		function selchange(){
			$.ajax({
				type:'post',
				url:'../../xtgl/queryYhdzxcsByLx.do',
				dataType:'json',
				async:'false',
				data:'yhdzxcs.cslx='+$('#selcslx').val(),
				success:function(result){
					$('#xtgl_flwbzbz_table').datagrid("loadData",result);
				}
			});
		}
	</script>
</head>
<body>
	<div border="false">
		<div data-options="region:'north',border:true,split:true" style="height:40px;border-left:0px;border-right:0px;border-top:0px;">
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;养护大中修路面参数设置</div>
			</div>
		</div>
		<div style="margin-left: 20px;margin-bottom: 5px;">
			<span>参数类型：</span>
			<select onchange="selchange()" id="selcslx" style="width: 80px;">
				<option selected="selected">-请选择-</option>
				<option value="上面层">上面层</option>
				<option value="中面层">中面层</option>
				<option value="下面层">下面层</option>
				<option value="封层">封层</option>
				<option value="上基层">上基层</option>
				<option value="中基层">中基层</option>
				<option value="下基层">下基层</option>
				<option value="垫层">垫层</option>
				<option value="原路">原路</option>
			</select>
		</div>
		<div region="center" border="false" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;height:700px;" onselectstart="return false">
			<table id="xtgl_flwbzbz_table"></table>
		</div>
	</div>
	<div id="addFlwbzbz" class="easyui-dialog" title="添加补助标准" style="width:250px;height:200px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<table>
			<tr style="height: 25px;">
				<td width="100" align="right" style="padding-right: 10px;">参数类型</td>
				<td width="150" align="left">
					<input type="hidden" id="yhdzxcsid"/>
					<select id="addsellmjg" style="width: 80px;">
						<option selected="selected">-请选择-</option>
						<option value="上面层">上面层</option>
						<option value="中面层">中面层</option>
						<option value="下面层">下面层</option>
						<option value="封层">封层</option>
						<option value="上基层">上基层</option>
						<option value="中基层">中基层</option>
						<option value="下基层">下基层</option>
						<option value="垫层">垫层</option>
						<option value="原路">原路</option>
					</select>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">材料名称</td>
				<td>
					<input id="txtclmc" type="text"/>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">立方米单价</td>
				<td>
					<input type="text" id="txtlfmdj"/>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">审定单价</td>
				<td>
					<input id="txtsddj" type="text">
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="2" align="center">
					<input id="add" type="button" onclick="addYhdzxlmcs()" value="添加" style="margin-top: 5px;"/>
					<input id="update" type="button" onclick="updateYhdzxcs()" value="修改" style="margin-top: 5px;"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>