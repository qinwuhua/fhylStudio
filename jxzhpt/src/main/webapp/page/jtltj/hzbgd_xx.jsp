<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head id="Head1"><title>
	公路技术状况统计表
</title><link href="../Css/page.css" rel="stylesheet" type="text/css" /></head>
<body style="margin: 0px; overflow: auto;">
	<script type="text/javascript">
		var id= obj.tabs('getSelected').panel('options').id;
		var data="id="+id.substr(0,32);
		$.ajax({
			url:"/jxzhpt/wjxt/getJtlgdDataList.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				var tbody = $("#"+id+" #jtlgddata");
				tbody.empty();
				if (msg != null) {
					
					for ( var i = 0; i < msg.length; i++) {
						if(msg[i].lxbh=='合计'){
							tbody.append("<tr style='background-color: #FFFFFF; height: 15px;'><td colspan='2'>"
									+msg[i].lxbh+"</td><td>"
									+msg[i].gclc+"</td><td>"
									+msg[i].jdls+"</td><td>"
									+msg[i].jzrs+"</td><td>"
									+msg[i].qdls+"</td><td>"
									+msg[i].qzrs+"</td><td>"
									+msg[i].xhc+"</td><td>"
									+msg[i].zhc+"</td><td>"
									+msg[i].dhc+"</td><td>"
									+msg[i].thc+"</td><td>"
									+msg[i].jzxc+"</td><td>"
									+msg[i].zxkc+"</td><td>"
									+msg[i].dkc+"</td><td>"
									+msg[i].mtc+"</td><td>"
									+msg[i].tdls+"</td><td>"
									+msg[i].tzrs+"</td><td>"
									+msg[i].xsl+"</td><td>"
									+msg[i].jtl+"</td><td>"
									+msg[i].yjd+"</td></tr>"
									);
						}else{
							tbody.append("<tr style='background-color: #FFFFFF; height: 15px;'><td>"
									+msg[i].lxbh+"</td><td>"
									+msg[i].lxmc+"</td><td>"
									+msg[i].gclc+"</td><td>"
									+msg[i].jdls+"</td><td>"
									+msg[i].jzrs+"</td><td>"
									+msg[i].qdls+"</td><td>"
									+msg[i].qzrs+"</td><td>"
									+msg[i].xhc+"</td><td>"
									+msg[i].zhc+"</td><td>"
									+msg[i].dhc+"</td><td>"
									+msg[i].thc+"</td><td>"
									+msg[i].jzxc+"</td><td>"
									+msg[i].zxkc+"</td><td>"
									+msg[i].dkc+"</td><td>"
									+msg[i].mtc+"</td><td>"
									+msg[i].tdls+"</td><td>"
									+msg[i].tzrs+"</td><td>"
									+msg[i].xsl+"</td><td>"
									+msg[i].jtl+"</td><td>"
									+msg[i].yjd+"</td></tr>"
									);
						}	
					}
				}
			}
		});
		$.ajax({
			url:"/jxzhpt/wjxt/getJtlgdDataList1.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				$("#"+id+" #tbdw").text(msg.tbdw);
				$("#"+id+" #bt").html(msg.bt1+"<br>"+msg.bt2+"<br>"+msg.bt3+"<br>"+msg.bt4+"<br>"+msg.bt5);
				$("#"+id+" #tbnf").text(msg.tbnf);
				$("#"+id+" #dwfzr").text(msg.dwfzr);
				$("#"+id+" #tjfzr").text(msg.tjfzr);
				$("#"+id+" #tbr").text(msg.tbr);
				$("#"+id+" #lxdh").text(msg.lxdh);
				$("#"+id+" #rq").text(msg.rq);
			}
			});
		
	</script>
     <div style="text-align: left; vertical-align: top; margin: 0px; height: 100%;">
        <table border="0" style="margin-top: 1px; margin-left: 1px; width: 99.9%;" cellspacing="0"
            cellpadding="0">
            <tr>
                <td align="center" style="padding-top: 20px;">
                    <table cellpadding="0" cellspacing="0" style="width: 99.8%;">
                        <tr style="height: 110px;">
                            <td>
                                <table cellpadding="0" cellspacing="0" style="width: 99.8%;">
                                    <tr>
                                        <td align="center" colspan="3" style="height: 20px; font-size: 20px; font-weight: bolder;">
                                            国道交通量报表
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 20%">
                                        </td>
                                        <td align="center" style="width: 50%; font-size: 14px; padding-left: 240px;">
                                        </td>
                                        <td align="right" style="margin: 0px; padding: 0px;">
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: bottom;">
                                        <td align="left" style="font-size: 12px;">
                                            填报单位：<span id="tbdw"></span>
                                        </td>
                                        <td align="center" style="font-size: 12px;">
                                            <span id="tbnf"></span>
                                        </td>
                                        <td align="center" style="font-size: 12px;">
                                            <div id="bt" style="text-align: left; width: 200px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <table border="1"  cellpadding="1" cellspacing="1" style="vertical-align: middle; text-align: center;
                                    background-color: #4B4B4B">
                                    <tr style="background-color: #CCCCCC;">
                                        <td rowspan="3" style="width: 80px;">
                                            路线编号
                                        </td>
                                        <td rowspan="3" style="width: 200px;">
                                            路线名称
                                        </td>
                                        <td rowspan="3" style="width: 60px;">
                                            观测<br />
                                            里程<br />
                                            （公里）
                                        </td>
                                        <td colspan="14">
                                            年平均日交通量（辆/日）
                                        </td>
                                        <td rowspan="3" style="width: 100px;">
                                            行驶量<br />
                                            （万车<br />
                                            公里／日）
                                        </td>
                                        <td rowspan="3" style="width: 100px;">
                                            适应<br />
                                            交通量<br />
                                            （辆／日）
                                        </td>
                                        <td rowspan="3" style="width: 100px;">
                                            交通拥挤度
                                        </td>
                                    </tr>
                                    <tr style="background-color: #CCCCCC;">
                                        <td colspan="2">
                                            机动车
                                        </td>
                                        <td colspan="9">
                                            汽车
                                        </td>
                                        <td rowspan="2" style="width: 60px;">
                                            摩托车
                                        </td>
                                        <td colspan="2">
                                            拖拉机
                                        </td>
                                    </tr>
                                    <tr style="background-color: #CCCCCC;">
                                        <td style="width: 60px;">
                                            当量数合 计
                                        </td>
                                        <td style="width: 60px;">
                                            自然数合 计
                                        </td>
                                        <td style="width: 60px;">
                                            当量数合 计
                                        </td>
                                        <td style="width: 60px;">
                                            自然数合 计
                                        </td>
                                        <td style="width: 60px;">
                                            小型货车
                                        </td>
                                        <td style="width: 60px;">
                                            中型货车
                                        </td>
                                        <td style="width: 60px;">
                                            大型货车
                                        </td>
                                        <td style="width: 60px;">
                                            特大货车
                                        </td>
                                        <td style="width: 60px;">
                                            集装箱车
                                        </td>
                                        <td style="width: 60px;">
                                            中小客车
                                        </td>
                                        <td style="width: 60px;">
                                            大客车
                                        </td>
                                        <td style="width: 60px;">
                                            当量数合 计
                                        </td>
                                        <td style="width: 60px;">
                                            自然数合 计
                                        </td>
                                    </tr>
                                    <tr style="background-color: #CCCCCC; height: 15px;">
                                        <td>
                                            甲
                                        </td>
                                        <td>
                                            乙
                                        </td>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            3
                                        </td>
                                        <td>
                                            4
                                        </td>
                                        <td>
                                            5
                                        </td>
                                        <td>
                                            6
                                        </td>
                                        <td>
                                            7
                                        </td>
                                        <td>
                                            8
                                        </td>
                                        <td>
                                            9
                                        </td>
                                        <td>
                                            10
                                        </td>
                                        <td>
                                            11
                                        </td>
                                        <td>
                                            12
                                        </td>
                                        <td>
                                            13
                                        </td>
                                        <td>
                                            14
                                        </td>
                                        <td>
                                            15
                                        </td>
                                        <td>
                                            16
                                        </td>
                                        <td>
                                            17
                                        </td>
                                        <td>
                                            18
                                        </td>
                                    </tr>
                                    <tbody id="jtlgddata"></tbody>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 20px;">
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" style="width: 20%;">
                                            单位负责人：<span id="dwfzr"></span>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            统计负责人：<span id="tjfzr"></span>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            填表人：<span id="tbr"></span>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            联系电话：<span id="lxdh"></span>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            日期：<span id="rq"></span>
                                        </td>
                                    </tr>
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
