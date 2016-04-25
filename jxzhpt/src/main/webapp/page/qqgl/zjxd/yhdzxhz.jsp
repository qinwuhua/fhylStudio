<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>养护大中修汇总</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
</head>
<body style="margin: 0px;overflow: auto;">
	<script type="text/javascript">
		
		var id= obj.tabs('getSelected').panel('options').id;
		var data="jhsh.xmlx=4";
		$.ajax({
			url:"/jxzhpt/qqgl/getbzhzb.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				var tbody = $("#"+id+" #mxbdata");
				tbody.empty();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						if(msg[i].XZQH=='全省合计')
						tbody.append( "<tr style='background-color: #FFFFFF; height: 15px;'><td colspan='2'>"
								+ msg[i].XZQH + "</td><td>"
								+ msg[i].LC + "</td><td>"
								+ msg[i].DXLC + "</td><td>"
								+ msg[i].ZXLC + "</td><td>"
								+ msg[i].YFLC + "</td><td>"
								+ msg[i].GLC + "</td><td>"
								+ msg[i].GDXLC + "</td><td>"
								+ msg[i].GZXLC + "</td><td>"
								+ msg[i].GYFLC + "</td><td>"
								+ msg[i].SLC + "</td><td>"
								+ msg[i].SDXLC + "</td><td>"
								+ msg[i].SZXLC + "</td><td>"
								+ msg[i].SYFLC + "</td><td>"
								+ msg[i].XDZJ + "</td><td>"
								+ msg[i].DXXDZJ + "</td><td>"
								+ msg[i].ZXXDZJ + "</td><td>"
								+ msg[i].YFXDZJ + "</td><td>"
								+ msg[i].QTXDZJ + "</td><td>"
								+ msg[i].GXDZJ + "</td><td>"
								+ msg[i].GDXXDZJ + "</td><td>"
								+ msg[i].GZXXDZJ + "</td><td>"
								+ msg[i].GYFXDZJ + "</td><td>"
								+ msg[i].SXDZJ + "</td><td>"
								+ msg[i].SDXXDZJ + "</td><td>"
								+ msg[i].SZXXDZJ + "</td><td>"
								+ msg[i].SYFXDZJ + "</td></tr>");
						else
							tbody.append( "<tr style='background-color: #FFFFFF; height: 15px;'><td>"+i+"</td><td>"
									+ msg[i].XZQH + "</td><td>"
									+ msg[i].LC + "</td><td>"
									+ msg[i].DXLC + "</td><td>"
									+ msg[i].ZXLC + "</td><td>"
									+ msg[i].YFLC + "</td><td>"
									+ msg[i].GLC + "</td><td>"
									+ msg[i].GDXLC + "</td><td>"
									+ msg[i].GZXLC + "</td><td>"
									+ msg[i].GYFLC + "</td><td>"
									+ msg[i].SLC + "</td><td>"
									+ msg[i].SDXLC + "</td><td>"
									+ msg[i].SZXLC + "</td><td>"
									+ msg[i].SYFLC + "</td><td>"
									+ msg[i].XDZJ + "</td><td>"
									+ msg[i].DXXDZJ + "</td><td>"
									+ msg[i].ZXXDZJ + "</td><td>"
									+ msg[i].YFXDZJ + "</td><td>"
									+ msg[i].QTXDZJ + "</td><td>"
									+ msg[i].GXDZJ + "</td><td>"
									+ msg[i].GDXXDZJ + "</td><td>"
									+ msg[i].GZXXDZJ + "</td><td>"
									+ msg[i].GYFXDZJ + "</td><td>"
									+ msg[i].SXDZJ + "</td><td>"
									+ msg[i].SDXXDZJ + "</td><td>"
									+ msg[i].SZXXDZJ + "</td><td>"
									+ msg[i].SYFXDZJ + "</td></tr>");
					}
				}
			}
		});
		/* $.ajax({
			url:"/jxzhpt/wjxt/getMxbDataList1.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				$("#"+id+" #tbdw").text(msg.tbdw);
				$("#"+id+" #bt").html("<pre>"+msg.bt1+"<br>"+msg.bt2+"<br>"+msg.bt3+"<br>"+msg.bt4+"<br>"+msg.bt5+"</pre>");
				$("#"+id+" #tbnf").text(msg.tbnf);
				$("#"+id+" #dwfzr").text(msg.dwfzr);
				$("#"+id+" #tjfzr").text(msg.tjfzr);
				$("#"+id+" #tjf").text(msg.tjf);
				$("#"+id+" #tbrq").text(msg.tbrq);
			}
			}); */
		
	</script>
    <div style="text-align: left; vertical-align: top; margin: 0px; height: 400px;width: 99.9%;">
        <table border="0" style="margin-top: 1px; margin-left: 1px; width: 99.9%;" cellspacing="0"
            cellpadding="0">
            <tr>
                <td align="center" style="padding-top: 20px;">
                    <table cellpadding="0" cellspacing="0" style="width: 99.9%;">
                        <tr style="height: 110px;">
                            <td>
                                <table cellpadding="0" cellspacing="0" style=" width: 99.9%;">
                                    <tr>
                                        <td align="center" colspan="3" style="height: 20px; font-size: 20px; font-weight: bolder;">
                                           全省普通干线公路养护大中修计划汇总表
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <table cellpadding="1" cellspacing="1" style="vertical-align: middle; text-align: center;
                                    background-color: #4B4B4B" border="1">
                                    <tr style="background-color: #999999; height: 12px;">
                                        <td rowspan="3" style="width: 140px;">
                                            序号
                                        </td>
                                        <td rowspan="3" style="width: 160px;">
                                            设区市
                                        </td>
                                        <td rowspan="1" colspan="12" style="width: 100px;">
                                           里程（公里）
                                        </td>
                                        <td rowspan="1" colspan="13" style="width: 100px;">
                                            本次计划下达资金（万元）
                                        </td>
                      					</tr>
                      					<tr style="background-color: #999999; height: 12px;">
                      					<td rowspan="2" style="width: 300px;">
                                            总计
                                        </td>
                                        <td rowspan="2" style="width: 300px;">
                                            大修
                                        </td>
                                        <td rowspan="2" style="width: 60px;">
                                           中修
                                        </td>
                                        <td rowspan="2" style="width: 60px;">
                                           预防性养护
                                        </td>
                                        <td colspan="4" style="width: 100px;">
                                            国道
                                        </td>
                                        <td colspan="4" style="width: 100px;">
                                            省道
                                        </td>
                                        <td rowspan="2" style="width: 300px;">
                                            总计
                                        </td>
                                        <td rowspan="2" style="width: 300px;">
                                            大修
                                        </td>
                                        <td rowspan="2" style="width: 60px;">
                                           中修
                                        </td>
                                        <td rowspan="2" style="width: 60px;">
                                           预防性养护
                                        </td>
                                        <td rowspan="2" style="width: 60px;">
                                           其它
                                        </td>
                                        <td colspan="4" style="width: 60px;">
                                           国道
                                        </td>
                                        <td colspan="4" style="width: 60px;">
                                           省道
                                        </td>
                                        
                                    </tr>
                                    <tr style="background-color: #999999; height: 12px;">
                                        <td style="width: 60px;">
                                             小计
                                        </td>
                                        <td style="width: 60px;">
                                            大修
                                        </td>
                                        <td style="width: 60px;">
                                            中修
                                        </td>
                                        <td style="width: 60px;">
                                            预防性养护
                                        </td>
                                        <td style="width: 60px;">
                                             小计
                                        </td>
                                        <td style="width: 60px;">
                                            大修
                                        </td>
                                        <td style="width: 60px;">
                                            中修
                                        </td>
                                        <td style="width: 60px;">
                                            预防性养护
                                        </td>
                                        <td style="width: 60px;">
                                             小计
                                        </td>
                                        <td style="width: 60px;">
                                            大修
                                        </td>
                                        <td style="width: 60px;">
                                            中修
                                        </td>
                                        <td style="width: 60px;">
                                            预防性养护
                                        </td>
                                        <td style="width: 60px;">
                                             小计
                                        </td>
                                        <td style="width: 60px;">
                                            大修
                                        </td>
                                        <td style="width: 60px;">
                                            中修
                                        </td>
                                        <td style="width: 60px;">
                                            预防性养护
                                        </td>
                                    </tr>
                                    
                                    <tbody id="mxbdata"></tbody>
                                </table>
                            </td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>

