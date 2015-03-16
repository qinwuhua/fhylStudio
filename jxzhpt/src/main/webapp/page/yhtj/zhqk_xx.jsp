<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="./js/zhqk.js"></script>
    <style type="text/css">
        body
        {
            font-family: Arial, SimSun, sans-serif, Verdana, Lucida, Helvetica;
            font-size: 12px;
            color: #333;
            line-height: 1.8em;
            height: 100%;
            margin: 0px auto;
            background-color: #fff;
        }
       
    </style>
    <script type="text/javascript">
	 $(function(){
		 var data=parent.obj;
		 $("#gydw").text(data.gydwmc);$("#sbrq").text(data.sbrq);
		 $("#sj1o1").text(data.sj1o1);$("#sj1o2").text(data.sj1o2);$("#sj1o3").text(data.sj1o3);$("#sj1o4").text(data.sj1o4);$("#sj1o5").text(data.sj1o5);$("#sj1o6").text(data.sj1o6);$("#sj1o7").text(data.sj1o7);$("#sj1o8").text(data.sj1o8);$("#sj1o9").text(data.sj1o9);$("#sj1o10").text(data.sj1o10);$("#sj1o11").text(data.sj1o11);$("#sj1o12").text(data.sj1o12);
		 $("#sj2o1").text(data.sj2o1);$("#sj2o2").text(data.sj2o2);$("#sj2o3").text(data.sj2o3);$("#sj2o4").text(data.sj2o4);$("#sj2o5").text(data.sj2o5);$("#sj2o6").text(data.sj2o6);$("#sj2o7").text(data.sj2o7);$("#sj2o8").text(data.sj2o8);$("#sj2o9").text(data.sj2o9);$("#sj2o10").text(data.sj2o10);$("#sj2o11").text(data.sj2o11);$("#sj2o12").text(data.sj2o12);
		 $("#sj3o1").text(data.sj3o1);$("#sj3o2").text(data.sj3o2);$("#sj3o3").text(data.sj3o3);$("#sj3o4").text(data.sj3o4);$("#sj3o5").text(data.sj3o5);$("#sj3o6").text(data.sj3o6);$("#sj3o7").text(data.sj3o7);$("#sj3o8").text(data.sj3o8);$("#sj3o9").text(data.sj3o9);$("#sj3o10").text(data.sj3o10);$("#sj3o11").text(data.sj3o11);$("#sj3o12").text(data.sj3o12);
		 $("#sj4o1").text(data.sj4o1);$("#sj4o2").text(data.sj4o2);$("#sj4o3").text(data.sj4o3);$("#sj4o4").text(data.sj4o4);$("#sj4o5").text(data.sj4o5);$("#sj4o6").text(data.sj4o6);$("#sj4o7").text(data.sj4o7);$("#sj4o8").text(data.sj4o8);$("#sj4o9").text(data.sj4o9);$("#sj4o10").text(data.sj4o10);$("#sj4o11").text(data.sj4o11);$("#sj4o12").text(data.sj4o12);
		 $("#sj5o1").text(data.sj5o1);$("#sj5o2").text(data.sj5o2);$("#sj5o3").text(data.sj5o3);$("#sj5o4").text(data.sj5o4);$("#sj5o5").text(data.sj5o5);$("#sj5o6").text(data.sj5o6);$("#sj5o7").text(data.sj5o7);$("#sj5o8").text(data.sj5o8);$("#sj5o9").text(data.sj5o9);$("#sj5o10").text(data.sj5o10);$("#sj5o11").text(data.sj5o11);$("#sj5o12").text(data.sj5o12);
		 $("#sj6o1").text(data.sj6o1);$("#sj6o2").text(data.sj6o2);$("#sj6o3").text(data.sj6o3);$("#sj6o4").text(data.sj6o4);$("#sj6o5").text(data.sj6o5);$("#sj6o6").text(data.sj6o6);$("#sj6o7").text(data.sj6o7);$("#sj6o8").text(data.sj6o8);$("#sj6o9").text(data.sj6o9);$("#sj6o10").text(data.sj6o10);$("#sj6o11").text(data.sj6o11);$("#sj6o12").text(data.sj6o12);
		 $("#sj7o1").text(data.sj7o1);$("#sj7o2").text(data.sj7o2);$("#sj7o3").text(data.sj7o3);$("#sj7o4").text(data.sj7o4);$("#sj7o5").text(data.sj7o5);$("#sj7o6").text(data.sj7o6);$("#sj7o7").text(data.sj7o7);$("#sj7o8").text(data.sj7o8);$("#sj7o9").text(data.sj7o9);$("#sj7o10").text(data.sj7o10);$("#sj7o11").text(data.sj7o11);$("#sj7o12").text(data.sj7o12);
		 $("#sj8o1").text(data.sj8o1);$("#sj8o2").text(data.sj8o2);$("#sj8o3").text(data.sj8o3);$("#sj8o4").text(data.sj8o4);$("#sj8o5").text(data.sj8o5);$("#sj8o6").text(data.sj8o6);$("#sj8o7").text(data.sj8o7);$("#sj8o8").text(data.sj8o8);$("#sj8o9").text(data.sj8o9);$("#sj8o10").text(data.sj8o10);$("#sj8o11").text(data.sj8o11);$("#sj8o12").text(data.sj8o12);
		 $("#sj9o1").text(data.sj9o1);$("#sj9o2").text(data.sj9o2);$("#sj9o3").text(data.sj9o3);$("#sj9o4").text(data.sj9o4);$("#sj9o5").text(data.sj9o5);$("#sj9o6").text(data.sj9o6);$("#sj9o7").text(data.sj9o7);$("#sj9o8").text(data.sj9o8);$("#sj9o9").text(data.sj9o9);$("#sj9o10").text(data.sj9o10);$("#sj9o11").text(data.sj9o11);$("#sj9o12").text(data.sj9o12);
		 $("#sj10o1").text(data.sj10o1);$("#sj10o2").text(data.sj10o2);$("#sj10o3").text(data.sj10o3);$("#sj10o4").text(data.sj10o4);$("#sj10o5").text(data.sj10o5);$("#sj10o6").text(data.sj10o6);$("#sj10o7").text(data.sj10o7);$("#sj10o8").text(data.sj10o8);$("#sj10o9").text(data.sj10o9);$("#sj10o10").text(data.sj10o10);$("#sj10o11").text(data.sj10o11);$("#sj10o12").text(data.sj10o12);
		 $("#sj11o1").text(data.sj11o1);$("#sj11o2").text(data.sj11o2);$("#sj11o3").text(data.sj11o3);$("#sj11o4").text(data.sj11o4);$("#sj11o5").text(data.sj11o5);$("#sj11o6").text(data.sj11o6);$("#sj11o7").text(data.sj11o7);$("#sj11o8").text(data.sj11o8);$("#sj11o9").text(data.sj11o9);$("#sj11o10").text(data.sj11o10);$("#sj11o11").text(data.sj11o11);$("#sj11o12").text(data.sj11o12);
		 $("#sj12o1").text(data.sj12o1);$("#sj12o2").text(data.sj12o2);$("#sj12o3").text(data.sj12o3);$("#sj12o4").text(data.sj12o4);$("#sj12o5").text(data.sj12o5);$("#sj12o6").text(data.sj12o6);$("#sj12o7").text(data.sj12o7);$("#sj12o8").text(data.sj12o8);$("#sj12o9").text(data.sj12o9);$("#sj12o10").text(data.sj12o10);$("#sj12o11").text(data.sj12o11);$("#sj12o12").text(data.sj12o12);
		 $("#sj13o1").text(data.sj13o1);$("#sj13o2").text(data.sj13o2);$("#sj13o3").text(data.sj13o3);$("#sj13o4").text(data.sj13o4);$("#sj13o5").text(data.sj13o5);$("#sj13o6").text(data.sj13o6);$("#sj13o7").text(data.sj13o7);$("#sj13o8").text(data.sj13o8);$("#sj13o9").text(data.sj13o9);$("#sj13o10").text(data.sj13o10);$("#sj13o11").text(data.sj13o11);$("#sj13o12").text(data.sj13o12);
		 $("#sj14o1").text(data.ssj14o);$("#sj14o2").text(data.sj14o2);$("#sj14o3").text(data.sj14o3);$("#sj14o4").text(data.sj14o4);$("#sj14o5").text(data.sj14o5);$("#sj14o6").text(data.sj14o6);$("#sj14o7").text(data.sj14o7);$("#sj14o8").text(data.sj14o8);$("#sj14o9").text(data.sj14o9);$("#sj14o10").text(data.sj14o10);$("#sj14o11").text(data.sj14o11);$("#sj14o12").text(data.sj14o12);
		 $("#sj15o1").text(data.sj15o1);$("#sj15o2").text(data.sj15o2);$("#sj15o3").text(data.sj15o3);$("#sj15o4").text(data.sj15o4);$("#sj15o5").text(data.sj15o5);$("#sj15o6").text(data.sj15o6);$("#sj15o7").text(data.sj15o7);$("#sj15o8").text(data.sj15o8);$("#sj15o9").text(data.sj15o9);$("#sj15o10").text(data.sj15o10);$("#sj15o11").text(data.sj15o11);$("#sj15o12").text(data.sj15o12);
		 
	 });
    </script>
