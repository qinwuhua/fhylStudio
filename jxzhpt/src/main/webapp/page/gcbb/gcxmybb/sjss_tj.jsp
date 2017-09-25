<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <link href="/jxzhpt/css/searchAndNavigation.css" type="text/css" />
  <link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
  <link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
  <script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
  <script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
  <link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
  <link rel="stylesheet" type="text/css" href="/jxzhpt/css/style.css" />
  <style>
    #p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(/jxzhpt/images/jianjiao.png) 8px 0 no-repeat;}
    #righttop{height:33px;background:url(/jxzhpt/images/righttopbg.gif) 0 0 repeat-x;}
  </style>
  <script type="text/javascript">
    function save(){
    	var list_map = new Array();
    	for(var i=1;i<25;i++){
    		var obj=$("#tr"+i+" input");
   			var excel_list = {gydw:"",nf:"",yf:"",v_0:"",v_1:"",v_2:"",v_3:"",v_4:"",v_5:"",v_6:"",v_7:"",v_8:"",v_9:"",v_10:"",v_11:"",v_12:"",v_13:""};
       		excel_list.gydw+=$.cookie('unit');
       		excel_list.nf+=$("#nf").combobox('getValue');
       		excel_list.yf+=$("#yf").combobox('getValue');
       		excel_list.v_0+=$(obj[0]).val();
       		excel_list.v_1+=$(obj[1]).val();
       		excel_list.v_2+=$(obj[2]).val();
       		excel_list.v_3+=$(obj[3]).val();
       		excel_list.v_4+=$(obj[4]).val();
       		excel_list.v_5+=$(obj[5]).val();
       		excel_list.v_6+=$(obj[6]).val();
       		excel_list.v_7+=$(obj[7]).val();
       		excel_list.v_8+=$(obj[8]).val();
       		excel_list.v_9+=$(obj[9]).val();
       		excel_list.v_10+=$(obj[10]).val();
       		excel_list.v_11+=$(obj[11]).val();
       		excel_list.v_12+=$(obj[12]).val();
       		excel_list.v_13+=$(obj[13]).val();
       		list_map.push(excel_list);
       	
       		
    	}
    	var json_data = JSON.stringify(list_map); 
    	loadjzt();
    	$.ajax({
			type:'post',
			url:'/jxzhpt/gcybb/insertOrUpdatesjss.do',
			data:"flag="+json_data,
			dataType:'json',
			success:function(data){
				alert("保存成功！");
				disLoadjzt();
				parent.$('#lxxx').window('destroy');
			}
		});
   
    }
    
    $(function(){
		setnf();setyf();
		
		getinsertorupdate();
    })
    
    function setnf(){
		var id='nf';
		var myDate = new Date();
		var years=[];
		for(var i=2011;i<=2020;i++){
			years.push({text:(i),value:(i)});
		}
		$('#'+id).combobox({    
		    data:years,
		    valueField:'text',    
		    textField:'text',
		    onSelect:function(record){
		    	getinsertorupdate();
			}
		});
		$('#'+id).combobox("setValue",new Date().getFullYear());
	}
	function setyf(){
		var id='yf';
		var myDate = new Date();
		var years=[];
		for(var i=1;i<=12;i++){
			years.push({text:(i),value:(i)});
		}
		$('#'+id).combobox({    
		    data:years,
		    valueField:'text',    
		    textField:'text',
		    onSelect:function(record){
		    	getinsertorupdate();
			}  
		});
		$('#'+id).combobox("setValue",new Date().getMonth());
	}
	
	
	function getinsertorupdate(){
	
		loadjzt();
		var data="excel_list.nf="+$("#nf").combo('getValue')+"&excel_list.gydw="+$.cookie('unit2')+"&excel_list.yf="+$("#yf").combo('getValue');
    	$.ajax({
			type:'post',
			url:'/jxzhpt/gcybb/getinsertorupdate.do',
			data:data,
			dataType:'json',
			success:function(data){
				
				disLoadjzt();
				
				if(data.length==24)
				for(var i=0;i<data.length;i++){
		    		var obj=$("#tr"+(i+1)+" input");
		   			$(obj[0]).val(data[i].v_0);
		   			$(obj[1]).val(data[i].v_1);
		   			$(obj[2]).val(data[i].v_2);
		   			$(obj[3]).val(data[i].v_3);
		   			$(obj[4]).val(data[i].v_4);
		   			$(obj[5]).val(data[i].v_5);
		   			$(obj[6]).val(data[i].v_6);
		   			$(obj[7]).val(data[i].v_7);
		   			$(obj[8]).val(data[i].v_8);
		   			$(obj[9]).val(data[i].v_9);
		   			$(obj[10]).val(data[i].v_10);
		   			$(obj[11]).val(data[i].v_11);
		   			$(obj[12]).val(data[i].v_12);
		   			$(obj[13]).val(data[i].v_13);
		    	}
				else{
					for(var i=0;i<24;i++){
						var obj=$("#tr"+(i+1)+" input");
						$(obj[5]).val(0);
			   			$(obj[6]).val(0);
			   			$(obj[7]).val(0);
			   			$(obj[8]).val(0);
			   			$(obj[9]).val(0);
			   			$(obj[10]).val(0);
			   			$(obj[11]).val(0);
			   			$(obj[12]).val(0);
			   			$(obj[13]).val(0);
					}
					
				}
				
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
#bbtable {
  border-collapse:collapse;
}
#bbtable thead tr td {
  text-align:center;  
  font-size:1em;
  font-weight:bold;
    border:1px solid black;
    padding:3px 7px 2px 7px;
}
#bbtable tbody tr td {
  text-align:center;  
  font-size:1em;
/*  font-weight:bold; */
    border:1px solid black;
    padding:3px 7px 2px 7px;
}
-->
</style>
</head>
<body style="padding-right:1px">
  <div style="text-align: left; font-size: 12px; margin: 0px;" >
    <table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;height:100%;" cellspacing="0" cellpadding="0" >
      <tr>
              <td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                  <div id="gddiv" style="width:100%;height:400px" >
                  
                    <div  class="easyui-layout" fit="true" >
              <div data-options="region:'center',border:false" style="overflow:auto;">
              <table id='bbtable' width="1160px" >
                <caption align="top" style="font-size:x-large;font-weight: bolder;"><input type="text" id="nf"  style="width:80px;">年<input type="text" id="yf"  style="width:80px;">月危桥改造等三件实事进展情况汇总表 </caption>
                
                  <tr>
                    <td rowspan="3" colspan="5" style="width: 300px;">项目</td>
                    <td colspan="4" style="width: 260px;">公路安全生命防护工程（安保工程）</td>
                    <td colspan="4" style="width: 260px;">危桥改造</td>
                    <td rowspan="2" style="width: 70px;">灾害防治工程</td>
                  </tr> 
                  <tr>
                    <td style="width: 70px;">总计</td>
                    <td style="width: 70px;">国省干线</td>
                    <td style="width: 70px;">县、乡公路</td>
                    <td style="width: 70px;">村道公路</td>
                    <td style="width: 70px;">总计</td>
                    <td style="width: 70px;">国省干线</td>
                    <td style="width: 70px;">县、乡公路</td>
                    <td style="width: 70px;">村道公路</td>
                  </tr>
                  <tr>
                    <td style="width: 70px;">甲</td>
                    <td style="width: 70px;">乙</td>
                    <td style="width: 70px;">丙</td>
                    <td style="width: 70px;">丙</td>
                    <td style="width: 70px;">丁</td>
                    <td style="width: 70px;">戊</td>
                    <td style="width: 70px;">己</td>
                    <td style="width: 70px;">己</td>
                    <td style="width: 70px;">庚</td>
                  </tr>
                  <tr id='tr1'>
                    <td style="width: 70px;" colspan=2 rowspan=4>总计
                    <input type="hidden" value='总计'>
                    <input type="hidden" value='总计'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位1'>
                    <input type="hidden" value='1'>
                    </td>
                    <td style="width: 70px;" rowspan=2>完成工程量</td>
                    <td style="width: 70px;">单位1</td>
                    <td style="width: 70px;">1</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr2'>
                    <td style="width: 70px;">单位2
                    <input type="hidden" value='总计'>
                    <input type="hidden" value='总计'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位2'>
                    <input type="hidden" value='2'>
                    </td>
                    <td style="width: 70px;">2</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr3'>
                    <td style="width: 70px;" rowspan=2>完成投资（万元）
                    <input type="hidden" value='总计'>
                    <input type="hidden" value='总计'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='总投资'>
                    <input type="hidden" value='3'>
                    </td>
                    <td style="width: 70px;">总投资</td>
                    <td style="width: 70px;">3</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr4'>
                    <td style="width: 70px;">中央投资
                    <input type="hidden" value='总计'>
                    <input type="hidden" value='总计'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='中央投资'>
                    <input type="hidden" value='4'>
                    </td>
                    <td style="width: 70px;">4</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr5'>
                    <td style="width: 70px;" colspan=1 rowspan=14>车购税安排项目
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='计划下达工程量'>
                    <input type="hidden" value='单位1'>
                    <input type="hidden" value='5'>
                    </td>
                    <td style="width: 70px;" rowspan=10>其中：2017年计划安排</td>
                    <td style="width: 70px;" rowspan=2>计划下达工程量</td>
                    <td style="width: 70px;">单位1</td>
                    <td style="width: 70px;">5</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr6'>
                    <td style="width: 70px;">单位2
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='计划下达工程量'>
                    <input type="hidden" value='单位2'>
                    <input type="hidden" value='6'>
                    </td>
                    <td style="width: 70px;">6</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr7'>
                    <td style="width: 70px;" rowspan=2>完成工程量
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位1'>
                    <input type="hidden" value='7'>
                    </td>
                    <td style="width: 70px;">单位1</td>
                    <td style="width: 70px;">7</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr8'>
                    <td style="width: 70px;">单位2
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位2'>
                    <input type="hidden" value='8'>
                    </td>
                    <td style="width: 70px;">8</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr9'>
                    <td style="width: 70px;" rowspan=3>计划下达资金量（万元）
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='计划下达资金量（万元）'>
                    <input type="hidden" value='总投资'>
                    <input type="hidden" value='9'>
                    </td>
                    <td style="width: 70px;">总投资</td>
                    <td style="width: 70px;">9</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr10'>
                    <td style="width: 70px;">中央投资
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='计划下达资金量（万元）'>
                    <input type="hidden" value='中央投资'>
                    <input type="hidden" value='10'>
                    </td>
                    <td style="width: 70px;">10</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr11'>
                    <td style="width: 70px;">地方自筹
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='计划下达资金量（万元）'>
                    <input type="hidden" value='地方自筹'>
                    <input type="hidden" value='11'>
                    </td>
                    <td style="width: 70px;">11</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr12'>
                    <td style="width: 70px;" rowspan=3>完成投资（万元）
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='总投资'>
                    <input type="hidden" value='12'>
                    </td>
                    <td style="width: 70px;">总投资</td>
                    <td style="width: 70px;">12</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr13'>
                    <td style="width: 70px;">中央投资
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='中央投资'>
                    <input type="hidden" value='13'>
                    </td>
                    <td style="width: 70px;">13</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr14'>
                    <td style="width: 70px;">地方自筹
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='其中：2017年计划安排'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='地方自筹'>
                    <input type="hidden" value='14'>
                    </td>
                    <td style="width: 70px;">14</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr15'>
                    <td style="width: 70px;" colspan=1 rowspan=4>2017年完成的跨年度计划项目
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='2017年完成的跨年度计划项目'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位1'>
                    <input type="hidden" value='15'>
                    </td>
                    <td style="width: 70px;" rowspan=2>完成工程量</td>
                    <td style="width: 70px;">单位1</td>
                    <td style="width: 70px;">15</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr16'>
                    <td style="width: 70px;">单位2
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='2017年完成的跨年度计划项目'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位2'>
                    <input type="hidden" value='16'>
                    </td>
                    <td style="width: 70px;">16</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr17'>
                    <td style="width: 70px;" rowspan=2>完成投资（万元）
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='2017年完成的跨年度计划项目'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='总投资'>
                    <input type="hidden" value='17'>
                    </td>
                    <td style="width: 70px;">总投资</td>
                    <td style="width: 70px;">17</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr18'>
                    <td style="width: 70px;">中央投资
                    <input type="hidden" value='车购税安排项目'>
                    <input type="hidden" value='2017年完成的跨年度计划项目'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='中央投资'>
                    <input type="hidden" value='18'>
                    </td>
                    <td style="width: 70px;">18</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr19'>
                    <td style="width: 70px;" colspan=1 rowspan=6>省内自行安排
                    <input type="hidden" value='省内自行安排'>
                    <input type="hidden" value='其中：2017年投资项目'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位1'>
                    <input type="hidden" value='19'>
                    </td>
                    <td style="width: 70px;" colspan=1 rowspan=3>其中：2017年投资项目</td>
                    <td style="width: 70px;" colspan=1 rowspan=2>完成工程量</td>
                    <td style="width: 70px;">单位1</td>
                    <td style="width: 70px;">19</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr20'>
                    <td style="width: 70px;">单位2
                    <input type="hidden" value='省内自行安排'>
                    <input type="hidden" value='其中：2017年投资项目'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位2'>
                    <input type="hidden" value='20'>
                    </td>
                    <td style="width: 70px;">20</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr21'>
                    <td style="width: 70px;" colspan=2 rowspan=1>完成投资（万元）
                    <input type="hidden" value='省内自行安排'>
                    <input type="hidden" value='其中：2017年投资项目'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='21'>
                    </td>
                    <td style="width: 70px;">21</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr22'>
                    <td style="width: 70px;" colspan=1 rowspan=3>2017年完成的跨年度项目
                    <input type="hidden" value='省内自行安排'>
                    <input type="hidden" value='2017年完成的跨年度项目'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位1'>
                    <input type="hidden" value='22'>
                    </td>
                    <td style="width: 70px;" colspan=1 rowspan=2>完成工程量</td>
                    <td style="width: 70px;">单位1</td>
                    <td style="width: 70px;">22</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr23'>
                    <td style="width: 70px;">单位2
                    <input type="hidden" value='省内自行安排'>
                    <input type="hidden" value='2017年完成的跨年度项目'>
                    <input type="hidden" value='完成工程量'>
                    <input type="hidden" value='单位2'>
                    <input type="hidden" value='23'>
                    </td>
                    <td style="width: 70px;">23</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  <tr id='tr24'>
                    <td style="width: 70px;" colspan=2 rowspan=1>完成投资（万元）
                   	<input type="hidden" value='省内自行安排'>
                    <input type="hidden" value='2017年完成的跨年度项目'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='完成投资（万元）'>
                    <input type="hidden" value='24'>
                    </td>
                    <td style="width: 70px;">24</td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                    <td style="width: 70px;"><input type='number' style='width:60px;'></td>
                  </tr>
                  
                  <tr>
                    <td colspan=14 >
                      <input type='button' value='保存' onclick="save()">
                    </td>
                    
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>