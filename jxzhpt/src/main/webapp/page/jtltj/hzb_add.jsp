<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
	交通情况汇总表
</title><link href="../Css/page.css" rel="stylesheet" type="text/css" /></head>
<body style="margin: 0px; overflow: auto;">
    <form name="form1" method="post" action="TransportInfo_HZ.aspx?TitleID=f71631af-c820-45df-b795-a62f94cc2736&amp;t=1419818365131" id="form1">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTE5NDY1NDUyNQ9kFgICAw9kFhICAQ8PFgIeBFRleHQFGOaxn+ilv+ecgeWFrOi3r+euoeeQhuWxgGRkAgMPDxYCHwAFBzIwMTPlubRkZAIFDxYCHglpbm5lcmh0bWwFsAHooaggICAg5Y+377ya5Lqk6LCD57ufMeihqDxici8+5Yi26KGo5py65YWz77ya5Lqk6YCa6L+Q6L6T6YOoPGJyLz7lpIfmoYjmnLrlhbPvvJrlm73lrrbnu5/orqHlsYA8YnIvPuWkh+ahiOaWh+WPt++8muWbvee7n+WKnuWHveOAlDIwMTHjgJUxNjflj7c8YnIvPuacieaViOacn+mZkO+8mjIwMTTlubQxMeaciGQCBw8WAh8BBYAkPHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQ+5ZCI6K6hPC90ZD48dGQ+MzYwMTAwMDA8L3RkPjx0ZD4xMTA8L3RkPjx0ZD4xPC90ZD48dGQ+MTI8L3RkPjx0ZD45NzwvdGQ+PHRkPjQ1OTwvdGQ+PHRkPjk0PC90ZD48dGQ+MjA0PC90ZD48dGQ+MTYxPC90ZD48dGQ+MTM8L3RkPjx0ZD4xMjwvdGQ+PHRkPjE8L3RkPjx0ZD4wPC90ZD48dGQ+Mzg5PC90ZD48dGQ+ODE8L3RkPjx0ZD4xOTk8L3RkPjx0ZD4xMDk8L3RkPjx0ZD41NzwvdGQ+PHRkPjE8L3RkPjx0ZD40PC90ZD48dGQ+NTI8L3RkPjx0ZD4yNjY8L3RkPjx0ZD42MzwvdGQ+PHRkPjExNjwvdGQ+PHRkPjg3PC90ZD48dGQ+NTgzPC90ZD48dGQ+MTE8L3RkPjx0ZD4xMTUuOTE8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQ+6LWj5bee5biC5YWs6Lev566h55CG5bGAPC90ZD48dGQ+MzYwMTAxMDA8L3RkPjx0ZD4xOTwvdGQ+PHRkPjA8L3RkPjx0ZD4xPC90ZD48dGQ+MTg8L3RkPjx0ZD43NzwvdGQ+PHRkPjI5PC90ZD48dGQ+MjY8L3RkPjx0ZD4yMjwvdGQ+PHRkPjE8L3RkPjx0ZD4xPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD43NjwvdGQ+PHRkPjI4PC90ZD48dGQ+MjY8L3RkPjx0ZD4yMjwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD43NzwvdGQ+PHRkPjI5PC90ZD48dGQ+MjY8L3RkPjx0ZD4yMjwvdGQ+PHRkPjE1MDwvdGQ+PHRkPjwvdGQ+PHRkPjIyLjQ8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQ+5a6c5pil5biC5YWs6Lev5bGAPC90ZD48dGQ+MzYwMTAyMDA8L3RkPjx0ZD4xMjwvdGQ+PHRkPjA8L3RkPjx0ZD4xPC90ZD48dGQ+MTE8L3RkPjx0ZD45MTwvdGQ+PHRkPjk8L3RkPjx0ZD4zNTwvdGQ+PHRkPjQ3PC90ZD48dGQ+MzwvdGQ+PHRkPjM8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjU2PC90ZD48dGQ+NjwvdGQ+PHRkPjM1PC90ZD48dGQ+MTU8L3RkPjx0ZD4zMjwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MzI8L3RkPjx0ZD4zMjwvdGQ+PHRkPjY8L3RkPjx0ZD4yMDwvdGQ+PHRkPjY8L3RkPjx0ZD4xMTwvdGQ+PHRkPjM8L3RkPjx0ZD4xOS40PC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkPuWQieWuieW4guWFrOi3r+WxgDwvdGQ+PHRkPjM2MDEwMzAwPC90ZD48dGQ+MTM8L3RkPjx0ZD4wPC90ZD48dGQ+MTwvdGQ+PHRkPjEyPC90ZD48dGQ+NTU8L3RkPjx0ZD4xMTwvdGQ+PHRkPjMwPC90ZD48dGQ+MTQ8L3RkPjx0ZD4xPC90ZD48dGQ+MTwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+NTQ8L3RkPjx0ZD4xMDwvdGQ+PHRkPjMwPC90ZD48dGQ+MTQ8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+PC90ZD48dGQ+PC90ZD48dGQ+PC90ZD48dGQ+PC90ZD48dGQ+ODwvdGQ+PHRkPjwvdGQ+PHRkPjUuMDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZD7kuIrppbbluILlhazot6/nrqHnkIblsYA8L3RkPjx0ZD4zNjAxMDQwMDwvdGQ+PHRkPjEzPC90ZD48dGQ+MDwvdGQ+PHRkPjE8L3RkPjx0ZD4xMjwvdGQ+PHRkPjM5PC90ZD48dGQ+NTwvdGQ+PHRkPjMwPC90ZD48dGQ+NDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4zOTwvdGQ+PHRkPjU8L3RkPjx0ZD4zMDwvdGQ+PHRkPjQ8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MTQ8L3RkPjx0ZD4yPC90ZD48dGQ+MTI8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjwvdGQ+PHRkPjcuODwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZD7miprlt57luILlhazot6/lsYA8L3RkPjx0ZD4zNjAxMDUwMDwvdGQ+PHRkPjEzPC90ZD48dGQ+MDwvdGQ+PHRkPjI8L3RkPjx0ZD4xMTwvdGQ+PHRkPjQxPC90ZD48dGQ+MTI8L3RkPjx0ZD4yNDwvdGQ+PHRkPjU8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+NDE8L3RkPjx0ZD4xMjwvdGQ+PHRkPjI0PC90ZD48dGQ+NTwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4yNjwvdGQ+PHRkPjQ8L3RkPjx0ZD4xOTwvdGQ+PHRkPjM8L3RkPjx0ZD44NDwvdGQ+PHRkPjwvdGQ+PHRkPjE0LjA8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQ+5Lmd5rGf5biC5YWs6Lev5bGAPC90ZD48dGQ+MzYwMTA2MDA8L3RkPjx0ZD4xMzwvdGQ+PHRkPjA8L3RkPjx0ZD4xPC90ZD48dGQ+MTI8L3RkPjx0ZD40MDwvdGQ+PHRkPjU8L3RkPjx0ZD4yNDwvdGQ+PHRkPjExPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjQwPC90ZD48dGQ+NTwvdGQ+PHRkPjI0PC90ZD48dGQ+MTE8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MzM8L3RkPjx0ZD40PC90ZD48dGQ+MTk8L3RkPjx0ZD4xMDwvdGQ+PHRkPjcxPC90ZD48dGQ+PC90ZD48dGQ+MTAuMDc8L3RkPjwvdHI+PHRyIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBXaGl0ZTsgaGVpZ2h0OjE1cHg7Ij48dGQ+5pmv5b636ZWH5biC5YWs6Lev566h55CG5bGAPC90ZD48dGQ+MzYwMTA3MDA8L3RkPjx0ZD40PC90ZD48dGQ+MDwvdGQ+PHRkPjE8L3RkPjx0ZD4zPC90ZD48dGQ+MTg8L3RkPjx0ZD4zPC90ZD48dGQ+MTA8L3RkPjx0ZD41PC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjE4PC90ZD48dGQ+MzwvdGQ+PHRkPjEwPC90ZD48dGQ+NTwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD48L3RkPjx0ZD48L3RkPjx0ZD48L3RkPjx0ZD48L3RkPjx0ZD4wPC90ZD48dGQ+PC90ZD48dGQ+Ni44NDwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZD7okI3kuaHluILlhazot6/nrqHnkIblsYA8L3RkPjx0ZD4zNjAxMDgwMDwvdGQ+PHRkPjY8L3RkPjx0ZD4wPC90ZD48dGQ+MTwvdGQ+PHRkPjU8L3RkPjx0ZD4yNzwvdGQ+PHRkPjc8L3RkPjx0ZD4xMTwvdGQ+PHRkPjk8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MTg8L3RkPjx0ZD42PC90ZD48dGQ+ODwvdGQ+PHRkPjQ8L3RkPjx0ZD45PC90ZD48dGQ+MTwvdGQ+PHRkPjM8L3RkPjx0ZD41PC90ZD48dGQ+MjU8L3RkPjx0ZD42PC90ZD48dGQ+MTA8L3RkPjx0ZD45PC90ZD48dGQ+MTM1PC90ZD48dGQ+PC90ZD48dGQ+Ni4wPC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkPum5sOa9reW4guWFrOi3r+euoeeQhuWxgDwvdGQ+PHRkPjM2MDEwOTAwPC90ZD48dGQ+NTwvdGQ+PHRkPjA8L3RkPjx0ZD4xPC90ZD48dGQ+NDwvdGQ+PHRkPjE0PC90ZD48dGQ+NDwvdGQ+PHRkPjE8L3RkPjx0ZD45PC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjE0PC90ZD48dGQ+NDwvdGQ+PHRkPjE8L3RkPjx0ZD45PC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjEzPC90ZD48dGQ+MjwvdGQ+PHRkPjE8L3RkPjx0ZD4xMDwvdGQ+PHRkPjIwPC90ZD48dGQ+PC90ZD48dGQ+MS4yPC90ZD48L3RyPjx0ciBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogV2hpdGU7IGhlaWdodDoxNXB4OyI+PHRkPuaWsOS9meW4guWFrOi3r+euoeeQhuWxgDwvdGQ+PHRkPjM2MDExMDAwPC90ZD48dGQ+MzwvdGQ+PHRkPjA8L3RkPjx0ZD4xPC90ZD48dGQ+MjwvdGQ+PHRkPjExPC90ZD48dGQ+MDwvdGQ+PHRkPjg8L3RkPjx0ZD4zPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjExPC90ZD48dGQ+MDwvdGQ+PHRkPjg8L3RkPjx0ZD4zPC90ZD48dGQ+MDwvdGQ+PHRkPjA8L3RkPjx0ZD4wPC90ZD48dGQ+MDwvdGQ+PHRkPjc8L3RkPjx0ZD4wPC90ZD48dGQ+NDwvdGQ+PHRkPjM8L3RkPjx0ZD4yMjwvdGQ+PHRkPjwvdGQ+PHRkPjIuMjwvdGQ+PC90cj48dHIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IFdoaXRlOyBoZWlnaHQ6MTVweDsiPjx0ZD7ljZfmmIzluILlhazot6/nrqHnkIblsYA8L3RkPjx0ZD4zNjAxMTEwMDwvdGQ+PHRkPjg8L3RkPjx0ZD4wPC90ZD48dGQ+MTwvdGQ+PHRkPjc8L3RkPjx0ZD40NjwvdGQ+PHRkPjk8L3RkPjx0ZD41PC90ZD48dGQ+MzI8L3RkPjx0ZD44PC90ZD48dGQ+NzwvdGQ+PHRkPjE8L3RkPjx0ZD4wPC90ZD48dGQ+MjI8L3RkPjx0ZD4yPC90ZD48dGQ+MzwvdGQ+PHRkPjE3PC90ZD48dGQ+MTY8L3RkPjx0ZD4wPC90ZD48dGQ+MTwvdGQ+PHRkPjE1PC90ZD48dGQ+Mzk8L3RkPjx0ZD4xMDwvdGQ+PHRkPjU8L3RkPjx0ZD4yNDwvdGQ+PHRkPjgyPC90ZD48dGQ+ODwvdGQ+PHRkPjE2LjA8L3RkPjwvdHI+ZAIJDw8WAh8ABQnppbbmtbfnj41kZAILDw8WAh8ABQnppbbmtbfnj41kZAINDw8WAh8ABQnppbbmtbfnj41kZAIPDw8WAh8AZWRkAhEPDxYCHwAFETIwMTTlubQxMOaciDIz5pelZGRkPHltxlFcI/zV0+AsTEO/vn+/JDo=" />