</head>
<body style="margin: 0px;">
 
    <center>
    <form action="" id="trqkdata" method="post">
        <table align="center" width="97%" cellpadding="0" cellspacing="0" border="0"  bordercolor="#ffffff" style="margin-top: 10px">
       
            <tr style="border: 0">
                <td align="center"  colspan="16" align="center" style="padding-top: 10px; padding-bottom: 10px; border: 0px ">
                    <span style="font-size: 20px; font-weight: bold" >公路灾毁损失情况统计表</span>
                </td>
            </tr>
          </table>
         <table align="center" width="97%" cellpadding="0" cellspacing="0" border="1"  bordercolor="#ffffff" style="margin-top: 10px">
            <tr>
							<td align="center"  colspan="3" style="text-align: right">
                                管养单位：
                            </td>
                            <td align="center"  colspan="4" style="border-collapse: collapse">
                           <span id="gydw"/>
                            </td>
                            <td align="center"  colspan="2" style="text-align: right">
                                上报日期：
                            </td>
                            <td align="center"   colspan="8" align="left">
                           <span id="sbrq"/>
                            </td>
                        </tr>
                        <tr style="text-align: center; color: #0076C8; background-color: #F4FAFF; font-weight: bold;">
                            <td align="center"  colspan="3" rowspan="2">
                                项目
                            </td>
                            <td align="center"  rowspan="2" nowrap="nowrap">
                                计量单位
                            </td>
                            <td align="center"  rowspan="2" nowrap="nowrap">
                                序号
                            </td>
                            <td align="center"  colspan="4">
                                灾毁数量
                            </td>
                            <td align="center"  colspan="4">
                                水毁数量
                            </td>
                            <td align="center"  colspan="2">
                                涉及金额（万元）
                            </td>
                            <td align="center"  colspan="2">
                                水毁涉及金额<br/>（万元）
                            </td>
                        </tr>
                        <tr style="text-align: center; color: #0076C8; background-color: #F4FAFF; font-weight: bold">
                            <td align="center"  colspan="2" style="width: 8%">
                                合计
                            </td>
                            <td align="center"  colspan="2" style="width: 8%">
                                国省干线
                            </td>
                            <td align="center"  colspan="2" style="width: 8%">
                                &nbsp;合计
                            </td>
                            <td align="center"  colspan="2" style="width: 8%">
                                国省干线
                            </td>
                            <td align="center" style="width: 8%">
                                合计
                            </td>
                            <td align="center" style="width: 8%">
                                国省干线
                            </td>
                            <td align="center" style="width: 8%">
                                &nbsp;合计
                            </td>
                            <td align="center" style="width: 8%">
                                国省干线
                            </td>
                        </tr>
                        <tr align="center" bgcolor='#F4FAFF'>
                            <td align="center"  width="30">
                                甲
                            </td>
                            <td align="center"  colspan="2">
                                乙
                            </td>
                            <td align="center" >
                                丙
                            </td>
                            <td align="center" >
                                丁
                            </td>
                            <td align="center" >
                                1
                            </td>
                            <td align="center" >
                                2
                            </td>
                            <td align="center" >
                                3
                            </td>
                            <td align="center" >
                                4
                            </td>
                            <td align="center" >
                                5
                            </td>
                            <td align="center" >
                                6
                            </td>
                            <td align="center" >
                                7
                            </td>
                            <td align="center" >
                                8
                            </td>
                            <td align="center" >
                                9
                            </td>
                            <td align="center" >
                                10
                            </td>
                            <td align="center" >
                                11
                            </td>
                            <td align="center" >
                                12
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  nowrap="nowrap" align="left" rowspan="12" style="font-weight: bolder; text-align: center">
                                损<br />
                                失<br />
                                情<br />
                                况
                            </td>
                            <td align="center"  colspan="2">
                                路基
                            </td>
                            <td align="center"  nowrap>
                                立方米/公里
                            </td>
                            <td align="center"  align="center">
                                1
                            </td>
                            <td align="center" >
                               <span  name="zhqk.sj1o1" id="sj1o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o2" id="sj1o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o3" id="sj1o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o4" id="sj1o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o5" id="sj1o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o6" id="sj1o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o7" id="sj1o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o8" id="sj1o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o9" id="sj1o9" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o10" id="sj1o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o11" id="sj1o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj1o12" id="sj1o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  rowspan="3">
                                路面
                            </td>
                            <td align="center"  nowrap>
                                沥青路面
                            </td>
                            <td align="center" >
                                平方米/公里
                            </td>
                            <td align="center"  align="center">
                                2
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o1" id="sj2o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o2" id="sj2o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o3" id="sj2o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o4" id="sj2o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o5" id="sj2o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o6" id="sj2o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o7" id="sj2o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o8" id="sj2o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o9" id="sj2o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj2o10" id="sj2o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o11" id="sj2o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj2o12" id="sj2o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center" >
                                水泥路面
                            </td>
                            <td align="center" >
                                平方米/公里
                            </td>
                            <td align="center"  align="center">
                                3
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj3o1" id="sj3o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o2" id="sj3o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o3" id="sj3o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o4" id="sj3o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o5" id="sj3o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o6" id="sj3o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o7" id="sj3o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o8" id="sj3o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o9" id="sj3o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj3o10" id="sj3o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o11" id="sj3o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj3o12" id="sj3o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center" >
                                砂石路面
                            </td>
                            <td align="center" >
                                平方米/公里
                            </td>
                            <td align="center"  align="center">
                                4
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o1" id="sj4o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o2" id="sj4o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o3" id="sj4o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o4" id="sj4o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o5" id="sj4o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o6" id="sj4o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o7" id="sj4o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o8" id="sj4o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o9" id="sj4o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj4o10" id="sj4o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o11" id="sj4o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj4o12" id="sj4o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  colspan="2">
                                桥梁
                            </td>
                            <td align="center" >
                                延米/座
                            </td>
                            <td align="center"  align="center">
                                5
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o1" id="sj5o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o2" id="sj5o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o3" id="sj5o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o4" id="sj5o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o5" id="sj5o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o6" id="sj5o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o7" id="sj5o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o8" id="sj5o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o9" id="sj5o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj5o10" id="sj5o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o11" id="sj5o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj5o12" id="sj5o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  colspan="2" nowrap>
                                隧道
                            </td>
                            <td align="center" >
                                延米/道
                            </td>
                            <td align="center"  align="center">
                                6
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj6o1" id="sj6o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o2" id="sj6o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o3" id="sj6o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o4" id="sj6o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o5" id="sj6o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o6" id="sj6o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o7" id="sj6o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o8" id="sj6o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o9" id="sj6o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj6o10" id="sj6o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o11" id="sj6o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj6o12" id="sj6o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  rowspan="2">
                                防护工程
                            </td>
                            <td align="center"  nowrap>
                                护坡
                            </td>
                            <td align="center" >
                                立方米/处
                            </td>
                            <td align="center"  align="center">
                                7
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o1" id="sj7o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o2" id="sj7o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o3" id="sj7o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o4" id="sj7o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o5" id="sj7o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o6" id="sj7o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o7" id="sj7o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o8" id="sj7o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o9" id="sj7o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj7o10" id="sj7o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o11" id="sj7o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj7o12" id="sj7o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  nowrap="nowrap">
                                驳岸、挡墙
                            </td>
                            <td align="center" >
                                立方米/处
                            </td>
                            <td align="center"  align="center">
                                8
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o1" id="sj8o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o2" id="sj8o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o3" id="sj8o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o4" id="sj8o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o5" id="sj8o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o6" id="sj8o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o7" id="sj8o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o8" id="sj8o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o9" id="sj8o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj8o10" id="sj8o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o11" id="sj8o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj8o12" id="sj8o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  colspan="2">
                                坍塌方
                            </td>
                            <td align="center" >
                                立方米/处
                            </td>
                            <td align="center"  align="center">
                                9
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o1" id="sj9o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o2" id="sj9o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o3" id="sj9o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o4" id="sj9o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o5" id="sj9o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o6" id="sj9o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o7" id="sj9o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o8" id="sj9o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o9" id="sj9o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj9o10" id="sj9o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o11" id="sj9o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj9o12" id="sj9o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  colspan="2">
                                公路中断
                            </td>
                            <td align="center" >
                                处/条
                            </td>
                            <td align="center"  align="center">
                                10
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o1" id="sj10o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o2" id="sj10o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o3" id="sj10o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o4" id="sj10o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o5" id="sj10o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o6" id="sj10o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o7" id="sj10o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o8" id="sj10o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o9" id="sj10o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj10o10" id="sj10o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o11" id="sj10o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj10o12" id="sj10o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  colspan="2">
                                其他灾毁损失
                            </td>
                            <td align="center" >
                                万元
                            </td>
                            <td align="center"  align="center">
                                11
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o1" id="sj11o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o2" id="sj11o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o3" id="sj11o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o4" id="sj11o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o5" id="sj11o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o6" id="sj11o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o7" id="sj11o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o8" id="sj11o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o9" id="sj11o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj11o10" id="sj11o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o11" id="sj11o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj11o12" id="sj11o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  colspan="2">
                                损失合计
                            </td>
                            <td align="center" >
                                万元
                            </td>
                            <td align="center"  align="center">
                                12
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o1" id="sj12o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o2" id="sj12o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o3" id="sj12o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o4" id="sj12o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o5" id="sj12o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o6" id="sj12o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o7" id="sj12o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o8" id="sj12o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o9" id="sj12o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj12o10" id="sj12o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o11" id="sj12o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj12o12" id="sj12o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  nowrap="nowrap" align="left" rowspan="3" style="font-weight: bolder; text-align: center">
                                抢<br />
                                通<br />
                                情<br />
                                况
                            </td>
                            <td align="center"  colspan="2">
                                已抢通公路
                            </td>
                            <td align="center" >
                                处/条
                            </td>
                            <td align="center"  align="center">
                                13
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o1" id="sj13o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o2" id="sj13o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o3" id="sj13o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o4" id="sj13o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o5" id="sj13o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o6" id="sj13o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o7" id="sj13o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o8" id="sj13o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o9" id="sj13o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj13o10" id="sj13o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o11" id="sj13o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj13o12" id="sj13o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  colspan="2">
                                已投入机械
                            </td>
                            <td align="center" >
                                台班
                            </td>
                            <td align="center"  align="center">
                                14
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o1" id="sj14o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o2" id="sj14o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o3" id="sj14o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o4" id="sj14o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o5" id="sj14o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o6" id="sj14o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o7" id="sj14o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o8" id="sj14o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o9" id="sj14o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj14o10" id="sj14o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o11" id="sj14o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj14o12" id="sj14o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td align="center"  colspan="2">
                                已投入资金
                            </td>
                            <td align="center" >
                                万元
                            </td>
                            <td align="center"  align="center">
                                15
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o1" id="sj15o1" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o2" id="sj15o2" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o3" id="sj15o3" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o4" id="sj15o4" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o5" id="sj15o5" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o6" id="sj15o6" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o7" id="sj15o7" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o8" id="sj15o8" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o9" id="sj15o9" size="8" />
                            </td>
                           <td align="center" >
								<span  name="zhqk.sj15o10" id="sj15o10" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o11" id="sj15o11" size="8" />
                            </td>
                            <td align="center" >
								<span  name="zhqk.sj15o12" id="sj15o12" size="8" />
                            </td>
                        </tr>
                    </table>
        <div style="padding-top: 10px;">
<!--            <a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="insertzhqk()">保存</a> -->
		   <a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel" onclick="closes('zhqk_xx')">返回</a></td>
        </div>
        <br />
    </center>
    </form>
</body>
</html>

