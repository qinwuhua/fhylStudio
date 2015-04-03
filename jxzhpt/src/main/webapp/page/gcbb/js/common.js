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

function exportExcel_gljsxd(){
	var gydw=$("#gydw").combotree("getValue");
	if(gydw='36'){
		gydw="";
	}
	var param="xzqhdm="+$("#xzqh").combotree("getValue")+"&gydw="+gydw+"&xmnf="+$("#year").combobox("getValue");
	window.location.href="/jxzhpt/dbbb/exportExcel_gljsxd.do?"+param;
}

function getMonthList(){
	
}

function selYearList(_id){
	$('#'+_id).combotree({
        multiple:false,
        panelHeight:100,  
        panelWidth:80,
        url: '/jxzhpt/gcbb/selYearList.do',
        onCheck: function(node){
        	$("#"+_id).val($('#'+_id).combotree('getValues'));
    	}
	});
	$('#'+_id).combotree("setValue","2015");
}
