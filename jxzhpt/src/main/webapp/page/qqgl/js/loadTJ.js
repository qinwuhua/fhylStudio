function tsdq(id){
			$("#"+id).combobox({    
			    url: '/jxzhpt/xmjzbb/settsdq1.do?xzqh='+$.cookie("dist"),
			    valueField:'id',    
			    textField:'text'   
			})
			$("#"+id).combobox('setValue','全部');
	}
function tsdq1(id,value){
	$("#"+id).combotree({   
		checkbox : true,
		multiple:true,
		async:false,
	    url: '/jxzhpt/xmjzbb/settsdq.do?xzqh='+$.cookie("dist"),
	})
	if(value!=''){
		$("#"+id).combotree('setValue',value);
	}
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
//浮点数减法
function accSub(arg1,arg2){
	　　 var r1,r2,m,n;
	　　 try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
	　　 try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
	　　 m=Math.pow(10,Math.max(r1,r2));
	　　 //last modify by deeka
	　　 //动态控制精度长度
	　　 n=(r1>=r2)?r1:r2;
	　　 return ((arg1*m-arg2*m)/m).toFixed(n);
	}

function loadDist3(id, dwbm,yhdw) {
	$('#' + id)
			.combotree(
					{
						checkbox : true,
						url : '/jxzhpt/gcgl/selAllXzqh1.do?yhdw=' + yhdw,
						onBeforeExpand : function(node, param) {
							$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="
									+ node.id;
						},
						onSelect : function(node) {
							YMLib.Var.DistName = node.text;
						}
					});
	$('#' + id).combotree('setValue', dwbm);
}
function loadUnit3(id, dwbm,yhdw) {
	$('#' + id).combotree({
		checkbox : false,
		url : '/jxzhpt/gcgl/selAllUnit1.do?yhdw=' + yhdw,
		onBeforeExpand : function(node, param) {
			$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllBm2.do?yhdw="
					+ node.id;
		},
		onSelect : function(node) {
			YMLib.Var.DistName = node.text
		}
	});
	$('#' + id).combotree('setValue', dwbm);
}
function checkSZ(str){
	
	var g = /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)|(^[1-9][0-9]*.[0-9]*$)/;
	if(str.value==''){
		return;
	}
    if( !g.test(str.value)){
    	alert("请输入正确的数字");
    	$(str).val('');
    	return;
    }
}
function openLsjl(xmbm){
	YMLib.Var.xmbm=xmbm;
	YMLib.UI.createWindow('lsjl','历史记录','/jxzhpt/page/qqgl/jhsh/lsjl.jsp','lsjl',980,380);
}