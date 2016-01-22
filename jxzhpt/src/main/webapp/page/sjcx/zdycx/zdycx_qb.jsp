<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目字段选择列表</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YMLib.js"></script>
<script type="text/javascript" src="../js/sjcx.js"></script>
<style type="text/css">
TD {
font-size: 11px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
<script type="text/javascript">
	$(function(){
		var nameValue;
		var colValue;
		var tableValue;
		var tableCol;
		var gydw=parent.YMLib.Var.gydw;
		var xzqhdm=parent.YMLib.Var.xzqhdm;
		var kgzt=parent.YMLib.Var.kgzt;
		var lxmc=parent.YMLib.Var.lxmc;
		var lxbm=parent.YMLib.Var.lxbm;
		var xmlx=parent.YMLib.Var.xmlx;
		var xmnf=parent.YMLib.Var.xmnf;
		$("#save_button").click(function(){
			nameValue=new Array();
			colValue= new Array();
			tableValue=new Array();
			tableCol=new Array();
			parent.YMLib.Var.sqlcol="";
			parent.YMLib.Var.tablecol="";
				 var checkboxes1 = document.getElementsByName("checkbox1"); 
				 var v1=parseFloat(checkboxes1.length);
				$("input[name=checkbox1]:checked").each(function(i,e){	
					colValue.push(this.value);
			    	nameValue.push(this.nextSibling.nodeValue);
			    	parent.YMLib.Var.sqlcol+=this.value+" v_"+i+",";
			    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
				});
			var checkboxes2 = document.getElementsByName("checkbox2");
			var v2=parseFloat(checkboxes2.length);
			$("input[name=checkbox2]:checked").each(function(i,e){	
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	parent.YMLib.Var.sqlcol+=this.value+" v_"+(parseFloat(i)+v1)+",";
		    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
			});
			var checkboxes3 = document.getElementsByName("checkbox3");
			var v3=parseFloat(checkboxes3.length);
			$("input[name=checkbox3]:checked").each(function(i,e){	
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	parent.YMLib.Var.sqlcol+=this.value+" v_"+(parseFloat(i)+v1+v2)+",";
		    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
			});
			var checkboxes4 = document.getElementsByName("checkbox4");
			var v4=parseFloat(checkboxes4.length);
			$("input[name=checkbox4]:checked").each(function(i,e){	
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	parent.YMLib.Var.sqlcol+=this.value+" v_"+(parseFloat(i)+v1+v2+v3)+",";
		    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
			});
			$("input[name=checkbox5]:checked").each(function(i,e){	
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	parent.YMLib.Var.sqlcol+=this.value+" v_"+(parseFloat(i)+v1+v2+v3+v4)+",";
		    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
			});
				parent.YMLib.Var.sqlcol=parent.YMLib.Var.sqlcol.substring(0,parent.YMLib.Var.sqlcol.length-1);
				parent.YMLib.Var.tablecol=parent.YMLib.Var.tablecol.substring(0,parent.YMLib.Var.tablecol.length-1);
			parent.$("#grid").datagrid({    
					 url:'/jxzhpt/zdycx/selqbZdy.do', 
					 queryParams: {
					    	gydw:gydw,
					    	xzqhdm:xzqhdm,
					    	kgzt: kgzt,
					    	lxmc:lxmc,
					    	lxbm:lxbm,
					    	xmlx:xmlx,
					    	xmnf:xmnf
						},
					striped:true,
				    pagination:true,
				    rownumbers:true,
				    pageNumber:1,
				    pageSize:10,
				    height:345,
				    width:1154,
			}); 
 			var this_width;
			if (nameValue.length > 7) {

				this_width = 120;
			} else {
				this_width = 1080 / (nameValue.length) - 10;
			}
			for ( var i = 0; i < nameValue.length; i++) {
				var obj;
				obj = {
					field : colValue[i],
					title : nameValue[i],
					align : 'center',
					width : this_width
				};
				tableValue.push(obj);
			}
		 	var options =parent.$("#grid").datagrid("options");
			tableCol.push(tableValue);
			options.columns = tableCol;
			parent.$('#grid').datagrid(options); 
			parent.$('#zd_wqgz').window('destroy');
		});
		
		$("#qx_window").click(function(){
			parent.$('#zd_wqgz').window('destroy');
		});	
	
		// 全选
		$("#qx").bind("click", function () {
            $("[name = checkbox1]:checkbox").attr("checked", true);
            $("[name = checkbox2]:checkbox").attr("checked", true);
            $("[name = checkbox3]:checkbox").attr("checked", true);
            $("[name = checkbox4]:checkbox").attr("checked", true);
            $("[name = checkbox5]:checkbox").attr("checked", true);
        }); 

        // 全不选
        $("#bx").bind("click", function () {
            $("[name = checkbox1]:checkbox").attr("checked", false);
            $("[name = checkbox2]:checkbox").attr("checked", false);
            $("[name = checkbox3]:checkbox").attr("checked", false);
            $("[name = checkbox4]:checkbox").attr("checked", false);
            $("[name = checkbox5]:checkbox").attr("checked", false);
        });

        // 反选
        $("#fx").bind("click", function () {
            $("[name = checkbox1]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
            $("[name = checkbox2]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
            $("[name = checkbox3]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
            $("[name = checkbox4]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
            $("[name = checkbox5]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器1
        $("#qx1").bind("click", function () {
        	$(".part1").attr("checked", true);
        });
        $("#bx1").bind("click", function () {
            $(".part1").attr("checked", false);
        });
        $("#fx1").bind("click", function () {
            $(".part1").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器2
        $("#qx2").bind("click", function () {
        	$(".part2").attr("checked", true);
        });
        $("#bx2").bind("click", function () {
            $(".part2").attr("checked", false);
        });
        $("#fx2").bind("click", function () {
            $(".part2").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        // 类选择器3
        $("#qx3").bind("click", function () {
        	$(".part3").attr("checked", true);
        });
        $("#bx3").bind("click", function () {
            $(".part3").attr("checked", false);
        });
        $("#fx3").bind("click", function () {
            $(".part3").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
     // 类选择器4
        $("#qx4").bind("click", function () {
        	$(".part4").attr("checked", true);
        });
        $("#bx4").bind("click", function () {
            $(".part4").attr("checked", false);
        });
        $("#fx4").bind("click", function () {
            $(".part4").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
     // 类选择器5
        $("#qx5").bind("click", function () {
        	$(".part5").attr("checked", true);
        });
        $("#bx5").bind("click", function () {
            $(".part5").attr("checked", false);
        });
        $("#fx5").bind("click", function () {
            $(".part5").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
        });
        
	});
</script>


<center>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="2" cellspacing="1">
			<tr  style="height: 30px;">
				<td colspan="10" style="background-color: #ffffff;"align="center" >
					<input  type="radio" value="qx" name="radio" id="qx"/>全选
					<input  type="radio" value="fx" name="radio" id="fx"/>反选
					<input  type="radio" value="bx" name="radio" id="bx"/>不选
				</td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="2" style="background-color: #ffffff;width:20%" align="center">立项审核</td>
				<td colspan="2" style="background-color: #ffffff;width:20%" align="center">工程可行性研究</td>
				<td colspan="2" style="background-color: #ffffff;width:20%" align="center">初步设计或施工图设计</td>
				<td colspan="2" style="background-color: #ffffff;width:18%" align="center">计划审核</td>
				<td colspan="2"  style="background-color: #ffffff;width:22%" align="center">施工进展</td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="2" style="background-color: #ffffff;" align="center">
					<input  type="radio" value="qx" name="radio1" id="qx1"/>全选
					<input  type="radio" value="fx" name="radio1" id="fx1"/>反选
					<input  type="radio" value="bx" name="radio1" id="bx1"/>不选</td>
				<td colspan="2" style="background-color: #ffffff;" align="center">
					<input  type="radio" value="qx" name="radio2" id="qx2"/>全选
					<input  type="radio" value="fx" name="radio2" id="fx2"/>反选
					<input  type="radio" value="bx" name="radio2" id="bx2"/>不选</td>
				<td colspan="2" style="background-color: #ffffff;" align="center">
					<input  type="radio" value="qx" name="radio3" id="qx3"/>全选
					<input  type="radio" value="fx" name="radio3" id="fx3"/>反选
					<input  type="radio" value="bx" name="radio3" id="bx3"/>不选</td>
				<td colspan="2" style="background-color: #ffffff;" align="center">
					<input  type="radio" value="qx" name="radio4" id="qx4"/>全选
					<input  type="radio" value="fx" name="radio4" id="fx4"/>反选
					<input  type="radio" value="bx" name="radio4" id="bx4"/>不选</td>
				<td colspan="2" style="background-color: #ffffff;" align="center">
					<input  type="radio" value="qx" name="radio5" id="qx5"/>全选
					<input  type="radio" value="fx" name="radio5" id="fx5"/>反选
					<input  type="radio" value="bx" name="radio5" id="bx5"/>不选</td>
			</tr>
			<tr  style="height: 200px;">
				<td colspan="2" style="background-color: #ffffff;width:34%" align="center" valign="top">
					<table border="0" style="margin-top: 0">
					<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxxmlx" name="checkbox1" class="part1"/>项目类型</td>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxxmmc" name="checkbox1" class="part1"/>项目名称</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxxmbm" name="checkbox1" class="part1"/>项目编码</td>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxgydw" name="checkbox1" class="part1"/>管养单位</td>
						</tr>
						<tr>
							<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxxzqh" name="checkbox1" class="part1"/>行政区划</td>
							<td  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxlxbm" name="checkbox1" class="part1"/>路线编码</td>
							
						</tr>
						<tr>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="lxlxmc" name="checkbox1" class="part1"/>路线名称</td>
							<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxqdzh" name="checkbox1" class="part1"/>起点桩号</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxzdzh" name="checkbox1" class="part1"/>止点桩号</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="lxqdmc" name="checkbox1" class="part1"/>起点名称</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxzdmc" name="checkbox1" class="part1"/>止点名称</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="lxlc" name="checkbox1" class="part1"/>里程</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxjsdj" name="checkbox1" class="part1"/>技术等级</td>
						<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="lxjsxz" name="checkbox1" class="part1"/>建设性质</td>							
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="lxjhkgn" name="checkbox1" class="part1"/>计划开工年</td>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxjhwgn" name="checkbox1" class="part1"/>计划完工年</td>							
						</tr>
						
					</table>
				</td>
				<td colspan="2" style="background-color: #ffffff;" align="center" valign="top">
					<table>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkxzqh" name="checkbox2" class="part2"/>行政区划</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkqdzh" name="checkbox2" class="part2"/>起点桩号</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkzdzh" name="checkbox2" class="part2"/>止点桩号</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkqdmc" name="checkbox2" class="part2"/>起点名称</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkzdmc" name="checkbox2" class="part2"/>止点名称</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gklc" name="checkbox2" class="part2"/>里程</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkdq" name="checkbox2" class="part2"/>特大桥(座)</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkdqm" name="checkbox2" class="part2"/>特大桥(米)</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gksd" name="checkbox2" class="part2"/>隧道(座)</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gksdm" name="checkbox2" class="part2"/>隧道(米)</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkkgny" name="checkbox2" class="part2"/>开工年月</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkwgny" name="checkbox2" class="part2"/>完工年月</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkbzdw" name="checkbox2" class="part2"/>编制单位</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gktzgs" name="checkbox2" class="part2"/>投资估算</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkpfwh" name="checkbox2" class="part2"/>工可批复文号</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gkpfsj" name="checkbox2" class="part2"/>批复时间</td>
						</tr>
						
					</table>
				</td>
				
				<td colspan="2" style="background-color: #ffffff;" align="center" valign="top">
					<table>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbxmmc" name="checkbox3" class="part3"/>项目名称</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbxzqh" name="checkbox3" class="part3"/>行政区划</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbqdzh" name="checkbox3" class="part3"/>起点桩号</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbzdzh" name="checkbox3" class="part3"/>止点桩号</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbqdmc" name="checkbox3" class="part3"/>起点名称</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbzdmc" name="checkbox3" class="part3"/>止点名称</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cblc" name="checkbox3" class="part3"/>里程</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbjsdj" name="checkbox3" class="part3"/>技术等级</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbjsdw" name="checkbox3" class="part3"/>建设单位</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbjsxz" name="checkbox3" class="part3"/>建设性质</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbkgsj" name="checkbox3" class="part3"/>开工时间</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbwgsj" name="checkbox3" class="part3"/>完工时间</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbgq" name="checkbox3" class="part3"/>工期(月)</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbsjdw" name="checkbox3" class="part3"/>设计单位</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbsjpfwh" name="checkbox3" class="part3"/>设计批复文号</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cbpfsj" name="checkbox3" class="part3"/>批复时间</td>
						</tr>
						
					</table>
				</td>
				
					<td colspan="2" style="background-color: #ffffff;" align="center" valign="top">
					<table>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shlxbm" name="checkbox4" class="part4"/>路线编码</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shlxmc" name="checkbox4" class="part4"/>路线名称</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shqdzh" name="checkbox4" class="part4"/>起点桩号</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shzdzh" name="checkbox4" class="part4"/>止点桩号</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shlc" name="checkbox4" class="part4"/>里程</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shjsdj" name="checkbox4" class="part4"/>技术等级</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shztz" name="checkbox4" class="part4"/>总投资</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shbbz" name="checkbox4" class="part4"/>部补助</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shsbz" name="checkbox4" class="part4"/>省补助</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shxdwh" name="checkbox4" class="part4"/>下达文号</td>
						</tr>
						<tr>
							<td colspan="2" width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="shxdsj" name="checkbox4" class="part4"/>下达时间</td>
							
						</tr>
						
						
					</table>
				</td>
				
				<td colspan="2" style="background-color: #ffffff;" align="center" valign="top">
					<table>
						<tr>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jzsjkgsj" name="checkbox5" class="part5"/>实际开工时间</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jzyjwgsj" name="checkbox5" class="part5"/>预计完工时间</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jzsjwgsj" name="checkbox5" class="part5"/>实际完工时间</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jzsgdw" name="checkbox5" class="part5"/>施工单位</td>
							
						</tr>
						<tr>
						<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jzjldw" name="checkbox5" class="part5"/>监理单位</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jzjsdw" name="checkbox5" class="part5"/>建设单位</td>
						
						</tr>
						<tr>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jzhtje" name="checkbox5" class="part5"/>合同金额(万元)</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jzgys" name="checkbox5" class="part5"/>概预算(万元)</td>
	
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td colspan="10" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确认</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
			</center>
</body>
</html>