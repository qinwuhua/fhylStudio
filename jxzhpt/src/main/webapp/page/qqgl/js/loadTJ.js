function tsdq(id){
			$("#"+id).combobox({    
				checkbox: true,
			    url: '/jxzhpt/xmjzbb/settsdq1.do?xzqh='+$.cookie("dist")
			})
			$("#"+id).combobox('setValue','全部');
	}

function xmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i),value:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
}


function xmnf2(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text'
	});
	$('#'+id).combobox("setValue",first);
}