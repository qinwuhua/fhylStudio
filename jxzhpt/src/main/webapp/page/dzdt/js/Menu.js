
function turnTo(_id,_parent,_name){
	var url="";
	var menuId="";
	var sj=$.cookie("dist2")=="36"?"1":"0";
	switch(_id.substr(0,8)){
		case "01010201": url="page/lwxm/Menu.jsp";menuId="Menu_2";break;
		case "01010203": url="page/lwxm/Menu.jsp";menuId="Menu_2";break;
		case "01010301": url="page/jhgl/Menu.jsp";menuId="Menu_3";break;
		case "01010402": url="page/gcgl/Menu.jsp";menuId="Menu_4";break;
	}
	url=url+"?id="+_id+"&sj="+sj;
	parent.$("#c1f").attr("src",url);
	parent.$("#Menu_1").removeClass('now');
	parent.$("#"+menuId).addClass('now');
}
function selAnyChartXml(){
	$.ajax({
		type:"post",
		url:"../../xtgl/selAnyChartXml.do",
		dataType:'json',
		data:"param.sourceid="+$.cookie("unit2")+"&param.xzqh="+$.cookie("dist"),
		success:function(msg){
			createAnyChartXml(msg.hm2.xml);
			var list1=msg.hm1.list;
			for(var i=0;i<list1.length;i++){
				$("#ip_"+list1[i].name).html(list1[i].id);
			}
			var list2=msg.hm1.list2;
			for(var i=0;i<list2.length;i++){
				$("#ip_"+list2[i].parent).html(list2[i].id);
			}
		}
	});
}
function createAnyChartXml(_xml){
    barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
    barChart_1.width =350;
    barChart_1.height =300;
    barChart_1.padding =0;
    barChart_1.wMode="transparent";
    barChart_1.write("anychart_div");
    barChart_1.setData(_xml);
}
function xmlxTj(){
	$.ajax({
		type:"post",
		url:"../../xtgl/xmlxCountTj.do",
		dataType:'json',
		data:'param.id='+$.cookie("qx4"),
		success:function(msg){
			if(msg!=null){
				var htmlStr="";
				for(var i=0;i<msg.length;i++){
					if(msg[i].desr!=""){
						htmlStr+="<tr><td height='25' width='140px' bgcolor='#FfFfFf' align='center' rowspan="+msg[i].desr+"><span>"+msg[i].parent+"（<span style='font-weight:700; color:#b80f0f;' id='ip_"+msg[i].id.substr(0,8)+"'></span>）</span></td>"+
					    "<td width='210px' bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].id+"','"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;' ><span id='ip_"+msg[i].id+"'></span></a></td></tr>";
					}else{
						htmlStr+="<tr><td bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].id+"','"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;'><span id='ip_"+msg[i].id+"'></span></a></td></tr>";
					}
				}
				$("#xmlxTj_table").html(htmlStr);
			}
		}
	});
	selAnyChartXml();
}