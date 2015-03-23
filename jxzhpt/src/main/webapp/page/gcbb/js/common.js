function xmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
	$('#'+id).combobox("setValue",first);
}
function getYearList(){
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcbb/getYearList.do',
		success:function(data){
			var msg=$.parseJSON(data);
			if(msg!=null){
				var str='';
				for(var i=0;i<msg.length;i++){
					str+='<option value='+msg[i]+'>'+msg[i]+'</option>';
				}
				$('#year').html(str);
			}
		}
	});
}
function getMonthList(){
	
}