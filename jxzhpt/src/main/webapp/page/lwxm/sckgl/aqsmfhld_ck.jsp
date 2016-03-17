<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css"/>
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>

<style type="text/css">
TD {
font-size: 12px;
} 
a{
text-decoration:none;
}
</style>
</head>
<body>
<script type="text/javascript">
	$(function(){
		$("#qx_window").click(function(){
			parent.$('#lxxx').window('destroy');
		});	
		loadXX();
	});
	
	function loadXX(){
		$.ajax({
			type:'post',
			url:'/jxzhpt/aqsmfh/selectAqsmfhxmkbyid.do',
	        data:"xmkaqsmfh.id="+parent.xmkid,
			dataType:'json',
			success:function(item){
				if(item.jsdj=='1'||item.jsdj=='2'){
					jsdjmb="1";
					$("#yjej").attr('style','');
					$("#sjsj").attr('style','display: none');
					$("#jsdj1").html(item.jsdj);$("#fangx1").html(item.fangx);
					$("#ldfl1").html(item.ldfl);$("#pcsj1").html(item.pcsj);$("#jtsgpcf").html(item.jtsgpcf);$("#jtsgfxdj").html(item.jtsgfxdj);$("#glfxdj").html(item.glfxdj);$("#xbjyqx").html(item.xbjyqx);$("#jckbgf").html(item.jckbgf);$("#jtl").html(item.jtl);$("#gldj1").html(item.gldj);
				}else{
					jsdjmb="2";
					$("#yjej").attr('style','display: none');
					$("#sjsj").attr('style','');
					$("#jsdj2").html(item.jsdj);$("#fangx2").html(item.fangx);
					$("#ldfl2").html(item.ldfl);$("#pcsj2").html(item.pcsj);$("#sgpb").html(item.sgpb);$("#dgjw").html(item.dgjw);$("#lxjw").html(item.lxjw);$("#jtlpbzb").html(item.jtlpbzb);$("#gldj1").html(item.gldj);
				}
				$("#roadcode").html(item.roadcode);$("#roadname").html(item.roadname);$("#unit").html(item.unit);$("#unitcode").html(item.unitcode);$("#roadstart").html(item.roadstart);
				$("#roadend").html(item.roadend);$("#dist").html(item.dist);$("#distcode").html(item.distcode);$("#xjgjnd").html(item.xjgjnd);
				$("#province").html(item.province);$("#town").html(item.town);$("#county").html(item.county);$("#throadcode").html(item.throadcode);$("#throadstart").html(item.throadstart);$("#throadend").html(item.throadend);
				$("#lxxp").html(item.lxxp);$("#doup").html(item.doup);$("#sjbl").html(item.sjbl);$("#lcxy").html(item.lcxy);$("#hjfz").html(item.hjfz);$("#xchbc").html(item.xchbc);
				$("#csxsss").html(item.csxsss);$("#hul").html(item.hul);$("#bzbx").html(item.bzbx);$("#jshsxyd").html(item.jshsxyd);$("#aqssqt").html(item.aqssqt);$("#tjgc").html(item.tjgc);
				$("#hjzz").html(item.hjzz);$("#bzbxcz").html(item.bzbxcz);$("#jckcz").html(item.jckcz);$("#jzhl").html(item.jzhl);$("#jshsxydcz").html(item.jshsxydcz);$("#aqssqtcz").html(item.aqssqtcz);
				$("#jhnf").html(item.jhnf);$("#yhlc").html(item.yhlc);$("#tzgs").html(item.tzgs);$("#tsdq").html(item.tsdq);
				$("#gltjpcf").html(item.gltjpcf);
				}
			});
	}
</script>

<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="roadcode" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="roadname" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="unit" ></span>
					</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="dist" ></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">省：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="province"  ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">市：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="town" ></span></td>
				</tr>	
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="county" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桩号起点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span  id="roadstart" ></span><br>
					<span id="qd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桩号终点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left"><br>
					<span id="roadend" ></span>
					<span id="zd"></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>公路编号：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="throadcode" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>桩号起点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="throadstart" ></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县乡道路网调后<br>桩号终点：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="throadend" ></span>
					</td>
				</tr>
			
			<tbody id='yjej' style="display: none">
			
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级(1、一级 2、二级)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jsdj1" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方向(1、桩号大到小2、桩号小到大3、不分方向)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="fangx1" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路段分类(A、B、C)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="ldfl1" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">排查时间(年 / 月)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				<span id="pcsj1" ></span>	</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通事故排查方法(1、事故风险评估2、事故多发点段识别)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jtsgpcf" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通事故风险等级(1、2、3、4、5级)或是否事故多发点段(0、否 6、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jtsgfxdj" ></span>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路条件排查方法(1、公路风险评估2、公路条件识别)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gltjpcf" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路风险等级(1、2、3、4、5级)或是否事故多发点段(0、否 6、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="glfxdj" ></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">小半径圆曲线(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xbjyqx" ></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交叉口不规范(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jckbgf" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交通量(AADT)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jtl" ></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gldj1" ></span></td>
			</tr>
		
			</tbody>
			<tbody id="sjsj" style="display: none">
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级(3、三级4、四级)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jsdj2" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方向(1、桩号大到小2、桩号小到大3、不分方向)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="fangx2" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路段分类(A.1、A.2、A.3、B.1、B.2、B.3、B.4、C)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="ldfl2" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">排查时间(年 / 月)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pcsj2" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">符合事故判别指标(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sgpb" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">单个急弯(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dgjw" ></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">连续急弯(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lsjw" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">符合交通量判别指标(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jtlpbzb" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gldj2" ></span>
				</td>
			</tr>
		
			</tbody>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">连续下坡(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="lxxp" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">陡坡(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="doup" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">视距不良(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="sjbl" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路侧险要(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="lcxy" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">环境复杂(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="hjfz" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通行校车或班线车(0、否1、是)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="xchbc" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">运行车速或路段限速或设计速度(km/h)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="csxsss" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">护栏(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="hul" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">标志标线(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="bzbx" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">警示和视线诱导设施(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jshsxyd" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">其他路段既有安全设施信息(用文字简要说明)：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px; " align="left">
					<span id="aqssqt" style="width: 356px"></span></td>
				
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">涉及路线参数调整的土建工程(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="tjgc" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">边坡、边沟或路域环境整治(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="hjzz" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">标志标线处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="bzbxcz" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交叉口综合处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jckcz" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">加装护栏(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jzhl" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">警示诱导设施处置(0、无1、有)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="jshsxydcz" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划实施安防工程年份(年)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="jhnf" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">其他拟新采取的处置措施(用文字简要说明)：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="aqssqtcz" style="width: 356px"></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程(公里)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="yhlc" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置投资估算(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="tzgs" ></span><br>
					<span id='bbzts'></span>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修改建年度(年)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span  id="xjgjnd" ></span></td>
				</tr>
				<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id='tsdq'></span></td>
				</tr>
				<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">关闭</a></td>
			</tr>
			</table>
</body>
</html>