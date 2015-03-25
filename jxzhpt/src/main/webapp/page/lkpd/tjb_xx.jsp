<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head id="Head1"><title>
	公路技术状况统计表
</title><link href="../Css/page.css" rel="stylesheet" type="text/css" /></head>
<body style="margin: 0px; overflow: auto;">
	<script type="text/javascript">
	$(function(){
		var id= obj.tabs('getSelected').panel('options').id;
		var data="id="+id.substr(0,32);
		$.ajax({
			url:"/jxzhpt/wjxt/getTjbDataList.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				var tbody = $("#"+id+" #tjbdata");
				tbody.empty();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						if(msg[i].biaoti!=''){
							tbody.append("<tr style='background-color: #FFFFFF; height: 15px;'><td  rowspan='5'>"
							+msg[i].biaoti+"</td><td>"
							+msg[i].xm+"</td><td>"
							+msg[i].bh+"</td><td>"
							+msg[i].hj+"</td><td>"
							+msg[i].ydl+"</td><td>"
							+msg[i].ldl+"</td><td>"
							+msg[i].zdl+"</td><td>"
							+msg[i].cdl+"</td><td>"
							+msg[i].cadl+"</td><td>"
							+msg[i].yllv+"</td><td>"
							+msg[i].pdjg+"</td></tr>"
							);
						}else{
							tbody.append("<tr style='background-color: #FFFFFF; height: 15px;'><td>"
									+msg[i].xm+"</td><td>"
									+msg[i].bh+"</td><td>"
									+msg[i].hj+"</td><td>"
									+msg[i].ydl+"</td><td>"
									+msg[i].ldl+"</td><td>"
									+msg[i].zdl+"</td><td>"
									+msg[i].cdl+"</td><td>"
									+msg[i].cadl+"</td><td>"
									+msg[i].yllv+"</td><td>"
									+msg[i].pdjg+"</td></tr>"
									);
						}
					}
				}
			}
		});
		$.ajax({
			url:"/jxzhpt/wjxt/getTjbDataList1.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				$("#"+id+" #tbdw").text(msg.tbdw);
				$("#"+id+" #tbnf").text(msg.tbnf);
				$("#"+id+" #dwfzr").text(msg.dwfzr);
				$("#"+id+" #fzr").text(msg.fzr);
				$("#"+id+" #tbr").text(msg.tbr);
				$("#"+id+" #tbrq").text(msg.tbrq);
			}
			});
	});
	</script>
    <div style="text-align: left; vertical-align: top; margin: 0px; height: 50%;width: 99.9%;">
        <table border="0" style="margin-top: 1px; margin-left: 1px; width: 99.9%;" cellspacing="0"
            cellpadding="0">
            <tr>
                <td align="center" style="padding-top:5px;">
                    <table cellpadding="0" cellspacing="0" style="width: 99.9%;">
                        <tr style="height: 110px;">
                            <td>
                                <table cellpadding="0" cellspacing="0" style="width: 99.9%;">
                                    <tr>
                                        <td align="center" colspan="3" style="height: 20px; font-size: 20px; font-weight: bolder;">
                                            公路技术状况统计表
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 20%">
                                            &nbsp;
                                        </td>
                                        <td align="center" style="width: 50%; font-size: 14px;vertical-align:top;padding-top:10px;padding-left:30px;">
                                            <span id="lblFBT">—县道、乡道、村道、专用公路</span>
                                        </td>
                                        <td rowspan="2" align="right" style="width: 30%; margin: 0px; padding: 0px;">
										<textarea name="txtReport" rows="2" cols="20" readonly="readonly" id="txtReport" style="border-style:None;font-size:11px;height:80px;width:200px;overflow: hidden;">
表        号：交  公  路  29-2 表 
制表机关：交   通   运   输   部
备案机关：国   家   统   计   局
批准文号：国统制(2012)131号  
有效期至：2014    年    11    月
										 </textarea>
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: bottom;">
                                        <td align="left" style="font-size: 12px;">
                                            填报单位：<span id="tbdw"></span>
                                        </td>
                                        <td align="center" style="font-size: 12px;">
                                            <span id="tbnf"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <table border="1" cellpadding="1" cellspacing="1" style="width:99.9%;vertical-align: middle; text-align: center;
                                    background-color: #4B4B4B" >
                                    <tr style="background-color: #999999; height: 12px;">
                                        <td rowspan="2" colspan="2" style="width: 220px;">
                                            项目
                                        </td>
                                        <td rowspan="2" style="width: 30px;">
                                            编号
                                        </td>
                                        <td colspan="6" style="width: 540px;">
                                            实&nbsp; 际&nbsp; 评&nbsp; 级&nbsp; 里&nbsp; 程 （公里）
                                        </td>
                                        <td rowspan="2" style="width: 80px;">
                                            优良路率<br />
                                            (%)
                                        </td>
                                        <td rowspan="2" style="width: 80px;">
                                            评定结果
                                        </td>
                                    </tr>
                                    <tr style="background-color: #999999; height: 12px;">
                                        <td style="width: 100px;">
                                            合计
                                        </td>
                                        <td style="width: 100px;">
                                            优等路
                                        </td>
                                        <td style="width: 100px;">
                                            良等路
                                        </td>
                                        <td style="width: 100px;">
                                            中等路
                                        </td>
                                        <td style="width: 100px;">
                                            次等路
                                        </td>
                                        <td style="width: 100px;">
                                            差等路
                                        </td>
                                    </tr>
                                    <tr style="background-color: #999999; height: 15px;">
                                        <td colspan="2">
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
                                    </tr>
                                    <tbody id="tjbdata"></tbody>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 20px;">
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" style="width: 25%;">
                                            单位负责人：<span id="dwfzr"></span>
                                        </td>&nbsp;&nbsp;&nbsp;
                                       	 
                                        <td align="center" style="width: 25%;">
                                          统计负责人： <span id="fzr"></span>
                                        </td>&nbsp;&nbsp;&nbsp;
                                       
                                        <td align="center" style="width: 25%;">
                                          	  填报人：<span id="tbr"></span>
                                        </td>&nbsp;&nbsp;&nbsp;
                                                  
                                        <td align="center" style="width: 25%;">
                                            填报日期：<span id="tbrq"></span>
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
