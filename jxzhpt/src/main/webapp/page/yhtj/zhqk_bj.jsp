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
        input
        {
            background-color: transparent;
            border-bottom: #ffffff 0px solid;
            border-left: #ffffff 0px solid;
            border-right: #ffffff 0px solid;
            border-top: #ffffff 0px solid;
            color: #ffffff;
            border-color: #ffffff #ffffff #ffffff #ffffff;
            font-size: 9pt;
            color: #000000;
        }

    </style>
    <script type="text/javascript">
    $(function(){
		var data=parent.obj;
 		loadUnit("gydw",'36');
		$("#sbrq").datebox({    
		    
		});  
		$('#sbrq').datebox('setValue', data.sbrq);
		 $("#sj1o1").val(data.sj1o1);$("#sj1o2").val(data.sj1o2);$("#sj1o3").val(data.sj1o3);$("#sj1o4").val(data.sj1o4);$("#sj1o5").val(data.sj1o5);$("#sj1o6").val(data.sj1o6);$("#sj1o7").val(data.sj1o7);$("#sj1o8").val(data.sj1o8);$("#sj1o9").val(data.sj1o9);$("#sj1o10").val(data.sj1o10);$("#sj1o11").val(data.sj1o11);$("#sj1o12").val(data.sj1o12);
		 $("#sj2o1").val(data.sj2o1);$("#sj2o2").val(data.sj2o2);$("#sj2o3").val(data.sj2o3);$("#sj2o4").val(data.sj2o4);$("#sj2o5").val(data.sj2o5);$("#sj2o6").val(data.sj2o6);$("#sj2o7").val(data.sj2o7);$("#sj2o8").val(data.sj2o8);$("#sj2o9").val(data.sj2o9);$("#sj2o10").val(data.sj2o10);$("#sj2o11").val(data.sj2o11);$("#sj2o12").val(data.sj2o12);
		 $("#sj3o1").val(data.sj3o1);$("#sj3o2").val(data.sj3o2);$("#sj3o3").val(data.sj3o3);$("#sj3o4").val(data.sj3o4);$("#sj3o5").val(data.sj3o5);$("#sj3o6").val(data.sj3o6);$("#sj3o7").val(data.sj3o7);$("#sj3o8").val(data.sj3o8);$("#sj3o9").val(data.sj3o9);$("#sj3o10").val(data.sj3o10);$("#sj3o11").val(data.sj3o11);$("#sj3o12").val(data.sj3o12);
		 $("#sj4o1").val(data.sj4o1);$("#sj4o2").val(data.sj4o2);$("#sj4o3").val(data.sj4o3);$("#sj4o4").val(data.sj4o4);$("#sj4o5").val(data.sj4o5);$("#sj4o6").val(data.sj4o6);$("#sj4o7").val(data.sj4o7);$("#sj4o8").val(data.sj4o8);$("#sj4o9").val(data.sj4o9);$("#sj4o10").val(data.sj4o10);$("#sj4o11").val(data.sj4o11);$("#sj4o12").val(data.sj4o12);
		 $("#sj5o1").val(data.sj5o1);$("#sj5o2").val(data.sj5o2);$("#sj5o3").val(data.sj5o3);$("#sj5o4").val(data.sj5o4);$("#sj5o5").val(data.sj5o5);$("#sj5o6").val(data.sj5o6);$("#sj5o7").val(data.sj5o7);$("#sj5o8").val(data.sj5o8);$("#sj5o9").val(data.sj5o9);$("#sj5o10").val(data.sj5o10);$("#sj5o11").val(data.sj5o11);$("#sj5o12").val(data.sj5o12);
		 $("#sj6o1").val(data.sj6o1);$("#sj6o2").val(data.sj6o2);$("#sj6o3").val(data.sj6o3);$("#sj6o4").val(data.sj6o4);$("#sj6o5").val(data.sj6o5);$("#sj6o6").val(data.sj6o6);$("#sj6o7").val(data.sj6o7);$("#sj6o8").val(data.sj6o8);$("#sj6o9").val(data.sj6o9);$("#sj6o10").val(data.sj6o10);$("#sj6o11").val(data.sj6o11);$("#sj6o12").val(data.sj6o12);
		 $("#sj7o1").val(data.sj7o1);$("#sj7o2").val(data.sj7o2);$("#sj7o3").val(data.sj7o3);$("#sj7o4").val(data.sj7o4);$("#sj7o5").val(data.sj7o5);$("#sj7o6").val(data.sj7o6);$("#sj7o7").val(data.sj7o7);$("#sj7o8").val(data.sj7o8);$("#sj7o9").val(data.sj7o9);$("#sj7o10").val(data.sj7o10);$("#sj7o11").val(data.sj7o11);$("#sj7o12").val(data.sj7o12);
		 $("#sj8o1").val(data.sj8o1);$("#sj8o2").val(data.sj8o2);$("#sj8o3").val(data.sj8o3);$("#sj8o4").val(data.sj8o4);$("#sj8o5").val(data.sj8o5);$("#sj8o6").val(data.sj8o6);$("#sj8o7").val(data.sj8o7);$("#sj8o8").val(data.sj8o8);$("#sj8o9").val(data.sj8o9);$("#sj8o10").val(data.sj8o10);$("#sj8o11").val(data.sj8o11);$("#sj8o12").val(data.sj8o12);
		 $("#sj9o1").val(data.sj9o1);$("#sj9o2").val(data.sj9o2);$("#sj9o3").val(data.sj9o3);$("#sj9o4").val(data.sj9o4);$("#sj9o5").val(data.sj9o5);$("#sj9o6").val(data.sj9o6);$("#sj9o7").val(data.sj9o7);$("#sj9o8").val(data.sj9o8);$("#sj9o9").val(data.sj9o9);$("#sj9o10").val(data.sj9o10);$("#sj9o11").val(data.sj9o11);$("#sj9o12").val(data.sj9o12);
		 $("#sj10o1").val(data.sj10o1);$("#sj10o2").val(data.sj10o2);$("#sj10o3").val(data.sj10o3);$("#sj10o4").val(data.sj10o4);$("#sj10o5").val(data.sj10o5);$("#sj10o6").val(data.sj10o6);$("#sj10o7").val(data.sj10o7);$("#sj10o8").val(data.sj10o8);$("#sj10o9").val(data.sj10o9);$("#sj10o10").val(data.sj10o10);$("#sj10o11").val(data.sj10o11);$("#sj10o12").val(data.sj10o12);
		 $("#sj11o1").val(data.sj11o1);$("#sj11o2").val(data.sj11o2);$("#sj11o3").val(data.sj11o3);$("#sj11o4").val(data.sj11o4);$("#sj11o5").val(data.sj11o5);$("#sj11o6").val(data.sj11o6);$("#sj11o7").val(data.sj11o7);$("#sj11o8").val(data.sj11o8);$("#sj11o9").val(data.sj11o9);$("#sj11o10").val(data.sj11o10);$("#sj11o11").val(data.sj11o11);$("#sj11o12").val(data.sj11o12);
		 $("#sj12o1").val(data.sj12o1);$("#sj12o2").val(data.sj12o2);$("#sj12o3").val(data.sj12o3);$("#sj12o4").val(data.sj12o4);$("#sj12o5").val(data.sj12o5);$("#sj12o6").val(data.sj12o6);$("#sj12o7").val(data.sj12o7);$("#sj12o8").val(data.sj12o8);$("#sj12o9").val(data.sj12o9);$("#sj12o10").val(data.sj12o10);$("#sj12o11").val(data.sj12o11);$("#sj12o12").val(data.sj12o12);
		 $("#sj13o1").val(data.sj13o1);$("#sj13o2").val(data.sj13o2);$("#sj13o3").val(data.sj13o3);$("#sj13o4").val(data.sj13o4);$("#sj13o5").val(data.sj13o5);$("#sj13o6").val(data.sj13o6);$("#sj13o7").val(data.sj13o7);$("#sj13o8").val(data.sj13o8);$("#sj13o9").val(data.sj13o9);$("#sj13o10").val(data.sj13o10);$("#sj13o11").val(data.sj13o11);$("#sj13o12").val(data.sj13o12);
		 $("#sj14o1").val(data.ssj14o);$("#sj14o2").val(data.sj14o2);$("#sj14o3").val(data.sj14o3);$("#sj14o4").val(data.sj14o4);$("#sj14o5").val(data.sj14o5);$("#sj14o6").val(data.sj14o6);$("#sj14o7").val(data.sj14o7);$("#sj14o8").val(data.sj14o8);$("#sj14o9").val(data.sj14o9);$("#sj14o10").val(data.sj14o10);$("#sj14o11").val(data.sj14o11);$("#sj14o12").val(data.sj14o12);
		 $("#sj15o1").val(data.sj15o1);$("#sj15o2").val(data.sj15o2);$("#sj15o3").val(data.sj15o3);$("#sj15o4").val(data.sj15o4);$("#sj15o5").val(data.sj15o5);$("#sj15o6").val(data.sj15o6);$("#sj15o7").val(data.sj15o7);$("#sj15o8").val(data.sj15o8);$("#sj15o9").val(data.sj15o9);$("#sj15o10").val(data.sj15o10);$("#sj15o11").val(data.sj15o11);$("#sj15o12").val(data.sj15o12);
		 $('#gydw').combobox("setValue",data.gydw);
 	}); 
    function insertzhqk(){
    	var data=$("#trqkdata").serialize()+"&zhqk.gydw="+$("#gydw").combobox("getValue")+"&zhqk.gydwmc="+$("#gydw").combobox("getText")+"&zhqk.sbrq="+$("#sbrq").datebox('getValue')+"&zhqk.id="+parent.obj.id;
    	if(!confirm("您确认保存该信息吗？")){
    		return;
    	}
    	 $.ajax({
    			type:"post",
    			url:"/jxzhpt/wjxt/updatezhqk.do",
    			dataType:'json',
    			data:data,
    			success:function(msg){
    				if(msg){
    					alert("保存成功！");
    					parent.$("#zhqk_table").datagrid('reload');
    					closes('zhqk_bj');
    				}else{
    					alert("保存失败！");
    				}
    			}
    		});
    }
    function check(str){
    	if(str.value!=''){
    		if($.trim(str.value)==''){
    			$(str).val('');
    			return;
    		}
    		var flag= /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)/;
    		if(!flag.test($.trim(str.value))){
    			alert("请输入正确的数字");
    			$(str).val('');
    		}else{
    			$(str).val($.trim(str.value));
    		}
    	}
    }
    </script>