</div>

<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="9ACEFFAD" />
</div>
    <div style="text-align: left; vertical-align: top; margin: 0px; height: 99%;">
        <table border="0" style="margin-top: 1px; margin-left: 1px; width: 99.9%;" cellspacing="0"
            cellpadding="0">
            <tr>
                <td align="center" style="padding-top: 20px;">
                    <table cellpadding="0" cellspacing="0" style="width: 1500px;">
                        <tr style="height: 110px;">
                            <td>
                                <table cellpadding="0" cellspacing="0" style="width: 1210px;">
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
                                            填报单位：<span id="lblTBDW">江西省公路管理局</span>
                                        </td>
                                        <td align="center" style="font-size: 12px;">
                                            <span id="lblNF">2013年</span>
                                        </td>
                                        <td align="center" style="font-size: 12px;">
                                            <div id="divReport" style="text-align: left; width: 200px;">表    号：交调统1表<br/>制表机关：交通运输部<br/>备案机关：国家统计局<br/>备案文号：国统办函〔2011〕167号<br/>有效期限：2014年11月</div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <table cellpadding="1" cellspacing="1" style="vertical-align: middle; text-align: center;
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
                                    <div id="trContent"><tr style="background-color: White; height:15px;"><td>合计</td><td>36010000</td><td>110</td><td>1</td><td>12</td><td>97</td><td>459</td><td>94</td><td>204</td><td>161</td><td>13</td><td>12</td><td>1</td><td>0</td><td>389</td><td>81</td><td>199</td><td>109</td><td>57</td><td>1</td><td>4</td><td>52</td><td>266</td><td>63</td><td>116</td><td>87</td><td>583</td><td>11</td><td>115.91</td></tr><tr style="background-color: White; height:15px;"><td>赣州市公路管理局</td><td>36010100</td><td>19</td><td>0</td><td>1</td><td>18</td><td>77</td><td>29</td><td>26</td><td>22</td><td>1</td><td>1</td><td>0</td><td>0</td><td>76</td><td>28</td><td>26</td><td>22</td><td>0</td><td>0</td><td>0</td><td>0</td><td>77</td><td>29</td><td>26</td><td>22</td><td>150</td><td></td><td>22.4</td></tr><tr style="background-color: White; height:15px;"><td>宜春市公路局</td><td>36010200</td><td>12</td><td>0</td><td>1</td><td>11</td><td>91</td><td>9</td><td>35</td><td>47</td><td>3</td><td>3</td><td>0</td><td>0</td><td>56</td><td>6</td><td>35</td><td>15</td><td>32</td><td>0</td><td>0</td><td>32</td><td>32</td><td>6</td><td>20</td><td>6</td><td>11</td><td>3</td><td>19.4</td></tr><tr style="background-color: White; height:15px;"><td>吉安市公路局</td><td>36010300</td><td>13</td><td>0</td><td>1</td><td>12</td><td>55</td><td>11</td><td>30</td><td>14</td><td>1</td><td>1</td><td>0</td><td>0</td><td>54</td><td>10</td><td>30</td><td>14</td><td>0</td><td>0</td><td>0</td><td>0</td><td></td><td></td><td></td><td></td><td>8</td><td></td><td>5.0</td></tr><tr style="background-color: White; height:15px;"><td>上饶市公路管理局</td><td>36010400</td><td>13</td><td>0</td><td>1</td><td>12</td><td>39</td><td>5</td><td>30</td><td>4</td><td>0</td><td>0</td><td>0</td><td>0</td><td>39</td><td>5</td><td>30</td><td>4</td><td>0</td><td>0</td><td>0</td><td>0</td><td>14</td><td>2</td><td>12</td><td>0</td><td>0</td><td></td><td>7.8</td></tr><tr style="background-color: White; height:15px;"><td>抚州市公路局</td><td>36010500</td><td>13</td><td>0</td><td>2</td><td>11</td><td>41</td><td>12</td><td>24</td><td>5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>41</td><td>12</td><td>24</td><td>5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>26</td><td>4</td><td>19</td><td>3</td><td>84</td><td></td><td>14.0</td></tr><tr style="background-color: White; height:15px;"><td>九江市公路局</td><td>36010600</td><td>13</td><td>0</td><td>1</td><td>12</td><td>40</td><td>5</td><td>24</td><td>11</td><td>0</td><td>0</td><td>0</td><td>0</td><td>40</td><td>5</td><td>24</td><td>11</td><td>0</td><td>0</td><td>0</td><td>0</td><td>33</td><td>4</td><td>19</td><td>10</td><td>71</td><td></td><td>10.07</td></tr><tr style="background-color: White; height:15px;"><td>景德镇市公路管理局</td><td>36010700</td><td>4</td><td>0</td><td>1</td><td>3</td><td>18</td><td>3</td><td>10</td><td>5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>18</td><td>3</td><td>10</td><td>5</td><td>0</td><td>0</td><td>0</td><td>0</td><td></td><td></td><td></td><td></td><td>0</td><td></td><td>6.84</td></tr><tr style="background-color: White; height:15px;"><td>萍乡市公路管理局</td><td>36010800</td><td>6</td><td>0</td><td>1</td><td>5</td><td>27</td><td>7</td><td>11</td><td>9</td><td>0</td><td>0</td><td>0</td><td>0</td><td>18</td><td>6</td><td>8</td><td>4</td><td>9</td><td>1</td><td>3</td><td>5</td><td>25</td><td>6</td><td>10</td><td>9</td><td>135</td><td></td><td>6.0</td></tr><tr style="background-color: White; height:15px;"><td>鹰潭市公路管理局</td><td>36010900</td><td>5</td><td>0</td><td>1</td><td>4</td><td>14</td><td>4</td><td>1</td><td>9</td><td>0</td><td>0</td><td>0</td><td>0</td><td>14</td><td>4</td><td>1</td><td>9</td><td>0</td><td>0</td><td>0</td><td>0</td><td>13</td><td>2</td><td>1</td><td>10</td><td>20</td><td></td><td>1.2</td></tr><tr style="background-color: White; height:15px;"><td>新余市公路管理局</td><td>36011000</td><td>3</td><td>0</td><td>1</td><td>2</td><td>11</td><td>0</td><td>8</td><td>3</td><td>0</td><td>0</td><td>0</td><td>0</td><td>11</td><td>0</td><td>8</td><td>3</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>0</td><td>4</td><td>3</td><td>22</td><td></td><td>2.2</td></tr><tr style="background-color: White; height:15px;"><td>南昌市公路管理局</td><td>36011100</td><td>8</td><td>0</td><td>1</td><td>7</td><td>46</td><td>9</td><td>5</td><td>32</td><td>8</td><td>7</td><td>1</td><td>0</td><td>22</td><td>2</td><td>3</td><td>17</td><td>16</td><td>0</td><td>1</td><td>15</td><td>39</td><td>10</td><td>5</td><td>24</td><td>82</td><td>8</td><td>16.0</td></tr></div>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 20px;">
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" style="width: 20%;">
                                            单位负责人：<span id="lblDWFZR">饶海珍</span>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            统计负责人：<span id="lblTJFZR">饶海珍</span>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            填表人：<span id="lblTBR">饶海珍</span>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            联系电话：<span id="lblLXDH"></span>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            报出日期：<span id="lblTBSJ">2014年10月23日</span>
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
    </form>
</body>
</html>
