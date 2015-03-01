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