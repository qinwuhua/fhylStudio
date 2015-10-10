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
TD {font-size: 12px;}
a{text-decoration:none;}
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
			$("input[name=checkbox3]:checked").each(function(i,e){	
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	parent.YMLib.Var.sqlcol+=this.value+" v_"+(parseFloat(i)+v1+v2)+",";
		    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
			});
				parent.YMLib.Var.sqlcol=parent.YMLib.Var.sqlcol.substring(0,parent.YMLib.Var.sqlcol.length-1);
				parent.YMLib.Var.tablecol=parent.YMLib.Var.tablecol.substring(0,parent.YMLib.Var.tablecol.length-1);
			parent.$("#grid").datagrid({    
					 url:'/jxzhpt/zdycx/selwqgzsjZdy.do', 
					 queryParams: {
					    	gydw: function(){
					    		if(gydw.substr(gydw.length-2,2)=='00'){
					    			gydw=gydw.substr(0,gydw.length-2);
					    			if(gydw.substr(gydw.length-2,2)=='00'){
					    				gydw=gydw.substr(0,gydw.length-2);
					    			}
					    		}
					    		return gydw;
					    	},
					    	xzqhdm:function(){
					    		if(gydw.substr(gydw.length-2,2)=='00'){
					    			gydw=gydw.substr(0,gydw.length-2);
					    			if(gydw.substr(gydw.length-2,2)=='00'){
					    				gydw=gydw.substr(0,gydw.length-2);
					    			}
					    		}
					    		return gydw;
						 	},
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
				    height:330,
				    width:1050,
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
        }); 

        // 全不选
        $("#bx").bind("click", function () {
            $("[name = checkbox1]:checkbox").attr("checked", false);
            $("[name = checkbox2]:checkbox").attr("checked", false);
            $("[name = checkbox3]:checkbox").attr("checked", false);
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
	});
</script>


<center>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="2" cellspacing="1">
			<tr  style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff;"align="center" >
					<input  type="radio" value="qx" name="radio" id="qx"/>全选
					<input  type="radio" value="fx" name="radio" id="fx"/>反选
					<input  type="radio" value="bx" name="radio" id="bx"/>不选
				</td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="2" style="background-color: #ffffff;width:33%" align="center">项目基本信息</td>
				<td colspan="2" style="background-color: #ffffff;width:34%" align="center">年度计划</td>
				<td colspan="2"  style="background-color: #ffffff;" align="center">施工进展</td>
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
			</tr>
			<tr  style="height: 200px;">
				<td colspan="2" style="background-color: #ffffff;width:34%" align="center" valign="top">
					<table border="0" style="margin-top: 0">
					<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="scsqs" name="checkbox1" class="part1"/>设区市</td>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="scxsq" name="checkbox1" class="part1"/>县（市、区）</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxbm" name="checkbox1" class="part1"/>路线编码</td>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxmc" name="checkbox1" class="part1"/>路线名称</td>
						</tr>
						<tr>
							<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="qlbh" name="checkbox1" class="part1"/>桥梁编号</td>
							<td  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="qlmc" name="checkbox1" class="part1"/>桥梁名称</td>
							
						</tr>
						<tr>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="sck_qlzxzh" name="checkbox1" class="part1"/>中心桩号</td>
							<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="gydw" name="checkbox1" class="part1"/>管养（监管）单位</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="xzqhmc" name="checkbox1" class="part1"/>行政区划</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="tsdq" name="checkbox1" class="part1"/>特殊地区</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="scqlqc" name="checkbox1" class="part1"/>桥梁全长(米)</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="scqlqc" name="checkbox1" class="part1"/>桥梁全宽(米)</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="fapgdw" name="checkbox1" class="part1"/>方案评估(设计)单位</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="fascdw" name="checkbox1" class="part1"/>方案审核(批复)单位</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="faspsj" name="checkbox1" class="part1"/>方案审批时间</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="spwh" name="checkbox1" class="part1"/>审批文号</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jsxz" name="checkbox1" class="part1"/>建设性质</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="tzgs" name="checkbox1" class="part1"/>投资估算</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="hzdj" name="checkbox1" class="part1"/>荷载等级</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="scsjhspl" name="checkbox1" class="part1"/>设计洪水频率</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="kjzh" name="checkbox1" class="part1"/>跨径组合</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="sck_sbjgxs" name="checkbox1" class="part1"/>上部结构形式</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="sck_xbjgxs" name="checkbox1" class="part1"/>下部结构形式</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="sgtpfsj" name="checkbox1" class="part1"/>施工图批复时间</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="scpfwh" name="checkbox1" class="part1"/>批复文号</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="zgq" name="checkbox1" class="part1"/>总工期</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="cjqz" name="checkbox1" class="part1"/>重建桥址</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="sjsd" name="checkbox1" class="part1"/>设计速度(km/h)</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="scthdj" name="checkbox1" class="part1"/>通航等级</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="qljc" name="checkbox1" class="part1"/>桥梁基础</td>
						</tr>
						<tr>
						<td style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="ztz" name="checkbox1" class="part1"/>总投资</td>
							<td style="background-color: #ffffff;" align="left">
							<input  type="checkbox" value="nsqbbz" name="checkbox1" class="part1"/>拟申请部（省）级补助资金（万元）</td>
						</tr>
					</table>
				</td>
				<td colspan="2" style="background-color: #ffffff;width:33%" align="center" valign="top">
					<table>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="sbnf" name="checkbox2" class="part2"/>计划年份</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jhkgsj" name="checkbox2" class="part2"/>计划开工时间</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jhwgsj" name="checkbox2" class="part2"/>计划完工时间</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="sjdw" name="checkbox2" class="part2"/>设计单位</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="sjpfdw" name="checkbox2" class="part2"/>设计批复单位</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="pfwh" name="checkbox2" class="part2"/>批复文号</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="pfsj" name="checkbox2" class="part2"/>批复时间</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="qljsgm" name="checkbox2" class="part2"/>桥梁建设规模</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="zyjsnr" name="checkbox2" class="part2"/>主要建设内容</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="pfztz" name="checkbox2" class="part2"/>批复总投资(万元)</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="ablbz" name="checkbox2" class="part2"/>是否申请按比例补助</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="ablbwh" name="checkbox2" class="part2"/>按比例补助申请文号</td>
						</tr>
						<tr>
							<td width="50%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jhbbz" name="checkbox2" class="part2"/>计划使用省补助金额(万元)</td>
							<td width="50%"  style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jhdfzc" name="checkbox2" class="part2"/>计划使用地方自筹资金(万元)</td>
						</tr>
					</table>
				</td>
				<td colspan="2" style="background-color: #ffffff;width:33%" align="center" valign="top">
					<table>
						<tr>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="xdsj" name="checkbox3" class="part3"/>计划下达时间</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jhxdwh" name="checkbox3" class="part3"/>计划下达文号</td>
						</tr>
						<tr>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="sjkgsj" name="checkbox3" class="part3"/>实际开工时间</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="yjwgsj" name="checkbox3" class="part3"/>预计完工时间</td>
						</tr>
						<tr>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="sgdw" name="checkbox3" class="part3"/>施工单位</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jldw" name="checkbox3" class="part3"/>监理单位</td>
						</tr>
						<tr>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="jsdw" name="checkbox3" class="part3"/>建设单位</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="zljdwj" name="checkbox3" class="part3"/>质量监督文件(单位)</td>
						</tr>
						<tr>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="htje" name="checkbox3" class="part3"/>合同金额（万元）</td>
							<td style="background-color: #ffffff;width:50%" align="left">
								<input  type="checkbox" value="gys" name="checkbox3" class="part3"/>概预算（万元）</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确认</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
			</center>
</body>
</html>