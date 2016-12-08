<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目字段选择列表</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YMLib.js"></script>
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
<script type="text/javascript">
	$(function(){
		var nameValue;
		var colValue;
		var tableValue;
		var tableCol;
		var flag=parent.YMLib.Var.flag;
		var tiaojian=parent.YMLib.Var.tiaojian;
		var xmnf=parent.YMLib.Var.xmnf;
		var ybnf=parent.YMLib.Var.ybnf;
		var ybyf=parent.YMLib.Var.ybyf;
		
		$("#save_button").click(function(){
			nameValue=new Array();
			colValue= new Array();
			tableValue=new Array();
			tableCol=new Array();
			parent.YMLib.Var.sqlcol="";
			parent.YMLib.Var.tablecol="";
			var jhxdjwcqk=false;var zb=0;
			$("input[name=checkbox]:checked").each(function(i,e){
				//alert(this.value+"    "+this.nextSibling.nodeValue+"");
				if(this.value=='jhxdjwcqk'){
					jhxdjwcqk=true;zb=i;
				}
					
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	parent.YMLib.Var.sqlcol+=this.value+" v_"+i+",";
		    	parent.YMLib.Var.tablecol+=this.nextSibling.nodeValue+",";
		    	
			});
			
			var min=xmnf[xmnf.length-1];
			var max=xmnf[0];
			var str1='';var str2='';var str3='';
			for(var i=xmnf.length-1;i>=0;i--){
				str1=str1+'<td colspan="10">计划下达及完成情况</td>';
				str2=str2+'<td rowspan="1" colspan="4">'+xmnf[i]+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年车购税到位（万元）</td><td rowspan="2">累计车购税到位（万元）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td>';
				str3=str3+'<td>项目数量</td><td>建设里程（公里）</td><td>中央或省统筹资金（万元）含续建</td><td>计划总投资</td>';
			}
			var biaotstr='<tr>';
			if(jhxdjwcqk){
				for(var i=0;i<zb;i++){
					biaotstr+='<td rowspan="3">'+nameValue[i]+'</td>';
				}
				if(zb==nameValue.length){
					biaotstr+='<td colspan="10">计划下达及完成情况</td>'+str1+'</tr>'
					+'<td rowspan="1" colspan="4">'+min+'-'+max+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年车购税到位（万元）</td><td rowspan="2">累计车购税到位（万元）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td>'
					+str2+'</tr>'
					+'<td>项目数量</td><td>建设里程（公里）</td><td>中央或省统筹资金（万元）含续建</td><td>计划总投资</td>'
					+str3+'</tr>';
				}else{
					biaotstr+='<td colspan="10">计划下达及完成情况</td>'+str1+'<td rowspan="3">备注</td></tr>'
					+'<td rowspan="1" colspan="4">'+min+'-'+max+'年度</td><td rowspan="2">本年完成里程（公里）</td><td rowspan="2">累计完成里程（公里）</td><td rowspan="2">本年车购税到位（万元）</td><td rowspan="2">累计车购税到位（万元）</td><td rowspan="2">本年完成投资（万元）</td><td rowspan="2">累计完成投资（万元）</td>'
					+str2+'</tr>'
					+'<td>项目数量</td><td>建设里程（公里）</td><td>中央或省统筹资金（万元）含续建</td><td>计划总投资</td>'
					+str3+'</tr>';
				}
				var len=(xmnf.length+1)*1000+"px";
				parent.$("#kdtb").attr('width',len);
			}else{
				for(var i=0;i<nameValue.length;i++){
					biaotstr+='<td rowspan="3">'+nameValue[i]+'</td>';
				}
				biaotstr+='</tr>';
				var len=(nameValue.length+1)*150+"px";
				parent.$("#kdtb").attr('width',len);
			}
			
			var biaotou = parent.$("#biaotou");
			biaotou.empty();
			biaotou.append(biaotstr);
			
			if(flag=='flag'){
				
				var data="flag=flag&gcglwqgz.tiaojian="+tiaojian+"&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+ybnf+"&gcglwqgz.ybyf="+ybyf+"&gcglwqgz.nameValue="+nameValue.join(",")+"&gcglwqgz.colValue="+colValue.join(",");
				window.location.href="/jxzhpt/gcybb/getGjxjmxb.do?"+data;
			}else{
				var tbody = parent.$("#wqgzlist");
				tbody.empty();
				var data="flag=&gcglwqgz.tiaojian="+tiaojian+"&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+ybnf+"&gcglwqgz.ybyf="+ybyf+"&gcglwqgz.nameValue="+nameValue.join(",")+"&gcglwqgz.colValue="+colValue.join(",");
				//alert(data);
				$.ajax({
					url:"/jxzhpt/gcybb/getGjxjmxb.do",
					data:data,
					type:"post",
					dataType:"JSON",
					success:function(msg){
						
						var tbodystr="";
						if (msg != null) {
							for ( var i = 0; i < msg.length; i++) {
								if(i==0){
											var strs="";
											for(var j=xmnf.length-1;j>=0;j--){
												var s1="XMSL"+xmnf[j];
												var s2="XMLC"+xmnf[j];
												var s3="BBZORSBZ"+xmnf[j];
												var s4="WCLC"+xmnf[j];
												var s5="LJWCLC"+xmnf[j];
												var s6="BBZ"+xmnf[j];
												var s7="PFZTZ"+xmnf[j];
												var s8="LJWCBBZ"+xmnf[j];
												var s9="WCXMZJ"+xmnf[j];
												var s10="LJWCZJ"+xmnf[j];
												strs=strs+msg[i][s1]+"</td><td>"+msg[i][s2].toFixed(2)+"</td><td>"
												+msg[i][s3].toFixed(2)+"</td><td>"+msg[i][s7].toFixed(2)+"</td><td>"+msg[i][s4].toFixed(2)+"</td><td>"
												+msg[i][s5].toFixed(2)+"</td><td>"+msg[i][s6].toFixed(2)+"</td><td>"
												+msg[i][s8].toFixed(2)+"</td><td>"
												+msg[i][s9].toFixed(2)+"</td><td>"+msg[i][s10].toFixed(2)+"</td><td>";
											}
											tbodystr=tbodystr+"<tr><td colspan='2'>"+msg[i].XZQHMC+"</td><td>"
											+$("#xmlx").combobox("getText")+"</td><td>"
											+msg[i].XMSL+"</td><td>"+msg[i].XMLC.toFixed(2)+"</td><td>"
											+msg[i].BBZORSBZ.toFixed(2)+"</td><td>"+msg[i].PFZTZ.toFixed(2)+"</td><td>"+msg[i].WCLC.toFixed(2)+"</td><td>"
											+msg[i].LJWCLC.toFixed(2)+"</td><td>"+msg[i].BBZ.toFixed(2)+"</td><td>"
											+msg[i].LJWCBBZ.toFixed(2)+"</td><td>"+msg[i].WCXMZJ.toFixed(2)+"</td><td>"
											+msg[i].LJWCZJ.toFixed(2)+"</td><td>"
											+strs+"</tr>";
								}else{
									var strs="";
									for(var j=xmnf.length-1;j>=0;j--){
										var s1="XMSL"+xmnf[j];
										var s2="XMLC"+xmnf[j];
										var s3="BBZORSBZ"+xmnf[j];
										var s4="WCLC"+xmnf[j];
										var s5="LJWCLC"+xmnf[j];
										var s6="BBZ"+xmnf[j];
										var s7="PFZTZ"+xmnf[j];
										var s8="LJWCBBZ"+xmnf[j];
										var s9="WCXMZJ"+xmnf[j];
										var s10="LJWCZJ"+xmnf[j];
										strs=strs+msg[i][s1]+"</td><td>"+msg[i][s2].toFixed(2)+"</td><td>"
										+msg[i][s3].toFixed(2)+"</td><td>"+msg[i][s7].toFixed(2)+"</td><td>"+msg[i][s4].toFixed(2)+"</td><td>"
										+msg[i][s5].toFixed(2)+"</td><td>"+msg[i][s6].toFixed(2)+"</td><td>"
										+msg[i][s8].toFixed(2)+"</td><td>"
										+msg[i][s9].toFixed(2)+"</td><td>"+msg[i][s10].toFixed(2)+"</td><td>";
									}
									tbodystr=tbodystr+"<tr><td>"+msg[i].XH+"</td><td>"+msg[i].XZQHMC+"</td><td>"
									+$("#xmlx").combobox("getText")+"</td><td>"
									+msg[i].XMSL+"</td><td>"+msg[i].XMLC.toFixed(2)+"</td><td>"
									+msg[i].BBZORSBZ.toFixed(2)+"</td><td>"+msg[i].PFZTZ.toFixed(2)+"</td><td>"+msg[i].WCLC.toFixed(2)+"</td><td>"
									+msg[i].LJWCLC.toFixed(2)+"</td><td>"+msg[i].BBZ.toFixed(2)+"</td><td>"
									+msg[i].LJWCBBZ.toFixed(2)+"</td><td>"+msg[i].WCXMZJ.toFixed(2)+"</td><td>"
									+msg[i].LJWCZJ.toFixed(2)+"</td><td>"
									+strs+"</tr>";
								}
							}
							tbody.append(tbodystr);
						}
					}
				});
			}
			
			
			
			parent.$('#zdxz').window('destroy');
		});
		
		$("#qx_window").click(function(){
			parent.$('#zdxz').window('destroy');
		});	
	
		// 全选
		$("#qx").bind("click", function () {
            $("[name = checkbox]:checkbox").attr("checked", true);
          
        }); 

        // 全不选
        $("#bx").bind("click", function () {
            $("[name = checkbox]:checkbox").attr("checked", false);
           
        });

        // 反选
        $("#fx").bind("click", function () {
            $("[name = checkbox]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
           
        });
        
       
        
	});
</script>


<center>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="2" cellspacing="1">
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;"align="center" >
					<input  type="radio" value="qx" name="radio" id="qx"/>全选
					<input  type="radio" value="fx" name="radio" id="fx"/>反选
					<input  type="radio" value="bx" name="radio" id="bx"/>不选
				</td>
			</tr>
			
			<tr  style="height: 200px;">
				<td style="background-color: #ffffff;width:34%" align="center" valign="top">
					<table border="0" style="margin-top: 0">
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="xh" name="checkbox" class="part1"/>序号</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="sqs" name="checkbox" class="part1"/>设区市</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="xmlx" name="checkbox" class="part1"/>项目类型</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jhxdjwcqk" name="checkbox" class="part1"/>计划下达及完成情况</td>
						
						</tr>
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="bz" name="checkbox" class="part1"/>备注</td>
							
						</tr>
						
						
						
						
					</table>
				</td>
				
				
			</tr>
			
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确认</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
			</center>
</body>
</html>