</head>
<body style="margin: 0px;">
 
    <center>
    <form action="" id="trqkdata" method="post">
        <table width="97%" cellpadding="0" cellspacing="0" border="0" bordercolor="#ffffff" style="margin-top: 10px">
       
            <tr>
                <td colspan="16" align="center" style="padding-top: 10px; padding-bottom: 10px; border: 0px">
                    <span style="font-size: 20px; font-weight: bold" >公路灾毁损失情况统计表</span>
                </td>
            </tr>
        </table>
         <table width="97%" cellpadding="1" cellspacing="1" border="0"   style="margin-top: 10px;background-color:#404040">  
            <tr style="text-align: center; color: #0076C8; background-color: #F4FAFF; font-weight: bold;">
							<td colspan="3" style="text-align: right">
                                管养单位：
                            </td>
                            <td colspan="4" style="border-collapse: collapse">
                            <input type="text" id="gydw"/>
                            </td>
                            <td colspan="2" style="text-align: right">
                                上报日期：
                            </td>
                            <td style="text-align: left" colspan="8" align="left">
                            <input type="text" id="sbrq"/>
                            </td>
                        </tr>
                        <tr style="text-align: center; color: #0076C8; background-color: #F4FAFF; font-weight: bold;">
                            <td colspan="3" rowspan="2">
                                项目
                            </td>
                            <td rowspan="2" nowrap="nowrap">
                                计量单位
                            </td>
                            <td rowspan="2" nowrap="nowrap">
                                序号
                            </td>
                            <td colspan="4">
                                灾毁数量
                            </td>
                            <td colspan="4">
                                水毁数量
                            </td>
                            <td colspan="2">
                                涉及金额（万元）
                            </td>
                            <td colspan="2">
                                水毁涉及金额<br/>（万元）
                            </td>
                        </tr>
                        <tr style="text-align: center; color: #0076C8; background-color: #F4FAFF; font-weight: bold">
                            <td colspan="2">
                                合计
                            </td>
                            <td colspan="2">
                                国省干线
                            </td>
                            <td colspan="2">
                                &nbsp;合计
                            </td>
                            <td colspan="2">
                                国省干线
                            </td>
                            <td>
                                合计
                            </td>
                            <td>
                                国省干线
                            </td>
                            <td>
                                &nbsp;合计
                            </td>
                            <td>
                                国省干线
                            </td>
                        </tr>
                        <tr align="center" bgcolor='#F4FAFF'>
                            <td width="30">
                                甲
                            </td>
                            <td colspan="2">
                                乙
                            </td>
                            <td>
                                丙
                            </td>
                            <td>
                                丁
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
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td nowrap="nowrap" align="left" rowspan="12" style="font-weight: bolder; text-align: center">
                                损<br />
                                失<br />
                                情<br />
                                况
                            </td>
                            <td colspan="2">
                                路基
                            </td>
                            <td nowrap>
                                立方米/公里
                            </td>
                            <td align="center">
                                1
                            </td>
                            <td>
                                <input onblur="check(this)" name="zhqk.sj1o1" type="text" id="sj1o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o2" type="text" id="sj1o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o3" type="text" id="sj1o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o4" type="text" id="sj1o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o5" type="text" id="sj1o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o6" type="text" id="sj1o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o7" type="text" id="sj1o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o8" type="text" id="sj1o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o9" type="text" id="sj1o9" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o10" type="text" id="sj1o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o11" type="text" id="sj1o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj1o12" type="text" id="sj1o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td rowspan="3">
                                路面
                            </td>
                            <td nowrap>
                                沥青路面
                            </td>
                            <td>
                                平方米/公里
                            </td>
                            <td align="center">
                                2
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o1" type="text" id="sj2o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o2" type="text" id="sj2o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o3" type="text" id="sj2o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o4" type="text" id="sj2o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o5" type="text" id="sj2o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o6" type="text" id="sj2o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o7" type="text" id="sj2o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o8" type="text" id="sj2o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o9" type="text" id="sj2o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj2o10" type="text" id="sj2o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o11" type="text" id="sj2o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj2o12" type="text" id="sj2o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td>
                                水泥路面
                            </td>
                            <td>
                                平方米/公里
                            </td>
                            <td align="center">
                                3
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj3o1" type="text" id="sj3o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o2" type="text" id="sj3o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o3" type="text" id="sj3o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o4" type="text" id="sj3o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o5" type="text" id="sj3o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o6" type="text" id="sj3o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o7" type="text" id="sj3o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o8" type="text" id="sj3o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o9" type="text" id="sj3o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj3o10" type="text" id="sj3o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o11" type="text" id="sj3o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj3o12" type="text" id="sj3o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td>
                                砂石路面
                            </td>
                            <td>
                                平方米/公里
                            </td>
                            <td align="center">
                                4
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o1" type="text" id="sj4o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o2" type="text" id="sj4o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o3" type="text" id="sj4o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o4" type="text" id="sj4o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o5" type="text" id="sj4o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o6" type="text" id="sj4o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o7" type="text" id="sj4o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o8" type="text" id="sj4o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o9" type="text" id="sj4o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj4o10" type="text" id="sj4o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o11" type="text" id="sj4o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj4o12" type="text" id="sj4o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td colspan="2">
                                桥梁
                            </td>
                            <td>
                                延米/座
                            </td>
                            <td align="center">
                                5
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o1" type="text" id="sj5o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o2" type="text" id="sj5o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o3" type="text" id="sj5o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o4" type="text" id="sj5o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o5" type="text" id="sj5o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o6" type="text" id="sj5o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o7" type="text" id="sj5o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o8" type="text" id="sj5o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o9" type="text" id="sj5o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj5o10" type="text" id="sj5o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o11" type="text" id="sj5o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj5o12" type="text" id="sj5o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td colspan="2" nowrap>
                                隧道
                            </td>
                            <td>
                                延米/道
                            </td>
                            <td align="center">
                                6
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj6o1" type="text" id="sj6o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o2" type="text" id="sj6o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o3" type="text" id="sj6o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o4" type="text" id="sj6o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o5" type="text" id="sj6o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o6" type="text" id="sj6o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o7" type="text" id="sj6o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o8" type="text" id="sj6o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o9" type="text" id="sj6o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj6o10" type="text" id="sj6o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o11" type="text" id="sj6o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj6o12" type="text" id="sj6o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td rowspan="2">
                                防护工程
                            </td>
                            <td nowrap>
                                护坡
                            </td>
                            <td>
                                立方米/处
                            </td>
                            <td align="center">
                                7
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o1" type="text" id="sj7o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o2" type="text" id="sj7o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o3" type="text" id="sj7o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o4" type="text" id="sj7o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o5" type="text" id="sj7o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o6" type="text" id="sj7o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o7" type="text" id="sj7o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o8" type="text" id="sj7o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o9" type="text" id="sj7o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj7o10" type="text" id="sj7o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o11" type="text" id="sj7o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj7o12" type="text" id="sj7o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td nowrap="nowrap">
                                驳岸、挡墙
                            </td>
                            <td>
                                立方米/处
                            </td>
                            <td align="center">
                                8
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o1" type="text" id="sj8o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o2" type="text" id="sj8o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o3" type="text" id="sj8o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o4" type="text" id="sj8o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o5" type="text" id="sj8o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o6" type="text" id="sj8o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o7" type="text" id="sj8o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o8" type="text" id="sj8o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o9" type="text" id="sj8o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj8o10" type="text" id="sj8o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o11" type="text" id="sj8o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj8o12" type="text" id="sj8o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td colspan="2">
                                坍塌方
                            </td>
                            <td>
                                立方米/处
                            </td>
                            <td align="center">
                                9
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o1" type="text" id="sj9o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o2" type="text" id="sj9o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o3" type="text" id="sj9o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o4" type="text" id="sj9o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o5" type="text" id="sj9o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o6" type="text" id="sj9o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o7" type="text" id="sj9o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o8" type="text" id="sj9o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o9" type="text" id="sj9o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj9o10" type="text" id="sj9o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o11" type="text" id="sj9o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj9o12" type="text" id="sj9o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td colspan="2">
                                公路中断
                            </td>
                            <td>
                                处/条
                            </td>
                            <td align="center">
                                10
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o1" type="text" id="sj10o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o2" type="text" id="sj10o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o3" type="text" id="sj10o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o4" type="text" id="sj10o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o5" type="text" id="sj10o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o6" type="text" id="sj10o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o7" type="text" id="sj10o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o8" type="text" id="sj10o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o9" type="text" id="sj10o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj10o10" type="text" id="sj10o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o11" type="text" id="sj10o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj10o12" type="text" id="sj10o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td colspan="2">
                                其他灾毁损失
                            </td>
                            <td>
                                万元
                            </td>
                            <td align="center">
                                11
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o1" type="text" id="sj11o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o2" type="text" id="sj11o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o3" type="text" id="sj11o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o4" type="text" id="sj11o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o5" type="text" id="sj11o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o6" type="text" id="sj11o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o7" type="text" id="sj11o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o8" type="text" id="sj11o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o9" type="text" id="sj11o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj11o10" type="text" id="sj11o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o11" type="text" id="sj11o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj11o12" type="text" id="sj11o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td colspan="2">
                                损失合计
                            </td>
                            <td>
                                万元
                            </td>
                            <td align="center">
                                12
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o1" type="text" id="sj12o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o2" type="text" id="sj12o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o3" type="text" id="sj12o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o4" type="text" id="sj12o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o5" type="text" id="sj12o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o6" type="text" id="sj12o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o7" type="text" id="sj12o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o8" type="text" id="sj12o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o9" type="text" id="sj12o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj12o10" type="text" id="sj12o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o11" type="text" id="sj12o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj12o12" type="text" id="sj12o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td nowrap="nowrap" align="left" rowspan="3" style="font-weight: bolder; text-align: center">
                                抢<br />
                                通<br />
                                情<br />
                                况
                            </td>
                            <td colspan="2">
                                已抢通公路
                            </td>
                            <td>
                                处/条
                            </td>
                            <td align="center">
                                13
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o1" type="text" id="sj13o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o2" type="text" id="sj13o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o3" type="text" id="sj13o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o4" type="text" id="sj13o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o5" type="text" id="sj13o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o6" type="text" id="sj13o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o7" type="text" id="sj13o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o8" type="text" id="sj13o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o9" type="text" id="sj13o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj13o10" type="text" id="sj13o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o11" type="text" id="sj13o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj13o12" type="text" id="sj13o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td colspan="2">
                                已投入机械
                            </td>
                            <td>
                                台班
                            </td>
                            <td align="center">
                                14
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o1" type="text" id="sj14o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o2" type="text" id="sj14o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o3" type="text" id="sj14o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o4" type="text" id="sj14o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o5" type="text" id="sj14o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o6" type="text" id="sj14o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o7" type="text" id="sj14o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o8" type="text" id="sj14o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o9" type="text" id="sj14o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj14o10" type="text" id="sj14o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o11" type="text" id="sj14o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj14o12" type="text" id="sj14o12" size="8" />
                            </td>
                        </tr>
                        <tr bgcolor='#F4FAFF'>
                            <td colspan="2">
                                已投入资金
                            </td>
                            <td>
                                万元
                            </td>
                            <td align="center">
                                15
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o1" type="text" id="sj15o1" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o2" type="text" id="sj15o2" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o3" type="text" id="sj15o3" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o4" type="text" id="sj15o4" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o5" type="text" id="sj15o5" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o6" type="text" id="sj15o6" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o7" type="text" id="sj15o7" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o8" type="text" id="sj15o8" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o9" type="text" id="sj15o9" size="8" />
                            </td>
                           <td>
								<input onblur="check(this)" name="zhqk.sj15o10" type="text" id="sj15o10" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o11" type="text" id="sj15o11" size="8" />
                            </td>
                            <td>
								<input onblur="check(this)" name="zhqk.sj15o12" type="text" id="sj15o12" size="8" />
                            </td>
                        </tr>
                    </table>
        <div style="padding-top: 10px;">
           <a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="insertzhqk()">保存</a>
		   <a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel" onclick="closes('zhqk_bj')">取消</a></td>
        </div>
        <br />
    </center>
    </form>
</body>
</html>

