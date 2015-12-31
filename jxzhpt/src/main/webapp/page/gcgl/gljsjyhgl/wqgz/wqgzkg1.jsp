<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造月报上报</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="js/wqgz.js"></script>
	<script type="text/javascript">
	var sbsj;
	var sbyf;
	$(function(){
			fileShow11(parent.obj1.id,"施工许可");
			loadUploadify();
			$("#tj_xdsj").datebox({        
			});  
			$("#tj_sjkgsj").datebox({      
			});  
			$("#tj_yjjgsj").datebox({       
			});  
			
			var data=parent.obj1;
			$('#tj_xdsj').datebox('setValue', data.xdsj);
			$('#tj_sjkgsj').datebox('setValue', data.sjkgsj);
			$('#tj_yjjgsj').datebox('setValue', data.yjjgsj);
			$('#tj_xdwh').val(data.xdwh);
			$('#tj_sgdw').val(data.sgdw);
			$('#tj_jldw').val(data.jldw);
			$('#tj_jsdw').val(data.jsdw);
			$('#tj_htje').val(data.htje);
			$('#tj_gys').val(data.gys);
			$('#tj_zljdwj').val(data.zljdwj);
		});
	function checkZJ1(aa){
		var g = /^-?[1-9]+(?=\.{0,1}\d+$)|(^0$)|(^-?0\.[0-9]*[1-9]$)|(^-?[1-9][0-9]*.[0-9]*$)/;
	    if( !g.test(aa.value)){
	    	alert("请输入正确的金额");
	    	$(aa).val('');
	    }
	}
		
	function loadUploadify(){
		$("#uploadJGTC").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '/jxzhpt/js/uploader/uploadify.swf',
			'script' : '/jxzhpt/qqgl/uploadJGYSFile.do',
			'cancelImg' : '/jxzhpt/js/uploader/cancel.png',
			'queueID' : 'fileQueue1',
			'fileDataName' : 'uploadJGTC',
			'auto' : false,
			'multi' : true,
			'buttonImg': '/jxzhpt/js/uploader/bdll.png',
			'simUploadLimit' : 3,
			'sizeLimit' : 20000000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:xls',
			'fileExt' : '',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'gcgl_jgys.jhid':parent.obj1.id,
				'gcgl_jgys.name':'wgqlzsgxk',
			},
			onComplete : function(event, queueID, fileObj, response, data) {
				alert(response);
				fileShow11(parent.obj1.id,"施工许可");
			},
			onError : function(event, queueID, fileObj) {
				alert("文件:" + fileObj.name + "上传失败");
			},
			onCancel : function(event, queueID, fileObj) {
			},
			onQueueFull : function(event, queueSizeLimit) {
				alert("最多支持上传文件数为：" + queueSizeLimit);

			}
		});
	}	
	</script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">

            <tr>
                <td>
                    <br />
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                        cellpadding="0">
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">计划下达时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input style="width: 105px" type="text" id="tj_xdsj" />
                            </td>
                            
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">计划下达文号：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input style="width: 100px" type="text" id="tj_xdwh" />
                            </td>
                           
                        </tr>
                        <tr style="height: 35px;">
	                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
	                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
	                                 padding-right: 5px;">
	                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">实际开工时间：</font></b>
	                            </td>
	                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
	                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
	                                <input style="width: 105px" type="text" id="tj_sjkgsj" />
	                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 23%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">预计完工时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input style="width: 105px" type="text" id="tj_yjjgsj" />
                            </td>
                            
                        </tr>
                        <tr style="height: 35px;">
                        	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">施工单位：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input style="width: 100px" type="text" id="tj_sgdw" />
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 23%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">监理单位：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input style="width: 100px" type="text" id="tj_jldw" />
                            </td>
                           
                        </tr>
                        <tr style="height: 35px;">
                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">建设单位：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" >
                                <input style="width: 100px" type="text" id="tj_jsdw" />
                            </td>
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">质量监督文件（单位）：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" >
                                <input style="width: 100px" type="text" id="tj_zljdwj" />
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 23%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">合同金额（万元）：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input style="width: 100px" type="text" id="tj_htje"  onblur="checkZJ1(this)"/>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">概预算（万元）：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input style="width: 100px" type="text" id="tj_gys"  onblur="checkZJ1(this)"/>
                            </td>
                        </tr>
                        <tr>
							<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">施工许可（附件上传）：</td>
							<td id="td_jgtc" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
								<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
											cellpadding="1" cellspacing="1">
									<tbody id="qlzmTable"></tbody>
								</table>
								<table>
										<tr>
											<td><input type="file" value="选择图片" style="background-image: url('${pageContext.request.contextPath }/js/uploader/bdll.png');" name="uploadSjt" id="uploadJGTC" /></td>
											<td><div id="fileQueue1" ></div></td>
										</tr>
										<tr>
											<td rowspan="2">
												<img name="uploadFile" id="uploadFile" src="${pageContext.request.contextPath }/js/uploader/upload.png" onclick="$('#uploadJGTC').uploadifyUpload()"  style="border-width:0px;" />
											</td>
										</tr>
									</table>
							</td>
						</tr>
                    </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="tjwqgzkg();" />
                                <img src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" id="Img2" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" onclick="closes('wqxx')" style="cursor: hand" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</div>

</body>
</html>