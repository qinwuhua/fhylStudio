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
			url:"/jxzhpt/wjxt/getJtlDataList.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				var tbody = $("#"+id+" #hzbdata");
				tbody.empty();
				if (msg != null) {
					
					for ( var i = 0; i < msg.length; i++) {
							tbody.append("<tr style='background-color: #FFFFFF; height: 15px;'><td>"
									+msg[i].gljgmc+"</td><td>"
									+msg[i].gljgbh+"</td><td>"
									+msg[i].hj+"</td><td>"
									+msg[i].sj+"</td><td>"
									+msg[i].dsj+"</td><td>"
									+msg[i].xxj+"</td><td>"
									+msg[i].hxj+"</td><td>"
									+msg[i].hgd+"</td><td>"
									+msg[i].hsd+"</td><td>"
									+msg[i].hqt+"</td><td>"
									+msg[i].lxj+"</td><td>"
									+msg[i].lgd+"</td><td>"
									+msg[i].lsd+"</td><td>"
									+msg[i].lqt+"</td><td>"
									+msg[i].jxj+"</td><td>"
									+msg[i].jgd+"</td><td>"
									+msg[i].jsd+"</td><td>"
									+msg[i].jqt+"</td><td>"
									+msg[i].bxj+"</td><td>"
									+msg[i].bgd+"</td><td>"
									+msg[i].bsd+"</td><td>"
									+msg[i].bqt+"</td><td>"
									+msg[i].cxj+"</td><td>"
									+msg[i].cgd+"</td><td>"
									+msg[i].csd+"</td><td>"
									+msg[i].cqt+"</td><td>"
									+msg[i].gcry+"</td><td>"
									+msg[i].gcjl+"</td><td>"
									+msg[i].njf+"</td></tr>"
									);
					}
				}
			}
		});
		$.ajax({
			url:"/jxzhpt/wjxt/getJtlDataList1.do",
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
				$("#"+id+" #bcrq").text(msg.bcrq);
			}
			});
		
	</script>
    <div style="text-align: left; vertical-align: top; margin: 0px; height: 100%;">
        <table border="0" style="margin-top: 1px; margin-left: 1px; width: 99.9%;" cellspacing="0"
            cellpadding="0">
            <tr>
                <td align="center" style="padding-top: 20px;">
                    <table cellpadding="0" cellspacing="0" style="width: 99.8;">
                        <tr style="height: 110px;">
                            <td>
                                <table cellpadding="0" cellspacing="0" style="width: 99.8%;">
                                    <tr>
                                        <td align="center" colspan="3" style="height: 20px; font-size: 20px; font-weight: bolder;">
                                            公路交通情况调查汇总表
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
                                            <div  id="bt" style="text-align: left; width: 200px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <table border="1" cellpadding="1" cellspacing="1" style="vertical-align: middle; text-align: center;
                                    background-color: #4B4B4B">
                                    <tr style="background-color: #CCCCCC;">
                                        <td rowspan="3" style="width: 150px;">
                                            管理机构名称
                                        </td>
                                        <td rowspan="3" style="width: 80px;">
                                            管理机<br />
                                            构编号
                                        </td>
                                        <td rowspan="2" colspan="4" style="width: 180px;">
                                            调查机构数（个）
                                        </td>
                                        <td colspan="16">
                                            观测点数量(个)
                                        </td>
                                        <td rowspan="2" colspan="4">
                                            车速调查路段
                                        </td>
                                        <td rowspan="3" style="width: 100px;">
                                            观测人员<br />
                                            数量<br />
                                            (人)
                                        </td>
                                        <td rowspan="3" style="width: 100px;">
                                            观测记录<br />设备数量<br />
                                            (台/套)
                                        </td>
                                        <td rowspan="3" style="width: 100px;">
                                            年经费<br />投入金额<br />
                                            (万元)
                                        </td>
                                    </tr>
                                    <tr style="background-color: #CCCCCC;">
                                        <td colspan="4">
                                            合计
                                        </td>
                                        <td colspan="4">
                                            连续式
                                        </td>
                                        <td colspan="4">
                                            间歇式
                                        </td>
                                        <td colspan="4">
                                            比重
                                        </td>
                                    </tr>
                                    <tr style="background-color: #CCCCCC;">
                                        <td style="width: 50px;">
                                            合计
                                        </td>
                                        <td style="width: 50px;">
                                            省级
                                        </td>
                                        <td style="width: 60px;">
                                            地市级
                                        </td>
                                        <td style="width: 60px;">
                                            县乡级
                                        </td>
                                        <td style="width: 50px;">
                                            小计
                                        </td>
                                        <td style="width: 50px;">
                                            国道
                                        </td>
                                        <td style="width: 50px;">
                                            省道
                                        </td>
                                        <td style="width: 50px;">
                                            其他
                                        </td>
                                        <td style="width: 50px;">
                                            小计
                                        </td>
                                        <td style="width: 50px;">
                                            国道
                                        </td>
                                        <td style="width: 50px;">
                                            省道
                                        </td>
                                        <td style="width: 50px;">
                                            其他
                                        </td>
                                        <td style="width: 50px;">
                                            小计
                                        </td>
                                        <td style="width: 50px;">
                                            国道
                                        </td>
                                        <td style="width: 50px;">
                                            省道
                                        </td>
                                        <td style="width: 50px;">
                                            其他
                                        </td>
                                        <td style="width: 50px;">
                                            小计
                                        </td>
                                        <td style="width: 50px;">
                                            国道
                                        </td>
                                        <td style="width: 50px;">
                                            省道
                                        </td>
                                        <td style="width: 50px;">
                                            其他
                                        </td>
                                        <td style="width: 50px;">
                                            小计
                                        </td>
                                        <td style="width: 50px;">
                                            国道
                                        </td>
                                        <td style="width: 50px;">
                                            省道
                                        </td>
                                        <td style="width: 50px;">
                                            其他
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
                                        <td>
                                            19
                                        </td>
                                        <td>
                                            20
                                        </td>
                                        <td>
                                            21
                                        </td>
                                        <td>
                                            22
                                        </td>
                                        <td>
                                            23
                                        </td>
                                        <td>
                                            24
                                        </td>
                                        <td>
                                            25
                                        </td>
                                        <td>
                                            26
                                        </td>
                                        <td>
                                            27
                                        </td>
                                    </tr>
                                    <tbody id="hzbdata"></tbody>
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
                                            报出日期：<span id="bcrq"></span>
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
