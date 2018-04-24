<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新老桩号互换工具</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/wngh/wnjh/js/wnjh.js"></script>
<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>

<script type="text/javascript">
$(function(){	
 	loadUnitadd("gydw",$.cookie("unit"));
	loadDistadd("xzqh",$.cookie("dist")); 
/* 	xmnf1("xmnf");
	xmnf2("jhkgn");
	xmnf2("jhwgn"); */
	
	autoCompleteGHLXBM();
	autoCompleteYLXBM();
});

</script>

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
<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
			<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">		
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					<input type='hidden' id='gydw'>&nbsp;规划路线编码 -> 原路线编码
				</td>
			</tr>
			<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码</td>
					
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>
					<!-- &nbsp;<span style="color: red;">*</span> -->
				</td>					
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>
					<!-- &nbsp;<span style="color: red;">*</span> --><br/>
					<span id="span_qdzh" style="font-size: small;color: red;"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>
					<!-- &nbsp;<span style="color: red;">*</span> --><br/>
					<span id="span_zdzh" style="font-size: small;color: red;"></span>
				</td>
            </tr>
			<tr style="height: 30px;">
			<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input disabled='disabled' id="ylxbh" name="ylxbh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;"></span>
					<input id="xmlx" name="xmlx" value="4" type="hidden"/>
					<input id="gpsqdzh" name="gpsqdzh" type="hidden"/>
					<input id="gpszdzh" name="gpszdzh" type="hidden"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input disabled='disabled' id="qdzh" name="qdzh" onchange="querymc('qdzh')" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;"></span><br/>
					
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input disabled='disabled' id="zdzh" name="zdzh" onchange="querymc('zdzh')" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;"></span><br/>
					
				</td>
            </tr>  
                         
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" disabled='disabled'/>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" disabled='disabled'/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" disabled='disabled'/>
				</td>
            </tr>
            
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				<input type="text" id='lxmc' style="width: 120px" disabled='disabled'/> 
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>&nbsp;</font>起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="qdmc" name="qdmc" style="width: 120px;" disabled='disabled'/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>&nbsp;</font>止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="zdmc" name="zdmc" style="width: 120px;" disabled='disabled'/>
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="ghlxmc" name="ghlxmc" style="width: 120px;" disabled='disabled'/>
				</td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				<td style="background-color: #ffffff; height: 25px;" align="left">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
 				<td style="background-color: #ffffff; height: 25px;" align="left">
				
			</tr>
			<tr style="height: 20px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td colspan="5" style="background-color: #ffffff; height: 15px;" align="left">
					<textarea id="tsdq" style="width: 580px;height: 50px;" disabled='disabled'></textarea>
				</td>
			</tr> 		
			</table>

		
		<div style="margin:20px 0px 20px 0px;"></div>
		
		   <table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">		
					<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					<input type='hidden' id='xzqh'>&nbsp;原路线编码 -> 规划路线编码
				</td>
			</tr>	
			<tr style="height: 30px;">
			<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_ylxbh" name="yx_ylxbh" type="text" style="width: 120px;" />
 					<input id="yx_xmlx" name="yx_xmlx" value="4" type="hidden"/>
					<input id="yx_gpsqdzh" name="yx_gpsqdzh" type="hidden"/>
					<input id="yx_gpszdzh" name="yx_gpszdzh" type="hidden"/>
					<!-- &nbsp;<span style="color: red;">*</span> -->				
				</td>		
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_qdzh" name="yx_qdzh" onchange="queryGhByY()" type="text" style="width: 120px;"/>
					<!-- &nbsp;<span style="color: red;">*</span> --><br/>
					<input id="yx_yqdzh" name="yx_yqdzh" type="hidden" style="width: 120px;"/>				
					<span id="yxspan_qdzh" style="font-size: small;color: red;"></span>
					
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_zdzh" name="yx_zdzh" onchange="queryGhByY()" type="text" style="width: 120px;"/>
					<!-- &nbsp;<span style="color: red;">*</span> --><br/>					
					<input id="yx_yzdzh" name="yx_yzdzh" type="hidden" style="width: 120px;"/>				
					<span id="yxspan_zdzh" style="font-size: small;color: red;"></span>				
				</td>
            </tr>
			
			<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_ghlxbm" name="yx_ghlxbm" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;
					<span style="color: red;"></span>					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>                           
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_ghqdzh" disabled="disabled" name="yx_ghqdzh" type="text" style="width: 120px;" onchange="queryghmc('yx_ghqdzh')"/>&nbsp;<span style="color: red;"></span><br/>
					<input id="yx_yghqdzh" name="yx_yghqdzh" type="hidden" style="width: 120px;"/>				
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_ghzdzh" disabled="disabled" name="yx_ghzdzh" type="text" style="width: 120px;" onchange="queryghmc('yx_ghzdzh')" />&nbsp;<span style="color: red;"></span><br/>
					<input id="yx_yghzdzh" name="yx_yghzdzh" type="hidden" style="width: 120px;"/>
				</td>
            </tr>
            
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_gxlxbm" name="gxlxbm" type="text" style="width: 120px;" disabled='disabled'/>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_gxqdzh" name="gxqdzh" type="text" style="width: 120px;" disabled='disabled'/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="yx_gxzdzh" name="gxzdzh" type="text" style="width: 120px;" disabled='disabled'/>
				</td>
            </tr> 
             
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				<input type="text" id='yx_lxmc' name='yx_lxmc' style="width: 120px" disabled="disabled"/> 
				</td>
				
				 <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>&nbsp;</font>起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="yx_qdmc" name="yx_qdmc" style="width: 120px;" disabled="disabled"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>&nbsp;</font>止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="yx_zdmc" name="yx_zdmc" style="width: 120px;" disabled="disabled"/>
				</td>
			</tr>
			
			<tr style="height: 35px;">
  				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="yx_ghlxmc" name="yx_ghlxmc" style="width: 120px;" disabled="disabled" />
				</td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
				<td style="background-color: #ffffff; height: 25px;" align="left">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
 				<td style="background-color: #ffffff; height: 25px;" align="left">
			</tr>
			<tr style="height: 20px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td colspan="5" style="background-color: #ffffff; height: 15px;" align="left">
					<textarea id="yx_tsdq" style="width: 580px;height: 50px;" disabled="disabled"></textarea>
				</td>
			</tr> 
			</table>
</body>
</html>